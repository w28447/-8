CoD.ZmFx_Flsh1 = InheritFrom( LUI.UIElement )
CoD.ZmFx_Flsh1.__defaultWidth = 766
CoD.ZmFx_Flsh1.__defaultHeight = 324
CoD.ZmFx_Flsh1.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmFx_Flsh1 )
	self.id = "ZmFx_Flsh1"
	self.soundSet = "HUD"
	
	local Flsh1 = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Flsh1:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh1" ) )
	Flsh1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Flsh1:setShaderVector( 0, 0.1, 1, 0, 0 )
	Flsh1:setShaderVector( 1, 0.68, 0, 0, 0 )
	self:addElement( Flsh1 )
	self.Flsh1 = Flsh1
	
	local Flsh2Mask = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Flsh2Mask:setImage( RegisterImage( "uie_t7_zm_hud_rnd_flsh2mask" ) )
	self:addElement( Flsh2Mask )
	self.Flsh2Mask = Flsh2Mask
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

