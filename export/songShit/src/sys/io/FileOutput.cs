
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace sys.io {
	public class FileOutput : global::cs.io.NativeOutput {
		
		public FileOutput(global::haxe.lang.EmptyObject empty) : base(((global::haxe.lang.EmptyObject) (global::haxe.lang.EmptyObject.EMPTY) )) {
		}
		
		
		public FileOutput(global::System.IO.FileStream stream) : base(((global::haxe.lang.EmptyObject) (global::haxe.lang.EmptyObject.EMPTY) )) {
			global::sys.io.FileOutput.__hx_ctor_sys_io_FileOutput(this, stream);
		}
		
		
		protected static void __hx_ctor_sys_io_FileOutput(global::sys.io.FileOutput __hx_this, global::System.IO.FileStream stream) {
			global::cs.io.NativeOutput.__hx_ctor_cs_io_NativeOutput(__hx_this, stream);
		}
		
		
	}
}


