//Item switching

if (global.bothaquired == true) && (global.yoyo == true) && (global.boppers == false)
{
		global.yoyo = false;
		global.yoyoAquired = false;
		global.boppers = true;
		
		
	
}
else if (global.bothaquired == true) && (global.boppers == true) && (global.yoyo == false)
{
	
		global.yoyo = true;
		global.yoyoAquired = true;
		global.boppers = false;
		
		instance_create_depth(oPlayer.x,oPlayer.y+26,20,oYoyoThrow)
		
}