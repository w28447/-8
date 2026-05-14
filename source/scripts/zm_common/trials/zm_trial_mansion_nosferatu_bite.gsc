#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace zm_trial_mansion_nosferatu_bite;

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 0, eflags: 0x2
// Checksum 0x792c508b, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_mansion_nosferatu_bite", &__init__, undefined, undefined );
}

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 0
// Checksum 0x6bd4a7f8, Offset: 0xf8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"mansion_nosferatu_bite", &on_begin, &on_end );
}

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 1, eflags: 0x4
// Checksum 0x39f0ba5c, Offset: 0x160
// Size: 0xf4
function private on_begin( var_53c7b205 = #"1" )
{
    level.var_53c7b205 = zm_trial::function_5769f26a( var_53c7b205 );
    
    foreach ( player in getplayers() )
    {
        player thread function_13db986c( level.var_53c7b205 );
    }
    
    callback::on_spawned( &on_player_spawned );
}

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 1, eflags: 0x4
// Checksum 0xa6fec0ea, Offset: 0x260
// Size: 0x36
function private on_end( round_reset )
{
    callback::remove_on_spawned( &on_player_spawned );
    level.var_53c7b205 = undefined;
}

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 0, eflags: 0x4
// Checksum 0xc0896b0e, Offset: 0x2a0
// Size: 0x24
function private on_player_spawned()
{
    self thread function_13db986c( level.var_53c7b205 );
}

// Namespace zm_trial_mansion_nosferatu_bite/zm_trial_mansion_nosferatu_bite
// Params 1, eflags: 0x4
// Checksum 0xf75248d9, Offset: 0x2d0
// Size: 0xd6
function private function_13db986c( var_53c7b205 )
{
    self notify( "48c46c9de397db92" );
    self endon( "48c46c9de397db92" );
    self endon( #"death" );
    level endon( #"trial_round_end", #"end_game" );
    self waittill( #"hash_7a32b2af2eef5415" );
    
    while ( true )
    {
        if ( isalive( self ) && !self laststand::player_is_in_laststand() )
        {
            self dodamage( var_53c7b205, self.origin );
        }
        
        wait 1;
    }
}

