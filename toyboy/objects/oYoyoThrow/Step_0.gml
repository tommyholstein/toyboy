/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,oPlayer)) global.yoyoAquired = true;

if(global.yoyoAquired) && (global.yoyo == true)
{
	if (mouse_check_button_pressed(mb_left))
	{
		Ymx = mouse_x;
		Ymy = mouse_y;
		
		audio_play_sound(rope,0,0);
	}
	if (mouse_check_button(mb_left)) //throw YOYO
	{
		x = Ymx;
		y = Ymy;
		thrownOut = true;
	}
	if (mouse_check_button_released(mb_left))
	{
		thrownOut = false;
		active = false;
	}
}

if (place_meeting(x,y,oHook)){
	active = true;
	x = x;
	y = y;
}