
#pragma warning disable 109, 114, 219, 429, 168, 162
public class Std {
	
	public Std() {
	}
	
	
	public static bool isOfType(object v, object t) {
		unchecked {
			if (( v == null )) {
				return false;
			}
			
			if (( t == null )) {
				return false;
			}
			
			global::System.Type clt = ( t as global::System.Type );
			if (global::haxe.lang.Runtime.typeEq(clt, null)) {
				return false;
			}
			
			switch (clt.ToString()) {
				case "System.Boolean":
				{
					return v is bool;
				}
				
				
				case "System.Double":
				{
					return v is double || v is int;
				}
				
				
				case "System.Int32":
				{
					return global::haxe.lang.Runtime.isInt(v);
				}
				
				
				case "System.Object":
				{
					return true;
				}
				
				
			}
			
			global::System.Type vt = v.GetType();
			if (clt.IsAssignableFrom(((global::System.Type) (vt) ))) {
				return true;
			}
			
			{
				global::System.Type[] _g1_arr = clt.GetInterfaces();
				uint _g1_idx = ((uint) (0) );
				while (( _g1_idx < ( _g1_arr as global::System.Array ).Length )) {
					_g1_idx += ((uint) (1) );
					global::System.Type iface = ((global::System.Type) (_g1_arr[((int) (((uint) (( _g1_idx - 1 )) )) )]) );
					global::haxe.lang.GenericInterface g = global::haxe.lang.Runtime.getGenericAttr(iface);
					if (( ( g != null ) && global::haxe.lang.Runtime.typeEq(g.generic, clt) )) {
						return iface.IsAssignableFrom(((global::System.Type) (vt) ));
					}
					
				}
				
			}
			
			return false;
		}
	}
	
	
	public static string @string(object s) {
		if (( s == null )) {
			return "null";
		}
		
		if (( s is bool )) {
			if (global::haxe.lang.Runtime.toBool(s)) {
				return "true";
			}
			else {
				return "false";
			}
			
		}
		
		return s.ToString();
	}
	
	
	public static int @int(double x) {
		return ((int) (x) );
	}
	
	
	public static global::haxe.lang.Null<int> parseInt(string x) {
		unchecked {
			if (( x == null )) {
				return default(global::haxe.lang.Null<int>);
			}
			
			int @base = 10;
			int len = x.Length;
			int foundCount = 0;
			int sign = 0;
			int firstDigitIndex = 0;
			int lastDigitIndex = -1;
			int previous = 0;
			{
				int _g = 0;
				int _g1 = len;
				while (( _g < _g1 )) {
					int i = _g++;
					int c = ( (( ((uint) (i) ) < x.Length )) ? (((int) (x[i]) )) : (-1) );
					if (( ( ( c > 8 ) && ( c < 14 ) ) || ( c == 32 ) )) {
						if (( foundCount > 0 )) {
							return default(global::haxe.lang.Null<int>);
						}
						
						continue;
					}
					else {
						switch (c) {
							case 43:
							{
								if (( foundCount == 0 )) {
									sign = 1;
								}
								else if (( ( 48 <= c ) && ( c <= 57 ) )) {
								}
								else if (( ( @base == 16 ) && (( ( ( 97 <= c ) && ( c <= 122 ) ) || ( ( 65 <= c ) && ( c <= 90 ) ) )) )) {
								}
								else {
									goto label1;
								}
								
								break;
							}
							
							
							case 45:
							{
								if (( foundCount == 0 )) {
									sign = -1;
								}
								else if (( ( 48 <= c ) && ( c <= 57 ) )) {
								}
								else if (( ( @base == 16 ) && (( ( ( 97 <= c ) && ( c <= 122 ) ) || ( ( 65 <= c ) && ( c <= 90 ) ) )) )) {
								}
								else {
									goto label1;
								}
								
								break;
							}
							
							
							case 48:
							{
								if (( ( foundCount == 0 ) || ( ( foundCount == 1 ) && ( sign != 0 ) ) )) {
								}
								else if (( ( 48 <= c ) && ( c <= 57 ) )) {
								}
								else if (( ( @base == 16 ) && (( ( ( 97 <= c ) && ( c <= 122 ) ) || ( ( 65 <= c ) && ( c <= 90 ) ) )) )) {
								}
								else {
									goto label1;
								}
								
								break;
							}
							
							
							case 88:
							case 120:
							{
								if (( ( previous == 48 ) && (( ( ( foundCount == 1 ) && ( sign == 0 ) ) || ( ( foundCount == 2 ) && ( sign != 0 ) ) )) )) {
									@base = 16;
								}
								else if (( ( 48 <= c ) && ( c <= 57 ) )) {
								}
								else if (( ( @base == 16 ) && (( ( ( 97 <= c ) && ( c <= 122 ) ) || ( ( 65 <= c ) && ( c <= 90 ) ) )) )) {
								}
								else {
									goto label1;
								}
								
								break;
							}
							
							
							default:
							{
								if (( ( 48 <= c ) && ( c <= 57 ) )) {
								}
								else if (( ( @base == 16 ) && (( ( ( 97 <= c ) && ( c <= 122 ) ) || ( ( 65 <= c ) && ( c <= 90 ) ) )) )) {
								}
								else {
									goto label1;
								}
								
								break;
							}
							
						}
						
					}
					
					if (( ( ( foundCount == 0 ) && ( sign == 0 ) ) || ( ( foundCount == 1 ) && ( sign != 0 ) ) )) {
						firstDigitIndex = i;
					}
					
					 ++ foundCount;
					lastDigitIndex = i;
					previous = c;
				}
				label1: {};
			}
			
			if (( firstDigitIndex <= lastDigitIndex )) {
				string digits = global::haxe.lang.StringExt.substring(x, firstDigitIndex, new global::haxe.lang.Null<int>(( lastDigitIndex + 1 ), true));
				try {
					return new global::haxe.lang.Null<int>(( (( (( sign == -1 )) ? (-1) : (1) )) * global::System.Convert.ToInt32(((string) (digits) ), ((int) (@base) )) ), true);
				}
				catch (global::System.FormatException e){
					return default(global::haxe.lang.Null<int>);
				}
				
				
			}
			
			return default(global::haxe.lang.Null<int>);
		}
	}
	
	
	public static double parseFloat(string x) {
		unchecked {
			if (( x == null )) {
				return global::Math.NaN;
			}
			
			x = x.TrimStart();
			bool found = false;
			bool hasDot = false;
			bool hasSign = false;
			bool hasE = false;
			bool hasESign = false;
			bool hasEData = false;
			int i = -1;
			while ((  ++ i < x.Length )) {
				int chr = ((int) (x[i]) );
				if (( ( chr >= 48 ) && ( chr <= 57 ) )) {
					if (hasE) {
						hasEData = true;
					}
					
					found = true;
				}
				else {
					switch (chr) {
						case 43:
						case 45:
						{
							if ((  ! (found)  &&  ! (hasSign)  )) {
								hasSign = true;
							}
							else if (( ( ( found &&  ! (hasESign)  ) && hasE ) &&  ! (hasEData)  )) {
								hasESign = true;
							}
							else {
								goto label1;
							}
							
							break;
						}
						
						
						case 46:
						{
							if ( ! (hasDot) ) {
								hasDot = true;
							}
							else {
								goto label1;
							}
							
							break;
						}
						
						
						case 69:
						case 101:
						{
							if ( ! (hasE) ) {
								hasE = true;
							}
							else {
								goto label1;
							}
							
							break;
						}
						
						
						default:
						{
							goto label1;
						}
						
					}
					
				}
				
			}
			label1: {};
			if (( hasE &&  ! (hasEData)  )) {
				 -- i;
				if (hasESign) {
					 -- i;
				}
				
			}
			
			if (( i != x.Length )) {
				x = global::haxe.lang.StringExt.substr(x, 0, new global::haxe.lang.Null<int>(i, true));
			}
			
			try {
				return global::System.Double.Parse(((string) (x) ), ((global::System.IFormatProvider) (global::System.Globalization.CultureInfo.InvariantCulture) ));
			}
			catch (global::System.Exception _g){
				return global::Math.NaN;
			}
			
			
		}
	}
	
	
}


