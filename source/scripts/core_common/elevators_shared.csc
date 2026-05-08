#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\map;
#using scripts\core_common\struct;

#namespace elevators;

// Namespace elevators/elevators_shared
// Params 0, eflags: 0x2
// Checksum 0xfc47534d, Offset: 0x138
// Size: 0x4c
function autoexec init()
{
    clientfield::register( "toplayer", "elevator_floor_selection", 1, 1, "int", &function_58c9169d, 0, 0 );
}

// Namespace elevators/elevators_shared
// Params 7
// Checksum 0xad9682fb, Offset: 0x190
// Size: 0x5fc
function function_58c9169d( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 0 )
    {
        var_aeb02423 = createuimodel( getuimodelforcontroller( localclientnum ), "hudItems.elevator" );
        setuimodelvalue( createuimodel( var_aeb02423, "open" ), 0 );
        return;
    }
    
    var_812eb71d = struct::get_array( "scriptbundle_elevators", "classname" );
    var_2b9a81f7 = struct::get_array( "elevator_button_call", "targetname" );
    var_23e28773 = arraygetclosest( self.origin, var_812eb71d );
    var_366b2fbf = [];
    
    foreach ( i, button in var_2b9a81f7 )
    {
        if ( button.target === var_23e28773.targetname )
        {
            var_366b2fbf[ i ] = button;
        }
    }
    
    var_366b2fbf = array::sort_by_script_int( var_366b2fbf, 1 );
    var_aeb02423 = createuimodel( getuimodelforcontroller( localclientnum ), "hudItems.elevator" );
    count = var_2b9a81f7.size;
    mapbundle = map::get_script_bundle();
    
    foreach ( i, button in var_366b2fbf )
    {
        floornum = button.script_int;
        
        switch ( floornum )
        {
            case 1:
                displaynum = i;
                break;
            case 2:
                displaynum = i;
                break;
            case 3:
                displaynum = i;
                break;
            case 4:
                displaynum = i;
                break;
            case 5:
                displaynum = i;
                break;
            case 6:
                displaynum = i;
                break;
            case 7:
                displaynum = i;
                break;
            case 45:
                displaynum = 23;
                break;
            case 46:
                displaynum = 24;
                break;
            case 57:
                displaynum = 30;
                break;
            case 58:
                displaynum = 31;
                break;
            case 59:
                displaynum = 32;
                break;
            case 97:
                displaynum = 53;
                break;
            case 21:
                displaynum = i + 6;
                break;
            case 22:
                displaynum = i + 6;
                break;
            case 35:
                displaynum = i + 10;
                break;
            case 36:
                displaynum = i + 10;
                break;
            case 37:
                displaynum = i + 10;
                break;
            case 38:
                displaynum = i + 10;
                break;
        }
        
        itemuimodel = createuimodel( var_aeb02423, "item" + i );
        setuimodelvalue( createuimodel( itemuimodel, "name" ), mapbundle.var_88d22b06[ 1 ].var_aa061872[ displaynum ].displayname );
        setuimodelvalue( createuimodel( itemuimodel, "id" ), floornum );
    }
    
    setuimodelvalue( createuimodel( var_aeb02423, "count" ), count );
    setuimodelvalue( createuimodel( var_aeb02423, "open" ), 1 );
}

