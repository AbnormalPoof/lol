
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe {
	public class Log : global::haxe.lang.HxObject {
		
		static Log() {
			global::haxe.Log.trace = ( (( global::haxe.Log_Anon_62__Fun.__hx_current != null )) ? (global::haxe.Log_Anon_62__Fun.__hx_current) : (global::haxe.Log_Anon_62__Fun.__hx_current = ((global::haxe.Log_Anon_62__Fun) (new global::haxe.Log_Anon_62__Fun()) )) );
		}
		
		
		public Log(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public Log() {
			global::haxe.Log.__hx_ctor_haxe_Log(this);
		}
		
		
		protected static void __hx_ctor_haxe_Log(global::haxe.Log __hx_this) {
		}
		
		
		public static string formatOutput(object v, object infos) {
			string str = global::Std.@string(v);
			if (( infos == null )) {
				return str;
			}
			
			string pstr = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.getField(infos, "fileName", 1648581351, true)), ":"), global::haxe.lang.Runtime.toString(((int) (global::haxe.lang.Runtime.getField_f(infos, "lineNumber", 1981972957, true)) )));
			if (( ((global::Array) (global::haxe.lang.Runtime.getField(infos, "customParams", 1830310359, true)) ) != null )) {
				int _g = 0;
				global::Array _g1 = ((global::Array) (global::haxe.lang.Runtime.getField(infos, "customParams", 1830310359, true)) );
				while (( _g < ((int) (global::haxe.lang.Runtime.getField_f(_g1, "length", 520590566, true)) ) )) {
					object v1 = _g1[_g];
					 ++ _g;
					str = global::haxe.lang.Runtime.concat(str, global::haxe.lang.Runtime.concat(", ", global::Std.@string(v1)));
				}
				
			}
			
			return global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(pstr, ": "), str);
		}
		
		
		public static global::haxe.lang.Function trace;
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe {
	public class Log_Anon_62__Fun : global::haxe.lang.Function {
		
		public Log_Anon_62__Fun() : base(2, 0) {
		}
		
		
		public static global::haxe.Log_Anon_62__Fun __hx_current;
		
		public override object __hx_invoke2_o(double __fn_float1, object __fn_dyn1, double __fn_float2, object __fn_dyn2) {
			object infos = ( (( __fn_dyn2 == global::haxe.lang.Runtime.undefined )) ? (((object) (__fn_float2) )) : (( (( __fn_dyn2 == null )) ? (null) : (((object) (__fn_dyn2) )) )) );
			object v = ( (( __fn_dyn1 == global::haxe.lang.Runtime.undefined )) ? (((object) (__fn_float1) )) : (((object) (__fn_dyn1) )) );
			string str = global::haxe.Log.formatOutput(v, infos);
			global::System.Console.WriteLine(((object) (str) ));
			return null;
		}
		
		
	}
}


