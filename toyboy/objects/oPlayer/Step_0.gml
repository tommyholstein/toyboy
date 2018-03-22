var bbox_side;

/// Player Input
key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed (vk_space);
key_up = keyboard_check (vk_up);
key_down = keyboard_check (vk_down);

/// Calculate Movement
var move = key_right - key_left;
hsp = move*walksp;
vsp = vsp + grv;


// Yoyo Code
if(place_meeting(x,y,oYoyo)) yoyo = true; //walk on yoy to aquire

if(yoyo)
{
if (mouse_check_button_pressed(mb_left)) //throw YOYO
{
	mx = mouse_x;
	my = mouse_y;
	if(place_meeting(mx,my,oHook)){
		active = true;
	}
}

if(active)
{
	grv = 0.1;
	x += (mx - x) * 0.2;
	y += (my - y) * 0.2;
}

if (mouse_check_button_released (mb_left)) //release YOYO
{
	active = false;
	grv = .25;
}
}


//Ladder
if (key_up  || key_down)
{
	if(place_meeting(x,y,oLadder)) ladder = true;
}

if(ladder)
{
	vsp = 0;
	if(key_up)
	{
		vsp = -2;
		image_speed= 1;
		sprite_index = sPlayerClimb;
	}
	if(key_down)
	{
		vsp = 2;
		image_speed= 1;
		sprite_index = sPlayerClimb;
	}
	if (!place_meeting(x,y,oLadder)) ladder = false;
	if (key_jump) ladder = false;
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
if (! ladder){	//am i climbing a ladder?

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
}//end lader check

if (hsp !=0) image_xscale = sign(hsp); //flips palyer run for left nad right

if ((vsp =0) && (ladder)) image_speed= 0;  //if on ladder but not climbing stop animation


