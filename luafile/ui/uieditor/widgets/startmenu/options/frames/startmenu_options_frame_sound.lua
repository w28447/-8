require( "x64:48be5c6feaceeb4" )
require( "x64:f93e6387e9d051" )

CoD.StartMenu_Options_Frame_Sound = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Frame_Sound.__defaultWidth = 1920
CoD.StartMenu_Options_Frame_Sound.__defaultHeight = 890
CoD.StartMenu_Options_Frame_Sound.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StartMenu_Options_Frame_Sound )
	self.id = "StartMenu_Options_Frame_Sound"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local OptionInfo = CoD.StartMenu_Options_SettingInfo.new( f1_arg0, f1_arg1, 0, 0, 912, 1812, 0, 0, 40, 144 )
	self:addElement( OptionInfo )
	self.OptionInfo = OptionInfo
	
	local OptionGroups = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	OptionGroups:setLeftRight( 0, 0, 100, 800 )
	OptionGroups:setTopBottom( 0, 0, 0, 998 )
	OptionGroups:setWidgetType( CoD.StartMenu_Options_SettingSlider_Wrapper )
	OptionGroups:setVerticalCount( 18 )
	OptionGroups:setSpacing( 10 )
	OptionGroups:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	OptionGroups:setDataSource( "PlayerSettingsAudioList" )
	OptionGroups:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( OptionGroups, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		if IsElementPropertyValue( f3_arg0, "isAudioTest", true ) then
			PlaySoundAlias( "tst_test_system" )
			return true
		elseif HasListAction( f3_arg0, f3_arg2 ) then
			ProcessListAction( self, f3_arg0, f3_arg2, f3_arg1 )
			return true
		else
			
		end
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		if IsElementPropertyValue( f4_arg0, "isAudioTest", true ) then
			CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif HasListAction( f4_arg0, f4_arg2 ) then
			CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( OptionGroups )
	self.OptionGroups = OptionGroups
	
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		CoD.OptionsUtility.ResetPlayerSettingsGroupListToDefault( f5_arg2, self.OptionGroups )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x5D33EEAEB171341, Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 750 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		StopSoundAlias( "tst_test_system" )
	end )
	OptionGroups.id = "OptionGroups"
	self.__defaultFocus = OptionGroups
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.StartMenu_Options_Frame_Sound.__onClose = function ( f8_arg0 )
	f8_arg0.OptionInfo:close()
	f8_arg0.OptionGroups:close()
end

