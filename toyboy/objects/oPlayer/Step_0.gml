/// Player Input
key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed (vk_space);

/// Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

///Jump
if (place_meeting(x,y+1,oWall)) && (key_jump)	
{
	vsp = -7	/// number is the jump height	
}	

/// Horazontal Hit Test
if (place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);	
	}
	hsp=0;
}
x = x + hsp; 

/// Vertical Hit Test
if (place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);	
	}
	vsp=0;
}
y = y + vsp; 


/// Animation and Sprite Triggers
	/// Jumping and Falling
if (!place_meeting(x,y+1,oWall)) && (key_jump)	
{
	sprite_index = sPlayerAir;
	image_speed= 0;	
	if (sign(vsp) > 0) image_index = 0; else image_index = 1; /// selects frame of sPlayerAir sprite
}
