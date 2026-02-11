#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ix_bruno;

// Namespace character_unlock_ix_bruno/character_unlock_ix_bruno
// Params 0, eflags: 0x2
// Checksum 0xdf362dd4, Offset: 0x80
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_ix_bruno", &__init__, undefined, #"character_unlock_ix_bruno_fixup" );
}

// Namespace character_unlock_ix_bruno/character_unlock_ix_bruno
// Params 0
// Checksum 0x4a75e6da, Offset: 0xd0
// Size: 0x34
function __init__()
{
    character_unlock_fixup::function_90ee7a97( #"ix_bruno_unlock", &function_2613aeec );
}

// Namespace character_unlock_ix_bruno/character_unlock_ix_bruno
// Params 1
// Checksum 0x33747e88, Offset: 0x110
// Size: 0x254
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        item_world_fixup::function_2749fcc3( #"zombie_supply_stash_boxinggym_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"zombie_supply_stash_diner_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"zombie_supply_stash_lighthouse_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"hash_183c9fe8af52fac7", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"hash_49e8a607ea22e650", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"zombie_stash_graveyard_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"hospital_stash_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
        item_world_fixup::function_2749fcc3( #"zombie_supply_stash_buried_quest", #"zombie_supply_stash_quest_parent", #"zombie_supply_stash_cu28", 2 );
    }
}

