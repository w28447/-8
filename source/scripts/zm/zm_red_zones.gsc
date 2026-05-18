#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hud;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_red_zones;

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x53d3a3f0, Offset: 0x8d8
// Size: 0x54
function init()
{
    callback::on_spawned( &on_player_spawned );
    level.custom_rise_func = &function_a929cb60;
    level thread cliff_forge_vo();
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xdad41f91, Offset: 0x938
// Size: 0xa4
function cliff_forge_vo()
{
    level flag::wait_till( #"dark_side_open" );
    
    for ( a_players = function_6645d04c(); a_players.size == 0 ; a_players = function_6645d04c() )
    {
        wait 1.6;
    }
    
    e_player = array::random( a_players );
    e_player zm_vo::function_a2bd5a0c( "vox_cliff_forge_enter" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x9e28879, Offset: 0x9e8
// Size: 0x214
function function_6645d04c()
{
    a_players = [];
    a_str_locations = array( "bridge", "center", "forge", "lower", "upper" );
    
    foreach ( str_location in a_str_locations )
    {
        var_1a34f5a1 = zm_zonemgr::get_players_in_zone( "zone_cliff_tombs_" + str_location, 1 );
        a_players = arraycombine( a_players, var_1a34f5a1, 0, 0 );
    }
    
    if ( a_players.size > 0 )
    {
        a_players_copy = arraycopy( a_players );
        s_vo = struct::get( "cliff_forge_vo" );
        
        foreach ( player in a_players )
        {
            n_dist_sq = distance2dsquared( s_vo.origin, player.origin );
            
            if ( n_dist_sq > 1245456 )
            {
                arrayremovevalue( a_players_copy, player );
            }
        }
        
        a_players = a_players_copy;
    }
    
    return a_players;
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xbc94697f, Offset: 0xc08
// Size: 0xb6c
function zone_init()
{
    level flag::init( #"pegasus_ride_started" );
    level flag::init( "always_on" );
    level flag::set( "always_on" );
    zm_zonemgr::zone_init( "zone_temple_of_apollo" );
    zm_zonemgr::enable_zone( "zone_temple_of_apollo" );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo", "zone_temple_of_apollo_left_path", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo", "zone_temple_of_apollo_right_path", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo_back", "zone_temple_of_apollo_left_path", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo_back", "zone_temple_of_apollo_right_path", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo", "zone_eastern_plaza", "connect_apollo_temple_to_eastern_plaza", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_temple_of_apollo_back", "zone_western_plaza", "connect_apollo_temple_to_western_plaza", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_western_plaza", "zone_monument_of_craterus_lower", "connect_western_plaza_to_monument_of_craterus", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_monument_of_craterus_lower", "zone_monument_of_craterus_upper", #"connect_craterus_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_eastern_plaza", "zone_upper_road_east", "connect_eastern_plaza_to_upper_road", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_upper_road_east", "zone_upper_road_west", #"connect_upper_road_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_portico", "zone_upper_road_east", #"connect_portico_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_portico", "zone_upper_road_west", #"connect_portico_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_portico", "zone_amphitheater_backstage", #"connect_portico_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_upper_road_west", "zone_amphitheater_backstage", "connect_amphitheater_backstage_to_stage", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_monument_of_craterus_upper", "zone_amphitheater_backstage", "connect_amphitheater_backstage_to_stage", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_amphitheater_backstage", "zone_amphitheater", "connect_amphitheater_backstage_to_stage", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_amphitheater", "zone_amphitheater_house", "connect_amphitheater_backstage_to_stage", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_eastern_plaza", "zone_offering", "connect_eastern_plaza_to_temple_terrace", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_offering", "zone_temple_to_stoa_of_the_athenians", #"hash_6d71447c1ac2346a", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_offering", "zone_temple_to_stoa_of_the_athenians", #"hash_319f89db9006c766", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_western_plaza", "zone_bathhouse_outside", "connect_western_plaza_to_bathhouse_upper", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_bathhouse_outside", "zone_bathhouse_inside", #"connect_bathhouse_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_intersection_of_treasuries_upper", "zone_bathhouse_inside", #"hash_72cec88da65c292d", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_intersection_of_treasuries_upper", "zone_bathhouse_inside", #"hash_17525acf356976a1", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_intersection_of_treasuries_lower", "zone_spartan_east_to_treasuries", "connect_spartan_to_treasuries", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_intersection_of_treasuries_lower", "zone_stoa_of_the_athenians_west", "connect_stoa_of_athenians_to_treasuries", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_intersection_of_treasuries_lower", "zone_intersection_of_treasuries_upper", #"connect_treasuries_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_stoa_of_the_athenians_east", "zone_temple_to_stoa_of_the_athenians", #"hash_6d71447c1ac2346a", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_stoa_of_the_athenians_east", "zone_temple_to_stoa_of_the_athenians", #"hash_319f89db9006c766", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_stoa_of_the_athenians_east", "zone_stoa_of_athenians_to_spartan_upper", "connect_stoa_of_athenians_to_spartan", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_stoa_of_the_athenians_east", "zone_stoa_of_the_athenians_west", #"connect_stoa_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_stoa_of_athenians_to_spartan_upper", "zone_spartan_monument_upper", "connect_stoa_of_athenians_to_spartan", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_spartan_monument_west", "zone_spartan_east_to_treasuries", "connect_spartan_to_treasuries", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_spartan_monument_east", "zone_spartan_monument_upper", #"connect_spartan_monument_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_spartan_monument_east", "zone_spartan_monument_west", #"connect_spartan_monument_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_spartan_monument_upper", "zone_spartan_monument_west", #"connect_spartan_monument_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_river_upper", "zone_river_lower", #"pegasus_ride_started", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_river_lower", "zone_cliff_tombs_upper", "connect_river_acheron_to_cliff_tombs", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_upper", "zone_cliff_tombs_forge", #"connect_cliff_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_upper", "zone_cliff_tombs_center", #"connect_cliff_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_center", "zone_cliff_tombs_lower", #"connect_cliff_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_forge", "zone_cliff_tombs_center", #"connect_cliff_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_center", "zone_cliff_tombs_lower", #"connect_cliff_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_river_lower", "zone_serpent_pass_upper", "connect_river_acheron_to_serpents_pass", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_serpent_pass_center", "zone_serpent_pass_upper", #"connect_serpent_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_serpent_pass_lower", "zone_serpent_pass_center", #"connect_serpent_zones", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_serpent_pass_lower", "zone_drakaina_arena", "connect_serpents_pass_to_drakaina_arena", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_serpent_pass_bridge", "zone_drakaina_arena", "connect_serpents_pass_to_drakaina_arena", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_serpent_pass_lower", "zone_serpent_pass_bridge", "connect_serpents_pass_to_drakaina_arena", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_lower", "zone_drakaina_arena", "connect_cliff_tombs_to_drakaina_arena", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_bridge", "zone_drakaina_arena", "connect_cliff_tombs_to_drakaina_arena", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cliff_tombs_bridge", "zone_cliff_tombs_lower", "connect_cliff_tombs_to_drakaina_arena", 0 );
    zm_zonemgr::zone_init( "zone_ww_quest_earth" );
    zm_zonemgr::zone_init( "zone_ww_quest_death" );
    zm_zonemgr::zone_init( "zone_ww_quest_light" );
    zm_zonemgr::zone_init( "zone_ww_quest_air" );
    zm_zonemgr::zone_init( "zone_boss_plateau_1" );
    zm_zonemgr::zone_init( "zone_boss_plateau_2" );
    zm_zonemgr::zone_init( "zone_boss_plateau_3" );
    a_t_doors = getentarray( "zombie_door", "targetname" );
    level thread connect_upper_road_zones();
    level thread connect_bathhouse_zones();
    level thread connect_treasuries_zones();
    level thread connect_stoa_zones();
    level thread connect_cliff_zones();
    level thread connect_serpent_zones();
    level thread connect_spartan_monument_zones();
    level thread connect_craterus_zones();
    level thread function_918814d();
    level thread function_f313d1de();
    level thread function_3a6d6af1();
    level thread function_3335487f();
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x1feca423, Offset: 0x1780
// Size: 0x84
function connect_upper_road_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_eastern_plaza_to_upper_road", "connect_amphitheater_backstage_to_stage" ) );
    level flag::set( #"connect_upper_road_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xfda7ce7f, Offset: 0x1810
// Size: 0x8c
function connect_bathhouse_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( #"hash_72cec88da65c292d", "connect_western_plaza_to_bathhouse_upper" ) );
    level flag::set( #"connect_bathhouse_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x495266f9, Offset: 0x18a8
// Size: 0x94
function connect_treasuries_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_stoa_of_athenians_to_treasuries", "connect_spartan_to_treasuries", #"hash_17525acf356976a1" ) );
    level flag::set( #"connect_treasuries_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x90876b8b, Offset: 0x1948
// Size: 0x94
function connect_stoa_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( #"hash_6d71447c1ac2346a", "connect_stoa_of_athenians_to_treasuries", "connect_stoa_of_athenians_to_spartan" ) );
    level flag::set( #"connect_stoa_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x225b59db, Offset: 0x19e8
// Size: 0x84
function connect_spartan_monument_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_stoa_of_athenians_to_spartan", "connect_spartan_to_treasuries" ) );
    level flag::set( #"connect_spartan_monument_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xfe66603d, Offset: 0x1a78
// Size: 0x84
function connect_cliff_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_river_acheron_to_cliff_tombs", "connect_cliff_tombs_to_drakaina_arena" ) );
    level flag::set( #"connect_cliff_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x7eaaaa50, Offset: 0x1b08
// Size: 0x84
function connect_serpent_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_serpents_pass_to_drakaina_arena", "connect_river_acheron_to_serpents_pass" ) );
    level flag::set( #"connect_serpent_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xc5c05c13, Offset: 0x1b98
// Size: 0x84
function connect_craterus_zones()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till_any( array( "connect_western_plaza_to_monument_of_craterus", "connect_amphitheater_backstage_to_stage" ) );
    level flag::set( #"connect_craterus_zones" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x56a73f2b, Offset: 0x1c28
// Size: 0x94
function function_f313d1de()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till( "power_bathhouse_to_treasuries" );
    level flag::wait_till( "connect_western_plaza_to_bathhouse_upper" );
    level flag::set( #"hash_17525acf356976a1" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xafa472e8, Offset: 0x1cc8
// Size: 0xa4
function function_918814d()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till( "power_bathhouse_to_treasuries" );
    level flag::wait_till_any( array( "connect_stoa_of_athenians_to_treasuries", "connect_spartan_to_treasuries" ) );
    level flag::set( #"hash_72cec88da65c292d" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xd5e424e9, Offset: 0x1d78
// Size: 0x94
function function_3a6d6af1()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till( "power_offering_to_stoa" );
    level flag::wait_till( "connect_eastern_plaza_to_temple_terrace" );
    level flag::set( #"hash_6d71447c1ac2346a" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xc53a7e29, Offset: 0x1e18
// Size: 0xa4
function function_3335487f()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    level flag::wait_till( "power_offering_to_stoa" );
    level flag::wait_till_any( array( "connect_stoa_of_athenians_to_treasuries", "connect_stoa_of_athenians_to_spartan" ) );
    level flag::set( #"hash_319f89db9006c766" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xd3f4bf8d, Offset: 0x1ec8
// Size: 0x44
function on_player_spawned()
{
    self endon( #"death" );
    self thread function_8e0b371();
    self thread function_17ac86f7();
}

// Namespace zm_red_zones/zm_red_zones
// Params 1
// Checksum 0xe0f36fde, Offset: 0x1f18
// Size: 0xb4
function function_a929cb60( s_spot )
{
    if ( isdefined( s_spot.var_4e469313 ) && s_spot.var_4e469313 )
    {
        self thread hide_pop();
        str_anim = #"ai_t8_zombie_traverse_ground_dugup";
    }
    else
    {
        str_anim = #"ai_zombie_base_traverse_ground_climbout_fast";
    }
    
    self animscripted( "rise_anim", self.origin, s_spot.angles, str_anim, "normal" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x7a092b90, Offset: 0x1fd8
// Size: 0x3c
function hide_pop()
{
    self endon( #"death" );
    wait 0.1;
    
    if ( isdefined( self ) )
    {
        self show();
    }
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0x80df38eb, Offset: 0x2020
// Size: 0xb8
function function_8e0b371()
{
    self endon( #"disconnect" );
    
    while ( true )
    {
        if ( isalive( self ) )
        {
            str_location = get_location_string( self );
            self zm_hud::function_29780fb5( isdefined( str_location ) ? str_location : #"" );
        }
        else
        {
            self zm_hud::function_29780fb5( #"" );
        }
        
        wait 0.5;
    }
}

// Namespace zm_red_zones/zm_red_zones
// Params 1
// Checksum 0x8fae6807, Offset: 0x20e0
// Size: 0x5a
function get_location_string( e_player )
{
    str_zone = e_player zm_zonemgr::get_player_zone();
    
    if ( !isdefined( str_zone ) )
    {
        return undefined;
    }
    
    str_display = function_27028b8e( str_zone );
    return str_display;
}

// Namespace zm_red_zones/zm_red_zones
// Params 1
// Checksum 0xa297fc94, Offset: 0x2148
// Size: 0x5c8
function function_27028b8e( str_zone )
{
    if ( !isdefined( str_zone ) )
    {
        return undefined;
    }
    
    if ( !isdefined( level.var_ed58a4e6 ) )
    {
        level.var_ed58a4e6 = [];
    }
    
    switch ( str_zone )
    {
        case #"zone_amphitheater":
            str_display = #"zm_red/location_amphitheater";
            break;
        case #"zone_amphitheater_backstage":
            str_display = #"zm_red/location_amphitheater_backstage";
            break;
        case #"zone_cliff_tombs_lower":
        case #"zone_cliff_tombs_forge":
        case #"zone_cliff_tombs_center":
        case #"zone_cliff_tombs_bridge":
        case #"zone_cliff_tombs_upper":
            str_display = #"hash_50916c74fe22e63b";
            break;
        case #"zone_drakaina_arena":
            str_display = #"zm_red/location_drakaina_arena";
            break;
        case #"zone_eastern_plaza":
            str_display = #"zm_red/location_terrace";
            break;
        case #"zone_bathhouse_outside":
        case #"zone_bathhouse_inside":
            str_display = #"zm_red/location_gymnasium_bathhouse";
            break;
        case #"zone_spartan_east_to_treasuries":
        case #"zone_intersection_of_treasuries_upper":
        case #"zone_intersection_of_treasuries_lower":
            str_display = #"zm_red/location_intersection_of_treasuries";
            break;
        case #"zone_monument_of_craterus_lower":
        case #"zone_monument_of_craterus_upper":
            str_display = #"zm_red/location_monument_of_craterus";
            break;
        case #"zone_river_lower":
        case #"zone_river_upper":
            str_display = #"zm_red/location_river_of_sorrow";
            break;
        case #"zone_serpent_pass_upper":
        case #"zone_serpent_pass_bridge":
        case #"zone_serpent_pass_center":
        case #"zone_serpent_pass_lower":
            str_display = #"zm_red/location_serpent_pass";
            break;
        case #"zone_stoa_of_athenians_to_spartan_upper":
        case #"zone_spartan_monument_west":
        case #"zone_spartan_monument_east":
        case #"zone_spartan_monument_upper":
            str_display = #"zm_red/location_spartan_monument";
            break;
        case #"zone_stoa_of_the_athenians_east":
        case #"zone_stoa_of_the_athenians_west":
            str_display = #"zm_red/location_stoa_of_the_athenians";
            break;
        case #"zone_temple_to_stoa_of_the_athenians":
            str_display = #"zm_red/location_sacred_way";
            break;
        case #"zone_temple_of_apollo_left_path":
        case #"zone_temple_of_apollo_right_path":
        case #"zone_temple_of_apollo_back":
        case #"zone_temple_of_apollo":
            str_display = #"zm_red/location_temple_of_apollo";
            break;
        case #"zone_offering":
            str_display = #"zm_red/location_offering_of_the_attalids";
            break;
        case #"zone_upper_road_west":
        case #"zone_upper_road_east":
        case #"zone_portico":
            str_display = #"zm_red/location_upper_road";
            break;
        case #"zone_western_plaza":
            str_display = #"zm_red/location_marketplace";
            break;
        case #"zone_boss_plateau_1":
            str_display = #"hash_63b3c5fb5611240f";
            break;
        case #"zone_boss_plateau_2":
            str_display = #"hash_63b3c4fb5611225c";
            break;
        case #"zone_boss_plateau_3":
            str_display = #"hash_63b3c6fb561125c2";
            break;
        case #"zone_ww_quest_earth":
            str_display = #"zm_red/location_ww_quest_earth";
            break;
        case #"zone_ww_quest_death":
            str_display = #"zm_red/location_ww_quest_death";
            break;
        case #"zone_ww_quest_light":
            str_display = #"zm_red/location_ww_quest_light";
            break;
        case #"zone_ww_quest_air":
            str_display = #"zm_red/location_ww_quest_air";
            break;
        default:
            str_display = undefined;
            break;
    }
    
    if ( isdefined( str_display ) && !array::contains( level.var_ed58a4e6, str_display ) )
    {
        array::add( level.var_ed58a4e6, str_display, 0 );
    }
    
    return str_display;
}

// Namespace zm_red_zones/zm_red_zones
// Params 0
// Checksum 0xc748afd9, Offset: 0x2718
// Size: 0x23c
function function_17ac86f7()
{
    self thread zm_audio::function_713192b1( #"zm_red/location_marketplace", #"market" );
    self thread zm_audio::function_713192b1( #"zm_red/location_monument_of_craterus", #"statue_crat" );
    self thread zm_audio::function_713192b1( #"zm_red/location_offering_of_the_attalids", #"temp_attalid" );
    self thread zm_audio::function_713192b1( #"zm_red/location_gymnasium_bathhouse", #"bathhouse" );
    self thread zm_audio::function_713192b1( #"zm_red/location_intersection_of_treasuries", #"treasur" );
    self thread zm_audio::function_713192b1( #"zm_red/location_stoa_of_the_athenians", #"stoa_athen" );
    self thread zm_audio::function_713192b1( #"zm_red/location_spartan_monument", #"statue_spart" );
    self thread function_f7a190a8( undefined, 60, #"zm_red/location_temple_of_apollo", #"temp_apollo" );
    self thread function_f7a190a8( #"hash_3dba794053dea40e", 60, #"zm_red/location_amphitheater", #"amphi" );
    self thread zm_audio::function_713192b1( #"zm_red/location_serpent_pass", #"serp_pass" );
    self thread function_f7a190a8( #"pap_quest_completed", 30, #"zm_red/location_drakaina_arena", #"center_world" );
}

// Namespace zm_red_zones/zm_red_zones
// Params 4
// Checksum 0x82bbb5a7, Offset: 0x2960
// Size: 0x104
function function_f7a190a8( str_wait_flag, var_ab660f9a, str_location, str_subcategory )
{
    level endon( #"end_game" );
    self endon( #"death" );
    level flag::wait_till( "start_zombie_round_logic" );
    
    if ( isdefined( str_wait_flag ) )
    {
        level flag::wait_till( str_wait_flag );
    }
    
    if ( isdefined( var_ab660f9a ) )
    {
        wait var_ab660f9a;
    }
    
    for ( var_33625d75 = get_location_string( self ); var_33625d75 === str_location ; var_33625d75 = get_location_string( self ) )
    {
        wait 0.5;
    }
    
    self thread zm_audio::function_713192b1( str_location, str_subcategory );
}

