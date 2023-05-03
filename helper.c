/*
 * SVPatch: SynthV Patch Helper 1.0
 *
 * Copyright (C) 2023 Xi Jinpwned Software
 *
 * This software is made available to you under the terms of the GNU Affero
 * General Public License version 3.0. For more information, see the included
 * LICENSE.txt file.
 */

#if !defined(WIN32) && !defined(_WIN32)
#define _GNU_SOURCE
#endif

#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>

#include "helper.h"

/* Enables debug output via OutputDebugStringW on Windows */
#undef DEBUG

typedef signed char int8;
typedef unsigned char uint8;

static _Noreturn void die();

#define SIG0 0x9a79e715
#define SIG1 0x1741776d
#define SIG2 0x5eba54e1
#define SIG3 0xdc747c38

#define SIG62 0x8a9ae39a
#define SIG63 0xc461aca5

#define FAIL_SIG0 0x61656c50
#define FAIL_SIG1 0x65206573
#define FAIL_SIG2 0x7265746e
#define FAIL_SIG3 0x32206120

static bool searchAndDestroy();

static uint8 newPubKey[256];

static uint8 hatoi8(char c) {
  if (c >= '0' && c <= '9')
    return c - '0';

  if (c >= 'a' && c <= 'f')
    return c - 'a' + 10;

  if (c >= 'A' && c <= 'F')
    return c - 'A' + 10;

  die();
}

static bool initPubKey() {
  const char* newPubKeyStr = getenv("SVPATCH_PUBKEY");
  if (!newPubKeyStr) return false;

  /* Skip public exponent if present */
  const char* start = strchr(newPubKeyStr, ',');
  if (!start) {
    start = newPubKeyStr;
  } else {
    if (strncmp(newPubKeyStr, "10001,", 6) != 0) {
      return false;
    }
    start++;
  }

  int len = strlen(start);
  if (len != 512) {
    return false;
  }

  /* This weird loop ensures we store the data in little endian order */
  for (int i = 0, j = 255; i < 256 && j >= 0; i++, j--) {
    newPubKey[j] = hatoi8(start[i * 2 + 1]) | (hatoi8(start[i * 2]) << 4);
  }

  return true;
}

static bool once(bool (*func)(), volatile bool* flag) {
  if (!*flag) {
    *flag = func();
  }
  return *flag;
}

static bool many(bool (*func)(), volatile bool* flag, volatile int* count) {
  if (*count > 0) {
    *count = *count - 1;
    *flag = func();
  }

  return *flag;
}

static bool initPubKeyOnce = false;
static bool replacePubKeyOnce = false;

#if defined(_WIN32) || defined(WIN32)
#include <windows.h>
#include <wininet.h>
#include <shlobj.h>
#include <wchar.h>
#include "minhook/include/MinHook.h"

typedef INT16  int16;
typedef INT32  int32;
typedef INT64  int64;
typedef UINT16 uint16;
typedef UINT32 uint32;
typedef UINT64 uint64;

static int replaceCount = 5;

static LPCWSTR detourDir;
static bool initHooksOnce = false;
static bool initSpecialHooksOnce = false;
static bool useSearchAndDestroyLegacy = false;

static LPCWSTR lifeCycle = L"UNKNOWN";
static void setLifeCycle(LPCWSTR newLifeCycle) {
  if (!newLifeCycle) die();
  lifeCycle = newLifeCycle;
}

static bool inDllMain = false;

static DWORD injectTime = 0;
static DWORD failTime = 0;

