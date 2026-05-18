#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_white_defend_soul_capture;

#namespace zm_white_ww_quest_mk2z;

// Namespace zm_white_ww_quest_mk2z/zm_white_ww_quest_mk2z
// Params 0
// Checksum 0x59261db8, Offset: 0xc8
// Size: 0x1f4
function preload()
{
    level._effect[ #"mk2z_sc_wisp" ] = #"hash_ea58012779b62a6";
    level._effect[ #"mk2z_sc_wisp_end" ] = #"hash_5a0d3d80e5fadfe8";
    level._effect[ #"hash_5a1b907f8cfb78f9" ] = #"hash_1fe7b0ba967e52f6";
    zm_white_defend_soul_capture::register( #"sc_mk2z_1", 20000, "sc_mk2z_1", level._effect[ #"mk2z_sc_wisp" ], level._effect[ #"mk2z_sc_wisp_end" ] );
    zm_white_defend_soul_capture::register( #"sc_mk2z_2", 20000, "sc_mk2z_2", level._effect[ #"mk2z_sc_wisp" ], level._effect[ #"mk2z_sc_wisp_end" ] );
    zm_white_defend_soul_capture::register( #"sc_mk2z_3", 20000, "sc_mk2z_3", level._effect[ #"mk2z_sc_wisp" ], level._effect[ #"mk2z_sc_wisp_end" ] );
    clientfield::register( "scriptmover", "" + #"hash_2184dd4e9090521f", 20000, 1, "int", &function_7cd6e78c, 0, 0 );
}

// Namespace zm_white_ww_quest_mk2z/zm_white_ww_quest_mk2z
// Params 7
// Checksum 0xebb74b94, Offset: 0x2c8
// Size: 0x7c
function function_7cd6e78c( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_5a1b907f8cfb78f9" ], self, "tag_origin" );
    }
}

