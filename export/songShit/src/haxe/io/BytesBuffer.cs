
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public class BytesBuffer : global::haxe.lang.HxObject {
		
		public BytesBuffer(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public BytesBuffer() {
			global::haxe.io.BytesBuffer.__hx_ctor_haxe_io_BytesBuffer(this);
		}
		
		
		protected static void __hx_ctor_haxe_io_BytesBuffer(global::haxe.io.BytesBuffer __hx_this) {
			__hx_this.b = new global::System.IO.MemoryStream();
		}
		
		
		public global::System.IO.MemoryStream b;
		
		public virtual global::haxe.io.Bytes getBytes() {
			byte[] buf = this.b.GetBuffer();
			global::haxe.io.Bytes bytes = new global::haxe.io.Bytes(((int) (( this.b as global::System.IO.Stream ).Length) ), ((byte[]) (buf) ));
			this.b = null;
			return bytes;
		}
		
		
		public override object __hx_setField(string field, int hash, object @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 98:
					{
						this.b = ((global::System.IO.MemoryStream) (@value) );
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
					case 493819893:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "getBytes", 493819893)) );
					}
					
					
					case 98:
					{
						return this.b;
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_invokeField(string field, int hash, object[] dynargs) {
			unchecked {
				switch (hash) {
					case 493819893:
					{
						return this.getBytes();
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
			base.__hx_getFields(baseArr);
		}
		
		
	}
}


