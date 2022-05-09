package;

using StringTools;

class Boyfriend extends Character
{
	public var startedDeath:Bool = false;
	public var bfbot:Bool = false;
	

	public function new(x:Float, y:Float, ?char:String = 'bf', ?bfbot:Bool = false)
	{
		super(x, y, char, true);
	}

	public function updateBfPos():Void
    {
       switch (PlayState.curStage)
	    {
		    case 'limo':
				y -= 220;
				x += 260;
			case 'mall':
				x += 200;
			case 'mall-evil':
				x += 320;
			case 'school':
				x += 200;
				y += 220;
			case 'school-evil':
				x += 200;
				y += 220;
			case 'expo':
				x += 100;
			case 'expo-two':
				x += 100;
				y -= 150;
			case 'endless':
				x += 100;
			case 'tank':
				x += 40;
         }
    }
	override function update(elapsed:Float)
    {
        if (!bfbot)
        {
           if (animation.curAnim.name.startsWith('sing'))
               holdTimer += elapsed;
           else
               holdTimer = 0;
        }
       
        if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished)
            playAnim('idle', true, false, 10);

        if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished && startedDeath)
            playAnim('deathLoop');

        super.update(elapsed);
    }
}
