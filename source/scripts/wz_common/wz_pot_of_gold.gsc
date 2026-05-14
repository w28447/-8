#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world;

#namespace wz_pot_of_gold;

// Namespace wz_pot_of_gold/wz_pot_of_gold
// Params 0, eflags: 0x2
// Checksum 0x156585ce, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_pot_of_gold", &__init__, undefined, undefined );
}

// Namespace wz_pot_of_gold/wz_pot_of_gold
// Params 0
// Checksum 0x12251084, Offset: 0xc0
// Size: 0xcc
function __init__()
{
    level.var_522db246 = isdefined( getgametypesetting( #"hash_507a891c5b5e7599" ) ) ? getgametypesetting( #"hash_507a891c5b5e7599" ) : 0;
    customgame = gamemodeismode( 1 ) || gamemodeismode( 7 );
    
    if ( customgame || !level.var_522db246 )
    {
        level thread function_7e4aeb0b();
    }
}

// Namespace wz_pot_of_gold/wz_pot_of_gold
// Params 0, eflags: 0x4
// Checksum 0x7f0e0e6c, Offset: 0x198
// Size: 0x140
function private function_7e4aeb0b()
{
    item_world::function_4de3ca98();
    a_e_pots = getdynentarray( #"hash_37a64c24861c7172" );
    
    foreach ( e_pot in a_e_pots )
    {
        item_world::function_160294c7( e_pot );
    }
    
    a_e_pots = getdynentarray( #"wz_event_pot_of_gold" );
    
    foreach ( e_pot in a_e_pots )
    {
        item_world::function_160294c7( e_pot );
    }
}

