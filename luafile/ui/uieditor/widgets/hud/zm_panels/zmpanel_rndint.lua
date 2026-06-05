CoD.ZmPanel_RndInt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_RndInt.__defaultWidth = 336
CoD.ZmPanel_RndInt.__defaultHeight = 300
CoD.ZmPanel_RndInt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmPanel_RndInt )
	self.id = "ZmPanel_RndInt"
	self.soundSet = "HUD"
	
	local Image4 = LUI.UIImage.new( 0, 0, 0, 336, 0, 0, 0, 300 )
	Image4:setImage( RegisterImage( "uie_t7_zm_hud_panel_rnd" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image4:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

