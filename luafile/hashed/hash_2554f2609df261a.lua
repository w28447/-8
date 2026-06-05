CoD.KillcamWidgetFctnLine = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetFctnLine.__defaultWidth = 36
CoD.KillcamWidgetFctnLine.__defaultHeight = 12
CoD.KillcamWidgetFctnLine.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.KillcamWidgetFctnLine )
	self.id = "KillcamWidgetFctnLine"
	self.soundSet = "default"
	
	local Image2 = LUI.UIImage.new( 0, 0, 0, 12, 0.5, 0.5, -6, 6 )
	Image2:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vslinel" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new( 0, 1, 12, -12, 0.5, 0.5, -6, 6 )
	Image3:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vslinem" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new( 1, 1, -12, 0, 0.5, 0.5, -6, 6 )
	Image4:setImage( RegisterImage( "uie_t7_mp_hud_engame_killcam_vsliner" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

