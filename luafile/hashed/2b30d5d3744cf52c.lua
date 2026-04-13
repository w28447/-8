require( "ui/uieditor/menus/itemshop/purchasecodpoints" )
require( "ui/uieditor/menus/lobby/common/popups/vodviewer" )
require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubpreviewmoment" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/itemshop/contracts/contractsupplychaindetails" )
require( "ui/uieditor/widgets/itemshop/itemdetailssunset" )
require( "ui/uieditor/widgets/itemshop/shoptimer" )
require( "ui/uieditor/widgets/itemshop/supplychain/supplychainitem" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.ItemShopDetailsSunset = InheritFrom( CoD.Menu )
LUI.createMenu.ItemShopDetailsSunset = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ItemShopDetailsSunset", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, self, f1_arg1._model )
	CoD.BlackMarketUtility.SetPropertiesFromItemModel( f1_arg0, self )
	SetMenuProperty( f1_local1, "name", f1_arg1._model.name:get() )
	CoD.BlackMarketUtility.EnableItemshopTick( f1_arg0, self )
	CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
	SetFocusedTierModelValue( f1_arg0, "1", "set" )
	CoD.BaseUtility.SetControllerModelToSelfModelValue( f1_arg0, f1_local1, "MaxTier", "totalRewardCount" )
	self:setClass( CoD.ItemShopDetailsSunset )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x29C903C6DF90D6F ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	local ItemDetails = CoD.ItemDetailsSunset.new( f1_local1, f1_arg0, 0.5, 0.5, -840, -64, 0, 0, 178, 608 )
	ItemDetails:linkToElementModel( self, nil, false, function ( model )
		ItemDetails:setModel( model, f1_arg0 )
	end )
	ItemDetails:appendEventHandler( "input_source_changed", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local SupplyChainDetails = ItemDetails
	local XCamMouseControl = ItemDetails.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg0 )
	XCamMouseControl( SupplyChainDetails, f1_local6.LastInput, function ( f5_arg0, f5_arg1 )
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
	
	SupplyChainDetails = CoD.ContractSupplyChainDetails.new( f1_local1, f1_arg0, 0.5, 0.5, 310, 910, 0, 0, -79, 1001 )
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
				if not IsMouseOrKeyboard( f1_arg0 ) and not IsWidgetInFocus( self, "RewardList", event ) then
					f11_local0 = not IsWidgetInFocus( self, "RewardGridPC", event )
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
	local f1_local7 = SupplyChainDetails
	f1_local6 = SupplyChainDetails.subscribeToModel
	local RewardGridPC = Engine.GetModelForController( f1_arg0 )
	f1_local6( f1_local7, RewardGridPC.LastInput, function ( f13_arg0 )
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
	
	f1_local6 = nil
	f1_local6 = LUI.UIElement.createFake()
	self.RewardList = f1_local6
	f1_local7 = nil
	
	RewardGridPC = LUI.UIList.new( f1_local1, f1_arg0, 11, 0, nil, false, false, false, false )
	RewardGridPC:setLeftRight( 0.5, 0.5, -824, -80 )
	RewardGridPC:setTopBottom( 0, 0, 684, 842 )
	RewardGridPC:setWidgetType( CoD.SupplyChainItem )
	RewardGridPC:setHorizontalCount( 5 )
	RewardGridPC:setSpacing( 11 )
	RewardGridPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	RewardGridPC:setDataSource( "BundleItemsList" )
	RewardGridPC:appendEventHandler( "input_source_changed", function ( f18_arg0, f18_arg1 )
		f18_arg1.menu = f18_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f18_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local f1_local9 = RewardGridPC
	local ShopTimer = RewardGridPC.subscribeToModel
	local f1_local11 = Engine.GetModelForController( f1_arg0 )
	ShopTimer( f1_local9, f1_local11.LastInput, function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RewardGridPC:registerEventHandler( "gain_list_focus", function ( element, event )
		local f20_local0 = nil
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetControllerModelValue( f1_arg0, "contractDetailsShowItemInfo", true )
		end
		return f20_local0
	end )
	RewardGridPC:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f21_local0 = nil
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, element )
			SetElementState( self, self.SupplyChainDetails, f1_arg0, "DefaultState" )
		end
		return f21_local0
	end )
	RewardGridPC:registerEventHandler( "input_source_changed", function ( element, event )
		local f22_local0 = nil
		if IsMouse( f1_arg0 ) then
			CoD.GridAndListUtility.DisableListActiveOnFocus( element )
			CoD.GridAndListUtility.ActivateListPCSelectionBehavior( element )
		elseif IsGamepad( f1_arg0 ) then
			CoD.GridAndListUtility.EnableListActiveOnFocus( element )
		end
		if not f22_local0 then
			f22_local0 = element:dispatchEventToChildren( event )
		end
		return f22_local0
	end )
	RewardGridPC:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f23_local0
	end )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if IsMouseOrKeyboard( f24_arg2 ) then
			SetElementModelToFocusedElementModel( f24_arg2, self, f24_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f24_arg1, f24_arg2, f24_arg0 )
			SetControllerModelValue( f24_arg2, "contractDetailsShowItemInfo", true )
			SetCurrentElementAsActive( self, f24_arg0, f24_arg2 )
			CoD.PlayerRoleUtility.StopGesturePreview( f24_arg1, f24_arg2 )
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f24_arg1, f24_arg0, f24_arg2 )
			SetElementState( self, self.SupplyChainDetails, f24_arg2, "DefaultState" )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if IsMouseOrKeyboard( f25_arg2 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "MOUSE1", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if IsMouseOrKeyboard( f26_arg2 ) then
			SetElementModelToFocusedElementModel( f26_arg2, self, f26_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f26_arg1, f26_arg2, f26_arg0 )
			SetControllerModelValue( f26_arg2, "contractDetailsShowItemInfo", true )
			SetCurrentElementAsActive( self, f26_arg0, f26_arg2 )
			CoD.PlayerRoleUtility.StopGesturePreview( f26_arg1, f26_arg2 )
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f26_arg1, f26_arg0, f26_arg2 )
			SetElementState( self, self.SupplyChainDetails, f26_arg2, "DefaultState" )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if IsMouseOrKeyboard( f27_arg2 ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( RewardGridPC, "childFocusGained", function ( element )
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
		end
	end )
	RewardGridPC:subscribeToGlobalModel( f1_arg0, "PerController", "FocusedTier", function ( model )
		UpdateDataSource( self, RewardGridPC, f1_arg0 )
	end )
	self:addElement( RewardGridPC )
	self.RewardGridPC = RewardGridPC
	
	ShopTimer = CoD.ShopTimer.new( f1_local1, f1_arg0, 0.5, 0.5, -816.5, -566.5, 0, 0, 135, 195 )
	ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference = function ( f30_arg0 )
		local f30_local0 = f30_arg0:get()
		if f30_local0 ~= nil then
			ShopTimer.ReserveDealTimer.TextBox2:setText( CoD.BlackMarketUtility.GetTimerModelValue( self:getModel(), f30_local0 ) )
		end
	end
	
	ShopTimer:subscribeToGlobalModel( f1_arg0, "ReserveDealsRotation", "currentTime", ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference )
	ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference_FullPath = function ()
		local f31_local0 = DataSources.ReserveDealsRotation.getModel( f1_arg0 )
		f31_local0 = f31_local0.currentTime
		if f31_local0 then
			ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference( f31_local0 )
		end
	end
	
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount1_timer", function ( model )
		local f32_local0 = model:get()
		if f32_local0 ~= nil then
			ShopTimer.DiscountTimerSlot1.TextBox2:setText( f32_local0 )
		end
	end )
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount2_timer", function ( model )
		local f33_local0 = model:get()
		if f33_local0 ~= nil then
			ShopTimer.DiscountTimerSlot2.TextBox2:setText( f33_local0 )
		end
	end )
	ShopTimer:subscribeToGlobalModel( f1_arg0, "AutoEvents", "autoevent_discount3_timer", function ( model )
		local f34_local0 = model:get()
		if f34_local0 ~= nil then
			ShopTimer.DiscountTimerSlot3.TextBox2:setText( f34_local0 )
		end
	end )
	ShopTimer:linkToElementModel( self, nil, false, function ( model )
		ShopTimer:setModel( model, f1_arg0 )
	end )
	self:addElement( ShopTimer )
	self.ShopTimer = ShopTimer
	
	f1_local11 = ShopTimer
	f1_local9 = ShopTimer.subscribeToModel
	local f1_local12 = DataSources.ReserveDealsRotation.getModel( f1_arg0 )
	f1_local9( f1_local11, f1_local12.cycled, ShopTimer.ReserveDealTimer.TextBox2.__ReserveDealTimer_TextBox2_String_Reference_FullPath )
	self:linkToElementModel( self, "movieName", true, function ( model, f36_arg1 )
		CoD.Menu.UpdateButtonShownState( f36_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f36_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	self:appendEventHandler( "record_curr_focused_elem_id", function ( f37_arg0, f37_arg1 )
		f37_arg1.menu = f37_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f37_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	self:linkToElementModel( self, "allowFrozenMoment", true, function ( model, f38_arg1 )
		CoD.Menu.UpdateButtonShownState( f38_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		CoD.BlackMarketUtility.SendItemShopViewEvent( f39_arg2, f39_arg1, "" )
		GoBack( self, f39_arg2 )
		return true
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_contextual_3", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		OpenPopup( self, "PurchaseCodPoints", f41_arg2 )
		return true
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x63D5409DEC36DFA, nil, "ui_contextual_3" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x29E5695FF1401AD], "ui_contextual_2", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if CoD.BlackMarketUtility.CanPlayGesture( f43_arg1 ) then
			CoD.BlackMarketUtility.PlayGesture( self, f43_arg1, f43_arg2 )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		elseif CoD.BlackMarketUtility.CanPlayGesture( f43_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.PlayGesture( self, f43_arg1, f43_arg2 )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		if CoD.BlackMarketUtility.CanPlayGesture( f44_arg1 ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, "ui_contextual_2" )
			return false
		elseif CoD.BlackMarketUtility.CanPlayGesture( f44_arg1 ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x52FB29ED3A3CA79, nil, "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], nil, function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f45_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f45_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f45_arg2, "5", "increment" )
			return true
		else
			
		end
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f46_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "ui_remove", function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f47_arg0, f47_arg2, "movieName" ) and IsPC() then
			SetControllerModelValue( f47_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( f47_arg1, f47_arg2, "" )
			DelayOpenOverlay( f47_arg1, "VoDViewer", f47_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f48_arg0, f48_arg2, "movieName" ) and IsPC() then
			CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], nil, function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f49_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f49_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f49_arg2, "5", "decrement" )
			return true
		else
			
		end
	end, function ( f50_arg0, f50_arg1, f50_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f50_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.Menu.SetButtonLabel( f50_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ui_contextual_1", function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f51_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.ToggleSignatureWeapon( f51_arg1, f51_arg2, f51_arg1 )
			return true
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f51_arg0, f51_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f51_arg0, f51_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.BlackMarketUtility.ToggleCharacterModelCamera( f51_arg1, f51_arg0, f51_arg2 )
			return true
		else
			
		end
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f52_arg1 ) then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f52_arg0, f52_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f52_arg0, f52_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_remove", function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f53_arg1, f53_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f53_arg1 ) and CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "RewardList" ) then
			SetControllerModelValue( f53_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f53_arg2 )
			return true
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f53_arg1, f53_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f53_arg1, f53_arg2, "movieName", "" ) then
			SetControllerModelValue( f53_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( f53_arg1, f53_arg2, "" )
			DelayOpenOverlay( f53_arg1, "VoDViewer", f53_arg2, {
				fullscreen = true
			} )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f53_arg0, f53_arg2, "allowFrozenMoment", true ) then
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f53_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f53_arg0, f53_arg2, "movieName" ) then
			SetControllerModelValue( f53_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f53_arg2, f53_arg0, "" )
			DelayOpenOverlay( f53_arg1, "VoDViewer", f53_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f54_arg1, f54_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f54_arg1 ) and CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "RewardList" ) then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f54_arg1, f54_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f54_arg1, f54_arg2, "movieName", "" ) then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f54_arg0, f54_arg2, "allowFrozenMoment", true ) then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f54_arg0, f54_arg2, "movieName" ) then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
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
			CoD.BlackMarketUtility.SendItemShopViewEvent( f1_arg0, f1_local1, "" )
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
	f1_local6.id = "RewardList"
	RewardGridPC.id = "RewardGridPC"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = ItemDetails
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local9 = self
	CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, f1_local9 )
	CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_local1, f1_local9, f1_arg0 )
	CoD.BlackMarketUtility.SetupPageStreamHoldActionReadyCheck( f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], Enum.LUIButton[0x820DDD869ABBFAA] )
	return self
end

CoD.ItemShopDetailsSunset.__onClose = function ( f57_arg0 )
	f57_arg0.GenericMenuFrameIdentity:close()
	f57_arg0.ItemDetails:close()
	f57_arg0.XCamMouseControl:close()
	f57_arg0.SupplyChainDetails:close()
	f57_arg0.RewardList:close()
	f57_arg0.RewardGridPC:close()
	f57_arg0.ShopTimer:close()
end

