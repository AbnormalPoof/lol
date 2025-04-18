
#pragma warning disable 109, 114, 219, 429, 168, 162
public class ValueType : global::haxe.lang.Enum {
	
	protected ValueType(int index) : base(index) {
	}
	
	
	public static readonly global::ValueType TNull = new global::ValueType_TNull();
	
	public static readonly global::ValueType TInt = new global::ValueType_TInt();
	
	public static readonly global::ValueType TFloat = new global::ValueType_TFloat();
	
	public static readonly global::ValueType TBool = new global::ValueType_TBool();
	
	public static readonly global::ValueType TObject = new global::ValueType_TObject();
	
	public static readonly global::ValueType TFunction = new global::ValueType_TFunction();
	
	public static global::ValueType TClass(global::System.Type c) {
		return new global::ValueType_TClass(c);
	}
	
	
	public static global::ValueType TEnum(global::System.Type e) {
		return new global::ValueType_TEnum(e);
	}
	
	
	public static readonly global::ValueType TUnknown = new global::ValueType_TUnknown();
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TNull : global::ValueType {
	
	public ValueType_TNull() : base(0) {
	}
	
	
	public override string getTag() {
		return "TNull";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TInt : global::ValueType {
	
	public ValueType_TInt() : base(1) {
	}
	
	
	public override string getTag() {
		return "TInt";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TFloat : global::ValueType {
	
	public ValueType_TFloat() : base(2) {
	}
	
	
	public override string getTag() {
		return "TFloat";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TBool : global::ValueType {
	
	public ValueType_TBool() : base(3) {
	}
	
	
	public override string getTag() {
		return "TBool";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TObject : global::ValueType {
	
	public ValueType_TObject() : base(4) {
	}
	
	
	public override string getTag() {
		return "TObject";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TFunction : global::ValueType {
	
	public ValueType_TFunction() : base(5) {
	}
	
	
	public override string getTag() {
		return "TFunction";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TClass : global::ValueType {
	
	public ValueType_TClass(global::System.Type c) : base(6) {
		this.c = c;
	}
	
	
	public override global::Array<object> getParams() {
		return new global::Array<object>(new object[]{this.c});
	}
	
	
	public override string getTag() {
		return "TClass";
	}
	
	
	public override int GetHashCode() {
		unchecked {
			return global::haxe.lang.Enum.paramsGetHashCode(6, new object[]{this.c});
		}
	}
	
	
	public override bool Equals(object other) {
		if (global::System.Object.ReferenceEquals(((object) (this) ), ((object) (other) ))) {
			return true;
		}
		
		global::ValueType_TClass en = ( other as global::ValueType_TClass );
		if (( en == null )) {
			return false;
		}
		
		if ( ! (global::Type.enumEq<object>(((object) (this.c) ), ((object) (en.c) ))) ) {
			return false;
		}
		
		return true;
	}
	
	
	public override string toString() {
		return global::haxe.lang.Enum.paramsToString("TClass", new object[]{this.c});
	}
	
	
	public readonly global::System.Type c;
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TEnum : global::ValueType {
	
	public ValueType_TEnum(global::System.Type e) : base(7) {
		this.e = e;
	}
	
	
	public override global::Array<object> getParams() {
		return new global::Array<object>(new object[]{this.e});
	}
	
	
	public override string getTag() {
		return "TEnum";
	}
	
	
	public override int GetHashCode() {
		unchecked {
			return global::haxe.lang.Enum.paramsGetHashCode(7, new object[]{this.e});
		}
	}
	
	
	public override bool Equals(object other) {
		if (global::System.Object.ReferenceEquals(((object) (this) ), ((object) (other) ))) {
			return true;
		}
		
		global::ValueType_TEnum en = ( other as global::ValueType_TEnum );
		if (( en == null )) {
			return false;
		}
		
		if ( ! (global::Type.enumEq<object>(((object) (this.e) ), ((object) (en.e) ))) ) {
			return false;
		}
		
		return true;
	}
	
	
	public override string toString() {
		return global::haxe.lang.Enum.paramsToString("TEnum", new object[]{this.e});
	}
	
	
	public readonly global::System.Type e;
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public sealed class ValueType_TUnknown : global::ValueType {
	
	public ValueType_TUnknown() : base(8) {
	}
	
	
	public override string getTag() {
		return "TUnknown";
	}
	
	
}



#pragma warning disable 109, 114, 219, 429, 168, 162
public class Type : global::haxe.lang.HxObject {
	
	public Type(global::haxe.lang.EmptyObject empty) {
	}
	
	
	public Type() {
		global::Type.__hx_ctor__Type(this);
	}
	
	
	protected static void __hx_ctor__Type(global::Type __hx_this) {
	}
	
	
	public static global::System.Type getClass<T>(T o) {
		if (( ( global::System.Object.ReferenceEquals(((object) (o) ), default(object)) || ( o is global::haxe.lang.DynamicObject ) ) || ( o is global::System.Type ) )) {
			return null;
		}
		
		return ((global::System.Type) (((object) (o) ).GetType()) );
	}
	
	
	public static global::Array<string> getInstanceFields(global::System.Type c) {
		unchecked {
			if (global::haxe.lang.Runtime.refEq(c, typeof(string))) {
				return global::haxe.lang.StringRefl.fields;
			}
			
			global::System.Type c1 = ((global::System.Type) (c) );
			global::Array<string> ret = new global::Array<string>(new string[]{});
			global::haxe.lang.Null<global::System.Reflection.BindingFlags> initial = new global::haxe.lang.Null<global::System.Reflection.BindingFlags>(global::System.Reflection.BindingFlags.Public, true);
			global::System.Reflection.BindingFlags this1 = ( ( ! (initial.hasValue) ) ? (default(global::System.Reflection.BindingFlags)) : ((initial).@value) );
			global::haxe.lang.Null<global::System.Reflection.BindingFlags> initial1 = new global::haxe.lang.Null<global::System.Reflection.BindingFlags>(( ((global::System.Reflection.BindingFlags) (this1) ) | ((global::System.Reflection.BindingFlags) (global::System.Reflection.BindingFlags.Instance) ) ), true);
			global::System.Reflection.BindingFlags this2 = ( ( ! (initial1.hasValue) ) ? (default(global::System.Reflection.BindingFlags)) : ((initial1).@value) );
			global::haxe.lang.Null<global::System.Reflection.BindingFlags> initial2 = new global::haxe.lang.Null<global::System.Reflection.BindingFlags>(( ((global::System.Reflection.BindingFlags) (this2) ) | ((global::System.Reflection.BindingFlags) (global::System.Reflection.BindingFlags.FlattenHierarchy) ) ), true);
			global::System.Reflection.BindingFlags this3 = ( ( ! (initial2.hasValue) ) ? (default(global::System.Reflection.BindingFlags)) : ((initial2).@value) );
			global::System.Reflection.MemberInfo[] mis = c1.GetMembers(((global::System.Reflection.BindingFlags) (this3) ));
			{
				int _g = 0;
				int _g1 = ( mis as global::System.Array ).Length;
				while (( _g < _g1 )) {
					int i = _g++;
					global::System.Reflection.MemberInfo i1 = ((global::System.Reflection.MemberInfo) (mis[i]) );
					if (( i1 is global::System.Reflection.PropertyInfo )) {
						continue;
					}
					
					string n = i1.Name;
					if ((  ! (n.StartsWith("__hx_"))  && ( (( (( ((uint) (0) ) < n.Length )) ? (((int) (n[0]) )) : (-1) )) != 46 ) )) {
						switch (n) {
							case "Equals":
							case "GetHashCode":
							case "GetType":
							case "ToString":
							{
								break;
							}
							
							
							default:
							{
								ret.push(n);
								break;
							}
							
						}
						
					}
					
				}
				
			}
			
			return ret;
		}
	}
	
	
	public static global::Array<string> getClassFields(global::System.Type c) {
		if (global::System.Object.ReferenceEquals(((object) (c) ), ((object) (typeof(string)) ))) {
			return new global::Array<string>(new string[]{"fromCharCode"});
		}
		
		global::Array<string> ret = new global::Array<string>(new string[]{});
		global::haxe.lang.Null<global::System.Reflection.BindingFlags> initial = new global::haxe.lang.Null<global::System.Reflection.BindingFlags>(global::System.Reflection.BindingFlags.Public, true);
		global::System.Reflection.BindingFlags this1 = ( ( ! (initial.hasValue) ) ? (default(global::System.Reflection.BindingFlags)) : ((initial).@value) );
		global::haxe.lang.Null<global::System.Reflection.BindingFlags> initial1 = new global::haxe.lang.Null<global::System.Reflection.BindingFlags>(( ((global::System.Reflection.BindingFlags) (this1) ) | ((global::System.Reflection.BindingFlags) (global::System.Reflection.BindingFlags.Static) ) ), true);
		global::System.Reflection.BindingFlags this2 = ( ( ! (initial1.hasValue) ) ? (default(global::System.Reflection.BindingFlags)) : ((initial1).@value) );
		global::System.Reflection.MemberInfo[] infos = ((global::System.Type) (c) ).GetMembers(((global::System.Reflection.BindingFlags) (this2) ));
		{
			int _g = 0;
			int _g1 = ( infos as global::System.Array ).Length;
			while (( _g < _g1 )) {
				int i = _g++;
				string name = ((global::System.Reflection.MemberInfo) (infos[i]) ).Name;
				if ( ! (name.StartsWith("__hx_")) ) {
					ret.push(name);
				}
				
			}
			
		}
		
		return ret;
	}
	
	
	public static global::ValueType @typeof(object v) {
		if (( v == null )) {
			return global::ValueType.TNull;
		}
		
		global::System.Type t = ( v as global::System.Type );
		if ( ! (global::System.Object.ReferenceEquals(((object) (t) ), default(object))) ) {
			return global::ValueType.TObject;
		}
		
		t = ((global::System.Type) (v.GetType()) );
		if (t.IsEnum) {
			return global::ValueType.TEnum(((global::System.Type) (t) ));
		}
		
		if (( v is global::haxe.lang.Enum )) {
			return global::ValueType.TEnum(((global::System.Type) (t.BaseType) ));
		}
		
		if (t.IsValueType) {
			global::System.IConvertible vc = ( ((object) (v) ) as global::System.IConvertible );
			if (( vc != null )) {
				switch (vc.GetTypeCode()) {
					case global::System.TypeCode.Boolean:
					{
						return global::ValueType.TBool;
					}
					
					
					case global::System.TypeCode.Int32:
					{
						return global::ValueType.TInt;
					}
					
					
					case global::System.TypeCode.Double:
					{
						double d = vc.ToDouble(default(global::System.IFormatProvider));
						if (( ( ( d >= global::System.Int32.MinValue ) && ( d <= global::System.Int32.MaxValue ) ) && ( d == vc.ToInt32(default(global::System.IFormatProvider)) ) )) {
							return global::ValueType.TInt;
						}
						else {
							return global::ValueType.TFloat;
						}
						
					}
					
					
					default:
					{
						return global::ValueType.TClass(((global::System.Type) (t) ));
					}
					
				}
				
			}
			else {
				return global::ValueType.TClass(((global::System.Type) (t) ));
			}
			
		}
		
		if (( v is global::haxe.lang.IHxObject )) {
			if (( v is global::haxe.lang.DynamicObject )) {
				return global::ValueType.TObject;
			}
			
			return global::ValueType.TClass(((global::System.Type) (t) ));
		}
		else if (( v is global::haxe.lang.Function )) {
			return global::ValueType.TFunction;
		}
		else {
			return global::ValueType.TClass(((global::System.Type) (t) ));
		}
		
	}
	
	
	public static bool enumEq<T>(T a, T b) {
		if (global::haxe.lang.Runtime.eq(a, default(T))) {
			return global::haxe.lang.Runtime.eq(b, default(T));
		}
		else if (global::haxe.lang.Runtime.eq(b, default(T))) {
			return false;
		}
		else {
			return a.Equals(b);
		}
		
	}
	
	
	public static int enumIndex(object e) {
		if (( e is global::System.Enum )) {
			global::System.Array values = global::System.Enum.GetValues(((global::System.Type) (((object) (e) ).GetType()) ));
			return global::System.Array.IndexOf(((global::System.Array) (values) ), ((object) (e) ));
		}
		else {
			return (((global::haxe.lang.Enum) (e) ))._hx_index;
		}
		
	}
	
	
}


