require( "ui/uieditor/widgets/hud/zm_panels/zmpanel_rndint" )

CoD.ZmPanel_RndExt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_RndExt.__defaultWidth = 336
CoD.ZmPanel_RndExt.__defaultHeight = 300
CoD.ZmPanel_RndExt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmPanel_RndExt )
	self.id = "ZmPanel_RndExt"
	self.soundSet = "HUD"
	
	local ZmPanelRndInt0 = CoD.ZmPanel_RndInt.new( f1_arg0, f1_arg1, 0, 0, 0, 336, 0, 0, 0, 300 )
	ZmPanelRndInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	ZmPanelRndInt0:setShaderVector( 0, 30, 0, 0, 0 )
	self:addElement( ZmPanelRndInt0 )
	self.ZmPanelRndInt0 = ZmPanelRndInt0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmPanel_RndExt.__onClose = function ( f2_arg0 )
	f2_arg0.ZmPanelRndInt0:close()
end

