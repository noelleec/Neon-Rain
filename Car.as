class Car extends MovieClip
{
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	var score;
	var health;
	
	function newGame()
	{

		this._visible = true;
		_root.gameOverMenu._visible = false;
		_root.playAgainButton._visible = false;
		resetHealth();
		resetScore();
	}
	
	function explode()
	{
		this._visible = false;
		var explosion = _root.attachMovie("Explosion", "Explosion" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		for(var i in enemies)
		{
			enemies[i].explode();
		}
	}
		
	function updateHealth(points)
	{
		health += points;
		if(health<1)
		{
			health = 0;
			_root.gameOverMenu._visible = true;
			_root.playAgainButton._visible = true;
			explode();
		}
		_root.healthMeter.bar._xscale = health;
	}
	
	function resetHealth()
	{
		health = 100;
		_root.healthMeter.bar._xscale = 100;
	}
	
	function resetScore()
	{
		score = 0;
		_root.scoreText.text = score;
	}
	
	function updateScore(points)
	{
		score += points;
		_root.scoreText.text = score;
	}
	function onLoad()
	{
		velocity = 10;
		health = 100;
		shootLimiter = 0;
		enemyTimer = 0;
		enemies = [];
		resetScore();
		resetHealth();
		
		_root.gameOverMenu._visible = false;
		_root.playAgainButton._visible = false;
		_root.playAgainButton.onPress = gotoAndPlay("Scene 3", 2);
		_root.playAgainButton.onPress = function()
		{
			_root.car.newGame();
		}
	}
	
	function onEnterFrame()
	{
		if(_visible == true)
		{
			shootLimiter += 1;
			
			if(Key.isDown(Key.RIGHT))
			{
				_x = _x + velocity;
			}
			if(Key.isDown(Key.LEFT))
			{
				_x = _x - velocity;
			}
			if(Key.isDown(Key.UP))
			{
				_y = _y - velocity;
			}
			if(Key.isDown(Key.DOWN))
			{
				_y = _y + velocity;
			}
			
			if(Key.isDown(Key.SPACE) && shootLimiter > 8)
			{
				shootLimiter = 0;
				var missile = _root.attachMovie("Missile", "Missile" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
				missile._x = _x + 80;
				missile._y = _y + 10;
			}
			enemyTimer += 1;
			if(enemyTimer > 60)
			{
				enemyTimer = 0;
				var enemy = _root.attachMovie("EnemyCar", "EnemyCar" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
				enemies.push(enemy);
			}
		}
	}
}

