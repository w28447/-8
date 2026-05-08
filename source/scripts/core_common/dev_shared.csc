#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;

#namespace dev_shared;

/#

    // Namespace dev_shared/dev_shared
    // Params 0, eflags: 0x2
    // Checksum 0xd352ed75, Offset: 0x78
    // Size: 0x2c, Type: dev
    function autoexec init()
    {
        callback::on_localclient_connect( &fx_calibration );
    }

    // Namespace dev_shared/dev_shared
    // Params 1
    // Checksum 0x6f2a50f8, Offset: 0xb0
    // Size: 0x274, Type: dev
    function fx_calibration( localclientnum )
    {
        var_39073e7a = undefined;
        fx_calibration = undefined;
        a_effects = array( "<dev string:x38>", "<dev string:x5f>", "<dev string:x8c>" );
        var_767a6d22 = 0;
        
        while ( true )
        {
            n_dist = getdvarint( #"fx_calibration_dist", 0 );
            var_114d05f = int( min( getdvarint( #"fx_calibration_effect", 0 ), a_effects.size - 1 ) );
            
            if ( n_dist > 0 )
            {
                if ( var_114d05f != var_767a6d22 && isdefined( fx_calibration ) )
                {
                    killfx( localclientnum, fx_calibration );
                    fx_calibration = undefined;
                }
                
                if ( !isdefined( var_39073e7a ) )
                {
                    var_39073e7a = util::spawn_model( localclientnum, "<dev string:xbc>" );
                }
                
                if ( !isdefined( fx_calibration ) )
                {
                    fx_calibration = util::playfxontag( localclientnum, a_effects[ var_114d05f ], var_39073e7a, "<dev string:xbc>" );
                }
                
                v_pos = getcamposbylocalclientnum( localclientnum );
                v_ang = getcamanglesbylocalclientnum( localclientnum );
                v_forward = anglestoforward( v_ang );
                var_39073e7a.origin = v_pos + v_forward * n_dist;
                var_39073e7a.angles = v_ang;
            }
            else if ( isdefined( var_39073e7a ) )
            {
                killfx( localclientnum, fx_calibration );
                var_39073e7a delete();
                fx_calibration = undefined;
            }
            
            var_767a6d22 = var_114d05f;
            waitframe( 1 );
        }
    }

#/
