image_speed = 0;
if (global.wallHit == true)
	{
		image_speed = 1;
		if (image_index > image_number - 1) instance_destroy();
	}
	