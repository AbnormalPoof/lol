package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_funkin_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixel_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"ah","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("locales", library);
		Assets.libraryPaths["scripts"] = rootPath + "manifest/scripts.json";
		Assets.libraryPaths["songs"] = rootPath + "manifest/songs.json";
		Assets.libraryPaths["shared"] = rootPath + "manifest/shared.json";
		Assets.libraryPaths["stage"] = rootPath + "manifest/stage.json";
		Assets.libraryPaths["spooky"] = rootPath + "manifest/spooky.json";
		Assets.libraryPaths["philly"] = rootPath + "manifest/philly.json";
		Assets.libraryPaths["limo"] = rootPath + "manifest/limo.json";
		Assets.libraryPaths["mall"] = rootPath + "manifest/mall.json";
		Assets.libraryPaths["mall-evil"] = rootPath + "manifest/mall-evil.json";
		Assets.libraryPaths["school"] = rootPath + "manifest/school.json";
		Assets.libraryPaths["school-evil"] = rootPath + "manifest/school-evil.json";
		Assets.libraryPaths["tank"] = rootPath + "manifest/tank.json";
		Assets.libraryPaths["expo"] = rootPath + "manifest/expo.json";
		Assets.libraryPaths["expo-two"] = rootPath + "manifest/expo-two.json";
		Assets.libraryPaths["concert"] = rootPath + "manifest/concert.json";
		Assets.libraryPaths["endless"] = rootPath + "manifest/endless.json";
		data = '{"name":null,"assets":"aoy4:pathy48:assets%2Fpreload%2Fmusic%2FenduranceCutscene.mp4y4:sizei1726569y4:typey6:BINARYy2:idR1goR0y43:assets%2Fpreload%2Fmusic%2FgunsCutscene.mp4R2i1815170R3R4R5R6goR0y43:assets%2Fpreload%2Fmusic%2FloidCutscene.mp4R2i1721950R3R4R5R7goR0y45:assets%2Fpreload%2Fmusic%2FstressCutscene.mp4R2i6957069R3R4R5R8goR0y42:assets%2Fpreload%2Fmusic%2FughCutscene.mp4R2i2320865R3R4R5R9goR0y43:assets%2Fpreload%2Fmusic%2FvocaCutscene.mp4R2i1354072R3R4R5R10goR0y33:assets%2Fdata%2FcharacterList.txtR2i195R3y4:TEXTR5R11y7:preloadtgoR0y28:assets%2Fdata%2Fcontrols.txtR2i324R3R12R5R14R13tgoR0y25:assets%2Fdata%2Fcreds.txtR2i475R3R12R5R15R13tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R12R5R16R13tgoR0y33:assets%2Fdata%2FendlessLyrics.txtR2i1142R3R12R5R17R13tgoR0y36:assets%2Fdata%2FfreeplaySonglist.txtR2i662R3R12R5R18R13tgoR0y26:assets%2Fdata%2FgfList.txtR2i69R3R12R5R19R13tgoR0y29:assets%2Fdata%2FintroText.txtR2i1260R3R12R5R20R13tgoR0y29:assets%2Fdata%2Fmain-view.xmlR2i123R3R12R5R21R13tgoR0y33:assets%2Fdata%2Fsongs%2F2hot.jsonR2i193810R3R12R5R22R13tgoR0y36:assets%2Fdata%2Fsongs%2Faishite.jsonR2i55227R3R12R5R23R13tgoR0y36:assets%2Fdata%2Fsongs%2Fblammed.jsonR2i165379R3R12R5R24R13tgoR0y36:assets%2Fdata%2Fsongs%2Fbopeebo.jsonR2i71347R3R12R5R25R13tgoR0y33:assets%2Fdata%2Fsongs%2Fchug.jsonR2i38329R3R12R5R26R13tgoR0y34:assets%2Fdata%2Fsongs%2Fcocoa.jsonR2i174453R3R12R5R27R13tgoR0y44:assets%2Fdata%2Fsongs%2Fdadbattle-erect.jsonR2i218606R3R12R5R28R13tgoR0y38:assets%2Fdata%2Fsongs%2Fdadbattle.jsonR2i155879R3R12R5R29R13tgoR0y36:assets%2Fdata%2Fsongs%2Fdarnell.jsonR2i149237R3R12R5R30R13tgoR0y42:assets%2Fdata%2Fsongs%2Fdisappearance.jsonR2i151268R3R12R5R31R13tgoR0y35:assets%2Fdata%2Fsongs%2Feggnog.jsonR2i205560R3R12R5R32R13tgoR0y36:assets%2Fdata%2Fsongs%2Fendless.jsonR2i68479R3R12R5R33R13tgoR0y38:assets%2Fdata%2Fsongs%2Fendurance.jsonR2i211857R3R12R5R34R13tgoR0y34:assets%2Fdata%2Fsongs%2Ffresh.jsonR2i126835R3R12R5R35R13tgoR0y33:assets%2Fdata%2Fsongs%2Fguns.jsonR2i382222R3R12R5R36R13tgoR0y33:assets%2Fdata%2Fsongs%2Fhigh.jsonR2i202709R3R12R5R37R13tgoR0y37:assets%2Fdata%2Fsongs%2Finfinite.jsonR2i289309R3R12R5R38R13tgoR0y35:assets%2Fdata%2Fsongs%2Flit-up.jsonR2i203406R3R12R5R39R13tgoR0y33:assets%2Fdata%2Fsongs%2Floid.jsonR2i255892R3R12R5R40R13tgoR0y33:assets%2Fdata%2Fsongs%2Fmilf.jsonR2i294012R3R12R5R41R13tgoR0y36:assets%2Fdata%2Fsongs%2Fmonster.jsonR2i226111R3R12R5R42R13tgoR0y35:assets%2Fdata%2Fsongs%2Fphilly.jsonR2i179646R3R12R5R43R13tgoR0y41:assets%2Fdata%2Fsongs%2Fpico-speaker.jsonR2i296915R3R12R5R44R13tgoR0y33:assets%2Fdata%2Fsongs%2Fpico.jsonR2i139636R3R12R5R45R13tgoR0y35:assets%2Fdata%2Fsongs%2Fpopipo.jsonR2i79558R3R12R5R46R13tgoR0y34:assets%2Fdata%2Fsongs%2Froses.jsonR2i181992R3R12R5R47R13tgoR0y32:assets%2Fdata%2Fsongs%2Frun.jsonR2i2273878R3R12R5R48R13tgoR0y42:assets%2Fdata%2Fsongs%2Fsatin-panties.jsonR2i214743R3R12R5R49R13tgoR0y62:assets%2Fdata%2Fsongs%2Fsekai-wa-mada-hajimatte-sura-inai.jsonR2i105172R3R12R5R50R13tgoR0y35:assets%2Fdata%2Fsongs%2Fsenpai.jsonR2i187302R3R12R5R51R13tgoR0y32:assets%2Fdata%2Fsongs%2Fsiu.jsonR2i60151R3R12R5R52R13tgoR0y40:assets%2Fdata%2Fsongs%2Fsouth-erect.jsonR2i173615R3R12R5R53R13tgoR0y34:assets%2Fdata%2Fsongs%2Fsouth.jsonR2i171870R3R12R5R54R13tgoR0y37:assets%2Fdata%2Fsongs%2Fspookeez.jsonR2i190792R3R12R5R55R13tgoR0y35:assets%2Fdata%2Fsongs%2Fstress.jsonR2i376806R3R12R5R56R13tgoR0y44:assets%2Fdata%2Fsongs%2Ftarget-practice.jsonR2i430565R3R12R5R57R13tgoR0y33:assets%2Fdata%2Fsongs%2Ftest.jsonR2i250030R3R12R5R58R13tgoR0y35:assets%2Fdata%2Fsongs%2Fthorns.jsonR2i235956R3R12R5R59R13tgoR0y56:assets%2Fdata%2Fsongs%2Ftutorial-%28miku-edition%29.jsonR2i74722R3R12R5R60R13tgoR0y37:assets%2Fdata%2Fsongs%2Ftutorial.jsonR2i42055R3R12R5R61R13tgoR0y32:assets%2Fdata%2Fsongs%2Fugh.jsonR2i225995R3R12R5R62R13tgoR0y33:assets%2Fdata%2Fsongs%2Fvoca.jsonR2i212231R3R12R5R63R13tgoR0y46:assets%2Fdata%2Fsongs%2Fwinter-horrorland.jsonR2i216523R3R12R5R64R13tgoR0y33:assets%2Fdata%2FspecialThanks.txtR2i300R3R12R5R65R13tgoR0y29:assets%2Fdata%2FstageList.txtR2i93R3R12R5R66R13tgoR0y33:assets%2Fimages%2FNOTE_assets.pngR2i129989R3y5:IMAGER5R67R13tgoR0y33:assets%2Fimages%2FNOTE_assets.xmlR2i9024R3R12R5R69R13tgoR0y39:assets%2Fimages%2FSongs%2Fsongstart.pngR2i159043R3R68R5R70R13tgoR0y39:assets%2Fimages%2FSongs%2Fsongstart.xmlR2i1181R3R12R5R71R13tgoR0y52:assets%2Fimages%2Fatlases%2FgfDemon%2FAnimation.jsonR2i246858R3R12R5R72R13tgoR0y53:assets%2Fimages%2Fatlases%2FgfDemon%2Fspritemap1.jsonR2i4474R3R12R5R73R13tgoR0y52:assets%2Fimages%2Fatlases%2FgfDemon%2Fspritemap1.pngR2i320324R3R68R5R74R13tgoR0y54:assets%2Fimages%2Fatlases%2FpicoShoot%2FAnimation.jsonR2i466008R3R12R5R75R13tgoR0y55:assets%2Fimages%2Fatlases%2FpicoShoot%2Fspritemap1.jsonR2i8760R3R12R5R76R13tgoR0y54:assets%2Fimages%2Fatlases%2FpicoShoot%2Fspritemap1.pngR2i972346R3R68R5R77R13tgoR0y59:assets%2Fimages%2Fatlases%2FstressCutscene%2FAnimation.jsonR2i920913R3R12R5R78R13tgoR0y60:assets%2Fimages%2Fatlases%2FstressCutscene%2Fspritemap1.jsonR2i7992R3R12R5R79R13tgoR0y59:assets%2Fimages%2Fatlases%2FstressCutscene%2Fspritemap1.pngR2i329309R3R68R5R80R13tgoR0y57:assets%2Fimages%2Fatlases%2FtankTalkSong%2FAnimation.jsonR2i262639R3R12R5R81R13tgoR0y58:assets%2Fimages%2Fatlases%2FtankTalkSong%2Fspritemap1.jsonR2i4530R3R12R5R82R13tgoR0y57:assets%2Fimages%2Fatlases%2FtankTalkSong%2Fspritemap1.pngR2i152568R3R68R5R83R13tgoR0y54:assets%2Fimages%2Fatlases%2FtightBars%2FAnimation.jsonR2i389440R3R12R5R84R13tgoR0y55:assets%2Fimages%2Fatlases%2FtightBars%2Fspritemap1.jsonR2i2150R3R12R5R85R13tgoR0y54:assets%2Fimages%2Fatlases%2FtightBars%2Fspritemap1.pngR2i87338R3R68R5R86R13tgoR0y45:assets%2Fimages%2Fcampaign_menu_UI_assets.pngR2i12992R3R68R5R87R13tgoR0y45:assets%2Fimages%2Fcampaign_menu_UI_assets.xmlR2i574R3R12R5R88R13tgoR0y49:assets%2Fimages%2Fcampaign_menu_UI_characters.pngR2i1349408R3R68R5R89R13tgoR0y49:assets%2Fimages%2Fcampaign_menu_UI_characters.xmlR2i24561R3R12R5R90R13tgoR0y39:assets%2Fimages%2Fcampaign_ui_arrow.pngR2i1115R3R68R5R91R13tgoR0y38:assets%2Fimages%2Fchance%2FPerfect.pngR2i470413R3R68R5R92R13tgoR0y38:assets%2Fimages%2Fchance%2FPerfect.xmlR2i1571R3R12R5R93R13tgoR0y37:assets%2Fimages%2FcheckboxThingie.pngR2i21263R3R68R5R94R13tgoR0y37:assets%2Fimages%2FcheckboxThingie.xmlR2i2303R3R12R5R95R13tgoR0y28:assets%2Fimages%2FdotArt.pngR2i74431R3R68R5R96R13tgoR0y34:assets%2Fimages%2Ffonts%2Fbold.pngR2i95090R3R68R5R97R13tgoR0y34:assets%2Fimages%2Ffonts%2Fbold.xmlR2i17654R3R12R5R98R13tgoR0y37:assets%2Fimages%2Ffonts%2Fdefault.pngR2i78822R3R68R5R99R13tgoR0y37:assets%2Fimages%2Ffonts%2Fdefault.xmlR2i27229R3R12R5R100R13tgoR0y28:assets%2Fimages%2Ffunkay.pngR2i112310R3R68R5R101R13tgoR0y34:assets%2Fimages%2FgfDanceTitle.pngR2i1221436R3R68R5R102R13tgoR0y34:assets%2Fimages%2FgfDanceTitle.xmlR2i4259R3R12R5R103R13tgoR0y30:assets%2Fimages%2Fgfdemon1.pngR2i6758466R3R68R5R104R13tgoR0y30:assets%2Fimages%2Fgfdemon1.xmlR2i4840R3R12R5R105R13tgoR0y30:assets%2Fimages%2Fgfdemon2.pngR2i7942906R3R68R5R106R13tgoR0y30:assets%2Fimages%2Fgfdemon2.xmlR2i3978R3R12R5R107R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-bf-old.pngR2i10263R3R68R5R108R13tgoR0y43:assets%2Fimages%2Ficons%2Ficon-bf-pixel.pngR2i1301R3R68R5R109R13tgoR0y37:assets%2Fimages%2Ficons%2Ficon-bf.pngR2i19936R3R68R5R110R13tgoR0y40:assets%2Fimages%2Ficons%2Ficon-carol.pngR2i28107R3R68R5R111R13tgoR0y38:assets%2Fimages%2Ficons%2Ficon-dad.pngR2i15108R3R68R5R112R13tgoR0y42:assets%2Fimages%2Ficons%2Ficon-darnell.pngR2i9846R3R68R5R113R13tgoR0y39:assets%2Fimages%2Ficons%2Ficon-face.pngR2i7096R3R68R5R114R13tgoR0y37:assets%2Fimages%2Ficons%2Ficon-gf.pngR2i12010R3R68R5R115R13tgoR0y39:assets%2Fimages%2Ficons%2Ficon-miku.pngR2i48313R3R68R5R116R13tgoR0y38:assets%2Fimages%2Ficons%2Ficon-mom.pngR2i15612R3R68R5R117R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-monika.pngR2i24747R3R68R5R118R13tgoR0y42:assets%2Fimages%2Ficons%2Ficon-monster.pngR2i23064R3R68R5R119R13tgoR0y42:assets%2Fimages%2Ficons%2Ficon-parents.pngR2i22667R3R68R5R120R13tgoR0y39:assets%2Fimages%2Ficons%2Ficon-pico.pngR2i21559R3R68R5R121R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-senpai.pngR2i1441R3R68R5R122R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-spirit.pngR2i1286R3R68R5R123R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-spooky.pngR2i10457R3R68R5R124R13tgoR0y42:assets%2Fimages%2Ficons%2Ficon-tankman.pngR2i7072R3R68R5R125R13tgoR0y41:assets%2Fimages%2Ficons%2Ficon-tricky.pngR2i33386R3R68R5R126R13tgoR0y32:assets%2Fimages%2FlogoBumpin.pngR2i560687R3R68R5R127R13tgoR0y32:assets%2Fimages%2FlogoBumpin.xmlR2i2166R3R12R5R128R13tgoR0y31:assets%2Fimages%2Fmain_menu.pngR2i273078R3R68R5R129R13tgoR0y31:assets%2Fimages%2Fmain_menu.xmlR2i4734R3R12R5R130R13tgoR0y28:assets%2Fimages%2FmenuBG.pngR2i620342R3R68R5R131R13tgoR0y32:assets%2Fimages%2FmenuBGBlue.pngR2i614586R3R68R5R132R13tgoR0y35:assets%2Fimages%2FmenuBGMagenta.pngR2i553468R3R68R5R133R13tgoR0y31:assets%2Fimages%2FmenuDesat.pngR2i357911R3R68R5R134R13tgoR0y31:assets%2Fimages%2FmikuDance.pngR2i712620R3R68R5R135R13tgoR0y31:assets%2Fimages%2FmikuDance.xmlR2i4170R3R12R5R136R13tgoR0y37:assets%2Fimages%2Fnewgrounds_logo.pngR2i57747R3R68R5R137R13tgoR0y26:assets%2Fimages%2Fnum0.pngR2i3738R3R68R5R138R13tgoR0y26:assets%2Fimages%2Fnum1.pngR2i3390R3R68R5R139R13tgoR0y26:assets%2Fimages%2Fnum2.pngR2i3990R3R68R5R140R13tgoR0y26:assets%2Fimages%2Fnum3.pngR2i4022R3R68R5R141R13tgoR0y26:assets%2Fimages%2Fnum4.pngR2i3989R3R68R5R142R13tgoR0y26:assets%2Fimages%2Fnum5.pngR2i4113R3R68R5R143R13tgoR0y26:assets%2Fimages%2Fnum6.pngR2i4181R3R68R5R144R13tgoR0y26:assets%2Fimages%2Fnum7.pngR2i3692R3R68R5R145R13tgoR0y26:assets%2Fimages%2Fnum8.pngR2i3914R3R68R5R146R13tgoR0y26:assets%2Fimages%2Fnum9.pngR2i3687R3R68R5R147R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek0.pngR2i7056R3R68R5R148R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek1.pngR2i6261R3R68R5R149R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek2.pngR2i6517R3R68R5R150R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek3.pngR2i7148R3R68R5R151R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek4.pngR2i6262R3R68R5R152R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek5.pngR2i6440R3R68R5R153R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek6.pngR2i8979R3R68R5R154R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek7.pngR2i7349R3R68R5R155R13tgoR0y39:assets%2Fimages%2Fstorymenu%2Fweek8.pngR2i16577R3R68R5R156R13tgoR0y32:assets%2Fimages%2FtitleEnter.pngR2i1358706R3R68R5R157R13tgoR0y32:assets%2Fimages%2FtitleEnter.xmlR2i4880R3R12R5R158R13tgoR0y38:assets%2Fmusic%2FenduranceCutscene.mp4R2i1726569R3R4R5R159R13tgoR2i2309657R3y5:MUSICR5y31:assets%2Fmusic%2FfreakyMenu.mp3y9:pathGroupaR161hR13tgoR0y33:assets%2Fmusic%2FgunsCutscene.mp4R2i1815170R3R4R5R163R13tgoR0y33:assets%2Fmusic%2FloidCutscene.mp4R2i1721950R3R4R5R164R13tgoR0y35:assets%2Fmusic%2FstressCutscene.mp4R2i6957069R3R4R5R165R13tgoR0y32:assets%2Fmusic%2FughCutscene.mp4R2i2320865R3R4R5R166R13tgoR0y33:assets%2Fmusic%2FvocaCutscene.mp4R2i1354072R3R4R5R167R13tgoR2i17762R3R160R5y32:assets%2Fsounds%2FcancelMenu.mp3R162aR168hR13tgoR2i91950R3R160R5y33:assets%2Fsounds%2FconfirmMenu.mp3R162aR169hR13tgoR2i17762R3R160R5y32:assets%2Fsounds%2FscrollMenu.mp3R162aR170hR13tgoR0y17:locales%2FLICENSER2i11357R3R12R5R171R13tgoR0y19:locales%2FREADME.mdR2i146R3R12R5R172R13tgoR0y50:locales%2Fde-DE%2Fassets%2Fimages%2FtitleEnter.pngR2i1679917R3R68R5R173R13tgoR0y50:locales%2Fde-DE%2Fassets%2Fimages%2FtitleEnter.xmlR2i4868R3R12R5R174R13tgoR0y29:locales%2Fde-DE%2Fdiscord.tsvR2i196R3R12R5R175R13tgoR0y29:locales%2Fde-DE%2Foptions.tsvR2i485R3R12R5R176R13tgoR0y29:locales%2Fen-US%2Fdiscord.tsvR2i218R3R12R5R177R13tgoR0y29:locales%2Fen-US%2Foptions.tsvR2i436R3R12R5R178R13tgoR0y29:locales%2Ffr-FR%2Fdiscord.tsvR2i235R3R12R5R179R13tgoR0y29:locales%2Ffr-FR%2Foptions.tsvR2i495R3R12R5R180R13tgoR0y19:locales%2Findex.xmlR2i1970R3R12R5R181R13tgoR0y48:mods%2FintroMod%2F_append%2Fdata%2FintroText.txtR2i20R3R12R5R182goR0y36:mods%2FintroMod%2F_polymod_meta.jsonR2i285R3R12R5R183goR0y21:do%20NOT%20readme.txtR2i4326R3R12R5R184R13tgoR0y13:changelog.txtR2i8079R3R12R5R185R13tgoR0y34:assets%2Ffonts%2Ffonts-go-here.txtR2i67R3R12R5R186R13tgoR2i51996R3y4:FONTy9:classNamey32:__ASSET__assets_fonts_funkin_otfR5y27:assets%2Ffonts%2Ffunkin.otfR13tgoR2i14656R3R187R188y31:__ASSET__assets_fonts_pixel_otfR5y26:assets%2Ffonts%2Fpixel.otfR13tgoR2i75864R3R187R188y29:__ASSET__assets_fonts_vcr_ttfR5y24:assets%2Ffonts%2Fvcr.ttfR13tgoR2i2114R3R160R5y26:flixel%2Fsounds%2Fbeep.mp3R162aR195y26:flixel%2Fsounds%2Fbeep.ogghR13tgoR2i39706R3R160R5y28:flixel%2Fsounds%2Fflixel.mp3R162aR197y28:flixel%2Fsounds%2Fflixel.ogghR13tgoR2i5794R3y5:SOUNDR5R196R162aR195R196hgoR2i33629R3R199R5R198R162aR197R198hgoR2i15744R3R187R188y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR13tgoR2i29724R3R187R188y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR13tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R68R5R204R13tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R68R5R205R13tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R68R5R206R13tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R68R5R207R13tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R68R5R208R13tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R68R5R209R13tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R68R5R210R13tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R68R5R211R13tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R68R5R212R13tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R68R5R213R13tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R68R5R214R13tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R68R5R215R13tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R68R5R216R13tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R68R5R217R13tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R68R5R218R13tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R68R5R219R13tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R68R5R220R13tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R68R5R221R13tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R68R5R222R13tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R68R5R223R13tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R68R5R224R13tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R68R5R225R13tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R68R5R226R13tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R68R5R227R13tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R68R5R228R13tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R68R5R229R13tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R68R5R230R13tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R68R5R231R13tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R68R5R232R13tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R12R5R233R13tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R12R5R234R13tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R12R5R235R13tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_endurancecutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_gunscutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_loidcutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_stresscutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_ughcutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_preload_music_vocacutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_characterlist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_controls_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_creds_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_endlesslyrics_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_freeplaysonglist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_gflist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_introtext_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_main_view_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_2hot_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_aishite_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_blammed_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_bopeebo_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_chug_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_cocoa_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_dadbattle_erect_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_dadbattle_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_darnell_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_disappearance_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_eggnog_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_endless_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_endurance_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_fresh_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_guns_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_high_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_infinite_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_lit_up_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_loid_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_milf_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_monster_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_philly_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_pico_speaker_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_pico_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_popipo_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_roses_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_run_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_satin_panties_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_sekai_wa_mada_hajimatte_sura_inai_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_senpai_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_siu_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_south_erect_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_south_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_spookeez_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_stress_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_target_practice_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_thorns_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_tutorial__miku_edition__json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_tutorial_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_ugh_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_voca_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_songs_winter_horrorland_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_specialthanks_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_stagelist_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_note_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_note_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_songs_songstart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_songs_songstart_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_spritemap1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_spritemap1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_spritemap1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_spritemap1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_spritemap1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_spritemap1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_spritemap1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_spritemap1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_spritemap1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_spritemap1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_characters_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_characters_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_campaign_ui_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_chance_perfect_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_chance_perfect_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_checkboxthingie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_checkboxthingie_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dotart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fonts_bold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fonts_bold_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fonts_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fonts_default_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_funkay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdancetitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdancetitle_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_old_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_carol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_dad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_darnell_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_face_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_gf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_miku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_mom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_monika_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_monster_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_parents_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_pico_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_senpai_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_spirit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_spooky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_tankman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_tricky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_logobumpin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_logobumpin_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_main_menu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_main_menu_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menubg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menubgblue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menubgmagenta_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menudesat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mikudance_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mikudance_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_newgrounds_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_num9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_titleenter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_titleenter_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_endurancecutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_freakymenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_gunscutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_loidcutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_stresscutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ughcutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_vocacutscene_mp4 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_cancelmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_confirmmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_scrollmenu_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_license extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_readme_md extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_de_de_assets_images_titleenter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_de_de_assets_images_titleenter_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_de_de_discord_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_de_de_options_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_en_us_discord_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_en_us_options_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_fr_fr_discord_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_fr_fr_options_tsv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__locales_index_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_scripts_states_playstate_hxs extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_2hot_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_2hot_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aishite_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aishite_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_chug_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_chug_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_erect_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_darnell_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_darnell_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_disappearance_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_disappearance_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_endless_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_endless_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_endurance_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_endurance_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_guns_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_guns_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_high_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_high_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_infinite_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_infinite_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_lit_up_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_lit_up_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_loid_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_loid_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_milf_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_milf_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_monster_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_monster_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_philly_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_philly_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_pico_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_pico_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_popipo_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_popipo_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_roses_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_roses_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_run_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_run_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_sekai_wa_mada_hajimatte_sura_inai_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_siu_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_siu_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_south_erect_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_south_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_south_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_stress_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_stress_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_target_practice_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_target_practice_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_test_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_test_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial__miku_edition__inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial__miku_edition__voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_voca_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_voca_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_inst_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_voices_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_backspace_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_backspace_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_caroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_christmasoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_holding_gf_deadoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_holding_gfoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_pixel_deadoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_pixeloffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_vocaoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_carol_speaker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_carol_speaker_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_dadoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnell_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnell_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnelloffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_mad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_mad_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_caroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_christmasoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_pixeloffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_miku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_miku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_miku_vocaoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mikuoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_caroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monika_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monika_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monikaoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_christmasoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsteroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_nene_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_nene_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_parents_christmasoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_speakeroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picooffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picoplayeroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_angryoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpaioffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_speakeroffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spiritoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spookyoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmanoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_trickyoffsets_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tricky_miku_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tricky_miku_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_bf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_bf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_gf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_gf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_miku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_miku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_pixelportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_pixelportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_grafix_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_lol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_lose_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_lose_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_opensauceforever_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pausebg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_arrowends_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_arrows_pixels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_notesplashes_pixels_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_notesplashes_pixels_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_restart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_screencaptierimage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_talking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_talking_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stage_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stageback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagecurtains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagefront_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_week54prototype_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_zzzzzzzz_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_givealilbitback_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_smileface_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_awww_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_crowd_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_lights_shut_off_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_lights_turn_on_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_senpai_dies_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_carpass0_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_carpass1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_pixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_pixeltext_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_thunder_1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_thunder_2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_train_passes_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_stage_stage_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_spooky_images_halloween_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_spooky_images_halloween_bg_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_spooky_spooky_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_behindtrain_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_city_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_street_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_train_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_images_win_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_philly_philly_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_bglimo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_bglimo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_dumb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_fastcarlol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_highwaylight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_highwaylight_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancer_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancerragdoll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancerragdoll_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodrive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodrive_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limooverlay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_images_limosunset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_limo_limo_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_bgescalator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_bgwalls_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_bottombop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_bottombop_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_christmastree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_christmaswall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_fgsnow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_santa_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_santa_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_upperbop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_images_upperbop_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_mall_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_evilbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_evilsnow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_eviltree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_mall_evil_mall_evil_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_bgfreaks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_bgfreaks_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_dialoguebox_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_dialoguebox_pixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpai_angryportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpai_angryportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpaiportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpaiportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_evilschoolbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_evilschoolfg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_petals_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_petals_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_senpaicrazy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_senpaicrazy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebschool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebstreet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtrees_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtrees_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtreesback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_music_angry_text_box_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_music_lunchbox_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_school_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_dialoguebox_evil_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_dialoguebox_evil_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_spiritportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_spiritportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_evilschoolbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_evilschoolfg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_senpaicrazy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_senpaicrazy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_music_lunchboxscary_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_school_evil_school_evil_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeleft_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeright_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank0_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank3_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank4_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank5_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankbuildings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankclouds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmountains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankrolling_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankrolling_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankruins_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tanksky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankwatchtower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankwatchtower_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmankilled1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmankilled1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_music_distorto_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_bfbeep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_10_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_11_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_12_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_13_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_14_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_15_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_16_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_17_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_18_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_19_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_20_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_21_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_22_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_23_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_24_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_25_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_5_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_6_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_7_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_8_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_9_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_killyou_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_song3censor_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_stresscutscene_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_tanksong2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_wellwellwell_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_tank_tank_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_carol_speaker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_carol_speaker_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_blacksocool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_endless_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_endless_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_focus_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_crowdbump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_crowdbump_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_gf_miku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_gf_miku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_meekootex_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_meekootex_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_mikufans_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_mikufans_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_sadmiku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_sadmiku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_spotlightdance_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_spotlightdance_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_crowd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_crowd_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_hell_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_gf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_gf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_lights_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_lights_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_songs_songstart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_songs_songstart_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_carol_speaker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_carol_speaker_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_perfect_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_perfect_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_blacksocool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_endless_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_endless_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_focus_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_crowdbump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_crowdbump_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_gf_miku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_gf_miku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_meekootex_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_meekootex_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mikufans_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mikufans_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_sadmiku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_sadmiku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_spotlightdance_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_spotlightdance_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_crowd_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_crowd_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_hell_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_voca_lights_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_voca_lights_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_songs_songstart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_songs_songstart_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_perfect_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_perfect_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_blacksocool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_endless_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_endless_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_focus_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_crowdbump_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_crowdbump_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_meekootex_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_meekootex_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_mikufans_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_mikufans_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_sadmiku_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_sadmiku_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_spotlightdance_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_spotlightdance_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_endless_images_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_songs_songstart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_songs_songstart_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_backlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_bunch_of_simps_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_bunch_of_simps_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_concerttop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_mainstage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_nightsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_speakers_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_spotlightdance_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_spotlightdance_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_concert_images_stadiumback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__mods_intromod__append_data_introtext_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__mods_intromod__polymod_meta_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__changelog_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_funkin_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_locales_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_scripts_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_songs_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_shared_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_stage_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_spooky_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_philly_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_limo_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_mall_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_mall_evil_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_school_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_school_evil_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_tank_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_expo_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_expo_two_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_concert_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_endless_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/preload/data/characterList.txt") @:noCompletion #if display private #end class __ASSET__assets_data_characterlist_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/controls.txt") @:noCompletion #if display private #end class __ASSET__assets_data_controls_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/creds.txt") @:noCompletion #if display private #end class __ASSET__assets_data_creds_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/endlessLyrics.txt") @:noCompletion #if display private #end class __ASSET__assets_data_endlesslyrics_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/freeplaySonglist.txt") @:noCompletion #if display private #end class __ASSET__assets_data_freeplaysonglist_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/gfList.txt") @:noCompletion #if display private #end class __ASSET__assets_data_gflist_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/introText.txt") @:noCompletion #if display private #end class __ASSET__assets_data_introtext_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/main-view.xml") @:noCompletion #if display private #end class __ASSET__assets_data_main_view_xml extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/2hot.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_2hot_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/aishite.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_aishite_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/blammed.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_blammed_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/bopeebo.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_bopeebo_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/chug.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_chug_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/cocoa.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_cocoa_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/dadbattle-erect.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_dadbattle_erect_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/dadbattle.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_dadbattle_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/darnell.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_darnell_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/disappearance.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_disappearance_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/eggnog.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_eggnog_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/endless.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_endless_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/endurance.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_endurance_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/fresh.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_fresh_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/guns.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_guns_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/high.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_high_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/infinite.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_infinite_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/lit-up.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_lit_up_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/loid.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_loid_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/milf.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_milf_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/monster.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_monster_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/philly.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_philly_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/pico-speaker.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_pico_speaker_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/pico.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_pico_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/popipo.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_popipo_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/roses.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_roses_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/run.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_run_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/satin-panties.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_satin_panties_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/sekai-wa-mada-hajimatte-sura-inai.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_sekai_wa_mada_hajimatte_sura_inai_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/senpai.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_senpai_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/siu.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_siu_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/south-erect.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_south_erect_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/south.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_south_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/spookeez.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_spookeez_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/stress.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_stress_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/target-practice.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_target_practice_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/test.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_test_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/thorns.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_thorns_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/tutorial-(miku-edition).json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_tutorial__miku_edition__json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/tutorial.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_tutorial_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/ugh.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_ugh_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/voca.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_voca_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/songs/winter-horrorland.json") @:noCompletion #if display private #end class __ASSET__assets_data_songs_winter_horrorland_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/specialThanks.txt") @:noCompletion #if display private #end class __ASSET__assets_data_specialthanks_txt extends haxe.io.Bytes {}
