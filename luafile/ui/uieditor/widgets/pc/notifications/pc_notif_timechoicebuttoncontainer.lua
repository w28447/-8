require( "ui/uieditor/widgets/pc/notifications/pc_notif_timechoicebutton" )

CoD.PC_Notif_TimeChoiceButtonContainer = InheritFrom( LUI.UIElement )
CoD.PC_Notif_TimeChoiceButtonContainer.__defaultWidth = 400
CoD.PC_Notif_TimeChoiceButtonContainer.__defaultHeight = 32
CoD.PC_Notif_TimeChoiceButtonContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 10, false )
	self:setAlignment( LUI.Alignment.Right )
	self:setClass( CoD.PC_Notif_TimeChoiceButtonContainer )
	self.id = "PC_Notif_TimeChoiceButtonContainer"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local TimeChoice = CoD.PC_Notif_TimeChoiceButton.new( f1_arg0, f1_arg1, 0, 0, 200, 400, 0, 1, 0, 0 )
	TimeChoice:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TimeChoice, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCNotificationsUtility.HideNotificationWidgetForSession( controller )
		CoD.PCNotificationsUtility.SetChooseOffDurationStateVisibility( controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( TimeChoice )
	self.TimeChoice = TimeChoice
	
	local TimeChoice3 = CoD.PC_Notif_TimeChoiceButton.new( f1_arg0, f1_arg1, 0, 0, 90, 190, 0, 1, 0, 0 )
	TimeChoice3.TimeChoice:setText( LocalizeStringWithParameter( 0x21A648849117DD6, 1 ) )
	TimeChoice3:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f5_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TimeChoice3, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCNotificationsUtility.HideNotificationWidgetWithDuration( controller, 3600 )
		CoD.PCNotificationsUtility.SetChooseOffDurationStateVisibility( controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( TimeChoice3 )
	self.TimeChoice3 = TimeChoice3
	
	local TimeChoice2 = CoD.PC_Notif_TimeChoiceButton.new( f1_arg0, f1_arg1, 0, 0, -20, 80, 0, 1, 0, 0 )
	TimeChoice2.TimeChoice:setText( LocalizeStringWithParameter( 0x41274FB72D5A17E, 30 ) )
	TimeChoice2:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f8_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TimeChoice2, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		CoD.PCNotificationsUtility.HideNotificationWidgetWithDuration( controller, 1800 )
		CoD.PCNotificationsUtility.SetChooseOffDurationStateVisibility( controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( TimeChoice2 )
	self.TimeChoice2 = TimeChoice2
	
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.PCNotificationsUtility.IsNotificationWidgetVisible( f1_arg1 )
			end
		}
	} )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["PC.CurrentNotification.visibility"], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "PC.CurrentNotification.visibility"
		} )
	end, false )
	TimeChoice.id = "TimeChoice"
	TimeChoice3.id = "TimeChoice3"
	TimeChoice2.id = "TimeChoice2"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.PC_Notif_TimeChoiceButtonContainer.__onClose = function ( f13_arg0 )
	f13_arg0.TimeChoice:close()
	f13_arg0.TimeChoice3:close()
	f13_arg0.TimeChoice2:close()
end

