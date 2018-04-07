//Item switching

if (global.bothaquired == true) && (global.yoyo == true) && (keyboard_check_released(ord("Q")))
{
		global.yoyo = false;
		global.yoyoAquired = false;
		boppers = true;
	
}
else if (global.bothaquried == true) && (boppers == true) && (keyboard_check_released(ord("Q")))
{
	
		global.yoyo = true;
		global.yoyoAquired = true;
		boppers = false;
	
}