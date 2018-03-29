if(place_meeting(x,y,oBWall))
	{
		global.wallHit = true;
	}
	
else if (!place_meeting(x,y,oBWall))
	{
		image_xscale = -1;
		if (place_meeting(x,y,oBWall))
			{
				global.wallHit = true;
			}
	}
	instance_destroy();