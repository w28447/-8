#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;

#namespace zm_red_oracle_boons;

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0, eflags: 0x2
// Checksum 0x93eafd04, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_red_oracle_boons", &__init__, undefined, undefined );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 0
// Checksum 0x7013dc24, Offset: 0xf0
// Size: 0xd4
function __init__()
{
    n_bits = getminbitcountfornum( 4 );
    clientfield::register( "item", "" + #"hash_7e5c581ade235dfc", 16000, n_bits, "int", &craft_highlight, 0, 0 );
    clientfield::register( "toplayer", "" + #"oracle_boon_recieved", 16000, 1, "int", &oracle_boon_recieved, 0, 0 );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 7
// Checksum 0x38d2623f, Offset: 0x1d0
// Size: 0xf8
function craft_highlight( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval > 0 )
    {
        e_player = getentbynum( localclientnum, newval - 1 );
        a_e_players = getlocalplayers();
        
        if ( array::contains( a_e_players, e_player ) )
        {
            self thread function_cd5f9803( localclientnum );
            self playrenderoverridebundle( #"hash_46a64e44ebfa3078" );
        }
        
        return;
    }
    
    level notify( #"stop_craft_highlight" );
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 1, eflags: 0x4
// Checksum 0x3e7d3119, Offset: 0x2d0
// Size: 0x5c
function private function_cd5f9803( localclientnum )
{
    self waittill( #"stop_craft_highlight", #"death" );
    
    if ( isdefined( self ) )
    {
        self stoprenderoverridebundle( #"hash_46a64e44ebfa3078" );
    }
}

// Namespace zm_red_oracle_boons/zm_red_oracle_boons
// Params 7, eflags: 0x4
// Checksum 0x8886a86c, Offset: 0x338
// Size: 0x8c
function private oracle_boon_recieved( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue )
    {
        self thread postfx::playpostfxbundle( #"hash_2b92b9e84c59cfe4" );
        return;
    }
    
    self thread postfx::exitpostfxbundle( #"hash_2b92b9e84c59cfe4" );
}

