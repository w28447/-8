require( "ui/uieditor/widgets/common/commonitemslotlarge" )
require( "ui/uieditor/widgets/common/commonitemslottall" )

CoD.LoadoutClassItemEquipmentTakeTwo = InheritFrom( LUI.UIElement )
CoD.LoadoutClassItemEquipmentTakeTwo.__defaultWidth = 213
CoD.LoadoutClassItemEquipmentTakeTwo.__defaultHeight = 170
CoD.LoadoutClassItemEquipmentTakeTwo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.LoadoutClassItemEquipmentTakeTwo )
	self.id = "LoadoutClassItemEquipmentTakeTwo"
	self.soundSet = "CAC_EquipmentTakeTwo"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local EquipmentSlotLarge = CoD.CommonItemSlotLarge.new( f1_arg0, f1_arg1, 0, 0, 0, 213, 0, 0, 0, 170 )
	EquipmentSlotLarge:linkToElementModel( self, "primarygrenade", false, function ( model )
		EquipmentSlotLarge:setModel( model, f1_arg1 )
	end )
	EquipmentSlotLarge:linkToElementModel( self, "primarygrenade.imageLarge", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			EquipmentSlotLarge.ItemImage:setImage( CoD.BaseUtility.AlreadyRegistered( f3_local0 ) )
		end
	end )
	EquipmentSlotLarge:linkToElementModel( self, "primarygrenade.name", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			EquipmentSlotLarge.ItemName.TextBox:setText( Engine[0xF9F1239CFD921FE]( f4_local0 ) )
		end
	end )
	EquipmentSlotLarge:linkToElementModel( EquipmentSlotLarge, "itemIndex", true, function ( model, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	EquipmentSlotLarge:appendEventHandler( "input_source_changed", function ( f6_arg0, f6_arg1 )
		f6_arg1.menu = f6_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f6_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	local EquipmentSlotExtra = EquipmentSlotLarge
	local EquipmentSlot = EquipmentSlotLarge.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	EquipmentSlot( EquipmentSlotExtra, f1_local4.LastInput, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	EquipmentSlotLarge:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.CACUtility.UpdateClassWeaponModel( f1_arg0, element, f1_arg1 )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f8_local0
	end )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotLarge, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		CoD.CACUtility.OpenCACOverlay( self, f9_arg1, f9_arg2, "SpecialistEquipmentSelect", self, "primarygrenade" )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotLarge, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( f11_arg0, f11_arg2, "itemIndex", CoDShared.EmptyItemIndex, CoD.CACUtility.GetSpecialIssueEquipmentItemIndex() ) and IsGamepad( f11_arg2 ) then
			CoD.CACUtility.EquipSpecialIssueItem( f11_arg2, f11_arg1, f11_arg0 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( f12_arg0, f12_arg2, "itemIndex", CoDShared.EmptyItemIndex, CoD.CACUtility.GetSpecialIssueEquipmentItemIndex() ) and IsGamepad( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotLarge, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( f13_arg0, f13_arg2, "itemIndex", CoDShared.EmptyItemIndex, CoD.CACUtility.GetSpecialIssueEquipmentItemIndex() ) then
			CoD.CACUtility.EquipSpecialIssueItem( f13_arg2, f13_arg1, f13_arg0 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( f14_arg0, f14_arg2, "itemIndex", CoDShared.EmptyItemIndex, CoD.CACUtility.GetSpecialIssueEquipmentItemIndex() ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	EquipmentSlotLarge:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( f15_arg0, f15_arg2, "itemIndex", CoDShared.EmptyItemIndex, CoD.CACUtility.GetSpecialIssueEquipmentItemIndex() ) then
			return function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
				CoD.CACUtility.EquipSpecialIssueItem( f16_arg2, f16_arg1, f16_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( EquipmentSlotLarge )
	self.EquipmentSlotLarge = EquipmentSlotLarge
	
	EquipmentSlot = CoD.CommonItemSlotTall.new( f1_arg0, f1_arg1, 0, 0, 0, 106, 0, 0, 0, 170 )
	EquipmentSlot:mergeStateConditions( {
		{
			stateName = "DefaultStateHiddenName",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	EquipmentSlot:setAlpha( 0 )
	EquipmentSlot:linkToElementModel( self, "primarygrenade", false, function ( model )
		EquipmentSlot:setModel( model, f1_arg1 )
	end )
	EquipmentSlot:linkToElementModel( self, "primarygrenade.imageLarge", true, function ( model )
		local f19_local0 = model:get()
		if f19_local0 ~= nil then
			EquipmentSlot.ItemImage:setImage( CoD.BaseUtility.AlreadyRegistered( f19_local0 ) )
		end
	end )
	EquipmentSlot:linkToElementModel( self, "primarygrenade.name", true, function ( model )
		local f20_local0 = model:get()
		if f20_local0 ~= nil then
			EquipmentSlot.ItemName.TextBox:setText( Engine[0xF9F1239CFD921FE]( f20_local0 ) )
		end
	end )
	EquipmentSlot:linkToElementModel( EquipmentSlot, "itemIndex", true, function ( model, f21_arg1 )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	EquipmentSlot:appendEventHandler( "input_source_changed", function ( f22_arg0, f22_arg1 )
		f22_arg1.menu = f22_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f22_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f22_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	f1_local4 = EquipmentSlot
	EquipmentSlotExtra = EquipmentSlot.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	EquipmentSlotExtra( f1_local4, f1_local5.LastInput, function ( f23_arg0, f23_arg1 )
		CoD.Menu.UpdateButtonShownState( f23_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f23_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	EquipmentSlot:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.CACUtility.UpdateClassWeaponModel( f1_arg0, element, f1_arg1 )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f24_local0
	end )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlot, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		CoD.CACUtility.OpenCACOverlay( self, f25_arg1, f25_arg2, "SpecialistEquipmentSelect", self, "primarygrenade" )
		return true
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlot, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f27_arg0, f27_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f27_arg2 ) then
			CoD.CACUtility.EquipSpecialIssueItem( f27_arg2, f27_arg1, f27_arg0 )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f28_arg0, f28_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f28_arg2 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlot, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if IsMouseOrKeyboard( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f29_arg0, f29_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.EquipSpecialIssueItem( f29_arg2, f29_arg1, f29_arg0 )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if IsMouseOrKeyboard( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f30_arg0, f30_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	EquipmentSlot:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f31_arg0, f31_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
				CoD.CACUtility.EquipSpecialIssueItem( f32_arg2, f32_arg1, f32_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( EquipmentSlot )
	self.EquipmentSlot = EquipmentSlot
	
	EquipmentSlotExtra = CoD.CommonItemSlotTall.new( f1_arg0, f1_arg1, 1, 1, -107, 0, 0, 0, 0, 170 )
	EquipmentSlotExtra:mergeStateConditions( {
		{
			stateName = "DefaultStateHiddenName",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	EquipmentSlotExtra:setAlpha( 0 )
	EquipmentSlotExtra:linkToElementModel( self, "primarygrenadecount", false, function ( model )
		EquipmentSlotExtra:setModel( model, f1_arg1 )
	end )
	EquipmentSlotExtra:linkToElementModel( self, "primarygrenadecount.imageLarge", true, function ( model )
		local f35_local0 = model:get()
		if f35_local0 ~= nil then
			EquipmentSlotExtra.ItemImage:setImage( CoD.BaseUtility.AlreadyRegistered( f35_local0 ) )
		end
	end )
	EquipmentSlotExtra:linkToElementModel( self, "primarygrenadecount.name", true, function ( model )
		local f36_local0 = model:get()
		if f36_local0 ~= nil then
			EquipmentSlotExtra.ItemName.TextBox:setText( Engine[0xF9F1239CFD921FE]( f36_local0 ) )
		end
	end )
	EquipmentSlotExtra:linkToElementModel( EquipmentSlotExtra, "itemIndex", true, function ( model, f37_arg1 )
		CoD.Menu.UpdateButtonShownState( f37_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f37_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f37_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	EquipmentSlotExtra:appendEventHandler( "input_source_changed", function ( f38_arg0, f38_arg1 )
		f38_arg1.menu = f38_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f38_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f38_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	f1_local5 = EquipmentSlotExtra
	f1_local4 = EquipmentSlotExtra.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local4( f1_local5, f1_local6.LastInput, function ( f39_arg0, f39_arg1 )
		CoD.Menu.UpdateButtonShownState( f39_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f39_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	EquipmentSlotExtra:registerEventHandler( "gain_focus", function ( element, event )
		local f40_local0 = nil
		if element.gainFocus then
			f40_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f40_local0 = element.super:gainFocus( event )
		end
		CoD.CACUtility.UpdateClassWeaponModel( f1_arg0, element, f1_arg1 )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f40_local0
	end )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotExtra, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if CoD.ModelUtility.IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.IsSelfInState( self, "TakeTwo" ) then
			CoD.CACUtility.EquipAdditionalEquipment( f41_arg1, f41_arg2, f41_arg0 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f41_arg1, f41_arg0, f41_arg2 )
			return true
		else
			
		end
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		if CoD.ModelUtility.IsSelfModelValueEqualTo( f42_arg0, f42_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.IsSelfInState( self, "TakeTwo" ) then
			CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotExtra, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f43_arg0, f43_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f43_arg2 ) then
			CoD.CACUtility.RemoveAdditionalEquipment( f43_arg1, f43_arg2, f43_arg0 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f43_arg1, f43_arg0, f43_arg2 )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f44_arg0, f44_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f44_arg2 ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( EquipmentSlotExtra, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		if IsMouseOrKeyboard( f45_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f45_arg0, f45_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.RemoveAdditionalEquipment( f45_arg1, f45_arg2, f45_arg0 )
			CoD.FreeCursorUtility.UpdateSetupContext( f45_arg0, f45_arg2 )
			return true
		else
			
		end
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		if IsMouseOrKeyboard( f46_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f46_arg0, f46_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	EquipmentSlotExtra:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f47_arg0, f47_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
				CoD.CACUtility.RemoveAdditionalEquipment( f48_arg1, f48_arg2, f48_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( EquipmentSlotExtra )
	self.EquipmentSlotExtra = EquipmentSlotExtra
	
	self:mergeStateConditions( {
		{
			stateName = "TakeTwo",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( self, f1_arg1, "canTakeTwo" )
			end
		}
	} )
	self:linkToElementModel( self, "canTakeTwo", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "canTakeTwo"
		} )
	end )
	EquipmentSlotLarge.id = "EquipmentSlotLarge"
	EquipmentSlot.id = "EquipmentSlot"
	EquipmentSlotExtra.id = "EquipmentSlotExtra"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local4 = self
	f1_local4 = EquipmentSlotLarge
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local4, f1_arg1, "name", "", "" )
	end
	f1_local4 = EquipmentSlot
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local4, f1_arg1, "name", "", "" )
	end
	f1_local4 = EquipmentSlotExtra
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local4, f1_arg1, "name", "", "" )
	end
	return self
end

CoD.LoadoutClassItemEquipmentTakeTwo.__resetProperties = function ( f51_arg0 )
	f51_arg0.EquipmentSlotExtra:completeAnimation()
	f51_arg0.EquipmentSlot:completeAnimation()
	f51_arg0.EquipmentSlotLarge:completeAnimation()
	f51_arg0.EquipmentSlotExtra:setLeftRight( 1, 1, -107, 0 )
	f51_arg0.EquipmentSlotExtra:setAlpha( 0 )
	f51_arg0.EquipmentSlot:setLeftRight( 0, 0, 0, 106 )
	f51_arg0.EquipmentSlot:setAlpha( 0 )
	f51_arg0.EquipmentSlotLarge:setAlpha( 1 )
	f51_arg0.EquipmentSlotLarge:setScale( 1, 1 )
end

CoD.LoadoutClassItemEquipmentTakeTwo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f52_arg0, f52_arg1 )
			f52_arg0:__resetProperties()
			f52_arg0:setupElementClipCounter( 3 )
			f52_arg0.EquipmentSlotLarge:completeAnimation()
			f52_arg0.EquipmentSlotLarge:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.EquipmentSlotLarge )
			f52_arg0.EquipmentSlot:completeAnimation()
			f52_arg0.EquipmentSlot:setAlpha( 0 )
			f52_arg0.clipFinished( f52_arg0.EquipmentSlot )
			f52_arg0.EquipmentSlotExtra:completeAnimation()
			f52_arg0.EquipmentSlotExtra:setAlpha( 0 )
			f52_arg0.clipFinished( f52_arg0.EquipmentSlotExtra )
		end,
		ChildFocus = function ( f53_arg0, f53_arg1 )
			f53_arg0:__resetProperties()
			f53_arg0:setupElementClipCounter( 1 )
			f53_arg0.EquipmentSlotLarge:completeAnimation()
			f53_arg0.EquipmentSlotLarge:setScale( 1.05, 1.05 )
			f53_arg0.clipFinished( f53_arg0.EquipmentSlotLarge )
		end,
		GainChildFocus = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 1 )
			local f54_local0 = function ( f55_arg0 )
				f54_arg0.EquipmentSlotLarge:beginAnimation( 200, Enum[0xF50FFF429AB1890][0x5193EA7825DC097] )
				f54_arg0.EquipmentSlotLarge:setScale( 1.05, 1.05 )
				f54_arg0.EquipmentSlotLarge:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.EquipmentSlotLarge:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
			end
			
			f54_arg0.EquipmentSlotLarge:completeAnimation()
			f54_arg0.EquipmentSlotLarge:setScale( 1, 1 )
			f54_local0( f54_arg0.EquipmentSlotLarge )
		end,
		LoseChildFocus = function ( f56_arg0, f56_arg1 )
			f56_arg0:__resetProperties()
			f56_arg0:setupElementClipCounter( 1 )
			local f56_local0 = function ( f57_arg0 )
				f56_arg0.EquipmentSlotLarge:beginAnimation( 200, Enum[0xF50FFF429AB1890][0x5193EA7825DC097] )
				f56_arg0.EquipmentSlotLarge:setScale( 1, 1 )
				f56_arg0.EquipmentSlotLarge:registerEventHandler( "interrupted_keyframe", f56_arg0.clipInterrupted )
				f56_arg0.EquipmentSlotLarge:registerEventHandler( "transition_complete_keyframe", f56_arg0.clipFinished )
			end
			
			f56_arg0.EquipmentSlotLarge:completeAnimation()
			f56_arg0.EquipmentSlotLarge:setScale( 1.05, 1.05 )
			f56_local0( f56_arg0.EquipmentSlotLarge )
		end
	},
	TakeTwo = {
		DefaultClip = function ( f58_arg0, f58_arg1 )
			f58_arg0:__resetProperties()
			f58_arg0:setupElementClipCounter( 3 )
			f58_arg0.EquipmentSlotLarge:completeAnimation()
			f58_arg0.EquipmentSlotLarge:setAlpha( 0 )
			f58_arg0.clipFinished( f58_arg0.EquipmentSlotLarge )
			f58_arg0.EquipmentSlot:completeAnimation()
			f58_arg0.EquipmentSlot:setLeftRight( 0, 0, 0, 101 )
			f58_arg0.EquipmentSlot:setAlpha( 1 )
			f58_arg0.clipFinished( f58_arg0.EquipmentSlot )
			f58_arg0.EquipmentSlotExtra:completeAnimation()
			f58_arg0.EquipmentSlotExtra:setLeftRight( 1, 1, -101, 0 )
			f58_arg0.EquipmentSlotExtra:setAlpha( 1 )
			f58_arg0.clipFinished( f58_arg0.EquipmentSlotExtra )
		end
	}
}
CoD.LoadoutClassItemEquipmentTakeTwo.__onClose = function ( f59_arg0 )
	f59_arg0.EquipmentSlotLarge:close()
	f59_arg0.EquipmentSlot:close()
	f59_arg0.EquipmentSlotExtra:close()
end

