
#pragma warning disable 109, 114, 219, 429, 168, 162
public class StringTools : global::haxe.lang.HxObject {
	
	public StringTools(global::haxe.lang.EmptyObject empty) {
	}
	
	
	public StringTools() {
		global::StringTools.__hx_ctor__StringTools(this);
	}
	
	
	protected static void __hx_ctor__StringTools(global::StringTools __hx_this) {
	}
	
	
	public static string lpad(string s, string c, int l) {
		if (( c.Length <= 0 )) {
			return s;
		}
		
		global::System.Text.StringBuilder buf_b = new global::System.Text.StringBuilder();
		l -= s.Length;
		while (( buf_b.Length < l )) {
			buf_b.Append(((string) (global::Std.@string(c)) ));
		}
		
		buf_b.Append(((string) (global::Std.@string(s)) ));
		return buf_b.ToString();
	}
	
	
}