static _Noreturn void die() {
  static WCHAR buffer[1024];
  DWORD lastError = GetLastError();
  LPCWSTR extraError = L"None";

  OSVERSIONINFOEXW osInfo = {};
  NTSTATUS (WINAPI *RtlGetVersion)(LPOSVERSIONINFOEXW) = NULL;

  if (!inDllMain) {
    RtlGetVersion = (NTSTATUS(*)(LPOSVERSIONINFOEXW))
                    GetProcAddress(GetModuleHandleA("ntdll"), "RtlGetVersion");
  }

  if (RtlGetVersion == NULL) {
    extraError = L"SVPATCH_NO_RTLGETVERSION";
  } else {
    if (RtlGetVersion(&osInfo) != 0) {
      extraError = L"SVPATCH_RTLGETVERSION_FAIL";
    }
  }

  if (failTime == 0) failTime = GetTickCount();

  swprintf(buffer, sizeof(buffer) / sizeof(WCHAR),
                   L"An internal error has occurred during initialization.\r\n"
                    "\r\n"
                    "Please include the following information in your bug "
                    "report:\r\n"
                    "GetLastError() = 0x%08x\r\n"
                    "lifeCycle = \"%S\"\r\n"
                    "Additional Error: %S\r\n"
                    "Version: " VERSION "\r\n"
                    "Launcher Version: %S\r\n"
                    "Windows Version: %d.%d\r\n"
                    "Time Since Inject: %lu",
                    GetLastError(), lifeCycle, extraError,
                    _wgetenv(L"SVKEY_VERSION"),
                    osInfo.dwMajorVersion, osInfo.dwMinorVersion,
                    failTime - injectTime);

  MessageBoxW(NULL, buffer, L"SVPatch Helper", MB_OK | MB_ICONERROR |
                                               MB_SETFOREGROUND);

  TerminateProcess(GetCurrentProcess(), 253);
  abort();
}

void showPatchFailMsg() {
  failTime = GetTickCount();

  MessageBoxW(NULL,
              L"Failed to patch public RSA key. The application will now "
               "terminate.\r\n\r\n"
               "You should see an activation code prompt from SynthV Studio. "
               "If you do not, then this message is wrong and you should "
               "report this. ",
              L"SVPatch Helper",
              MB_OK | MB_ICONERROR | MB_SETFOREGROUND);
}

static bool searchAndDestroyLegacy() {
  static uint8 buf[0x4000000];
  static bool lock = false;

  while (lock) Sleep(1);
  lock = true;

  HANDLE thisProc = GetCurrentProcess();
  SYSTEM_INFO si;
  GetSystemInfo(&si);

  MEMORY_BASIC_INFORMATION mbi;
  void* curAddr = si.lpMinimumApplicationAddress;
  void* maxAddr = si.lpMaximumApplicationAddress;

  DWORD scanTime = GetTickCount();

  while (curAddr < maxAddr) {
    if (VirtualQueryEx(thisProc, curAddr, &mbi, sizeof(mbi)) != sizeof(mbi)) {
      lock = false;
      return false;
    }

    if (mbi.State != MEM_COMMIT || !(mbi.Protect & PAGE_READWRITE) ||
        mbi.Type != MEM_PRIVATE ||  (mbi.Protect & PAGE_EXECUTE)) {
      curAddr += mbi.RegionSize;
      continue;
    }

    /* Don't scan our own private memory */
    if (curAddr <= (void*)buf &&
       (curAddr + mbi.RegionSize) >= ((void*)buf + sizeof(buf))) {
      curAddr += mbi.RegionSize;
      continue;
    }

#ifdef DEBUG
    WCHAR msg[256];
    swprintf(msg, 256, L"SVPatch: @ %p [%llu]", curAddr, mbi.RegionSize);
    OutputDebugStringW(msg);
#endif

    if (mbi.RegionSize > sizeof(buf)) {
#ifdef DEBUG
      OutputDebugStringW(L"SVPatch: memory region too large!");
#endif
      WCHAR assertMsg[256];
      swprintf(assertMsg, 256, L"Assertion failed!\r\n"
                                "Expected %llu <= %llu but this was not the"
                                "case. This situation should not be possible.",
                                mbi.RegionSize, sizeof(buf));

      MessageBoxW(NULL, assertMsg, L"SVPatch Helper", MB_OK | MB_ICONERROR);
      return false;
    }

    size_t n = 0;
    ReadProcessMemory(thisProc, curAddr, buf, mbi.RegionSize, &n);
    if (n < 0x100) {
      curAddr += mbi.RegionSize;
      continue;
    }

    for (size_t i = 0; i <= n - 0x100; i += 4) {
      uint32* u = (uint32*)&buf[i];

      if (u[0] == SIG0 && u[1] == SIG1 && u[2] == SIG2 && u[3] == SIG3) {
#ifdef DEBUG
        WCHAR msg[256];
        swprintf(msg, 256, L"SVPatch: found original RSA key at %p",
                           curAddr + i);
        OutputDebugStringW(msg);
#endif

        size_t n2 = 0;
        if (!WriteProcessMemory(thisProc, curAddr + i,
                                newPubKey, sizeof(newPubKey), &n2)) {
          lock = false;
          return false;
        }

        if (n2 != sizeof(newPubKey)) {
          lock = false;
          return false;
        }

        lock = false;
        return true;
      }

#if 0
      if (u[0] == FAIL_SIG0 && u[1] == FAIL_SIG1 && u[2] == FAIL_SIG2 &&
         (scanTime - injectTime) > 5000) {
        lock = false;
        return false;
      }
#endif
    }

    curAddr += mbi.RegionSize;
  }

#ifdef DEBUG
  OutputDebugStringW(L"SVPatch: original RSA key not found, assuming patched");
#endif
  lock = false;
  return true;
}

