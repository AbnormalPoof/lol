
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public class Encoding : global::haxe.lang.Enum {
		
		protected Encoding(int index) : base(index) {
		}
		
		
		public static readonly global::haxe.io.Encoding UTF8 = new global::haxe.io.Encoding_UTF8();
		
		public static readonly global::haxe.io.Encoding RawNative = new global::haxe.io.Encoding_RawNative();
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Encoding_UTF8 : global::haxe.io.Encoding {
		
		public Encoding_UTF8() : base(0) {
		}
		
		
		public override string getTag() {
			return "UTF8";
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Encoding_RawNative : global::haxe.io.Encoding {
		
		public Encoding_RawNative() : base(1) {
		}
		
		
		public override string getTag() {
			return "RawNative";
		}
		
		
	}
}


