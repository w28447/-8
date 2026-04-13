require( "ui/uieditor/menus/itemshop/purchasebribestack" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "x64:9fb6ca8791129aa" )
require( "x64:4277e6cd270f883" )
require( "x64:7d7569575c0851f" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )

CoD.WeaponBribeSelection = InheritFrom( CoD.Menu )
LUI.createMenu.WeaponBribeSelection = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "WeaponBribeSelection", f1_arg0 )
	local f1_local1 = self
	CoD.BlackMarketUtility.EnableBribeMenuTick( f1_arg0, self )
	self:setClass( CoD.WeaponBribeSelection )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xC641379064CB7E ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	local WeaponBribes = LUI.UIList.new( f1_local1, f1_arg0, 5, 0, nil, true, false, false, false )
	WeaponBribes:setLeftRight( 0.5, 0.5, -864, 247 )
	WeaponBribes:setTopBottom( 0.5, 0.5, -325, 325 )
	WeaponBribes:setWidgetType( CoD.WeaponBribeItem )
	WeaponBribes:setHorizontalCount( 4 )
	WeaponBribes:setVerticalCount( 5 )
	WeaponBribes:setSpacing( 5 )
	WeaponBribes:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	WeaponBribes:setVerticalCounter( CoD.verticalCounter )
	WeaponBribes:setDataSource( "WeaponBribeList" )
	WeaponBribes:linkToElementModel( WeaponBribes, "purchased", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local WeaponBribeSelectionTimer = WeaponBribes
	local SupplyChainDetails = WeaponBribes.subscribeToModel
	local f1_local6 = DataSources.BribeMenuTimer.getModel( f1_arg0 )
	SupplyChainDetails( WeaponBribeSelectionTimer, f1_local6.cycled, function ( f4_arg0, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	WeaponBribes:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, element )
		SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
		return f5_local0
	end )
	WeaponBribes:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( WeaponBribes, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f7_arg0, f7_arg2, "purchased" ) and CoD.BlackMarketUtility.WeaponBribeSelectionAvailable( f7_arg2 ) then
			OpenOverlay( self, "PurchaseBribeStack", f7_arg2, {
				_model = f7_arg0:getModel(),
				_properties = {
					_isWeaponBribeSelect = true
				}
			} )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f8_arg0, f8_arg2, "purchased" ) and CoD.BlackMarketUtility.WeaponBribeSelectionAvailable( f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( WeaponBribes )
	self.WeaponBribes = WeaponBribes
	
	SupplyChainDetails = CoD.WeaponBribeDetails.new( f1_local1, f1_arg0, 0.5, 0.5, 312, 912, 0.5, 0.5, -619, 461 )
	SupplyChainDetails:mergeStateConditions( {
		{
			stateName = "NoInfoPanel",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	SupplyChainDetails:linkToElementModel( SupplyChainDetails, "name", true, function ( model )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "name"
		} )
	end )
	SupplyChainDetails:appendEventHandler( "input_source_changed", function ( f11_arg0, f11_arg1 )
		f11_arg1.menu = f11_arg1.menu or f1_local1
		f1_local1:updateElementState( SupplyChainDetails, f11_arg1 )
	end )
	f1_local6 = SupplyChainDetails
	WeaponBribeSelectionTimer = SupplyChainDetails.subscribeToModel
	local f1_local7 = Engine.GetModelForController( f1_arg0 )
	WeaponBribeSelectionTimer( f1_local6, f1_local7.LastInput, function ( f12_arg0 )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f12_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
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
	self:addElement( SupplyChainDetails )
	self.SupplyChainDetails = SupplyChainDetails
	
	WeaponBribeSelectionTimer = CoD.WeaponBribeSelectionTimer.new( f1_local1, f1_arg0, 0, 0, 96, 1207, 0, 0, 171, 204 )
	self:addElement( WeaponBribeSelectionTimer )
	self.WeaponBribeSelectionTimer = WeaponBribeSelectionTimer
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		GoBack( self, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.BlackMarketUtility.ItemShopDetailsClientScriptMenuCloseNotify( f1_arg0, f1_local1 )
		ClearMenuSavedState( f1_local1 )
	end )
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	WeaponBribes.id = "WeaponBribes"
	if CoD.isPC then
		SupplyChainDetails.id = "SupplyChainDetails"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = WeaponBribes
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, self )
	SetMenuProperty( f1_local1, "_skipSignatureWeaponStringOverride", true )
	return self
end

CoD.WeaponBribeSelection.__onClose = function ( f18_arg0 )
	f18_arg0.GenericMenuFrameIdentity:close()
	f18_arg0.WeaponBribes:close()
	f18_arg0.SupplyChainDetails:close()
	f18_arg0.WeaponBribeSelectionTimer:close()
end

