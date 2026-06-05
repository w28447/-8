require( "ui/uieditor/widgets/pc/footer/footerbutton_bnetstore" )
require( "ui/uieditor/widgets/pc/footer/footerbutton_persistent" )

CoD.FooterButton_PersistentRightContainer = InheritFrom( LUI.UIElement )
CoD.FooterButton_PersistentRightContainer.__defaultWidth = 548
CoD.FooterButton_PersistentRightContainer.__defaultHeight = 54
CoD.FooterButton_PersistentRightContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 0, false )
	self:setAlignment( LUI.Alignment.Right )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "hudItems.hasStartedWZMatch", false )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "PositionDraft.stage", 0 )
	self:setClass( CoD.FooterButton_PersistentRightContainer )
	self.id = "FooterButton_PersistentRightContainer"
	self.soundSet = "default"
	self.onlyChildrenFocusable = CoD.isPC
	self.anyChildUsesUpdateState = true
	
	local FooterButtonBnetStore = CoD.FooterButton_BnetStore.new( f1_arg0, f1_arg1, 0, 0, 428, 548, 0, 1, 0, 0 )
	FooterButtonBnetStore:setAlpha( 0 )
	FooterButtonBnetStore:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonBnetStore, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openstore" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonBnetStore, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		CoD.PCUtility.ToggleShortcutMenu( menu, controller, "ui_openstore" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( FooterButtonBnetStore )
	self.FooterButtonBnetStore = FooterButtonBnetStore
	
	local FooterButtonStartWarzone = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 308, 428, 0, 1, 0, 0 )
	FooterButtonStartWarzone:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and CoD.PCUtility.CanShowStartWarzoneButton( menu, f1_arg1 )
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.CanShowStartWarzoneButton( menu, f1_arg1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.PCUtility.CanShowStartWarzoneButton( menu, f1_arg1 )
			end
		}
	} )
	local f1_local3 = FooterButtonStartWarzone
	local FooterButtonQuitGame = FooterButtonStartWarzone.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	FooterButtonQuitGame( f1_local3, f1_local5.LockUIShortcutInput, function ( f10_arg0 )
		f1_arg0:updateElementState( FooterButtonStartWarzone, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	FooterButtonStartWarzone:appendEventHandler( "on_session_start", function ( f11_arg0, f11_arg1 )
		f11_arg1.menu = f11_arg1.menu or f1_arg0
		f1_arg0:updateElementState( FooterButtonStartWarzone, f11_arg1 )
	end )
	FooterButtonStartWarzone:appendEventHandler( "on_session_end", function ( f12_arg0, f12_arg1 )
		f12_arg1.menu = f12_arg1.menu or f1_arg0
		f1_arg0:updateElementState( FooterButtonStartWarzone, f12_arg1 )
	end )
	f1_local3 = FooterButtonStartWarzone
	FooterButtonQuitGame = FooterButtonStartWarzone.subscribeToModel
	f1_local5 = Engine.GetGlobalModel()
	FooterButtonQuitGame( f1_local3, f1_local5["lobbyRoot.lobbyNav"], function ( f13_arg0 )
		f1_arg0:updateElementState( FooterButtonStartWarzone, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local3 = FooterButtonStartWarzone
	FooterButtonQuitGame = FooterButtonStartWarzone.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	FooterButtonQuitGame( f1_local3, f1_local5["hudItems.hasStartedWZMatch"], function ( f14_arg0 )
		f1_arg0:updateElementState( FooterButtonStartWarzone, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "hudItems.hasStartedWZMatch"
		} )
	end, false )
	FooterButtonStartWarzone.label:setText( LocalizeToUpperString( "warzone/start_warzone" ) )
	FooterButtonStartWarzone.label2:setRGB( 1, 0.9, 0.59 )
	FooterButtonStartWarzone.label2:setText( LocalizeToUpperString( "warzone/start_warzone" ) )
	FooterButtonStartWarzone.footerTooltip.label:setText( LocalizeToUpperString( "warzone/start_warzone" ) )
	FooterButtonStartWarzone.footerTooltip.keyPrompt.keybind:setText( CoD.BaseUtility.AlreadyLocalized( "[{ui_contextual_1}]" ) )
	FooterButtonStartWarzone:appendEventHandler( "on_session_start", function ( f15_arg0, f15_arg1 )
		f15_arg1.menu = f15_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end )
	FooterButtonStartWarzone:appendEventHandler( "on_session_end", function ( f16_arg0, f16_arg1 )
		f16_arg1.menu = f16_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end )
	f1_local3 = FooterButtonStartWarzone
	FooterButtonQuitGame = FooterButtonStartWarzone.subscribeToModel
	f1_local5 = Engine.GetGlobalModel()
	FooterButtonQuitGame( f1_local3, f1_local5["lobbyRoot.lobbyNav"], function ( f17_arg0, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	f1_local3 = FooterButtonStartWarzone
	FooterButtonQuitGame = FooterButtonStartWarzone.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	FooterButtonQuitGame( f1_local3, f1_local5["hudItems.hasStartedWZMatch"], function ( f18_arg0, f18_arg1 )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	FooterButtonStartWarzone:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f19_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonStartWarzone, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		if CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
			CoD.WZUtility.StartWarzone( controller )
			SetControllerModelValue( controller, "hudItems.hasStartedWZMatch", true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonStartWarzone, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		if CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
			CoD.WZUtility.StartWarzone( controller )
			SetControllerModelValue( controller, "hudItems.hasStartedWZMatch", true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.PCUtility.CanShowStartWarzoneButton( menu, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( FooterButtonStartWarzone, "setState", function ( element, controller, f24_arg2, f24_arg3, f24_arg4 )
		if IsElementInState( element, "Hidden" ) then
			HideWidget( element )
		else
			ShowWidget( element )
		end
	end )
	self:addElement( FooterButtonStartWarzone )
	self.FooterButtonStartWarzone = FooterButtonStartWarzone
	
	FooterButtonQuitGame = CoD.FooterButton_Persistent.new( f1_arg0, f1_arg1, 0, 0, 188, 308, 0, 1, 0, 0 )
	FooterButtonQuitGame:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return CoD.PCUtility.AreUIShortcutInputLocked( f1_arg1 ) and IsInGame()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsInGame() and CoD.PCUtility.CanShowLeaveGameButton( menu, f1_arg1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	f1_local5 = FooterButtonQuitGame
	f1_local3 = FooterButtonQuitGame.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local5, f1_local6.LockUIShortcutInput, function ( f28_arg0 )
		f1_arg0:updateElementState( FooterButtonQuitGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f28_arg0:get(),
			modelName = "LockUIShortcutInput"
		} )
	end, false )
	f1_local5 = FooterButtonQuitGame
	f1_local3 = FooterButtonQuitGame.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local5, f1_local6["PositionDraft.stage"], function ( f29_arg0 )
		f1_arg0:updateElementState( FooterButtonQuitGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f29_arg0:get(),
			modelName = "PositionDraft.stage"
		} )
	end, false )
	FooterButtonQuitGame.label:setText( Engine[0xF9F1239CFD921FE]( 0x7163F6214A962C7 ) )
	FooterButtonQuitGame.label2:setRGB( 1, 0.9, 0.59 )
	FooterButtonQuitGame.label2:setText( Engine[0xF9F1239CFD921FE]( 0x7163F6214A962C7 ) )
	FooterButtonQuitGame.footerTooltip.label:setText( Engine[0xF9F1239CFD921FE]( 0x7163F6214A962C7 ) )
	FooterButtonQuitGame.footerTooltip.keyPrompt.keybind:setText( CoD.BaseUtility.AlreadyLocalized( "[{ui_contextual_2}]" ) )
	f1_local5 = FooterButtonQuitGame
	f1_local3 = FooterButtonQuitGame.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local5, f1_local6["PositionDraft.stage"], function ( f30_arg0, f30_arg1 )
		CoD.Menu.UpdateButtonShownState( f30_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f30_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	FooterButtonQuitGame:registerEventHandler( "gain_focus", function ( element, event )
		local f31_local0 = nil
		if element.gainFocus then
			f31_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f31_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f31_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FooterButtonQuitGame, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		if CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
			QuitPCGame_MP( self, controller, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FooterButtonQuitGame, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( element, menu, controller, model )
		if CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
			QuitPCGame_MP( self, controller, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.PCUtility.CanShowLeaveGameButton( menu, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x865DD2DB1EFE9F8], "", nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( FooterButtonQuitGame )
	self.FooterButtonQuitGame = FooterButtonQuitGame
	
	if CoD.isPC then
		FooterButtonBnetStore.id = "FooterButtonBnetStore"
	end
	if CoD.isPC then
		FooterButtonStartWarzone.id = "FooterButtonStartWarzone"
	end
	if CoD.isPC then
		FooterButtonQuitGame.id = "FooterButtonQuitGame"
	end
	self.__defaultFocus = FooterButtonBnetStore
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.FooterButton_PersistentRightContainer.__onClose = function ( f36_arg0 )
	f36_arg0.FooterButtonBnetStore:close()
	f36_arg0.FooterButtonStartWarzone:close()
	f36_arg0.FooterButtonQuitGame:close()
end

