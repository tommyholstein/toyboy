 /// @description Insert description here
// You can write your code in this editor

//walk over the yoyo to make it disapper

if(place_meeting(x,y,oPlayer))
{
	image_speed = 0;
	image_index = 1;
}

if (global.bothaquired == true)
	{
		x = -100;
		y = -100;
		//puts the Boppers off screen so you don't collide with them again
	}
	
