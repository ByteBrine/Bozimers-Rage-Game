/// @desc Set-Up

// Init
grv = 0.25; 
hsp = 0; 
vsp = 0; 
dir = 1;

// Values
hspWalk = 2; 
vspJump = -4; 

// Buffers
jumpBufferMax = 6; 
jumpBuffer = 0;

// Abilities
canJump = 0; 
canDash = false;
deathJumped = false;
shard_collected = false;

// Distances [Dash]
onGround = false; 
dashDistance = 64;
dashTime = 28;

// States
state = PLAYER.RUN;

// Hud
if (!instance_exists(oHud)) instance_create_depth(x, y, -999, oHud);

