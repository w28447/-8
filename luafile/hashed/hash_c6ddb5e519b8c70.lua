require( "ui/uieditor/widgets/fileshare/fullscreenpopup/fullscreenpopuptemplate" )
require( "ui/uieditor/widgets/itemshop/itemshopbutton" )
require( "ui/uieditor/widgets/playercard/selfidentitybadge" )

CoD.StartMenu_Options_PrivacySettings_PCUpdatePopup = InheritFrom( CoD.Menu )
LUI.createMenu.StartMenu_Options_PrivacySettings_PCUpdatePopup = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_PrivacySettings_PCUpdatePopup", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.StartMenu_Options_PrivacySettings_PCUpdatePopup )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FullscreenPopupTemplate:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg0, "PrivacySettingManagementForm", "updateProgressState", Enum[0x65887EAAB38F9F8][0xB9DF5339B289B88] )
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg0, "PrivacySettingManagementForm", "updateProgressState", Enum[0x65887EAAB38F9F8][0xF100F564F11A910] )
			end
		},
		{
			stateName = "CustomState",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "FinishedState",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg0, "PrivacySettingManagementForm", "updateProgressState", Enum[0x65887EAAB38F9F8][0xDE287BA1764B6AE] )
			end
		}
	} )
	local f1_local3 = FullscreenPopupTemplate
	local SelfIdentityBadge = FullscreenPopupTemplate.subscribeToModel
	local f1_local5 = DataSources.PrivacySettingManagementForm.getModel( f1_arg0 )
	SelfIdentityBadge( f1_local3, f1_local5.updateProgressState, function ( f6_arg0 )
		f1_local1:updateElementState( FullscreenPopupTemplate, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f6_arg0:get(),
			modelName = "updateProgressState"
		} )
	end, false )
	FullscreenPopupTemplate.ButtonList:setWidgetType( CoD.ItemShopButton )
	FullscreenPopupTemplate.Subtitle:setText( "" )
	FullscreenPopupTemplate.ErrorSubtitle:setText( LocalizeToUpperString( "menu/privacy_settings_state_failure" ) )
	FullscreenPopupTemplate.WorkingTitle:setText( LocalizeToUpperString( "menu/privacy_settings_state_in_progress" ) )
	FullscreenPopupTemplate.Title:setText( "" )
	FullscreenPopupTemplate.DoneTitle:setText( LocalizeToUpperString( "menu/privacy_settings_state_complete" ) )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, f1_arg0, 0.5, 0.5, 541, 872, 0, 0, 33.5, 98.5 )
	SelfIdentityBadge:setAlpha( 0 )
	SelfIdentityBadge:subscribeToGlobalModel( f1_arg0, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, f1_arg0 )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	f1_local5 = self
	f1_local3 = self.subscribeToModel
	local f1_local6 = DataSources.PrivacySettingManagementForm.getModel( f1_arg0 )
	f1_local3( f1_local5, f1_local6.updateProgressState, function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( element, menu, controller, model )
		if not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( controller, "PrivacySettingManagementForm", "updateProgressState", Enum[0x65887EAAB38F9F8][0xB9DF5339B289B88] ) then
			DelayCloseAndGoBack( menu, controller, 0 )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( controller, "PrivacySettingManagementForm", "updateProgressState", Enum[0x65887EAAB38F9F8][0xB9DF5339B289B88] ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "menu/continue", nil, nil )
			return true
		else
			return false
		end
	end, false )
	FullscreenPopupTemplate.buttons:setModel( self.buttonModel, f1_arg0 )
	FullscreenPopupTemplate.buttonPC:setModel( self.buttonModel, f1_arg0 )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	SelfIdentityBadge.id = "SelfIdentityBadge"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = FullscreenPopupTemplate
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local3 = self
	f1_local3 = FullscreenPopupTemplate
	if IsPC() then
		CoD.PCUtility.LinkPCSmallCloseButtonToInput( f1_local1, f1_arg0, f1_local3, Enum.LUIButton[0x755DA1E2E7C263F] )
	end
	return self
end

CoD.StartMenu_Options_PrivacySettings_PCUpdatePopup.__onClose = function ( f11_arg0 )
	f11_arg0.FullscreenPopupTemplate:close()
	f11_arg0.SelfIdentityBadge:close()
end

