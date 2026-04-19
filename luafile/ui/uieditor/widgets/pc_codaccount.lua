require( "ui/uieditor/menus/hud/credit_fullscreen" )
require( "ui/uieditor/menus/startmenu/popups/startmenu_options_codaccount_cta" )
require( "ui/uieditor/menus/startmenu/popups/startmenu_options_codaccount_manageaccount" )
require( "ui/uieditor/menus/startmenu/startmenu_options_network" )
require( "ui/uieditor/widgets/director/DirectorSelectButtonMiniInternal" )
require( "ui/uieditor/widgets/startmenu/startmenu_button_sm" )

CoD.PC_CoDAccount = InheritFrom( LUI.UIElement )
CoD.PC_CoDAccount.__defaultWidth = 1920
CoD.PC_CoDAccount.__defaultHeight = 780
CoD.PC_CoDAccount.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PC_CoDAccount )
	self.id = "PC_CoDAccount"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Backer = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Backer:setRGB( 0.67, 0.67, 0.67 )
	Backer:setAlpha( 0.02 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local Border = LUI.UIImage.new( 0, 1, -72, 72, 0.5, 0.5, -360, 360 )
	Border:setRGB( 0.8, 0.76, 0.7 )
	Border:setAlpha( 0.03 )
	Border:setImage( RegisterImage( 0xF1E3082B39E99BB ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local Network = CoD.StartMenu_Button_SM.new( f1_arg0, f1_arg1, 0, 0, 703, 943, 0, 0, 222, 462 )
	Network.StartMenuOptionsSubFrame.ImageContainer.ImageContainer:setImage( RegisterImage( 0xE8E46047AB4630E ) )
	Network.StartMenuOptionsSubFrame.ButtonText:setText( LocalizeToUpperString( "menu/network" ) )
	Network:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Network, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		OpenOverlay( self, "StartMenu_Options_Network", f3_arg2 )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( Network )
	self.Network = Network
	
	local Credits = CoD.StartMenu_Button_SM.new( f1_arg0, f1_arg1, 0, 0, 977, 1217, 0, 0, 222, 462 )
	Credits.StartMenuOptionsSubFrame.ImageContainer.ImageContainer:setImage( RegisterImage( 0x151A0DF84A6850A ) )
	Credits.StartMenuOptionsSubFrame.ButtonText:setText( LocalizeToUpperString( 0x68F4F1BF768E367 ) )
	Credits:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f5_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Credits, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		OpenOverlay( self, "Credit_Fullscreen", f6_arg2 )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( Credits )
	self.Credits = Credits
	
	local CoDaccount = CoD.DirectorSelectButtonMiniInternal.new( f1_arg0, f1_arg1, 0, 0, 703, 1217, 0, 0, 499, 568 )
	CoDaccount.LeaderActivityText:setText( Engine[0xF9F1239CFD921FE]( 0xE60E694DE8A2F04 ) )
	CoDaccount.MiddleText:setText( LocalizeToUpperString( 0xE60E694DE8A2F04 ) )
	CoDaccount.MiddleTextFocus:setText( LocalizeToUpperString( 0xE60E694DE8A2F04 ) )
	CoDaccount:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f8_local0
	end )
	f1_arg0:AddButtonCallbackFunction( CoDaccount, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if CoD.CoDAccountUtility.IsAccountFeatureEnabled( f9_arg2 ) and not IsSignedIntoUno( f9_arg2 ) then
			OpenOverlay( self, "StartMenu_Options_CoDAccount_CTA", f9_arg2 )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		elseif CoD.CoDAccountUtility.IsAccountFeatureEnabled( f9_arg2 ) and IsSignedIntoUno( f9_arg2 ) then
			OpenOverlay( self, "StartMenu_Options_CoDAccount_ManageAccount", f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if CoD.CoDAccountUtility.IsAccountFeatureEnabled( f10_arg2 ) and not IsSignedIntoUno( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif CoD.CoDAccountUtility.IsAccountFeatureEnabled( f10_arg2 ) and IsSignedIntoUno( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CoDaccount )
	self.CoDaccount = CoDaccount
	
	Network.id = "Network"
	Credits.id = "Credits"
	CoDaccount.id = "CoDaccount"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local6 = self
	SizeToWidthOfScreen( Backer, f1_arg1 )
	SizeToWidthOfScreen( Border, f1_arg1 )
	return self
end

CoD.PC_CoDAccount.__onClose = function ( f11_arg0 )
	f11_arg0.Backer:close()
	f11_arg0.Border:close()
	f11_arg0.Network:close()
	f11_arg0.Credits:close()
	f11_arg0.CoDaccount:close()
end

