require( "x64:a4c60719b1e8805" )

CoD.LootBaseOptionGrid = InheritFrom( LUI.UIElement )
CoD.LootBaseOptionGrid.__defaultWidth = 1214
CoD.LootBaseOptionGrid.__defaultHeight = 350
CoD.LootBaseOptionGrid.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.LootBaseOptionGrid )
	self.id = "LootBaseOptionGrid"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LootBaseGrid = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	LootBaseGrid:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( menu, element, f1_arg1, "camoIndex" )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return CoD.BreadcrumbUtility.IsWeaponCamoNew( menu, element, f1_arg1 )
			end
		}
	} )
	LootBaseGrid:setLeftRight( 0, 0, 12, 1202 )
	LootBaseGrid:setTopBottom( 0, 0, 40, 300 )
	LootBaseGrid:setWidgetType( CoD.CamoSlot )
	LootBaseGrid:setHorizontalCount( 10 )
	LootBaseGrid:setVerticalCount( 3 )
	LootBaseGrid:setSpacing( 10 )
	LootBaseGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	LootBaseGrid:setDataSource( "WeaponOptions" )
	LootBaseGrid:linkToElementModel( LootBaseGrid, "itemIndex", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	LootBaseGrid:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	local BottomBracket9Slice = LootBaseGrid
	local Label = LootBaseGrid.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	Label( BottomBracket9Slice, f1_local4.LastInput, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	LootBaseGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		CoD.WeaponOptionsUtility.SetFocusedWeaponOptionModel( element, f1_arg1, f1_arg0 )
		CoD.CraftUtility.PreviewWeaponCamo( self, element, f1_arg1, f1_arg0 )
		return f7_local0
	end )
	LootBaseGrid:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f8_local0 = nil
		if IsElementInState( element, "New" ) then
			CoD.BreadcrumbUtility.SetWeaponCamoOld( f1_arg0, element, f1_arg1 )
			CoD.BreadcrumbUtility.UpdateWeaponCamoBreadcrumbs( f1_arg0, f1_arg1 )
		end
		return f8_local0
	end )
	LootBaseGrid:registerEventHandler( "lose_list_focus", function ( element, event )
		local f9_local0 = nil
		CoD.WeaponOptionsUtility.SetBaseWeaponOptions( element, f1_arg0, f1_arg1 )
		CoD.WeaponOptionsUtility.ClearWeaponOptionInfoModel( f1_arg0, f1_arg1, element )
		return f9_local0
	end )
	LootBaseGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f10_local0
	end )
	f1_arg0:AddButtonCallbackFunction( LootBaseGrid, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f11_arg1, f11_arg0, f11_arg2 ) and CoD.WeaponOptionsUtility.IsItemWeaponOptionLootOwned( f11_arg1, f11_arg0, f11_arg2 ) and not CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f11_arg1, f11_arg0, f11_arg2, "camoIndex" ) then
			PlaySoundAlias( "cac_equipment_add" )
			CoD.WeaponOptionsUtility.SetWeaponOptionClassItemHelper( self, f11_arg0, f11_arg2, f11_arg1 )
			UpdateSelfState( self, f11_arg2 )
			UpdateAllMenuButtonPrompts( f11_arg1, f11_arg2 )
			return true
		elseif CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f11_arg1, f11_arg0, f11_arg2, "camoIndex" ) then
			PlaySoundAlias( "cac_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f11_arg0, f11_arg1, f11_arg2 )
			UpdateSelfState( self, f11_arg2 )
			UpdateAllMenuButtonPrompts( f11_arg1, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if not CoD.WeaponOptionsUtility.IsItemWeaponOptionLocked( f12_arg1, f12_arg0, f12_arg2 ) and CoD.WeaponOptionsUtility.IsItemWeaponOptionLootOwned( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f12_arg1, f12_arg0, f12_arg2, "camoIndex" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f12_arg1, f12_arg0, f12_arg2, "camoIndex" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( LootBaseGrid, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f13_arg1, f13_arg0, f13_arg2, "camoIndex" ) and IsGamepad( f13_arg2 ) then
			PlaySoundAlias( "cac_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f13_arg0, f13_arg1, f13_arg2 )
			UpdateSelfState( self, f13_arg2 )
			UpdateAllMenuButtonPrompts( f13_arg1, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f14_arg1, f14_arg0, f14_arg2, "camoIndex" ) and IsGamepad( f14_arg2 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( LootBaseGrid, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_remove", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f15_arg1, f15_arg0, f15_arg2, "camoIndex" ) and IsMouseOrKeyboard( f15_arg2 ) then
			PlaySoundAlias( "cac_equipment_remove" )
			CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f15_arg0, f15_arg1, f15_arg2 )
			UpdateSelfState( self, f15_arg2 )
			UpdateAllMenuButtonPrompts( f15_arg1, f15_arg2 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f16_arg1, f16_arg0, f16_arg2, "camoIndex" ) and IsMouseOrKeyboard( f16_arg2 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x4D2505E19049444], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	LootBaseGrid:subscribeToGlobalModel( f1_arg1, "PerController", "WeaponPersonalization.listUpdate", function ( model )
		CoD.GridAndListUtility.UpdateDataSource( LootBaseGrid, true, false, true )
		UpdateSelfState( self, f1_arg1 )
	end )
	LootBaseGrid:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if CoD.WeaponOptionsUtility.IsWeaponOptionEquipped( f18_arg1, f18_arg0, f18_arg2, "camoIndex" ) and IsPC() then
			return function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
				PlaySoundAlias( "cac_equipment_remove" )
				CoD.WeaponOptionsUtility.ClearWeaponOptionsHelper( self, f19_arg0, f19_arg1, f19_arg2 )
				UpdateSelfState( self, f19_arg2 )
				UpdateAllMenuButtonPrompts( f19_arg1, f19_arg2 )
			end
			
		else
			
		end
	end )
	self:addElement( LootBaseGrid )
	self.LootBaseGrid = LootBaseGrid
	
	Label = LUI.UIText.new( 0, 0, 0.5, 340.5, 0, 0, 11, 27 )
	Label:setRGB( ColorSet.T8__OFF__GRAY.r, ColorSet.T8__OFF__GRAY.g, ColorSet.T8__OFF__GRAY.b )
	Label:setText( LocalizeToUpperString( 0xF602F1BAFC731B5 ) )
	Label:setTTF( "default" )
	Label:setLetterSpacing( 4 )
	Label:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Label:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Label )
	self.Label = Label
	
	BottomBracket9Slice = LUI.UIImage.new( 0, 0, 0, 1214, 0, 0, 28, 37 )
	BottomBracket9Slice:setAlpha( 0.5 )
	BottomBracket9Slice:setZRot( 180 )
	BottomBracket9Slice:setImage( RegisterImage( "uie_ui_menu_specialist_hub_bot_frame" ) )
	BottomBracket9Slice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BottomBracket9Slice:setShaderVector( 0, 0, 0, 0, 0 )
	BottomBracket9Slice:setupNineSliceShader( 16, 4 )
	self:addElement( BottomBracket9Slice )
	self.BottomBracket9Slice = BottomBracket9Slice
	
	LootBaseGrid.id = "LootBaseGrid"
	self.__defaultFocus = LootBaseGrid
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local4 = self
	f1_local4 = LootBaseGrid
	if IsPC() then
		SetElementProperty( f1_local4, "_category", "lootbase" )
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local4, f1_arg1, "name", "", "" )
	else
		SetElementProperty( f1_local4, "_category", "lootbase" )
	end
	return self
end

CoD.LootBaseOptionGrid.__onClose = function ( f20_arg0 )
	f20_arg0.LootBaseGrid:close()
end

