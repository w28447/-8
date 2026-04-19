require( "ui/uieditor/widgets/cac/cactexttab" )
require( "ui/uieditor/widgets/cac/weaponselect/weaponselectgriditem" )
require( "ui/uieditor/widgets/cac/weaponvariants/weaponvariantlistwidget" )
require( "ui/uieditor/widgets/common/common_tabbar_center" )
require( "ui/uieditor/widgets/pc/pc_gridhorizontalscrollbar" )
require( "ui/uieditor/widgets/scrollbars/horizontalcounterverticalspace" )
require( "ui/uieditor/widgets/warzone/warzonecontextualextraitemsarrow" )

CoD.WeaponListWidget = InheritFrom( LUI.UIElement )
CoD.WeaponListWidget.__defaultWidth = 1920
CoD.WeaponListWidget.__defaultHeight = 490
CoD.WeaponListWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	SetControllerModelValue( f1_arg1, "Unlockables.listUpdate", 0 )
	self:setClass( CoD.WeaponListWidget )
	self.id = "WeaponListWidget"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local weaponCategoryList = CoD.Common_Tabbar_Center.new( f1_arg0, f1_arg1, 0.5, 0.5, -1650, 1650, 0, 0, -21, 40 )
	weaponCategoryList.Tabs.grid:setWidgetType( CoD.CACTextTab )
	weaponCategoryList.Tabs.grid:setDataSource( "WeaponGroups" )
	weaponCategoryList:registerEventHandler( "list_active_changed", function ( element, event )
		local f2_local0 = nil
		if CoD.BaseUtility.IsWidgetVisible( element ) then
			SetStateByElementModel( self, element, f1_arg1, "state" )
			SetElementProperty( f1_arg0, "__itemGroup", element.category )
			SetLoseFocusToElement( self, "weaponList", f1_arg1 )
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, f1_arg0, f1_arg1 )
			ForceCheckDefaultPCFocus( f1_arg0, f1_arg0, f1_arg1 )
			ForceNotifyControllerModel( f1_arg1, "Unlockables.listUpdate" )
		end
		return f2_local0
	end )
	self.__on_menuOpened_weaponCategoryList = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		local f3_local0 = weaponCategoryList
		if not IsElementPropertyValue( f3_local0, "_receivedMenuOpen", true ) and not CoD.CACUtility.IsCurrentGameTypeBarebones() then
			SetElementProperty( f3_local0, "_receivedMenuOpen", true )
			CoD.CACUtility.SetActiveListItemForWeaponGroup( f3_arg2, f3_arg1, self.weaponCategoryList )
			UpdateDataSource( self, self.weaponList, f3_arg1 )
		end
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_weaponCategoryList )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local weaponList = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	weaponList:setLeftRight( 0.5, 0.5, -705, 705 )
	weaponList:setTopBottom( 0, 0, 56, 182 )
	weaponList:setZoom( 85 )
	weaponList:setWidgetType( CoD.WeaponSelectGridItem )
	weaponList:setHorizontalCount( 5 )
	weaponList:setSpacing( 10 )
	weaponList:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	weaponList:setHorizontalScrollbar( CoD.PC_GridHorizontalScrollbar )
	weaponList:setHorizontalCounter( CoD.horizontalCounterVerticalSpace )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "globalItemIndex", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	weaponList:linkToElementModel( weaponList, "refHash", true, function ( model, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	weaponList:appendEventHandler( "input_source_changed", function ( f7_arg0, f7_arg1 )
		f7_arg1.menu = f7_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f7_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f7_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	local PCArrowR = weaponList
	local PCArrowL = weaponList.subscribeToModel
	local WeaponVariantListWidget = Engine.GetModelForController( f1_arg1 )
	PCArrowL( PCArrowR, WeaponVariantListWidget.LastInput, function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	PCArrowR = weaponList
	PCArrowL = weaponList.subscribeToModel
	WeaponVariantListWidget = Engine.GetGlobalModel()
	PCArrowL( PCArrowR, WeaponVariantListWidget["lobbyRoot.lobbyNav"], function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		CoD.BreadcrumbUtility.SetWeaponAsOld( f1_arg0, self, element, f1_arg1 )
		CoD.CACUtility.UpdateWeaponNameInfoModel( f1_arg0, element, f1_arg1 )
		CoD.CACUtility.UpdateWeaponModel( f1_arg0, element, f1_arg1 )
		return f10_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not CoD.CACUtility.IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f12_arg1, f12_arg0, f12_arg2 ) then
			CoD.CACUtility.ShowWeaponVariantList( f12_arg1, f12_arg2, self.WeaponVariantListWidget )
			return true
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f12_arg1, f12_arg0, f12_arg2 ) then
			CoD.CACUtility.EquipWeapon( self, f12_arg0, f12_arg1, f12_arg2, true )
			UpdateSelfElementState( f12_arg1, self, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not CoD.CACUtility.IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f13_arg1, f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f13_arg1, f13_arg0, f13_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f13_arg1, f13_arg0, f13_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f13_arg1, f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f14_arg0, f14_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelMax( f14_arg1, f14_arg0, f14_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f14_arg1, f14_arg0, f14_arg2 ) and IsGamepad( f14_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f14_arg1, f14_arg0, f14_arg2 ) and not IsCustomLobby() then
			PrestigeWeapon( f14_arg1, f14_arg0, f14_arg2 )
			PlaySoundAlias( "uin_press_generic" )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f15_arg0, f15_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelMax( f15_arg1, f15_arg0, f15_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f15_arg1, f15_arg0, f15_arg2 ) and IsGamepad( f15_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f15_arg1, f15_arg0, f15_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f15_arg1, f15_arg0, f15_arg2 ) and not IsCustomLobby() then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0xF45564D1E059F32, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f16_arg0, f16_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelMax( f16_arg1, f16_arg0, f16_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f16_arg1, f16_arg0, f16_arg2 ) and IsMouseOrKeyboard( f16_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f16_arg1, f16_arg0, f16_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f16_arg1, f16_arg0, f16_arg2 ) and not IsCustomLobby() then
			PrestigeWeapon( f16_arg1, f16_arg0, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f17_arg0, f17_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelMax( f17_arg1, f17_arg0, f17_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f17_arg1, f17_arg0, f17_arg2 ) and IsMouseOrKeyboard( f17_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f17_arg1, f17_arg0, f17_arg2 ) and not IsCustomLobby() then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xDC436DD31790E72, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		CoD.GridAndListUtility.ScrollLeft( self.weaponList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		CoD.GridAndListUtility.ScrollRight( self.weaponList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
		return false
	end, false )
	self.__on_menuOpened_weaponList = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		local f22_local0 = weaponList
		if not CoD.CACUtility.IsCurrentGameTypeBarebones() then
			CoD.CACUtility.SetActiveListItemToEquippedItem( f22_arg2, f22_arg1, f22_local0 )
			CoD.CACUtility.UpdateWeaponModel( f22_arg2, f22_local0, f22_arg1 )
		end
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_weaponList )
	LUI.OverrideFunction_CallOriginalFirst( weaponList, "updateDataSource", function ( element, controller, f23_arg2, f23_arg3 )
		
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponList, "setDataSource", function ( element, controller )
		
	end )
	weaponList:subscribeToGlobalModel( f1_arg1, "PerController", "Unlockables.listUpdate", function ( model )
		CoD.GridAndListUtility.UpdateDataSource( weaponList, true, false, true )
		UpdateSelfState( self, f1_arg1 )
	end )
	weaponList:AddContextualMenuAction( f1_arg0, f1_arg1, 0xDC436DD31790E72, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f26_arg0, f26_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelMax( f26_arg1, f26_arg0, f26_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f26_arg1, f26_arg0, f26_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f26_arg1, f26_arg0, f26_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f26_arg1, f26_arg0, f26_arg2 ) and not IsCustomLobby() then
			return function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
				PrestigeWeapon( f27_arg1, f27_arg0, f27_arg2 )
			end
			
		else
			
		end
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	PCArrowL = nil
	
	PCArrowL = CoD.WarzoneContextualExtraItemsArrow.new( f1_arg0, f1_arg1, 0.5, 0.5, -770, -740, 0, 0, 114.5, 149.5 )
	PCArrowL:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.WZUtility.IsQuickEquipListFirstItemVisible( self.weaponList )
			end
		}
	} )
	PCArrowL:setZRot( 90 )
	PCArrowL.Arrow:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowL.Arrow2:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowL:appendEventHandler( "input_source_changed", function ( f29_arg0, f29_arg1 )
		f29_arg1.menu = f29_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f29_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	WeaponVariantListWidget = PCArrowL
	PCArrowR = PCArrowL.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	PCArrowR( WeaponVariantListWidget, f1_local6.LastInput, function ( f30_arg0, f30_arg1 )
		CoD.Menu.UpdateButtonShownState( f30_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PCArrowL:registerEventHandler( "gain_focus", function ( element, event )
		local f31_local0 = nil
		if element.gainFocus then
			f31_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f31_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f31_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCArrowL, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		if IsMouseOrKeyboard( f32_arg2 ) then
			CoD.GridAndListUtility.ScrollLeft( self.weaponList )
			CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
			return true
		else
			
		end
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		if IsMouseOrKeyboard( f33_arg2 ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( PCArrowL )
	self.PCArrowL = PCArrowL
	
	PCArrowR = nil
	
	PCArrowR = CoD.WarzoneContextualExtraItemsArrow.new( f1_arg0, f1_arg1, 0.5, 0.5, 740, 770, 0, 0, 114.5, 149.5 )
	PCArrowR:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.WZUtility.IsQuickEquipListLastItemVisible( self.weaponList )
			end
		}
	} )
	PCArrowR:setZRot( 270 )
	PCArrowR.Arrow:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowR.Arrow2:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowR:appendEventHandler( "input_source_changed", function ( f35_arg0, f35_arg1 )
		f35_arg1.menu = f35_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f35_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local6 = PCArrowR
	WeaponVariantListWidget = PCArrowR.subscribeToModel
	local f1_local7 = Engine.GetModelForController( f1_arg1 )
	WeaponVariantListWidget( f1_local6, f1_local7.LastInput, function ( f36_arg0, f36_arg1 )
		CoD.Menu.UpdateButtonShownState( f36_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PCArrowR:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f37_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCArrowR, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		if IsMouseOrKeyboard( f38_arg2 ) then
			CoD.GridAndListUtility.ScrollRight( self.weaponList )
			CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
			return true
		else
			
		end
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		if IsMouseOrKeyboard( f39_arg2 ) then
			CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( PCArrowR )
	self.PCArrowR = PCArrowR
	
	WeaponVariantListWidget = CoD.WeaponVariantListWidget.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 0, 0, 0, 490 )
	WeaponVariantListWidget.SignatureWeaponList:setSpacing( 20 )
	WeaponVariantListWidget:registerEventHandler( "gain_focus", function ( element, event )
		local f40_local0 = nil
		if element.gainFocus then
			f40_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f40_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		return f40_local0
	end )
	f1_arg0:AddButtonCallbackFunction( WeaponVariantListWidget, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		CoD.CACUtility.HideWeaponVariantList( f41_arg1, f41_arg2 )
		return true
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	self:addElement( WeaponVariantListWidget )
	self.WeaponVariantListWidget = WeaponVariantListWidget
	
	WeaponVariantListWidget:linkToElementModel( weaponList, nil, false, function ( model )
		WeaponVariantListWidget:setModel( model, f1_arg1 )
	end )
	self:mergeStateConditions( {
		{
			stateName = "NoCategories",
			condition = function ( menu, element, event )
				return not ListElementHasElements( self.weaponCategoryList )
			end
		}
	} )
	self:appendEventHandler( "grid_updated", function ( f45_arg0, f45_arg1 )
		f45_arg1.menu = f45_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f45_arg1 )
	end )
	weaponCategoryList.id = "weaponCategoryList"
	weaponList.id = "weaponList"
	if CoD.isPC then
		PCArrowL.id = "PCArrowL"
	end
	if CoD.isPC then
		PCArrowR.id = "PCArrowR"
	end
	WeaponVariantListWidget.id = "WeaponVariantListWidget"
	self.__defaultFocus = weaponList
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_weaponCategoryList )
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_weaponList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local6 = self
	if IsPC() then
		CoD.PCUtility.SetForceMouseEventDispatch( self, true )
	end
	DisableKeyboardNavigationByElement( weaponCategoryList )
	f1_local6 = weaponList
	if IsPC() then
		CoD.GridAndListUtility.RemoveHorizontalCounter( f1_arg0, f1_local6 )
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local6, f1_arg1, "displayName", "", "" )
		SetElementProperty( f1_local6, "ignoreSavedActive", true )
		CoD.CACUtility.UseEquippedItemAsDefaultFocus( f1_arg0, f1_arg1, f1_local6 )
		CoD.GridAndListUtility.HideScrollbarsForGamepad( f1_arg0, f1_arg1, f1_local6 )
	elseif not IsPC() then
		CoD.GridAndListUtility.RemoveHorizontalScrollbar( f1_arg0, f1_local6 )
	end
	f1_local6 = PCArrowL
	if IsPC() then
		CoD.GridAndListUtility.UpdateStateOnGridLayoutUpdate( f1_arg1, f1_local6, self.weaponList )
		SetElementCanBeNavigatedTo( f1_local6, false )
	end
	f1_local6 = PCArrowR
	if IsPC() then
		CoD.GridAndListUtility.UpdateStateOnGridLayoutUpdate( f1_arg1, f1_local6, self.weaponList )
		SetElementCanBeNavigatedTo( f1_local6, false )
	end
	f1_local6 = WeaponVariantListWidget
	HideWidget( self.WeaponVariantListWidget )
	return self
end

CoD.WeaponListWidget.__onClose = function ( f47_arg0 )
	f47_arg0.__on_close_removeOverrides()
	f47_arg0.WeaponVariantListWidget:close()
	f47_arg0.weaponCategoryList:close()
	f47_arg0.weaponList:close()
	f47_arg0.PCArrowL:close()
	f47_arg0.PCArrowR:close()
end

