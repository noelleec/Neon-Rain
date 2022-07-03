class Missile extends MovieClip
{
	var speed;
	
	function onLoad()
	{
		speed = 20;
	}
	
	function onEnterFrame()
	{
		_x += speed;
		
		for(var i in _root.car.enemies)
		{
			if(this.hitTest(_root.car.enemies[i]))
			{
				this.removeMovieClip();
				_root.car.enemies[i].explode();
			}
		}
		
		if(_x > 1046)
		{
			this.removeMovieClip();
		}
	}
}
