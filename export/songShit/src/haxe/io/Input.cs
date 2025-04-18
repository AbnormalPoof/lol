
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.io {
	public class Input : global::haxe.lang.HxObject {
		
		public Input(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public Input() {
			global::haxe.io.Input.__hx_ctor_haxe_io_Input(this);
		}
		
		
		protected static void __hx_ctor_haxe_io_Input(global::haxe.io.Input __hx_this) {
		}
		
		
		public virtual int readByte() {
			unchecked {
				throw new global::haxe.exceptions.NotImplementedException(default(string), default(global::haxe.Exception), ((object) (new global::haxe.lang.DynamicObject(new int[]{302979532, 1547539107, 1648581351}, new object[]{"readByte", "haxe.io.Input", "haxe/io/Input.hx"}, new int[]{1981972957}, new double[]{((double) (53) )})) ));
			}
		}
		
		
		public virtual int readBytes(global::haxe.io.Bytes s, int pos, int len) {
			int k = len;
			byte[] b = s.b;
			if (( ( ( pos < 0 ) || ( len < 0 ) ) || ( ( pos + len ) > s.length ) )) {
				throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.io.Error.OutsideBounds)) );
			}
			
			try {
				while (( k > 0 )) {
					b[pos] = ((byte) (this.readByte()) );
					 ++ pos;
					 -- k;
				}
				
			}
			catch (global::System.Exception _g){
				if (( ((object) (global::haxe.Exception.caught(_g).unwrap()) ) is global::haxe.io.Eof )) {
				}
				else {
					throw;
				}
				
			}
			
			
			return ( len - k );
		}
		
		
		public virtual global::haxe.io.Bytes readAll(global::haxe.lang.Null<int> bufsize) {
			unchecked {
				if ( ! (bufsize.hasValue) ) {
					bufsize = new global::haxe.lang.Null<int>(16384, true);
				}
				
				global::haxe.io.Bytes buf = global::haxe.io.Bytes.alloc((bufsize).@value);
				global::haxe.io.BytesBuffer total = new global::haxe.io.BytesBuffer();
				try {
					while (true) {
						int len = this.readBytes(buf, 0, (bufsize).@value);
						if (( len == 0 )) {
							throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.io.Error.Blocked)) );
						}
						
						{
							if (( ( len < 0 ) || ( len > buf.length ) )) {
								throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.io.Error.OutsideBounds)) );
							}
							
							( total.b as global::System.IO.Stream ).Write(((byte[]) (buf.b) ), ((int) (0) ), ((int) (len) ));
						}
						
					}
					
				}
				catch (global::System.Exception _g){
					if (( ((object) (global::haxe.Exception.caught(_g).unwrap()) ) is global::haxe.io.Eof )) {
					}
					else {
						throw;
					}
					
				}
				
				
				return total.getBytes();
			}
		}
		
		
		public override object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 46374763:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "readAll", 46374763)) );
					}
					
					
					case 243225909:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "readBytes", 243225909)) );
					}
					
					
					case 1763375486:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "readByte", 1763375486)) );
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
					case 46374763:
					{
						return this.readAll(global::haxe.lang.Null<object>.ofDynamic<int>(( (( dynargs.Length > 0 )) ? (dynargs[0]) : (null) )));
					}
					
					
					case 243225909:
					{
						return this.readBytes(((global::haxe.io.Bytes) (dynargs[0]) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[1])) ), ((int) (global::haxe.lang.Runtime.toInt(dynargs[2])) ));
					}
					
					
					case 1763375486:
					{
						return this.readByte();
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
	}
}


