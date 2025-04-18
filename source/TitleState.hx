package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;
import flixel.FlxG;
import shadersLmfao.ColorSwap;
import ui.AtlasText;

using StringTools;

#if discord_rpc
import Discord.DiscordClient;
import lime.app.Application;
import sys.thread.Thread;
#end

class TitleState extends MusicBeatState
{
	public static var initialized:Bool = false;

	var startedIntro:Bool;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var swagShader:ColorSwap;

	var dotLogo:FlxSprite;

	override public function create():Void
	{
		startedIntro = false;

		FlxG.game.focusLostFramerate = 60;

		swagShader = new ColorSwap();

		FlxG.sound.muteKeys = [ZERO, NUMPADZERO];

		curWacky = FlxG.random.getObject(getIntroTextShit());

		FlxG.sound.cache(Paths.music('freakyMenu'));

		// DEBUG BULLSHIT

		super.create();

		ui.PreferencesMenu.initPrefs();

		PlayerSettings.init();

		Highscore.load();

		#if newgrounds
		NGio.init();
		#end

		dotLogo = new FlxSprite().loadGraphic(Paths.loadImage('dotArt'));
		dotLogo.screenCenter();
		dotLogo.antialiasing = true;
		add(dotLogo);
		FlxTween.tween(dotLogo, {y: dotLogo.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			// StoryMenuState.weekUnlocked = FlxG.save.data.weekUnlocked;

			if (StoryMenuState.weekUnlocked.length < 4)
				StoryMenuState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryMenuState.weekUnlocked[0])
				StoryMenuState.weekUnlocked[0] = true;
		}

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});

		#if discord_rpc
		DiscordClient.initialize();

		Application.current.onExit.add(function(exitCode)
		{
			DiscordClient.shutdown();
		});
		#end
	}

	var logo:FlxSprite;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;
	var mikuDance:FlxSprite;

	function startIntro()
	{
		dotLogo.destroy();

		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;

			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		Conductor.changeBPM(102);
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		logo = new FlxSprite(-150 + 160, -100 + 110);
		logo.frames = Paths.getSparrowAtlas('logoBumpin');
		logo.antialiasing = true;
		logo.animation.addByPrefix('bump', 'logo bumpin', 24);
		logo.animation.play('bump');
		logo.setGraphicSize(Std.int(logo.width * 0.96));
		logo.updateHitbox();
		logo.shader = swagShader.shader;

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gfDance.antialiasing = true;
		add(gfDance);
		gfDance.shader = swagShader.shader;
		add(logo);
		
		mikuDance = new FlxSprite(FlxG.width * 0.48, FlxG.height * 0.1);
		mikuDance.frames = Paths.getSparrowAtlas('mikuDance');
		mikuDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		mikuDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		mikuDance.antialiasing = true;
		add(mikuDance);
		mikuDance.shader = swagShader.shader;

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		titleText.screenCenter(X);
		//titleText.setGraphicSize(Std.int(titleText.width * 0.8));
		add(titleText);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.loadImage('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = true;

		#if !mobile
		FlxG.mouse.visible = false;
		#end

		if (initialized)
			skipIntro();
		else
			initialized = true;

		startedIntro = true;
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
			
		if (FlxG.keys.justPressed.EIGHT)
		    FlxG.switchState(new CutsceneAnimTestState());

		if (FlxG.keys.justPressed.F)
			FlxG.fullscreen = !FlxG.fullscreen;
		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
				pressedEnter = true;
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		if (pressedEnter && !transitioning && skippedIntro)
		{
			#if newgrounds
			NGio.unlockMedal(60960);

			// If it's Friday according to da clock
			if (Date.now().getDay() == 5)
				NGio.unlockMedal(61034);
			#end

			if (titleText != null)
				titleText.animation.play('press');

			FlxG.sound.music.pitch = 1;
			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
			transitioning = true;

			Assets.cache.clear(Paths.loadImage('dotArt').key);
			Assets.cache.clear(Paths.loadImage('gfDanceTitle').key);
			Assets.cache.clear(Paths.loadImage('mikuDance').key);
			Assets.cache.clear(Paths.loadImage('logoBumpin').key);
			Assets.cache.clear(Paths.loadImage('titleEnter').key);

			#if newgrounds
			NGio.checkVersion(function(ver:String)
			{
				if (ver.split(" ")[0].trim() != ver.trim())
					trace('OLD VERSION!');

				FlxG.switchState(new MainMenuState());
			});
			#else
			FlxG.switchState(new MainMenuState());
			#end
		}

		if (pressedEnter && !skippedIntro && initialized)
			skipIntro();

		if (controls.UI_LEFT)
			swagShader.update(-elapsed * 0.1);
		else if (controls.UI_RIGHT)
			swagShader.update(elapsed * 0.1);

	    if (controls.UI_UP)
	        FlxG.sound.music.pitch += 0.01;
	   else if (controls.UI_DOWN)
	        FlxG.sound.music.pitch -= 0.01;

		super.update(elapsed);
	}

	function createText(textArray:Array<String>)
	{
		for (text in textArray)
		{
			var coolText:AtlasText = new AtlasText(0, (textGroup.length * 60) + 200, text, Bold);
			coolText.screenCenter(X);
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	override function beatHit()
	{
		super.beatHit();

		if (logo != null)
			logo.animation.play('bump');

		danceLeft = !danceLeft;

		danceLeft ? gfDance.animation.play('danceRight') : gfDance.animation.play('danceLeft');
		danceLeft ? mikuDance.animation.play('danceRight') : mikuDance.animation.play('danceLeft');

		if (lastBeat < curBeat)
		{
			switch (lastBeat)
			{
				case 1:
					createText(['ninjamuffin99', 'phantomArcade', 'kawaisprite', 'evilsk8er']);
				case 3:
					createText(['present']);
				case 4:
					deleteCoolText();
				case 5:
					createText(['In association', 'with']);
				case 7:
					createText(['newgrounds']);
					ngSpr.visible = true;
				case 8:
					deleteCoolText();
					ngSpr.visible = false;
				case 9:
					createText([curWacky[0]]);
				case 11:
					createText([curWacky[1]]);
				case 12:
					deleteCoolText();
				case 13:
					createText(['Friday']);
				case 14:
					createText(['Night']);
				case 15:
					createText(['Funkin']);
				case 16:
					skipIntro();
			}

			lastBeat = curBeat;
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			remove(credGroup);
			skippedIntro = true;
		}
	}
}
