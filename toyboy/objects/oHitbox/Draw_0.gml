if(place_meeting(x,y,oBWall)) // if the hitbox touches the breakable wall...
	{
		global.wallHit = true;
		audio_play_sound(hit,0,0);
		with (instance_nearest(x,y,oBWall)) //ONLY with the nearest instance
			{
			image_speed = 3;
			if (image_index > image_number - 1) 
				{
						instance_destroy();
						audio_play_sound(falling_brick,0,0);
				}
				walldestroyed = true;
			}
	}
	
else if (!place_meeting(x,y,oBWall)) // otherwise, if it doesn't hit the breakable wall...
	{
		image_xscale = -1; // flip horizontally...
		if (place_meeting(x,y,oBWall)) // and check if it would hit the wall that way.
			{
				global.wallHit = true;
				audio_play_sound(hit,0,0);
					with (instance_nearest(x,y,oBWall)) //ONLY with the nearest instance
					{
						image_speed = 3;
						if (image_index > image_number - 1) 
							{										
								instance_destroy();
								audio_play_sound(falling_brick,0,0);
							}
						walldestroyed = true;
					}
					
			}
		
	}
	
instance_destroy();
	

