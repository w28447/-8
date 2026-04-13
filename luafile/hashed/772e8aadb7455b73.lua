require( "ui/uieditor/menus/itemshop/purchasecodpoints" )
require( "ui/uieditor/menus/lobby/common/popups/vodviewer" )
require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubpreviewmoment" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/itemshop/contracts/contractdetailspanelsunset" )
require( "ui/uieditor/widgets/itemshop/contracts/contractsupplychaindetails" )
require( "ui/uieditor/widgets/itemshop/contracts/contractsupplychaindetails_infopanel" )
require( "ui/uieditor/widgets/itemshop/itemshopcycleprompts" )
require( "ui/uieditor/widgets/startmenu/startmenu_codpoints" )
require( "ui/uieditor/widgets/itemshop/supplychain/supplychainitem" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.ContractDetailsSunset = InheritFrom( CoD.Menu )
LUI.createMenu.ContractDetailsSunset = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ContractDetailsSunset", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, self, f1_arg1._model )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1._properties )
	SetFocusedTierModelValue( f1_arg0, "1", "set" )
	CoD.BaseUtility.SetControllerModelToSelfModelValue( f1_arg0, f1_local1, "MaxTier", "totalRewardCount" )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "contractDetailsShowItemInfo", false )
	CoD.BlackMarketUtility.ResetSignatureWeaponState( f1_local1 )
	self:setClass( CoD.ContractDetailsSunset )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
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
	
	local ContractDetailsPanel = CoD.ContractDetailsPanelSunset.new( f1_local1, f1_arg0, 0.5, 0.5, -840, -64, 0, 0, 178, 905 )
	ContractDetailsPanel:linkToElementModel( self, nil, false, function ( model )
		ContractDetailsPanel:setModel( model, f1_arg0 )
	end )
	ContractDetailsPanel:appendEventHandler( "input_source_changed", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local f1_local4 = ContractDetailsPanel
	local Strip = ContractDetailsPanel.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg0 )
	Strip( f1_local4, f1_local6.LastInput, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	ContractDetailsPanel:linkToElementModel( ContractDetailsPanel, "allowFrozenMoment", true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	ContractDetailsPanel:linkToElementModel( ContractDetailsPanel, "movieName", true, function ( model, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	ContractDetailsPanel:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f8_local0
	end )
	f1_local1:AddButtonCallbackFunction( ContractDetailsPanel, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "MOUSE1", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsMouse( f9_arg2 ) then
			SetElementModelToFocusedElementModel( f9_arg2, self, f9_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f9_arg1, f9_arg2, self )
			SetControllerModelValue( f9_arg2, "contractDetailsShowItemInfo", true )
			CoD.PlayerRoleUtility.StopGesturePreview( f9_arg1, f9_arg2 )
			SetElementState( self, self.SupplyChainDetails, f9_arg2, "DefaultState" )
			CoD.BlackMarketUtility.CopySignatureWeaponProperty( f9_arg2, f9_arg1, self.ContractInfoPanel )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsMouse( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( ContractDetailsPanel, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_remove", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if CoD.ModelUtility.IsSelfModelValueEqualTo( f11_arg0, f11_arg2, "allowFrozenMoment", true ) and IsMouseOrKeyboard( f11_arg2 ) then
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f11_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f11_arg0, f11_arg2, "movieName" ) and IsMouseOrKeyboard( f11_arg2 ) then
			SetControllerModelValue( f11_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f11_arg2, f11_arg0, "" )
			DelayOpenOverlay( f11_arg1, "VoDViewer", f11_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if CoD.ModelUtility.IsSelfModelValueEqualTo( f12_arg0, f12_arg2, "allowFrozenMoment", true ) and IsMouseOrKeyboard( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f12_arg0, f12_arg2, "movieName" ) and IsMouseOrKeyboard( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( ContractDetailsPanel, "childFocusGained", function ( element )
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetControllerModelValue( f1_arg0, "contractDetailsShowItemInfo", false )
			CoD.BlackMarketUtility.CopySignatureWeaponProperty( f1_arg0, f1_local1, self.ContractInfoPanel )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, self )
		end
	end )
	self:addElement( ContractDetailsPanel )
	self.ContractDetailsPanel = ContractDetailsPanel
	
	Strip = LUI.UIImage.new( 0.5, 0.5, -839, -65, 0, 0, 676.5, 850.5 )
	Strip:setRGB( 0.09, 0.14, 0.19 )
	Strip:setAlpha( 0.8 )
	Strip:setMaterial( LUI.UIImage.GetCachedMaterial( 0x67D1E3A3D2D1BF ) )
	Strip:setShaderVector( 0, 0.7, 0, 0, 0 )
	self:addElement( Strip )
	self.Strip = Strip
	
	f1_local4 = nil
	f1_local4 = LUI.UIElement.createFake()
	self.RewardList = f1_local4
	f1_local6 = nil
	
	local RewardGridPC = LUI.UIList.new( f1_local1, f1_arg0, 11, 0, nil, false, false, false, false )
	RewardGridPC:setLeftRight( 0.5, 0.5, -824, -80 )
	RewardGridPC:setTopBottom( 0, 0, 684, 842 )
	RewardGridPC:setWidgetType( CoD.SupplyChainItem )
	RewardGridPC:setHorizontalCount( 5 )
	RewardGridPC:setSpacing( 11 )
	RewardGridPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	RewardGridPC:setDataSource( "ContractTierItems" )
	RewardGridPC:appendEventHandler( "input_source_changed", function ( f14_arg0, f14_arg1 )
		f14_arg1.menu = f14_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local ContractInfoPanel = RewardGridPC
	local SupplyChainDetails = RewardGridPC.subscribeToModel
	local StartMenuCODpoints = Engine.GetModelForController( f1_arg0 )
	SupplyChainDetails( ContractInfoPanel, StartMenuCODpoints.LastInput, function ( f15_arg0, f15_arg1 )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RewardGridPC:linkToElementModel( RewardGridPC, "allowFrozenMoment", true, function ( model, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	RewardGridPC:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f17_local0 = nil
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetElementModelToFocusedElementModel( f1_arg0, self, element, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, element )
			SetElementState( self, self.SupplyChainDetails, f1_arg0, "DefaultState" )
		end
		return f17_local0
	end )
	RewardGridPC:registerEventHandler( "gain_list_focus", function ( element, event )
		local f18_local0 = nil
		if IsGamepadOrKeyboardNavigation( f1_arg0 ) then
			SetControllerModelValue( f1_arg0, "contractDetailsShowItemInfo", true )
		end
		return f18_local0
	end )
	RewardGridPC:registerEventHandler( "input_source_changed", function ( element, event )
		local f19_local0 = nil
		if IsMouse( f1_arg0 ) then
			CoD.GridAndListUtility.DisableListActiveOnFocus( element )
			CoD.GridAndListUtility.ActivateListPCSelectionBehavior( element )
		elseif IsGamepad( f1_arg0 ) then
			CoD.GridAndListUtility.EnableListActiveOnFocus( element )
		end
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	RewardGridPC:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x571F08AD84807E0] )
		return f20_local0
	end )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if IsMouseOrKeyboard( f21_arg2 ) then
			SetElementModelToFocusedElementModel( f21_arg2, self, f21_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f21_arg1, f21_arg2, f21_arg0 )
			SetControllerModelValue( f21_arg2, "contractDetailsShowItemInfo", true )
			SetCurrentElementAsActive( self, f21_arg0, f21_arg2 )
			CoD.PlayerRoleUtility.StopGesturePreview( f21_arg1, f21_arg2 )
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f21_arg1, f21_arg0, f21_arg2 )
			SetElementState( self, self.SupplyChainDetails, f21_arg2, "DefaultState" )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if IsMouseOrKeyboard( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "MOUSE1", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsMouseOrKeyboard( f23_arg2 ) then
			SetElementModelToFocusedElementModel( f23_arg2, self, f23_arg0, "SupplyChainDetails" )
			CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f23_arg1, f23_arg2, f23_arg0 )
			SetControllerModelValue( f23_arg2, "contractDetailsShowItemInfo", true )
			SetCurrentElementAsActive( self, f23_arg0, f23_arg2 )
			CoD.PlayerRoleUtility.StopGesturePreview( f23_arg1, f23_arg2 )
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f23_arg1, f23_arg0, f23_arg2 )
			SetElementState( self, self.SupplyChainDetails, f23_arg2, "DefaultState" )
			UpdateButtonPromptState( f23_arg1, f23_arg0, f23_arg2, Enum.LUIButton[0x29E5695FF1401AD] )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsMouseOrKeyboard( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f25_arg0, f25_arg2, "allowFrozenMoment" ) and IsGamepad( f25_arg2 ) then
			SetControllerModelValue( f25_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f26_arg0, f26_arg2, "allowFrozenMoment" ) and IsGamepad( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x57783F8DA4AAEF], nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsDpadButton( f27_arg3 ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f27_arg0, 1 ) then
			SetFocusedTierModelValue( f27_arg2, "1", "decrement" )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsDpadButton( nil ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f28_arg0, 1 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x57783F8DA4AAEF], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( RewardGridPC, f1_arg0, Enum.LUIButton[0x571F08AD84807E0], nil, function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if IsDpadButton( f29_arg3 ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f29_arg0, 5 ) then
			SetFocusedTierModelValue( f29_arg2, "1", "increment" )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if IsDpadButton( nil ) and CoD.GridAndListUtility.IsElementAtColumnIndex( f30_arg0, 5 ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, nil )
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
	
	SupplyChainDetails = CoD.ContractSupplyChainDetails.new( f1_local1, f1_arg0, 0.5, 0.5, 302, 902, 0, 0, -81, 999 )
	SupplyChainDetails:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsControllerModelValueTrue( f1_arg0, "contractDetailsShowItemInfo" )
			end
		},
		{
			stateName = "NoInfoPanel",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsMouseOrKeyboard( f1_arg0 ) and not CoD.ModelUtility.IsControllerModelValueTrue( f1_arg0, "contractDetailsShowItemInfo" ) then
					f34_local0 = AlwaysFalse()
				else
					f34_local0 = false
				end
				return f34_local0
			end
		}
	} )
	StartMenuCODpoints = SupplyChainDetails
	ContractInfoPanel = SupplyChainDetails.subscribeToModel
	local XCamMouseControl = Engine.GetModelForController( f1_arg0 )
	ContractInfoPanel( StartMenuCODpoints, XCamMouseControl.contractDetailsShowItemInfo, function ( f35_arg0 )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f35_arg0:get(),
			modelName = "contractDetailsShowItemInfo"
		} )
	end, false )
	SupplyChainDetails:appendEventHandler( "input_source_changed", function ( f36_arg0, f36_arg1 )
		f36_arg1.menu = f36_arg1.menu or f1_local1
		f1_local1:updateElementState( SupplyChainDetails, f36_arg1 )
	end )
	StartMenuCODpoints = SupplyChainDetails
	ContractInfoPanel = SupplyChainDetails.subscribeToModel
	XCamMouseControl = Engine.GetModelForController( f1_arg0 )
	ContractInfoPanel( StartMenuCODpoints, XCamMouseControl.LastInput, function ( f37_arg0 )
		f1_local1:updateElementState( SupplyChainDetails, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f37_arg0:get(),
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
	
	ContractInfoPanel = CoD.ContractSupplyChainDetails_InfoPanel.new( f1_local1, f1_arg0, 0.5, 0.5, 340, 898, 0, 0, 715, 961 )
	ContractInfoPanel:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsControllerModelValueTrue( f1_arg0, "contractDetailsShowItemInfo" )
			end
		}
	} )
	XCamMouseControl = ContractInfoPanel
	StartMenuCODpoints = ContractInfoPanel.subscribeToModel
	local Prompts = Engine.GetModelForController( f1_arg0 )
	StartMenuCODpoints( XCamMouseControl, Prompts.contractDetailsShowItemInfo, function ( f41_arg0 )
		f1_local1:updateElementState( ContractInfoPanel, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f41_arg0:get(),
			modelName = "contractDetailsShowItemInfo"
		} )
	end, false )
	ContractInfoPanel:linkToElementModel( ContractInfoPanel, "itemCategory", true, function ( model )
		f1_local1:updateElementState( ContractInfoPanel, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "itemCategory"
		} )
	end )
	ContractInfoPanel:appendEventHandler( "input_source_changed", function ( f43_arg0, f43_arg1 )
		f43_arg1.menu = f43_arg1.menu or f1_local1
		f1_local1:updateElementState( ContractInfoPanel, f43_arg1 )
	end )
	XCamMouseControl = ContractInfoPanel
	StartMenuCODpoints = ContractInfoPanel.subscribeToModel
	Prompts = Engine.GetModelForController( f1_arg0 )
	StartMenuCODpoints( XCamMouseControl, Prompts.LastInput, function ( f44_arg0 )
		f1_local1:updateElementState( ContractInfoPanel, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f44_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	ContractInfoPanel:linkToElementModel( self, nil, false, function ( model )
		ContractInfoPanel:setModel( model, f1_arg0 )
	end )
	self:addElement( ContractInfoPanel )
	self.ContractInfoPanel = ContractInfoPanel
	
	StartMenuCODpoints = CoD.StartMenu_CODpoints.new( f1_local1, f1_arg0, 0.5, 0.5, 550, 654, 0, 0, -11, 69 )
	StartMenuCODpoints:setAlpha( 0 )
	StartMenuCODpoints:subscribeToGlobalModel( f1_arg0, "LootStreamProgress", "codPoints", function ( model )
		local f46_local0 = model:get()
		if f46_local0 ~= nil then
			StartMenuCODpoints.codpointsCount:setText( SetValueIfNumberEqualTo( -1, "-", f46_local0 ) )
		end
	end )
	self:addElement( StartMenuCODpoints )
	self.StartMenuCODpoints = StartMenuCODpoints
	
	XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0.5, 0.5, 310, 910, 0, 0, 59, 684 )
	XCamMouseControl:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f47_local0
				if not CoD.BlackMarketUtility.ItemUses3DPreview( self.SupplyChainDetails, f1_arg0 ) then
					f47_local0 = CoD.ModelUtility.IsControllerModelValueTrue( f1_arg0, "contractDetailsShowItemInfo" )
				else
					f47_local0 = false
				end
				return f47_local0
			end
		}
	} )
	XCamMouseControl:linkToElementModel( XCamMouseControl, "character", true, function ( model )
		f1_local1:updateElementState( XCamMouseControl, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "character"
		} )
	end )
	XCamMouseControl:linkToElementModel( XCamMouseControl, "weaponRef", true, function ( model )
		f1_local1:updateElementState( XCamMouseControl, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "weaponRef"
		} )
	end )
	local f1_local13 = XCamMouseControl
	Prompts = XCamMouseControl.subscribeToModel
	local f1_local14 = Engine.GetModelForController( f1_arg0 )
	Prompts( f1_local13, f1_local14.contractDetailsShowItemInfo, function ( f50_arg0 )
		f1_local1:updateElementState( XCamMouseControl, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f50_arg0:get(),
			modelName = "contractDetailsShowItemInfo"
		} )
	end, false )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	Prompts = CoD.ItemShopCyclePrompts.new( f1_local1, f1_arg0, 0.5, 0.5, -920, 18, 0, 0, 671, 855 )
	Prompts:linkToElementModel( self, nil, false, function ( model )
		Prompts:setModel( model, f1_arg0 )
	end )
	self:addElement( Prompts )
	self.Prompts = Prompts
	
	ContractDetailsPanel:linkToElementModel( f1_local4, "tierCount", true, function ( model )
		local f52_local0 = model:get()
		if f52_local0 ~= nil then
			ContractDetailsPanel.RewardCount:setText( f52_local0 )
		end
	end )
	ContractDetailsPanel:linkToElementModel( RewardGridPC, "tierCount", true, function ( model )
		local f53_local0 = model:get()
		if f53_local0 ~= nil then
			ContractDetailsPanel.RewardCountPC:setText( f53_local0 )
		end
	end )
	self:linkToElementModel( self, "allowFrozenMoment", true, function ( model, f54_arg1 )
		CoD.Menu.UpdateButtonShownState( f54_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	self:linkToElementModel( self, "movieName", true, function ( model, f55_arg1 )
		CoD.Menu.UpdateButtonShownState( f55_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		CoD.BlackMarketUtility.SendItemShopViewEvent( f56_arg2, f56_arg1, "" )
		GoBack( self, f56_arg2 )
		return true
	end, function ( f57_arg0, f57_arg1, f57_arg2 )
		CoD.Menu.SetButtonLabel( f57_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], "MWHEELDOWN", function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f58_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f58_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f58_arg2, "5", "increment" )
			return true
		else
			
		end
	end, function ( f59_arg0, f59_arg1, f59_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f59_arg1, Enum.LUIButton[0x820DDD869ABBFAA] ) then
			CoD.Menu.SetButtonLabel( f59_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], "MWHEELUP", function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f60_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.BlackMarketUtility.PageStreamHoldUpdateAction( f60_arg1 )
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f60_arg2, "5", "decrement" )
			return true
		else
			
		end
	end, function ( f61_arg0, f61_arg1, f61_arg2 )
		if CoD.BlackMarketUtility.IsPageStreamHoldActionReady( f61_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] ) then
			CoD.Menu.SetButtonLabel( f61_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
		if not IsRepeatButtonPress( f62_arg3 ) then
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f62_arg2, "5", "increment" )
			return true
		else
			
		end
	end, function ( f63_arg0, f63_arg1, f63_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f63_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
		if not IsRepeatButtonPress( f64_arg3 ) then
			PlaySoundAlias( "uin_trigger_slide" )
			SetFocusedTierModelValue( f64_arg2, "5", "decrement" )
			return true
		else
			
		end
	end, function ( f65_arg0, f65_arg1, f65_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f65_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ui_contextual_1", function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f66_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.ToggleSignatureWeapon( f66_arg1, f66_arg2, f66_arg1 )
			return true
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f66_arg0, f66_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f66_arg0, f66_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.BlackMarketUtility.ToggleCharacterModelCamera( f66_arg1, f66_arg0, f66_arg2 )
			return true
		else
			
		end
	end, function ( f67_arg0, f67_arg1, f67_arg2 )
		if CoD.BlackMarketUtility.CanToggleSignatureWeapon( f67_arg1 ) then
			CoD.Menu.SetButtonLabel( f67_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		elseif CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f67_arg0, f67_arg2, "allowTogglePreview", true ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f67_arg0, f67_arg2, "itemCategory", 0xCC13B0F8EEFF726 ) then
			CoD.Menu.SetButtonLabel( f67_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ui_contextual_1" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x29E5695FF1401AD], "ui_contextual_2", function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
		if CoD.BlackMarketUtility.CanPlayGesture( f68_arg1 ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.PlayGesture( self, f68_arg1, f68_arg2 )
			return true
		else
			
		end
	end, function ( f69_arg0, f69_arg1, f69_arg2 )
		if CoD.BlackMarketUtility.CanPlayGesture( f69_arg1 ) then
			CoD.Menu.SetButtonLabel( f69_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x52FB29ED3A3CA79, nil, "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_remove", function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f70_arg1, f70_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f70_arg1 ) then
			SetControllerModelValue( f70_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f70_arg2 )
			return true
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f70_arg1, f70_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f70_arg1, f70_arg2, "movieName", "" ) then
			SetControllerModelValue( f70_arg2, "LootStreamProgress.playAnimation", false )
			CoD.BlackMarketUtility.SetupSupplyChainMovie( f70_arg1, f70_arg2, "" )
			DelayOpenOverlay( f70_arg1, "VoDViewer", f70_arg2, {
				fullscreen = true
			} )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f70_arg0, f70_arg2, "allowFrozenMoment", true ) then
			OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f70_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f70_arg0, f70_arg2, "movieName" ) then
			SetControllerModelValue( f70_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f70_arg2, f70_arg0, "" )
			DelayOpenOverlay( f70_arg1, "VoDViewer", f70_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f71_arg0, f71_arg1, f71_arg2 )
		if CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f71_arg1, f71_arg2, "allowFrozenMoment", true ) and not CoD.BlackMarketUtility.IsMenuOccluded( f71_arg1 ) then
			CoD.Menu.SetButtonLabel( f71_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueNil( f71_arg1, f71_arg2, "movieName" ) and not CoD.BlackMarketUtility.IsSupplyChainActiveWidgetModelValueEqualTo( f71_arg1, f71_arg2, "movieName", "" ) then
			CoD.Menu.SetButtonLabel( f71_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_remove" )
			return false
		elseif CoD.ModelUtility.IsSelfModelValueEqualTo( f71_arg0, f71_arg2, "allowFrozenMoment", true ) then
			CoD.Menu.SetButtonLabel( f71_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueNonEmptyString( f71_arg0, f71_arg2, "movieName" ) then
			CoD.Menu.SetButtonLabel( f71_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x52FB29ED3A3CA79, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_contextual_3", function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3 )
		OpenPopup( self, "PurchaseCodPoints", f72_arg2 )
		return true
	end, function ( f73_arg0, f73_arg1, f73_arg2 )
		CoD.Menu.SetButtonLabel( f73_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x63D5409DEC36DFA, nil, "ui_contextual_3" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( f1_arg0, "MaxTier", CoD.BlackMarketUtility.SupplyChainMaxTiers )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		CoD.PlayerRoleUtility.StopGesturePreview( f1_local1, f1_arg0 )
		ClearMenuSavedState( f1_local1 )
		SetFocusedTierModelValue( f1_arg0, "0", "" )
	end )
	self:subscribeToGlobalModel( f1_arg0, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) and CoD.ContractUtility.OpenedContractExpired( self, self, f1_arg0 ) then
			GoBack( self, f1_arg0 )
		end
	end )
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	ContractDetailsPanel.id = "ContractDetailsPanel"
	f1_local4.id = "RewardList"
	RewardGridPC.id = "RewardGridPC"
	if CoD.isPC then
		SupplyChainDetails.id = "SupplyChainDetails"
	end
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	if CoD.isPC then
		Prompts.id = "Prompts"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = ContractDetailsPanel
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local13 = self
	if not CoD.ModelUtility.IsSelfModelValueTrue( f1_local13, f1_arg0, "purchased" ) then
		CoD.BlackMarketUtility.EnableLiveCountDownTimer( self )
		CoD.BlackMarketUtility.SetupPageStreamHoldActionReadyCheck( f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.BlackMarketUtility.EnableItemshopTick( f1_arg0, self )
	else
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_local1, f1_arg0, f1_local13 )
		CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_local1, f1_local13, f1_arg0 )
		CoD.BlackMarketUtility.SetupPageStreamHoldActionReadyCheck( f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], Enum.LUIButton[0x820DDD869ABBFAA] )
	end
	f1_local13 = ContractDetailsPanel
	if IsPC() then
		CoD.PCUtility.SetElementForceMouseEventDispatch( f1_local13, true )
	end
	return self
end

CoD.ContractDetailsSunset.__resetProperties = function ( f76_arg0 )
	f76_arg0.RewardList:completeAnimation()
	f76_arg0.Strip:completeAnimation()
	f76_arg0.RewardList:setAlpha( 1 )
	f76_arg0.Strip:setAlpha( 0.8 )
end

CoD.ContractDetailsSunset.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f77_arg0, f77_arg1 )
			f77_arg0:__resetProperties()
			f77_arg0:setupElementClipCounter( 1 )
			f77_arg0.Strip:completeAnimation()
			f77_arg0.Strip:setAlpha( 0.8 )
			f77_arg0.clipFinished( f77_arg0.Strip )
			f77_arg0.RewardList:completeAnimation()
			f77_arg0.RewardList:setAlpha( 1 )
			f77_arg0.clipFinished( f77_arg0.RewardList )
		end
	}
}
CoD.ContractDetailsSunset.__onClose = function ( f78_arg0 )
	f78_arg0.ContractDetailsPanel:close()
	f78_arg0.GenericMenuFrameIdentity:close()
	f78_arg0.RewardList:close()
	f78_arg0.RewardGridPC:close()
	f78_arg0.SupplyChainDetails:close()
	f78_arg0.ContractInfoPanel:close()
	f78_arg0.StartMenuCODpoints:close()
	f78_arg0.XCamMouseControl:close()
	f78_arg0.Prompts:close()
end

