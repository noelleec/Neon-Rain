class EnemyCar extends MovieClip
{
	var speed;
	var shootTimer;
	
	function onLoad()
	{
		_x = 1150;
		_y = Math.random()*700;
		speed = Math.random()*15 + 6;
		shootTimer = 0;
	}
	
	function onEnterFrame()
	{
		_x -= speed;
		if(_x < -100)
		{
			this.removeMovieClip();
		}
		
		if(this.hitTest(_root.car))
		{
			_root.car.updateHealth(-20);
			explode();
		}
		
		shootTimer += 1
		if(shootTimer > 20)
		{
			shootTimer = 0;
			var missile = _root.attachMovie("EnemyMissile", "EnemyMissile" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
			missile._x = _x - 50;
			missile._y = _y + 2;
		}
	}
	
	function explode()
	{
		var explosion = _root.attachMovie("Explosion", "Explosion" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
		_root.car.updateScore(50);
	}
}