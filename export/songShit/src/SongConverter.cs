
#pragma warning disable 109, 114, 219, 429, 168, 162
public class SongConverter : global::haxe.lang.HxObject {
	
	public static void Main(){
		global::cs.Boot.init();
		global::SongConverter.main();
	}
	public SongConverter(global::haxe.lang.EmptyObject empty) {
	}
	
	
	public SongConverter() {
		global::SongConverter.__hx_ctor__SongConverter(this);
	}
	
	
	protected static void __hx_ctor__SongConverter(global::SongConverter __hx_this) {
	}
	
	
	public static void main() {
		unchecked {
			int _g = 0;
			global::Array<string> _g1 = global::sys.FileSystem.readDirectory("./.");
			while (( _g < _g1.length )) {
				string fileThing = _g1[_g];
				 ++ _g;
				if (( ( global::sys.FileSystem.isDirectory(fileThing) && ( fileThing != "songs" ) ) && ( fileThing != "stages" ) )) {
					global::haxe.Log.trace.__hx_invoke2_o(default(double), global::haxe.lang.Runtime.concat("Formatting ", fileThing), default(double), new global::haxe.lang.DynamicObject(new int[]{302979532, 1547539107, 1648581351}, new object[]{"main", "SongConverter", "SongConverter.hx"}, new int[]{1981972957}, new double[]{((double) (24) )}));
					global::SongConverter.formatSong(fileThing);
				}
				
			}
			
		}
	}
	
	
	public static void formatSong(string songName) {
		unchecked {
			global::Array<bool> existsArray = new global::Array<bool>(new bool[]{});
			string songFiles_0 = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("", songName), "/"), songName), "-easy.json");
			string songFiles_1 = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("", songName), "/"), songName), ".json");
			string songFiles_2 = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("", songName), "/"), songName), "-hard.json");
			existsArray.push(global::sys.FileSystem.exists(songFiles_0));
			existsArray.push(global::sys.FileSystem.exists(songFiles_1));
			existsArray.push(global::sys.FileSystem.exists(songFiles_2));
			if ( ! (existsArray[0]) ) {
				songFiles_0 = songFiles_1;
			}
			
			if ( ! (existsArray[2]) ) {
				songFiles_2 = songFiles_1;
			}
			
			object fileNormal = ((object) (new global::haxe.format.JsonParser(((string) (global::sys.io.File.getContent(songFiles_0)) )).doParse()) );
			object fileHard = ((object) (new global::haxe.format.JsonParser(((string) (global::sys.io.File.getContent(songFiles_1)) )).doParse()) );
			object fileEasy = ((object) (new global::haxe.format.JsonParser(((string) (global::sys.io.File.getContent(songFiles_2)) )).doParse()) );
			object daOgNotes = global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "notes", 533388353, true);
			double daOgSpeed = ((double) (global::haxe.lang.Runtime.toDouble(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "speed", 23697287, true))) );
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "notes", 533388353, new global::Array<object>(new object[]{}));
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "speed", 23697287, new global::Array<object>(new object[]{}));
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileHard, "song", 1280844757, true), "notes", 533388353, global::SongConverter.noteCleaner(((global::Array) (global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileHard, "song", 1280844757, true), "notes", 533388353, true)) )));
			daOgNotes = global::SongConverter.noteCleaner(((global::Array) (daOgNotes) ));
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileEasy, "song", 1280844757, true), "notes", 533388353, global::SongConverter.noteCleaner(((global::Array) (global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileEasy, "song", 1280844757, true), "notes", 533388353, true)) )));
			object __temp_expr1 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "notes", 533388353, true), "push", 1247875546, new object[]{global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileHard, "song", 1280844757, true), "notes", 533388353, true)})) );
			object __temp_expr2 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "notes", 533388353, true), "push", 1247875546, new object[]{daOgNotes})) );
			object __temp_expr3 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "notes", 533388353, true), "push", 1247875546, new object[]{global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileEasy, "song", 1280844757, true), "notes", 533388353, true)})) );
			object __temp_expr4 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "speed", 23697287, true), "push", 1247875546, new object[]{global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileHard, "song", 1280844757, true), "speed", 23697287, true)})) );
			object __temp_expr5 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "speed", 23697287, true), "push", 1247875546, new object[]{daOgSpeed})) );
			object __temp_expr6 = ((object) (global::haxe.lang.Runtime.callField(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "speed", 23697287, true), "push", 1247875546, new object[]{global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(fileEasy, "song", 1280844757, true), "speed", 23697287, true)})) );
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "stageDefault", 589007267, global::SongConverter.getStage(songName));
			global::haxe.lang.Runtime.setField(global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true), "gf", 23071, global::SongConverter.getGF(songName));
			object fh = global::haxe.lang.Runtime.getField(fileNormal, "song", 1280844757, true);
			global::haxe.lang.Runtime.setField(fh, "bpm", 4898527, global::haxe.lang.Runtime.concat(global::Std.@string(global::haxe.lang.Runtime.getField(fh, "bpm", 4898527, true)), ".0"));
			if ( ! (global::sys.FileSystem.exists("songs")) ) {
				global::sys.FileSystem.createDirectory("songs");
			}
			
			global::haxe.lang.Function replacer = null;
			string daJson = global::haxe.format.JsonPrinter.print(fileNormal, replacer, "\t");
			global::sys.io.File.saveContent(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("songs/", songName), ".json"), daJson);
		}
	}
	
	
	public static global::Array noteCleaner(global::Array notes) {
		global::Array swagArray = new global::Array<object>(new object[]{});
		{
			int _g = 0;
			while (( _g < ((int) (global::haxe.lang.Runtime.getField_f(notes, "length", 520590566, true)) ) )) {
				object i = notes[_g];
				 ++ _g;
				if (( global::haxe.lang.Runtime.compare(global::haxe.lang.Runtime.getField(global::haxe.lang.Runtime.getField(i, "sectionNotes", 2124924956, true), "length", 520590566, true), 0) > 0 )) {
					int __temp_expr1 = ((int) (global::haxe.lang.Runtime.toInt(global::haxe.lang.Runtime.callField(swagArray, "push", 1247875546, new object[]{i}))) );
				}
				
			}
			
		}
		
		return swagArray;
	}
	
	
	public static string getStage(string songName) {
		switch (songName) {
			case "cocoa":
			case "eggnog":
			{
				return "mall";
			}
			
			
			case "monster":
			case "south":
			case "spookeez":
			{
				return "spooky";
			}
			
			
			case "blammed":
			case "philly":
			case "pico":
			{
				return "philly";
			}
			
			
			case "high":
			case "milf":
			case "satin-panties":
			{
				return "limo";
			}
			
			
			case "roses":
			case "senpai":
			{
				return "school";
			}
			
			
			case "thorns":
			{
				return "school-evil";
			}
			
			
			case "guns":
			case "stress":
			case "ugh":
			{
				return "tank";
			}
			
			
			case "winter-horrorland":
			{
				return "mall-evil";
			}
			
			
		}
		
		return "stage";
	}
	
	
	public static string getGF(string songName) {
		switch (songName) {
			case "high":
			case "milf":
			case "satin-panties":
			{
				return "gf-car";
			}
			
			
			case "roses":
			case "senpai":
			case "thorns":
			{
				return "gf-pixel";
			}
			
			
			case "stress":
			{
				return "pico-speaker";
			}
			
			
			case "guns":
			case "ugh":
			{
				return "gf-tankmen";
			}
			
			
			case "cocoa":
			case "eggnog":
			case "winter-horrorland":
			{
				return "gf-christmas";
			}
			
			
		}
		
		return "gf";
	}
	
	
}


