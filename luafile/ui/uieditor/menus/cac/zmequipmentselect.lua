require( "ui/uieditor/widgets/cac/cac_background_slide_panel" )
require( "ui/uieditor/widgets/cac/itemnamedescunlocktext" )
require( "ui/uieditor/widgets/cac/restricteditemwarningtext" )
require( "ui/uieditor/widgets/common/commonheader" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "ui/uieditor/widgets/header/header_container_frontend" )
require( "ui/uieditor/widgets/zmfrontend/cac/zmitemgridbuttonsmall" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.ZMEquipmentSelect = InheritFrom( CoD.Menu )
LUI.createMenu.ZMEquipmentSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMEquipmentSelect", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.ZMEquipmentSelect )
	self.soundSet = "ZCAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundSlidePanel = CoD.cac_background_slide_panel.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0.5, 0.5, 132, 754 )
	BackgroundSlidePanel:setZoom( 70 )
	self:addElement( BackgroundSlidePanel )
	self.BackgroundSlidePanel = BackgroundSlidePanel
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_local1, f1_arg0, 0.5, 0.5, -247, 247, 0.5, 0.5, 70, 100 )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	local itemList = LUI.UIList.new( f1_local1, f1_arg0, 10, 0, nil, false, false, false, false )
	itemList:setLeftRight( 0.5, 0.5, -469, 469 )
	itemList:setTopBottom( 0.5, 0.5, 195, 307 )
	itemList:setWidgetType( CoD.ZMItemGridButtonSmall )
	itemList:setHorizontalCount( 6 )
	itemList:setSpacing( 10 )
	itemList:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	itemList:setDataSource( "Unlockables" )
	itemList:linkToElementModel( itemList, "globalItemIndex", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	itemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		return f3_local0
	end )
	itemList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f4_local0 = nil
		CoD.CACUtility.SetActiveListItemToEquippedItem( f1_local1, f1_arg0, element )
		CoD.CACUtility.UpdateWeaponModel( f1_local1, element, f1_arg0 )
		return f4_local0
	end )
	itemList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f5_local0
	end )
	f1_local1:AddButtonCallbackFunction( itemList, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if IsPC() and CoD.CACUtility.IsItemEquippedInCurrentLoadout( f6_arg1, f6_arg0, f6_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f6_arg1, f6_arg0, f6_arg2 ) then
			GoBack( self, f6_arg2 )
			return true
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f6_arg1, f6_arg0, f6_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f6_arg1, f6_arg0, f6_arg2 ) then
			CoD.CACUtility.EquipWeapon( self, f6_arg0, f6_arg1, f6_arg2, false )
			UpdateSelfElementState( f6_arg1, self, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if IsPC() and CoD.CACUtility.IsItemEquippedInCurrentLoadout( f7_arg1, f7_arg0, f7_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f7_arg1, f7_arg0, f7_arg2 ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
			return false
		elseif not CoD.CACUtility.IsItemEquippedInCurrentLoadout( f7_arg1, f7_arg0, f7_arg2 ) and not CoD.CACUtility.IsCACItemLocked( f7_arg1, f7_arg0, f7_arg2 ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_itemList = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		local f8_local0 = itemList
		CoD.CACUtility.SetActiveListItemToEquippedItem( f8_arg2, f8_arg1, f8_local0 )
		CoD.CACUtility.UpdateWeaponModel( f8_arg2, f8_local0, f8_arg1 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_itemList )
	self:addElement( itemList )
	self.itemList = itemList
	
	local ItemInfo = CoD.ItemNameDescUnlockText.new( f1_local1, f1_arg0, 0.5, 0.5, -753, -253, 0.5, 0.5, -48, 59 )
	ItemInfo:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ItemInfo )
	self.ItemInfo = ItemInfo
	
	local CACHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 67 )
	CACHeader.subtitle.StageTitle:setText( LocalizeToUpperString( CoD.CACUtility.GetHeaderNameForLoadoutSlot( self, 0x5C60F77B9332E5B ) ) )
	CACHeader.subtitle.subtitle:setAlpha( 0 )
	CACHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			CACHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f10_local0 ) )
		end
	end )
	CACHeader:linkToElementModel( self, nil, false, function ( model )
		CACHeader:setModel( model, f1_arg0 )
	end )
	CACHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		if element.menuLoaded then
			f12_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f12_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( CACHeader )
	self.CACHeader = CACHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if element.menuLoaded then
			f13_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f13_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f14_local0 = nil
		if element.menuLoaded then
			f14_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f14_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f14_local0 then
			f14_local0 = element:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 67, 672 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	RestrictedText:linkToElementModel( itemList, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg0 )
	end )
	ItemInfo:linkToElementModel( itemList, nil, false, function ( model )
		ItemInfo:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.CACUtility.ClearClassWeaponModel( f1_local1, f1_arg0 )
	end )
	itemList.id = "itemList"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = itemList
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_itemList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local10 = self
	if not CoD.BaseUtility.IsMenuSessionModeEqualTo( f1_local1, Enum.eModes[0x3723205FAE52C4A] ) then
		CoD.CACUtility.UpdateWeaponModel( f1_local1, self, f1_arg0 )
		CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
	end
	return self
end

CoD.ZMEquipmentSelect.__onClose = function ( f21_arg0 )
	f21_arg0.__on_close_removeOverrides()
	f21_arg0.RestrictedText:close()
	f21_arg0.ItemInfo:close()
	f21_arg0.BackgroundSlidePanel:close()
	f21_arg0.itemList:close()
	f21_arg0.CACHeader:close()
	f21_arg0.BackingGrayMediumLeft:close()
	f21_arg0.FooterContainerFrontendRight:close()
	f21_arg0.XCamMouseControl:close()
end

