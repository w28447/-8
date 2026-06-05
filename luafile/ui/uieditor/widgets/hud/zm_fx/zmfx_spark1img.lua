CoD.ZmFx_Spark1Img = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark1Img.__defaultWidth = 168
CoD.ZmFx_Spark1Img.__defaultHeight = 252
CoD.ZmFx_Spark1Img.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmFx_Spark1Img )
	self.id = "ZmFx_Spark1Img"
	self.soundSet = "HUD"
	
	local Image00 = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	Image00:setShaderVector( 0, 10, 2, 0, 0 )
	Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

