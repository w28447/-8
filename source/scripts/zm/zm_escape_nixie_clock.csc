#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace nixie_clock;

// Namespace nixie_clock/zm_escape_nixie_clock
// Params 0
// Checksum 0x652fa2fe, Offset: 0xb0
// Size: 0xe2
function init_clientfields()
{
    clientfield::register( "scriptmover", "" + #"zombie_blood_powerup_fx", 1, 1, "int", &zombie_blood_powerup_fx, 0, 0 );
    clientfield::register( "scriptmover", "" + #"hash_4ccf2ce25e0dc836", 1, 1, "int", &function_c6b07c39, 0, 0 );
    level._effect[ #"hash_62343c2144d3f8d1" ] = #"hash_e567a706dafea31";
}

// Namespace nixie_clock/zm_escape_nixie_clock
// Params 7
// Checksum 0x94e8020d, Offset: 0x1a0
// Size: 0xb4
function zombie_blood_powerup_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        self.n_fx_id = util::playfxontag( localclientnum, level._effect[ #"powerup_on_solo" ], self, "tag_origin" );
        return;
    }
    
    if ( isdefined( self.n_fx_id ) )
    {
        stopfx( localclientnum, self.n_fx_id );
    }
}

// Namespace nixie_clock/zm_escape_nixie_clock
// Params 7
// Checksum 0xf0f19f41, Offset: 0x260
// Size: 0x134
function function_c6b07c39( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        self.var_3c43a180 = util::playfxontag( localclientnum, level._effect[ #"hash_62343c2144d3f8d1" ], self, "tag_animate" );
        forcestreamxmodel( #"p8_zm_esc_nixie_tubes" );
        forcestreamxmodel( #"p8_zm_esc_nixie_tubes_on" );
        return;
    }
    
    if ( isdefined( self.var_3c43a180 ) )
    {
        stopfx( localclientnum, self.var_3c43a180 );
    }
    
    stopforcestreamingxmodel( #"p8_zm_esc_nixie_tubes" );
    stopforcestreamingxmodel( #"p8_zm_esc_nixie_tubes_on" );
}

