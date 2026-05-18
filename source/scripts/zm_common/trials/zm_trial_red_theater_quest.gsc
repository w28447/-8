#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;
#using scripts\zm\zm_red_main_quest;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_ui_inventory;

#namespace zm_trial_red_theater_quest;

// Namespace zm_trial_red_theater_quest/zm_trial_red_theater_quest
// Params 0, eflags: 0x2
// Checksum 0xe552e8f9, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_red_theater_quest", &__init__, undefined, undefined );
}

// Namespace zm_trial_red_theater_quest/zm_trial_red_theater_quest
// Params 0
// Checksum 0x3e514d2c, Offset: 0xe0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"red_theater_quest", &on_begin, &on_end );
}

// Namespace zm_trial_red_theater_quest/zm_trial_red_theater_quest
// Params 0, eflags: 0x4
// Checksum 0x9f359c0e, Offset: 0x148
// Size: 0x64
function private on_begin()
{
    level zm_ui_inventory::function_7df6bb60( #"zm_red_objective_progress", 5 );
    
    if ( !( isdefined( level.var_4e4909a6 ) && level.var_4e4909a6 ) )
    {
        level thread function_57755268();
    }
}

// Namespace zm_trial_red_theater_quest/zm_trial_red_theater_quest
// Params 1, eflags: 0x4
// Checksum 0x897829d7, Offset: 0x1b8
// Size: 0x66
function private on_end( round_reset )
{
    if ( !round_reset )
    {
        if ( !( isdefined( level.var_84199d1 ) && level.var_84199d1 ) )
        {
            zm_trial::fail( undefined, getplayers() );
        }
    }
    
    level.var_84199d1 = undefined;
}

// Namespace zm_trial_red_theater_quest/zm_trial_red_theater_quest
// Params 0
// Checksum 0x8282395f, Offset: 0x228
// Size: 0xa0
function function_57755268()
{
    level endon( #"end_game" );
    level.var_4e4909a6 = 1;
    zm_red_main_quest::play_think();
    zm_red_main_quest::play_cleanup( 0, 0 );
    level.var_84199d1 = 1;
    level.var_4e4909a6 = undefined;
    level endon( #"trial_round_end" );
    wait 5;
    level notify( #"kill_round_wait" );
}

