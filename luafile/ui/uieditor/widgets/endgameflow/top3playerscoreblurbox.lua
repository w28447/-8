CoD.Top3PlayerScoreBlurBox = InheritFrom( LUI.UIElement )
CoD.Top3PlayerScoreBlurBox.__defaultWidth = 399
CoD.Top3PlayerScoreBlurBox.__defaultHeight = 162
CoD.Top3PlayerScoreBlurBox.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Top3PlayerScoreBlurBox )
	self.id = "Top3PlayerScoreBlurBox"
	self.soundSet = "default"
	
	local Image0 = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_fe_scoreboardbuttonblur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 0, 20, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

