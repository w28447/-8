#namespace oic;

// Namespace oic/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xadfc2bb7, Offset: 0x88
// Size: 0x474
function event_handler[gametype_init] main( eventstruct )
{
    level.var_8eef5741 = 1;
    oic_pistols = [];
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"hero_annihilator" + "_oic", "" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_standard_t8" + "_oic", "" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_standard_t8" + "_oic", "uber" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_fullauto_t8" + "_oic", "" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_topbreak_t8" + "_oic", "" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "pistolscope" );
    
    if ( !isdefined( oic_pistols ) )
    {
        oic_pistols = [];
    }
    else if ( !isarray( oic_pistols ) )
    {
        oic_pistols = array( oic_pistols );
    }
    
    oic_pistols[ oic_pistols.size ] = getweapon( #"pistol_revolver_t8" + "_oic", "uber" );
    gunselection = getgametypesetting( #"gunselection" );
    level.oic_pistol = oic_pistols[ gunselection ];
    
    if ( isdefined( level.oic_pistol ) && isdefined( level.oic_pistol.worldmodel ) )
    {
        forcestreamxmodel( level.oic_pistol.worldmodel );
    }
}

