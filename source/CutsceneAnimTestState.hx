package;

import flxanimate.FlxAnimate;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;

class CutsceneAnimTestState extends FlxState
{
	var char:FlxAnimate;

	override public function create():Void
	{
		var bg = FlxGridOverlay.create(10, 10, FlxG.width * 4, FlxG.height * 4);
		bg.scrollFactor.set(0.5, 0.5);
		bg.screenCenter();
		add(bg);

        char = new FlxAnimate(0, 0, Paths.getTextureAtlas('tightBars'));
		char.antialiasing = true;
		add(char);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			if (!char.isPlaying)
				char.animation.play('');
			else
				char.animation.pause();
		}
		
		if (FlxG.keys.justPressed.BACKSPACE)
		    FlxG.switchState(new TitleState());

		char.x = FlxG.mouse.x;
		char.y = FlxG.mouse.y;
		
		if (FlxG.keys.pressed.E)
			FlxG.camera.zoom += 0.01;
		if (FlxG.keys.pressed.Q)
			FlxG.camera.zoom -= 0.01;
	
		super.update(elapsed);
	}
}
