require( "ui/uieditor/widgets/pc/footer/footerbutton_persistent" )
require( "x64:7f0168f93c6f579" )

CoD.FooterButton_PersistentLeftContainer = InheritFrom( LUI.UIElement )
CoD.FooterButton_PersistentLeftContainer.__defaultWidth = 480
CoD.FooterButton_PersistentLeftContainer.__defaultHeight = 54
CoD.FooterButton_PersistentLeftContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 0, false )
	self:setAlignment( LUI.Alignment.Left )
	self:setClass( CoD.FooterButton_PersistentLeftContainer )
	self.id = "FooterButton_PersistentLeftContainer"
	self.soundSet = "default"
	self.onlyChildrenFocusable = CoD.isPC
	self.anyChildUsesUpdateState = true
	
	local FooterButtonChat = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 0, 120, 0, 1, 0, 0 )
	FooterButtonChat:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.MenuChatToggleShouldBeVisible( element, menu, f1_arg1 )
			end
		}
	} )
	local FooterButtonSocial = FooterButtonChat
	local FooterButtonFriends = FooterButtonChat.subscribeToModel
	local FooterButtonStore = Engine.GetModelForController( f1_arg1 )
	FooterButtonFriends( FooterButtonSocial, FooterButtonStore.LockUIShortcutInput, function ( f3_arg0 )
		f1_arg0:updateElementState( FooterButtonChat, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonSocial = FooterButtonChat
	FooterButtonFriends = FooterButtonChat.subscribeToModel
	FooterButtonStore = Engine.GetModelForController( f1_arg1 )
	FooterButtonFriends( FooterButtonSocial, FooterButtonStore["ChatGlobal.ChatAvailableInMenuEvent"], function ( f4_arg0 )
		f1_arg0:updateElementState( FooterButtonChat, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "ChatGlobal.ChatAvailableInMenuEvent"
		} )
	end, false )
	FooterButtonChat.label:setText( Engine[0xF9F1239CFD921FE]( 0xEE439D162567C89 ) )
	FooterButtonChat.label2:setText( Engine[0xF9F1239CFD921FE]( 0x8266B58948F0859 ) )
	FooterButtonChat.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( "menu/chat_caps" ) )
	FooterButtonChat.footerTooltip.keyPrompt.keybind.__TooltipKeybind = function ()
		FooterButtonChat.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( CoD.PCUtility.ForceSetTextOnRebind( 0x925899529895C0B ) ) )
	end
	
	FooterButtonChat.footerTooltip.keyPrompt.keybind.__TooltipKeybind()
	FooterButtonChat:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f6_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonChat, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleChatVisibility( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonChat, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleChatVisibility( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonChat )
	self.FooterButtonChat = FooterButtonChat
	
	FooterButtonFriends = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 120, 240, 0, 1, 0, 0 )
	FooterButtonFriends:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.CanOpenFriends( f1_arg1, menu )
			end
		}
	} )
	FooterButtonStore = FooterButtonFriends
	FooterButtonSocial = FooterButtonFriends.subscribeToModel
	local FooterButtonSettings = Engine.GetModelForController( f1_arg1 )
	FooterButtonSocial( FooterButtonStore, FooterButtonSettings.LockUIShortcutInput, function ( f12_arg0 )
		f1_arg0:updateElementState( FooterButtonFriends, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonFriends.label:setText( Engine[0xF9F1239CFD921FE]( 0x139903360C0166C ) )
	FooterButtonFriends.label2:setText( Engine[0xF9F1239CFD921FE]( 0x8345F92F6F5B30 ) )
	FooterButtonFriends.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( "menu/friends_caps" ) )
	FooterButtonFriends.footerTooltip.keyPrompt.keybind.__TooltipKeybind = function ()
		FooterButtonFriends.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( CoD.PCUtility.ForceSetTextOnRebind( 0x21CC88215B8CABE ) ) )
	end
	
	FooterButtonFriends.footerTooltip.keyPrompt.keybind.__TooltipKeybind()
	FooterButtonFriends:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f14_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonFriends, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCBattlenetUtility.ToggleBattlenetMenuVisibility( element, menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonFriends, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCBattlenetUtility.ToggleBattlenetMenuVisibility( element, menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonFriends )
	self.FooterButtonFriends = FooterButtonFriends
	
	FooterButtonSocial = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 240, 360, 0, 1, 0, 0 )
	FooterButtonSocial:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.CanOpenSocialMenu( f1_arg1, menu )
			end
		}
	} )
	FooterButtonSettings = FooterButtonSocial
	FooterButtonStore = FooterButtonSocial.subscribeToModel
	local FooterButtonPlayerAccount = Engine.GetModelForController( f1_arg1 )
	FooterButtonStore( FooterButtonSettings, FooterButtonPlayerAccount.LockUIShortcutInput, function ( f20_arg0 )
		f1_arg0:updateElementState( FooterButtonSocial, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonSettings = FooterButtonSocial
	FooterButtonStore = FooterButtonSocial.subscribeToModel
	FooterButtonPlayerAccount = Engine.GetGlobalModel()
	FooterButtonStore( FooterButtonSettings, FooterButtonPlayerAccount["lobbyRoot.lobbyNetworkMode"], function ( f21_arg0 )
		f1_arg0:updateElementState( FooterButtonSocial, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f21_arg0:get(),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end, false )
	FooterButtonSettings = FooterButtonSocial
	FooterButtonStore = FooterButtonSocial.subscribeToModel
	FooterButtonPlayerAccount = Engine.GetGlobalModel()
	FooterButtonStore( FooterButtonSettings, FooterButtonPlayerAccount["lobbyRoot.lobbyNav"], function ( f22_arg0 )
		f1_arg0:updateElementState( FooterButtonSocial, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	FooterButtonSocial.label:setText( Engine[0xF9F1239CFD921FE]( 0x8E8C0862204180A ) )
	FooterButtonSocial.label2:setText( Engine[0xF9F1239CFD921FE]( 0xA4F37A001911A0A ) )
	FooterButtonSocial.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( "menu/social_caps" ) )
	FooterButtonSocial.footerTooltip.keyPrompt.keybind.__TooltipKeybind = function ()
		FooterButtonSocial.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( CoD.PCUtility.ForceSetTextOnRebind( 0xEB01F705FEE50EE ) ) )
	end
	
	FooterButtonSocial.footerTooltip.keyPrompt.keybind.__TooltipKeybind()
	FooterButtonSettings = FooterButtonSocial
	FooterButtonStore = FooterButtonSocial.subscribeToModel
	FooterButtonPlayerAccount = Engine.GetGlobalModel()
	FooterButtonStore( FooterButtonSettings, FooterButtonPlayerAccount["lobbyRoot.lobbyNetworkMode"], function ( f24_arg0, f24_arg1 )
		CoD.Menu.UpdateButtonShownState( f24_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f24_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	FooterButtonSettings = FooterButtonSocial
	FooterButtonStore = FooterButtonSocial.subscribeToModel
	FooterButtonPlayerAccount = Engine.GetGlobalModel()
	FooterButtonStore( FooterButtonSettings, FooterButtonPlayerAccount["lobbyRoot.lobbyNav"], function ( f25_arg0, f25_arg1 )
		CoD.Menu.UpdateButtonShownState( f25_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f25_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	FooterButtonSocial:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f26_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonSocial, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_opensocial" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonSocial, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_opensocial" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( FooterButtonSocial )
	self.FooterButtonSocial = FooterButtonSocial
	
	FooterButtonStore = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 360, 480, 0, 1, 0, 0 )
	FooterButtonStore:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.CanOpenStore( f1_arg1, menu )
			end
		}
	} )
	FooterButtonPlayerAccount = FooterButtonStore
	FooterButtonSettings = FooterButtonStore.subscribeToModel
	local f1_local7 = Engine.GetModelForController( f1_arg1 )
	FooterButtonSettings( FooterButtonPlayerAccount, f1_local7.LockUIShortcutInput, function ( f32_arg0 )
		f1_arg0:updateElementState( FooterButtonStore, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f32_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonStore:setAlpha( 0 )
	FooterButtonStore.label:setText( Engine[0xF9F1239CFD921FE]( 0x111EC45AB3B0626 ) )
	FooterButtonStore.label2:setText( Engine[0xF9F1239CFD921FE]( 0x861ED6423EBD90E ) )
	FooterButtonStore.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( "menu/store_caps" ) )
	FooterButtonStore.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( 0x8EF09D289B2D63E ) )
	FooterButtonStore:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f33_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonStore, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openstore" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonStore, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openstore" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonStore )
	self.FooterButtonStore = FooterButtonStore
	
	FooterButtonSettings = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 480, 600, 0, 1, 0, 0 )
	FooterButtonSettings:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.CanOpenSettings( f1_arg1, menu )
			end
		}
	} )
	f1_local7 = FooterButtonSettings
	FooterButtonPlayerAccount = FooterButtonSettings.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	FooterButtonPlayerAccount( f1_local7, f1_local8.LockUIShortcutInput, function ( f39_arg0 )
		f1_arg0:updateElementState( FooterButtonSettings, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f39_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonSettings.label:setText( Engine[0xF9F1239CFD921FE]( 0xFBCDFDF3FB70BDC ) )
	FooterButtonSettings.label2:setText( Engine[0xF9F1239CFD921FE]( 0x110681AB84DEE00 ) )
	FooterButtonSettings.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( "menu/settings_caps" ) )
	FooterButtonSettings.footerTooltip.keyPrompt.keybind.__TooltipKeybind = function ()
		FooterButtonSettings.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( CoD.PCUtility.ForceSetTextOnRebind( 0xAE4ED13AED2E15C ) ) )
	end
	
	FooterButtonSettings.footerTooltip.keyPrompt.keybind.__TooltipKeybind()
	FooterButtonSettings:registerEventHandler( "gain_focus", function ( element, event )
		local f41_local0 = nil
		if element.gainFocus then
			f41_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f41_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f41_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonSettings, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_opensettings" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonSettings, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_opensettings" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonSettings )
	self.FooterButtonSettings = FooterButtonSettings
	
	FooterButtonPlayerAccount = CoD.FooterButton_Player.new( f1_arg0, f1_arg1, 0, 0, 600, 720, 0, 1, 0, 0 )
	FooterButtonPlayerAccount:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and not CoD.PCUtility.CanOpenPlayerAccount( f1_arg1, menu )
			end
		}
	} )
	f1_local8 = FooterButtonPlayerAccount
	f1_local7 = FooterButtonPlayerAccount.subscribeToModel
	local f1_local9 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local8, f1_local9.LockUIShortcutInput, function ( f47_arg0 )
		f1_arg0:updateElementState( FooterButtonPlayerAccount, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f47_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonPlayerAccount.Internal.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( 0xB828992E638B17B ) )
	FooterButtonPlayerAccount.Internal.footerTooltip.keyPrompt.keybind.__Internal_TooltipKeybind = function ()
		FooterButtonPlayerAccount.Internal.footerTooltip.keyPrompt.keybind:setText( Engine[0xF9F1239CFD921FE]( CoD.PCUtility.ForceSetTextOnRebind( 0x2689F7EF9B424B ) ) )
	end
	
	FooterButtonPlayerAccount.Internal.footerTooltip.keyPrompt.keybind.__Internal_TooltipKeybind()
	FooterButtonPlayerAccount:registerEventHandler( "gain_focus", function ( element, event )
		local f49_local0 = nil
		if element.gainFocus then
			f49_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f49_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f49_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonPlayerAccount, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openPlayerAccount" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonPlayerAccount, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openPlayerAccount" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonPlayerAccount )
	self.FooterButtonPlayerAccount = FooterButtonPlayerAccount
	
	f1_local8 = FooterButtonChat
	f1_local7 = FooterButtonChat.subscribeToModel
	f1_local9 = DataSources.KeybindMessages.getModel( f1_arg1 )
	f1_local7( f1_local8, f1_local9.isBindingKey, FooterButtonChat.footerTooltip.keyPrompt.keybind.__TooltipKeybind )
	f1_local8 = FooterButtonFriends
	f1_local7 = FooterButtonFriends.subscribeToModel
	f1_local9 = DataSources.KeybindMessages.getModel( f1_arg1 )
	f1_local7( f1_local8, f1_local9.isBindingKey, FooterButtonFriends.footerTooltip.keyPrompt.keybind.__TooltipKeybind )
	f1_local8 = FooterButtonSocial
	f1_local7 = FooterButtonSocial.subscribeToModel
	f1_local9 = DataSources.KeybindMessages.getModel( f1_arg1 )
	f1_local7( f1_local8, f1_local9.isBindingKey, FooterButtonSocial.footerTooltip.keyPrompt.keybind.__TooltipKeybind )
	f1_local8 = FooterButtonSettings
	f1_local7 = FooterButtonSettings.subscribeToModel
	f1_local9 = DataSources.KeybindMessages.getModel( f1_arg1 )
	f1_local7( f1_local8, f1_local9.isBindingKey, FooterButtonSettings.footerTooltip.keyPrompt.keybind.__TooltipKeybind )
	f1_local8 = FooterButtonPlayerAccount
	f1_local7 = FooterButtonPlayerAccount.subscribeToModel
	f1_local9 = DataSources.KeybindMessages.getModel( f1_arg1 )
	f1_local7( f1_local8, f1_local9.isBindingKey, FooterButtonPlayerAccount.Internal.footerTooltip.keyPrompt.keybind.__Internal_TooltipKeybind )
	if CoD.isPC then
		FooterButtonChat.id = "FooterButtonChat"
	end
	if CoD.isPC then
		FooterButtonFriends.id = "FooterButtonFriends"
	end
	if CoD.isPC then
		FooterButtonSocial.id = "FooterButtonSocial"
	end
	if CoD.isPC then
		FooterButtonStore.id = "FooterButtonStore"
	end
	if CoD.isPC then
		FooterButtonSettings.id = "FooterButtonSettings"
	end
	if CoD.isPC then
		FooterButtonPlayerAccount.id = "FooterButtonPlayerAccount"
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local7 = self
	SetElementProperty( FooterButtonChat, "__isChatToggleButton", true )
	SetElementProperty( FooterButtonFriends, "__isFrontendBattlenetToggleButton", true )
	f1_local7 = FooterButtonPlayerAccount
	if IsInGame() then
		HideWidget( f1_local7 )
	end
	return self
end

CoD.FooterButton_PersistentLeftContainer.__onClose = function ( f54_arg0 )
	f54_arg0.FooterButtonChat:close()
	f54_arg0.FooterButtonFriends:close()
	f54_arg0.FooterButtonSocial:close()
	f54_arg0.FooterButtonStore:close()
	f54_arg0.FooterButtonSettings:close()
	f54_arg0.FooterButtonPlayerAccount:close()
end

