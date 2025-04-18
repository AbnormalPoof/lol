package;

#if VIDEOS
import vlc.VideoHandler;
#end
import Section.SwagSection;
import Song.SwagSong;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.effects.FlxTrail;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flxanimate.FlxAnimate;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import lime.utils.Assets;
import shadersLmfao.BuildingShaders;
import shadersLmfao.ColorSwap;
import shadersLmfao.WaveShader;
import ui.*;

using StringTools;

#if discord_rpc
import Discord.DiscordClient;
#end

#if MODDING
@:hscript(this, PlayState, FlxTween, FlxTimer)
#end
class PlayState extends MusicBeatState #if MODDING implements mods.IHook #end
{
	public static var curStage:String;
	public static var SONG:SwagSong;
	public static var isStoryMode:Bool = false;
	public static var storyWeek:Int = 0;
	public static var storyPlaylist:Array<String> = [];
	public static var storyDifficulty:Int = 1;
	public static var deathCounter:Int = 0;
	public static var practiceMode:Bool = false;
	public static var coopMode:Bool = false;
	public static var botMode:Bool = false;
	public static var notesX:Float = 78;

	private var vocals:FlxSound;
	private var vocalsFinished:Bool = false;

	private var dad:Player;
	private var gf:Character;
	private var boyfriend:Boyfriend;

	private var notes:FlxTypedGroup<Note>;
	private var unspawnNotes:Array<Note> = [];

	private var strumLine:FlxSprite;
	private var curSection:Int = 0;

	private var camFollow:FlxObject;

	private static var prevCamFollow:FlxObject;

	private var playerStrums:StaticNotes;
	private var player2Strums:StaticNotes;

	private var camZooming:Bool = false;
	private var curSong:String = "";

	private var gfSpeed:Int = 1;
	private var health:Float = 1;
	private var combo:Int = 0;

	private var healthBarBG:FlxSprite;
	private var healthBar:FlxBar;

	private var generatedMusic:Bool = false;
	private var startingSong:Bool = false;

	private var iconP1:HealthIcon;
	private var iconP2:HealthIcon;
	private var camHUD:FlxCamera;
	private var camGame:SwagCamera;
	public var lyrics:FlxText = new FlxText(0,100,1280,"",37,true);
	public var lyricsArray:Array<String> = [];

	public static var seenCutscene:Bool = false;

	var halloweenBG:FlxSprite;

	var lightFadeShader:BuildingShaders = new BuildingShaders();
	var phillyCityLights:FlxTypedGroup<BGSprite>;
	var phillyTrain:FlxSprite;
	var trainSound:FlxSound;

	var foregroundSprites:FlxTypedGroup<BGSprite>;

	var limo:BGSprite;
	var grpLimoDancers:FlxTypedGroup<BackgroundDancer>;
	var fastCar:BGSprite;
	var overlayShit:BGSprite;

	var upperBoppers:FlxSprite;
	var bottomBoppers:FlxSprite;
	var santa:FlxSprite;

	var bgGirls:BackgroundGirls;
	var wiggleShit:WaveShader = new WaveShader();

	var tankmenRun:FlxTypedGroup<TankmenBG>;
	var gfCutsceneLayer:FlxGroup;
	var fixLayer:FlxGroup;
	var bfTankCutsceneLayer:FlxGroup;
	var tankWatchtower:BGSprite;
	var tankRolling:BGSprite;
	
	var fiestaSalsa2:FlxSprite;
	var light1:FlxSprite;
	var fiestaSalsa:FlxSprite;
	var fiestaSalsa3:FlxSprite;
	var simpsBoppers:FlxSprite;
	var bgblack:FlxSprite;
	var perfect:FlxSprite;
	var start:FlxSprite;
	var gfDemon:FlxAnimate;
	var gfDemon2:FlxAnimate;
	var bfCuts:FlxSprite;
    var gfCuts:FlxSprite;
    var tankCutscene:CutsceneCharacter;
	

	var talking:Bool = true;
	var songScore:Int = 0;
	var misses:Int = 0;
	var scoreTxt:FlxText;

	var grpNoteSplashes:FlxTypedGroup<NoteSplash>;

	public static var campaignScore:Int = 0;

	var defaultCamZoom:Float = 1.05;

	// how big to stretch the pixel art assets
	public static var daPixelZoom:Float = 6;

	var inCutscene:Bool = false;
	var dialogueBox:DialogueBox;

	#if discord_rpc
	// Discord RPC variables
	var storyDifficultyText:String = "";
	var iconRPC:String = "";
	var songLength:Float = 0;
	var detailsText:String = "";
	var detailsPausedText:String = "";
	#end

	var camPos:FlxPoint;

	public function new()
	{
		#if MODDING
		buildScriptHooks();
		#end

		super();
	}

	override public function create()
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		FlxG.sound.cache(Paths.inst(PlayState.SONG.song));
		FlxG.sound.cache(Paths.voices(PlayState.SONG.song));
		
		camGame = new SwagCamera();
		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.add(camHUD, false);

		persistentUpdate = true;
		persistentDraw = true;

		if (SONG == null)
			SONG = Song.loadFromJson('tutorial');

		Conductor.mapBPMChanges(SONG);
		Conductor.changeBPM(SONG.bpm);

		foregroundSprites = new FlxTypedGroup<BGSprite>();

		#if discord_rpc
		initDiscord();
		#end

		switch (curStage)
		{
			case 'spooky':
				{
					defaultCamZoom = 1;

					halloweenBG = new FlxSprite(-200, -100);
					halloweenBG.frames = Paths.getSparrowAtlas('halloween_bg');
					halloweenBG.animation.addByPrefix('idle', 'halloweem bg0', 0, false);
					halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
					halloweenBG.animation.play('idle');
					halloweenBG.antialiasing = true;
					add(halloweenBG);
				}
			case 'philly':
				{
					var bg:BGSprite = new BGSprite('sky', -100, 0, 0.1, 0.1);
					add(bg);

					var city:BGSprite = new BGSprite('city', -10, 0, 0.3, 0.3);
					city.setGraphicSize(Std.int(city.width * 0.85));
					city.updateHitbox();
					add(city);

					phillyCityLights = new FlxTypedGroup<BGSprite>();

					var lightColors:Array<FlxColor> = [0x31A2FD, 0x31FD8C, 0xFB33F5, 0xFD4531, 0xFBA633];

					for (lightColor in lightColors)
					{
						var light:BGSprite = new BGSprite('win', city.x, 0, city.scrollFactor.x, city.scrollFactor.y);
						light.color = lightColor;
						light.visible = false;
						light.setGraphicSize(Std.int(light.width * 0.85));
						light.updateHitbox();
						light.shader = lightFadeShader.shader;
						phillyCityLights.add(light);
					}

					add(phillyCityLights);

					var streetBehind:BGSprite = new BGSprite('behindTrain', -40, 50);
					add(streetBehind);

					phillyTrain = new BGSprite('train', 2000, 360);
					add(phillyTrain);

					trainSound = new FlxSound().loadEmbedded(Paths.sound('train_passes'));
					FlxG.sound.list.add(trainSound);

					var street:BGSprite = new BGSprite('street', -40, streetBehind.y);
					add(street);
				}
			case 'limo':
				{
					var skyBG:BGSprite = new BGSprite('limoSunset', -120, -50, 0.1, 0.1);
					add(skyBG);

					var bgLimo:BGSprite = new BGSprite('bgLimo', -200, 480, 0.4, 0.4, ['background limo pink']);
					add(bgLimo);

					grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();

					for (i in 0...5)
					{
						var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
						dancer.scrollFactor.set(0.4, 0.4);
						grpLimoDancers.add(dancer);
					}

					add(grpLimoDancers);

					limo = new BGSprite('limoDrive', -120, 550, 1, 1, ['Limo stage']);

					fastCar = new BGSprite('fastCarLol', -300, 160);

					overlayShit = new BGSprite('limoOverlay', -500, -600);
					overlayShit.alpha = 0.5;
					overlayShit.visible = false;
					overlayShit.cameras = [camHUD];
					overlayShit.color = FlxColor.RED;
					add(overlayShit);
				}
			case 'expo':
				{
						defaultCamZoom = 0.80;

						var bg2:FlxSprite = new FlxSprite(-280, -100).loadGraphic(Paths.image('nightsky', 'expo'));
						bg2.antialiasing = true;
						bg2.scrollFactor.set(0.6, 0.6);
						bg2.setGraphicSize(Std.int(bg2.width * 1.1));
						bg2.active = false;
						add(bg2);

						var bg1:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('backlight', 'expo'));
						bg1.antialiasing = true;
						bg1.scrollFactor.set(0.7, 0.7);
						bg1.setGraphicSize(Std.int(bg1.width * 1.1));
						bg1.active = false;
						add(bg1);

						var bg4:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('concerttop', 'expo'));
						bg4.antialiasing = true;
						bg4.scrollFactor.set(0.75, 0.75);
						bg4.setGraphicSize(Std.int(bg4.width * 1.1));
						bg4.active = false;
						add(bg4);

						var bg3:FlxSprite = new FlxSprite(-420, -100).loadGraphic(Paths.image('stadiumback', 'expo'));
						bg3.antialiasing = true;
						bg3.scrollFactor.set(0.8, 0.8);
						bg3.setGraphicSize(Std.int(bg3.width * 1.1));
						bg3.active = false;
						add(bg3);

