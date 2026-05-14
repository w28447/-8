#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock_fixup;

#namespace namespace_d0919546;

// Namespace namespace_d0919546/namespace_d0919546
// Params 0, eflags: 0x2
// Checksum 0xf099e2cd, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"hash_5d70c94021e00856", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace namespace_d0919546/namespace_d0919546
// Params 0
// Checksum 0x1707314e, Offset: 0xc8
// Size: 0x1e4
function __init__()
{
    character_unlock_fixup::register_character_unlock( #"hash_178221dd8299137b", #"loot_tags_halloweenevent_jack_final", #"hw_event_item_jk", &function_d95e620c, undefined );
    character_unlock_fixup::register_character_unlock( #"hash_263de5e9fa6d16ea", #"loot_tags_halloweenevent_phantasm", #"hw_event_item_tod", &function_d95e620c, undefined );
    character_unlock_fixup::register_character_unlock( #"hash_8c7045e78561cf4", #"loot_tags_halloweenevent_monster", #"hw_event_item_kk", &function_d95e620c, undefined );
    character_unlock_fixup::register_character_unlock( #"hash_74709eb5a08139fb", #"loot_tags_halloweenevent_monster_6", #"hw_event_item_wb", &function_d95e620c, undefined );
    character_unlock_fixup::register_character_unlock( #"hash_517bb26004a9c12b", #"loot_tags_halloweenevent_werewolf", #"hw_event_item_th", &function_d95e620c, undefined );
    character_unlock_fixup::register_character_unlock( #"hash_3532d912b12917c9", #"loot_tags_halloweenevent_monster_1", #"hw_event_item_mc", &function_d95e620c, undefined );
}

// Namespace namespace_d0919546/namespace_d0919546
// Params 0
// Checksum 0x51f52a04, Offset: 0x2b8
// Size: 0x60
function function_d95e620c()
{
    var_be67b2be = isdefined( getgametypesetting( #"hash_6fb11b1e304d533c" ) ) ? getgametypesetting( #"hash_6fb11b1e304d533c" ) : 0;
    return var_be67b2be;
}

