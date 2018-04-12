/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,oPlayer))
{
	if (room == lvl1)
	{
		room_goto (lvl2);
	}
	if (room == lvl2)
		room_goto (lvl1);
}