						var bg5:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('speakers', 'expo'));
						bg5.antialiasing = true;
						bg5.scrollFactor.set(0.9, 0.9);
						bg5.setGraphicSize(Std.int(bg5.width * 1.1));
						bg5.active = false;
						add(bg5);

						var bg:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('mainstage', 'expo'));
						bg.antialiasing = true;
						bg.setGraphicSize(Std.int(bg.width * 1.1));
						bg.active = false;
						add(bg);

						fiestaSalsa2 = new FlxSprite(-295, 645);
						fiestaSalsa2.frames = Paths.getSparrowAtlas('crowdbump', 'expo');
						fiestaSalsa2.animation.addByPrefix('dance', "crowdbump", 24, false);
						fiestaSalsa2.animation.addByPrefix('cheer', "crowdcheer", 24, false);
						fiestaSalsa2.animation.addByPrefix('miss', "crowdmiss", 24, false);
						fiestaSalsa2.antialiasing = true;
						fiestaSalsa2.scrollFactor.set(0.9, 0.9);
						fiestaSalsa2.setGraphicSize(Std.int(fiestaSalsa2.width * 1.5));
						fiestaSalsa2.updateHitbox();

						light1 = new FlxSprite(10, 0).loadGraphic(Paths.image('chance/focus_light', 'expo'));
						light1.antialiasing = true;
						light1.scrollFactor.set(0.95, 0.95);
						light1.setGraphicSize(Std.int(light1.width * 1.60));

						fiestaSalsa = new FlxSprite(-1000, -100);
						fiestaSalsa.frames = Paths.getSparrowAtlas('spotlightdance', 'expo');
						fiestaSalsa.animation.addByIndices('light1', 'spotlightdance1', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "", 24, false);
						fiestaSalsa.animation.addByIndices('light2', 'spotlightdance1', [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26], "", 24, false);
						fiestaSalsa.antialiasing = true;
						fiestaSalsa.scrollFactor.set(0.9, 0.9);
						fiestaSalsa.setGraphicSize(Std.int(fiestaSalsa.width * 1.30));
						fiestaSalsa.updateHitbox();

						bgblack = new FlxSprite(10, 0).loadGraphic(Paths.image('chance/blacksocool', 'expo'));
						bgblack.alpha = 0;
						bgblack.antialiasing = true;
						bgblack.scrollFactor.set(0.8, 0.8);
						bgblack.setGraphicSize(Std.int(bgblack.width * 1.60));
				}
			case 'expo-two':
				{
						defaultCamZoom = 0.80;

						var bg2:FlxSprite = new FlxSprite(-280, -100).loadGraphic(Paths.image('voca/nightsky', 'expo-two'));
						bg2.antialiasing = true;
						bg2.scrollFactor.set(0.6, 0.6);
						bg2.setGraphicSize(Std.int(bg2.width * 1.1));
						bg2.active = false;
						add(bg2);

						var bg1:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('voca/backlight', 'expo-two'));
						bg1.antialiasing = true;
						bg1.scrollFactor.set(0.7, 0.7);
						bg1.setGraphicSize(Std.int(bg1.width * 1.1));
						bg1.active = false;
						add(bg1);

						var bg4:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('voca/concerttop', 'expo-two'));
						bg4.antialiasing = true;
						bg4.scrollFactor.set(0.75, 0.75);
						bg4.setGraphicSize(Std.int(bg4.width * 1.1));
						bg4.active = false;
						add(bg4);

						var bg3:FlxSprite = new FlxSprite(-420, -100).loadGraphic(Paths.image('voca/stadiumback', 'expo-two'));
						bg3.antialiasing = true;
						bg3.scrollFactor.set(0.8, 0.8);
						bg3.setGraphicSize(Std.int(bg3.width * 1.1));
						bg3.active = false;
						add(bg3);

						var bg5:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('voca/speakers', 'expo-two'));
						bg5.antialiasing = true;
						bg5.scrollFactor.set(0.9, 0.9);
						bg5.setGraphicSize(Std.int(bg5.width * 1.1));
						bg5.active = false;
						add(bg5);

						var bg:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('voca/mainstage', 'expo-two'));
						bg.antialiasing = true;
						bg.setGraphicSize(Std.int(bg.width * 1.1));
						bg.active = false;
						add(bg);

						fiestaSalsa2 = new FlxSprite(-295, 665);
						fiestaSalsa2.frames = Paths.getSparrowAtlas('voca/crowd', 'expo-two');
						fiestaSalsa2.animation.addByPrefix('dance', "crowdbump", 24, false);
						fiestaSalsa2.animation.addByPrefix('cheer', "crowdcheer", 24, false);
						fiestaSalsa2.animation.addByPrefix('miss', "crowdmiss", 24, false);
						fiestaSalsa2.antialiasing = true;
						fiestaSalsa2.scrollFactor.set(0.9, 0.9);
						fiestaSalsa2.setGraphicSize(Std.int(fiestaSalsa2.width * 1.5));
						fiestaSalsa2.updateHitbox();

						fiestaSalsa = new FlxSprite(-1000, -100);
						fiestaSalsa.frames = Paths.getSparrowAtlas('spotlightdance', 'expo-two');
						fiestaSalsa.animation.addByIndices('light1', 'spotlightdance1', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "", 24, false);
						fiestaSalsa.animation.addByIndices('light2', 'spotlightdance1', [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26], "", 24, false);
						fiestaSalsa.antialiasing = true;
						fiestaSalsa.scrollFactor.set(0.9, 0.9);
						fiestaSalsa.setGraphicSize(Std.int(fiestaSalsa.width * 1.30));
						fiestaSalsa.updateHitbox();

						bgblack = new FlxSprite(10, 0).loadGraphic(Paths.image('chance/blacksocool', 'expo-two'));
						bgblack.alpha = 0;
						bgblack.antialiasing = true;
						bgblack.scrollFactor.set(0.8, 0.8);
						bgblack.setGraphicSize(Std.int(bgblack.width * 1.60));

						light1 = new FlxSprite(10, 0).loadGraphic(Paths.image('voca/hell', 'expo-two'));
						light1.antialiasing = true;
						light1.setGraphicSize(Std.int(light1.width * 1.60));
						light1.screenCenter();

				}
			case 'concert':
				{
						defaultCamZoom = 0.80;

						var bg2:FlxSprite = new FlxSprite(-280, -100).loadGraphic(Paths.image('nightsky', 'concert'));
						bg2.antialiasing = true;
						bg2.scrollFactor.set(0.6, 0.6);
						bg2.setGraphicSize(Std.int(bg2.width * 1.1));
						bg2.active = false;
						add(bg2);

						var bg1:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('backlight', 'concert'));
						bg1.antialiasing = true;
						bg1.scrollFactor.set(0.7, 0.7);
						bg1.setGraphicSize(Std.int(bg1.width * 1.1));
						bg1.active = false;
						add(bg1);

						var bg4:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('concerttop', 'concert'));
						bg4.antialiasing = true;
						bg4.scrollFactor.set(0.75, 0.75);
						bg4.setGraphicSize(Std.int(bg4.width * 1.1));
						bg4.active = false;
						add(bg4);

						var bg3:FlxSprite = new FlxSprite(-420, -100).loadGraphic(Paths.image('stadiumback', 'concert'));
						bg3.antialiasing = true;
						bg3.scrollFactor.set(0.8, 0.8);
						bg3.setGraphicSize(Std.int(bg3.width * 1.1));
						bg3.active = false;
						add(bg3);

						var bg5:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('speakers', 'concert'));
						bg5.antialiasing = true;
						bg5.scrollFactor.set(0.9, 0.9);
						bg5.setGraphicSize(Std.int(bg5.width * 1.1));
						bg5.active = false;
						add(bg5);

						var bg:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('mainstage', 'concert'));
						bg.antialiasing = true;
						bg.setGraphicSize(Std.int(bg.width * 1.1));
						bg.active = false;
						add(bg);

						simpsBoppers = new FlxSprite(-250, 678);
						simpsBoppers.frames = Paths.getSparrowAtlas('bunch_of_simps', 'concert');
						simpsBoppers.animation.addByPrefix('bop2', "Downer Crowd Bob", 24, false);
						simpsBoppers.antialiasing = true;
						simpsBoppers.scrollFactor.set(0.85, 0.85);
						simpsBoppers.setGraphicSize(Std.int(simpsBoppers.width * 1.10));
						simpsBoppers.updateHitbox();
						add(simpsBoppers);
				}
			case 'endless':
				{
					    defaultCamZoom = 0.80;

						var bg2:FlxSprite = new FlxSprite(-280, -100).loadGraphic(Paths.image('nightsky', 'endless'));
						bg2.antialiasing = true;
						bg2.scrollFactor.set(0.6, 0.6);
						bg2.setGraphicSize(Std.int(bg2.width * 1.1));
						bg2.active = false;
						add(bg2);

						var bg1:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('backlight', 'endless'));
						bg1.antialiasing = true;
						bg1.scrollFactor.set(0.7, 0.7);
						bg1.setGraphicSize(Std.int(bg1.width * 1.1));
						bg1.active = false;
						add(bg1);

						var bg4:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('concerttop', 'endless'));
						bg4.antialiasing = true;
						bg4.scrollFactor.set(0.75, 0.75);
						bg4.setGraphicSize(Std.int(bg4.width * 1.1));
						bg4.active = false;
						add(bg4);

						var bg3:FlxSprite = new FlxSprite(-420, -100).loadGraphic(Paths.image('stadiumback', 'endless'));
						bg3.antialiasing = true;
						bg3.scrollFactor.set(0.8, 0.8);
						bg3.setGraphicSize(Std.int(bg3.width * 1.1));
						bg3.active = false;
						add(bg3);

						var bg5:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('speakers', 'endless'));
						bg5.antialiasing = true;
						bg5.scrollFactor.set(0.9, 0.9);
						bg5.setGraphicSize(Std.int(bg5.width * 1.1));
						bg5.active = false;
						add(bg5);

						var bg:FlxSprite = new FlxSprite(-285, -100).loadGraphic(Paths.image('mainstage', 'endless'));
						bg.antialiasing = true;
						bg.setGraphicSize(Std.int(bg.width * 1.1));
						bg.active = false;
						add(bg);

						fiestaSalsa3 = new FlxSprite(-300, 10);
						fiestaSalsa3.frames = Paths.getSparrowAtlas('chance/endless', 'endless');
						fiestaSalsa3.animation.addByPrefix('deeznuts', "golf chance time", 35, false);
						fiestaSalsa3.antialiasing = true;
						fiestaSalsa3.scrollFactor.set(0.8, 0.8);
						fiestaSalsa3.setGraphicSize(Std.int(fiestaSalsa3.width * 1.35));
						fiestaSalsa3.updateHitbox();
						add(fiestaSalsa3);

				}
			case 'mall':
				{
					defaultCamZoom = 0.80;

					var bg:FlxSprite = new FlxSprite(-1000, -500).loadGraphic(Paths.image('bgWalls'));
					bg.antialiasing = true;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					add(bg);

					upperBoppers = new FlxSprite(-240, -90);
					upperBoppers.frames = Paths.getSparrowAtlas('upperBop');
					upperBoppers.animation.addByPrefix('bop', "Upper Crowd Bob", 24, false);
					upperBoppers.antialiasing = true;
					upperBoppers.scrollFactor.set(0.33, 0.33);
					upperBoppers.setGraphicSize(Std.int(upperBoppers.width * 0.85));
					upperBoppers.updateHitbox();
					add(upperBoppers);

					var bgEscalator:FlxSprite = new FlxSprite(-1100, -600).loadGraphic(Paths.image('bgEscalator'));
					bgEscalator.antialiasing = true;
					bgEscalator.scrollFactor.set(0.3, 0.3);
					bgEscalator.active = false;
					bgEscalator.setGraphicSize(Std.int(bgEscalator.width * 0.9));
					bgEscalator.updateHitbox();
					add(bgEscalator);

					var tree:FlxSprite = new FlxSprite(370, -250).loadGraphic(Paths.image('christmasTree'));
					tree.antialiasing = true;
					tree.scrollFactor.set(0.40, 0.40);
					add(tree);

					bottomBoppers = new FlxSprite(-300, 140);
					bottomBoppers.frames = Paths.getSparrowAtlas('bottomBop');
					bottomBoppers.animation.addByPrefix('bop', 'Bottom Level Boppers', 24, false);
					bottomBoppers.antialiasing = true;
					bottomBoppers.scrollFactor.set(0.9, 0.9);
					bottomBoppers.setGraphicSize(Std.int(bottomBoppers.width * 1));
					bottomBoppers.updateHitbox();
					add(bottomBoppers);

					var fgSnow:FlxSprite = new FlxSprite(-600, 700).loadGraphic(Paths.image('fgSnow'));
					fgSnow.active = false;
					fgSnow.antialiasing = true;
					add(fgSnow);

					santa = new FlxSprite(-840, 150);
					santa.frames = Paths.getSparrowAtlas('santa');
					santa.animation.addByPrefix('idle', 'santa idle in fear', 24, false);
					santa.antialiasing = true;
					add(santa);
				}
			case 'mall-evil':
				{
					loadStage('mall-evil');

					var bg:FlxSprite = new FlxSprite(-400, -500).loadGraphic(Paths.image('evilBG'));
					bg.antialiasing = true;
					bg.scrollFactor.set(0.2, 0.2);
					bg.active = false;
					bg.setGraphicSize(Std.int(bg.width * 0.8));
					bg.updateHitbox();
					add(bg);

					var evilTree:FlxSprite = new FlxSprite(300, -300).loadGraphic(Paths.image('evilTree'));
					evilTree.antialiasing = true;
					evilTree.scrollFactor.set(0.2, 0.2);
					add(evilTree);

					var evilSnow:FlxSprite = new FlxSprite(-200, 700).loadGraphic(Paths.image("evilSnow"));
					evilSnow.antialiasing = true;
					add(evilSnow);
				}
			case 'school':
				{
					var bgSky = new FlxSprite().loadGraphic(Paths.image('weebSky'));
					bgSky.scrollFactor.set(0.1, 0.1);
					add(bgSky);

					var repositionShit = -200;

					var bgSchool:FlxSprite = new FlxSprite(repositionShit, 0).loadGraphic(Paths.image('weebSchool'));
					bgSchool.scrollFactor.set(0.6, 0.90);
					add(bgSchool);

					var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('weebStreet'));
					bgStreet.scrollFactor.set(0.95, 0.95);
					add(bgStreet);

					var fgTrees:FlxSprite = new FlxSprite(repositionShit + 170, 130).loadGraphic(Paths.image('weebTreesBack'));
					fgTrees.scrollFactor.set(0.9, 0.9);
					add(fgTrees);

					var bgTrees:FlxSprite = new FlxSprite(repositionShit - 378, -800);
					var treetex = Paths.getPackerAtlas('weebTrees');
					bgTrees.frames = treetex;
					bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
					bgTrees.animation.play('treeLoop');
					bgTrees.scrollFactor.set(0.85, 0.85);
					add(bgTrees);

					var treeLeaves:FlxSprite = new FlxSprite(repositionShit, -40);
					treeLeaves.frames = Paths.getSparrowAtlas('petals');
					treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
					treeLeaves.animation.play('leaves');
					treeLeaves.scrollFactor.set(0.85, 0.85);
					add(treeLeaves);

					var widShit = Std.int(bgSky.width * 6);

					bgSky.setGraphicSize(widShit);
					bgSchool.setGraphicSize(widShit);
					bgStreet.setGraphicSize(widShit);
					bgTrees.setGraphicSize(Std.int(widShit * 1.4));
					fgTrees.setGraphicSize(Std.int(widShit * 0.8));
					treeLeaves.setGraphicSize(widShit);

					fgTrees.updateHitbox();
					bgSky.updateHitbox();
					bgSchool.updateHitbox();
					bgStreet.updateHitbox();
					bgTrees.updateHitbox();
					treeLeaves.updateHitbox();

					bgGirls = new BackgroundGirls(-100, 190);
					bgGirls.scrollFactor.set(0.9, 0.9);

					if (SONG.song.toLowerCase() == 'roses')
						bgGirls.getScared();

					bgGirls.setGraphicSize(Std.int(bgGirls.width * daPixelZoom));
					bgGirls.updateHitbox();
					add(bgGirls);
				}
			case 'school-evil':
				{
					var schoolBG:FlxSprite = new FlxSprite(-200, 0).loadGraphic(Paths.image('evilSchoolBG'));
					wiggleShit.waveAmplitude = 0.015;
					wiggleShit.waveSpeed = 2;
					wiggleShit.waveFrequency = 4;
					schoolBG.shader = wiggleShit.shader;
					schoolBG.setGraphicSize(Std.int(schoolBG.width * 6));
					schoolBG.updateHitbox();
					add(schoolBG);

					schoolBG.scrollFactor.set(0.7, 1);

					var schoolFront:FlxSprite = new FlxSprite(-250, schoolBG.y + 20).loadGraphic(Paths.image('evilSchoolFG'));

					schoolFront.shader = wiggleShit.shader;

					schoolFront.setGraphicSize(Std.int(schoolFront.width * 6));
					schoolFront.updateHitbox();
					add(schoolFront);
				}
			case 'tank':
				{
					defaultCamZoom = 0.9;

					var tankSky:BGSprite = new BGSprite('tankSky', -400, -400, 0, 0);
					add(tankSky);

					// this goes after tankSky and before tankMountains in stage file
					// need to accomodate for the velocity thing!
					var tankClouds:BGSprite = new BGSprite('tankClouds', FlxG.random.int(-700, -100), FlxG.random.int(-20, 20), 0.1, 0.1);
					tankClouds.active = true;
					tankClouds.velocity.x = FlxG.random.float(5, 15);
					add(tankClouds);

					var tankMountains:BGSprite = new BGSprite('tankMountains', -300, 70, 0.2, 0.2);
					tankMountains.setGraphicSize(Std.int(tankMountains.width * 1.21));
					tankMountains.updateHitbox();
					add(tankMountains);

					var tankBuildings:BGSprite = new BGSprite('tankBuildings', -200, 6, 0.30, 0.30);
					tankBuildings.setGraphicSize(Std.int(tankBuildings.width * 1.2));
					tankBuildings.updateHitbox();
					add(tankBuildings);

					var tankRuins:BGSprite = new BGSprite('tankRuins', -200, 0, 0.35, 0.35);
					tankRuins.setGraphicSize(Std.int(tankRuins.width * 1.1));
					tankRuins.updateHitbox();
					add(tankRuins);

					var smokeLeft:BGSprite = new BGSprite('smokeLeft', -200, -100, 0.4, 0.4, ['SmokeBlurLeft'], true);
					add(smokeLeft);

					var smokeRight:BGSprite = new BGSprite('smokeRight', 1100, -100, 0.4, 0.4, ['SmokeRight'], true);
					add(smokeRight);

					// TankGround.

					tankWatchtower = new BGSprite('tankWatchtower', 100, 50, 0.5, 0.5, ['watchtower gradient color']);
					add(tankWatchtower);

					tankRolling = new BGSprite('tankRolling', 300, 300, 0.5, 0.5, ['BG tank w lighting'], true);
					add(tankRolling);

					tankmenRun = new FlxTypedGroup<TankmenBG>();
					add(tankmenRun);

					var tankGround:BGSprite = new BGSprite('tankGround', -420, -150);
					tankGround.setGraphicSize(Std.int(tankGround.width * 1.15));
					tankGround.updateHitbox();
					add(tankGround);

					moveTank();

					var fgTank0:BGSprite = new BGSprite('tank0', -500, 650, 1.7, 1.5, ['fg']);
					foregroundSprites.add(fgTank0);

					var fgTank1:BGSprite = new BGSprite('tank1', -300, 750, 2, 0.2, ['fg']);
					foregroundSprites.add(fgTank1);

					var fgTank2:BGSprite = new BGSprite('tank2', 450, 940, 1.5, 1.5, ['foreground']);
					foregroundSprites.add(fgTank2);

					var fgTank4:BGSprite = new BGSprite('tank4', 1300, 900, 1.5, 1.5, ['fg']);
					foregroundSprites.add(fgTank4);

					var fgTank5:BGSprite = new BGSprite('tank5', 1620, 700, 1.5, 1.5, ['fg']);
					foregroundSprites.add(fgTank5);

					var fgTank3:BGSprite = new BGSprite('tank3', 1300, 1200, 3.5, 2.5, ['fg']);
					foregroundSprites.add(fgTank3);
				}
			case 'stage':
				{
					defaultCamZoom = 0.9;

					loadStage('stage');

					var bg:BGSprite = new BGSprite('stageback', -600, -200, 0.9, 0.9);
					add(bg);

					var stageFront:BGSprite = new BGSprite('stagefront', -650, 600, 0.9, 0.9);
					stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
					stageFront.updateHitbox();
					add(stageFront);

					var stageCurtains:BGSprite = new BGSprite('stagecurtains', -500, -300, 1.3, 1.3);
					stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
					stageCurtains.updateHitbox();
					add(stageCurtains);
				}
			default:
				#if MODDING
				// KEEP IN MIND, THIS WILL GET REMOVED ONCE ZINDEX MACRO IS FINISHED
				stageCreate();
				#end
		}

		gf = new Character(400, 130, SONG.gf);
		gf.scrollFactor.set(0.95, 0.95);

		if (SONG.gf == 'pico-speaker')
		{
			gf.x -= 50;
			gf.y -= 200;

			var tankmanRun = new TankmenBG(20, 500);
			tankmanRun.strumTime = 10;
			tankmanRun.resetShit(20, 600, true);
			tankmenRun.add(tankmanRun);

			for (animationNote in TankmenBG.animationNotes)
			{
				if (FlxG.random.float(0, 100) < 50)
				{
					var tankman:TankmenBG = tankmenRun.recycle(TankmenBG);
					tankman.strumTime = animationNote[0];
					tankman.resetShit(500, 200 + FlxG.random.int(50, 100), animationNote[1] < 2);
					tankmenRun.add(tankman);
				}
			}
		}

		dad = createPlayer(100, 100, SONG.player2, false, true);

		camPos = new FlxPoint(dad.getGraphicMidpoint().x, dad.getGraphicMidpoint().y);

		switch (SONG.player2)
		{
			case 'gf':
				dad.setPosition(gf.x, gf.y);
				gf.visible = false;
				if (isStoryMode)
				{
					camPos.x += 600;
					tweenCamIn();
				}
			case "spooky":
				dad.y += 200;
			case "monster":
				dad.y += 100;
			case 'monster-christmas':
				dad.y += 130;
			case 'dad':
				camPos.x += 400;
			case 'pico':
				camPos.x += 600;
				dad.y += 300;
		    case 'darnell':
				camPos.x += 670;
				dad.y += 350;
				dad.x += 50;
			case 'parents-christmas':
				dad.x -= 500;
			case 'monika':
				dad.x += 150;
				dad.y += 360;
				if (SONG.song.toLowerCase() == 'glitcher (monika mix)')
					camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y + 200);
				else
					camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'senpai' | 'senpai-angry':
				dad.x += 150;
				dad.y += 360;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'spirit':
				dad.x -= 150;
				dad.y += 100;
				camPos.set(dad.getGraphicMidpoint().x + 300, dad.getGraphicMidpoint().y);
			case 'tankman':
				dad.y += 180;
			case 'tricky':
			    dad.y += 50;
		}

		boyfriend = new Boyfriend(770, 450, SONG.player1);

		switch (SONG.player1)
		{
		    case 'pico' | 'miku':
		        boyfriend.x += 50;
		}
		// REPOSITIONING PER STAGE
		switch (curStage)
		{
			case 'limo':
				boyfriend.y -= 220;
				boyfriend.x += 260;

				resetFastCar();
				add(fastCar);

			case 'mall':
				boyfriend.x += 200;

			case 'mall-evil':
				boyfriend.x += 320;
				dad.y -= 80;
			case 'school':
				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
			case 'school-evil':
				// trailArea.scrollFactor.set();

				var evilTrail = new FlxTrail(dad, null, 4, 24, 0.3, 0.069);
				add(evilTrail);

				boyfriend.x += 200;
				boyfriend.y += 220;
				gf.x += 180;
				gf.y += 300;
			case 'expo':
				boyfriend.x += 100;
				gf.y -= 30;
			case 'expo-two':
				boyfriend.x += 100;
				boyfriend.y -= 150;
				gf.y -= 30;
			case 'endless':
				boyfriend.x += 100;
			case 'tank':
				gf.y += 10;
				gf.x -= 30;
				boyfriend.x += 40;
				dad.x -= 80;
				dad.y += 60;

				if (SONG.gf != 'pico-speaker')
				{
					gf.x -= 170;
					gf.y -= 75;
				}
		}

		add(gf);
		
		fixLayer = new FlxGroup();
		add(fixLayer);
		
		if (curStage == 'limo')
			add(limo);
		
	    if (curStage != 'endless')
	       add(dad);
	       
	   add(boyfriend);
	       
	   if (curStage.startsWith('expo'))
	   {
			add(fiestaSalsa2);
			add(light1);
			add(fiestaSalsa);
			add(bgblack);
			fiestaSalsa.visible = true;
			light1.visible = true;
			bgblack.visible = true;
			new FlxTimer().start(0.3, function(tmr:FlxTimer)
			{
				fiestaSalsa.visible = false;
					if (curSong != 'Voca')
					{
						light1.visible = false;
					}
				bgblack.visible = false;
			});
		}


		gfCutsceneLayer = new FlxGroup();
		add(gfCutsceneLayer);

		// Shitty layering but whatev it works LOL

		dialogueBox = addDialogue();

		add(foregroundSprites);

		Conductor.songPosition = -5000;

		strumLine = new FlxSprite(0, 50).makeGraphic(FlxG.width, 10);

		if (PreferencesMenu.getPref('downscroll'))
			strumLine.y = FlxG.height - 150; // 150 just random ass number lol

		strumLine.scrollFactor.set();

		playerStrums = new StaticNotes(0, strumLine.y);
		add(playerStrums);

		player2Strums = new StaticNotes(0, strumLine.y);
		add(player2Strums);
		
		start = new FlxSprite(0, 0);
		    start.frames = Paths.getSparrowAtlas('Songs/songstart');
		    start.animation.addByPrefix('Tutorial', 'Tutorial', 1, false);
		    start.animation.addByPrefix('Loid', 'Loid', 1, false);	
		    start.animation.addByPrefix('Endurance', 'Endurance', 1, false);
		    start.animation.addByPrefix('Voca', 'Voca', 1, false);
		    start.animation.addByPrefix('Endless', 'Endless', 1, false);
		    start.animation.addByPrefix('PoPiPo', 'PoPiPo', 1, false);
		    start.animation.addByPrefix('Aishite', 'Aishite', 1, false);
		    start.animation.addByPrefix('SIU', 'SIU', 1, false);
		    start.animation.addByPrefix('Disappearance', 'Disappearance', 1, false);
		    start.animation.addByPrefix('Secret', 'Secret', 1, false);
		    start.antialiasing = true;
		    start.screenCenter(Y);
		    start.updateHitbox();
		    add(start);
		    start.visible = false;
		    
		perfect = new FlxSprite(0, 0);
		    perfect.frames = Paths.getSparrowAtlas('chance/Perfect');
		    perfect.animation.addByPrefix('perfect', "Perfect", 24, false);
		    perfect.antialiasing = true;
		    perfect.screenCenter();
		    perfect.updateHitbox();
		    add(perfect);
		    perfect.visible = true;
		    new FlxTimer().start(0.1, function(tmr:FlxTimer)
	     	{
			    perfect.visible = false;
		    });

		grpNoteSplashes = new FlxTypedGroup<NoteSplash>();

		var noteSplash:NoteSplash = new NoteSplash(100, 100);
		grpNoteSplashes.add(noteSplash);
		noteSplash.alpha = 0.1;

		add(grpNoteSplashes);

		generateSong(SONG.song);

		camFollow = new FlxObject(0, 0, 1, 1);

		camFollow.setPosition(camPos.x, camPos.y);

		if (prevCamFollow != null)
		{
			camFollow = prevCamFollow;
			prevCamFollow = null;
		}

		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, 0.04);
		// FlxG.camera.setScrollBounds(0, FlxG.width, 0, FlxG.height);
		FlxG.camera.zoom = defaultCamZoom;
		FlxG.camera.focusOn(camFollow.getPosition());

		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);

		FlxG.fixedTimestep = false;

		healthBarBG = new FlxSprite(0, FlxG.height * 0.9).makeGraphic(601, 19, FlxColor.BLACK);
		healthBarBG.screenCenter(X);
		healthBarBG.scrollFactor.set();
		add(healthBarBG);

		if (PreferencesMenu.getPref('downscroll'))
			healthBarBG.y = FlxG.height * 0.1;

		healthBar = new FlxBar(healthBarBG.x + 4, healthBarBG.y + 4, RIGHT_TO_LEFT, Std.int(healthBarBG.width - 8), Std.int(healthBarBG.height - 8), this,
			'health', 0, 2);
		healthBar.value = 0;
		healthBar.scrollFactor.set();
		healthBar.createFilledBar(FlxColor.RED, FlxColor.LIME);
		add(healthBar);

		iconP1 = new HealthIcon(SONG.player1, true);
		iconP1.y = healthBar.y - (iconP1.height / 2);
		add(iconP1);

		iconP2 = new HealthIcon(SONG.player2, false);
		iconP2.y = healthBar.y - (iconP2.height / 2);
		add(iconP2);

		scoreTxt = new FlxText(healthBarBG.x + healthBarBG.width - 190, healthBarBG.y + 30, 0, "", 20);
		scoreTxt.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreTxt.scrollFactor.set();
		add(scoreTxt);

		#if mobile
		virtualPad = new MobilePad(FULL, NONE);
		add(virtualPad);
		#end

		grpNoteSplashes.cameras = [camHUD];
		playerStrums.cameras = [camHUD];
		player2Strums.cameras = [camHUD];
		notes.cameras = [camHUD];
		healthBar.cameras = [camHUD];
		healthBarBG.cameras = [camHUD];
		iconP1.cameras = [camHUD];
		iconP2.cameras = [camHUD];
		scoreTxt.cameras = [camHUD];
		grpNoteSplashes.cameras = [camHUD];
		if (curSong == 'Voca' && curStage == 'expo-two')
		{
			light1.cameras = [camHUD];
		}
		if (curStage.startsWith('expo'))
		{
		    perfect.cameras = [camHUD];
		    start.cameras = [camHUD];
        }

		if (virtualPad != null)
			virtualPad.cameras = [camHUD];

		#if mobile
		controls.setVirtualPad(virtualPad);
		#end

		switch (curSong.toLowerCase())
		{
		   case 'endless':
			    lyrics.scrollFactor.set();
				lyrics.cameras = [camHUD];
				lyricsArray = CoolUtil.coolTextFile(Paths.txt("endlessLyrics"));
				lyrics.alignment = FlxTextAlign.CENTER;
				lyrics.borderStyle = FlxTextBorderStyle.OUTLINE_FAST;
				lyrics.borderSize = 1;
				lyrics.font = Paths.font("funkin.otf");
				lyrics.x += 35;
				if (PreferencesMenu.getPref('downscroll'))
				{
					lyrics.y += 65;
				}
				else
				{
					lyrics.y += 450;
				}
		}
		
		add(lyrics);
		startingSong = true;

		if (isStoryMode && !seenCutscene && PreferencesMenu.getPref('cutscenes'))
		{
			seenCutscene = true;

			switch (curSong.toLowerCase())
			{
				case "winter-horrorland":
					var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
					add(blackScreen);
					blackScreen.scrollFactor.set();
					camHUD.visible = false;

					new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						remove(blackScreen);
						FlxG.sound.play(Paths.sound('Lights_Turn_On'));
						camFollow.y = -2050;
						camFollow.x += 200;
						FlxG.camera.focusOn(camFollow.getPosition());
						FlxG.camera.zoom = 1.5;

						new FlxTimer().start(0.8, function(tmr:FlxTimer)
						{
							camHUD.visible = true;
							remove(blackScreen);
							FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, 2.5, {
								ease: FlxEase.quadInOut,
								onComplete: function(twn:FlxTween)
								{
									startCountdown();
								}
							});
						});
					});
				case 'senpai' | 'roses' | 'thorns':
					schoolIntro();
				case 'ugh':
					if (PreferencesMenu.getPref('atlas')){
					    ughIntro();
					}else{
					    #if VIDEOS
					    playCutscene('ughCutscene');
					    #else
					    videoCuts();
					    #end
					}
				case 'guns':
					if (PreferencesMenu.getPref('atlas')){
					    gunsIntro();
					}else{
					    #if VIDEOS
					    playCutscene('gunsCutscene');
					    #else
					    videoCuts();
					    #end
					}
				case 'stress':
					if (PreferencesMenu.getPref('atlas')){
					    stressIntro();
					}else{
					    #if VIDEOS
					    playCutscene('stressCutscene');
					    #else
					    videoCuts();
					    #end
					}
				case 'loid' | 'endurance' | 'voca':
				    videoCuts();
				default:
					if (dialogueBox != null)
					{
						inCutscene = true;

						new FlxTimer().start(0.3, function(tmr:FlxTimer)
						{
							openSubState(dialogueBox);
						});
					}
					else
						startCountdown();
			}
		}
		else
			startCountdown();

		#if MODDING
		onCreate(camPos);
		#end

		super.create();
	}

	function createPlayer(x:Float, y:Float, char:String, isPlayer:Bool = false, isBot:Bool = false):Player
	{
		// TODO: Add to controls
		var avatar = new Player(x, y, char, isPlayer, isBot);
		return avatar;
	}

	@:allow(PauseSubState)
	function takeControlOfDad()
	{
		dad.isBot = !dad.isBot;
	}
	
	@:allow(PauseSubState)
	function p1Bot()
	{
		boyfriend.bfbot = !boyfriend.bfbot;
	}

	var virtualPad:MobilePad;

	#if MODDING
	public var stageCreate:Void->Void = function() return;
	public var onCreate:FlxPoint->Void = function(camPos) return;
	public var onUpdate:Void->Void = function() return;
	public var onStepHit:Void->Void = function() return;
	public var onBeatHit:Void->Void = function() return;

	public var onKillCombo:Void->Void = function() return;
	public var onGoodNoteHit:Note->Void = function(note) return;
	public var onPopUpScore:String->Void = function(daRating) return;

	public var onDadNotes:Note->Void = function(note) return;

	@:hscript({
		pathName: 'states/PlayState'
	})
	public function buildScriptHooks():Void
	{
		if (script_variables.get('stageCreate') != null)
			stageCreate = script_variables.get('stageCreate');

		if (script_variables.get('onCreate') != null)
			onCreate = script_variables.get('onCreate');

		// TODO: Add FixedUpdate and LateUpdate
		if (script_variables.get('onUpdate') != null)
			onUpdate = script_variables.get('onUpdate');

		if (script_variables.get('onStepHit') != null)
			onStepHit = script_variables.get('onStepHit');

		if (script_variables.get('onBeatHit') != null)
			onBeatHit = script_variables.get('onBeatHit');

		if (script_variables.get('onKillCombo') != null)
			onKillCombo = script_variables.get('onKillCombo');

		if (script_variables.get('onGoodNoteHit') != null)
			onGoodNoteHit = script_variables.get('onGoodNoteHit');

		if (script_variables.get('onPopUpScore') != null)
			onPopUpScore = script_variables.get('onPopUpScore');

		if (script_variables.get('onDadNotes') != null)
			onDadNotes = script_variables.get('onDadNotes');
	}
	#end

	function addDialogue():DialogueBox
	{
		if (PreferencesMenu.getPref('cutscenes') && SONG.dialogue != null && SONG.dialogue.data.length > 0)
		{
			var doof = new DialogueBox();
			doof.finishThing = startCountdown;
			doof.camera = camHUD;

			return doof;
		}

		return null;
	}
	
	function videoCuts():Void
	{
	    inCutscene = true;

		var vid:FlxVideo = new FlxVideo(Paths.video(curSong.toLowerCase() + 'Cutscene'));
		vid.finishCutscene = function()
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, (Conductor.crochet / 1000) * 5, {ease: FlxEase.quadInOut});
			startCountdown();
			cameraMovement();
		}
	}
	
	function playCutscene(name:String, ?atend:Bool)
    {
	    #if VIDEOS
	    inCutscene = true;

	    var video:VideoHandler = new VideoHandler();
	    FlxG.sound.music.stop();
	    video.finishCallback = function()
	    {
		    if (atend == true)
		    {
			    if (storyPlaylist.length <= 0)
				    FlxG.switchState(new StoryMenuState());
			    else
			    {
				    SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase());
				    FlxG.switchState(new PlayState());
			    }
		    }
		    else
		    	startCountdown();
	    }
	    video.playVideo(Paths.video(name));
	    #else
	    trace('wtf r u doin?????');
	    FlxG.switchState(new TitleState());
	    #end
    }

	function ughIntro():Void
	{
		inCutscene = true;

		FlxG.camera.zoom = defaultCamZoom * 1;

		FlxG.sound.playMusic(Paths.music('DISTORTO'), 0);
		FlxG.sound.music.fadeIn(5, 0, 0.5);

		dad.visible = false;
		tankCutscene = new CutsceneCharacter(439, 566, Paths.getTextureAtlas('tankTalkSong'));
		tankCutscene.antialiasing = true;
		gfCutsceneLayer.add(tankCutscene);
		tankCutscene.anim.addBySymbol("wellWellWell", "TANK TALK 1 P1", dad.x, dad.y, 24);
		tankCutscene.anim.addBySymbol("killYou", "TANK TALK 1 P2", dad.x, dad.y, 24);
		tankCutscene.startSyncAudio = FlxG.sound.load(Paths.sound('wellWellWell'));
		
		camHUD.visible = false;
		
		FlxG.camera.zoom *= 1.2;
		camFollow.y += 100;
		tankCutscene.playAnim('wellWellWell');

		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			camFollow.x += 800;
			camFollow.y += 100;
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.2}, 0.27, {ease: FlxEase.quadInOut});

			new FlxTimer().start(1.5, function(bep:FlxTimer)
			{
				boyfriend.playAnim('singUP');
				// Play Sound.
				FlxG.sound.play(Paths.sound('bfBeep'), function()
				{
					boyfriend.playAnim('idle');
				});
			});

			new FlxTimer().start(3, function(swaggy:FlxTimer)
			{
				camFollow.x -= 800;
				camFollow.y -= 100;
				FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.2}, 0.5, {ease: FlxEase.quadInOut});
				tankCutscene.playAnim('killYou');
				FlxG.sound.play(Paths.sound('killYou'));
				
				tankCutscene.onComplete = function()
				{
					dad.visible = true;
					gfCutsceneLayer.remove(tankCutscene);
				}

				new FlxTimer().start(6.1, function(swagasdga:FlxTimer)
				{
					FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, (Conductor.crochet / 1000) * 5, {ease: FlxEase.quadInOut});

					FlxG.sound.music.fadeOut((Conductor.crochet / 1000) * 5, 0);

					cameraMovement();
					startCountdown();
					camHUD.visible = true;
			   });
		   });
	   });
	}

	function gunsIntro():Void
	{
		inCutscene = true;

		camFollow.setPosition(camPos.x, camPos.y);

		camHUD.visible = false;

		FlxG.sound.playMusic(Paths.music('DISTORTO'), 0);
		FlxG.sound.music.fadeIn(5, 0, 0.5);

		camFollow.y += 100;

		FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.3}, 4, {ease: FlxEase.quadInOut});

		dad.visible = false;

		tankCutscene = new CutsceneCharacter(445, 570, Paths.getTextureAtlas('tightBars'));
		tankCutscene.antialiasing = true;
		gfCutsceneLayer.add(tankCutscene);
		gfCutsceneLayer.remove(tankCutscene);
		gfCutsceneLayer.add(tankCutscene);
		tankCutscene.startSyncAudio = FlxG.sound.load(Paths.sound('tankSong2'));
		tankCutscene.startSyncFrame = 4;
		tankCutscene.playAnim();

		new FlxTimer().start(4.1, function(ugly:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.4}, 0.4, {ease: FlxEase.quadOut});
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.3}, 0.7, {ease: FlxEase.quadInOut, startDelay: 0.45});

			gf.playAnim('sad');
		});

		new FlxTimer().start(11, function(tmr:FlxTimer)
		{
			FlxG.sound.music.fadeOut((Conductor.crochet / 1000) * 5, 0);

			tankCutscene.onComplete = function()
			{
				dad.visible = true;
				gfCutsceneLayer.remove(tankCutscene);
			}
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, (Conductor.crochet * 5) / 1000, {ease: FlxEase.quartIn});
			startCountdown();
			gf.dance();

			camHUD.visible = true;
		});
	}

	// Taken from Sanscode1937 some of it changed by me
	// Added censor!!!!!
	// other crap as well maybe
	
	function stressIntro():Void
	{
		FlxG.camera.zoom = defaultCamZoom * 1.2;

		camHUD.visible = false;

		inCutscene = true;
		dad.visible = false;
        gf.visible = false;
        boyfriend.alpha = 0.00001;

		gfCuts = new FlxSprite(400, 130);
		gfCuts.frames = Paths.getSparrowAtlas('characters/gfTankmen');
		gfCuts.animation.addByPrefix('dance', 'GF Dancing at Gunpoint0', 24);
		gfCuts.animation.play('dance');
		gfCuts.antialiasing = true;
		gfCuts.y -= 50;
		gfCuts.x = 150;
		fixLayer.add(gfCuts);
		gf.dance();
		
		bfCuts = new FlxSprite(770, 450);
		bfCuts.frames = Paths.getSparrowAtlas('characters/BOYFRIEND');
		bfCuts.animation.addByPrefix('idle', 'BF idle dance', 24, false);
		bfCuts.animation.play('idle');
		bfCuts.antialiasing = true;
		bfCuts.y += 40;
		gfCutsceneLayer.add(bfCuts);

		tankCutscene = new CutsceneCharacter(439, 566, Paths.getTextureAtlas('stressCutscene'));
		tankCutscene.antialiasing = true;
		tankCutscene.anim.addBySymbol('littleShit','TANK TALK 3 P1 UNCUT');
		tankCutscene.anim.addBySymbol('whoItIs','TANK TALK 3 P2 UNCUT');
		gfCutsceneLayer.add(tankCutscene);

		gfDemon2 = new FlxAnimate(400, -50, Paths.getTextureAtlas('picoShoot'));
		gfDemon2.antialiasing = true;
		gfDemon2.anim.addBySymbol('fix', 'Pico pew pew Atlasin');
		gfDemon2.anim.addBySymbol('kill', 'Pico Saves them sequence');
		gfDemon2.anim.addBySymbol('idle', 'Pico Dual Wield on Speaker idle', 0, 0, 24);
		gfDemon2.y = 390;
		gfDemon2.x = 465;
		fixLayer.add(gfDemon2);

		gfDemon = new FlxAnimate(400, 130, Paths.getTextureAtlas('gfDemon'));
		gfDemon.antialiasing = true;
		gfDemon.anim.addBySymbol('kill', "GF Turnin Demon W Effect");
		gfDemon.y = 405;
		gfDemon.x = 620;
		fixLayer.add(gfDemon);
	
        gfDemon.visible = false;
        gfDemon2.visible = false;
		
		
		camFollow.setPosition(camPos.x, camPos.y);
		camFollow.y += 100;
		tankCutscene.playAnim('littleShit');
		if (PreferencesMenu.getPref('censor-naughty'))
		{
		   tankCutscene.startSyncAudio = FlxG.sound.load(Paths.sound('stressCutscene'));
		}
		else
		{
		   tankCutscene.startSyncAudio = FlxG.sound.load(Paths.sound('song3censor'));
		}
		tankCutscene.startSyncFrame = 4;
		

		new FlxTimer().start(14.8, function(dagfDemon:FlxTimer)
		{
		    FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.6}, 3, {ease: FlxEase.quadInOut});
			camFollow.y -= 200;
			camFollow.x = 580;
			fixLayer.remove(gfCuts);
			gfDemon.visible = true;
			gfDemon.playAnim("kill");
		});		
		new FlxTimer().start(17.2, function(dagfDemon:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 0.9}, 1, {ease: FlxEase.quadInOut});
			camFollow.x = 760;
			fixLayer.remove(gfDemon);
			gfCutsceneLayer.remove(bfCuts);
			boyfriend.alpha = 1.00001;
			boyfriend.playAnim('bfCatch');	
			gfDemon2.visible = true;
			gfDemon2.playAnim('fix');
			gfDemon2.playAnim('kill');
		});	
		new FlxTimer().start(18.3, function (idle:FlxTimer)
			{
				boyfriend.playAnim('idle');
			});						
		new FlxTimer().start(19.3, function(ahLookWhoIsIt:FlxTimer)
			{
				tankCutscene.playAnim('whoItIs');
			});	
		new FlxTimer().start(20.5, function(dagfDemon:FlxTimer)
			{
				gfDemon2.playAnim('idle');
			});			
		new FlxTimer().start(20.1, function(daSmth:FlxTimer)	
			{
				camFollow.setPosition(camPos.x, camPos.y);
				camFollow.x = 600;
				camFollow.y = 500;
			});				

		new FlxTimer().start(31.2, function(eugh:FlxTimer)	
		{
			boyfriend.playAnim('singUPmiss');
		});			

		new FlxTimer().start(35.2, function(dagfDemon:FlxTimer)
		{
			camHUD.visible = true;
			inCutscene = false;
			FlxG.sound.music.fadeOut((Conductor.crochet / 1000) * 5, 0);
			gfCutsceneLayer.remove(tankCutscene);
			fixLayer.remove(gfDemon2);
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1}, (Conductor.crochet * 5) / 1000, {ease: FlxEase.quartIn});
			startCountdown();
	        dad.visible = true;
			gf.visible = true;
		});										
	}

    #if discord_rpc
	function initDiscord():Void
	{
		// Making difficulty text for Discord Rich Presence.
		storyDifficultyText = CoolUtil.difficultyString();
		iconRPC = SONG.player2;

		// To avoid having duplicate images in Discord assets
		switch (iconRPC)
		{
			case 'senpai-angry':
				iconRPC = 'senpai';
			case 'monster-christmas':
				iconRPC = 'monster';
			case 'mom-car':
				iconRPC = 'mom';
			case 'miku-voca':
				iconRPC = 'miku';
		}

		// String that contains the mode defined here so it isn't necessary to call changePresence for each mode
		detailsText = isStoryMode ? "Story Mode: Week " + storyWeek : "Freeplay";

		// String for when the game is paused
		detailsPausedText = "Paused - " + detailsText;

		// Updating Discord Rich Presence.
		DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);
	}
	#end


	function schoolIntro():Void
	{
		var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		black.scrollFactor.set();
		add(black);

		var red:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFff1b31);
		red.scrollFactor.set();

		var senpaiEvil:FlxSprite = new FlxSprite();
		senpaiEvil.frames = Paths.getSparrowAtlas('senpaiCrazy');
		senpaiEvil.animation.addByPrefix('idle', 'Senpai Pre Explosion', 24, false);
		senpaiEvil.setGraphicSize(Std.int(senpaiEvil.width * 6));
		senpaiEvil.scrollFactor.set();
		senpaiEvil.updateHitbox();
		senpaiEvil.screenCenter();
		senpaiEvil.x += senpaiEvil.width / 5;

		if (SONG.song.toLowerCase() == 'thorns')
		{
			remove(black);

			if (SONG.song.toLowerCase() == 'thorns')
			{
				add(red);
				camHUD.visible = false;
			}
		}

		new FlxTimer().start(0.3, function(tmr:FlxTimer)
		{
			black.alpha -= 0.15;

			if (black.alpha > 0)
				tmr.reset(0.3);
			else
			{
				if (dialogueBox != null)
				{
					inCutscene = true;

					if (SONG.song.toLowerCase() == 'thorns')
					{
						add(senpaiEvil);
						senpaiEvil.alpha = 0;
						new FlxTimer().start(0.3, function(swagTimer:FlxTimer)
						{
							senpaiEvil.alpha += 0.15;
							if (senpaiEvil.alpha < 1)
								swagTimer.reset();
							else
							{
								senpaiEvil.animation.play('idle');
								FlxG.sound.play(Paths.sound('Senpai_Dies'), 1, false, null, true, function()
								{
									remove(senpaiEvil);
									remove(red);
									FlxG.camera.fade(FlxColor.WHITE, 0.01, true, function()
									{
										openSubState(dialogueBox);

										camHUD.visible = true;
									}, true);
								});
								new FlxTimer().start(3.2, function(deadTime:FlxTimer)
								{
									FlxG.camera.fade(FlxColor.WHITE, 1.6, false);
								});
							}
						});
					}
					else
						openSubState(dialogueBox);
				}
				else
					startCountdown();

				remove(black);
			}
		});
	}

	var startTimer:FlxTimer = new FlxTimer();
	function startCountdown():Void
	{
		inCutscene = false;
		camHUD.visible = true;
		botMode = false;
        
        if (storyWeek == 8)
        {
            start.visible = true;
            new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxTween.tween(start,{alpha:0,x:start.x + 100},0.5,{ease:FlxEase.quartInOut,
				onComplete:function(twn:FlxTween){
					remove(start);
					}
				});
			});
            switch (curSong)
            {
              case 'Chug' | 'Infinite' | 'sekai-wa-Mada-Hajimatte-sura-inai' | 'Target-Practice':
                  start.animation.play('Secret');
              case 'Tutorial-(Miku-Edition)':
                  start.animation.play('Tutorial');
              default:
                  start.animation.play(curSong);
            }
        }
		if (curStage != 'endless' && !PreferencesMenu.getPref('middlescroll'))
			generateStaticArrows(0);

		generateStaticArrows(1);

		if (virtualPad != null && !isStoryMode)
			virtualPad.tweenPad();

		talking = false;
		startedCountdown = true;
		Conductor.songPosition = 0;
		Conductor.songPosition -= Conductor.crochet * 5;

		var swagCounter:Int = 0;

		startTimer.start(Conductor.crochet / 1000, function(tmr:FlxTimer)
		{
			// This just based on beatHit stuff but copact
			if (swagCounter % gfSpeed == 0)
				gf.dance();
			if (swagCounter % 2 == 0)
			{
				if (!boyfriend.animation.curAnim.name.startsWith("sing") && boyfriend.curCharacter != 'miku')
					boyfriend.playAnim('idle');
			}
			if (!dad.animation.curAnim.name.startsWith("sing"))
					dad.dance();
			if (generatedMusic)
				notes.sort(sortNotes, FlxSort.DESCENDING);

			var introSprPaths:Array<String> = ["ready", "set", "go"];
			var altSuffix:String = "";

			if (curStage.startsWith("school"))
			{
				altSuffix = '-pixel';
				introSprPaths = ['pixelUI/ready-pixel', 'pixelUI/set-pixel', 'pixelUI/date-pixel'];
			}

			var introSndPaths:Array<String> = [
				"intro3" + altSuffix, "intro2" + altSuffix,
				"intro1" + altSuffix, "introGo" + altSuffix
			];

			if (swagCounter > 0)
				readySetGo(introSprPaths[swagCounter - 1]);
			FlxG.sound.play(Paths.sound(introSndPaths[swagCounter]), 0.6);

			swagCounter += 1;
		});
	}

	function readySetGo(path:String):Void
	{
		var spr:FlxSprite = new FlxSprite().loadGraphic(Paths.image(path));
		spr.scrollFactor.set();

		if (curStage.startsWith('school'))
			spr.setGraphicSize(Std.int(spr.width * daPixelZoom));

		spr.updateHitbox();
		spr.screenCenter();
		add(spr);
		FlxTween.tween(spr, {y: spr.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			{
				spr.destroy();
			}
		});
	}

	var previousFrameTime:Int = 0;
	var songTime:Float = 0;

	function startSong():Void
	{
		startingSong = false;

		previousFrameTime = FlxG.game.ticks;

		if (!paused)
			FlxG.sound.playMusic(Paths.inst(SONG.song), 1, false);
		
		FlxG.sound.music.onComplete = endSong;
		vocals.play();

		#if discord_rpc
		// Song duration in a float, useful for the time left feature
		songLength = FlxG.sound.music.length;

		// Updating Discord Rich Presence (with Time Left)
		DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC, true, songLength);
		#end
	}

	private function generateSong(dataPath:String):Void
	{
		var songData = SONG;
		Conductor.changeBPM(songData.bpm);

		curSong = songData.song;

		if (SONG.needsVoices)
			vocals = new FlxSound().loadEmbedded(Paths.voices(SONG.song));
		else
			vocals = new FlxSound();

		vocals.onComplete = function()
		{
			vocalsFinished = true;
		};
		FlxG.sound.list.add(vocals);

		notes = new FlxTypedGroup<Note>();
		add(notes);

		var noteData:Array<SwagSection>;

		// NEW SHIT
		noteData = songData.notes[storyDifficulty];

		for (section in noteData)
		{
			for (songNotes in section.sectionNotes)
			{
				var daStrumTime:Float = songNotes[0];
				var daNoteData:Int = Std.int(songNotes[1] % 4);

				var gottaHitNote:Bool = section.mustHitSection;

				if (songNotes[1] > 3)
					gottaHitNote = !section.mustHitSection;

				var oldNote:Note;
				if (unspawnNotes.length > 0)
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];
				else
					oldNote = null;

				var swagNote:Note = new Note(daStrumTime, daNoteData, oldNote);
				swagNote.sustainLength = songNotes[2];
				swagNote.altNote = songNotes[3];
				swagNote.scrollFactor.set(0, 0);

				var susLength:Float = swagNote.sustainLength;

				susLength = susLength / Conductor.stepCrochet;
				unspawnNotes.push(swagNote);

				for (susNote in 0...Math.floor(susLength))
				{
					oldNote = unspawnNotes[Std.int(unspawnNotes.length - 1)];

					var sustainNote:Note = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true);
					sustainNote.scrollFactor.set();
					unspawnNotes.push(sustainNote);

					sustainNote.mustPress = gottaHitNote;

					if (sustainNote.mustPress)
						sustainNote.x += FlxG.width / 2; // general offset
				}

				swagNote.mustPress = gottaHitNote;

				if (swagNote.mustPress)
					swagNote.x += FlxG.width / 2; // general offset
			}
		}

		unspawnNotes.sort(sortByShit);

		generatedMusic = true;
	}
	
	function sortByShit(Obj1:Note, Obj2:Note):Int
	{
		return FlxSort.byValues(FlxSort.ASCENDING, Obj1.strumTime, Obj2.strumTime);
	}

	function sortNotes(order:Int = FlxSort.ASCENDING, Obj1:Note, Obj2:Note)
	{
		return FlxSort.byValues(order, Obj1.strumTime, Obj2.strumTime);
	}

	private function generateStaticArrows(player:Int):Void
	{
		var strums = player == 1 ? playerStrums : player2Strums;

		for (i in 0...4)
		{
			var item = strums.createItem(player);

			if (!isStoryMode)
				item.tweenNote();
		}

		if (PreferencesMenu.getPref('middlescroll') && curStage == 'endless')
			strums.screenCenter(X);
		if (curStage == 'endless')
		    strums.x += 470;
	}

	function loadStage(stage:String)
	{
		// This
	}

	function tweenCamIn():Void
	{
		FlxTween.tween(FlxG.camera, {zoom: 1.3}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
	}

	override function openSubState(SubState:FlxSubState)
	{
		if (paused)
		{
			if (FlxG.sound.music != null)
			{
				FlxG.sound.music.pause();
				vocals.pause();
			}

			if (!startTimer.finished)
				startTimer.active = false;
		}

		super.openSubState(SubState);
	}
	
	override function closeSubState()
	{
		if (paused)
		{
			if (FlxG.sound.music != null && !startingSong)
				resyncVocals();

			if (!startTimer.finished)
				startTimer.active = true;
			paused = false;

			#if discord_rpc
			if (startTimer.finished)
				DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC, true, songLength - Conductor.songPosition);
			else
				DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);
			#end
		}

		super.closeSubState();
	}

	#if discord_rpc
	override public function onFocus():Void
	{
		if (health > 0 && !paused)
		{
			if (Conductor.songPosition > 0.0)
				DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC, true, songLength - Conductor.songPosition);
			else
				DiscordClient.changePresence(detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);
		}

		super.onFocus();
	}

	override public function onFocusLost():Void
	{
		if (health > 0 && !paused)
			DiscordClient.changePresence(detailsPausedText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);

		super.onFocusLost();
	}
	#end

	function resyncVocals():Void
	{
		if (_exiting)
			return;

		vocals.pause();
		FlxG.sound.music.play();
		Conductor.songPosition = FlxG.sound.music.time + Conductor.offset;
        
		if (vocalsFinished)
			return;

		vocals.time = Conductor.songPosition;
		vocals.play();
	}

	private var paused:Bool = false;
	var startedCountdown:Bool = false;
	var canPause:Bool = true;

	override public function update(elapsed:Float)
	{
		FlxG.camera.followLerp = CoolUtil.camLerpShit(0.04);
        
		if (FlxG.keys.justPressed.K)
		{
			// FlxScreenGrab.grab(null, true, true);

			/*
				var png:ByteArray = new ByteArray();
				png = FlxG.camera.screen.pixels.encode(FlxG.camera.screen.pixels.rect, new PNGEncoderOptions());
				var f = sys.io.File.write('./swag.png', true);
				f.writeString(png.readUTFBytes(png.length));
				f.close();
			 */
			// sys.io.File.saveContent('./swag.png', png.readUTFBytes(png.length));
		}

		// Do this BEFORE super.update() so songPosition is accurate.
		if (startingSong)
		{
			if (startedCountdown)
			{
				Conductor.songPosition += elapsed * 1000;
				if (Conductor.songPosition >= 0)
					startSong();
			}
		}
		else
		{
			Conductor.songPosition = FlxG.sound.music.time + Conductor.offset; // 20 is THE MILLISECONDS??

			if (!paused)
			{
				songTime += FlxG.game.ticks - previousFrameTime;
				previousFrameTime = FlxG.game.ticks;

				// Interpolation type beat
				if (Conductor.lastSongPos != Conductor.songPosition)
				{
					songTime = (songTime + Conductor.songPosition) / 2;
					Conductor.lastSongPos = Conductor.songPosition;
				}
			}
		}

		switch (curStage)
		{
			case 'philly':
				if (trainMoving)
				{
					trainFrameTiming += elapsed;

					if (trainFrameTiming >= 1 / 24)
					{
						updateTrainPos();
						trainFrameTiming = 0;
					}
				}

				lightFadeShader.update((Conductor.crochet / 1000) * elapsed * 1.5);
			case 'tank':
				moveTank();
		}

		super.update(elapsed);

		wiggleShit.update(elapsed);

		scoreTxt.text = "Score:" + songScore + " | Misses:" + misses;

		#if MODDING
		onUpdate();
		#end

		var androidPause:Bool = false;

		#if android
		androidPause = FlxG.android.justPressed.BACK;
		#end

		if ((controls.PAUSE || androidPause) && startedCountdown && canPause)
		{
			persistentUpdate = false;
			persistentDraw = true;
			paused = true;

			var pauseSubState = new PauseSubState();
			openSubState(pauseSubState);
			pauseSubState.camera = camHUD;

			#if discord_rpc
			DiscordClient.changePresence(detailsPausedText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);
			#end
		}

		#if !mobile
		if (FlxG.keys.justPressed.SEVEN)
		{
			FlxG.switchState(new ChartingState());

			#if discord_rpc
			DiscordClient.changePresence(mods.LocaleHandler.getTranslation("CHART_EDITOR", "discord_rpc"), null, null, true);
			#end
		}
		#end

		if (FlxG.keys.justPressed.NINE)
			iconP1.swapOldIcon();
			
		if (FlxG.keys.justPressed.FIVE && !inCutscene && SONG.player2 != 'miku' && SONG.song != 'Endless')
		{
		   remove(dad);
           dad = createPlayer(dad.x, dad.y, 'miku', false, true);
           add(dad);
        }
        else if (FlxG.keys.justPressed.FOUR && dad.curCharacter == 'miku' && SONG.player2 != 'miku')
        {
           remove(dad);
           dad = createPlayer(dad.x, dad.y, SONG.player2, false, true);
           add(dad);
        }
        
        if (FlxG.keys.justPressed.THREE && !inCutscene && SONG.player1 != 'miku')
		{
		   remove(boyfriend);
           boyfriend = new Boyfriend(770, 450, 'miku');
           add(boyfriend);
           if (botMode)
		      boyfriend.bfbot = true;
        }
        else if (FlxG.keys.justPressed.TWO && boyfriend.curCharacter == 'miku' && SONG.player1 != 'miku')
        {
           remove(boyfriend);
           boyfriend = new Boyfriend(770, 450, SONG.player1);
           boyfriend.updateBfPos();
           add(boyfriend);
           if (botMode)
		      boyfriend.bfbot = true;
        }
        
        #if debug
        if (controls.NOTE_LEFT && boyfriend.bfbot)
            dad.playAnim('singLEFT');
        if (controls.NOTE_DOWN && boyfriend.bfbot)
            dad.playAnim('singDOWN');
        if (controls.NOTE_UP && boyfriend.bfbot)
            dad.playAnim('singUP');
        if (controls.NOTE_RIGHT && boyfriend.bfbot)
            dad.playAnim('singRIGHT');
       
        if (FlxG.keys.pressed.UP){
	        FlxG.sound.music.pitch += 0.01;
	        vocals.pitch += 0.01;
	    }else if (FlxG.keys.pressed.DOWN){
	        FlxG.sound.music.pitch -= 0.01;
	        vocals.pitch -= 0.01;
	    }
	    
	    if (FlxG.keys.justPressed.J)
	        FlxG.sound.music.pitch = 1;
	        vocals.pitch = 1;
        #end
        
        if (FlxG.keys.justPressed.D && boyfriend.bfbot)
			camHUD.visible = !camHUD.visible;
        
		iconP1.setGraphicSize(Std.int(CoolUtil.coolLerp(iconP1.width, 150, 0.15)));
		iconP2.setGraphicSize(Std.int(CoolUtil.coolLerp(iconP1.width, 150, 0.15)));

		iconP1.updateHitbox();
		iconP2.updateHitbox();

		var iconOffset:Int = 26;

		iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
		iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) - (iconP2.width - iconOffset);

		if (health > 2)
			health = 2;

		if (healthBar.percent < 20)
			iconP1.animation.curAnim.curFrame = 1;
		else
			iconP1.animation.curAnim.curFrame = 0;

		if (healthBar.percent > 80)
			iconP2.animation.curAnim.curFrame = 1;
		else
			iconP2.animation.curAnim.curFrame = 0;

		#if debug
		if (FlxG.keys.justPressed.ONE)
			endSong();

		if (FlxG.keys.justPressed.B)
			changeSection(1);
		else if (FlxG.keys.justPressed.V)
			changeSection(-1);

		if (FlxG.keys.justPressed.EIGHT)
			FlxG.switchState(new AnimationDebug(SONG.player2));
		if (FlxG.keys.justPressed.SIX)
			FlxG.switchState(new AnimationDebug(SONG.player1));
		if (FlxG.keys.justPressed.N)
			FlxG.switchState(new AnimationDebug(SONG.gf));
		#end

		if (generatedMusic && SONG.notes[storyDifficulty][Std.int(curStep / 16)] != null)
		{
			cameraRightSide = SONG.notes[storyDifficulty][Std.int(curStep / 16)].mustHitSection;

			cameraMovement();
		}

		if (camZooming)
		{
		    FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, 0.95);
			camHUD.zoom = FlxMath.lerp(1, camHUD.zoom, 0.95);
		}

		FlxG.watch.addQuick("beatShit", curBeat);
		FlxG.watch.addQuick("stepShit", curStep);

		if (curSong == 'Fresh')
		{
			switch (curBeat)
			{
				case 16:
					camZooming = true;
					gfSpeed = 2;
				case 48:
					gfSpeed = 1;
				case 80:
					gfSpeed = 2;
				case 112:
					gfSpeed = 1;
			}
		}
		else if (curSong == 'Bopeebo')
		{
			switch (curBeat)
			{
				case 128, 129, 130:
					vocals.volume = 0;
			}
		}
		
		if (misses == 0 && curSong == 'Endless' && curBeat == 361)
		{
			fiestaSalsa3.animation.play('deeznuts');
		}
		
		if (!inCutscene && !_exiting)
		{
			// RESET = Quick Game Over Screen
			if (controls.RESET)
			{
				health = 0;
				trace("RESET = True");
			}

			#if CAN_CHEAT // CHEAT = brandon's a pussy
			if (controls.CHEAT)
			{
				health += 1;
				trace("User is cheating!");
			}
			#end

			if (health <= 0 && !practiceMode)
			{
				persistentUpdate = false;
				persistentDraw = false;
				paused = true;

				vocals.stop();
				FlxG.sound.music.stop();

				deathCounter++;

				// 1 / 1000 chance for Gitaroo Man easter egg
				if (FlxG.random.bool(0.1))
				{
					var gitaro = new GitarooPause();
					openSubState(gitaro);
					gitaro.cameras = [camHUD];
				}
				else
					openSubState(new GameOverSubstate(boyfriend.getScreenPosition().x, boyfriend.getScreenPosition().y));

				#if discord_rpc
				// Game Over doesn't get his own variable because it's only used here
				DiscordClient.changePresence("Game Over - " + detailsText, SONG.song + " (" + storyDifficultyText + ")", iconRPC);
				#end
			}

			while (unspawnNotes[0] != null && unspawnNotes[0].strumTime - Conductor.songPosition < 1800 / SONG.speed[storyDifficulty])
			{
				var dunceNote:Note = unspawnNotes[0];

				if (curStage == 'endless' && PreferencesMenu.getPref('middlescroll'))
				{
					dunceNote.x = playerStrums.members[dunceNote.noteData].x;
					if (dunceNote.isSustainNote)
						dunceNote.x += dunceNote.width / 2 + 17;
				}

				notes.add(dunceNote);

				unspawnNotes.shift();
			}

			if (generatedMusic)
			{
				var strumming2:Array<Bool> = [false, false, false, false];

				notes.forEachAlive(function(daNote:Note)
				{
					#if MODDING
					onDadNotes(daNote);
					#end

					if ((PreferencesMenu.getPref('downscroll') && daNote.y < -FlxG.height)
						|| (PreferencesMenu.getPref('downscroll') && daNote.y > FlxG.height))
					{
						daNote.active = false;
						daNote.visible = false;
					}
					else
					{
						daNote.visible = true;
						daNote.active = true;
					}

					var strumLineMid = strumLine.y + Note.swagWidth / 2;

					if (curStage == 'endless' && PreferencesMenu.getPref('middlescroll'))
					{
						if (!daNote.mustPress)
							daNote.visible = false;
					}
					
					// stolen from psych LOL
					if (daNote.mustPress && boyfriend.bfbot) 
					{
					    if (daNote.isSustainNote) 
					    {
						    if (daNote.canBeHit) 
						    {
					            goodNoteHit(daNote);
						    }
					    } 
					    else if (daNote.strumTime <= Conductor.songPosition || (daNote.isSustainNote && daNote.canBeHit && daNote.mustPress)) 
					    {
						    goodNoteHit(daNote);
					    }
					}

					if (PreferencesMenu.getPref('downscroll'))
					{
						daNote.y = (strumLine.y + (Conductor.songPosition - daNote.strumTime) * (0.45 * FlxMath.roundDecimal(SONG.speed[storyDifficulty], 2)));

						if (daNote.isSustainNote)
						{
							if (daNote.animation.curAnim.name.endsWith("end") && daNote.prevNote != null)
								daNote.y += daNote.prevNote.height;
							else
								daNote.y += daNote.height / 2;

							if ((!daNote.mustPress || (daNote.wasGoodHit || (daNote.prevNote.wasGoodHit && !daNote.canBeHit)))
								&& daNote.y - daNote.offset.y * daNote.scale.y + daNote.height >= strumLineMid)
							{
								// clipRect is applied to graphic itself so use frame Heights
								var swagRect:FlxRect = new FlxRect(0, 0, daNote.frameWidth, daNote.frameHeight);

								swagRect.height = (strumLineMid - daNote.y) / daNote.scale.y;
								swagRect.y = daNote.frameHeight - swagRect.height;
								daNote.clipRect = swagRect;
							}
						}
					}
					else
					{
						daNote.y = (strumLine.y - (Conductor.songPosition - daNote.strumTime) * (0.45 * FlxMath.roundDecimal(SONG.speed[storyDifficulty], 2)));

						if (daNote.isSustainNote
							&& (!daNote.mustPress || (daNote.wasGoodHit || (daNote.prevNote.wasGoodHit && !daNote.canBeHit)))
							&& daNote.y + daNote.offset.y * daNote.scale.y <= strumLineMid)
						{
							var swagRect:FlxRect = new FlxRect(0, 0, daNote.width / daNote.scale.x, daNote.height / daNote.scale.y);

							swagRect.y = (strumLineMid - daNote.y) / daNote.scale.y;
							swagRect.height -= swagRect.y;
							daNote.clipRect = swagRect;
						}
					}

					playerBot(daNote, player2Strums, strumming2, dad);
				});

				if (curStage != 'endless' && !PreferencesMenu.getPref('middlescroll'))
				{
					player2Strums.forEach(function(spr)
					{
						if (strumming2[spr.ID])
							spr.playAnim('confirm');
						else if (dad.holdTimer == 0)
						{
							strumming2[spr.ID] = false;
							spr.playAnim('static');
						}
					});
				}
			}
		}

		if (!inCutscene && !boyfriend.bfbot)
			keyShit();
	}

	function killCombo():Void
	{
		#if MODDING
		onKillCombo();
		#end

		if (combo > 5 && gf.animOffsets.exists('sad'))
			gf.playAnim('sad');
		if (combo > 49 && curStage.startsWith('expo'))
			{
				FlxG.sound.play(Paths.sound('Awww', 'shared'));
				if (curSong != 'Voca')
				{
					fiestaSalsa.visible = false;
					fiestaSalsa2.animation.play('miss', true);
				}
			}
		if (combo != 0)
		{
			combo = 0;
			displayCombo();
		}

		if (!practiceMode)
			songScore -= 10;
	}

	#if debug
	function changeSection(sec:Int):Void
	{
		FlxG.sound.music.pause();

		var daBPM:Float = SONG.bpm;
		var daPos:Float = 0;
		for (i in 0...(Std.int(curStep / 16 + sec)))
		{
			if (SONG.notes[storyDifficulty][i].changeBPM)
			{
				daBPM = SONG.notes[storyDifficulty][i].bpm;
				daBPM = SONG.notes[storyDifficulty][i].bpm;
			}
			daPos += 4 * (1000 * 60 / daBPM);
		}
		Conductor.songPosition = FlxG.sound.music.time = daPos;
		updateCurStep();
		resyncVocals();
	}
	#end

	function endSong():Void
	{
		seenCutscene = false;
		deathCounter = 0;
		canPause = false;
		FlxG.sound.music.volume = 0;
		vocals.volume = 0;

		if (SONG.validScore)
			Highscore.saveScore(SONG.song, songScore, storyDifficulty);

		if (isStoryMode)
		{
			campaignScore += songScore;

			storyPlaylist.remove(storyPlaylist[0]);

			if (storyPlaylist.length <= 0)
			{
				FlxG.sound.playMusic(Paths.music('freakyMenu'));

				transIn = FlxTransitionableState.defaultTransIn;
				transOut = FlxTransitionableState.defaultTransOut;

				switchTo(new StoryMenuState());

				StoryMenuState.weekUnlocked[Std.int(Math.min(storyWeek + 1, StoryMenuState.weekUnlocked.length - 1))] = true;

				if (SONG.validScore)
				{
					#if newgrounds
					NGio.unlockMedal(60961);
					#end
					Highscore.saveWeekScore(storyWeek, campaignScore, storyDifficulty);
				}

				FlxG.save.data.weekUnlocked = StoryMenuState.weekUnlocked;
				FlxG.save.flush();
				botMode = false;
				FlxG.sound.music.pitch = 1;
	            vocals.pitch = 1;
			}
			else
			{
				trace('LOADING NEXT SONG');
				botMode = false;
				FlxG.sound.music.pitch = 1;
	            vocals.pitch = 1;

				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;

				FlxG.sound.music.stop();
				vocals.stop();
				Assets.cache.clear(Paths.inst(curSong));
				Assets.cache.clear(Paths.voices(curSong));

				if (SONG.song.toLowerCase() == 'eggnog')
				{
					var blackShit:FlxSprite = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
						-FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
					blackShit.scrollFactor.set();
					add(blackShit);
					camHUD.visible = false;
					inCutscene = true;

					FlxG.sound.play(Paths.sound('Lights_Shut_off'), function()
					{
						// No camFollow so it center of the horror tree.
						SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase());
						LoadingState.loadAndSwitchState(new PlayState());
					});
				}
				else if (SONG.song.toLowerCase() == 'roses' && PreferencesMenu.getPref('cutscenes'))
				{
					camHUD.visible = false;
					inCutscene = true;

					FlxG.camera.fade(0xFFff1b31, 0.3, false, function()
					{
						SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase());
						LoadingState.loadAndSwitchState(new PlayState());
					}, true);
				}
				else
				{
					prevCamFollow = camFollow;
					SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase());
					LoadingState.loadAndSwitchState(new PlayState());
				}
			}
		}
		else
		{
			trace('WENT BACK TO FREEPLAY??');
			switchTo(new FreeplayState());
			botMode = false;
			FlxG.sound.music.pitch = 1;
	        vocals.pitch = 1;
		}
	}

	var endingSong:Bool = false;

	// Gives score and pops ip rating
	private function popUpScore(daNote:Note):Void
	{
		var noteDiff:Float = Math.abs(daNote.strumTime - Conductor.songPosition);
		vocals.volume = 1;

		var score:Int = 350;

		var daRating:String = 'sick';

		var isSick:Bool = true;
		
		if (noteDiff > Conductor.safeZoneOffset * 0.9 && !boyfriend.bfbot)
		{
			daRating = 'shit';
			score = 80;
			isSick = false;
		}
		else if (noteDiff > Conductor.safeZoneOffset * 0.75 && !boyfriend.bfbot)
		{
			daRating = 'bad';
			score = 100;
			isSick = false;
		}
		else if (noteDiff > Conductor.safeZoneOffset * 0.2 && !boyfriend.bfbot)
		{
			daRating = 'good';
			score = 200;
			isSick = false;
		}

		#if MODDING
		onPopUpScore(daRating);
		#end


		// TODO: Add Note Skins and Special Notes (Burning etc).
		if (isSick && PreferencesMenu.getPref("noteSplash"))
		{
			var noteSplash:NoteSplash = grpNoteSplashes.recycle(NoteSplash);
			noteSplash.setupNoteSplash(daNote.x, daNote.y, daNote.noteData);
			grpNoteSplashes.add(noteSplash);
		}

		if (!practiceMode)
			songScore += score;

		
		if (camHUD.visible != false)
		{
		    var rating:FlxSprite = new FlxSprite();
		    var ratingPath:String = daRating;

		    if (curStage.startsWith('school'))
			    ratingPath = "pixelUI/" + ratingPath + "-pixel";

		    rating.loadGraphic(Paths.image(ratingPath));
		    rating.x = FlxG.width * 0.55 - 40;
		    if (rating.x < FlxG.camera.scroll.x)
			    rating.x = FlxG.camera.scroll.x;
		    else if (rating.x > FlxG.camera.scroll.x + FlxG.camera.width - rating.width)
			    rating.x = FlxG.camera.scroll.x + FlxG.camera.width - rating.width;

		    rating.y = FlxG.camera.scroll.y + FlxG.camera.height * 0.4 - 60;
		    rating.acceleration.y = 550;
		    rating.velocity.y -= FlxG.random.int(140, 175);
		    rating.velocity.x -= FlxG.random.int(0, 10);

		    add(rating);

		    if (curStage.startsWith('school'))
			    rating.setGraphicSize(Std.int(rating.width * daPixelZoom * 0.7));
		    else
		    {
			    rating.setGraphicSize(Std.int(rating.width * 0.7));
			    rating.antialiasing = true;
		    }
		    rating.updateHitbox();

		    FlxTween.tween(rating, {alpha: 0}, 0.2, {
			    onComplete: function(tween:FlxTween)
			    {
				    rating.destroy();
			    },
			    startDelay: Conductor.crochet * 0.001
		    });

		    displayCombo();
		}
	}

	function displayCombo():Void
	{
		if (combo < 50 && curStage.startsWith('expo'))
			{
				fiestaSalsa.visible = false;
			}
			if (combo > 50 && curStage.startsWith('expo'))
			{
				fiestaSalsa.visible = true;
			}
		var pixelShitPart1:String = "";
		var pixelShitPart2:String = "";

		if (curStage.startsWith('school'))
		{
			pixelShitPart1 = 'pixelUI/';
			pixelShitPart2 = '-pixel';
		}

		var comboSpr:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'combo' + pixelShitPart2));
		comboSpr.y = FlxG.camera.scroll.y + FlxG.camera.height * 0.4 + 80;
		comboSpr.x = FlxG.width * 0.55;
		// Make sure combo is visible lol!
		// 194 firs 4 combo digits
		if (comboSpr.x < FlxG.camera.scroll.x + 194)
			comboSpr.x = FlxG.camera.scroll.x + 194;
		else if (comboSpr.x > FlxG.camera.scroll.x + FlxG.camera.width - comboSpr.width)
			comboSpr.x = FlxG.camera.scroll.x + FlxG.camera.width - comboSpr.width;

		comboSpr.acceleration.y = 600;
		comboSpr.velocity.y -= 150;
		comboSpr.velocity.x += FlxG.random.int(1, 10);

		add(comboSpr);

		if (curStage.startsWith('school'))
			comboSpr.setGraphicSize(Std.int(comboSpr.width * daPixelZoom * 0.7));
		else
		{
			comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.7));
			comboSpr.antialiasing = true;
		}
		comboSpr.updateHitbox();

		FlxTween.tween(comboSpr, {alpha: 0}, 0.2, {
			onComplete: function(tween:FlxTween)
			{
				comboSpr.destroy();
			},
			startDelay: Conductor.crochet * 0.001
		});

		var seperatedScore:Array<Int> = [];
		var tempCombo:Int = combo;

		while (tempCombo != 0)
		{
			seperatedScore.push(tempCombo % 10);
			tempCombo = Std.int(tempCombo / 10);
		}
		while (seperatedScore.length < 3)
			seperatedScore.push(0);

		var daLoop:Int = 1;
		for (i in seperatedScore)
		{
			var numScore:FlxSprite = new FlxSprite().loadGraphic(Paths.image(pixelShitPart1 + 'num' + Std.int(i) + pixelShitPart2));
			numScore.y = comboSpr.y;

			if (curStage.startsWith('school'))
				numScore.setGraphicSize(Std.int(numScore.width * daPixelZoom));
			else
			{
				numScore.setGraphicSize(Std.int(numScore.width * 0.5));
				numScore.antialiasing = true;
			}
			numScore.updateHitbox();

			numScore.x = comboSpr.x - (43 * daLoop);
			numScore.acceleration.y = FlxG.random.int(200, 300);
			numScore.velocity.y -= FlxG.random.int(140, 160);
			numScore.velocity.x = FlxG.random.float(-5, 5);

			add(numScore);

			FlxTween.tween(numScore, {alpha: 0}, 0.2, {
				onComplete: function(tween:FlxTween)
				{
					numScore.destroy();
				},
				startDelay: Conductor.crochet * 0.002
			});

			daLoop++;
		}
	}

	var cameraRightSide:Bool = false;

	function cameraMovement()
	{
		if (camFollow.x != dad.getMidpoint().x + 150 && !cameraRightSide)
		{
			camFollow.setPosition(dad.getMidpoint().x + 150, dad.getMidpoint().y - 100);

			switch (dad.curCharacter)
			{
				case 'mom':
					camFollow.y = dad.getMidpoint().y;
				case 'senpai' | 'senpai-angry' | 'monika':
					camFollow.y = dad.getMidpoint().y - 430;
					camFollow.x = dad.getMidpoint().x - 100;
				case 'miku-voca' | 'tricky' :
				    camFollow.y = dad.getMidpoint().y + 35;
				case 'darnell':
				    camFollow.x = dad.getMidpoint().x + 270;
			        camFollow.y = dad.getMidpoint().y - 150;
			}

			if (dad.curCharacter == 'mom')
				vocals.volume = 1;

			if (SONG.song.toLowerCase() == 'tutorial')
				FlxTween.tween(FlxG.camera, {zoom: 1}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
		}

		if (cameraRightSide && camFollow.x != boyfriend.getMidpoint().x - 100)
		{
			camFollow.setPosition(boyfriend.getMidpoint().x - 100, boyfriend.getMidpoint().y - 100);

			switch (curStage)
			{
				case 'limo':
					camFollow.x = boyfriend.getMidpoint().x - 300;
				case 'mall':
					camFollow.y = boyfriend.getMidpoint().y - 200;
				case 'endless':
					camFollow.x = boyfriend.getMidpoint().y + 100;
				case 'expo-two':
					camFollow.y = boyfriend.getMidpoint().y + 75;
				case 'school' | 'school-evil':
					camFollow.x = boyfriend.getMidpoint().x - 200;
					camFollow.y = boyfriend.getMidpoint().y - 200;
			}

			if (boyfriend.curCharacter == 'pico')
			{
			   camFollow.x = boyfriend.getMidpoint().x - 240;
			   camFollow.y = boyfriend.getMidpoint().y - 70;
			}
			 
			if (SONG.song.toLowerCase() == 'tutorial')
				tweenCamIn();
		}
	}

	private function keyShit():Void
	{
		var holdArray:Array<Bool> = [controls.NOTE_LEFT, controls.NOTE_DOWN, controls.NOTE_UP, controls.NOTE_RIGHT];
		var pressArray:Array<Bool> = [
			controls.NOTE_LEFT_P,
			controls.NOTE_DOWN_P,
			controls.NOTE_UP_P,
			controls.NOTE_RIGHT_P
		];
		var releaseArray:Array<Bool> = [
			controls.NOTE_LEFT_R,
			controls.NOTE_DOWN_R,
			controls.NOTE_UP_R,
			controls.NOTE_RIGHT_R
		];


		// HOLDS, check for sustain notes.
		if (holdArray.contains(true) && generatedMusic)
		{
			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.isSustainNote && daNote.canBeHit && daNote.mustPress && holdArray[daNote.noteData])
					goodNoteHit(daNote);
			});
		}
        
		// PRESSES, check for note hits.
		if (pressArray.contains(true) && generatedMusic)
		{
			var possibleNotes:Array<Note> = []; // Notes that can be hit.
			var directionList:Array<Int> = []; // Directions that can be hit.
			var dumbNotes:Array<Note> = []; // Notes to kill later.

			notes.forEachAlive(function(daNote:Note)
			{
				if (daNote.canBeHit && daNote.mustPress && !daNote.tooLate && !daNote.wasGoodHit)
				{
					if (directionList.contains(daNote.noteData))
					{
						for (coolNote in possibleNotes)
						{
							if (coolNote.noteData == daNote.noteData && Math.abs(daNote.strumTime - coolNote.strumTime) < 10)
							{
								// If it's the same note twice at < 10ms distance, just delete i.
								// EXCEPT u can't delete it in this loop cuz it fucks with the collision lol!
								dumbNotes.push(daNote);
								break;
							}
							else if (coolNote.noteData == daNote.noteData && daNote.strumTime < coolNote.strumTime)
							{
								// If daNote is earlier than existing note (coolNote), replace.
								possibleNotes.remove(coolNote);
								possibleNotes.push(daNote);
								break;
							}
						}
					}
					else
					{
						possibleNotes.push(daNote);
						directionList.push(daNote.noteData);
					}
				}
			});

			for (note in dumbNotes)
			{
				FlxG.log.add("killing dumbass note at " + note.strumTime);
				note.kill();
				notes.remove(note, true);
				note.destroy();
			}

			possibleNotes.sort((a, b) -> Std.int(a.strumTime - b.strumTime));
			
			if (possibleNotes.length > 0)
			{
				for (shit in 0...pressArray.length)
				{
					// If a direction is hit that shouldn't be
					if (pressArray[shit] && !directionList.contains(shit))
						noteMiss(shit);
				}
				for (coolNote in possibleNotes)
				{
					if (pressArray[coolNote.noteData])
						goodNoteHit(coolNote);
				}
			}
			else
			{
				for (shit in 0...pressArray.length)
					if (pressArray[shit])
						noteMiss(shit);
			}
		}

		if (boyfriend.holdTimer > Conductor.stepCrochet * 4 * 0.001 && !holdArray.contains(true))
		{
			if (boyfriend.animation.curAnim.name.startsWith('sing') && !boyfriend.animation.curAnim.name.endsWith('miss'))
			{
				if (boyfriend.curCharacter != 'miku')
				     boyfriend.playAnim('idle');
			}
		}

		playerStrums.forEach(function(spr)
		{
			if (pressArray[spr.ID] && spr.animation.curAnim.name != 'confirm')
				spr.playAnim('pressed');
			if (!holdArray[spr.ID])
				spr.playAnim('static');
		});
	}

	public override function switchTo(nextState:FlxState):Bool
	{
		Assets.cache.clear(Paths.inst(PlayState.SONG.song));
		Assets.cache.clear(Paths.voices(PlayState.SONG.song));

		return super.switchTo(nextState);
	}

	function noteMiss(direction:Int = 1):Void
	{
		misses ++;
		health -= 0.04;
		killCombo();

		vocals.volume = 0;
		FlxG.sound.play(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.1, 0.2));

		switch (direction)
		{
			case 0:
				boyfriend.playAnim('singLEFTmiss', true);
			case 1:
				boyfriend.playAnim('singDOWNmiss', true);
			case 2:
				boyfriend.playAnim('singUPmiss', true);
			case 3:
				boyfriend.playAnim('singRIGHTmiss', true);
		}
	}

	function goodNoteHit(note:Note):Void
	{
		#if MODDING
		onGoodNoteHit(note);
		#end

		if (!note.wasGoodHit)
		{
			if (!note.isSustainNote)
			{
				combo ++;
				popUpScore(note);
			}

			if (note.noteData >= 0)
				health += 0.023;
			else
				health += 0.004;

			
			switch (note.noteData)
			{
				case 0:
					boyfriend.playAnim('singLEFT', true);
				case 1:
					boyfriend.playAnim('singDOWN', true);
				case 2:
					boyfriend.playAnim('singUP', true);
				case 3:
					boyfriend.playAnim('singRIGHT', true);
			}
            
            playerStrums.members[note.noteData].playAnim('confirm', true);
            
            if (boyfriend.bfbot)
            {
                boyfriend.animation.finishCallback = (animationName:String)->{
                  if (animationName == "singUP" || animationName == "singDOWN" || animationName == "singLEFT" || animationName == "singRIGHT"){
                     if (boyfriend.curCharacter != 'miku')
                         boyfriend.playAnim('idle');
                     else
                         boyfriend.dance();
                   }
                };
                playerStrums.members[note.noteData].animation.finishCallback = (animationName:String)->{
                  if (animationName == "confirm"){
                     playerStrums.members[note.noteData].playAnim('static');
                   }
                };
            }
			note.wasGoodHit = true;
			vocals.volume = 1;

			if (!note.isSustainNote)
			{
				note.kill();
				notes.remove(note, true);
				note.destroy();
			}
		}
	}

	function playerBot(daNote:Note, strums:StaticNotes, strumming, char:Player)
	{
		if (!char.isBot && !boyfriend.bfbot)
			return;

		if (!daNote.mustPress && daNote.wasGoodHit)
		{
			if (SONG.song != 'Tutorial' || SONG.song != 'Enduance')
				camZooming = true;

			var altAnim:String = daNote.altNote ? '-alt' : '';

			// WILL BE REMOVED SOON
			if (SONG.notes[storyDifficulty][Math.floor(curStep / 16)] != null)
			{
				if (SONG.notes[storyDifficulty][Math.floor(curStep / 16)].altAnim)
					altAnim = '-alt';
			}

			var noteData = Std.int(Math.abs(daNote.noteData));
			switch (noteData)
			{
				case 0:
					char.playAnim('singLEFT' + altAnim, true);
				case 1:
					char.playAnim('singDOWN' + altAnim, true);
				case 2:
					char.playAnim('singUP' + altAnim, true);
				case 3:
					char.playAnim('singRIGHT' + altAnim, true);
			}

			if (curStage != 'endless' && !PreferencesMenu.getPref('middlescroll'))
			{
				strums.members[noteData].playAnim('confirm', true);
				strumming[noteData] = true;
			}

			char.holdTimer = 0;

			if (SONG.needsVoices)
				vocals.volume = 1;

			daNote.kill();
			notes.remove(daNote, true);
			daNote.destroy();
		}

		// WIP interpolation shit? Need to fix the pause issue
		// daNote.y = (strumLine.y - (songTime - daNote.strumTime) * (0.45 * PlayState.SONG.speed[storyDifficulty]));

		if (daNote.isSustainNote && daNote.wasGoodHit)
		{
			if (daNote.y < -daNote.height)
			{
				daNote.active = false;
				daNote.visible = false;

				daNote.kill();
				notes.remove(daNote, true);
				daNote.destroy();
			}
		}
		if (daNote.tooLate || daNote.wasGoodHit)
		{
			if (daNote.tooLate && !boyfriend.bfbot)
			{
				noteMiss(daNote.noteData);
			}

			daNote.active = false;
			daNote.visible = false;

			daNote.kill();
			notes.remove(daNote, true);
			daNote.destroy();
		}
	}

	var fastCarCanDrive:Bool = true;

	function resetFastCar():Void
	{
		fastCar.x = -12600;
		fastCar.y = FlxG.random.int(140, 250);
		fastCar.velocity.x = 0;
		fastCarCanDrive = true;
	}

	function fastCarDrive()
	{
		FlxG.sound.play(Paths.soundRandom('carPass', 0, 1), 0.7);

		fastCar.velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
		fastCarCanDrive = false;
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			resetFastCar();
		});
	}

	function moveTank():Void
	{
		if (!inCutscene)
		{
			var daAngleOffset:Float = 1;
			tankAngle += FlxG.elapsed * tankSpeed;
			tankRolling.angle = tankAngle - 90 + 15;

			tankRolling.x = tankX + Math.cos(FlxAngle.asRadians((tankAngle * daAngleOffset) + 180)) * 1500;
			tankRolling.y = 1300 + Math.sin(FlxAngle.asRadians((tankAngle * daAngleOffset) + 180)) * 1100;
		}
	}

	var tankResetShit:Bool = false;
	var tankMoving:Bool = false;
	var tankAngle:Float = FlxG.random.int(-90, 45);
	var tankSpeed:Float = FlxG.random.int(5, 7);
	var tankX:Float = 400;

	var trainMoving:Bool = false;
	var trainFrameTiming:Float = 0;

	var trainCars:Int = 8;
	var trainFinishing:Bool = false;
	var trainCooldown:Int = 0;

	function trainStart():Void
	{
		trainMoving = true;
		trainSound.play(true);
	}

	var startedMoving:Bool = false;

	function updateTrainPos():Void
	{
		if (trainSound.time >= 4700)
		{
			startedMoving = true;
			if (gf.curCharacter == 'gf')
			    gf.playAnim('hairBlow');
		}

		if (startedMoving)
		{
			phillyTrain.x -= 400;

			if (phillyTrain.x < -2000 && !trainFinishing)
			{
				phillyTrain.x = -1150;
				trainCars -= 1;

				if (trainCars <= 0)
					trainFinishing = true;
			}

			if (phillyTrain.x < -4000 && trainFinishing)
				trainReset();
		}
	}

	function trainReset():Void
	{
		if (gf.curCharacter == 'gf')
		    gf.playAnim('hairFall');
		phillyTrain.x = FlxG.width + 200;
		trainMoving = false;
		// trainSound.stop();
		// trainSound.time = 0;
		trainCars = 8;
		trainFinishing = false;
		startedMoving = false;
	}

	function lightningStrikeShit():Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2));
		halloweenBG.animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		boyfriend.playAnim('scared', true);
		gf.playAnim('scared', true);
	}

	override function stepHit()
	{
		super.stepHit();
		if (Math.abs(FlxG.sound.music.time - (Conductor.songPosition - Conductor.offset)) > 20
			|| (SONG.needsVoices && Math.abs(vocals.time - (Conductor.songPosition - Conductor.offset)) > 20))
		{
			resyncVocals();
		}

		#if MODDING
		onStepHit();
		#end
	}

	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;

	override function beatHit()
	{
		super.beatHit();

		#if MODDING
		onBeatHit();
		#end

		if (generatedMusic)
			notes.sort(FlxSort.byY, FlxSort.DESCENDING);

		if (SONG.notes[storyDifficulty][Math.floor(curStep / 16)] != null)
		{
			if (SONG.notes[storyDifficulty][Math.floor(curStep / 16)].changeBPM)
			{
				Conductor.changeBPM(SONG.notes[storyDifficulty][Math.floor(curStep / 16)].bpm);
				FlxG.log.add('CHANGED BPM!');
			}
		}
		// FlxG.log.add('change bpm' + SONG.notes[storyDifficulty][Std.int(curStep / 16)].changeBPM);

		if (PreferencesMenu.getPref('camera-zoom'))
		{
			// HARDCODING FOR MILF ZOOMS!
			if (curSong.toLowerCase() == 'milf' && curBeat >= 168 && curBeat < 200 && camZooming && FlxG.camera.zoom < 1.35)
			{
				FlxG.camera.zoom += 0.015 * FlxCamera.defaultZoom;
				camHUD.zoom += 0.03;
			}
			
			if ((camZooming && FlxG.camera.zoom < (1.35 * FlxCamera.defaultZoom) && curBeat % 4 == 0))
			{
				FlxG.camera.zoom += 0.015 * FlxCamera.defaultZoom;
				camHUD.zoom += 0.03;
			}
		}

		iconP1.setGraphicSize(Std.int(iconP1.width + 30));
		iconP2.setGraphicSize(Std.int(iconP2.width + 30));

		iconP1.updateHitbox();
		iconP2.updateHitbox();

		/*if (curBeat % 8 == 7
				&& SONG.notes[storyDifficulty][Math.floor(curStep / 16)].mustHitSection
				&& combo > 5
				&& !SONG.notes[storyDifficulty][Math.floor(curStep / 16) + 1].mustHitSection)
			{
				trace('6 note combo!!');
		}*/

		if (curBeat % gfSpeed == 0)
			gf.dance();

		if (boyfriend.curCharacter.startsWith('miku') && !boyfriend.animation.curAnim.name.startsWith("sing"))
		{
			if (curBeat % 2 == 1)
				boyfriend.playAnim('danceLeft');
			if (curBeat % 2 == 0)
				boyfriend.playAnim('danceRight');
		}
		else if (curBeat % 2 == 0)
		{
			if (!boyfriend.animation.curAnim.name.startsWith("sing"))
				boyfriend.playAnim('idle');
		}
	    
	    if (!dad.animation.curAnim.name.startsWith("sing"))
				dad.dance();

		if (curBeat % 8 == 7 && curSong == 'Bopeebo')
			boyfriend.playAnim('hey', true);
		
		if (curBeat == 494 && curSong == 'Loid')
		{
			dad.playAnim('hey', true);
		}
		
		if (curBeat > 493 && curBeat < 495 && curSong == 'Loid')
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom + 0.3}, 0.2, {
				ease: FlxEase.quadInOut
			});
		}

		if (curBeat == 496 && curSong == 'Loid')
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom = 0.80}, 0.2, {
				ease: FlxEase.quadInOut
			});
		}

		if (curBeat == 312 && curSong == 'Voca' && curStage == 'expo-two')
		{
			bgblack.visible = true;
			bgblack.alpha = 0;
			FlxTween.tween(bgblack, {alpha: 1}, 2.5, {ease: FlxEase.quartInOut});
		}


		if (curBeat == 198 && curSong == 'Endurance')
		{
            bgblack.visible = true;
			bgblack.alpha = 0;
			FlxTween.tween(bgblack, {alpha: 1}, 0.3, {ease: FlxEase.quartInOut});
		}

		if (curBeat == 200 && curSong == 'Endurance')
		{
			camZooming = false;
			light1.visible = true;
			FlxTween.tween(bgblack, {alpha: 0}, 7.5, {ease: FlxEase.quartInOut});
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 1.3}, 0.2, {
				ease: FlxEase.quadInOut
			});
		}

		if (curBeat == 230 && curSong == 'Endurance')
		{
			FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom * 0.80}, 5.9, {
				ease: FlxEase.quadInOut
			});
		}

		if (curBeat == 264 && curSong == 'Endurance')
		{
			bgblack.visible = false;
			FlxTween.tween(light1, {alpha: 0}, 0.4, {ease: FlxEase.quartInOut});
		}

		//i would use a flxtimer but idk

		if (curBeat == 266 && curSong == 'Endurance')
		{
			light1.visible = false;
		}

		if (combo > 50 && curBeat == 566 && curSong == 'Loid')
		{
			FlxG.sound.play(Paths.sound('Crowd'));
		}

		if (combo > 50 && curBeat == 269 && curSong == 'Endurance')
		{
			FlxG.sound.play(Paths.sound('Crowd'));
		}

		if (misses == 0 && curSong == 'Tutorial-(Miku-Edition)' && curBeat == 113)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'Loid' && curBeat == 566)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}


		if (misses == 0 && curSong == 'Endurance' && curBeat == 269)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}
		
		if (misses == 0 && curSong == 'sekai-wa-Mada-Hajimatte-sura-inai' && curBeat == 271)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (combo > 50 && curBeat == 312 && curSong == 'Voca')
		{
			FlxG.sound.play(Paths.sound('Crowd'));
		}

		if (misses == 0 && curSong == 'Voca' && curBeat == 324)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'Endless' && curBeat == 361)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'PoPiPo' && curBeat == 245)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'Aishite' && curBeat == 135)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'SIU' && curBeat == 263)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (misses == 0 && curSong == 'Disappearance' && curBeat == 389)
		{
			perfect.visible = true;
			perfect.animation.play('perfect', true);
		}

		if (curSong == 'Endless')
		{
			if (lyricsArray[curBeat] != "" && lyricsArray[curBeat] != null) lyrics.text = lyricsArray[curBeat];
			if (lyrics.text == "-" && lyrics.text != null) lyrics.text = "";
		}

		if (curBeat % 16 == 15 && SONG.song == 'Tutorial' && dad.curCharacter == 'gf' && curBeat > 16 && curBeat < 48)
		{
			boyfriend.playAnim('hey', true);
			dad.playAnim('cheer', true);
		}

		foregroundSprites.forEach(function(spr:BGSprite)
		{
			spr.dance();
		});

		// boppin friends
		switch (curStage)
		{
			case 'expo':
					if ((curSong == 'Loid' && combo > 50 && curBeat > 566) || (combo > 50 && curBeat > 269 && curSong == 'Endurance'))
					{
						fiestaSalsa2.animation.play('cheer', true);
					} else {
						fiestaSalsa2.animation.play('dance', true);
					}
					if (curBeat % 2 == 1)
						fiestaSalsa.animation.play('light1', true);
					if (curBeat % 2 == 0)
						fiestaSalsa.animation.play('light2', true);
			case 'expo-two':
					if ((curSong == 'Voca' && combo > 50 && curBeat > 311))
					{
						fiestaSalsa2.animation.play('cheer', true);
					} else {
						fiestaSalsa2.animation.play('dance', true);
					}
					if (curBeat % 2 == 1)
						fiestaSalsa.animation.play('light1', true);
					if (curBeat % 2 == 0)
						fiestaSalsa.animation.play('light2', true);
			case 'concert':
					simpsBoppers.animation.play('bop2', true);
				
			case 'school':
				bgGirls.dance();

			case 'mall':
				upperBoppers.animation.play('bop', true);
				bottomBoppers.animation.play('bop', true);
				santa.animation.play('idle', true);

			case 'limo':
				grpLimoDancers.forEach(function(dancer:BackgroundDancer)
				{
					dancer.dance();
				});

				if (FlxG.random.bool(10) && fastCarCanDrive)
					fastCarDrive();
			case "philly":
				if (!trainMoving)
					trainCooldown += 1;

				if (curBeat % 4 == 0)
				{
					lightFadeShader.reset();

					phillyCityLights.forEach(function(light:FlxSprite)
					{
						light.visible = false;
					});

					curLight = FlxG.random.int(0, phillyCityLights.length - 1);

					phillyCityLights.members[curLight].visible = true;
					// phillyCityLights.members[curLight].alpha = 1;
				}

				if (curBeat % 8 == 4 && FlxG.random.bool(30) && !trainMoving && trainCooldown > 8)
				{
					trainCooldown = FlxG.random.int(-4, 0);
					trainStart();
				}
			case 'spooky':
				if (FlxG.random.bool(10) && curBeat > lightningStrikeBeat + lightningOffset)
					lightningStrikeShit();
			case 'tank':
				tankWatchtower.dance();
		}
	}

	var curLight:Int = 0;
}
