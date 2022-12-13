
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.ds {
	public class StringMap<T> : global::haxe.lang.HxObject, global::haxe.ds.StringMap, global::haxe.IMap<string, T> {
		
		public StringMap(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public StringMap() {
			global::haxe.ds.StringMap<object>.__hx_ctor_haxe_ds_StringMap<T>(((global::haxe.ds.StringMap<T>) (this) ));
		}
		
		
		protected static void __hx_ctor_haxe_ds_StringMap<T_c>(global::haxe.ds.StringMap<T_c> __hx_this) {
			unchecked {
				__hx_this.cachedIndex = -1;
			}
		}
		
		
		public static object __hx_cast<T_c_c>(global::haxe.ds.StringMap me) {
			return ( (( me != null )) ? (me.haxe_ds_StringMap_cast<T_c_c>()) : default(object) );
		}
		
		
		public virtual object haxe_ds_StringMap_cast<T_c>() {
			unchecked {
				if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T_c))) {
					return this;
				}
				
				global::haxe.ds.StringMap<T_c> new_me = new global::haxe.ds.StringMap<T_c>(global::haxe.lang.EmptyObject.EMPTY);
				global::Array<string> fields = global::Reflect.fields(this);
				int i = 0;
				while (( i < fields.length )) {
					string field = fields[i++];
					switch (field) {
						case "vals":
						{
							if (( this.vals != null )) {
								T_c[] __temp_new_arr1 = new T_c[this.vals.Length];
								int __temp_i2 = -1;
								while ((  ++ __temp_i2 < this.vals.Length )) {
									object __temp_obj3 = ((object) (this.vals[__temp_i2]) );
									if (( __temp_obj3 != null )) {
										__temp_new_arr1[__temp_i2] = global::haxe.lang.Runtime.genericCast<T_c>(__temp_obj3);
									}
									
								}
								
								new_me.vals = __temp_new_arr1;
							}
							else {
								new_me.vals = null;
							}
							
							break;
						}
						
						
						default:
						{
							global::Reflect.setField(new_me, field, global::Reflect.field(this, field));
							break;
						}
						
					}
					
				}
				
				return new_me;
			}
		}
		
		
		public virtual object haxe_IMap_cast<K_c, V_c>() {
			return this.haxe_ds_StringMap_cast<T>();
		}
		
		
		public int[] hashes;
		
		public string[] _keys;
		
		public T[] vals;
		
		public int nBuckets;
		
		public string cachedKey;
		
		public int cachedIndex;
		
		public int lookup(string key) {
			unchecked {
				if (( this.nBuckets != 0 )) {
					int[] hashes = this.hashes;
					string[] keys = this._keys;
					int mask = ( this.nBuckets - 1 );
					int k = key.GetHashCode();
					k = ( ( k + 2127912214 ) + (( k << 12 )) );
					k = ( ( k ^ -949894596 ) ^ ( k >> 19 ) );
					k = ( ( k + 374761393 ) + (( k << 5 )) );
					k = ( ( k + (-744332180) ) ^ ( k << 9 ) );
					k = ( ( k + (-42973499) ) + (( k << 3 )) );
					k = ( ( k ^ -1252372727 ) ^ ( k >> 16 ) );
					int ret = k;
					if (( (( ret & -2 )) == 0 )) {
						if (( ret == 0 )) {
							ret = 2;
						}
						else {
							ret = -1;
						}
						
					}
					
					int hash = ret;
					int k1 = hash;
					int nProbes = 0;
					int i = ( k1 & mask );
					int last = i;
					int flag = default(int);
					while (true) {
						flag = hashes[i];
						if ( ! ((( ( flag != 0 ) && (( ( ( flag == 1 ) || ( flag != k1 ) ) || ( ((string) (keys[i]) ) != key ) )) ))) ) {
							break;
						}
						
						i = ( ( i +  ++ nProbes ) & mask );
					}
					
					if (( (( flag & -2 )) == 0 )) {
						return -1;
					}
					else {
						return i;
					}
					
				}
				
				return -1;
			}
		}
		
		
		public virtual global::haxe.lang.Null<T> @get(string key) {
			unchecked {
				int idx = -1;
				bool tmp = default(bool);
				if (( this.cachedKey == key )) {
					idx = this.cachedIndex;
					tmp = ( idx != -1 );
				}
				else {
					tmp = false;
				}
				
				if (tmp) {
					return new global::haxe.lang.Null<T>(global::haxe.lang.Runtime.genericCast<T>(this.vals[idx]), true);
				}
				
				idx = this.lookup(key);
				if (( idx != -1 )) {
					this.cachedKey = key;
					this.cachedIndex = idx;
					return new global::haxe.lang.Null<T>(global::haxe.lang.Runtime.genericCast<T>(this.vals[idx]), true);
				}
				
				return default(global::haxe.lang.Null<T>);
			}
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 922671056:
					{
						this.cachedIndex = ((int) (@value) );
						return @value;
					}
					
					
					case 1537812987:
					{
						this.nBuckets = ((int) (@value) );
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
					case 922671056:
					{
						this.cachedIndex = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
					
					case 1395555037:
					{
						this.cachedKey = global::haxe.lang.Runtime.toString(@value);
						return @value;
					}
					
					
					case 1537812987:
					{
						this.nBuckets = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
					
					case 1313416818:
					{
						this.vals = ((T[]) (@value) );
						return @value;
					}
					
					
					case 2048392659:
					{
						this._keys = ((string[]) (@value) );
						return @value;
					}
					
					
					case 995006396:
					{
						this.hashes = ((int[]) (@value) );
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
					case 5144726:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "get", 5144726)) );
					}
					
					
					case 1639293562:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "lookup", 1639293562)) );
					}
					
					
					case 922671056:
					{
						return this.cachedIndex;
					}
					
					
					case 1395555037:
					{
						return this.cachedKey;
					}
					
					
					case 1537812987:
					{
						return this.nBuckets;
					}
					
					
					case 1313416818:
					{
						return this.vals;
					}
					
					
					case 2048392659:
					{
						return this._keys;
					}
					
					
					case 995006396:
					{
						return this.hashes;
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
					case 922671056:
					{
						return ((double) (this.cachedIndex) );
					}
					
					
					case 1537812987:
					{
						return ((double) (this.nBuckets) );
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
					case 5144726:
					{
						return (this.@get(global::haxe.lang.Runtime.toString(dynargs[0]))).toDynamic();
					}
					
					
					case 1639293562:
					{
						return this.lookup(global::haxe.lang.Runtime.toString(dynargs[0]));
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override void __hx_getFields(global::Array<string> baseArr) {
			baseArr.push("cachedIndex");
			baseArr.push("cachedKey");
			baseArr.push("nBuckets");
			baseArr.push("vals");
			baseArr.push("_keys");
			baseArr.push("hashes");
			base.__hx_getFields(baseArr);
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.ds {
	[global::haxe.lang.GenericInterface(typeof(global::haxe.ds.StringMap<object>))]
	public interface StringMap : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject {
		
		object haxe_ds_StringMap_cast<T_c>();
		
		object haxe_IMap_cast<K_c, V_c>();
		
		int lookup(string key);
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.ds._StringMap {
	public sealed class StringMapKeyIterator<T> : global::haxe.lang.HxObject, global::haxe.ds._StringMap.StringMapKeyIterator {
		
		public StringMapKeyIterator(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public StringMapKeyIterator(global::haxe.ds.StringMap<T> m) {
			global::haxe.ds._StringMap.StringMapKeyIterator<object>.__hx_ctor_haxe_ds__StringMap_StringMapKeyIterator<T>(((global::haxe.ds._StringMap.StringMapKeyIterator<T>) (this) ), ((global::haxe.ds.StringMap<T>) (m) ));
		}
		
		
		private static void __hx_ctor_haxe_ds__StringMap_StringMapKeyIterator<T_c>(global::haxe.ds._StringMap.StringMapKeyIterator<T_c> __hx_this, global::haxe.ds.StringMap<T_c> m) {
			__hx_this.m = m;
			__hx_this.i = 0;
			__hx_this.len = m.nBuckets;
		}
		
		
		public static object __hx_cast<T_c_c>(global::haxe.ds._StringMap.StringMapKeyIterator me) {
			return ( (( me != null )) ? (me.haxe_ds__StringMap_StringMapKeyIterator_cast<T_c_c>()) : default(object) );
		}
		
		
		public object haxe_ds__StringMap_StringMapKeyIterator_cast<T_c>() {
			if (global::haxe.lang.Runtime.eq(typeof(T), typeof(T_c))) {
				return this;
			}
			
			global::haxe.ds._StringMap.StringMapKeyIterator<T_c> new_me = new global::haxe.ds._StringMap.StringMapKeyIterator<T_c>(((global::haxe.lang.EmptyObject) (global::haxe.lang.EmptyObject.EMPTY) ));
			global::Array<string> fields = global::Reflect.fields(this);
			int i = 0;
			while (( i < fields.length )) {
				string field = fields[i++];
				global::Reflect.setField(new_me, field, global::Reflect.field(this, field));
			}
			
			return new_me;
		}
		
		
		public global::haxe.ds.StringMap<T> m;
		
		public int i;
		
		public int len;
		
		public bool hasNext() {
			unchecked {
				{
					int _g = this.i;
					int _g1 = this.len;
					while (( _g < _g1 )) {
						int j = _g++;
						if (( (( this.m.hashes[j] & -2 )) != 0 )) {
							this.i = j;
							return true;
						}
						
					}
					
				}
				
				return false;
			}
		}
		
		
		public string next() {
			string ret = ((string) (this.m._keys[this.i]) );
			this.m.cachedIndex = this.i;
			this.m.cachedKey = ret;
			this.i++;
			return ret;
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 5393365:
					{
						this.len = ((int) (@value) );
						return @value;
					}
					
					
					case 105:
					{
						this.i = ((int) (@value) );
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
					case 5393365:
					{
						this.len = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
					
					case 105:
					{
						this.i = ((int) (global::haxe.lang.Runtime.toInt(@value)) );
						return @value;
					}
					
					
					case 109:
					{
						this.m = ((global::haxe.ds.StringMap<T>) (global::haxe.ds.StringMap<object>.__hx_cast<T>(((global::haxe.ds.StringMap) (@value) ))) );
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
					case 1224901875:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "next", 1224901875)) );
					}
					
					
					case 407283053:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "hasNext", 407283053)) );
					}
					
					
					case 5393365:
					{
						return this.len;
					}
					
					
					case 105:
					{
						return this.i;
					}
					
					
					case 109:
					{
						return this.m;
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
					case 5393365:
					{
						return ((double) (this.len) );
					}
					
					
					case 105:
					{
						return ((double) (this.i) );
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
					case 1224901875:
					{
						return this.next();
					}
					
					
					case 407283053:
					{
						return this.hasNext();
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
			}
		}
		
		
		public override void __hx_getFields(global::Array<string> baseArr) {
			baseArr.push("len");
			baseArr.push("i");
			baseArr.push("m");
			base.__hx_getFields(baseArr);
		}
		
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.ds._StringMap {
	[global::haxe.lang.GenericInterface(typeof(global::haxe.ds._StringMap.StringMapKeyIterator<object>))]
	public interface StringMapKeyIterator : global::haxe.lang.IHxObject, global::haxe.lang.IGenericObject {
		
		object haxe_ds__StringMap_StringMapKeyIterator_cast<T_c>();
		
		bool hasNext();
		
		string next();
		
	}
}


