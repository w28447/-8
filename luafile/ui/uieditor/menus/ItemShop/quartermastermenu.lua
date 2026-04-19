require( "ui/uieditor/menus/itemshop/purchasecodpoints" )
require( "ui/uieditor/menus/lobby/common/popups/vodviewer" )
require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubpreviewmoment" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/itemshop/itemshopbackgroundblur" )
require( "ui/uieditor/widgets/itemshop/itemshoptabbarcontainer" )
require( "x64:156d841adc02c80" )

CoD.QuarterMasterMenu = InheritFrom( CoD.Menu )
LUI.createMenu.QuarterMasterMenu = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "QuarterMasterMenu", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.InitGlobalModel( "ContractsForceUpdate", nil )
	CoD.BaseUtility.InitPersistentControllerModelIfNotSet( f1_arg0, "LootStreamProgress.pagedRequestStatus", nil )
	CoD.BlackMarketUtility.CreatePersistentPagedRequestModel( f1_arg0 )
	CoD.BlackMarketUtility.ResetSignatureWeaponState( f1_local1 )
	CoD.BlackMarketUtility.EnableItemshopTick( f1_arg0, self )
	SetPerControllerTableProperty( f1_arg0, "inBlackMarket", true )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.BlackMarketUtility.ClearRNGModels( f1_arg0 )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "playContrabandReveal", false )
	CoD.BlackMarketUtility.EnableReserveDealsTick( f1_arg0, self )
	CoD.BlackMarketUtility.EnableBribeMenuTick( f1_arg0, self )
	self:setClass( CoD.QuarterMasterMenu )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local ItemShopBackgroundBlur = CoD.ItemShopBackgroundBlur.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( ItemShopBackgroundBlur )
	self.ItemShopBackgroundBlur = ItemShopBackgroundBlur
	
	local Frame = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
	Frame:setLeftRight( 0, 1, 0, 0 )
	Frame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
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
	
	local TabBarContainer = CoD.ItemShopTabBarContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 1080 )
	TabBarContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	TabBarContainer:registerEventHandler( "list_active_changed", function ( element, event )
		local f4_local0 = nil
		if CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg0, "category", "inventory" ) then
			SetElementState( self, self.ItemShopBackgroundBlur, f1_arg0, "DefaultState" )
			CoD.BlackMarketUtility.SetQuarterMasterMenuCurrentTab( element, f1_arg0, f1_local1 )
			CoD.MetricsUtility.BlackMarketTabChange( f1_local1, element, f1_arg0 )
		elseif not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg0, "category", "inventory" ) then
			SetElementState( self, self.ItemShopBackgroundBlur, f1_arg0, "Hidden" )
			CoD.BlackMarketUtility.SetQuarterMasterMenuCurrentTab( element, f1_arg0, f1_local1 )
			CoD.MetricsUtility.BlackMarketTabChange( f1_local1, element, f1_arg0 )
		end
		return f4_local0
	end )
	self:addElement( TabBarContainer )
	self.TabBarContainer = TabBarContainer
	
	local SpinnerLoadingAnimation = CoD.SpinnerLoadingAnimation.new( f1_local1, f1_arg0, 0, 0, 930, 990, 0, 0, 510, 570 )
	SpinnerLoadingAnimation:setAlpha( 0 )
	self:addElement( SpinnerLoadingAnimation )
	self.SpinnerLoadingAnimation = SpinnerLoadingAnimation
	
	Frame:linkToElementModel( TabBarContainer.FETabBar.Tabs.grid, "frameWidget", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			Frame:changeFrameWidget( f5_local0 )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Processing",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "LootStreamProgress.pagedRequestStatus", "Requested" )
			end
		}
	} )
	local f1_local7 = self
	local f1_local8 = self.subscribeToModel
	local f1_local9 = Engine.GetModelForController( f1_arg0 )
	f1_local8( f1_local7, f1_local9["LootStreamProgress.pagedRequestStatus"], function ( f7_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f7_arg0:get(),
			modelName = "LootStreamProgress.pagedRequestStatus"
		} )
	end, false )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = Engine.GetModelForController( f1_arg0 )
	f1_local8( f1_local7, f1_local9["LootStreamProgress.pagedRequestStatus"], function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = Engine.GetGlobalModel()
	f1_local8( f1_local7, f1_local9["lobbyRoot.lobbyNetworkMode"], function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = DataSources.AutoEvents.getModel( f1_arg0 )
	f1_local8( f1_local7, f1_local9.cycled, function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f11_arg0, f11_arg1 )
		f11_arg1.menu = f11_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f11_arg0, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f11_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = Engine.GetModelForController( f1_arg0 )
	f1_local8( f1_local7, f1_local9.LastInput, function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	self:registerEventHandler( "occlusion_change", function ( element, event )
		local f13_local0 = nil
		if element.OcclusionChange then
			f13_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f13_local0 = element.super:OcclusionChange( event )
		end
		UpdateAllMenuButtonPrompts( f1_local1, f1_arg0 )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:registerEventHandler( "list_active_changed", function ( element, event )
		local f14_local0 = nil
		CoD.BlackMarketUtility.MarkTabAsSeen( f1_arg0, f1_local1 )
		return f14_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		GoBack( self, f15_arg2 )
		PlaySoundAlias( "uin_cmn_backout" )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_contextual_3", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not CoD.ModelUtility.IsModelValueEqualTo( f17_arg2, "LootStreamProgress.pagedRequestStatus", "Requested" ) and IsCommerceEnabledOnPC() and AreCodPointsEnabled( f17_arg2 ) and not CoD.BlackMarketUtility.IsMenuOccluded( f17_arg1 ) and not IsGameTrial() then
			OpenPopup( self, "PurchaseCodPoints", f17_arg2 )
			SetControllerModelValue( f17_arg2, "LootStreamProgress.playAnimation", false )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not CoD.ModelUtility.IsModelValueEqualTo( f18_arg2, "LootStreamProgress.pagedRequestStatus", "Requested" ) and IsCommerceEnabledOnPC() and AreCodPointsEnabled( f18_arg2 ) and not CoD.BlackMarketUtility.IsMenuOccluded( f18_arg1 ) and not IsGameTrial() then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x63D5409DEC36DFA, nil, "ui_contextual_3" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f19_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) and IsDesiredFrameWidget( f19_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f19_arg1, "Processing" ) and IsPerControllerTablePropertyValue( f19_arg2, "allowTierPurchase", true ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f19_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f19_arg2, "5", "increment" )
			CoD.PlayerRoleUtility.StopGesturePreview( f19_arg1, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f20_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) and IsDesiredFrameWidget( f20_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f20_arg1, "Processing" ) and IsPerControllerTablePropertyValue( f20_arg2, "allowTierPurchase", true ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f21_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) and IsDesiredFrameWidget( f21_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f21_arg1, "Processing" ) and IsPerControllerTablePropertyValue( f21_arg2, "allowTierPurchase", true ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f21_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f21_arg2, "5", "decrement" )
			CoD.PlayerRoleUtility.StopGesturePreview( f21_arg1, f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f22_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) and IsDesiredFrameWidget( f22_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f22_arg1, "Processing" ) and IsPerControllerTablePropertyValue( f22_arg2, "allowTierPurchase", true ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsDesiredFrameWidget( f23_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f23_arg1, "Processing" ) and CoD.BlackMarketUtility.ShowPurchaseTiersPrompt( f23_arg2, self.Frame, "PurchaseTiers" ) and AreCodPointsEnabled( f23_arg2 ) and IsPerControllerTablePropertyValue( f23_arg2, "allowTierPurchase", true ) and not IsGameTrial() then
			CoD.BlackMarketUtility.SetHighlightedPurchaseTier( f23_arg2, self.Frame )
			CoD.BlackMarketUtility.OpenPurchaseTiersConfirmation( f23_arg2, self, self.Frame )
			PlaySoundSetSound( self, "action" )
			return true
		elseif IsDesiredFrameWidget( f23_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f23_arg1, "Processing" ) and AreCodPointsEnabled( f23_arg2 ) and IsPerControllerTablePropertyValue( f23_arg2, "allowTierPurchase", true ) and not IsGameTrial() then
			CoD.BlackMarketUtility.SetHighlightedPurchaseTier( f23_arg2, self.Frame )
			CoD.BlackMarketUtility.OpenPurchaseTiersConfirmation( f23_arg2, self, self.Frame )
			PlaySoundSetSound( self, "action" )
			return true
		elseif IsDesiredFrameWidget( f23_arg2, self.Frame, "BlackjackReserveFrame" ) and CoD.BlackMarketUtility.CanShowReservesPreview( f23_arg2 ) and IsGamepad( f23_arg2 ) then
			CoD.BlackMarketUtility.PlayReservesPreviewVideo( f23_arg2, f23_arg1, false, true )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsDesiredFrameWidget( f24_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f24_arg1, "Processing" ) and CoD.BlackMarketUtility.ShowPurchaseTiersPrompt( f24_arg2, self.Frame, "PurchaseTiers" ) and AreCodPointsEnabled( f24_arg2 ) and IsPerControllerTablePropertyValue( f24_arg2, "allowTierPurchase", true ) and not IsGameTrial() then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0xC083113BC81F23F], 0xFAF2C4773992641, nil, nil )
			return true
		elseif IsDesiredFrameWidget( f24_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f24_arg1, "Processing" ) and AreCodPointsEnabled( f24_arg2 ) and IsPerControllerTablePropertyValue( f24_arg2, "allowTierPurchase", true ) and not IsGameTrial() then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, nil, nil )
			return false
		elseif IsDesiredFrameWidget( f24_arg2, self.Frame, "BlackjackReserveFrame" ) and CoD.BlackMarketUtility.CanShowReservesPreview( f24_arg2 ) and IsGamepad( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_remove", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if IsDesiredFrameWidget( f25_arg2, self.Frame, "BlackjackReserveFrame" ) and CoD.BlackMarketUtility.CanShowReservesPreview( f25_arg2 ) and IsMouseOrKeyboard( f25_arg2 ) then
			CoD.BlackMarketUtility.PlayReservesPreviewVideo( f25_arg2, f25_arg1, false, true )
			return true
		elseif IsDesiredFrameWidget( f25_arg2, self.Frame, "SupplyChainFrame" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( self.Frame, f25_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f25_arg2, "movieName", "" ) and not IsMenuInState( f25_arg1, "Processing" ) then
			SetControllerModelValue( f25_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( self.Frame, f25_arg2, "" )
			DelayOpenOverlay( f25_arg1, "VoDViewer", f25_arg2, {
				fullscreen = true
			} )
			return true
		elseif IsDesiredFrameWidget( f25_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f25_arg2, "allowFrozenMoment", true ) and not IsMenuInState( f25_arg1, "Processing" ) then
			SetControllerModelValue( f25_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if IsDesiredFrameWidget( f26_arg2, self.Frame, "BlackjackReserveFrame" ) and CoD.BlackMarketUtility.CanShowReservesPreview( f26_arg2 ) and IsMouseOrKeyboard( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif IsDesiredFrameWidget( f26_arg2, self.Frame, "SupplyChainFrame" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( self.Frame, f26_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f26_arg2, "movieName", "" ) and not IsMenuInState( f26_arg1, "Processing" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif IsDesiredFrameWidget( f26_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f26_arg2, "allowFrozenMoment", true ) and not IsMenuInState( f26_arg1, "Processing" ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x29E5695FF1401AD], "ui_contextual_2", function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsDesiredFrameWidget( f27_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.CanPlayGesture( self.Frame ) and not IsMenuInState( f27_arg1, "Processing" ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.PlayGesture( self, self.Frame, f27_arg2 )
			return true
		elseif IsDesiredFrameWidget( f27_arg2, self.Frame, "ItemShopFrame" ) and CoD.BlackMarketUtility.CanPlayGesture( self.Frame ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.PlayGesture( self, self.Frame, f27_arg2 )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsDesiredFrameWidget( f28_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.CanPlayGesture( self.Frame ) and not IsMenuInState( f28_arg1, "Processing" ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, "ui_contextual_2" )
			return false
		elseif IsDesiredFrameWidget( f28_arg2, self.Frame, "ItemShopFrame" ) and CoD.BlackMarketUtility.CanPlayGesture( self.Frame ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, "ui_contextual_2" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ui_contextual_1", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if not IsMenuInState( f29_arg1, "Processing" ) and CoD.BlackMarketUtility.CanToggleSignatureWeapon( self.Frame ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.ToggleSignatureWeapon( f29_arg1, f29_arg2, self.Frame )
			return true
		elseif IsDesiredFrameWidget( f29_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f29_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f29_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.BlackMarketUtility.ToggleCharacterModelCamera( f29_arg1, self.Frame, f29_arg2 )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if not IsMenuInState( f30_arg1, "Processing" ) and CoD.BlackMarketUtility.CanToggleSignatureWeapon( self.Frame ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		elseif IsDesiredFrameWidget( f30_arg2, self.Frame, "SupplyChainFrame" ) and CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f30_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( self.Frame, f30_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not IsRepeatButtonPress( f31_arg3 ) and IsDesiredFrameWidget( f31_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f31_arg1, "Processing" ) then
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f31_arg2, "5", "increment" )
			CoD.PlayerRoleUtility.StopGesturePreview( f31_arg1, f31_arg2 )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if not IsRepeatButtonPress( nil ) and IsDesiredFrameWidget( f32_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f32_arg1, "Processing" ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		if not IsRepeatButtonPress( f33_arg3 ) and IsDesiredFrameWidget( f33_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f33_arg1, "Processing" ) then
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f33_arg2, "5", "decrement" )
			CoD.PlayerRoleUtility.StopGesturePreview( f33_arg1, f33_arg2 )
			return true
		else
			
		end
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		if not IsRepeatButtonPress( nil ) and IsDesiredFrameWidget( f34_arg2, self.Frame, "SupplyChainFrame" ) and not IsMenuInState( f34_arg1, "Processing" ) then
			CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if IsPC() then
			CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
			CoD.BreadcrumbUtility.UpdateStartMenuBreadcrumb( f1_arg0 )
			SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
			ClearMenuSavedState( f1_local1 )
			CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 0 )
			SetPerControllerTableProperty( f1_arg0, "inBlackMarket", false )
			CoD.MetricsUtility.BlackMarketEntryEvent( f1_arg0, f1_local1 )
			CoD.BlackMarketUtility.OnQuitBlackMarketCustomFunction( f1_local1, f1_arg0 )
			CoD.BlackMarketUtility.ClearBlackMarketMenuForTest( f1_arg0 )
		else
			CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
			CoD.BreadcrumbUtility.UpdateStartMenuBreadcrumb( f1_arg0 )
			SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
			ClearMenuSavedState( f1_local1 )
			CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 0 )
			SetPerControllerTableProperty( f1_arg0, "inBlackMarket", false )
			CoD.MetricsUtility.BlackMarketEntryEvent( f1_arg0, f1_local1 )
			CoD.BlackMarketUtility.ClearBlackMarketMenuForTest( f1_arg0 )
		end
	end )
	Frame.id = "Frame"
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	TabBarContainer.id = "TabBarContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = Frame
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local8 = self
	if not IsBooleanDvarSet( "ui_enableItemShop" ) and not IsBooleanDvarSet( "ui_enableContracts" ) then
		SetElementState( self, self.TabBarContainer, f1_arg0, "Hidden" )
	else
		CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 1 )
		CoD.BlackMarketUtility.QuarterMasterFrameChangeActions( f1_local1, self.Frame, f1_arg0 )
		CoD.BlackMarketUtility.PlayBlackMarketFrontendMusic( self, f1_arg0 )
		AutoSelectCodPointCategory( self, f1_arg0 )
		CoD.BlackMarketUtility.SetupPageStreamHoldActionReadyCheck( f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.BlackMarketUtility.ShowFreeBundlePopupIfNeeded( self.Frame, f1_arg0 )
		CoD.BlackMarketUtility.SetBlackMarketMenuForTest( f1_arg0, f1_local1 )
	end
	return self
end

CoD.QuarterMasterMenu.__resetProperties = function ( f36_arg0 )
	f36_arg0.SpinnerLoadingAnimation:completeAnimation()
	f36_arg0.SpinnerLoadingAnimation:setAlpha( 0 )
end

CoD.QuarterMasterMenu.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f37_arg0, f37_arg1 )
			f37_arg0:__resetProperties()
			f37_arg0:setupElementClipCounter( 1 )
			f37_arg0.SpinnerLoadingAnimation:completeAnimation()
			f37_arg0.SpinnerLoadingAnimation:setAlpha( 0 )
			f37_arg0.clipFinished( f37_arg0.SpinnerLoadingAnimation )
		end
	},
	Processing = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 1 )
			f38_arg0.SpinnerLoadingAnimation:completeAnimation()
			f38_arg0.SpinnerLoadingAnimation:setAlpha( 1 )
			f38_arg0.clipFinished( f38_arg0.SpinnerLoadingAnimation )
		end
	}
}
CoD.QuarterMasterMenu.__onClose = function ( f39_arg0 )
	f39_arg0.Frame:close()
	f39_arg0.ItemShopBackgroundBlur:close()
	f39_arg0.GenericMenuFrameIdentity:close()
	f39_arg0.TabBarContainer:close()
	f39_arg0.SpinnerLoadingAnimation:close()
end

