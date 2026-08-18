#namespace perks;

// Namespace perks/perks
// Params 1
// Checksum 0x8219a3d3, Offset: 0x68
// Size: 0xd4
function perk_setperk( str_perk )
{
    if ( !isdefined( self.perk_refcount ) )
    {
        self.perk_refcount = [];
    }
    
    if ( !isdefined( self.perk_refcount[ str_perk ] ) )
    {
        self.perk_refcount[ str_perk ] = 0;
    }
    
    assert( self.perk_refcount[ str_perk ] >= 0, "<dev string:x38>" );
    assert( self.perk_refcount[ str_perk ] < 23, "<dev string:x52>" );
    self.perk_refcount[ str_perk ]++;
    self setperk( str_perk );
}

// Namespace perks/perks
// Params 1
// Checksum 0x789e35b0, Offset: 0x148
// Size: 0xb4
function perk_unsetperk( str_perk )
{
    if ( !isdefined( self.perk_refcount ) )
    {
        self.perk_refcount = [];
    }
    
    if ( !isdefined( self.perk_refcount[ str_perk ] ) )
    {
        self.perk_refcount[ str_perk ] = 0;
    }
    
    self.perk_refcount[ str_perk ]--;
    assert( self.perk_refcount[ str_perk ] >= 0, "<dev string:x38>" );
    
    if ( self.perk_refcount[ str_perk ] <= 0 )
    {
        self unsetperk( str_perk );
    }
}

// Namespace perks/perks
// Params 1
// Checksum 0x2c0fb884, Offset: 0x208
// Size: 0x4a, Type: bool
function perk_hasperk( str_perk )
{
    if ( isdefined( self.perk_refcount ) && isdefined( self.perk_refcount[ str_perk ] ) && self.perk_refcount[ str_perk ] > 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace perks/perks
// Params 0
// Checksum 0x69dd788, Offset: 0x260
// Size: 0x26
function perk_reset_all()
{
    self clearperks();
    self.perk_refcount = [];
}

