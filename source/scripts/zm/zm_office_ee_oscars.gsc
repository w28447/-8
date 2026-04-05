#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_vo;

#namespace zm_office_ee_oscars;

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0, eflags: 0x2
// Checksum 0x1ec98dac, Offset: 0x1e0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_4fac8791c22b4bd7", &init, undefined, undefined );
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0
// Checksum 0x8ceda820, Offset: 0x228
// Size: 0x31c
function init()
{
    level.var_143be9f3 = 0;
    level.var_4850c7c6 = 0;
    level.var_db90b274 = 2;
    level.a_str_oscar_prelim = array( "oscar_prelim_1", "oscar_prelim_2", "oscar_prelim_3", "oscar_prelim_4", "oscar_prelim_5" );
    level.a_e_oscar_prelim = [];
    
    foreach ( str_oscar_prelim in level.a_str_oscar_prelim )
    {
        function_7a7d15c8( str_oscar_prelim );
    }
    
    level.e_oscar_left_0 = getent( "jfk_room_oscar_left_0", "targetname" );
    level.e_oscar_left_1 = getent( "jfk_room_oscar_left_1", "targetname" );
    level.e_oscar_right_0 = getent( "jfk_room_oscar_right_0", "targetname" );
    level.e_oscar_right_1 = getent( "jfk_room_oscar_right_1", "targetname" );
    level.e_oscar_left_1 hide();
    level.e_oscar_right_1 hide();
    level.e_oscar_right_0.angles += ( 20, 0, 0 );
    level flag::init( #"hash_7b1fd4fc459e497c" );
    zm_sq::register( #"ee_oscars", #"step_1", #"ee_oscars_step1", &ee_oscars_step1_setup, &ee_oscars_step1_cleanup );
    zm_sq::start( #"ee_oscars" );
    zm_sq::register( #"ee_oscars", #"step_2", #"ee_oscars_step2", &ee_oscars_step2_setup, &ee_oscars_step2_cleanup );
    zm_sq::start( #"ee_oscars" );
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 1
// Checksum 0x776c0240, Offset: 0x550
// Size: 0x8c
function ee_oscars_step1_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        function_2d023c13();
        
        while ( level.var_4850c7c6 < level.var_143be9f3 )
        {
            waitframe( 1 );
        }
        
        playsoundatposition( #"hash_4ff9e8e25196f463", ( 0, 0, 0 ) );
        
        /#
            iprintlnbold( "<dev string:x38>" );
        #/
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 2
// Checksum 0x27799125, Offset: 0x5e8
// Size: 0xa0
function ee_oscars_step1_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        foreach ( e_oscar_prelim in level.a_e_oscar_prelim )
        {
            e_oscar_prelim.e_trigger delete();
        }
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 1
// Checksum 0xda25e29c, Offset: 0x690
// Size: 0xb6
function function_7a7d15c8( str_oscar_prelim )
{
    level.var_143be9f3++;
    e_oscar_prelim = getent( str_oscar_prelim, "targetname" );
    array::add( level.a_e_oscar_prelim, e_oscar_prelim );
    e_oscar_prelim.angles += ( 20, 0, 0 );
    e_oscar_prelim.e_trigger = getent( str_oscar_prelim + "_trigger", "targetname" );
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0
// Checksum 0xab5f13d2, Offset: 0x750
// Size: 0x80
function function_2d023c13()
{
    foreach ( e_oscar_prelim in level.a_e_oscar_prelim )
    {
        e_oscar_prelim.e_trigger thread function_d10bef80();
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0
// Checksum 0x2cb058d7, Offset: 0x7d8
// Size: 0xfc
function function_d10bef80()
{
    self endon( #"death" );
    var_b45fe0b3 = 0;
    
    while ( !var_b45fe0b3 )
    {
        waitresult = self waittill( #"damage" );
        
        if ( waitresult.weapon == getweapon( #"bowie_knife_story_1" ) )
        {
            e_oscar_prelim = getent( self.target, "targetname" );
            e_oscar_prelim rotateto( e_oscar_prelim.angles - ( 20, 0, 0 ), 0.15 );
            var_b45fe0b3 = 1;
            level.var_4850c7c6++;
        }
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 1
// Checksum 0xcc5ae09, Offset: 0x8e0
// Size: 0x12c
function ee_oscars_step2_setup( var_5ea5c94d )
{
    if ( !var_5ea5c94d )
    {
        var_52020ab3 = struct::get( "jfk_room_oscar_left_trigger" );
        var_52020ab3.var_47323b73 = var_52020ab3 zm_unitrigger::create( "", 64, &function_715c9476, 1, 0 );
        var_2d8940a6 = struct::get( "jfk_room_oscar_right_trigger" );
        var_2d8940a6.var_47323b73 = var_2d8940a6 zm_unitrigger::create( "", 64, &function_63f29ee9, 1, 0 );
        level.e_oscar_left_1 hide();
        level.e_oscar_right_1 hide();
        level flag::wait_till( #"hash_7b1fd4fc459e497c" );
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 2
// Checksum 0x1639e575, Offset: 0xa18
// Size: 0xe4
function ee_oscars_step2_cleanup( var_5ea5c94d, ended_early )
{
    if ( var_5ea5c94d || ended_early )
    {
        level flag::set( #"hash_7b1fd4fc459e497c" );
    }
    
    var_52020ab3 = struct::get( "jfk_room_oscar_left_trigger" );
    
    if ( isdefined( var_52020ab3.var_47323b73 ) )
    {
        zm_unitrigger::unregister_unitrigger( var_52020ab3.var_47323b73 );
    }
    
    var_2d8940a6 = struct::get( "jfk_room_oscar_right_trigger" );
    
    if ( isdefined( var_2d8940a6.var_47323b73 ) )
    {
        zm_unitrigger::unregister_unitrigger( var_2d8940a6.var_47323b73 );
    }
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0
// Checksum 0x462cbcef, Offset: 0xb08
// Size: 0x9c
function function_715c9476()
{
    waitresult = self waittill( #"trigger" );
    level.var_db90b274--;
    self playsound( #"hash_5104efdd2ef71e39" );
    
    /#
        iprintlnbold( "<dev string:x62>" );
    #/
    
    level thread function_bd81f4e2( waitresult.activator );
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 0
// Checksum 0x48f1bbb4, Offset: 0xbb0
// Size: 0xfc
function function_63f29ee9()
{
    e_oscar_right = getent( "jfk_room_oscar_right_0", "targetname" );
    e_oscar_right rotateto( e_oscar_right.angles - ( 20, 0, 0 ), 0.15 );
    waitresult = self waittill( #"trigger" );
    level.var_db90b274--;
    self playsound( #"hash_5104efdd2ef71e39" );
    
    /#
        iprintlnbold( "<dev string:x80>" );
    #/
    
    level thread function_bd81f4e2( waitresult.activator );
}

// Namespace zm_office_ee_oscars/zm_office_ee_oscars
// Params 1
// Checksum 0xf385ab46, Offset: 0xcb8
// Size: 0x154
function function_bd81f4e2( user )
{
    if ( level.var_db90b274 <= 0 )
    {
        level.e_oscar_left_1 show();
        level.e_oscar_right_1 show();
        wait 0.1;
        level.e_oscar_left_0 hide();
        level.e_oscar_right_0 hide();
        playsoundatposition( #"hash_4b169927b4789180", ( 0, 0, 0 ) );
        
        /#
            iprintlnbold( "<dev string:x9f>" );
        #/
        
        if ( user zm_characters::is_character( array( #"prt_zm_dempsey", #"prt_zm_dempsey_ofc" ) ) )
        {
            user thread zm_vo::vo_say( "vox_mcnamara_log_repair_plr_6_0" );
        }
        
        level flag::set( #"hash_7b1fd4fc459e497c" );
    }
}