@:keep @:file("assets/preload/data/stageList.txt") @:noCompletion #if display private #end class __ASSET__assets_data_stagelist_txt extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/NOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_images_note_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/NOTE_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_images_note_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/Songs/songstart.png") @:noCompletion #if display private #end class __ASSET__assets_images_songs_songstart_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/Songs/songstart.xml") @:noCompletion #if display private #end class __ASSET__assets_images_songs_songstart_xml extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/gfDemon/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/gfDemon/spritemap1.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_spritemap1_json extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/atlases/gfDemon/spritemap1.png") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_gfdemon_spritemap1_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/atlases/picoShoot/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/picoShoot/spritemap1.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_spritemap1_json extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/atlases/picoShoot/spritemap1.png") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_picoshoot_spritemap1_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/atlases/stressCutscene/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/stressCutscene/spritemap1.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_spritemap1_json extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/atlases/stressCutscene/spritemap1.png") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_stresscutscene_spritemap1_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/atlases/tankTalkSong/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/tankTalkSong/spritemap1.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_spritemap1_json extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/atlases/tankTalkSong/spritemap1.png") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tanktalksong_spritemap1_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/atlases/tightBars/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/preload/images/atlases/tightBars/spritemap1.json") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_spritemap1_json extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/atlases/tightBars/spritemap1.png") @:noCompletion #if display private #end class __ASSET__assets_images_atlases_tightbars_spritemap1_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/campaign_menu_UI_assets.png") @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/campaign_menu_UI_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/campaign_menu_UI_characters.png") @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_characters_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/campaign_menu_UI_characters.xml") @:noCompletion #if display private #end class __ASSET__assets_images_campaign_menu_ui_characters_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/campaign_ui_arrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_campaign_ui_arrow_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/chance/Perfect.png") @:noCompletion #if display private #end class __ASSET__assets_images_chance_perfect_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/chance/Perfect.xml") @:noCompletion #if display private #end class __ASSET__assets_images_chance_perfect_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/checkboxThingie.png") @:noCompletion #if display private #end class __ASSET__assets_images_checkboxthingie_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/checkboxThingie.xml") @:noCompletion #if display private #end class __ASSET__assets_images_checkboxthingie_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/dotArt.png") @:noCompletion #if display private #end class __ASSET__assets_images_dotart_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/fonts/bold.png") @:noCompletion #if display private #end class __ASSET__assets_images_fonts_bold_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/fonts/bold.xml") @:noCompletion #if display private #end class __ASSET__assets_images_fonts_bold_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/fonts/default.png") @:noCompletion #if display private #end class __ASSET__assets_images_fonts_default_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/fonts/default.xml") @:noCompletion #if display private #end class __ASSET__assets_images_fonts_default_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/funkay.png") @:noCompletion #if display private #end class __ASSET__assets_images_funkay_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/gfDanceTitle.png") @:noCompletion #if display private #end class __ASSET__assets_images_gfdancetitle_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/gfDanceTitle.xml") @:noCompletion #if display private #end class __ASSET__assets_images_gfdancetitle_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/gfdemon1.png") @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon1_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/gfdemon1.xml") @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/gfdemon2.png") @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon2_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/gfdemon2.xml") @:noCompletion #if display private #end class __ASSET__assets_images_gfdemon2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/icons/icon-bf-old.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_old_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-bf-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-bf.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_bf_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-carol.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_carol_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-dad.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_dad_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-darnell.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_darnell_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-face.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_face_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-gf.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_gf_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-miku.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_miku_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-mom.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_mom_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-monika.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_monika_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-monster.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_monster_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-parents.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_parents_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-pico.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_pico_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-senpai.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_senpai_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-spirit.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_spirit_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-spooky.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_spooky_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-tankman.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_tankman_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/icons/icon-tricky.png") @:noCompletion #if display private #end class __ASSET__assets_images_icons_icon_tricky_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/logoBumpin.png") @:noCompletion #if display private #end class __ASSET__assets_images_logobumpin_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/logoBumpin.xml") @:noCompletion #if display private #end class __ASSET__assets_images_logobumpin_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/main_menu.png") @:noCompletion #if display private #end class __ASSET__assets_images_main_menu_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/main_menu.xml") @:noCompletion #if display private #end class __ASSET__assets_images_main_menu_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/menuBG.png") @:noCompletion #if display private #end class __ASSET__assets_images_menubg_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/menuBGBlue.png") @:noCompletion #if display private #end class __ASSET__assets_images_menubgblue_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/menuBGMagenta.png") @:noCompletion #if display private #end class __ASSET__assets_images_menubgmagenta_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/menuDesat.png") @:noCompletion #if display private #end class __ASSET__assets_images_menudesat_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/mikuDance.png") @:noCompletion #if display private #end class __ASSET__assets_images_mikudance_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/mikuDance.xml") @:noCompletion #if display private #end class __ASSET__assets_images_mikudance_xml extends haxe.io.Bytes {}
@:keep @:image("assets/preload/images/newgrounds_logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_newgrounds_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num0.png") @:noCompletion #if display private #end class __ASSET__assets_images_num0_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num1.png") @:noCompletion #if display private #end class __ASSET__assets_images_num1_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num2.png") @:noCompletion #if display private #end class __ASSET__assets_images_num2_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num3.png") @:noCompletion #if display private #end class __ASSET__assets_images_num3_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num4.png") @:noCompletion #if display private #end class __ASSET__assets_images_num4_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num5.png") @:noCompletion #if display private #end class __ASSET__assets_images_num5_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num6.png") @:noCompletion #if display private #end class __ASSET__assets_images_num6_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num7.png") @:noCompletion #if display private #end class __ASSET__assets_images_num7_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num8.png") @:noCompletion #if display private #end class __ASSET__assets_images_num8_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/num9.png") @:noCompletion #if display private #end class __ASSET__assets_images_num9_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week0.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week0_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week1.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week1_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week2.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week2_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week3.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week3_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week4.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week4_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week5.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week5_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week6.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week6_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week7.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week7_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/storymenu/week8.png") @:noCompletion #if display private #end class __ASSET__assets_images_storymenu_week8_png extends lime.graphics.Image {}
@:keep @:image("assets/preload/images/titleEnter.png") @:noCompletion #if display private #end class __ASSET__assets_images_titleenter_png extends lime.graphics.Image {}
@:keep @:file("assets/preload/images/titleEnter.xml") @:noCompletion #if display private #end class __ASSET__assets_images_titleenter_xml extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/enduranceCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_endurancecutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/freakyMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_freakymenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/gunsCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_gunscutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/loidCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_loidcutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/stressCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_stresscutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/ughCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_ughcutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/music/vocaCutscene.mp4") @:noCompletion #if display private #end class __ASSET__assets_music_vocacutscene_mp4 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/sounds/cancelMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_cancelmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/sounds/confirmMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_confirmmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/preload/sounds/scrollMenu.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_scrollmenu_mp3 extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/LICENSE") @:noCompletion #if display private #end class __ASSET__locales_license extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/README.md") @:noCompletion #if display private #end class __ASSET__locales_readme_md extends haxe.io.Bytes {}
@:keep @:image("Dot-Engine.Locales/de-DE/assets/images/titleEnter.png") @:noCompletion #if display private #end class __ASSET__locales_de_de_assets_images_titleenter_png extends lime.graphics.Image {}
@:keep @:file("Dot-Engine.Locales/de-DE/assets/images/titleEnter.xml") @:noCompletion #if display private #end class __ASSET__locales_de_de_assets_images_titleenter_xml extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/de-DE/discord.tsv") @:noCompletion #if display private #end class __ASSET__locales_de_de_discord_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/de-DE/options.tsv") @:noCompletion #if display private #end class __ASSET__locales_de_de_options_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/en-US/discord.tsv") @:noCompletion #if display private #end class __ASSET__locales_en_us_discord_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/en-US/options.tsv") @:noCompletion #if display private #end class __ASSET__locales_en_us_options_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/fr-FR/discord.tsv") @:noCompletion #if display private #end class __ASSET__locales_fr_fr_discord_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/fr-FR/options.tsv") @:noCompletion #if display private #end class __ASSET__locales_fr_fr_options_tsv extends haxe.io.Bytes {}
@:keep @:file("Dot-Engine.Locales/index.xml") @:noCompletion #if display private #end class __ASSET__locales_index_xml extends haxe.io.Bytes {}
@:keep @:file("assets/scripts/states/PlayState.hxs") @:noCompletion #if display private #end class __ASSET__assets_scripts_states_playstate_hxs extends haxe.io.Bytes {}
@:keep @:file("assets/songs/2hot/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_2hot_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/2hot/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_2hot_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/aishite/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_aishite_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/aishite/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_aishite_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/blammed/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/blammed/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/bopeebo/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/bopeebo/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/chug/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_chug_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/chug/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_chug_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/cocoa/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/cocoa/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/dadbattle-erect/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_erect_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/dadbattle/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/dadbattle/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_dadbattle_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/darnell/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_darnell_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/darnell/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_darnell_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/disappearance/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_disappearance_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/disappearance/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_disappearance_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/eggnog/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/eggnog/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/endless/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_endless_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/endless/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_endless_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/endurance/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_endurance_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/endurance/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_endurance_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/fresh/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/fresh/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/guns/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_guns_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/guns/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_guns_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/high/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_high_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/high/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_high_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/infinite/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_infinite_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/infinite/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_infinite_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/lit-up/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_lit_up_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/lit-up/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_lit_up_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/loid/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_loid_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/loid/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_loid_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/milf/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_milf_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/milf/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_milf_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/monster/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_monster_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/monster/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_monster_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/philly/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_philly_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/philly/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_philly_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/pico/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_pico_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/pico/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_pico_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/popipo/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_popipo_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/popipo/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_popipo_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/roses/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_roses_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/roses/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_roses_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/run/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_run_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/run/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_run_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/satin-panties/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/satin-panties/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/sekai-wa-mada-hajimatte-sura-inai/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_sekai_wa_mada_hajimatte_sura_inai_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/senpai/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/senpai/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/siu/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_siu_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/siu/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_siu_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/south-erect/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_south_erect_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/south/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_south_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/south/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_south_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/spookeez/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/spookeez/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/stress/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_stress_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/stress/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_stress_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/target-practice/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_target_practice_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/target-practice/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_target_practice_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/test/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_test_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/test/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_test_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/thorns/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/thorns/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/tutorial-(miku-edition)/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial__miku_edition__inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/tutorial-(miku-edition)/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial__miku_edition__voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/tutorial/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/ugh/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/ugh/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/voca/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_voca_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/voca/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_voca_voices_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/winter-horrorland/Inst.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_inst_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/winter-horrorland/Voices.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_voices_mp3 extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/backspace.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_backspace_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/backspace.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_backspace_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/bad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/characters/BOYFRIEND.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/BOYFRIEND.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/DADDY_DEAREST.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/DADDY_DEAREST.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/GF_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/GF_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Mom_Assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Mom_Assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Monster_Assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Monster_Assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Pico_FNF_assetss.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Pico_FNF_assetss.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-carOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_caroffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-christmasOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_christmasoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-holding-gf-deadOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_holding_gf_deadoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-holding-gfOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_holding_gfoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-pixel-deadOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_pixel_deadoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-pixelOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_pixeloffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bf-vocaOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bf_vocaoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfAndGF.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfAndGF.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfHoldingGF-DEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfHoldingGF-DEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bfHoldingGF.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/bfOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfPixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfPixel.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfPixelsDEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfPixelsDEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/carol_speaker.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_carol_speaker_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/carol_speaker.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_carol_speaker_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/dadOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_dadoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/darnell.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnell_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/darnell.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnell_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/darnellOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_darnelloffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/ev_miku_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/ev_miku_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/ev_miku_mad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_mad_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/ev_miku_mad.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_ev_miku_mad_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/gf-carOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_caroffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/gf-christmasOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_christmasoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/gf-pixelOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_pixeloffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/gfOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfPixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfPixel.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfTankmen.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfTankmen.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gf_miku.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_miku_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gf_miku.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_miku_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/miku-vocaOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_miku_vocaoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/mikuOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mikuoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/mom-carOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_caroffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/momCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/momCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/momOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/mom_dad_christmas_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/mom_dad_christmas_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/monika.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monika_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/monika.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monika_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/monikaOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monikaoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/monster-christmasOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_christmasoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/monsterChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/monsterChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/monsterOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsteroffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/nene.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_nene_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/nene.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_nene_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/parents-christmasOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_parents_christmasoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/pico-speakerOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_speakeroffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/picoOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picooffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/picoPlayerOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picoplayeroffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/picoSpeaker.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/picoSpeaker.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/senpai-angryOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_angryoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/senpai.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/senpai.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/senpaiOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpaioffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/speakerOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_speakeroffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/spirit.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/spirit.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/spiritOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spiritoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/spookyOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spookyoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/spooky_kids_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/spooky_kids_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/tankmanCaptain.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/tankmanCaptain.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/tankmanOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmanoffsets_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/trickyOffsets.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_trickyoffsets_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/tricky_miku_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tricky_miku_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/tricky_miku_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tricky_miku_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/voca_bf.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_bf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/voca_bf.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_bf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/voca_gf.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_gf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/voca_gf.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_gf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/voca_miku.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_miku_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/voca_miku.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_voca_miku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/combo.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/dialogue/bf-pixelPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_pixelportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/bf-pixelPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_pixelportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/go.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/good.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/grafix.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_grafix_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/lol.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_lol_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/lose.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_lose_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/lose.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_lose_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noteSplashes.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/opensauceforever.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_opensauceforever_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pauseAlt/bfLol.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/pauseAlt/bfLol.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pauseAlt/pauseBG.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pausebg_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pauseAlt/pauseUI.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/pauseAlt/pauseUI.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pixelUI/arrowEnds.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_arrowends_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/arrows-pixels.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_arrows_pixels_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/bad-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/combo-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/date-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/good-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/noteSplashes-pixels.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_notesplashes_pixels_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/pixelUI/noteSplashes-pixels.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_notesplashes_pixels_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pixelUI/num0-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num1-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num2-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num3-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num4-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num5-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num6-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num7-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num8-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num9-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/ready-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/set-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/shit-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/sick-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/ready.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/restart.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_restart_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/screencapTierImage.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_screencaptierimage_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/set.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/shit.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/sick.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/speech_bubble_talking.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_talking_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/speech_bubble_talking.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_talking_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/stage_light.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stage_light_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stageback.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stageback_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stagecurtains.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagecurtains_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stagefront.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagefront_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/week54prototype.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_week54prototype_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/zzzzzzzz.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_zzzzzzzz_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/music/breakfast.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOver-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOver.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOverEnd-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOverEnd.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/giveALilBitBack.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_givealilbitback_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/smileFace.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_music_smileface_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY_TEXT_BOX.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Awww.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_awww_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Crowd.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_crowd_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_4.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Lights_Shut_off.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_lights_shut_off_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Lights_Turn_On.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_lights_turn_on_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Senpai_Dies.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_senpai_dies_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/carPass0.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_carpass0_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/carPass1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_carpass1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/clickText.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/fnf_loss_sfx-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/fnf_loss_sfx.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro1-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro2-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro3-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/introGo-pixel.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_pixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/introGo.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote3.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/pixelText.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_pixeltext_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/soundTest.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/thunder_1.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_thunder_1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/thunder_2.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_thunder_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/train_passes.mp3") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_train_passes_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/stage/stage_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_stage_stage_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/spooky/images/halloween_bg.png") @:noCompletion #if display private #end class __ASSET__assets_spooky_images_halloween_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/spooky/images/halloween_bg.xml") @:noCompletion #if display private #end class __ASSET__assets_spooky_images_halloween_bg_xml extends haxe.io.Bytes {}
@:keep @:file("assets/spooky/spooky_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_spooky_spooky_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/philly/images/behindTrain.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_behindtrain_png extends lime.graphics.Image {}
@:keep @:image("assets/philly/images/city.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_city_png extends lime.graphics.Image {}
@:keep @:image("assets/philly/images/sky.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_sky_png extends lime.graphics.Image {}
@:keep @:image("assets/philly/images/street.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_street_png extends lime.graphics.Image {}
@:keep @:image("assets/philly/images/train.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_train_png extends lime.graphics.Image {}
@:keep @:image("assets/philly/images/win.png") @:noCompletion #if display private #end class __ASSET__assets_philly_images_win_png extends lime.graphics.Image {}
@:keep @:file("assets/philly/philly_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_philly_philly_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/bgLimo.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_bglimo_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/images/bgLimo.xml") @:noCompletion #if display private #end class __ASSET__assets_limo_images_bglimo_xml extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/dumb.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_dumb_png extends lime.graphics.Image {}
@:keep @:image("assets/limo/images/fastCarLol.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_fastcarlol_png extends lime.graphics.Image {}
@:keep @:image("assets/limo/images/highwayLight.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_highwaylight_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/images/highwayLight.xml") @:noCompletion #if display private #end class __ASSET__assets_limo_images_highwaylight_xml extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/limoDancer.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancer_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/images/limoDancer.xml") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancer_xml extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/limoDancerRagdoll.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancerragdoll_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/images/limoDancerRagdoll.xml") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodancerragdoll_xml extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/limoDrive.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodrive_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/images/limoDrive.xml") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limodrive_xml extends haxe.io.Bytes {}
@:keep @:image("assets/limo/images/limoOverlay.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limooverlay_png extends lime.graphics.Image {}
@:keep @:image("assets/limo/images/limoSunset.png") @:noCompletion #if display private #end class __ASSET__assets_limo_images_limosunset_png extends lime.graphics.Image {}
@:keep @:file("assets/limo/limo_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_limo_limo_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/mall/images/bgEscalator.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_bgescalator_png extends lime.graphics.Image {}
@:keep @:image("assets/mall/images/bgWalls.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_bgwalls_png extends lime.graphics.Image {}
@:keep @:image("assets/mall/images/bottomBop.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_bottombop_png extends lime.graphics.Image {}
@:keep @:file("assets/mall/images/bottomBop.xml") @:noCompletion #if display private #end class __ASSET__assets_mall_images_bottombop_xml extends haxe.io.Bytes {}
@:keep @:image("assets/mall/images/christmasTree.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_christmastree_png extends lime.graphics.Image {}
@:keep @:image("assets/mall/images/christmasWall.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_christmaswall_png extends lime.graphics.Image {}
@:keep @:image("assets/mall/images/fgSnow.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_fgsnow_png extends lime.graphics.Image {}
@:keep @:image("assets/mall/images/santa.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_santa_png extends lime.graphics.Image {}
@:keep @:file("assets/mall/images/santa.xml") @:noCompletion #if display private #end class __ASSET__assets_mall_images_santa_xml extends haxe.io.Bytes {}
@:keep @:image("assets/mall/images/upperBop.png") @:noCompletion #if display private #end class __ASSET__assets_mall_images_upperbop_png extends lime.graphics.Image {}
@:keep @:file("assets/mall/images/upperBop.xml") @:noCompletion #if display private #end class __ASSET__assets_mall_images_upperbop_xml extends haxe.io.Bytes {}
@:keep @:file("assets/mall/mall_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_mall_mall_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/mall-evil/images/evilBG.png") @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_evilbg_png extends lime.graphics.Image {}
@:keep @:image("assets/mall-evil/images/evilSnow.png") @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_evilsnow_png extends lime.graphics.Image {}
@:keep @:image("assets/mall-evil/images/evilTree.png") @:noCompletion #if display private #end class __ASSET__assets_mall_evil_images_eviltree_png extends lime.graphics.Image {}
@:keep @:file("assets/mall-evil/mall-evil_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_mall_evil_mall_evil_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/bgFreaks.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_bgfreaks_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/bgFreaks.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_bgfreaks_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/dialogue/dialogueBox-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_dialoguebox_pixel_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/dialogue/dialogueBox-pixel.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_dialoguebox_pixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/dialogue/senpai-angryPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpai_angryportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/dialogue/senpai-angryPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpai_angryportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/dialogue/senpaiPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpaiportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/dialogue/senpaiPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_dialogue_senpaiportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/evilSchoolBG.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_evilschoolbg_png extends lime.graphics.Image {}
@:keep @:image("assets/school/images/evilSchoolFG.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_evilschoolfg_png extends lime.graphics.Image {}
@:keep @:image("assets/school/images/petals.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_petals_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/petals.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_petals_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/senpaiCrazy.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_senpaicrazy_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/senpaiCrazy.xml") @:noCompletion #if display private #end class __ASSET__assets_school_images_senpaicrazy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/weebSchool.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebschool_png extends lime.graphics.Image {}
@:keep @:image("assets/school/images/weebSky.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebsky_png extends lime.graphics.Image {}
@:keep @:image("assets/school/images/weebStreet.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebstreet_png extends lime.graphics.Image {}
@:keep @:image("assets/school/images/weebTrees.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtrees_png extends lime.graphics.Image {}
@:keep @:file("assets/school/images/weebTrees.txt") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtrees_txt extends haxe.io.Bytes {}
@:keep @:image("assets/school/images/weebTreesBack.png") @:noCompletion #if display private #end class __ASSET__assets_school_images_weebtreesback_png extends lime.graphics.Image {}
@:keep @:file("assets/school/music/ANGRY_TEXT_BOX.mp3") @:noCompletion #if display private #end class __ASSET__assets_school_music_angry_text_box_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/school/music/Lunchbox.mp3") @:noCompletion #if display private #end class __ASSET__assets_school_music_lunchbox_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/school/school_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_school_school_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/school-evil/images/dialogue/dialogueBox-evil.png") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_dialoguebox_evil_png extends lime.graphics.Image {}
@:keep @:file("assets/school-evil/images/dialogue/dialogueBox-evil.xml") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_dialoguebox_evil_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school-evil/images/dialogue/spiritPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_spiritportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/school-evil/images/dialogue/spiritPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_dialogue_spiritportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/school-evil/images/evilSchoolBG.png") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_evilschoolbg_png extends lime.graphics.Image {}
@:keep @:image("assets/school-evil/images/evilSchoolFG.png") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_evilschoolfg_png extends lime.graphics.Image {}
@:keep @:image("assets/school-evil/images/senpaiCrazy.png") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_senpaicrazy_png extends lime.graphics.Image {}
@:keep @:file("assets/school-evil/images/senpaiCrazy.xml") @:noCompletion #if display private #end class __ASSET__assets_school_evil_images_senpaicrazy_xml extends haxe.io.Bytes {}
@:keep @:file("assets/school-evil/music/LunchboxScary.mp3") @:noCompletion #if display private #end class __ASSET__assets_school_evil_music_lunchboxscary_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/school-evil/school-evil_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_school_evil_school_evil_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/smokeLeft.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeleft_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/smokeLeft.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeleft_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/smokeRight.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeright_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/smokeRight.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_smokeright_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank0.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank0_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank0.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank0_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank1.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank1_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank1.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank2.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank2_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank2.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank3.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank3_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank3.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank3_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank4.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank4_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank4.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank4_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tank5.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank5_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tank5.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tank5_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tankBuildings.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankbuildings_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankClouds.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankclouds_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankGround.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankground_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankMountains.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmountains_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankRolling.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankrolling_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tankRolling.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankrolling_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tankRuins.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankruins_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankSky.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tanksky_png extends lime.graphics.Image {}
@:keep @:image("assets/tank/images/tankWatchtower.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankwatchtower_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tankWatchtower.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankwatchtower_xml extends haxe.io.Bytes {}
@:keep @:image("assets/tank/images/tankmanKilled1.png") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmankilled1_png extends lime.graphics.Image {}
@:keep @:file("assets/tank/images/tankmanKilled1.xml") @:noCompletion #if display private #end class __ASSET__assets_tank_images_tankmankilled1_xml extends haxe.io.Bytes {}
@:keep @:file("assets/tank/music/DISTORTO.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_music_distorto_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/bfBeep.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_bfbeep_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-1.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-10.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_10_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-11.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_11_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-12.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_12_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-13.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_13_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-14.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_14_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-15.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_15_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-16.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_16_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-17.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_17_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-18.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_18_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-19.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_19_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-2.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-20.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_20_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-21.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_21_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-22.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_22_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-23.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_23_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-24.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_24_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-25.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_25_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-3.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-4.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-5.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_5_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-6.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_6_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-7.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_7_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-8.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_8_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/jeffGameover/jeffGameover-9.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_jeffgameover_jeffgameover_9_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/killYou.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_killyou_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/song3censor.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_song3censor_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/stressCutscene.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_stresscutscene_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/tankSong2.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_tanksong2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/sounds/wellWellWell.mp3") @:noCompletion #if display private #end class __ASSET__assets_tank_sounds_wellwellwell_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/tank/tank_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_tank_tank_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/carol_speaker.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_carol_speaker_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/carol_speaker.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_carol_speaker_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/chance/blacksocool.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_blacksocool_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/chance/endless.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_endless_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/chance/endless.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_endless_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/chance/focus_light.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_chance_focus_light_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/crowdbump.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_crowdbump_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/crowdbump.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_crowdbump_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/gf_miku.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_gf_miku_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/gf_miku.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_gf_miku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/meekooTex.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_meekootex_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/meekooTex.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_meekootex_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/mikufans.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_mikufans_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/mikufans.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_mikufans_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/sadmiku.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_sadmiku_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/sadmiku.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_sadmiku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/spotlightdance.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_spotlightdance_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/spotlightdance.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_spotlightdance_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_stadiumback_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/crowd.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_crowd_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/voca/crowd.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_crowd_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/voca/hell.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_hell_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_stadiumback_png extends lime.graphics.Image {}
@:keep @:image("assets/expo/images/voca/voca_gf.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_gf_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/voca/voca_gf.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_gf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo/images/voca/voca_lights.png") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_lights_png extends lime.graphics.Image {}
@:keep @:file("assets/expo/images/voca/voca_lights.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_images_voca_voca_lights_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/Songs/songstart.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_songs_songstart_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/Songs/songstart.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_songs_songstart_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/carol_speaker.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_carol_speaker_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/carol_speaker.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_carol_speaker_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/chance/Perfect.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_perfect_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/chance/Perfect.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_perfect_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/chance/blacksocool.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_blacksocool_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/chance/endless.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_endless_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/chance/endless.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_endless_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/chance/focus_light.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_chance_focus_light_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/crowdbump.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_crowdbump_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/crowdbump.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_crowdbump_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/gf_miku.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_gf_miku_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/gf_miku.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_gf_miku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/meekooTex.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_meekootex_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/meekooTex.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_meekootex_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/mikufans.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mikufans_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/mikufans.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_mikufans_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/sadmiku.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_sadmiku_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/sadmiku.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_sadmiku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/spotlightdance.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_spotlightdance_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/spotlightdance.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_spotlightdance_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_stadiumback_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/crowd.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_crowd_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/voca/crowd.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_crowd_xml extends haxe.io.Bytes {}
@:keep @:image("assets/expo-two/images/voca/hell.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_hell_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_stadiumback_png extends lime.graphics.Image {}
@:keep @:image("assets/expo-two/images/voca/voca_lights.png") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_voca_lights_png extends lime.graphics.Image {}
@:keep @:file("assets/expo-two/images/voca/voca_lights.xml") @:noCompletion #if display private #end class __ASSET__assets_expo_two_images_voca_voca_lights_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/Songs/songstart.png") @:noCompletion #if display private #end class __ASSET__assets_endless_songs_songstart_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/Songs/songstart.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_songs_songstart_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/chance/Perfect.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_perfect_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/chance/Perfect.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_perfect_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/chance/blacksocool.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_blacksocool_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/chance/endless.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_endless_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/chance/endless.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_endless_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/chance/focus_light.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_chance_focus_light_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/crowdbump.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_crowdbump_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/crowdbump.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_crowdbump_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/meekooTex.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_meekootex_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/meekooTex.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_meekootex_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/mikufans.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_mikufans_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/mikufans.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_mikufans_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/sadmiku.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_sadmiku_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/sadmiku.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_sadmiku_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/endless/images/spotlightdance.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_spotlightdance_png extends lime.graphics.Image {}
@:keep @:file("assets/endless/images/spotlightdance.xml") @:noCompletion #if display private #end class __ASSET__assets_endless_images_spotlightdance_xml extends haxe.io.Bytes {}
@:keep @:image("assets/endless/images/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_endless_images_stadiumback_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/Songs/songstart.png") @:noCompletion #if display private #end class __ASSET__assets_concert_songs_songstart_png extends lime.graphics.Image {}
@:keep @:file("assets/concert/Songs/songstart.xml") @:noCompletion #if display private #end class __ASSET__assets_concert_songs_songstart_xml extends haxe.io.Bytes {}
@:keep @:image("assets/concert/images/backlight.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_backlight_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/images/bunch_of_simps.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_bunch_of_simps_png extends lime.graphics.Image {}
@:keep @:file("assets/concert/images/bunch_of_simps.xml") @:noCompletion #if display private #end class __ASSET__assets_concert_images_bunch_of_simps_xml extends haxe.io.Bytes {}
@:keep @:image("assets/concert/images/concerttop.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_concerttop_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/images/mainstage.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_mainstage_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/images/nightsky.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_nightsky_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/images/speakers.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_speakers_png extends lime.graphics.Image {}
@:keep @:image("assets/concert/images/spotlightdance.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_spotlightdance_png extends lime.graphics.Image {}
@:keep @:file("assets/concert/images/spotlightdance.xml") @:noCompletion #if display private #end class __ASSET__assets_concert_images_spotlightdance_xml extends haxe.io.Bytes {}
@:keep @:image("assets/concert/images/stadiumback.png") @:noCompletion #if display private #end class __ASSET__assets_concert_images_stadiumback_png extends lime.graphics.Image {}
@:keep @:file("art/readme.txt") @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends haxe.io.Bytes {}
@:keep @:file("CHANGELOG.md") @:noCompletion #if display private #end class __ASSET__changelog_txt extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/fonts-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/debug/html5/obj/webfont/funkin.otf") @:noCompletion #if display private #end class __ASSET__assets_fonts_funkin_otf extends lime.text.Font {}
@:keep @:font("export/debug/html5/obj/webfont/pixel.otf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font {}
@:keep @:font("export/debug/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font {}
@:keep @:file("/home/ubuntu/.peepee/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/ubuntu/.peepee/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/ubuntu/.peepee/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/ubuntu/.peepee/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/debug/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/debug/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/ubuntu/.peepee/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("/home/ubuntu/.peepee/flixel-ui/2,5,0/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_locales_json extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_funkin_otf') @:noCompletion #if display private #end class __ASSET__assets_fonts_funkin_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/funkin"; #else ascender = 750; descender = -10; height = 760; numGlyphs = 98; underlinePosition = 0; underlineThickness = 0; unitsPerEM = 1000; #end name = "Funkin"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/pixel"; #else ascender = 1125; descender = -250; height = 1375; numGlyphs = 262; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1000; #end name = "Pixel Arial 11 Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = 1800; descender = 0; height = 2000; numGlyphs = 204; underlinePosition = -292; underlineThickness = 150; unitsPerEM = 2048; #end name = "VCR OSD Mono"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_funkin_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_funkin_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_funkin_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_funkin_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_funkin_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_funkin_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end

#end