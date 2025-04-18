
#pragma warning disable 109, 114, 219, 429, 168, 162
public class Date : global::haxe.lang.HxObject {
	
	public Date(global::haxe.lang.EmptyObject empty) {
	}
	
	
	public Date(global::System.DateTime native) {
		global::Date.__hx_ctor__Date(((global::Date) (this) ), ((global::System.DateTime) (native) ));
	}
	
	
	public Date(int year, int month, int day, int hour, int min, int sec) {
		global::Date.__hx_ctor__Date(((global::Date) (this) ), ((int) (year) ), ((int) (month) ), ((int) (day) ), ((int) (hour) ), ((int) (min) ), ((int) (sec) ));
	}
	
	
	protected static void __hx_ctor__Date(global::Date __hx_this, global::System.DateTime native) {
		if (( native.Kind == global::System.DateTimeKind.Utc )) {
			__hx_this.dateUTC = native;
			__hx_this.date = __hx_this.dateUTC.ToLocalTime();
		}
		else {
			__hx_this.date = native;
			__hx_this.dateUTC = __hx_this.date.ToUniversalTime();
		}
		
	}
	
	
	protected static void __hx_ctor__Date(global::Date __hx_this, int year, int month, int day, int hour, int min, int sec) {
		unchecked {
			if (( day <= 0 )) {
				day = 1;
			}
			
			if (( year <= 0 )) {
				year = 1;
			}
			
			__hx_this.date = new global::System.DateTime(((int) (year) ), ((int) (( month + 1 )) ), ((int) (day) ), ((int) (hour) ), ((int) (min) ), ((int) (sec) ), ((global::System.DateTimeKind) (global::System.DateTimeKind.Local) ));
			__hx_this.dateUTC = __hx_this.date.ToUniversalTime();
		}
	}
	
	
	public global::System.DateTime date;
	
	public global::System.DateTime dateUTC;
	
	public virtual string toString() {
		return this.date.ToString(((string) ("yyyy-MM-dd HH\\:mm\\:ss") ));
	}
	
	
	public override object __hx_setField(string field, int hash, object @value, bool handleProperties) {
		unchecked {
			switch (hash) {
				case 343868310:
				{
					this.dateUTC = ((global::System.DateTime) (@value) );
					return @value;
				}
				
				
				case 1113806382:
				{
					this.date = ((global::System.DateTime) (@value) );
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
				
				
				case 343868310:
				{
					return this.dateUTC;
				}
				
				
				case 1113806382:
				{
					return this.date;
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
		baseArr.push("dateUTC");
		baseArr.push("date");
		base.__hx_getFields(baseArr);
	}
	
	
	public override string ToString(){
		return this.toString();
	}
	
	
}


