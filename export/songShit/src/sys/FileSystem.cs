
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace sys {
	public class FileSystem : global::haxe.lang.HxObject {
		
		public FileSystem(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public FileSystem() {
			global::sys.FileSystem.__hx_ctor_sys_FileSystem(this);
		}
		
		
		protected static void __hx_ctor_sys_FileSystem(global::sys.FileSystem __hx_this) {
		}
		
		
		public static bool exists(string path) {
			if ( ! (global::System.IO.File.Exists(((string) (path) ))) ) {
				return global::System.IO.Directory.Exists(((string) (path) ));
			}
			else {
				return true;
			}
			
		}
		
		
		public static bool isDirectory(string path) {
			bool isdir = global::System.IO.Directory.Exists(((string) (path) ));
			if (( isdir != global::System.IO.File.Exists(((string) (path) )) )) {
				return isdir;
			}
			
			throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("Path \'", path), "\' doesn\'t exist"))) );
		}
		
		
		public static void createDirectory(string path) {
			global::System.IO.Directory.CreateDirectory(((string) (path) ));
		}
		
		
		public static global::Array<string> readDirectory(string path) {
			unchecked {
				string[] ret = global::System.IO.Directory.GetFileSystemEntries(((string) (path) ));
				if (( ( ret as global::System.Array ).Length > 0 )) {
					string fst = ((string) (ret[0]) );
					string sep = "/";
					if (( global::haxe.lang.StringExt.lastIndexOf(fst, sep, default(global::haxe.lang.Null<int>)) < global::haxe.lang.StringExt.lastIndexOf(fst, "\\", default(global::haxe.lang.Null<int>)) )) {
						sep = "\\";
					}
					
					{
						int _g = 0;
						int _g1 = ( ret as global::System.Array ).Length;
						while (( _g < _g1 )) {
							int i = _g++;
							string path1 = ((string) (ret[i]) );
							ret[i] = global::haxe.lang.StringExt.substr(path1, ( global::haxe.lang.StringExt.lastIndexOf(path1, sep, default(global::haxe.lang.Null<int>)) + 1 ), default(global::haxe.lang.Null<int>));
						}
						
					}
					
				}
				
				return new global::Array<string>(((string[]) (ret) ));
			}
		}
		
		
	}
}


