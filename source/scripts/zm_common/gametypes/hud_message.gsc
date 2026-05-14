#using scripts\core_common\callbacks_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\gametypes\globallogic_audio;
#using scripts\zm_common\util;

#namespace hud_message;

// Namespace hud_message/hud_message
// Params 0
// Checksum 0xb482748e, Offset: 0xa8
// Size: 0x272
function init()
{
    game.strings[ #"draw" ] = #"hash_18114ebf7e352c55";
    game.strings[ #"round_draw" ] = #"mp/round_draw_caps";
    game.strings[ #"round_win" ] = #"mp/round_win_caps";
    game.strings[ #"round_loss" ] = #"mp/round_loss_caps";
    game.strings[ #"victory" ] = #"hash_31e1e88e88ba263f";
    game.strings[ #"defeat" ] = #"hash_141c79e0a2e1383e";
    game.strings[ #"game_over" ] = #"hash_ddc319addc8bcb2";
    game.strings[ #"halftime" ] = #"hash_4403919077b48aaf";
    game.strings[ #"overtime" ] = #"hash_19d325d8d1bfd3de";
    game.strings[ #"roundend" ] = #"mp/roundend_caps";
    game.strings[ #"intermission" ] = #"mp/intermission_caps";
    game.strings[ #"side_switch" ] = #"mp/switching_sides_caps";
    game.strings[ #"match_bonus" ] = #"mp/match_bonus_is";
}

