#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;

#namespace zm_red_trap_venom_spray;

// Namespace zm_red_trap_venom_spray/zm_red_trap_venom_spray
// Params 0
// Checksum 0x2ae49d26, Offset: 0x90
// Size: 0x5c
function init()
{
    clientfield::register( "toplayer", "" + #"venom_spray_postfx", 16000, 1, "int", &venom_spray_postfx, 0, 0 );
}

// Namespace zm_red_trap_venom_spray/zm_red_trap_venom_spray
// Params 7
// Checksum 0xebbda42e, Offset: 0xf8
// Size: 0x154
function venom_spray_postfx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval )
    {
        self postfx::playpostfxbundle( #"pstfx_blood_wash" );
        self postfx::playpostfxbundle( #"pstfx_zm_acid_dmg" );
        self postfx::playpostfxbundle( #"pstfx_zm_acid_dmg_2" );
        self.var_431ddde9 = self playloopsound( #"zmb_trap_acid_loop_plr" );
        return;
    }
    
    self postfx::exitpostfxbundle( #"pstfx_blood_wash" );
    self postfx::exitpostfxbundle( #"pstfx_zm_acid_dmg" );
    self postfx::exitpostfxbundle( #"pstfx_zm_acid_dmg_2" );
    
    if ( isdefined( self.var_431ddde9 ) )
    {
        self stoploopsound( self.var_431ddde9 );
    }
}

