CoD.FE_PanelNoBlur = InheritFrom( LUI.UIElement )
CoD.FE_PanelNoBlur.__defaultWidth = 48
CoD.FE_PanelNoBlur.__defaultHeight = 42
CoD.FE_PanelNoBlur.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.FE_PanelNoBlur )
	self.id = "FE_PanelNoBlur"
	self.soundSet = "default"
	
	local Image = LUI.UIImage.new( 0, 1, -12, 12, 0, 1, -3, 3 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 6 )
	self:addElement( Image )
	self.Image = Image
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

