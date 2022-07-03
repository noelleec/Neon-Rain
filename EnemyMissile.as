class EnemyMissile extends MovieClip
{
	var speed;
	
	function onLoad()
	{
		speed = -35;
	}
	
	function onEnterFrame()
	{
		_x += speed;
		if(this.hitTest(_root.car))
		{
			this.removeMovieClip();
			_root.car.updateHealth(-10);
		}
		
		if(_x < 0)
		{
			this.removeMovieClip();
		}
	}
}