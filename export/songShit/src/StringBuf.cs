
#pragma warning disable 109, 114, 219, 429, 168, 162
public class StringBuf : global::haxe.lang.HxObject {
	
	public StringBuf(global::haxe.lang.EmptyObject empty) {
	}
	
	
	public StringBuf() {
		global::StringBuf.__hx_ctor__StringBuf(this);
	}
	
	
	protected static void __hx_ctor__StringBuf(global::StringBuf __hx_this) {
		__hx_this.b = new global::System.Text.StringBuilder();
	}
	
	
	public global::System.Text.StringBuilder b;
	
	public virtual void addChar(int c) {
		unchecked {
			if (( c >= 65536 )) {
				this.b.Append(((char) (( (( c >> 10 )) + 55232 )) ));
				this.b.Append(((char) (( (( c & 1023 )) + 56320 )) ));
			}
			else {
				this.b.Append(((char) (c) ));
			}
			
		}
	}
	
	
	public override object __hx_setField(string field, int hash, object @value, bool handleProperties) {
		unchecked {
			switch (hash) {
				case 98:
				{
					this.b = ((global::System.Text.StringBuilder) (@value) );
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
				case 2113708439:
				{
					return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "addChar", 2113708439)) );
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
				case 2113708439:
				{
					this.addChar(((int) (global::haxe.lang.Runtime.toInt(dynargs[0])) ));
					break;
				}
				
				
				default:
				{
					return base.__hx_invokeField(field, hash, dynargs);
				}
				
			}
			
			return null;
		}
	}
	
	
	public override void __hx_getFields(global::Array<string> baseArr) {
		baseArr.push("b");
		base.__hx_getFields(baseArr);
	}
	
	
}


