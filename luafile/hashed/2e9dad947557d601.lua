require( "ui/uieditor/menus/itemshop/itemshopconfirmation" )
require( "ui/uieditor/menus/itemshop/purchasecodpoints" )
require( "ui/uieditor/menus/lobby/common/popups/vodviewer" )
require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubpreviewmoment" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "x64:670e7986a13c379" )
require( "x64:6d04ce9f4899b7" )
require( "x64:294871407213026" )
require( "x64:e669990f96d54e9" )
require( "x64:70301570eda8b06" )
require( "ui/uieditor/widgets/itemshop/contracts/contractsupplychaindetails" )
require( "ui/uieditor/widgets/itemshop/itemdetails" )
require( "ui/uieditor/widgets/itemshop/itemshopbutton" )
require( "ui/uieditor/widgets/itemshop/shoptimer" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.BlackMarketBountyDetails = InheritFrom( CoD.Menu )
LUI.createMenu.BlackMarketBountyDetails = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "BlackMarketBountyDetails", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, self, f1_arg1._model )
	CoD.BlackMarketUtility.EnableItemshopTick( f1_arg0, self )
	CoD.BlackMarketUtility.SetPropertiesFromItemModel( f1_arg0, self )
	CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
	SetFocusedTierModelValue( f1_arg0, "1", "set" )
	CoD.BaseUtility.SetControllerModelToSelfModelValue( f1_arg0, f1_local1, "MaxTier", "totalRewardCount" )
	self:setClass( CoD.BlackMarketBountyDetails )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BMBountyRequirementContainer = CoD.BM_BountyRequirementContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 1, 1, -330, 0 )
	self:addElement( BMBountyRequirementContainer )
	self.BMBountyRequirementContainer = BMBountyRequirementContainer
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( "menu/black_market" ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	local ItemDetails = CoD.ItemDetails.new( f1_local1, f1_arg0, 0.5, 0.5, -1867, -1091, 0, 0, 159, 589 )
	ItemDetails:linkToElementModel( self, nil, false, function ( model )
		ItemDetails:setModel( model, f1_arg0 )
	end )
	ItemDetails:appendEventHandler( "input_source_changed", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local SupplyChainDetails = ItemDetails
	local XCamMouseControl = ItemDetails.subscribeToModel
	local BMBountyItemPreview = Engine.GetModelForController( f1_arg0 )
	XCamMouseControl( SupplyChainDetails, BMBountyItemPreview.LastInput, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	ItemDetails:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, element )
			SetElementState( self, self.SupplyChainDetails, f1_arg0, "DefaultState" )
		end
		return f6_local0
	end )
	ItemDetails:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( ItemDetails, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "MOUSE1", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsMouseOrKeyboard( f8_arg2 ) then
			CoD.PlayerRoleUtility.StopGesturePreview( f8_arg1, f8_arg2 )
			SetElementModelToFocusedElementModel( f8_arg2, self, f8_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f8_arg1, f8_arg2, f8_arg0 )
			SetControllerModelValue( f8_arg2, "contractDetailsShowItemInfo", true )
			SetElementState( self, self.SupplyChainDetails, f8_arg2, "DefaultState" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsMouseOrKeyboard( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ItemDetails )
	self.ItemDetails = ItemDetails
	
	XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0.6, 0.6, 118, 750, 0, 0, 64, 684 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	SupplyChainDetails = CoD.ContractSupplyChainDetails.new( f1_local1, f1_arg0, 0.5, 0.5, 1159, 1759, 0, 0, -15, 1065 )
	SupplyChainDetails:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NoInfoPanel",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsMouseOrKeyboard( f1_arg0 ) and not IsWidgetInFocus( self, "RewardList", event ) and not IsWidgetInFocus( self, "RewardGridPC", event ) then
					f11_local0 = not IsWidgetInFocus( self, "BountyBundleList", event )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	SupplyChainDetails:appendEventHandler( "input_source_changed", function ( f12_arg0, f12_arg1 )
		f12_arg1.menu = f12_arg1.menu or f1_local1
		f1_local1:updateElementState( SupplyChainDetails, f12_arg1 )
	end )
	local f1_local8 = SupplyChainDetails
	BMBountyItemPreview = SupplyChainDetails.subscribeToModel
	local BountyBundleList = Engine.GetModelForController( f1_arg0 )
	BMBountyItemPreview( f1_local8, BountyBundleList.LastInput, function ( f13_arg0 )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f13_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	SupplyChainDetails:appendEventHandler( "record_curr_focused_elem_id", function ( f14_arg0, f14_arg1 )
		f14_arg1.menu = f14_arg1.menu or f1_local1
		f1_local1:updateElementState( SupplyChainDetails, f14_arg1 )
	end )
	SupplyChainDetails:linkToElementModel( SupplyChainDetails, "character", true, function ( model )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "character"
		} )
	end )
	SupplyChainDetails:linkToElementModel( SupplyChainDetails, "weaponRef", true, function ( model )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "weaponRef"
		} )
	end )
	SupplyChainDetails:linkToElementModel( self, nil, false, function ( model )
		SupplyChainDetails:setModel( model, f1_arg0 )
	end )
	self:addElement( SupplyChainDetails )
	self.SupplyChainDetails = SupplyChainDetails
	
	BMBountyItemPreview = CoD.BM_BountyItemPreview.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	BMBountyItemPreview:linkToElementModel( self, nil, false, function ( model )
		BMBountyItemPreview:setModel( model, f1_arg0 )
	end )
	self:addElement( BMBountyItemPreview )
	self.BMBountyItemPreview = BMBountyItemPreview
	
	f1_local8 = nil
	f1_local8 = LUI.UIElement.createFake()
	self.RewardList = f1_local8
	
	BountyBundleList = LUI.UIList.new( f1_local1, f1_arg0, 11, 0, nil, false, false, false, false )
	BountyBundleList:setLeftRight( 0.5, 0.5, 294, 838 )
	BountyBundleList:setTopBottom( 0.5, 0.5, 85, 197 )
	BountyBundleList:setWidgetType( CoD.BM_BountyBundleItem )
	BountyBundleList:setHorizontalCount( 5 )
	BountyBundleList:setSpacing( 11 )
	BountyBundleList:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	BountyBundleList:setDataSource( "BundleItemsList" )
	BountyBundleList:linkToElementModel( BountyBundleList, "allowFrozenMoment", true, function ( model, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	BountyBundleList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f20_local0 = nil
		SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
		SetElementModelToFocusedElementModel( f1_arg0, self, element, "BMBountyDetails" )
		SetElementModelToFocusedElementModel( f1_arg0, self, element, "BMBountyItemPreview" )
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, element )
		return f20_local0
	end )
	BountyBundleList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f21_local0 = nil
		CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
		return f21_local0
	end )
	BountyBundleList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f22_local0 = nil
		CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg0, self.SupplyChainDetails, self )
		CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg0, self.BMBountyDetails, self )
		CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg0, self.BMBountyItemPreview, self )
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, self )
		return f22_local0
	end )
	BountyBundleList:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x571F08AD84807E0] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f23_local0
	end )
	f1_local1:AddButtonCallbackFunction( BountyBundleList, f1_arg0, Enum.LUIButton[0x57783F8DA4AAEF], nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if IsDpadButton( f24_arg3 ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f24_arg0, 1 ) then
			SetFocusedTierModelValue( f24_arg2, "1", "decrement" )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if IsDpadButton( nil ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f25_arg0, 1 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x57783F8DA4AAEF], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( BountyBundleList, f1_arg0, Enum.LUIButton[0x571F08AD84807E0], nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if IsDpadButton( f26_arg3 ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f26_arg0, 5 ) then
			SetFocusedTierModelValue( f26_arg2, "1", "increment" )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if IsDpadButton( nil ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f27_arg0, 5 ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( BountyBundleList, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f28_arg0, f28_arg2, "allowFrozenMoment" ) then
			SetControllerModelValue( f28_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f28_arg2 )
			return true
		else
			
		end
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f29_arg0, f29_arg2, "allowFrozenMoment" ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( BountyBundleList, "childFocusGained", function ( element )
		SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
	end )
	BountyBundleList:subscribeToGlobalModel( f1_arg0, "PerController", "FocusedTier", function ( model )
		local f31_local0 = BountyBundleList
		if CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "RewardList" ) then
			UpdateDataSource( self, f31_local0, f1_arg0 )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, f31_local0 )
		else
			UpdateDataSource( self, f31_local0, f1_arg0 )
		end
	end )
	self:addElement( BountyBundleList )
	self.BountyBundleList = BountyBundleList
	
	local ShopTimer = CoD.ShopTimer.new( f1_local1, f1_arg0, 0, 0, 143.5, 393.5, 0, 0, 135, 195 )
	ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference = function ( f32_arg0 )
		local f32_local0 = f32_arg0:get()
		if f32_local0 ~= nil then
			ShopTimer.ReserveDealTimer.TextBox2:setText( CoD.BlackMarketUtility.GetTimerModelValue( self:getModel(), f32_local0 ) )
		end
	end
	
	ShopTimer:subscribeToGlobalModel( f1_arg0, "ReserveDealsRotation", "currentTime", ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference )
	ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference_FullPath = function ()
		local f33_local0 = DataSources.ReserveDealsRotation.getModel( f1_arg0 )
		f33_local0 = f33_local0.currentTime
		if f33_local0 then
			ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference( f33_local0 )
		end
	end
	
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount1_timer", function ( model )
		local f34_local0 = model:get()
		if f34_local0 ~= nil then
			ShopTimer.DiscountTimerSlot1.TextBox2:setText( f34_local0 )
		end
	end )
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount2_timer", function ( model )
		local f35_local0 = model:get()
		if f35_local0 ~= nil then
			ShopTimer.DiscountTimerSlot2.TextBox2:setText( f35_local0 )
		end
	end )
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount3_timer", function ( model )
		local f36_local0 = model:get()
		if f36_local0 ~= nil then
			ShopTimer.DiscountTimerSlot3.TextBox2:setText( f36_local0 )
		end
	end )
	ShopTimer:linkToElementModel( self, nil, false, function ( model )
		ShopTimer:setModel( model, f1_arg0 )
	end )
	self:addElement( ShopTimer )
	self.ShopTimer = ShopTimer
	
	local BMBountyDetails = CoD.BM_BountyDetails.new( f1_local1, f1_arg0, 0, 0, 120, 920, 0, 0, 525, 625 )
	BMBountyDetails:linkToElementModel( self, nil, false, function ( model )
		BMBountyDetails:setModel( model, f1_arg0 )
	end )
	self:addElement( BMBountyDetails )
	self.BMBountyDetails = BMBountyDetails
	
	local PurchaseButton = CoD.ItemShopButton.new( f1_local1, f1_arg0, 0, 0, 120, 570, 0, 0, 669, 721 )
	PurchaseButton:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( self, f1_arg0, "purchased" )
			end
		}
	} )
	PurchaseButton:linkToElementModel( PurchaseButton, "purchased", true, function ( model )
		f1_local1:updateElementState( PurchaseButton, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "purchased"
		} )
	end )
	PurchaseButton.DirectorSelectButtonMiniInternal.MiddleText:setText( LocalizeToUpperString( 0x4516BC3828DEEAD ) )
	PurchaseButton.DirectorSelectButtonMiniInternal.MiddleTextFocus:setText( LocalizeToUpperString( 0x4516BC3828DEEAD ) )
	PurchaseButton:linkToElementModel( self, nil, false, function ( model )
		PurchaseButton:setModel( model, f1_arg0 )
	end )
	local f1_local13 = PurchaseButton
	local BMActivateBountyButton = PurchaseButton.subscribeToModel
	local f1_local15 = Engine.GetModelForController( f1_arg0 )
	BMActivateBountyButton( f1_local13, f1_local15["LootStreamProgress.codPoints"], function ( f42_arg0, f42_arg1 )
		CoD.Menu.UpdateButtonShownState( f42_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	PurchaseButton:registerEventHandler( "gain_focus", function ( element, event )
		local f43_local0 = nil
		if element.gainFocus then
			f43_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f43_local0 = element.super:gainFocus( event )
		end
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, f1_local1 )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f43_local0
	end )
	f1_local1:AddButtonCallbackFunction( PurchaseButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if CanPurchaseItem( f44_arg2, self ) and IsInDefaultState( self ) then
			OpenPopup( self, "ItemShopConfirmation", f44_arg2, {
				_model = self:getModel()
			} )
			PlaySoundAlias( "uin_press_generic" )
			CoD.PlayerRoleUtility.StopGesturePreview( f44_arg1, f44_arg2 )
			return true
		elseif CanPurchaseItem( f44_arg2, self ) and IsElementInState( self, "SubItems" ) then
			OpenPopup( self, "ItemShopConfirmation", f44_arg2, {
				_model = self:getModel()
			} )
			PlaySoundAlias( "uin_press_generic" )
			return true
		elseif IsInDefaultState( self ) then
			OpenPopup( self, "PurchaseCodPoints", f44_arg2, f44_arg1:getModel() )
			CoD.PlayerRoleUtility.StopGesturePreview( f44_arg1, f44_arg2 )
			return true
		elseif IsElementInState( self, "SubItems" ) then
			OpenPopup( self, "PurchaseCodPoints", f44_arg2, f44_arg1:getModel() )
			return true
		else
			
		end
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		if CanPurchaseItem( f45_arg2, self ) and IsInDefaultState( self ) then
			CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif CanPurchaseItem( f45_arg2, self ) and IsElementInState( self, "SubItems" ) then
			CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif IsInDefaultState( self ) then
			CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif IsElementInState( self, "SubItems" ) then
			CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PurchaseButton )
	self.PurchaseButton = PurchaseButton
	
	BMActivateBountyButton = CoD.BM_ActivateBountyButton.new( f1_local1, f1_arg0, 0, 0, 595, 1045, 0, 0, 669, 721 )
	BMActivateBountyButton.DirectorSelectButtonMiniInternal.MiddleText:setText( LocalizeToUpperString( 0xF31710F4130CFEA ) )
	BMActivateBountyButton.DirectorSelectButtonMiniInternal.MiddleTextFocus:setText( LocalizeToUpperString( 0xF31710F4130CFEA ) )
	BMActivateBountyButton:registerEventHandler( "gain_focus", function ( element, event )
		local f46_local0 = nil
		if element.gainFocus then
			f46_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f46_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f46_local0
	end )
	f1_local1:AddButtonCallbackFunction( BMActivateBountyButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if IsInDefaultState( f47_arg0 ) then
			OpenPopup( self, "ItemShopConfirmation", f47_arg2, {
				_model = self:getModel()
			} )
			return true
		else
			
		end
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		if IsInDefaultState( f48_arg0 ) then
			CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( BMActivateBountyButton )
	self.BMActivateBountyButton = BMActivateBountyButton
	
	f1_local15 = ShopTimer
	f1_local13 = ShopTimer.subscribeToModel
	local f1_local16 = DataSources.ReserveDealsRotation.getModel( f1_arg0 )
	f1_local13( f1_local15, f1_local16.cycled, ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference_FullPath )
	self:linkToElementModel( self, "movieName", true, function ( model, f49_arg1 )
		CoD.Menu.UpdateButtonShownState( f49_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f49_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	self:linkToElementModel( self, "allowFrozenMoment", true, function ( model, f50_arg1 )
		CoD.Menu.UpdateButtonShownState( f50_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		GoBack( self, f51_arg2 )
		return true
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_contextual_3", function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		OpenPopup( self, "PurchaseCodPoints", f53_arg2 )
		return true
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x63D5409DEC36DFA, nil, "ui_contextual_3" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x29E5695FF1401AD], "ui_contextual_2", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		if CoD.BlackMarketUtility.CanPlayGesture( f55_arg1 ) then
			CoD.BlackMarketUtility.PlayGesture( self, f55_arg1, f55_arg2 )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		elseif CoD.BlackMarketUtility.CanPlayGesture( f55_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.PlayGesture( self, f55_arg1, f55_arg2 )
			return true
		else
			
		end
	end, function ( f56_arg0, f56_arg1, f56_arg2 )
		if CoD.BlackMarketUtility.CanPlayGesture( f56_arg1 ) then
			CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, "ui_contextual_2" )
			return false
		elseif CoD.BlackMarketUtility.CanPlayGesture( f56_arg1 ) then
			CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x52FB29ED3A3CA79, nil, "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], nil, function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f57_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f57_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f57_arg2, "5", "increment" )
			return true
		else
			
		end
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f58_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "ui_remove", function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f59_arg0, f59_arg2, "movieName" ) and IsPC() then
			SetControllerModelValue( f59_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( f59_arg1, f59_arg2, "" )
			DelayOpenOverlay( f59_arg1, "VoDViewer", f59_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f60_arg0, f60_arg1, f60_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f60_arg0, f60_arg2, "movieName" ) and IsPC() then
			CoD.Menu.SetButtonLabel( f60_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], nil, function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f61_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f61_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f61_arg2, "5", "decrement" )
			return true
		else
			
		end
	end, function ( f62_arg0, f62_arg1, f62_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f62_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.Menu.SetButtonLabel( f62_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ui_contextual_1", function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f63_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.ToggleSignatureWeapon( f63_arg1, f63_arg2, f63_arg1 )
			return true
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f63_arg0, f63_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f63_arg0, f63_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.BlackMarketUtility.ToggleCharacterModelCamera( f63_arg1, f63_arg0, f63_arg2 )
			return true
		else
			
		end
	end, function ( f64_arg0, f64_arg1, f64_arg2 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f64_arg1 ) then
			CoD.Menu.SetButtonLabel( f64_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f64_arg0, f64_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f64_arg0, f64_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.Menu.SetButtonLabel( f64_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_remove", function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f65_arg1, f65_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f65_arg1 ) then
			SetControllerModelValue( f65_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f65_arg2 )
			return true
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f65_arg1, f65_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f65_arg1, f65_arg2, "movieName", "" ) then
			SetControllerModelValue( f65_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( f65_arg1, f65_arg2, "" )
			DelayOpenOverlay( f65_arg1, "VoDViewer", f65_arg2, {
				fullscreen = true
			} )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f65_arg0, f65_arg2, "allowFrozenMoment", true ) then
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f65_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f65_arg0, f65_arg2, "movieName" ) then
			SetControllerModelValue( f65_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f65_arg2, f65_arg0, "" )
			DelayOpenOverlay( f65_arg1, "VoDViewer", f65_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f66_arg0, f66_arg1, f66_arg2 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f66_arg1, f66_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f66_arg1 ) then
			CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f66_arg1, f66_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f66_arg1, f66_arg2, "movieName", "" ) then
			CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f66_arg0, f66_arg2, "allowFrozenMoment", true ) then
			CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f66_arg0, f66_arg2, "movieName" ) then
			CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( f1_arg0, "MaxTier", CoD.BlackMarketUtility.SupplyChainMaxTiers )
		CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
		CoD.BlackMarketUtility.ItemShopDetailsClientScriptMenuCloseNotify( f1_arg0, f1_local1 )
		SetFocusedTierModelValue( f1_arg0, "0", "" )
		ClearMenuSavedState( f1_local1 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) and CoD.BlackMarketUtility.WasItemCycled( f1_arg0, self ) then
			GoBack( self, f1_arg0 )
		end
	end )
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	ItemDetails.id = "ItemDetails"
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	if CoD.isPC then
		SupplyChainDetails.id = "SupplyChainDetails"
	end
	f1_local8.id = "RewardList"
	BountyBundleList.id = "BountyBundleList"
	PurchaseButton.id = "PurchaseButton"
	BMActivateBountyButton.id = "BMActivateBountyButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = PurchaseButton
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local13 = self
	CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, f1_local13 )
	CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_local1, f1_local13, f1_arg0 )
	CoD.BlackMarketUtility.SetupPageStreamHoldActionReadyCheck( f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], Enum.LUIButton[0x820DDD869ABBFAA] )
	return self
end

CoD.BlackMarketBountyDetails.__onClose = function ( f69_arg0 )
	f69_arg0.BMBountyRequirementContainer:close()
	f69_arg0.GenericMenuFrameIdentity:close()
	f69_arg0.ItemDetails:close()
	f69_arg0.XCamMouseControl:close()
	f69_arg0.SupplyChainDetails:close()
	f69_arg0.BMBountyItemPreview:close()
	f69_arg0.RewardList:close()
	f69_arg0.BountyBundleList:close()
	f69_arg0.ShopTimer:close()
	f69_arg0.BMBountyDetails:close()
	f69_arg0.PurchaseButton:close()
	f69_arg0.BMActivateBountyButton:close()
end

