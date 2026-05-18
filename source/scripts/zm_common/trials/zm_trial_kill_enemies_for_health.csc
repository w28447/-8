#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_kill_enemies_for_health;

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 0, eflags: 0x2
// Checksum 0x60d9e7b5, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_kill_enemies_for_health", &__init__, undefined, undefined );
}

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 0
// Checksum 0x52f15b95, Offset: 0xc0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"kill_enemies_for_health", &on_begin, &on_end );
}

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 2, eflags: 0x4
// Checksum 0x103696eb, Offset: 0x128
// Size: 0x2e
function private on_begin( local_client_num, params )
{
    level.var_7db2b064 = &function_ecc5a0b9;
}

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 1, eflags: 0x4
// Checksum 0x5ff4ecbd, Offset: 0x160
// Size: 0x16
function private on_end( local_client_num )
{
    level.var_7db2b064 = undefined;
}

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 0
// Checksum 0x81db9f97, Offset: 0x180
// Size: 0x32, Type: bool
function is_active()
{
    challenge = zm_trial::function_a36e8c38( #"kill_enemies_for_health" );
    return isdefined( challenge );
}

// Namespace zm_trial_kill_enemies_for_health/zm_trial_kill_enemies_for_health
// Params 3, eflags: 0x4
// Checksum 0xe515960f, Offset: 0x1c0
// Size: 0x44, Type: bool
function private function_ecc5a0b9( local_client_num, player, damage )
{
    if ( int( damage ) <= 1 )
    {
        return true;
    }
    
    return false;
}

