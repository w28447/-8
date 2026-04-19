require( "x64:48be5c6feaceeb4" )
require( "ui/uieditor/widgets/startmenu/options/flyout/startmenu_options_settingslider" )

CoD.DirectorCodCasterQuickSettings = InheritFrom( LUI.UIElement )
CoD.DirectorCodCasterQuickSettings.__defaultWidth = 1920
CoD.DirectorCodCasterQuickSettings.__defaultHeight = 1080
CoD.DirectorCodCasterQuickSettings.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorCodCasterQuickSettings )
	self.id = "DirectorCodCasterQuickSettings"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OptionInfo = CoD.StartMenu_Options_SettingInfo.new( f1_arg0, f1_arg1, 0, 0, 860, 1560, 0, 0, 95, 199 )
	self:addElement( OptionInfo )
	self.OptionInfo = OptionInfo
	
	local ButtonList = LUI.UIList.new( f1_arg0, f1_arg1, 6, 0, nil, false, false, false, false )
	ButtonList:setLeftRight( 0, 0, 101, 801 )
	ButtonList:setTopBottom( 0, 0, 95, 557 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_SettingSlider )
	ButtonList:setVerticalCount( 9 )
	ButtonList:setSpacing( 6 )
	ButtonList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ButtonList:setDataSource( "CodCasterQuickSettingsList" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( ButtonList, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		if InFrontend() then
			SaveShoutcasterSettings( self, f3_arg0, f3_arg2 )
			GoBack( self, f3_arg2 )
			return true
		else
			
		end
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		if InFrontend() then
			CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	ButtonList.id = "ButtonList"
	self.__defaultFocus = ButtonList
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local3 = self
	if IsPC() then
		ChangeDefaultFocus( self, self.ButtonList )
		ForceCheckDefaultPCFocus( self.ButtonList, f1_arg0, f1_arg1 )
	end
	return self
end

CoD.DirectorCodCasterQuickSettings.__onClose = function ( f5_arg0 )
	f5_arg0.OptionInfo:close()
	f5_arg0.ButtonList:close()
end