static bool searchAndDestroy() {
  if (useSearchAndDestroyLegacy) {
    return searchAndDestroyLegacy();
  }

  DWORD scanTime = GetTickCount();

  LPVOID heapBase = (LPVOID)GetProcessHeap();
  if (!heapBase) {
    die(); /* This can't happen */
  }

#ifdef HEAP_DEBUG
  WCHAR msg[256];
  swprintf(msg, 256, L"SVPatch: base of heap @ %p", heapBase);
  OutputDebugStringW(msg);
#endif

  MEMORY_BASIC_INFORMATION mbi;
  if (!VirtualQuery(heapBase, &mbi, sizeof(mbi))) {
    return false;
  }

#ifdef HEAP_DEBUG
  swprintf(msg, 256, L"SVPatch: size of heap: %llu", mbi.RegionSize);
  OutputDebugStringW(msg);
#endif

  if (mbi.State != MEM_COMMIT || !(mbi.Protect & PAGE_READWRITE) ||
      mbi.Type != MEM_PRIVATE ||  (mbi.Protect & PAGE_EXECUTE)) {
    return false;
  }

  HANDLE thisProc = GetCurrentProcess();
  uint8* heapData = heapBase;
  size_t heapSize = mbi.AllocationBase + mbi.RegionSize - heapBase;

#define SLOW_READ_PROCESS_MEMORY /* Some people still have stack
                                    corruption and access violations */

#ifndef NO_WORK_BACKWARDS
  for (size_t i = 0x20; i < heapSize - 0x100; i += 4) {
#else
  for (size_t i = heapSize - 0x100; i > 0x20; i -= 4) {
#endif
#ifdef SLOW_READ_PROCESS_MEMORY
    uint32 u[4];
    size_t n;
    if (!ReadProcessMemory(thisProc, &heapData[i], u, sizeof(u), &n))
      continue;
    if (n != sizeof(u)) continue;
#else
    uint32* u = (uint32*)&heapData[i];
#endif

    if (u[0] == SIG0 && u[1] == SIG1 && u[2] == SIG2 && u[3] == SIG3) {
#ifdef DEBUG
      WCHAR msg[256];
      swprintf(msg, 256, L"SVPatch: found original RSA key @ %p", u);
      OutputDebugStringW(msg);
#endif

      memcpy(&heapData[i], newPubKey, sizeof(newPubKey));
      return true;
    }

#if 0
    if (u[0] == FAIL_SIG0 && u[1] == FAIL_SIG1 && u[2] == FAIL_SIG2 &&
       (scanTime - injectTime) > 5000) {
      return false;
    }
#endif
  }

  return true;
}

DWORD searchAndDestroyThread(LPVOID unused) {
  (void)unused;

  while (1) {
    if (!searchAndDestroy()) {
      showPatchFailMsg();
      setLifeCycle(L"SVPATCH_THR_SEARCH_AND_DESTROY");
      die();
    }

    Sleep(2500);
  }

  return 0;
}

typedef WINAPI HANDLE (*api_CreateFileW)(
        LPCWSTR, DWORD, DWORD, LPSECURITY_ATTRIBUTES, DWORD, DWORD, HANDLE);

static api_CreateFileW orig_CreateFileW;

static WINAPI HANDLE hook_CreateFileW(
       LPCWSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode,
       LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition,
       DWORD dwFlagsAndAttributes, HANDLE hTemplateFile) {

  if (lpFileName && wcsstr(lpFileName, L"license.bin")) {
    setLifeCycle(L"SVPATCH_SEARCH_AND_DESTROY");
    if (!many(searchAndDestroy, &replacePubKeyOnce, &replaceCount)) {
      showPatchFailMsg();
      die();
    }
  }

  return orig_CreateFileW(lpFileName, dwDesiredAccess, dwShareMode,
                          lpSecurityAttributes, dwCreationDisposition,
                          dwFlagsAndAttributes, hTemplateFile);
}

typedef WINAPI HRESULT (*api_SHGetKnownFolderPath)(
        REFKNOWNFOLDERID, DWORD, HANDLE, PWSTR*);

static api_SHGetKnownFolderPath orig_SHGetKnownFolderPath;

static WINAPI HRESULT hook_SHGetKnownFolderPath(
       REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PWSTR *ppszPath) {
  KNOWNFOLDERID docFolder = FOLDERID_Documents;

  if (rfid && IsEqualGUID(rfid, &docFolder)) {
    *ppszPath = CoTaskMemAlloc((wcslen(detourDir) + 1) * 2);
    wcscpy(*ppszPath, detourDir);
    return S_OK;
  }

  return orig_SHGetKnownFolderPath(rfid, dwFlags, hToken, ppszPath);
}

typedef WINAPI BOOL (*api_SHGetSpecialFolderPathW)(HWND, LPWSTR, int, BOOL);

static api_SHGetSpecialFolderPathW orig_SHGetSpecialFolderPathW;

static WINAPI BOOL hook_SHGetSpecialFolderPathW(
        HWND hwnd, LPWSTR pszPath, int csidl, BOOL fCreate) {
  setLifeCycle(L"SVPATCH_SHGET_SEARCH_AND_DESTROY");
  if (!searchAndDestroy()) {
    showPatchFailMsg();
    die();
  }

  if (csidl == CSIDL_PERSONAL) {
    wcscpy(pszPath, detourDir);
    return TRUE;
  }

  return orig_SHGetSpecialFolderPathW(hwnd, pszPath, csidl, fCreate);
}

static LPVOID orig_InternetOpenA, orig_InternetOpenW;

static WINAPI HRESULT hook_InternetOpen() {
  setLifeCycle(L"SVPATCH_IO_SEARCH_AND_DESTROY");
  if (!searchAndDestroy()) {
    showPatchFailMsg();
    die();
  }

  SetLastError(ERROR_NETWORK_BUSY);
  return 0;
}

typedef WINAPI BOOL (*api_GetVolumeInformationW)(
        LPCWSTR, LPWSTR, DWORD, LPDWORD, LPDWORD, LPDWORD, LPWSTR, DWORD);

static api_GetVolumeInformationW orig_GetVolumeInformationW;

static WINAPI BOOL hook_GetVolumeInformationW(LPCWSTR lpRootPathName,
       LPWSTR lpVolumeNameBuffer, DWORD nVolumeNameSize,
       LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength,
       LPDWORD lpFileSystemFlags, LPWSTR lpFileSystemNameBuffer,
       DWORD nFileSystemNameSize) {

  setLifeCycle(L"SVPATCH_VINFO_SEARCH_AND_DESTROY");
  if (!searchAndDestroy()) {
    showPatchFailMsg();
    die();
  }

  return orig_GetVolumeInformationW(lpRootPathName,
         lpVolumeNameBuffer, nVolumeNameSize,
         lpVolumeSerialNumber, lpMaximumComponentLength,
         lpFileSystemFlags, lpFileSystemNameBuffer,
         nFileSystemNameSize);
}

typedef WINAPI LRESULT (*api_DispatchMessageW)(LPMSG);

static api_DispatchMessageW orig_DispatchMessageW;

static WINAPI LRESULT hook_DispatchMessageW(LPMSG lpMsg) {
  if (lpMsg->message == WM_DROPFILES) {
    HDROP hDrop = (HDROP) lpMsg->wParam;
    WCHAR filePath[MAX_PATH] = {0};

    die();

    if (!DragQueryFileW(hDrop, 0, filePath, MAX_PATH)) {
      die();
      goto dispatch;
    }

#ifdef DEBUG
    WCHAR msg[256];
    swprintf(msg, 256, L"SVPatch: drag-and-drop file: %S", filePath);
    OutputDebugStringW(msg);
#endif

    int len = 0;
    if ((len = wcslen(filePath)) < 5 ||
         wcscmp(filePath + len - 5, L".svpk") != 0) {
      goto dispatch;
    }

    DragFinish(hDrop);

    if (MessageBoxW(NULL, L"SynthV Studio will be closed in order to install "
                           "your package.", L"SVPatch Helper",
                           MB_OKCANCEL | MB_ICONINFORMATION) != IDOK) {
      goto skip;
    }

    LPCWSTR svKeyExe = _wgetenv(L"SVKEY_EXE");
    if (!svKeyExe) {
      MessageBoxW(NULL, L"Cannot locate SVKey executable for installation.",
                        L"SVPatch Helper", MB_OK | MB_ICONERROR);
      goto skip;
    }

    int ret = -1;
    if ((ret = _wspawnl(_P_NOWAIT, svKeyExe, L"svpk", filePath, NULL)) == -1) {
      MessageBoxW(NULL, L"Failed to start SVKey.",
                        L"SVPatch Helper", MB_OK | MB_ICONERROR);
      goto skip;
    }

    lpMsg->wParam = lpMsg->lParam = 0;
    lpMsg->message = WM_CLOSE;

    goto dispatch;
  }

dispatch:
  return orig_DispatchMessageW(lpMsg);

skip:
  return 0;
}

static bool initHooks() {
  if (MH_Initialize() != MH_OK) return false;

  if (MH_CreateHook(&CreateFileW,
                    &hook_CreateFileW, (LPVOID*)&orig_CreateFileW) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&CreateFileW) != MH_OK) return false;

  if (MH_CreateHook(&SHGetKnownFolderPath,
                    &hook_SHGetKnownFolderPath,
                    (LPVOID*)&orig_SHGetKnownFolderPath) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&SHGetKnownFolderPath) != MH_OK) return false;

  if (MH_CreateHook(&SHGetSpecialFolderPathW,
                    &hook_SHGetSpecialFolderPathW,
                    (LPVOID*)&orig_SHGetSpecialFolderPathW) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&SHGetSpecialFolderPathW) != MH_OK) return false;


  if (MH_CreateHook(&InternetOpenA,
                    &hook_InternetOpen, &orig_InternetOpenA) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&InternetOpenA) != MH_OK) return false;

  if (MH_CreateHook(&InternetOpenW,
                    &hook_InternetOpen, &orig_InternetOpenW) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&InternetOpenW) != MH_OK) return false;

  if (MH_CreateHook(&GetVolumeInformationW,
                    &hook_GetVolumeInformationW,
                    (LPVOID*)&orig_GetVolumeInformationW) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&GetVolumeInformationW) != MH_OK) return false;

