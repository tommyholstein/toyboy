var bbox_side;

/// Player Input
key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed (vk_space);

/// Calculate Movement
var move = key_right - key_left;
hsp = move*walksp;
vsp = vsp + grv;


// Grappling Code
// CHecking hook
if (mouse_check_button_pressed(mb_left)) //throw YOYO
{
	mx = mouse_x;
	my = mouse_y;
	if(place_meeting(mx,my,oHook)){
		active = true;
	}
}

if (mouse_check_button_released (mb_left)) //release YOYO
{
	active = false;
}


///Jump
if (place_meeting(x,y+1,oWall)) && (key_jump) 	
{
	vsp = -7	/// number is the jump height	
}	

// HIT TESTING ground
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
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed= 0;	
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; /// selects frame of sPlayerAir sprite
}
else
{
	image_speed= 1;
	if	(hsp==0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerRun;	
	}
}

if (hsp !=0) image_xscale = sign(hsp);
