#using scripts\core_common\ai_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace zm_ai_dog_electric;

// Namespace zm_ai_dog_electric/zm_ai_dog_electric
// Params 0, eflags: 0x2
// Checksum 0xc9c7635e, Offset: 0x80
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_ai_dog_electric", &__init__, undefined, #"zombie_dog_util" );
}

// Namespace zm_ai_dog_electric/zm_ai_dog_electric
// Params 0
// Checksum 0x7890e537, Offset: 0xd0
// Size: 0x1c
function __init__()
{
    level thread function_b2801783();
}

// Namespace zm_ai_dog_electric/zm_ai_dog_electric
// Params 0
// Checksum 0x433256f, Offset: 0xf8
// Size: 0x13e
function function_b2801783()
{
    level._effect[ #"dog_belly_glow" ] = #"zm_ai/fx8_dog_elec_belly_glow";
    level._effect[ #"dog_eyes_glow" ] = #"zm_ai/fx8_dog_elec_eye_glow";
    level._effect[ #"dog_head_glow" ] = #"zm_ai/fx8_dog_elec_head_glow";
    level._effect[ #"dog_tail_glow" ] = #"zm_ai/fx8_dog_elec_tail_glow";
    level._effect[ #"dog_torso_glow" ] = #"zm_ai/fx8_dog_elec_torso_glow";
    level._effect[ #"dog_gib" ] = #"zm_ai/fx8_dog_elec_death_exp";
    level.var_17c4823f = #"hash_6a3a7714a2c454fb";
}

