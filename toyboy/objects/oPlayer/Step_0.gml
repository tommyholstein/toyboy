var bbox_side;



/// Player Input
key_left = keyboard_check (vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check (vk_right)|| keyboard_check(ord("D"));
key_jump = keyboard_check_pressed (vk_space);
key_up = keyboard_check (vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check (vk_down) || keyboard_check(ord("S"));

/// Calculate Movement
var move = key_right - key_left;
global.hsp = move*walksp;
vsp = vsp + grv;


// Yoyo Code
if(place_meeting(x,y,oYoyo)) global.yoyo = true; //walk on yoyo to aquire

if(global.yoyo == true) && (global.yoyoAquired == true)
{ 
	if (global.yoyo == true) && (mouse_check_button_pressed(mb_left)) //throw YOYO
		{
			mx = mouse_x;
			my = mouse_y;
			if (place_meeting(mx,my,oHook))
				{
					active = true;
				}
		}

	if(active)
		{
			grv = 0.1;
			x += (mx - x) * 0.2;
			y += (my - y) * 0.2;
			if(keyboard_check (vk_right))
				{ 
					x= x +15;
				}
			if(keyboard_check (vk_left))
				{ 
					x= x -15;
				}
		}

	if (mouse_check_button_released (mb_left)) //release YOYO
		{
			active = false;
			grv = .25;
		}
}



//Boppers Code
if(place_meeting(x,y,oBoppers)) 
{
	global.yoyo = false; //turns off yoyo
	global.yoyoAquired = false
	global.boppers = true; //walk on boppers to aquire
	global.bothaquired = true; //shows that both items have been aquired
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
if (place_meeting(x+global.hsp,y,oWall))
{
	while(!place_meeting(x+sign(global.hsp),y,oWall))
	{
		x = x + sign(global.hsp);	
	}
	global.hsp=0;
}
x = x + global.hsp; 

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
<<<<<<< HEAD
<<<<<<< HEAD
		sprite_index = sPlayerRun;	
=======
=======
>>>>>>> parent of d9d4c5d... Revert "Bopper Charge Animation"
		image_speed= 1;
		if	(global.hsp==0) && (keyboard_check("vk_nokey"))
			{
				sprite_index = sPlayer;
				
			}
		else if (global.hsp == 0) && (global.yoyo == false) && (global.boppers == true) && (keyboard_check(ord("E")))
					{
						sprite_index = sBopperCharge;
<<<<<<< HEAD
						if (image_speed > 0)
							 {
							 if (image_index > image_number - 1)
									{
										image_speed = 0;
										global.bopperCharged = true;
										instance_create_depth(x,y,10,oHitbox);
										
									}
=======
						if image_speed > 0
							 {
							 if (image_index > image_number - 1)
									image_speed = 0;
									if (image_index == 14) global.bopperCharged = true;
									
>>>>>>> parent of d9d4c5d... Revert "Bopper Charge Animation"
									
							 }
					}
		else if (global.hsp > 0) && ((global.yoyo == false) || (global.yoyo == true)) && (global.boppers == false)
			{
				sprite_index = sPlayerRun;	
			}
			
		else if (global.hsp > 0) && (global.bothaquired == true) && (global.boppers == true)
			{
				sprite_index = sBopperWalkRight;
				
			}
<<<<<<< HEAD
>>>>>>> parent of 9606767... Revert "Wall Destroys When Hit"
=======
>>>>>>> parent of d9d4c5d... Revert "Bopper Charge Animation"
	}
}//end lader check

if (global.hsp !=0) image_xscale = sign(global.hsp); //flips palyer run for left nad right

if ((vsp =0) && (ladder)) image_speed= 0;  //if on ladder but not climbing stop animation