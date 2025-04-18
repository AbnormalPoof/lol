
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public class Bytes : global::haxe.lang.HxObject {
		
		public Bytes(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public Bytes(int length, byte[] b) {
			global::haxe.io.Bytes.__hx_ctor_haxe_io_Bytes(this, length, b);
		}
		
		
		protected static void __hx_ctor_haxe_io_Bytes(global::haxe.io.Bytes __hx_this, int length, byte[] b) {
			__hx_this.length = length;
			__hx_this.b = b;
		}
		
		
		public static global::haxe.io.Bytes alloc(int length) {
			return new global::haxe.io.Bytes(((int) (length) ), ((byte[]) (new byte[length]) ));
		}
		
		
		public static global::haxe.io.Bytes ofString(string s, global::haxe.io.Encoding encoding) {
			unchecked {
				byte[] b = null;
				if (( encoding == null )) {
					b = global::System.Text.Encoding.UTF8.GetBytes(((string) (s) ));
				}
				else {
					switch (encoding._hx_index) {
						case 0:
						{
							b = global::System.Text.Encoding.UTF8.GetBytes(((string) (s) ));
							break;
						}
						
						
						case 1:
						{
							b = global::System.Text.Encoding.Unicode.GetBytes(((string) (s) ));
							break;
						}
						
						
					}
					
				}
				
				return new global::haxe.io.Bytes(((int) (( b as global::System.Array ).Length) ), ((byte[]) (b) ));
			}
		}
		
		
		public int length;
		
		public byte[] b;
		
		public virtual string toString() {
			return global::System.Text.Encoding.UTF8.GetString(((byte[]) (this.b) ), ((int) (0) ), ((int) (this.length) ));
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 520590566:
					{
						this.length = ((int) (@value) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField_f(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_setField(string field, int hash, object @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 98:
					{
						this.b = ((byte[]) (@value) );
						return @value;
					}
					
					
					case 520590566:
					{
						this.length = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 946786476:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "toString", 946786476)) );
					}
					
					
					case 98:
					{
						return this.b;
					}
					
					
					case 520590566:
					{
						return this.length;
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 520590566:
					{
						return ((double) (this.length) );
					}
					
					
					default:
					{
						return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_invokeField(string field, int hash, object[] dynargs) {
			unchecked {
				switch (hash) {
					case 946786476:
					{
						return this.toString();
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override void __hx_getFields(global::Array<string> baseArr) {
			baseArr.push("b");
			baseArr.push("length");
			base.__hx_getFields(baseArr);
		}
		
		
		public override string ToString(){
			return this.toString();
		}
		
		
	}
}


