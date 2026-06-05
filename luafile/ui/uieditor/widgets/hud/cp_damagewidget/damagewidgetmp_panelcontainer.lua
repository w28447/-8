require( "ui/uieditor/widgets/hud/cp_damagewidget/damagewidget_panel" )

CoD.DamageWidgetMP_PanelContainer = InheritFrom( LUI.UIElement )
CoD.DamageWidgetMP_PanelContainer.__defaultWidth = 93
CoD.DamageWidgetMP_PanelContainer.__defaultHeight = 61
CoD.DamageWidgetMP_PanelContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DamageWidgetMP_PanelContainer )
	self.id = "DamageWidgetMP_PanelContainer"
	self.soundSet = "default"
	
	local PanelAmmo0 = CoD.DamageWidget_Panel.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	PanelAmmo0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo0 )
	self.PanelAmmo0 = PanelAmmo0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DamageWidgetMP_PanelContainer.__onClose = function ( f2_arg0 )
	f2_arg0.PanelAmmo0:close()
end

