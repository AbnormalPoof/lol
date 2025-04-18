
#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.lang {
	public sealed class FieldHashConflict {
		
		public FieldHashConflict(int hash, string name, object @value, global::haxe.lang.FieldHashConflict next) {
			this.hash = hash;
			this.name = name;
			this.@value = @value;
			this.next = next;
		}
		
		
		public readonly int hash;
		
		public readonly string name;
		
		public object @value;
		
		public global::haxe.lang.FieldHashConflict next;
		
	}
}



#pragma warning disable 109, 114, 219, 429, 168, 162
namespace haxe.lang {
	public sealed class FieldLookup {
		
		#pragma warning disable 628
		static FieldLookup() {
			global::haxe.lang.FieldLookup.length = ( global::haxe.lang.FieldLookup.fieldIds as global::System.Array ).Length;
		}
		
		
		public FieldLookup() {
		}
		
		
		protected static int[] fieldIds = new int[]{98, 105, 109, 23071, 4745537, 4898527, 4899635, 5144726, 5393365, 5442204, 5594513, 5594516, 5744817, 23697287, 46374763, 57476627, 76061764, 78945784, 87367608, 142151465, 142301684, 208459108, 221637784, 243225909, 288167040, 302979532, 312752480, 328878574, 334695532, 343868310, 359333139, 404153790, 407283053, 437335495, 452737314, 493819893, 501039929, 520590566, 533388353, 537630174, 572311959, 589007267, 610723709, 630156697, 640252688, 652994848, 701410669, 746281503, 784433846, 834174833, 863972113, 878103594, 922671056, 946786476, 995006396, 1058556349, 1067353468, 1103412149, 1113806382, 1177754921, 1181037546, 1204816148, 1214453688, 1224901875, 1225098545, 1228056441, 1238832007, 1247875546, 1257164128, 1273207865, 1280844757, 1280845662, 1282943179, 1313416818, 1348037855, 1352786672, 1381630732, 1395555037, 1398464674, 1431819701, 1436822557, 1450762973, 1460447810, 1512997393, 1532710347, 1537812987, 1547539107, 1576149820, 1620824029, 1621420777, 1623148745, 1639293562, 1648581351, 1705629508, 1763375486, 1768617329, 1825849507, 1830310359, 1887596712, 1915412854, 1916009602, 1937159360, 1981972957, 2025055113, 2048392659, 2054707467, 2082663554, 2113708439, 2124924956, 2127021138};
		
		protected static string[] fields = new string[]{"b", "i", "m", "gf", "__a", "bpm", "buf", "get", "len", "map", "pop", "pos", "str", "speed", "readAll", "getEnumConstructs", "remove", "__previousException", "filter", "classString", "resize", "parseString", "__nativeException", "readBytes", "stream", "methodName", "get_native", "iterator", "indent", "dateUTC", "lastIndexOf", "replacer", "hasNext", "message", "reverse", "getBytes", "insert", "length", "notes", "get_message", "native", "stageDefault", "writeFullBytes", "array", "writeString", "invalidNumber", "invalidChar", "contains", "pretty", "value", "__nativeStack", "fieldsString", "cachedIndex", "toString", "hashes", "_eof", "splice", "copy", "date", "__skipStack", "join", "concat", "close", "next", "nind", "enumConstructor", "writeByte", "push", "keyValueIterator", "current", "song", "sort", "quicksort", "vals", "write", "spliceVoid", "writeBytes", "cachedKey", "getEnumName", "createEnumIndex", "createEnum", "parseRec", "__ownStack", "posInfos", "concatNative", "nBuckets", "className", "quote", "__unsafe_get", "__unsafe_set", "indexOf", "lookup", "fileName", "toDynamic", "readByte", "allEnums", "unwrap", "customParams", "doParse", "__get", "__set", "__hx_deleteField", "lineNumber", "unshift", "_keys", "enumParameters", "shift", "addChar", "sectionNotes", "slice"};
		
		protected static int length;
		
