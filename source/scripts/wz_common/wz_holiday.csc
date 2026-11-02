#namespace wz_holiday;

// Namespace wz_holiday/wz_holiday
// Params 0, eflags: 0x2
// Checksum 0x898b7260, Offset: 0xc0
// Size: 0xb2
function autoexec __init()
{
    level.var_65f7ae17 = isdefined( getgametypesetting( #"hash_270230afc32e5549" ) ) ? getgametypesetting( #"hash_270230afc32e5549" ) : 0;
    level.var_7b65cb7 = isdefined( getgametypesetting( #"hash_2e25d475b271a700" ) ) ? getgametypesetting( #"hash_2e25d475b271a700" ) : 0;
}

// Namespace wz_holiday/level_init
// Params 1, eflags: 0x40
// Checksum 0xe7134f11, Offset: 0x180
// Size: 0x3c
function event_handler[level_init] main( eventstruct )
{
    level thread function_c5d0e538();
    level thread function_af9a5cd8();
}

// Namespace wz_holiday/wz_holiday
// Params 0
// Checksum 0x4a835708, Offset: 0x1c8
// Size: 0x1e8
function function_af9a5cd8()
{
    if ( level.var_7b65cb7 )
    {
        chests = getdynentarray( "world_dynent_stash_supply" );
        ammo = getdynentarray( "world_dynent_stash_ammo" );
        health = getdynentarray( "world_dynent_stash_health" );
        
        foreach ( dynent in chests )
        {
            add_helico( dynent, #"p8_fxanim_wz_spd_supply_stash_01_mod" );
        }
        
        foreach ( dynent in ammo )
        {
            add_helico( dynent, #"p8_fxanim_wz_spd_supply_stash_ammo_mod" );
        }
        
        foreach ( dynent in health )
        {
            add_helico( dynent, #"p8_fxanim_wz_spd_supply_stash_health_mod" );
        }
    }
}

// Namespace wz_holiday/wz_holiday
// Params 0
// Checksum 0x724af990, Offset: 0x3b8
// Size: 0x5ac
function function_c5d0e538()
{
    if ( level.var_65f7ae17 )
    {
        chests = getdynentarray( "world_dynent_stash_supply" );
        ammo = getdynentarray( "world_dynent_stash_ammo" );
        health = getdynentarray( "world_dynent_stash_health" );
        
        foreach ( dynent in chests )
        {
            add_helico( dynent, #"p8_fxanim_wz_win_supply_stash_01_mod" );
        }
        
        foreach ( dynent in ammo )
        {
            add_helico( dynent, #"p8_fxanim_wz_win_supply_stash_ammo_mod" );
        }
        
        foreach ( dynent in health )
        {
            add_helico( dynent, #"p8_fxanim_wz_win_supply_stash_health_mod" );
        }
        
        var_76c1a919 = getdynent( #"hospital_stash" );
        
        if ( isdefined( var_76c1a919 ) )
        {
            add_helico( var_76c1a919, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_80d7570e = getdynent( #"hospital_stash_quest" );
        
        if ( isdefined( var_80d7570e ) )
        {
            add_helico( var_80d7570e, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        graveyard_chest = getdynent( #"zombie_stash_graveyard" );
        
        if ( isdefined( graveyard_chest ) )
        {
            add_helico( graveyard_chest, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_726be3fe = getdynent( #"zombie_stash_graveyard_quest" );
        
        if ( isdefined( var_726be3fe ) )
        {
            add_helico( var_726be3fe, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        diner_chest = getdynent( #"zombie_supply_stash_diner" );
        
        if ( isdefined( diner_chest ) )
        {
            add_helico( diner_chest, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_676cdb27 = getdynent( #"zombie_supply_stash_diner_quest" );
        
        if ( isdefined( var_676cdb27 ) )
        {
            add_helico( var_676cdb27, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        lighthouse_chest = getdynent( #"zombie_supply_stash_lighthouse" );
        
        if ( isdefined( lighthouse_chest ) )
        {
            add_helico( lighthouse_chest, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_667d5645 = getdynent( #"zombie_supply_stash_lighthouse_quest" );
        
        if ( isdefined( var_667d5645 ) )
        {
            add_helico( var_667d5645, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        boxing_gym_chest = getdynent( #"zombie_supply_stash_boxinggym" );
        
        if ( isdefined( boxing_gym_chest ) )
        {
            add_helico( boxing_gym_chest, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_b9d1e3a4 = getdynent( #"zombie_supply_stash_boxinggym_quest" );
        
        if ( isdefined( var_b9d1e3a4 ) )
        {
            add_helico( var_b9d1e3a4, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_739bc386 = getdynent( #"zombie_supply_stash_buried" );
        
        if ( isdefined( var_739bc386 ) )
        {
            add_helico( var_739bc386, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
        
        var_847e155a = getdynent( #"zombie_supply_stash_buried_quest" );
        
        if ( isdefined( var_847e155a ) )
        {
            add_helico( var_847e155a, #"p8_fxanim_wz_win_supply_stash_magic_box_mod" );
        }
    }
}

