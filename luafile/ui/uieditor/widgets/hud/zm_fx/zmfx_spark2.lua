CoD.ZmFx_Spark2 = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark2.__defaultWidth = 195
CoD.ZmFx_Spark2.__defaultHeight = 324
CoD.ZmFx_Spark2.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmFx_Spark2 )
	self.id = "ZmFx_Spark2"
	self.soundSet = "default"
	
	local Image0 = LUI.UIImage.new( 0, 1, 0, -28, 0, 1, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image0:setShaderVector( 0, 1, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new( 0, 1, 27, 1, 0, 1, 0, 0 )
	Image00:setRGB( 1, 0.45, 0.18 )
	Image00:setYRot( 180 )
	Image00:setZRot( -180 )
	Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image00:setShaderVector( 0, 1, 1, 0, 0 )
	Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Image000:setRGB( 0, 0, 0 )
	Image000:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2mask" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

