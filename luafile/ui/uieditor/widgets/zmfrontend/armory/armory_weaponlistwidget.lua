require( "ui/uieditor/widgets/cac/cactexttab" )
require( "ui/uieditor/widgets/cac/weaponvariants/weaponvariantlistwidget" )
require( "ui/uieditor/widgets/common/common_tabbar_center" )
require( "ui/uieditor/widgets/pc/pc_gridhorizontalscrollbar" )
require( "ui/uieditor/widgets/warzone/warzonecontextualextraitemsarrow" )
require( "ui/uieditor/widgets/zmfrontend/cac/zmitemgridbutton" )
require( "ui/uieditor/widgets/zmfrontend/cac/zmsignatureweaponitemgridbutton" )

CoD.Armory_WeaponListWidget = InheritFrom( LUI.UIElement )
CoD.Armory_WeaponListWidget.__defaultWidth = 1920
CoD.Armory_WeaponListWidget.__defaultHeight = 490
CoD.Armory_WeaponListWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Armory_WeaponListWidget )
	self.id = "Armory_WeaponListWidget"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local weaponCategoryList = CoD.Common_Tabbar_Center.new( f1_arg0, f1_arg1, 0.5, 0.5, -1650, 1650, 0, 0, -19, 42 )
	weaponCategoryList.Tabs.grid:setWidgetType( CoD.CACTextTab )
	weaponCategoryList.Tabs.grid:setDataSource( "ArmoryWeaponGroups" )
	weaponCategoryList:registerEventHandler( "list_active_changed", function ( element, event )
		local f2_local0 = nil
		if CoD.BaseUtility.IsWidgetVisible( element ) then
			SetElementProperty( f1_arg0, "__itemGroup", element.category )
			SetElementProperty( f1_arg0, "__loadoutType", element.loadoutType )
			UpdateDataSource( self, self.weaponList, f1_arg1 )
			CoD.GridAndListUtility.SetFocusToFirstSelectableItem( self.weaponList )
			CoD.CACUtility.UpdateCommonCurrentActiveTabIndexValue( f1_arg1, self.weaponCategoryList )
			CoD.CACUtility.UpdateArmoryArrowState( f1_arg0, f1_arg1, self.PCArrowR )
			CoD.CACUtility.UpdateArmoryArrowState( f1_arg0, f1_arg1, self.PCArrowL )
		end
		return f2_local0
	end )
	self.__on_menuOpened_weaponCategoryList = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		local f3_local0 = weaponCategoryList
		if not IsElementPropertyValue( f3_local0, "_receivedMenuOpen", true ) then
			SetElementProperty( f3_local0, "_receivedMenuOpen", true )
			CoD.CACUtility.SetActiveListItemForWeaponGroup( f3_arg2, f3_arg1, self.weaponCategoryList )
			UpdateDataSource( self, self.weaponList, f3_arg1 )
		end
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_weaponCategoryList )
	self:addElement( weaponCategoryList )
	self.weaponCategoryList = weaponCategoryList
	
	local PCArrowL = nil
	
	PCArrowL = CoD.WarzoneContextualExtraItemsArrow.new( f1_arg0, f1_arg1, 0, 0, 177.5, 207.5, 0, 0, 111.5, 146.5 )
	PCArrowL:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.WZUtility.IsQuickEquipListFirstItemVisible( self.weaponList )
			end
		}
	} )
	PCArrowL:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	PCArrowL:setZRot( 90 )
	PCArrowL:setScale( 1.2, 1.2 )
	PCArrowL.Arrow:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowL.Arrow2:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowL:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local weaponList = PCArrowL
	local PCArrowR = PCArrowL.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	PCArrowR( weaponList, f1_local5.LastInput, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PCArrowL:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCArrowL, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsMouseOrKeyboard( f8_arg2 ) then
			CoD.GridAndListUtility.ScrollLeft( self.weaponList )
			CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsMouseOrKeyboard( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( PCArrowL )
	self.PCArrowL = PCArrowL
	
	PCArrowR = nil
	
	PCArrowR = CoD.WarzoneContextualExtraItemsArrow.new( f1_arg0, f1_arg1, 0, 0, 1714, 1744, 0, 0, 111.5, 146.5 )
	PCArrowR:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.WZUtility.IsQuickEquipListLastItemVisible( self.weaponList )
			end
		}
	} )
	PCArrowR:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	PCArrowR:setZRot( 270 )
	PCArrowR:setScale( 1.2, 1.2 )
	PCArrowR.Arrow:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowR.Arrow2:setImage( RegisterImage( "uie_optionswidgets_arrow" ) )
	PCArrowR:appendEventHandler( "input_source_changed", function ( f11_arg0, f11_arg1 )
		f11_arg1.menu = f11_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f11_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local5 = PCArrowR
	weaponList = PCArrowR.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	weaponList( f1_local5, f1_local6.LastInput, function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PCArrowR:registerEventHandler( "gain_focus", function ( element, event )
		local f13_local0 = nil
		if element.gainFocus then
			f13_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f13_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f13_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCArrowR, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if IsMouseOrKeyboard( f14_arg2 ) then
			CoD.GridAndListUtility.ScrollRight( self.weaponList )
			CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if IsMouseOrKeyboard( f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( PCArrowR )
	self.PCArrowR = PCArrowR
	
	weaponList = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	weaponList:setLeftRight( 0.5, 0.5, -750, 750 )
	weaponList:setTopBottom( 0, 0, 56, 202 )
	weaponList:setWidgetType( CoD.ZMItemGridButton )
	weaponList:setHorizontalCount( 5 )
	weaponList:setSpacing( 10 )
	weaponList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	weaponList:setHorizontalScrollbar( CoD.PC_GridHorizontalScrollbar )
	weaponList:setDataSource( "Unlockables" )
	weaponList:linkToElementModel( weaponList, "globalItemIndex", true, function ( model, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	weaponList:linkToElementModel( weaponList, "refHash", true, function ( model, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	weaponList:linkToElementModel( weaponList, "itemIndex", true, function ( model, f18_arg1 )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	weaponList:appendEventHandler( "input_source_changed", function ( f19_arg0, f19_arg1 )
		f19_arg1.menu = f19_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f19_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	f1_local6 = weaponList
	f1_local5 = weaponList.subscribeToModel
	local WeaponVariantListWidget = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, WeaponVariantListWidget.LastInput, function ( f20_arg0, f20_arg1 )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	weaponList:linkToElementModel( weaponList, nil, false, function ( model, f21_arg1 )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	f1_local6 = weaponList
	f1_local5 = weaponList.subscribeToModel
	WeaponVariantListWidget = Engine.GetGlobalModel()
	f1_local5( f1_local6, WeaponVariantListWidget["lobbyRoot.lobbyNetworkMode"], function ( f22_arg0, f22_arg1 )
		CoD.Menu.UpdateButtonShownState( f22_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f22_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
	end, false )
	f1_local6 = weaponList
	f1_local5 = weaponList.subscribeToModel
	WeaponVariantListWidget = Engine.GetGlobalModel()
	f1_local5( f1_local6, WeaponVariantListWidget["lobbyRoot.lobbyNav"], function ( f23_arg0, f23_arg1 )
		CoD.Menu.UpdateButtonShownState( f23_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f23_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
	end, false )
	weaponList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f24_local0 = nil
		CoD.CACUtility.UpdateWeaponNameInfoModel( f1_arg0, element, f1_arg1 )
		CoD.ZMLoadoutUtility.UpdateArmoryWeaponModel( element, f1_arg1, f1_arg0 )
		SetElementProperty( self.WeaponVariantListWidget, "_weaponListElement", element )
		return f24_local0
	end )
	weaponList:registerEventHandler( "list_active_changed", function ( element, event )
		local f25_local0 = nil
		if not IsPC() then
			UpdateSelfElementState( f1_arg0, self.ArrowR, f1_arg1 )
			UpdateSelfElementState( f1_arg0, self.ArrowL, f1_arg1 )
		end
		return f25_local0
	end )
	weaponList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f26_local0 = nil
		CoD.CACUtility.UpdateWeaponModel( f1_arg0, element, f1_arg1 )
		return f26_local0
	end )
	weaponList:registerEventHandler( "gain_focus", function ( element, event )
		local f27_local0 = nil
		if element.gainFocus then
			f27_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f27_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f27_local0
	end )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if IsElementPropertyValue( f28_arg1, "_loadoutSlot", CoD.ZMLoadoutUtility.StartWeaponLoadoutSlotName ) and not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f28_arg1, f28_arg0, f28_arg2 ) then
			CoD.CACUtility.EquipWeapon( self, f28_arg0, f28_arg1, f28_arg2, false )
			UpdateSelfElementState( f28_arg1, self, f28_arg2 )
			return true
		elseif IsElementPropertyValue( f28_arg1, "_loadoutSlot", CoD.ZMLoadoutUtility.StartWeaponLoadoutSlotName ) and not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f28_arg1, f28_arg0, f28_arg2 ) then
			CoD.CACUtility.ShowWeaponVariantList( f28_arg1, f28_arg2, self.WeaponVariantListWidget )
			return true
		elseif IsElementPropertyValue( f28_arg1, "_loadoutSlot", "armory" ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f28_arg0, f28_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and CoD.CACUtility.DoesWeaponHaveAttachments( f28_arg0, f28_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f28_arg1, f28_arg0, f28_arg2 ) then
			CoD.ZMLoadoutUtility.OpenArmoryAttachmentOverlay( self, f28_arg0, f28_arg2, f28_arg1 )
			return true
		elseif IsElementPropertyValue( f28_arg1, "_loadoutSlot", "armory" ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f28_arg0, f28_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f28_arg1, f28_arg0, f28_arg2 ) and CoD.CACUtility.DoesWeaponHaveAttachments( f28_arg0, f28_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f28_arg1, f28_arg0, f28_arg2 ) then
			CoD.CACUtility.ShowWeaponVariantList( f28_arg1, f28_arg2, self.WeaponVariantListWidget )
			return true
		else
			
		end
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		if IsElementPropertyValue( f29_arg1, "_loadoutSlot", CoD.ZMLoadoutUtility.StartWeaponLoadoutSlotName ) and not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f29_arg1, f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif IsElementPropertyValue( f29_arg1, "_loadoutSlot", CoD.ZMLoadoutUtility.StartWeaponLoadoutSlotName ) and not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f29_arg1, f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif IsElementPropertyValue( f29_arg1, "_loadoutSlot", "armory" ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f29_arg0, f29_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and CoD.CACUtility.DoesWeaponHaveAttachments( f29_arg0, f29_arg2 ) and not CoD.CACUtility.HasSignatureWeapons( f29_arg1, f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif IsElementPropertyValue( f29_arg1, "_loadoutSlot", "armory" ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f29_arg0, f29_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f29_arg1, f29_arg0, f29_arg2 ) and CoD.CACUtility.DoesWeaponHaveAttachments( f29_arg0, f29_arg2 ) and CoD.CACUtility.HasSignatureWeapons( f29_arg1, f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		if IsGamepad( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelNil( f30_arg0, f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f30_arg0, f30_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f30_arg1, f30_arg0, f30_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f30_arg1, f30_arg0, f30_arg2 ) and not CoD.BaseUtility.IsDvarEnabled( "disableZMWeaponPersonalization" ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f30_arg0, f30_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f30_arg1, f30_arg2, f30_arg0, f30_arg0, "primary" )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		else
			
		end
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		if IsGamepad( f31_arg2 ) and not CoD.ModelUtility.IsSelfModelNil( f31_arg0, f31_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f31_arg0, f31_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f31_arg1, f31_arg0, f31_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f31_arg1, f31_arg0, f31_arg2 ) and not CoD.BaseUtility.IsDvarEnabled( "disableZMWeaponPersonalization" ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x94122F68876E5D9, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_contextual_1", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		if IsMouseOrKeyboard( f32_arg2 ) and not CoD.ModelUtility.IsSelfModelNil( f32_arg0, f32_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f32_arg0, f32_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f32_arg1, f32_arg0, f32_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f32_arg1, f32_arg0, f32_arg2 ) and not CoD.BaseUtility.IsDvarEnabled( "disableZMWeaponPersonalization" ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f32_arg0, f32_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f32_arg1, f32_arg2, f32_arg0, f32_arg0, "primary" )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		else
			
		end
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		if IsMouseOrKeyboard( f33_arg2 ) and not CoD.ModelUtility.IsSelfModelNil( f33_arg0, f33_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f33_arg0, f33_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.CACUtility.IsCACItemLocked( f33_arg1, f33_arg0, f33_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f33_arg1, f33_arg0, f33_arg2 ) and not CoD.BaseUtility.IsDvarEnabled( "disableZMWeaponPersonalization" ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x94122F68876E5D9, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_2", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if IsMouseOrKeyboard( f34_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.CACUtility.IsCACItemLocked( f34_arg1, f34_arg0, f34_arg2 ) then
			CoD.ZMLoadoutUtility.SetShowcaseWeapon( f34_arg0, f34_arg2, f34_arg1 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		if IsMouseOrKeyboard( f35_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.CACUtility.IsCACItemLocked( f35_arg1, f35_arg0, f35_arg2 ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xE629850E7968A6E, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if IsGamepad( f36_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.CACUtility.IsCACItemLocked( f36_arg1, f36_arg0, f36_arg2 ) then
			CoD.ZMLoadoutUtility.SetShowcaseWeapon( f36_arg0, f36_arg2, f36_arg1 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		if IsGamepad( f37_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.CACUtility.IsCACItemLocked( f37_arg1, f37_arg0, f37_arg2 ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0xE629850E7968A6E, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x22361E23588705A], nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		if IsGamepad( f38_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f38_arg0, f38_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelExists( f38_arg1, f38_arg0, f38_arg2 ) and CoD.CACUtility.IsCACGunLevelMax( f38_arg1, f38_arg0, f38_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f38_arg1, f38_arg0, f38_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f38_arg1, f38_arg0, f38_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f38_arg1, f38_arg0, f38_arg2 ) then
			PrestigeWeapon( f38_arg1, f38_arg0, f38_arg2 )
			PlaySoundAlias( "uin_press_generic" )
			return true
		else
			
		end
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		if IsGamepad( f39_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f39_arg0, f39_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelExists( f39_arg1, f39_arg0, f39_arg2 ) and CoD.CACUtility.IsCACGunLevelMax( f39_arg1, f39_arg0, f39_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f39_arg1, f39_arg0, f39_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f39_arg1, f39_arg0, f39_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f39_arg1, f39_arg0, f39_arg2 ) then
			CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x22361E23588705A], 0xF45564D1E059F32, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_contextual_3", function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		if IsMouseOrKeyboard( f40_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f40_arg0, f40_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelExists( f40_arg1, f40_arg0, f40_arg2 ) and CoD.CACUtility.IsCACGunLevelMax( f40_arg1, f40_arg0, f40_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f40_arg1, f40_arg0, f40_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f40_arg1, f40_arg0, f40_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f40_arg1, f40_arg0, f40_arg2 ) then
			PrestigeWeapon( f40_arg1, f40_arg0, f40_arg2 )
			PlaySoundAlias( "uin_press_generic" )
			return true
		else
			
		end
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		if IsMouseOrKeyboard( f41_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f41_arg0, f41_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelExists( f41_arg1, f41_arg0, f41_arg2 ) and CoD.CACUtility.IsCACGunLevelMax( f41_arg1, f41_arg0, f41_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f41_arg1, f41_arg0, f41_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f41_arg1, f41_arg0, f41_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f41_arg1, f41_arg0, f41_arg2 ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton[0x4D2505E19049444], 0xDC436DD31790E72, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_3" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		CoD.GridAndListUtility.ScrollLeft( self.weaponList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
		return true
	end, function ( f43_arg0, f43_arg1, f43_arg2 )
		CoD.Menu.SetButtonLabel( f43_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( weaponList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		CoD.GridAndListUtility.ScrollRight( self.weaponList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.weaponList )
		return true
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( weaponList, "updateDataSource", function ( element, controller, f46_arg2, f46_arg3 )
		if IsPC() then
			CoD.CACUtility.UpdateArmoryArrowState( f1_arg0, f1_arg1, self.PCArrowR )
			CoD.CACUtility.UpdateArmoryArrowState( f1_arg0, f1_arg1, self.PCArrowL )
		end
	end )
	weaponList:subscribeToGlobalModel( f1_arg1, "PerController", "Unlockables.listUpdate", function ( model )
		CoD.GridAndListUtility.UpdateDataSource( weaponList, true, false, true )
		UpdateSelfState( self, f1_arg1 )
	end )
	weaponList:subscribeToGlobalModel( f1_arg1, "WeaponPersonalization", "listUpdate", function ( model )
		CoD.GridAndListUtility.UpdateDataSource( weaponList, true, false, true )
		UpdateSelfState( self, f1_arg1 )
	end )
	weaponList:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		if IsMouseOrKeyboard( f49_arg2 ) and not CoD.ModelUtility.IsSelfModelNil( f49_arg0, f49_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f49_arg0, f49_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not CoD.BaseUtility.IsDvarEnabled( "disableZMWeaponPersonalization" ) and not CoD.CACUtility.IsCACItemLocked( f49_arg1, f49_arg0, f49_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f49_arg1, f49_arg0, f49_arg2 ) then
			return function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
				CoD.CraftUtility.SetupPaintjobPersonalization( self, f50_arg0, f50_arg2 )
				CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f50_arg1, f50_arg2, f50_arg0, f50_arg0, "primary" )
				PlaySoundAlias( "uin_toggle_generic" )
			end
			
		else
			
		end
	end )
	weaponList:AddContextualMenuAction( f1_arg0, f1_arg1, 0xE092C2BE5DD4778, function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		if not IsLocal() and not IsCustomLobby() and not CoD.CACUtility.IsCACItemLocked( f51_arg1, f51_arg0, f51_arg2 ) then
			return function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
				CoD.ZMLoadoutUtility.SetShowcaseWeapon( f52_arg0, f52_arg2, f52_arg1 )
				PlaySoundAlias( "cac_overload_select" )
			end
			
		else
			
		end
	end )
	weaponList:AddContextualMenuAction( f1_arg0, f1_arg1, 0xDC436DD31790E72, function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f53_arg0, f53_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.CACUtility.IsCACGunLevelExists( f53_arg1, f53_arg0, f53_arg2 ) and CoD.CACUtility.IsCACGunLevelMax( f53_arg1, f53_arg0, f53_arg2 ) and not CoD.CACUtility.IsCACGunPrestigeLevelMax( f53_arg1, f53_arg0, f53_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f53_arg1, f53_arg0, f53_arg2 ) and not CoD.CACUtility.IsCACBlackMarketItemLocked( f53_arg1, f53_arg0, f53_arg2 ) then
			return function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
				PrestigeWeapon( f54_arg1, f54_arg0, f54_arg2 )
				PlaySoundAlias( "uin_press_generic" )
			end
			
		else
			
		end
	end )
	self:addElement( weaponList )
	self.weaponList = weaponList
	
	f1_local5 = nil
	self.ArrowL = LUI.UIElement.createFake()
	f1_local6 = nil
	self.ArrowR = LUI.UIElement.createFake()
	
	WeaponVariantListWidget = CoD.WeaponVariantListWidget.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 0, 0, 0, 490 )
	WeaponVariantListWidget.SignatureWeaponList:setWidgetType( CoD.ZMSignatureWeaponItemGridButton )
	WeaponVariantListWidget.SignatureWeaponList:setSpacing( 10 )
	WeaponVariantListWidget:registerEventHandler( "gain_focus", function ( element, event )
		local f55_local0 = nil
		if element.gainFocus then
			f55_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f55_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		return f55_local0
	end )
	f1_arg0:AddButtonCallbackFunction( WeaponVariantListWidget, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		CoD.CACUtility.HideWeaponVariantList( f56_arg1, f56_arg2 )
		return true
	end, function ( f57_arg0, f57_arg1, f57_arg2 )
		CoD.Menu.SetButtonLabel( f57_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
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
		},
		{
			stateName = "DefaultStatePC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	self:appendEventHandler( "grid_updated", function ( f61_arg0, f61_arg1 )
		f61_arg1.menu = f61_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f61_arg1 )
	end )
	weaponCategoryList.id = "weaponCategoryList"
	if CoD.isPC then
		PCArrowL.id = "PCArrowL"
	end
	if CoD.isPC then
		PCArrowR.id = "PCArrowR"
	end
	weaponList.id = "weaponList"
	WeaponVariantListWidget.id = "WeaponVariantListWidget"
	self.__defaultFocus = weaponList
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_weaponCategoryList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local8 = self
	if IsPC() then
		CoD.PCUtility.SetForceMouseEventDispatch( self, true )
	end
	f1_local8 = weaponCategoryList
	if IsPC() then
		DisableKeyboardNavigationByElement( f1_local8 )
	end
	f1_local8 = PCArrowL
	if IsPC() then
		CoD.GridAndListUtility.UpdateStateOnGridLayoutUpdate( f1_arg1, f1_local8, self.weaponList )
		SetElementCanBeNavigatedTo( f1_local8, false )
	end
	f1_local8 = PCArrowR
	if IsPC() then
		CoD.GridAndListUtility.UpdateStateOnGridLayoutUpdate( f1_arg1, f1_local8, self.weaponList )
		SetElementCanBeNavigatedTo( f1_local8, false )
	end
	f1_local8 = weaponList
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local8, f1_arg1, "displayName", "", "" )
		CoD.GridAndListUtility.HideScrollbarsForGamepad( f1_arg0, f1_arg1, f1_local8 )
	elseif not IsPC() then
		CoD.GridAndListUtility.RemoveHorizontalScrollbar( f1_arg0, f1_local8 )
	end
	f1_local8 = WeaponVariantListWidget
	HideWidget( self.WeaponVariantListWidget )
	SetElementProperty( f1_local8, "_forZMArmory", true )
	return self
end

CoD.Armory_WeaponListWidget.__resetProperties = function ( f63_arg0 )
	f63_arg0.ArrowR:completeAnimation()
	f63_arg0.ArrowL:completeAnimation()
	f63_arg0.weaponList:completeAnimation()
	f63_arg0.PCArrowR:completeAnimation()
	f63_arg0.PCArrowL:completeAnimation()
	f63_arg0.ArrowR:setTopBottom( 0, 0, 121, 137 )
	f63_arg0.ArrowL:setTopBottom( 0, 0, 121, 137 )
	f63_arg0.weaponList:setTopBottom( 0, 0, 56, 202 )
	f63_arg0.PCArrowR:setTopBottom( 0, 0, 111.5, 146.5 )
	f63_arg0.PCArrowL:setTopBottom( 0, 0, 111.5, 146.5 )
end

CoD.Armory_WeaponListWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f64_arg0, f64_arg1 )
			f64_arg0:__resetProperties()
			f64_arg0:setupElementClipCounter( 0 )
		end
	},
	NoCategories = {
		DefaultClip = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 0 )
		end
	},
	DefaultStatePC = {
		DefaultClip = function ( f66_arg0, f66_arg1 )
			f66_arg0:__resetProperties()
			f66_arg0:setupElementClipCounter( 3 )
			f66_arg0.PCArrowL:completeAnimation()
			f66_arg0.PCArrowL:setTopBottom( 0, 0, 135.5, 170.5 )
			f66_arg0.clipFinished( f66_arg0.PCArrowL )
			f66_arg0.PCArrowR:completeAnimation()
			f66_arg0.PCArrowR:setTopBottom( 0, 0, 135.5, 170.5 )
			f66_arg0.clipFinished( f66_arg0.PCArrowR )
			f66_arg0.weaponList:completeAnimation()
			f66_arg0.weaponList:setTopBottom( 0, 0, 80, 226 )
			f66_arg0.clipFinished( f66_arg0.weaponList )
			f66_arg0.ArrowL:completeAnimation()
			f66_arg0.ArrowL:setTopBottom( 0, 0, 145, 161 )
			f66_arg0.clipFinished( f66_arg0.ArrowL )
			f66_arg0.ArrowR:completeAnimation()
			f66_arg0.ArrowR:setTopBottom( 0, 0, 145, 161 )
			f66_arg0.clipFinished( f66_arg0.ArrowR )
		end
	}
}
CoD.Armory_WeaponListWidget.__onClose = function ( f67_arg0 )
	f67_arg0.__on_close_removeOverrides()
	f67_arg0.WeaponVariantListWidget:close()
	f67_arg0.weaponCategoryList:close()
	f67_arg0.PCArrowL:close()
	f67_arg0.PCArrowR:close()
	f67_arg0.weaponList:close()
	f67_arg0.ArrowL:close()
	f67_arg0.ArrowR:close()
end

