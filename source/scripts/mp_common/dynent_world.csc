#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace dynent_world;

// Namespace dynent_world/dynent_world
// Params 0, eflags: 0x2
// Checksum 0x6f8946d5, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"dynent_world", &__init__, undefined, undefined );
}

// Namespace dynent_world/dynent_world
// Params 0
// Checksum 0xb4888501, Offset: 0x100
// Size: 0x8c
function __init__()
{
    if ( !( isdefined( getgametypesetting( #"usabledynents" ) ) ? getgametypesetting( #"usabledynents" ) : 0 ) )
    {
        return;
    }
    
    clientfield::register( "clientuimodel", "hudItems.dynentUseHoldProgress", 13000, 5, "float", undefined, 0, 0 );
}

// Namespace dynent_world/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0x2facda2c, Offset: 0x198
// Size: 0x724
function event_handler[event_9673dc9a] function_3981d015( eventstruct )
{
    dynent = eventstruct.ent;
    var_16a4afdc = eventstruct.state;
    bundle = function_489009c1( dynent );
    
    if ( isdefined( bundle ) && isdefined( bundle.dynentstates ) && isdefined( bundle.dynentstates[ var_16a4afdc ] ) )
    {
        newstate = bundle.dynentstates[ var_16a4afdc ];
        var_eb7c2031 = isdefined( bundle.var_eb7c2031 ) && bundle.var_eb7c2031;
        var_59102aec = isdefined( bundle.vehicledestroyed ) ? bundle.vehicledestroyed : 0;
        
        if ( var_16a4afdc == var_59102aec )
        {
            if ( var_eb7c2031 && !function_8a8a409b( dynent ) )
            {
                if ( isdefined( newstate.dynent_sound ) )
                {
                    playsound( 0, newstate.dynent_sound, dynent.origin );
                }
                
                return;
            }
        }
        
        teleport = eventstruct.teleport;
        var_718063b0 = eventstruct.rootorigin;
        var_c286a1ae = eventstruct.rootangles;
        
        if ( !( isdefined( bundle.skiptransformation ) && bundle.skiptransformation ) )
        {
            pos = ( isdefined( newstate.pos_x ) ? newstate.pos_x : 0, isdefined( newstate.pos_y ) ? newstate.pos_y : 0, isdefined( newstate.pos_z ) ? newstate.pos_z : 0 );
            pos = rotatepoint( pos, var_c286a1ae );
            neworigin = var_718063b0 + pos;
            pitch = var_c286a1ae[ 0 ] + ( isdefined( newstate.rot_pitch ) ? newstate.rot_pitch : 0 );
            yaw = var_c286a1ae[ 1 ] + ( isdefined( newstate.rot_yaw ) ? newstate.rot_yaw : 0 );
            roll = var_c286a1ae[ 2 ] + ( isdefined( newstate.rot_roll ) ? newstate.rot_roll : 0 );
            newangles = ( absangleclamp360( pitch ), absangleclamp360( yaw ), absangleclamp360( roll ) );
            interpolationsec = isdefined( bundle.interpolationsec ) ? bundle.interpolationsec : 0;
            
            if ( !teleport && interpolationsec > 0 )
            {
                dynent function_49ed8678( neworigin, interpolationsec );
                dynent function_7622f013( newangles, interpolationsec );
            }
            else
            {
                dynent.origin = neworigin;
                dynent.angles = newangles;
            }
        }
        
        if ( !teleport && isdefined( newstate.dynent_sound ) )
        {
            playsound( 0, newstate.dynent_sound, dynent.origin );
        }
        
        if ( isdefined( newstate.overridemodel ) )
        {
            add_helico( dynent, newstate.overridemodel );
        }
        
        if ( isdefined( newstate.stateanim ) )
        {
            starttime = 0;
            rate = isdefined( newstate.animrate ) ? newstate.animrate : 0;
            
            if ( isdefined( newstate.absolutestarttime ) && newstate.absolutestarttime )
            {
                gametime = gettime();
                
                if ( isdefined( newstate.var_e23400ad ) && newstate.var_e23400ad )
                {
                    gametime += abs( dynent.origin[ 0 ] + dynent.origin[ 1 ] + dynent.origin[ 2 ] );
                }
                
                animlength = int( getanimlength( newstate.stateanim ) * 1000 );
                starttime = gametime / animlength / rate;
                starttime -= int( starttime );
            }
            else if ( teleport && !isanimlooping( 0, newstate.stateanim ) )
            {
                starttime = 1;
            }
            
            function_1e23c01f( dynent, newstate.stateanim, starttime, rate );
        }
        else
        {
            function_27b5ddff( dynent );
        }
        
        if ( isdefined( newstate.statefx ) && isdefined( eventstruct.localclientnum ) )
        {
            if ( isdefined( dynent.fx ) )
            {
                stopfx( eventstruct.localclientnum, dynent.fx );
                dynent.fx = undefined;
            }
            
            if ( newstate.statefx !== #"hash_633319dd8957ddbb" )
            {
                dynent.fx = playfxondynent( newstate.statefx, dynent );
            }
        }
        
        setdynentenabled( dynent, isdefined( newstate.enable ) && newstate.enable );
    }
}

