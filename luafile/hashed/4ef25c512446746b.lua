require( "x64:97d06fc9c1fdcaa" )

CoD.MasteryOptionsContainer = InheritFrom( LUI.UIElement )
CoD.MasteryOptionsContainer.__defaultWidth = 205
CoD.MasteryOptionsContainer.__defaultHeight = 350
CoD.MasteryOptionsContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MasteryOptionsContainer )
	self.id = "MasteryOptionsContainer"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasteryGrid = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	MasteryGrid:setLeftRight( 0.5, 0.5, -82.5, 82.5 )
	MasteryGrid:setTopBottom( 0, 0, 37, 297 )
	MasteryGrid:setWidgetType( CoD.CamoSlotWide )
	MasteryGrid:setVerticalCount( 3 )
	MasteryGrid:setSpacing( 10 )
	MasteryGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	MasteryGrid:setDataSource( "WeaponOptions" )
	MasteryGrid:linkToElementModel( MasteryGrid, "itemIndex", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	MasteryGrid:appendEventHandler( "input_source_changed", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	local BottomBracket9Slice = MasteryGrid
	local Label = MasteryGrid.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	Label( BottomBracket9Slice, f1_local4.LastInput, function ( f4_arg0, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	MasteryGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		CoD.WeaponOptionsUtility.SetFocusedWeaponOptionModel( element, f1_arg1, f1_arg0 )
		CoD.CraftUtility.PreviewWeaponCamo( self, element, f1_arg1, f1_arg0 )
		return f5_local0
	end )
	MasteryGrid:registerEventHandler( "lose_list_focus", function ( element, event )
		local f6_local0 = nil
		CoD.WeaponOptionsUtility.SetBaseWeaponOptions( element, f1_arg0, f1_arg1 )
		CoD.WeaponOptionsUtility.ClearWeaponOptionInfoModel( f1_arg0, f1_arg1, element )
		return f6_local0
	end )
	MasteryGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		return f7_local0
	end )
	f1_arg0:AddButtonCallbackFunction( MasteryGrid, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f8_arg1, f8_arg0, f8_arg2 ) and not CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f8_arg1, f8_arg0, f8_arg2, "camoIndex" ) then
			PlaySoundAlias( "uin_equipment_add" )
			CoD.WeaponOptionsUtility.SetWeaponOptionClassItemHelper( self, f8_arg0, f8_arg2, f8_arg1 )
			UpdateSelfState( self, f8_arg2 )
			UpdateAllMenuButtonPrompts( f8_arg1, f8_arg2 )
			return true
		elseif CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f8_arg1, f8_arg0, f8_arg2, "camoIndex" ) then
			PlaySoundAlias( "uin_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f8_arg0, f8_arg1, f8_arg2 )
			UpdateSelfState( self, f8_arg2 )
			UpdateAllMenuButtonPrompts( f8_arg1, f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f9_arg1, f9_arg0, f9_arg2 ) and not CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f9_arg1, f9_arg0, f9_arg2, "camoIndex" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f9_arg1, f9_arg0, f9_arg2, "camoIndex" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MasteryGrid, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f10_arg1, f10_arg0, f10_arg2, "camoIndex" ) and IsGamepad( f10_arg2 ) then
			PlaySoundAlias( "uin_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f10_arg0, f10_arg1, f10_arg2 )
			UpdateSelfState( self, f10_arg2 )
			UpdateAllMenuButtonPrompts( f10_arg1, f10_arg2 )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f11_arg1, f11_arg0, f11_arg2, "camoIndex" ) and IsGamepad( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MasteryGrid, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_remove", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f12_arg1, f12_arg0, f12_arg2, "camoIndex" ) and IsMouseOrKeyboard( f12_arg2 ) then
			PlaySoundAlias( "uin_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f12_arg0, f12_arg1, f12_arg2 )
			UpdateSelfState( self, f12_arg2 )
			UpdateAllMenuButtonPrompts( f12_arg1, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f13_arg1, f13_arg0, f13_arg2, "camoIndex" ) and IsMouseOrKeyboard( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x4D2505E19049444], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MasteryGrid, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f14_arg1, f14_arg0, f14_arg2 ) and IsGamepad( f14_arg2 ) then
			CoD.WeaponOptionsUtility.OpenActiveCamoStageDetailsOverlay( f14_arg1, f14_arg2, "CamoPersonalizationDetails", f14_arg0, false )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f15_arg1, f15_arg0, f15_arg2 ) and IsGamepad( f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0xB1A784560EDFEA7, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MasteryGrid, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f16_arg1, f16_arg0, f16_arg2 ) and IsMouseOrKeyboard( f16_arg2 ) then
			CoD.WeaponOptionsUtility.OpenActiveCamoStageDetailsOverlay( f16_arg1, f16_arg2, "CamoPersonalizationDetails", f16_arg0, false )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f17_arg1, f17_arg0, f17_arg2 ) and IsMouseOrKeyboard( f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xB1A784560EDFEA7, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( MasteryGrid, "updateDataSource", function ( element, controller, f18_arg2, f18_arg3 )
		if CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "MasteryGrid" ) then
			CoD.WeaponOptionsUtility.SetFocusedWeaponOptionModel( element, f1_arg1, f1_arg0 )
			CoD.CraftUtility.PreviewWeaponCamo( self, element, f1_arg1, f1_arg0 )
		end
	end )
	MasteryGrid:subscribeToGlobalModel( f1_arg1, "PerController", "WeaponPersonalization.listUpdate", function ( model )
		CoD.GridAndListUtility.UpdateDataSource( MasteryGrid, true, false, true )
		UpdateSelfState( self, f1_arg1 )
	end )
	MasteryGrid:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f20_arg1, f20_arg0, f20_arg2, "camoIndex" ) then
			return function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
				PlaySoundAlias( "uin_equipment_remove" )
				CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f21_arg0, f21_arg1, f21_arg2 )
				UpdateSelfState( self, f21_arg2 )
				UpdateAllMenuButtonPrompts( f21_arg1, f21_arg2 )
			end
			
		else
			
		end
	end )
	MasteryGrid:AddContextualMenuAction( f1_arg0, f1_arg1, 0xB1A784560EDFEA7, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f22_arg1, f22_arg0, f22_arg2 ) then
			return function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
				CoD.WeaponOptionsUtility.OpenActiveCamoStageDetailsOverlay( f23_arg1, f23_arg2, "CamoPersonalizationDetails", f23_arg0, false )
			end
			
		else
			
		end
	end )
	self:addElement( MasteryGrid )
	self.MasteryGrid = MasteryGrid
	
	Label = LUI.UIText.new( 0, 0, 9, 171, 0, 0, 11, 27 )
	Label:setRGB( ColorSet.T8__OFF__GRAY.r, ColorSet.T8__OFF__GRAY.g, ColorSet.T8__OFF__GRAY.b )
	Label:setText( LocalizeToUpperString( 0x369B657962E04DA ) )
	Label:setTTF( "default" )
	Label:setLetterSpacing( 4 )
	Label:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Label:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Label )
	self.Label = Label
	
	BottomBracket9Slice = LUI.UIImage.new( 0, 1, 9, -9, 0, 0, 28, 37 )
	BottomBracket9Slice:setAlpha( 0.5 )
	BottomBracket9Slice:setZRot( 180 )
	BottomBracket9Slice:setImage( RegisterImage( "uie_ui_menu_specialist_hub_bot_frame" ) )
	BottomBracket9Slice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BottomBracket9Slice:setShaderVector( 0, 0, 0, 0, 0 )
	BottomBracket9Slice:setupNineSliceShader( 16, 4 )
	self:addElement( BottomBracket9Slice )
	self.BottomBracket9Slice = BottomBracket9Slice
	
	MasteryGrid.id = "MasteryGrid"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local4 = self
	f1_local4 = MasteryGrid
	if IsPC() then
		SetElementProperty( f1_local4, "_category", "mstr" )
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local4, f1_arg1, "name", "", "" )
	else
		SetElementProperty( f1_local4, "_category", "mstr" )
	end
	return self
end

CoD.MasteryOptionsContainer.__onClose = function ( f24_arg0 )
	f24_arg0.MasteryGrid:close()
end

