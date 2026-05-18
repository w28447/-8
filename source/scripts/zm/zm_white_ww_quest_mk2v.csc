#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_white_defend_soul_capture;

#namespace zm_white_ww_quest_mk2v;

// Namespace zm_white_ww_quest_mk2v/zm_white_ww_quest_mk2v
// Params 0
// Checksum 0xf64c40b9, Offset: 0xb0
// Size: 0x144
function preload()
{
    level._effect[ #"mk2v_sc_wisp" ] = #"hash_1b41a5e8ae3f4112";
    level._effect[ #"mk2v_sc_wisp_end" ] = #"hash_72089b30d2222144";
    level._effect[ #"hash_4d2cabf5bf2ad015" ] = #"hash_745cd788c761f4ca";
    zm_white_defend_soul_capture::register( #"sc_mk2v", 20000, "sc_mk2v", level._effect[ #"mk2v_sc_wisp" ], level._effect[ #"mk2v_sc_wisp_end" ] );
    clientfield::register( "scriptmover", "" + #"hash_7b37fadc13d402a3", 20000, 1, "int", &function_7cd6e78c, 0, 0 );
}

// Namespace zm_white_ww_quest_mk2v/zm_white_ww_quest_mk2v
// Params 7
// Checksum 0x95daff0, Offset: 0x200
// Size: 0x7c
function function_7cd6e78c( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_4d2cabf5bf2ad015" ], self, "tag_origin" );
    }
}