#if 0 /* Broken */
  if (MH_CreateHook(&DispatchMessageW,
                    &hook_DispatchMessageW,
                    (LPVOID*)&orig_DispatchMessageW) != MH_OK) {
    return false;
  }
  if (MH_EnableHook(&DispatchMessageW) != MH_OK) return false;
#endif

  return true;
}

__declspec(dllexport) BOOL WINAPI DllMain(
                      HINSTANCE thisDll, DWORD reason, LPVOID reserved) {
  (void)reserved;

  if (reason == DLL_PROCESS_ATTACH) {
#ifdef DEBUG
    OutputDebugStringW(L"SVPatch: initializing...");
#endif

    inDllMain = true;
    injectTime = GetTickCount();

    const char* sNDLegacy = getenv("SVPATCH_LEGACY_SEARCH");
    if (sNDLegacy && atoi(sNDLegacy)) {
      useSearchAndDestroyLegacy = true;
    }

    setLifeCycle(L"SVPATCH_GET_DETOUR_DIR");
    detourDir = _wgetenv(L"SVPATCH_DETOUR_DIR");
    if (!detourDir) {
      die();
    }

    setLifeCycle(L"SVPATCH_PARSE_NEW_PUBKEY");
    if (!once(initPubKey, &initPubKeyOnce)) {
      die();
    }

    setLifeCycle(L"SVPATCH_INIT_HOOKS");
    if (!once(initHooks, &initHooksOnce)) {
      die();
    }

#if 0
    setLifeCycle(L"SVPATCH_INIT_THR_SEARCH_AND_DESTROY");
    if (!CreateThread(NULL, 0, searchAndDestroyThread, NULL, 0, NULL)) {
      die();
    }
#endif

    inDllMain = false;

#ifdef DEBUG
    OutputDebugStringW(L"SVPatch: ready");
#endif
  }

  return TRUE;
}

