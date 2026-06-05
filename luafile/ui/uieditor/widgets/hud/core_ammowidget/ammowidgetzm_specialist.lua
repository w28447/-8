require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_characterportrait" )

CoD.AmmoWidgetZM_Specialist = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_Specialist.__defaultWidth = 103
CoD.AmmoWidgetZM_Specialist.__defaultHeight = 103
CoD.AmmoWidgetZM_Specialist.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModel( f1_arg1, "hudItems.healingActive", false )
	self:setClass( CoD.AmmoWidgetZM_Specialist )
	self.id = "AmmoWidgetZM_Specialist"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	
	local CharacterPortrait = CoD.AmmoWidgetZM_CharacterPortrait.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	CharacterPortrait:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_rft" ) )
	CharacterPortrait:setShaderVector( 0, 34, 16, 0, 0 )
	CharacterPortrait:setShaderVector( 1, 100, 100, 0, 0 )
	CharacterPortrait:setShaderVector( 2, 0, 0, 0, 0 )
	CharacterPortrait:linkToElementModel( self, "clientModel", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			CharacterPortrait:setModel( f2_local0, f1_arg1 )
		end
	end )
	self:addElement( CharacterPortrait )
	self.CharacterPortrait = CharacterPortrait
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_Specialist.__onClose = function ( f3_arg0 )
	f3_arg0.CharacterPortrait:close()
end

