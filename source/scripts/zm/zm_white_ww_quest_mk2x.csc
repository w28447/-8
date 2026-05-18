#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_white_defend_soul_capture;
#using scripts\zm_common\zm_utility;

#namespace zm_white_ww_quest_mk2x;

// Namespace zm_white_ww_quest_mk2x/zm_white_ww_quest_mk2x
// Params 0
// Checksum 0x78e9cd57, Offset: 0xc0
// Size: 0x1cc
function preload()
{
    level._effect[ #"mk2x_sc_wisp" ] = #"hash_40278bdd6f1bccd4";
    level._effect[ #"mk2x_sc_wisp_end" ] = #"hash_23c866d50fb30876";
    level._effect[ #"hash_5bfd50fb8c3b5ffb" ] = #"hash_6b79a8fd6c76e84c";
    level._effect[ #"mk2x_guard" ] = #"hash_251307aa9b1c5042";
    zm_white_defend_soul_capture::register( #"sc_mk2x", 20000, "sc_mk2x", level._effect[ #"mk2x_sc_wisp" ], level._effect[ #"mk2x_sc_wisp_end" ] );
    clientfield::register( "scriptmover", "" + #"hash_56a1bc72bf8de8f1", 20000, 1, "int", &function_7cd6e78c, 0, 0 );
    clientfield::register( "actor", "" + #"mk2x_guard_fx", 20000, 1, "int", &function_fab5ffa, 0, 0 );
}

// Namespace zm_white_ww_quest_mk2x/zm_white_ww_quest_mk2x
// Params 7
// Checksum 0x39de75aa, Offset: 0x298
// Size: 0x7c
function function_7cd6e78c( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_5bfd50fb8c3b5ffb" ], self, "tag_origin" );
    }
}

// Namespace zm_white_ww_quest_mk2x/zm_white_ww_quest_mk2x
// Params 7
// Checksum 0xc59d27dc, Offset: 0x320
// Size: 0x9c
function function_fab5ffa( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        str_fx_tag = self zm_utility::function_467efa7b( 1 );
        util::playfxontag( localclientnum, level._effect[ #"mk2x_guard" ], self, str_fx_tag );
    }
}