#else
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <dlfcn.h>
#include <errno.h>

typedef int16_t  int16;
typedef int32_t  int32;
typedef int64_t  int64;
typedef uint16_t uint16;
typedef uint32_t uint32;
typedef uint64_t uint64;

static const char* lifeCycle = "UNKNOWN";
static void setLifeCycle(const char* newLifeCycle) {
  if (!newLifeCycle) die();
  lifeCycle = newLifeCycle;
}

static void _Noreturn die() {
  int err = errno;

  fprintf(stderr, "SVPatch Helper failed to initialize properly.\n");
  fprintf(stderr, "\nPlease include the following information in your bug "
                  "report:\n"
                  "errno = %d (%s)\n"
                  "uname -srvmo: ", err, strerror(err));
  system("uname -srvmo");
  fprintf(stderr, "lifeCycle = \"%s\"\n", lifeCycle);
  fprintf(stderr, "Version: " VERSION "\n"
                  "Launcher Version: %s\n", getenv("SVKEY_VERSION"));

  _exit(253);
  abort();
}

static bool searchAndDestroy() {
  FILE *fp = fopen("/proc/self/maps", "r");
  if (!fp) die();

  char buf[256], *s;
  while ((s = fgets(buf, sizeof(buf), fp)) != NULL) {
    uint64 base, top;
    char mode[8];

    if (sscanf(s, "%lx-%lx %s", &base, &top, mode) != 3) {
      die();
    }

    if (strcmp(mode, "rw-p") != 0) {
      continue;
    }

    for (void *p = (void*)base; p < (void*)top - 0x100; p += 4) {
      uint32* u = (uint32*)p;

      if (u[0] == SIG0 && u[1] == SIG1 && u[2] == SIG2 && u[3] == SIG3) {
        memcpy(p, newPubKey, sizeof(newPubKey));

        fclose(fp);
        return true;
      }
    }
  }

  /* Since we hook memcpy now, there's no reason to fail if the key can't be
     found. */
  fclose(fp);
  return true;
}

