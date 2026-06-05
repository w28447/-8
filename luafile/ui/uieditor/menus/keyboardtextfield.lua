require( "ui/uieditor/widgets/keyboardtextfieldinternal" )

CoD.KeyboardTextField = InheritFrom( CoD.Menu )
LUI.createMenu.KeyboardTextField = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "KeyboardTextField", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.KeyboardTextField )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local popupBG = CoD.KeyboardTextFieldInternal.new( f1_local1, f1_arg0, 0.5, 0.5, -336, 336, 0.5, 0.5, -192, 192 )
	self:addElement( popupBG )
	self.popupBG = popupBG
	
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = Engine.GetGlobalModel()
	f1_local4( f1_local3, f1_local5["lobbyRoot.lobbyNav"], function ( f3_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f3_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( element, menu, controller, model )
		EngineExec( controller, "ui_keyboard_cancel" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/cancel", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ESCAPE" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		EngineExec( controller, "ui_keyboard_complete" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "menu/ok", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
		return true
	end, false )
	popupBG:setModel( self.buttonModel, f1_arg0 )
	popupBG.id = "popupBG"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local4 = self
	return self
end

CoD.KeyboardTextField.__onClose = function ( f8_arg0 )
	f8_arg0.popupBG:close()
end

