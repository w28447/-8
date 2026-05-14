#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hud;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_mansion_zones;

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x51eb35ad, Offset: 0x790
// Size: 0x24
function init()
{
    callback::on_spawned( &function_29ec1ad7 );
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x354e6ada, Offset: 0x7c0
// Size: 0x8a4
function zone_init()
{
    level flag::init( "always_on" );
    level flag::set( "always_on" );
    zm_zonemgr::zone_init( "zone_start_west" );
    zm_zonemgr::zone_init( "zone_start_east" );
    zm_zonemgr::zone_init( "zone_underground" );
    zm_zonemgr::zone_init( "zone_arena" );
    level.disable_kill_thread = 1;
    zm_zonemgr::add_adjacent_zone( "zone_main_hall", "zone_cellar", "connect_ground_floor_to_cellar", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cemetery_entrance", "zone_cemetery_path_left", "connect_cemetery_entrance_to_cemetery_graveyard", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cemetery_entrance", "zone_cemetery_path_right", "connect_cemetery_entrance_to_cemetery_graveyard", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cemetery_path_left", "zone_cemetery_graveyard", "connect_cemetery_entrance_to_cemetery_graveyard", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cemetery_path_right", "zone_cemetery_graveyard", "connect_cemetery_entrance_to_cemetery_graveyard", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_cemetery_graveyard", "zone_cemetery_mausoleum", "connect_cemetery_entrance_to_cemetery_graveyard", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_dining_hallway", "zone_dining_room", "connect_main_hall_to_dining_room", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_dining_room", "zone_greenhouse_entrance", "connect_dining_room_to_greenhouse_entrance", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_corner_east", "zone_hallway_to_bedroom", "connect_starteast_to_hall_to_bedroom", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_hallway_to_bedroom", "zone_floor2_bedroom", "connect_starteast_to_hall_to_bedroom", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_floor2_bedroom", "zone_floor2_trophy_room", "connect_starteast_to_hall_to_bedroom", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_floor2_trophy_room", "zone_hallway_to_bedroom", "connect_starteast_to_hall_to_bedroom", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_hallway_to_bedroom", "zone_trophy_to_dining_stairs", "connect_bedroom_to_dining_room", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_trophy_to_dining_stairs", "zone_dining_room", "connect_bedroom_to_dining_room", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_east", "zone_foyer_eastend", "connect_start_east_to_foyer_floor2_east", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_eastend", "zone_grand_staircase", "connect_foyer_end_to_grand_staircase", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_west", "zone_foyer_westend", "connect_start_west_to_foyer_floor2_west", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_westend", "zone_grand_staircase", "connect_foyer_end_to_grand_staircase", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_westend", "zone_library_hallway_upper", "connect_main_hall_to_upper_hallway_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_foyer_west", "zone_foyer_westend", "connect_main_hall_to_upper_hallway_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_forest_entrance", "zone_forest_s", "connect_forest_entrance_to_forest", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_forest_s", "zone_forest_center", "connect_forest_entrance_to_forest", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_forest_center", "zone_forest_n", "connect_forest_entrance_to_forest", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_greenhouse_entrance", "zone_greenhouse_lab", "connect_greenhouse_entrance_to_greenhouse_lab", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_greenhouse_entrance", "zone_sidegarden_right", "connect_greenhouse_entrance_to_greenhouse_lab", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_greenhouse_lab", "zone_sidegarden_right", "connect_greenhouse_entrance_to_greenhouse_lab", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_library_hallway_upper", "zone_library_upper", "connect_upper_hall_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_library_upper", "zone_library", "connect_upper_hall_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_library_hallway_lower", "zone_library", "connect_main_hall_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_library", "zone_library_upper", "connect_main_hall_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_library_upper", "zone_cemetery_entrance", "connect_library_to_cemetery_entrance", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_grand_staircase", "zone_entrance_hall", "connect_grand_staircase_to_entrance_hall", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_main_hall", "zone_grand_staircase", "connect_grand_staircase_to_main_hall", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_main_hall", "zone_main_hall_north", "connect_grand_staircase_to_main_hall", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_main_hall", "zone_dining_hallway", "connect_main_hall_to_dining_room", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_main_hall", "zone_library_hallway_lower", "connect_main_hall_to_library", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_main_hall_north", "zone_forest_entrance", "connect_main_hall_to_forest_entrance", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_east", "zone_start_corner_east", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_east", "zone_main_hall_north", "connect_grand_staircase_to_main_hall", 1 );
    zm_zonemgr::add_adjacent_zone( "zone_start_corner_east", "zone_foyer_east", "connect_start_east_to_foyer_floor2_east", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_corner_east", "zone_main_hall", "connect_start_east_to_main_hall", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_west", "zone_start_corner_west", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_corner_west", "zone_start_room_west", "always_on", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_west", "zone_main_hall_north", "connect_grand_staircase_to_main_hall", 1 );
    zm_zonemgr::add_adjacent_zone( "zone_start_room_west", "zone_foyer_west", "connect_start_west_to_foyer_floor2_west", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_corner_west", "zone_main_hall", "connect_start_west_to_main_hall", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_start_west", "zone_start_east", "connect_start_west_to_start_east", 0 );
    zm_zonemgr::add_adjacent_zone( "zone_underground", "zone_cemetery_graveyard", "connect_cemetery_graveyard_to_underground", 1 );
    level thread function_18b016d2();
    zm_zonemgr::function_e5eceb89( #"zone_library_upper" );
    zm_zonemgr::function_e5eceb89( #"zone_cemetery_graveyard" );
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0xe6cd0b56, Offset: 0x1070
// Size: 0x11c
function function_18b016d2()
{
    level endon( #"end_game" );
    level flag::wait_till( "start_zombie_round_logic" );
    a_players = getplayers();
    
    if ( a_players.size <= 2 )
    {
        if ( randomint( 100 ) > 50 )
        {
            a_players[ 0 ] function_d274c574();
        }
        
        if ( a_players.size == 2 )
        {
            var_b0cb473d = a_players[ 0 ] zm_zonemgr::get_player_zone();
            var_9b031bad = a_players[ 1 ] zm_zonemgr::get_player_zone();
            
            if ( var_b0cb473d == var_9b031bad )
            {
                a_players[ 1 ] function_d274c574();
            }
        }
    }
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x2b6fe108, Offset: 0x1198
// Size: 0x10c
function function_d274c574()
{
    str_zone = self zm_zonemgr::get_player_zone();
    a_s_spawn_points = struct::get_array( "initial_spawn_points" );
    
    foreach ( s_spawn_point in a_s_spawn_points )
    {
        if ( s_spawn_point.script_noteworthy != str_zone )
        {
            s_start = s_spawn_point;
            break;
        }
    }
    
    self setorigin( s_start.origin );
    self setplayerangles( s_start.angles );
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x5a7a681c, Offset: 0x12b0
// Size: 0x34
function function_29ec1ad7()
{
    self thread function_8e0b371();
    self thread function_17ac86f7();
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x3e980c24, Offset: 0x12f0
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

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 1
// Checksum 0xc8c24c7, Offset: 0x13b0
// Size: 0x5f6
function get_location_string( e_player )
{
    str_zone = e_player zm_zonemgr::get_player_zone();
    
    if ( !isdefined( str_zone ) )
    {
        return undefined;
    }
    
    switch ( str_zone )
    {
        case #"zone_floor2_bedroom":
            str_display = #"zm_mansion/location_floor2_bedroom";
            break;
        case #"zone_floor2_trophy_room":
            str_display = #"zm_mansion/location_floor2_trophy_room";
            break;
        case #"zone_hallway_to_bedroom":
            str_display = #"hash_39314f35659fff4b";
            break;
        case #"zone_cellar":
            str_display = #"zm_mansion/location_cellar";
            break;
        case #"zone_cemetery_path_right":
        case #"zone_cemetery_entrance":
        case #"zone_cemetery_path_left":
            str_display = #"zm_mansion/location_cemetery_entrance";
            break;
        case #"zone_cemetery_graveyard":
            str_display = #"zm_mansion/location_cemetery_graveyard";
            break;
        case #"zone_cemetery_mausoleum":
            str_display = #"zm_mansion/location_cemetery_mausoleum";
            break;
        case #"zone_entrance_hall":
            str_display = #"zm_mansion/location_entrance_hall";
            break;
        case #"zone_dining_hallway":
            str_display = #"zm_mansion/location_dining_hallway";
            break;
        case #"zone_trophy_to_dining_stairs":
            str_display = #"zm_mansion/location_trophy_to_dining";
            break;
        case #"zone_dining_room":
            str_display = #"zm_mansion/location_dining_room";
            break;
        case #"zone_foyer_east":
            str_display = #"hash_2d30bd945675677f";
            break;
        case #"zone_foyer_eastend":
            str_display = #"hash_2b19c9a3e37c977c";
            break;
        case #"zone_foyer_west":
            str_display = #"hash_fc698faab2e9a15";
            break;
        case #"zone_foyer_westend":
            str_display = #"hash_47b54639df53d26e";
            break;
        case #"zone_forest_entrance":
            str_display = #"zm_mansion/location_forest_entrance";
            break;
        case #"zone_forest_center":
        case #"zone_forest_n":
        case #"zone_forest_s":
            str_display = #"zm_mansion/location_forest";
            break;
        case #"zone_greenhouse_entrance":
            str_display = #"zm_mansion/location_greenhouse_entrance";
            break;
        case #"zone_greenhouse_lab":
            str_display = #"zm_mansion/location_greenhouse_lab";
            break;
        case #"zone_sidegarden_right":
            str_display = #"zm_mansion/location_sidegarden_right";
            break;
        case #"zone_library":
            str_display = #"hash_430969697efda742";
            break;
        case #"zone_library_upper":
            str_display = #"zm_mansion/location_library_upper";
            break;
        case #"zone_library_hallway_lower":
            str_display = #"zm_mansion/location_library_hallway_lower";
            break;
        case #"zone_library_hallway_upper":
            str_display = #"zm_mansion/location_library_hallway_upper";
            break;
        case #"zone_main_hall":
            str_display = #"zm_mansion/location_main_hall";
            break;
        case #"zone_main_hall_north":
            str_display = #"zm_mansion/location_main_hall_north";
            break;
        case #"zone_grand_staircase":
            str_display = #"zm_mansion/location_grand_staircase";
            break;
        case #"zone_start_east":
        case #"zone_start_west":
            str_display = #"hash_1ac770988eda8b85";
            break;
        case #"zone_start_corner_east":
            str_display = #"zm_mansion/location_start_corner_east";
            break;
        case #"zone_start_corner_west":
            str_display = #"zm_mansion/location_start_corner_west";
            break;
        case #"zone_start_room_west":
            str_display = #"zm_mansion/location_start_room_west";
            break;
        case #"zone_arena":
            str_display = #"zm_mansion/location_arena";
            break;
        case #"zone_underground":
            str_display = #"zm_mansion/location_underground";
            break;
        default:
            str_display = #"zm_mansion/location_undefined";
            break;
    }
    
    return str_display;
}

// Namespace zm_mansion_zones/zm_mansion_zones
// Params 0
// Checksum 0x81074820, Offset: 0x19b0
// Size: 0x214
function function_17ac86f7()
{
    self thread zm_audio::function_713192b1( #"zm_mansion/location_dining_room", #"dining_room" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_sidegarden_right", #"garden" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_library_hallway_upper", #"billiards_room" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_forest", #"forest" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_cemetery_graveyard", #"cemetary" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_arena", #"druid_arena" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_underground", #"catacomb" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_greenhouse_lab", #"greenhouse" );
    self thread zm_audio::function_713192b1( #"hash_430969697efda742", #"library" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_main_hall", #"main_hall" );
    self thread zm_audio::function_713192b1( #"zm_mansion/location_floor2_bedroom", #"master_bed" );
}