int curl_easy_setopt() {
  return 0;
}

void *memcpy(void *dest, const void *src, size_t len){
  const uint32* u = src;

  if (len == sizeof(newPubKey) &&
      u[0] == SIG0 && u[1] == SIG1 && u[2] == SIG2 && u[3] == SIG3) {
    setLifeCycle("SVPATCH_PARSE_NEW_PUBKEY");
    if (!once(initPubKey, &initPubKeyOnce)) die();

    src = newPubKey;
  }

  uint8* dst_ = dst;
  const uint8 *src_ = src;
  for (size_t i = 0; i < len; i++) {
    dst_[i] = src_[i];
  }

  return dst;
}

static int (*orig_open)(const char*, int, mode_t);
int open(const char* pathname, int flags, mode_t mode) {
  if (!orig_open) {
    setLifeCycle("SVPATCH_INIT_HOOKS");

    orig_open = dlsym(RTLD_NEXT, "open");
    if (!orig_open) {
      die();
    }
  }

  if (pathname && strstr(pathname, "license.bin")) {
    static bool lock = false;
    while (lock);

    lock = true;

    setLifeCycle("SVPATCH_PARSE_NEW_PUBKEY");
    if (!once(initPubKey, &initPubKeyOnce)) {
      die();
    }

    setLifeCycle("SVPATCH_SEARCH_AND_DESTROY");
    if (!once(searchAndDestroy, &replacePubKeyOnce)) {
      die();
    }

    lock = false;
  }

  return orig_open(pathname, flags, mode);
}

#endif
