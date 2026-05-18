#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\zm\zm_hms_util;
#using scripts\zm_common\zm_sq;

#namespace zm_office_ee_delusional_dempsey;

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 0
// Checksum 0x291f700c, Offset: 0xc0
// Size: 0x24
function init()
{
    init_flags();
    init_quest();
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 0
// Checksum 0x1c04090a, Offset: 0xf0
// Size: 0xa4
function init_flags()
{
    level flag::init( #"hash_3e2d063d97c06905" );
    level flag::init( #"hash_8987a45b2eda7c4" );
    level flag::init( #"hash_743603caa0ee0976" );
    level flag::init( #"hash_370781d7705e4e18" );
    level flag::init( #"hash_3b152242499836c8" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 0
// Checksum 0x8024a27b, Offset: 0x1a0
// Size: 0x26c
function init_quest()
{
    level.var_51acdb19 = getent( "dempsey_grenade", "targetname" );
    level.var_a7a99ef1 = struct::get( #"dempsey_audio" );
    level.var_cd51aa28 = 0;
    level.var_440b230b = 0;
    zm_sq::register( #"delusional_dempsey", #"step_1", #"delusional_dempsey_step1", &delusional_dempsey_step1_setup, &delusional_dempsey_step1_cleanup );
    zm_sq::register( #"delusional_dempsey", #"step_2", #"delusional_dempsey_step2", &delusional_dempsey_step2_setup, &delusional_dempsey_step2_cleanup );
    zm_sq::register( #"delusional_dempsey", #"step_3", #"delusional_dempsey_step3", &delusional_dempsey_step3_setup, &delusional_dempsey_step3_cleanup );
    zm_sq::register( #"delusional_dempsey", #"step_4", #"delusional_dempsey_step4", &delusional_dempsey_step4_setup, &delusional_dempsey_step4_cleanup );
    zm_sq::register( #"delusional_dempsey", #"step_5", #"delusional_dempsey_step5", &delusional_dempsey_step5_setup, &delusional_dempsey_step5_cleanup );
    zm_sq::start( #"delusional_dempsey" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 1
// Checksum 0x283a5d36, Offset: 0x418
// Size: 0x6c
function delusional_dempsey_step1_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level flag::wait_till( #"hash_5df188993c013698" );
        level.var_51acdb19 thread grenade_watcher();
        level flag::wait_till( #"hash_3e2d063d97c06905" );
    }
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 2
// Checksum 0x3136a84d, Offset: 0x490
// Size: 0xb4
function delusional_dempsey_step1_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_cd51aa28 = 1;
        level flag::set( #"hash_3e2d063d97c06905" );
        return;
    }
    
    level.var_cd51aa28 = 1;
    playsoundatposition( #"hash_259ff339b748935e", level.var_a7a99ef1.origin );
    level waittill( #"groom_lake_empty" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 1
// Checksum 0xc4021a, Offset: 0x550
// Size: 0x4c
function delusional_dempsey_step2_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_51acdb19 thread grenade_watcher();
        level flag::wait_till( #"hash_8987a45b2eda7c4" );
    }
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 2
// Checksum 0xfbb98501, Offset: 0x5a8
// Size: 0xb4
function delusional_dempsey_step2_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_cd51aa28 = 2;
        level flag::set( #"hash_8987a45b2eda7c4" );
        return;
    }
    
    level.var_cd51aa28 = 2;
    playsoundatposition( #"hash_68bbb4ef1a9d22af", level.var_a7a99ef1.origin );
    level waittill( #"groom_lake_empty" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 1
// Checksum 0x154040e8, Offset: 0x668
// Size: 0x4c
function delusional_dempsey_step3_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_51acdb19 thread grenade_watcher();
        level flag::wait_till( #"hash_743603caa0ee0976" );
    }
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 2
// Checksum 0x58a0ebdf, Offset: 0x6c0
// Size: 0xb4
function delusional_dempsey_step3_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_cd51aa28 = 3;
        level flag::set( #"hash_743603caa0ee0976" );
        return;
    }
    
    level.var_cd51aa28 = 3;
    playsoundatposition( #"hash_5c206c7dd64ec92c", level.var_a7a99ef1.origin );
    level waittill( #"groom_lake_empty" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 1
// Checksum 0xa5faa66, Offset: 0x780
// Size: 0x4c
function delusional_dempsey_step4_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_51acdb19 thread grenade_watcher();
        level flag::wait_till( #"hash_370781d7705e4e18" );
    }
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 2
// Checksum 0x92fcb0f, Offset: 0x7d8
// Size: 0xb4
function delusional_dempsey_step4_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_cd51aa28 = 4;
        level flag::set( #"hash_370781d7705e4e18" );
        return;
    }
    
    level.var_cd51aa28 = 4;
    playsoundatposition( #"hash_2c8959d200afc735", level.var_a7a99ef1.origin );
    level waittill( #"groom_lake_empty" );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 1
// Checksum 0x8f4a57e7, Offset: 0x898
// Size: 0x4c
function delusional_dempsey_step5_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        level.var_51acdb19 thread grenade_watcher();
        level flag::wait_till( #"hash_3b152242499836c8" );
    }
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 2
// Checksum 0x21c50b19, Offset: 0x8f0
// Size: 0xd4
function delusional_dempsey_step5_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level.var_cd51aa28 = 5;
        level flag::set( #"hash_3b152242499836c8" );
        return;
    }
    
    level.var_cd51aa28 = 5;
    zm_hms_util::function_e308175e( #"hash_3bd00f2e3293cc1a", level.var_a7a99ef1.origin );
    wait 1;
    zm_hms_util::function_e308175e( #"hash_63eaabff22eb9bab", level.var_a7a99ef1.origin );
}

// Namespace zm_office_ee_delusional_dempsey/zm_office_ee_delusional_dempsey
// Params 0
// Checksum 0xa73f42e4, Offset: 0x9d0
// Size: 0x208
function grenade_watcher()
{
    level endon( #"end_game" );
    self endon( #"step_completed" );
    
    while ( true )
    {
        waitresult = self waittill( #"damage" );
        
        if ( waitresult.mod === "MOD_GRENADE_SPLASH" && level.var_440b230b < level.round_number )
        {
            switch ( level.var_cd51aa28 )
            {
                case 0:
                    level flag::set( #"hash_3e2d063d97c06905" );
                    self notify( #"step_completed" );
                case 1:
                    level flag::set( #"hash_8987a45b2eda7c4" );
                    self notify( #"step_completed" );
                case 2:
                    level flag::set( #"hash_743603caa0ee0976" );
                    self notify( #"step_completed" );
                case 3:
                    level flag::set( #"hash_370781d7705e4e18" );
                    self notify( #"step_completed" );
                case 4:
                    level flag::set( #"hash_3b152242499836c8" );
                    self notify( #"step_completed" );
                    break;
            }
            
            level.var_440b230b = level.round_number;
        }
        
        waitframe( 1 );
    }
}

