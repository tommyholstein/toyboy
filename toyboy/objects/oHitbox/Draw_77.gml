if(place_meeting(x,y,oBWall))
	{
		global.wallHit = true;
		instance_destroy();
	}