#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_shared_ingame_objective;

// Namespace ct_shared_ingame_objective
// Method(s) 8 Total 15
class cct_shared_ingame_objective : cluielem
{

    var _uid;

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0xd72c1375, Offset: 0xe38
    // Size: 0x3c
    function set_objpoints( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "objpoints", value );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0x32a6fe86, Offset: 0xdf0
    // Size: 0x3c
    function set_objectivetext( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "objectiveText", value );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0xa21b9a61, Offset: 0x3a8
    // Size: 0xa3c
    function set_state( player, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 0 );
            return;
        }
        
        if ( #"fadeout" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 1 );
            return;
        }
        
        if ( #"timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 2 );
            return;
        }
        
        if ( #"timer_on_fadeout" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 3 );
            return;
        }
        
        if ( #"dynobj_killtoearnhellstorm" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 4 );
            return;
        }
        
        if ( #"dynobj_killtoearnhellstorm_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 5 );
            return;
        }
        
        if ( #"dynobj_killtoearnrcxd" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 6 );
            return;
        }
        
        if ( #"dynobj_killtoearnrcxd_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 7 );
            return;
        }
        
        if ( #"dynobj_killtoearnswat" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 8 );
            return;
        }
        
        if ( #"dynobj_killtoearnswat_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 9 );
            return;
        }
        
        if ( #"dynobj_killtoearnseraphchopper" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 10 );
            return;
        }
        
        if ( #"dynobj_killtoearnlightningstrike_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 11 );
            return;
        }
        
        if ( #"dynobj_killtoearnlightningstrike" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 12 );
            return;
        }
        
        if ( #"dynobj_killtoearnseraphchopper_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 13 );
            return;
        }
        
        if ( #"dynobj_killsoldiers" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 14 );
            return;
        }
        
        if ( #"dynobj_killsoldiers_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 15 );
            return;
        }
        
        if ( #"dynobj_killwithpurifier" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 16 );
            return;
        }
        
        if ( #"dynobj_killwithpurifier_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 17 );
            return;
        }
        
        if ( #"dynobj_killmantises" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 18 );
            return;
        }
        
        if ( #"dynobj_killmantises_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 19 );
            return;
        }
        
        if ( #"dynobj_earnmantis" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 20 );
            return;
        }
        
        if ( #"dynobj_earnmantis_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 21 );
            return;
        }
        
        if ( #"dynobj_earnstraferun" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 22 );
            return;
        }
        
        if ( #"dynobj_earnstraferun_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 23 );
            return;
        }
        
        if ( #"dynobj_killtoearnnomadks" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 24 );
            return;
        }
        
        if ( #"dynobj_killtoearnnomadks_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 25 );
            return;
        }
        
        if ( #"dynobj_killzombies" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 26 );
            return;
        }
        
        if ( #"dynobj_killzombies_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 27 );
            return;
        }
        
        if ( #"dynobj_earndart" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 28 );
            return;
        }
        
        if ( #"dynobj_earndart_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 29 );
            return;
        }
        
        if ( #"dynobj_teamdefend" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 30 );
            return;
        }
        
        if ( #"dynobj_teamdefend_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 31 );
            return;
        }
        
        if ( #"dynobj_killspawnbeacons" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 32 );
            return;
        }
        
        if ( #"dynobj_killspawnbeacons_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 33 );
            return;
        }
        
        if ( #"dynobj_killwiretrappedenemies" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 34 );
            return;
        }
        
        if ( #"dynobj_killwiretrappedenemies_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 35 );
            return;
        }
        
        if ( #"oneline" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 36 );
            return;
        }
        
        if ( #"oneline_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 37 );
            return;
        }
        
        if ( #"dynobj_killenemies" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 38 );
            return;
        }
        
        if ( #"dynobj_killenemies_timer_on" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 39 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1
    // Checksum 0x1dbd82bc, Offset: 0x378
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0xf84c5283, Offset: 0x328
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "ct_shared_ingame_objective", persistent );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1
    // Checksum 0x6311e365, Offset: 0x280
    // Size: 0x9c
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 6, "int" );
        cluielem::function_dcb34c80( "string", "objectiveText", 1 );
        cluielem::add_clientfield( "objpoints", 1, 11, "int" );
    }

}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0xb7a53e0e, Offset: 0xf8
// Size: 0x40
function register( uid )
{
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0x16f98f1b, Offset: 0x140
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0x1ccb13cf, Offset: 0x180
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0x8c9ef8be, Offset: 0x1a8
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0x3b23477e, Offset: 0x1d0
// Size: 0x28
function set_state( player, state_name )
{
    [[ self ]]->set_state( player, state_name );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0x330cc44a, Offset: 0x200
// Size: 0x28
function set_objectivetext( player, value )
{
    [[ self ]]->set_objectivetext( player, value );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0xa6d15dd0, Offset: 0x230
// Size: 0x28
function set_objpoints( player, value )
{
    [[ self ]]->set_objpoints( player, value );
}

