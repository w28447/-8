CoD.ZmAmmo_ParticleFX = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ParticleFX.__defaultWidth = 214
CoD.ZmAmmo_ParticleFX.__defaultHeight = 112
CoD.ZmAmmo_ParticleFX.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_ParticleFX )
	self.id = "ZmAmmo_ParticleFX"
	self.soundSet = "default"
	
	local p1 = LUI.UIImage.new( 0, 0, 0, 215, 0, 0, 0, 112 )
	p1:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p1" ) )
	p1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p1:setShaderVector( 0, 1, 1, 0, 0 )
	p1:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( p1 )
	self.p1 = p1
	
	local p2 = LUI.UIImage.new( 0, 0, 0, 215, 0, 0, 0, 112 )
	p2:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p2" ) )
	p2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p2:setShaderVector( 0, 1, 1, 0, 0 )
	p2:setShaderVector( 1, 0.3, 0, 0, 0 )
	self:addElement( p2 )
	self.p2 = p2
	
	local p3 = LUI.UIImage.new( 0, 0, 0, 215, 0, 0, 0, 112 )
	p3:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p3" ) )
	p3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p3:setShaderVector( 0, 1, 1, 0, 0 )
	p3:setShaderVector( 1, 0.7, 0, 0, 0 )
	self:addElement( p3 )
	self.p3 = p3
	
	local mask = LUI.UIImage.new( 0, 0, 0, 214, 0, 0, 0, 112 )
	mask:setRGB( 0, 0, 0 )
	mask:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