		public static void addFields(int[] nids, string[] nfields) {
			unchecked {
				int[] cids = global::haxe.lang.FieldLookup.fieldIds;
				string[] cfields = global::haxe.lang.FieldLookup.fields;
				int nlen = ( nids as global::System.Array ).Length;
				int clen = global::haxe.lang.FieldLookup.length;
				if (( ( nfields as global::System.Array ).Length != nlen )) {
					throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("Different fields length: ", global::haxe.lang.Runtime.toString(nlen)), " and "), global::haxe.lang.Runtime.toString(( nfields as global::System.Array ).Length)))) );
				}
				
				bool needsChange = false;
				{
					int[] _g_arr = nids;
					uint _g_idx = ((uint) (0) );
					while (( _g_idx < ( _g_arr as global::System.Array ).Length )) {
						_g_idx += ((uint) (1) );
						int i = _g_arr[((int) (((uint) (( _g_idx - 1 )) )) )];
						if (( global::haxe.lang.FieldLookup.findHash(i, cids, clen) < 0 )) {
							needsChange = true;
							break;
						}
						
					}
					
				}
				
				if (needsChange) {
					lock(typeof(global::haxe.lang.FieldLookup)){
						int[] ansIds = new int[( clen + nlen )];
						string[] ansFields = new string[( clen + nlen )];
						int ci = 0;
						int ni = 0;
						int ansi = 0;
						while (true) {
							if ( ! ((( (( ci < clen )) ? (( ni < nlen )) : (false) ))) ) {
								break;
							}
							
							if (( cids[ci] < nids[ni] )) {
								ansIds[ansi] = cids[ci];
								ansFields[ansi] = ((string) (cfields[ci]) );
								ci = ( ci + 1 );
							}
							else {
								ansIds[ansi] = nids[ni];
								ansFields[ansi] = ((string) (nfields[ni]) );
								ni = ( ni + 1 );
							}
							
							ansi = ( ansi + 1 );
						}
						
						if (( ci < clen )) {
							global::System.Array.Copy(((global::System.Array) (cids) ), ((int) (ci) ), ((global::System.Array) (ansIds) ), ((int) (ansi) ), ((int) (( clen - ci )) ));
							global::System.Array.Copy(((global::System.Array) (cfields) ), ((int) (ci) ), ((global::System.Array) (ansFields) ), ((int) (ansi) ), ((int) (( clen - ci )) ));
							ansi = ( ansi + (( clen - ci )) );
						}
						
						if (( ni < nlen )) {
							global::System.Array.Copy(((global::System.Array) (nids) ), ((int) (ni) ), ((global::System.Array) (ansIds) ), ((int) (ansi) ), ((int) (( nlen - ni )) ));
							global::System.Array.Copy(((global::System.Array) (nfields) ), ((int) (ni) ), ((global::System.Array) (ansFields) ), ((int) (ansi) ), ((int) (( nlen - ni )) ));
							ansi = ( ansi + (( nlen - ni )) );
						}
						
						global::haxe.lang.FieldLookup.fieldIds = ansIds;
						global::haxe.lang.FieldLookup.fields = ansFields;
						global::haxe.lang.FieldLookup.length = ansi;
					}
					;
				}
				
			}
		}
		
		
		public static int doHash(string s) {
			unchecked {
				int acc = 0;
				{
					int _g = 0;
					int _g1 = s.Length;
					while (( _g < _g1 )) {
						int i = _g++;
						acc = ( ( ( 223 * (( acc >> 1 )) ) + ((int) (s[i]) ) ) << 1 );
					}
					
				}
				
				return ((int) (( ((uint) (acc) ) >> 1 )) );
			}
		}
		
		
		public static string lookupHash(int key) {
			unchecked {
				int[] ids = global::haxe.lang.FieldLookup.fieldIds;
				int min = 0;
				int max = global::haxe.lang.FieldLookup.length;
				while (( min < max )) {
					int mid = ( min + ( (( max - min )) / 2 ) );
					int imid = ids[mid];
					if (( key < imid )) {
						max = mid;
					}
					else if (( key > imid )) {
						min = ( mid + 1 );
					}
					else {
						return ((string) (global::haxe.lang.FieldLookup.fields[mid]) );
					}
					
				}
				
				throw ((global::System.Exception) (global::haxe.Exception.thrown(global::haxe.lang.Runtime.concat("Field not found for hash ", global::haxe.lang.Runtime.toString(key)))) );
			}
		}
		
		
		public static int hash(string s) {
			unchecked {
				if (( s == null )) {
					return 0;
				}
				
				int acc = 0;
				{
					int _g = 0;
					int _g1 = s.Length;
					while (( _g < _g1 )) {
						int i = _g++;
						acc = ( ( ( 223 * (( acc >> 1 )) ) + ((int) (s[i]) ) ) << 1 );
					}
					
				}
				
				int key = ((int) (( ((uint) (acc) ) >> 1 )) );
				int[] ids = global::haxe.lang.FieldLookup.fieldIds;
				string[] fld = global::haxe.lang.FieldLookup.fields;
				int min = 0;
				int max = global::haxe.lang.FieldLookup.length;
				int len = global::haxe.lang.FieldLookup.length;
				while (( min < max )) {
					int mid = ((int) (( min + ( ((double) ((( max - min ))) ) / 2 ) )) );
					int imid = ids[mid];
					if (( key < imid )) {
						max = mid;
					}
					else if (( key > imid )) {
						min = ( mid + 1 );
					}
					else {
						string field = ((string) (fld[mid]) );
						if (( field != s )) {
							return  ~ (key) ;
						}
						
						return key;
					}
					
				}
				
				lock(typeof(global::haxe.lang.FieldLookup)){
					if (( len != global::haxe.lang.FieldLookup.length )) {
						return global::haxe.lang.FieldLookup.hash(s);
					}
					
					global::haxe.lang.FieldLookup.fieldIds = global::haxe.lang.FieldLookup.insertInt(global::haxe.lang.FieldLookup.fieldIds, global::haxe.lang.FieldLookup.length, min, key);
					global::haxe.lang.FieldLookup.fields = global::haxe.lang.FieldLookup.insertString(global::haxe.lang.FieldLookup.fields, global::haxe.lang.FieldLookup.length, min, s);
					 ++ global::haxe.lang.FieldLookup.length;
				}
				;
				return key;
			}
		}
		
		
		public static int findHash(int hash, int[] hashs, int length) {
			unchecked {
				int min = 0;
				int max = length;
				while (( min < max )) {
					int mid = ( (( max + min )) / 2 );
					int imid = hashs[mid];
					if (( hash < imid )) {
						max = mid;
					}
					else if (( hash > imid )) {
						min = ( mid + 1 );
					}
					else {
						return mid;
					}
					
				}
				
				return  ~ (min) ;
			}
		}
		
		
		public static void removeInt(int[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = 0;
			}
		}
		
		
		public static void removeFloat(double[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = ((double) (0) );
			}
		}
		
		
		public static void removeDynamic(object[] a, int length, int pos) {
			unchecked {
				global::System.Array.Copy(((global::System.Array) (a) ), ((int) (( pos + 1 )) ), ((global::System.Array) (a) ), ((int) (pos) ), ((int) (( ( length - pos ) - 1 )) ));
				a[( length - 1 )] = null;
			}
		}
		
		
		public static int[] insertInt(int[] a, int length, int pos, int x) {
			unchecked {
				int[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						int[] newarr = new int[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						int[] newarr1 = new int[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					int[] newarr2 = new int[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static double[] insertFloat(double[] a, int length, int pos, double x) {
			unchecked {
				double[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						double[] newarr = new double[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						double[] newarr1 = new double[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					double[] newarr2 = new double[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static object[] insertDynamic(object[] a, int length, int pos, object x) {
			unchecked {
				object[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						object[] newarr = new object[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						object[] newarr1 = new object[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					object[] newarr2 = new object[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = ((object) (x) );
				return a1;
			}
		}
		
		
		public static string[] insertString(string[] a, int length, int pos, string x) {
			unchecked {
				string[] a1 = a;
				int capacity = ( a1 as global::System.Array ).Length;
				if (( pos == length )) {
					if (( capacity == length )) {
						string[] newarr = new string[( (( length << 1 )) + 1 )];
						( a1 as global::System.Array ).CopyTo(((global::System.Array) (newarr) ), ((int) (0) ));
						a1 = newarr;
					}
					
				}
				else if (( pos == 0 )) {
					if (( capacity == length )) {
						string[] newarr1 = new string[( (( length << 1 )) + 1 )];
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr1) ), ((int) (1) ), ((int) (length) ));
						a1 = newarr1;
					}
					else {
						global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (1) ), ((int) (length) ));
					}
					
				}
				else if (( capacity == length )) {
					string[] newarr2 = new string[( (( length << 1 )) + 1 )];
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (newarr2) ), ((int) (0) ), ((int) (pos) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (newarr2) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					a1 = newarr2;
				}
				else {
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (pos) ), ((global::System.Array) (a1) ), ((int) (( pos + 1 )) ), ((int) (( length - pos )) ));
					global::System.Array.Copy(((global::System.Array) (a1) ), ((int) (0) ), ((global::System.Array) (a1) ), ((int) (0) ), ((int) (pos) ));
				}
				
				a1[pos] = x;
				return a1;
			}
		}
		
		
		public static global::haxe.lang.FieldHashConflict getHashConflict(global::haxe.lang.FieldHashConflict head, int hash, string name) {
			while (( head != null )) {
				if (( ( head.hash == hash ) && ( head.name == name ) )) {
					return head;
				}
				
				head = head.next;
			}
			
			return null;
		}
		
		
		public static void setHashConflict(ref global::haxe.lang.FieldHashConflict head, int hash, string name, object @value) {
			global::haxe.lang.FieldHashConflict node = head;
			while (( node != null )) {
				if (( ( node.hash == hash ) && ( node.name == name ) )) {
					node.@value = @value;
					return;
				}
				
				node = ((global::haxe.lang.FieldHashConflict) (node.next) );
			}
			
			head = ((global::haxe.lang.FieldHashConflict) (new global::haxe.lang.FieldHashConflict(hash, name, @value, ((global::haxe.lang.FieldHashConflict) (head) ))) );
		}
		
		
		public static bool deleteHashConflict(ref global::haxe.lang.FieldHashConflict head, int hash, string name) {
			if (( head == null )) {
				return false;
			}
			
			if (( ( head.hash == hash ) && ( head.name == name ) )) {
				head = ((global::haxe.lang.FieldHashConflict) (head.next) );
				return true;
			}
			
			global::haxe.lang.FieldHashConflict prev = head;
			global::haxe.lang.FieldHashConflict node = head.next;
			while (( node != null )) {
				if (( ( node.hash == hash ) && ( node.name == name ) )) {
					prev.next = node.next;
					return true;
				}
				
				node = node.next;
			}
			
			return false;
		}
		
		
		public static void addHashConflictNames(global::haxe.lang.FieldHashConflict head, global::Array<string> arr) {
			while (( head != null )) {
				arr.push(head.name);
				head = head.next;
			}
			
		}
		
		
	}
}


