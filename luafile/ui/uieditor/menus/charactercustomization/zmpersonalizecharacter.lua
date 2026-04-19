require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/blackmarket/bm_iteminfopanel" )
require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlinedsafeareacontainer" )
require( "ui/uieditor/widgets/specialist/specialistoutfitcategory" )
require( "ui/uieditor/widgets/specialist/specialistoutfititementry" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.ZMPersonalizeCharacter = InheritFrom( CoD.Menu )
LUI.createMenu.ZMPersonalizeCharacter = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMPersonalizeCharacter", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, f1_local1, f1_arg1.model )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1.properties )
	SendClientScriptMenuExpressionStateChangeNotify( f1_arg0, f1_local1, true, f1_arg1.model.characterIndex:get() )
	self:setClass( CoD.ZMPersonalizeCharacter )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0.5, 0.5, 168, 918, 0.5, 0.5, -440, 160 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x46EFDF3FB2763B5 ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local InfoPanel = CoD.BM_ItemInfoPanel.new( f1_local1, f1_arg0, 0.5, 0.5, 273, 813, 1, 1, -262.5, -112.5 )
	self:addElement( InfoPanel )
	self.InfoPanel = InfoPanel
	
	local outfits = LUI.UIList.new( f1_local1, f1_arg0, 4, 0, nil, false, false, false, false )
	outfits:setLeftRight( 0.5, 0.5, -507, -219 )
	outfits:setTopBottom( 0, 0, 192.5, 918.5 )
	outfits:setWidgetType( CoD.SpecialistOutfitItemEntry )
	outfits:setHorizontalCount( 4 )
	outfits:setVerticalCount( 10 )
	outfits:setSpacing( 4 )
	outfits:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	outfits:linkToElementModel( outfits, "owned", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	outfits:linkToElementModel( outfits, "itemType", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	local CommonIdentityWidgetStreamlinedSafeAreaContainer = outfits
	local themes = outfits.subscribeToModel
	local f1_local8 = DataSources.MPSpecialistThemes.getModel( f1_arg0 )
	themes( CommonIdentityWidgetStreamlinedSafeAreaContainer, f1_local8.update, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	outfits:linkToElementModel( outfits, "itemIndex", true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	outfits:appendEventHandler( "input_source_changed", function ( f7_arg0, f7_arg1 )
		f7_arg1.menu = f7_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f7_arg0, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	CommonIdentityWidgetStreamlinedSafeAreaContainer = outfits
	themes = outfits.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg0 )
	themes( CommonIdentityWidgetStreamlinedSafeAreaContainer, f1_local8.LastInput, function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	outfits:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		if CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg0, "available" ) then
			CoD.PlayerRoleUtility.UpdatePersonalizeSpecialistWarPaintOutfit( f1_arg0, element )
			CoD.PlayerRoleUtility.UpdatePersonalizeSpecialistOutfitItem( f1_arg0, element )
			SetElementModelToFocusedElementModel( f1_arg0, self, element, "InfoPanel" )
		end
		return f9_local0
	end )
	outfits:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f10_local0 = nil
		if CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg0, "available" ) then
			CoD.PlayerRoleUtility.ResetPersonalizeSpecialistOutfitItemType( f1_arg0, element )
			CoD.BreadcrumbUtility.SetSpecialistOutfitItemAsOld( f1_local1, element, f1_arg0 )
		else
			CoD.PlayerRoleUtility.ResetPersonalizeSpecialistOutfitItemType( f1_arg0, element )
			CoD.BreadcrumbUtility.SetSpecialistOutfitItemAsOld( f1_local1, element, f1_arg0 )
		end
		return f10_local0
	end )
	outfits:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		return f11_local0
	end )
	f1_local1:AddButtonCallbackFunction( outfits, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f12_arg0, f12_arg2, "owned" ) then
			PlaySoundAlias( "uin_equipment_add" )
			CoD.PlayerRoleUtility.EquipOutfitItem( f12_arg1, f12_arg2, f12_arg0 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f13_arg0, f13_arg2, "owned" ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xBDF67DCF97EBC09, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( outfits, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "ui_remove", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "itemType", Enum.CharacterItemType[0x922FE5C41D9EE8B] ) and CoD.PlayerRoleUtility.IsSelectedOutfitItemIndex( f14_arg0, f14_arg2 ) and IsGamepad( f14_arg2 ) then
			PlaySoundAlias( "uin_equipment_remove" )
			CoD.PlayerRoleUtility.UnequipOutfitItem( f14_arg1, f14_arg2, f14_arg0 )
			CoD.PlayerRoleUtility.ResetPersonalizeSpecialistOutfitItemType( f14_arg2, f14_arg0 )
			return true
		elseif IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "itemType", Enum.CharacterItemType[0x922FE5C41D9EE8B] ) and CoD.PlayerRoleUtility.IsSelectedOutfitItemIndex( f14_arg0, f14_arg2 ) then
			PlaySoundAlias( "uin_equipment_remove" )
			CoD.PlayerRoleUtility.UnequipOutfitItem( f14_arg1, f14_arg2, f14_arg0 )
			CoD.PlayerRoleUtility.ResetPersonalizeSpecialistOutfitItemType( f14_arg2, f14_arg0 )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "itemType", Enum.CharacterItemType[0x922FE5C41D9EE8B] ) and CoD.PlayerRoleUtility.IsSelectedOutfitItemIndex( f15_arg0, f15_arg2 ) and IsGamepad( f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "itemType", Enum.CharacterItemType[0x922FE5C41D9EE8B] ) and CoD.PlayerRoleUtility.IsSelectedOutfitItemIndex( f15_arg0, f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	outfits:AddContextualMenuAction( f1_local1, f1_arg0, 0x679ACA6FFC6C8F3, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f16_arg0, f16_arg2, "itemType", Enum.CharacterItemType[0x922FE5C41D9EE8B] ) and CoD.PlayerRoleUtility.IsSelectedOutfitItemIndex( f16_arg0, f16_arg2 ) then
			return function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
				PlaySoundAlias( "uin_equipment_remove" )
				CoD.PlayerRoleUtility.UnequipOutfitItem( f17_arg1, f17_arg2, f17_arg0 )
				CoD.PlayerRoleUtility.ResetPersonalizeSpecialistOutfitItemType( f17_arg2, f17_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( outfits )
	self.outfits = outfits
	
	themes = LUI.UIList.new( f1_local1, f1_arg0, 4, 0, nil, false, false, false, false )
	themes:setLeftRight( 0.5, 0.5, -813, -533 )
	themes:setTopBottom( 0, 0, 193, 773 )
	themes:setWidgetType( CoD.SpecialistOutfitCategory )
	themes:setVerticalCount( 8 )
	themes:setSpacing( 4 )
	themes:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	themes:setDataSource( "ZMOutfitCategories" )
	themes:appendEventHandler( "input_source_changed", function ( f18_arg0, f18_arg1 )
		f18_arg1.menu = f18_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f18_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local8 = themes
	CommonIdentityWidgetStreamlinedSafeAreaContainer = themes.subscribeToModel
	local f1_local9 = Engine.GetModelForController( f1_arg0 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer( f1_local8, f1_local9.LastInput, function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	themes:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f20_local0 = nil
		if IsGamepad( f1_arg0 ) then
			CoD.PlayerRoleUtility.UpdatePersonalizeSpecialistOutfit( f1_arg0, element )
		end
		return f20_local0
	end )
	themes:registerEventHandler( "input_source_changed", function ( element, event )
		local f21_local0 = nil
		CoD.GridAndListUtility.SetListActiveOnFocusPCBehavior( element, f1_arg0 )
		if not f21_local0 then
			f21_local0 = element:dispatchEventToChildren( event )
		end
		return f21_local0
	end )
	themes:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f22_local0
	end )
	f1_local1:AddButtonCallbackFunction( themes, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsMouseOrKeyboard( f23_arg2 ) then
			SetCurrentElementAsActive( self, f23_arg0, f23_arg2 )
			CoD.PlayerRoleUtility.EquipOutfit( f23_arg1, f23_arg2, f23_arg0 )
			CoD.PlayerRoleUtility.UpdatePersonalizeSpecialistOutfit( f23_arg2, f23_arg0 )
			return true
		else
			CoD.PlayerRoleUtility.EquipOutfit( f23_arg1, f23_arg2, f23_arg0 )
			return true
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
		return true
	end, false )
	self:addElement( themes )
	self.themes = themes
	
	CommonIdentityWidgetStreamlinedSafeAreaContainer = CoD.CommonIdentityWidgetStreamlinedSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f25_local0 = nil
		if element.menuLoaded then
			f25_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f25_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f25_local0 then
			f25_local0 = element:dispatchEventToChildren( event )
		end
		return f25_local0
	end )
	self:addElement( CommonIdentityWidgetStreamlinedSafeAreaContainer )
	self.CommonIdentityWidgetStreamlinedSafeAreaContainer = CommonIdentityWidgetStreamlinedSafeAreaContainer
	
	outfits:linkToElementModel( themes, "datasourceName", true, function ( model )
		local f26_local0 = model:get()
		if f26_local0 ~= nil then
			outfits:setDataSource( f26_local0 )
		end
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		GoBack( self, f27_arg2 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		ClearMenuSavedState( f1_local1 )
		UploadStats( self, f1_arg0 )
		SaveLoadoutGeneric( f1_arg0 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	outfits.id = "outfits"
	themes.id = "themes"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = themes
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local8 = self
	f1_local8 = outfits
	if IsPC() then
		CoD.BaseUtility.SetCustomNavDirection( CoD.BaseUtility.NavigationDirection.left, f1_local8, self.themes )
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local8, f1_arg0, "name", "", "" )
	else
		CoD.BaseUtility.SetCustomNavDirection( CoD.BaseUtility.NavigationDirection.left, f1_local8, self.themes )
	end
	f1_local8 = themes
	CoD.BaseUtility.SetCustomNavDirection( CoD.BaseUtility.NavigationDirection.right, f1_local8, self.outfits )
	CoD.GridAndListUtility.SetListActiveOnFocusPCBehavior( f1_local8, f1_arg0 )
	CoD.GridAndListUtility.ActivateListPCSelectionBehavior( f1_local8 )
	return self
end

CoD.ZMPersonalizeCharacter.__onClose = function ( f30_arg0 )
	f30_arg0.outfits:close()
	f30_arg0.XCamMouseControl:close()
	f30_arg0.GenericMenuFrame:close()
	f30_arg0.InfoPanel:close()
	f30_arg0.themes:close()
	f30_arg0.CommonIdentityWidgetStreamlinedSafeAreaContainer:close()
end

