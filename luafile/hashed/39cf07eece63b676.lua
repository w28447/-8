require( "ui/uieditor/widgets/mphudwidgets/bountyhunter/bountyhunterbuyinternal" )
require( "ui/uieditor/widgets/mphudwidgets/bountyhunter/bountyhunteropenprompt" )
require( "ui/uieditor/widgets/mphudwidgets/bountyhunter/bountyhunterradialtimer" )
require( "x64:3e4f33ba044e8d1" )

CoD.BountyHunterBuy = InheritFrom( CoD.Menu )
LUI.createMenu.BountyHunterBuy = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "BountyHunterBuy", f1_arg0 )
	local f1_local1 = self
	CoD.BountyHunterUtility.SetupBountyHunterModels( self, f1_local1, f1_arg0 )
	CoD.BaseUtility.SetAsPriority( f1_local1, f1_arg0 )
	self:setClass( CoD.BountyHunterBuy )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local BountyHunterBuyInternal = CoD.BountyHunterBuyInternal.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	BountyHunterBuyInternal:linkToElementModel( self, nil, false, function ( model )
		BountyHunterBuyInternal:setModel( model, f1_arg0 )
	end )
	self:addElement( BountyHunterBuyInternal )
	self.BountyHunterBuyInternal = BountyHunterBuyInternal
	
	local BountyHunterRadialTimer = CoD.BountyHunterRadialTimer.new( f1_local1, f1_arg0, 0.5, 0.5, 828, 978, 0.5, 0.5, -560, -410 )
	self:addElement( BountyHunterRadialTimer )
	self.BountyHunterRadialTimer = BountyHunterRadialTimer
	
	local BountyHunterOpenPrompt = CoD.BountyHunterOpenPrompt.new( f1_local1, f1_arg0, 0.5, 0.5, -150, 150, 0.5, 0.5, 255, 285 )
	BountyHunterOpenPrompt:setAlpha( 0 )
	self:addElement( BountyHunterOpenPrompt )
	self.BountyHunterOpenPrompt = BountyHunterOpenPrompt
	
	local PCBackButton = nil
	
	PCBackButton = CoD.PC_BountyHunterBuy_BackButton.new( f1_local1, f1_arg0, 0.5, 0.5, -920, -720, 1, 1, -70, -10 )
	PCBackButton.Button.ButtonContainer.Title:setText( LocalizeToUpperString( "menu/close" ) )
	local f1_local6 = PCBackButton
	local f1_local7 = PCBackButton.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f3_arg0, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PCBackButton:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( PCBackButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if not IsVisibilityBitSet( f5_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not IsDemoPlaying() then
			CoD.BountyHunterUtility.ToggleBuyMenuVisible( self, f5_arg2, self.BountyHunterBuyInternal, self.BountyHunterOpenPrompt, self.PCBackButton )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if not IsVisibilityBitSet( f6_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( PCBackButton )
	self.PCBackButton = PCBackButton
	
	self:mergeStateConditions( {
		{
			stateName = "Spectating",
			condition = function ( menu, element, event )
				local f7_local0 = Engine.IsVisibilityBitSet( f1_arg0, Enum.UIVisibilityBit[0xD567EDB5609CCEC] )
				if not f7_local0 then
					f7_local0 = Engine.IsVisibilityBitSet( f1_arg0, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] )
				end
				return f7_local0
			end
		}
	} )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD567EDB5609CCEC]], function ( f8_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD567EDB5609CCEC]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]], function ( f9_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A] )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f11_arg0, f11_arg1 )
		f11_arg1.menu = f11_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f11_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A] )
	end )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8.LastInput, function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A] )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["hudItems.bountyUndoValid"], function ( f13_arg0, f13_arg1 )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not IsVisibilityBitSet( f14_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not IsMouseOrKeyboard( f14_arg2 ) and not IsDemoPlaying() then
			CoD.BountyHunterUtility.ToggleBuyMenuVisible( self, f14_arg2, self.BountyHunterBuyInternal, self.BountyHunterOpenPrompt, self.PCBackButton )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not IsVisibilityBitSet( f15_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not IsMouseOrKeyboard( f15_arg2 ) and not IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x78D439E1B360368, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsBooleanDvarSet( "ui_bounty_undo_enabled" ) and CoD.ModelUtility.IsModelValueTrue( f16_arg2, "hudItems.bountyUndoValid" ) then
			SendOwnMenuResponse( f16_arg1, f16_arg2, "undo_last_purchase" )
			SetControllerModelValue( f16_arg2, "hudItems.bountyUndoValid", false )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if IsBooleanDvarSet( "ui_bounty_undo_enabled" ) and CoD.ModelUtility.IsModelValueTrue( f17_arg2, "hudItems.bountyUndoValid" ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x6B7E381CB72DD91, Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 750 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		local f18_local0 = self
		if not IsCodCaster( f18_arg1 ) and IsPC() then
			LockInput( self, f18_arg1, true )
			CoD.PCUtility.LockUIShortcutInput( f18_arg2, f18_arg1 )
		elseif not IsCodCaster( f18_arg1 ) then
			LockInput( self, f18_arg1, true )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if IsPC() then
			CoD.BaseUtility.CloseOccludingMenus( self )
			LockInput( self, f1_arg0, false )
			CoD.BaseUtility.ClearBlur( f1_arg0 )
			CoD.PCWidgetUtility.CloseChat( f1_local1, f1_arg0 )
			CoD.PCUtility.UnlockUIShortcutInput( f1_local1, f1_arg0 )
		else
			CoD.BaseUtility.CloseOccludingMenus( self )
			LockInput( self, f1_arg0, false )
			CoD.BaseUtility.ClearBlur( f1_arg0 )
		end
	end )
	BountyHunterBuyInternal.id = "BountyHunterBuyInternal"
	if CoD.isPC then
		PCBackButton.id = "PCBackButton"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = BountyHunterBuyInternal
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local7 = self
	if IsPC() then
		CoD.PCWidgetUtility.PrepareHeistBuyMenuButtons( self, f1_arg0, f1_local1 )
	end
	return self
end

CoD.BountyHunterBuy.__resetProperties = function ( f21_arg0 )
	f21_arg0.BountyHunterBuyInternal:completeAnimation()
	f21_arg0.BountyHunterBuyInternal:setAlpha( 1 )
end

CoD.BountyHunterBuy.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 0 )
		end
	},
	Spectating = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 1 )
			f23_arg0.BountyHunterBuyInternal:completeAnimation()
			f23_arg0.BountyHunterBuyInternal:setAlpha( 0 )
			f23_arg0.clipFinished( f23_arg0.BountyHunterBuyInternal )
		end
	}
}
CoD.BountyHunterBuy.__onClose = function ( f24_arg0 )
	f24_arg0.__on_close_removeOverrides()
	f24_arg0.BountyHunterBuyInternal:close()
	f24_arg0.BountyHunterRadialTimer:close()
	f24_arg0.BountyHunterOpenPrompt:close()
	f24_arg0.PCBackButton:close()
end

