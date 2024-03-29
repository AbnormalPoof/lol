
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public class Error : global::haxe.lang.Enum {
		
		protected Error(int index) : base(index) {
		}
		
		
		public static readonly global::haxe.io.Error Blocked = new global::haxe.io.Error_Blocked();
		
		public static readonly global::haxe.io.Error Overflow = new global::haxe.io.Error_Overflow();
		
		public static readonly global::haxe.io.Error OutsideBounds = new global::haxe.io.Error_OutsideBounds();
		
		public static global::haxe.io.Error Custom(object e) {
			return new global::haxe.io.Error_Custom(e);
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Error_Blocked : global::haxe.io.Error {
		
		public Error_Blocked() : base(0) {
		}
		
		
		public override string getTag() {
			return "Blocked";
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Error_Overflow : global::haxe.io.Error {
		
		public Error_Overflow() : base(1) {
		}
		
		
		public override string getTag() {
			return "Overflow";
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Error_OutsideBounds : global::haxe.io.Error {
		
		public Error_OutsideBounds() : base(2) {
		}
		
		
		public override string getTag() {
			return "OutsideBounds";
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public sealed class Error_Custom : global::haxe.io.Error {
		
		public Error_Custom(object e) : base(3) {
			this.e = e;
		}
		
		
		public override global::Array<object> getParams() {
			return new global::Array<object>(new object[]{this.e});
		}
		
		
		public override string getTag() {
			return "Custom";
		}
		
		
		public override int GetHashCode() {
			unchecked {
				return global::haxe.lang.Enum.paramsGetHashCode(3, new object[]{this.e});
			}
		}
		
		
		public override bool Equals(object other) {
			if (global::System.Object.ReferenceEquals(((object) (this) ), ((object) (other) ))) {
				return true;
			}
			
			global::haxe.io.Error_Custom en = ( other as global::haxe.io.Error_Custom );
			if (( en == null )) {
				return false;
			}
			
			if ( ! (global::Type.enumEq<object>(((object) (this.e) ), ((object) (en.e) ))) ) {
				return false;
			}
			
			return true;
		}
		
		
		public override string toString() {
			return global::haxe.lang.Enum.paramsToString("Custom", new object[]{this.e});
		}
		
		
		public readonly object e;
		
	}
}


