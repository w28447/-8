require( "x64:9b528a05aba52d6" )
require( "ui/uieditor/menus/lobby/common/popups/vodviewer" )
require( "ui/uieditor/widgets/itemshop/bmtallitemcontainer" )
require( "ui/uieditor/widgets/itemshop/discounttierscontainer" )
require( "ui/uieditor/widgets/itemshop/listlabel" )
require( "ui/uieditor/widgets/scrollbars/horizontalcountertriggerprompts" )
require( "ui/uieditor/widgets/director/directorpregamebutton" )
require( "ui/uieditor/widgets/scrollbars/horizontalcounter" )

CoD.BlackJacksShopFrameNoPreview = InheritFrom( LUI.UIElement )
CoD.BlackJacksShopFrameNoPreview.__defaultWidth = 1920
CoD.BlackJacksShopFrameNoPreview.__defaultHeight = 1080
CoD.BlackJacksShopFrameNoPreview.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg1, "BlackjackShopIntroduction" )
	self:setClass( CoD.BlackJacksShopFrameNoPreview )
	self.id = "BlackJacksShopFrameNoPreview"
	self.soundSet = "ItemShop"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local FeaturedSlot1Timer = CoD.ListLabel.new( f1_arg0, f1_arg1, 0.5, 0.5, -841, -599, 0.5, 0.5, -369, -319 )
	FeaturedSlot1Timer:subscribeToGlobalModel( f1_arg1, "ItemshopRotation", "loot_itemshop_slot1_timer", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			FeaturedSlot1Timer.TextBox2:setText( f2_local0 )
		end
	end )
	self:addElement( FeaturedSlot1Timer )
	self.FeaturedSlot1Timer = FeaturedSlot1Timer
	
	local NoMyShopOffers = LUI.UIText.new( 0.5, 0.5, 12, 252, 0.5, 0.5, -218.5, -181.5 )
	NoMyShopOffers:setText( Engine[0xF9F1239CFD921FE]( 0x40A4373BEE19526 ) )
	NoMyShopOffers:setTTF( "default" )
	NoMyShopOffers:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	NoMyShopOffers:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( NoMyShopOffers )
	self.NoMyShopOffers = NoMyShopOffers
	
	local FeaturedSlot1 = LUI.UIList.new( f1_arg0, f1_arg1, 30, 0, nil, true, false, false, false )
	FeaturedSlot1:setLeftRight( 0.5, 0.5, -840, -600 )
	FeaturedSlot1:setTopBottom( 0.5, 0.5, -319, 191 )
	FeaturedSlot1:setWidgetType( CoD.BMTallItemContainer )
	FeaturedSlot1:setSpacing( 30 )
	FeaturedSlot1:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	FeaturedSlot1:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	FeaturedSlot1:setDataSource( "ItemShopSlot1List" )
	FeaturedSlot1:linkToElementModel( FeaturedSlot1, "movieName", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	FeaturedSlot1:appendEventHandler( "input_source_changed", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	local FeaturedLabel = FeaturedSlot1
	local SpecialOrdersBracket = FeaturedSlot1.subscribeToModel
	local FeaturedSlot2Timer = Engine.GetModelForController( f1_arg1 )
	SpecialOrdersBracket( FeaturedLabel, FeaturedSlot2Timer.LastInput, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	FeaturedSlot1:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f6_local0 = nil
		SetElementModelToFocusedElementModel( f1_arg1, self, element, "SupplyChainDetails" )
		CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_arg0, element, f1_arg1 )
		return f6_local0
	end )
	FeaturedSlot1:registerEventHandler( "occlusion_change", function ( element, event )
		local f7_local0 = nil
		if element.OcclusionChange then
			f7_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f7_local0 = element.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", false ) then
			CoD.BlackMarketUtility.TriggerItemShopRevealAnimation( f1_arg1, element )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	FeaturedSlot1:registerEventHandler( "gain_list_focus", function ( element, event )
		local f8_local0 = nil
		CoD.GridAndListUtility.DisableAutoScrolling( f1_arg1, self.FeaturedSlot1 )
		return f8_local0
	end )
	FeaturedSlot1:registerEventHandler( "lose_list_focus", function ( element, event )
		local f9_local0 = nil
		CoD.GridAndListUtility.ReEnableAutoScrolling( f1_arg1, self.FeaturedSlot1 )
		return f9_local0
	end )
	FeaturedSlot1:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		return f10_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot1, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		CoD.BlackMarketUtility.PlayItemShopSelectSound( f11_arg0, f11_arg2 )
		OpenOverlay( self, "ItemShopDetails", f11_arg2, {
			_model = f11_arg0:getModel()
		} )
		SetControllerModelValue( f11_arg2, "LootStreamProgress.playAnimation", false )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot1, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f13_arg0, f13_arg2, "movieName" ) and IsGamepad( f13_arg2 ) then
			SetControllerModelValue( f13_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f13_arg2, f13_arg0, "" )
			DelayOpenOverlay( f13_arg1, "VoDViewer", f13_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f14_arg0, f14_arg2, "movieName" ) and IsGamepad( f14_arg2 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x52FB29ED3A3CA79, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot1, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_remove", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f15_arg0, f15_arg2, "movieName" ) and IsMouseOrKeyboard( f15_arg2 ) then
			SetControllerModelValue( f15_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f15_arg2, f15_arg0, "" )
			DelayOpenOverlay( f15_arg1, "VoDViewer", f15_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f16_arg0, f16_arg2, "movieName" ) and IsMouseOrKeyboard( f16_arg2 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x52FB29ED3A3CA79, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot1, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "MWHEELDOWN", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not IsRepeatButtonPress( f17_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f17_arg0, f17_arg2, true )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot1, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MWHEELUP", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsRepeatButtonPress( f19_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f19_arg0, f19_arg2, false )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	FeaturedSlot1:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		local f21_local0 = FeaturedSlot1
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) then
			CoD.GridAndListUtility.UpdateDataSource( f21_local0, true, true, true )
		end
	end )
	FeaturedSlot1:AddContextualMenuAction( f1_arg0, f1_arg1, 0x52FB29ED3A3CA79, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f22_arg0, f22_arg2, "movieName" ) then
			return function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
				SetControllerModelValue( f23_arg2, "LootStreamProgress.playAnimation", false )
				CoD.VideoStreamingUtility.SetupVoDMovie( f23_arg2, f23_arg0, "" )
				DelayOpenOverlay( f23_arg1, "VoDViewer", f23_arg2, {
					fullscreen = true
				} )
			end
			
		else
			
		end
	end )
	self:addElement( FeaturedSlot1 )
	self.FeaturedSlot1 = FeaturedSlot1
	
	SpecialOrdersBracket = LUI.UIImage.new( 0.5, 0.5, -277, -27, 0.5, 0.5, -364, -356 )
	SpecialOrdersBracket:setRGB( 0.98, 1, 0.89 )
	SpecialOrdersBracket:setAlpha( 0.5 )
	SpecialOrdersBracket:setZRot( 180 )
	SpecialOrdersBracket:setImage( RegisterImage( 0xC325BED3F226657 ) )
	SpecialOrdersBracket:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFD777557404A7B3 ) )
	SpecialOrdersBracket:setShaderVector( 0, 0, 0, 0, 0 )
	SpecialOrdersBracket:setupNineSliceShader( 16, 4 )
	self:addElement( SpecialOrdersBracket )
	self.SpecialOrdersBracket = SpecialOrdersBracket
	
	FeaturedLabel = LUI.UIText.new( 0.5, 0.5, -845, -605, 0.5, 0.5, -388, -370 )
	FeaturedLabel:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	FeaturedLabel:setText( LocalizeToUpperString( 0xF29BEFC80072FF5 ) )
	FeaturedLabel:setTTF( "ttmussels_regular" )
	FeaturedLabel:setLetterSpacing( 4 )
	FeaturedLabel:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	FeaturedLabel:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( FeaturedLabel )
	self.FeaturedLabel = FeaturedLabel
	
	FeaturedSlot2Timer = CoD.ListLabel.new( f1_arg0, f1_arg1, 0.5, 0.5, -557, -316, 0.5, 0.5, -369, -319 )
	FeaturedSlot2Timer:subscribeToGlobalModel( f1_arg1, "ItemshopRotation", "loot_itemshop_slot2_timer", function ( model )
		local f24_local0 = model:get()
		if f24_local0 ~= nil then
			FeaturedSlot2Timer.TextBox2:setText( f24_local0 )
		end
	end )
	self:addElement( FeaturedSlot2Timer )
	self.FeaturedSlot2Timer = FeaturedSlot2Timer
	
	local FeaturedSlot2 = LUI.UIList.new( f1_arg0, f1_arg1, 30, 0, nil, true, false, false, false )
	FeaturedSlot2:setLeftRight( 0.5, 0.5, -556, -316 )
	FeaturedSlot2:setTopBottom( 0.5, 0.5, -319, 191 )
	FeaturedSlot2:setWidgetType( CoD.BMTallItemContainer )
	FeaturedSlot2:setSpacing( 30 )
	FeaturedSlot2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	FeaturedSlot2:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	FeaturedSlot2:setDataSource( "ItemShopSlot2List" )
	FeaturedSlot2:linkToElementModel( FeaturedSlot2, "movieName", true, function ( model, f25_arg1 )
		CoD.Menu.UpdateButtonShownState( f25_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f25_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	FeaturedSlot2:appendEventHandler( "input_source_changed", function ( f26_arg0, f26_arg1 )
		f26_arg1.menu = f26_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f26_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f26_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	local FeaturedItemsBracket = FeaturedSlot2
	local SpecialOrders = FeaturedSlot2.subscribeToModel
	local SpecialOrdersLabel = Engine.GetModelForController( f1_arg1 )
	SpecialOrders( FeaturedItemsBracket, SpecialOrdersLabel.LastInput, function ( f27_arg0, f27_arg1 )
		CoD.Menu.UpdateButtonShownState( f27_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f27_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	FeaturedSlot2:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f28_local0 = nil
		SetElementModelToFocusedElementModel( f1_arg1, self, element, "SupplyChainDetails" )
		CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_arg0, element, f1_arg1 )
		return f28_local0
	end )
	FeaturedSlot2:registerEventHandler( "occlusion_change", function ( element, event )
		local f29_local0 = nil
		if element.OcclusionChange then
			f29_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f29_local0 = element.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", false ) then
			CoD.BlackMarketUtility.TriggerItemShopRevealAnimation( f1_arg1, element )
		end
		if not f29_local0 then
			f29_local0 = element:dispatchEventToChildren( event )
		end
		return f29_local0
	end )
	FeaturedSlot2:registerEventHandler( "lose_list_focus", function ( element, event )
		local f30_local0 = nil
		CoD.GridAndListUtility.ReEnableAutoScrolling( f1_arg1, self.FeaturedSlot2 )
		return f30_local0
	end )
	FeaturedSlot2:registerEventHandler( "gain_list_focus", function ( element, event )
		local f31_local0 = nil
		CoD.GridAndListUtility.DisableAutoScrolling( f1_arg1, self.FeaturedSlot2 )
		return f31_local0
	end )
	FeaturedSlot2:registerEventHandler( "gain_focus", function ( element, event )
		local f32_local0 = nil
		if element.gainFocus then
			f32_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f32_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		return f32_local0
	end )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot2, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		CoD.BlackMarketUtility.PlayItemShopSelectSound( f33_arg0, f33_arg2 )
		OpenOverlay( self, "ItemShopDetails", f33_arg2, {
			_model = f33_arg0:getModel()
		} )
		SetControllerModelValue( f33_arg2, "LootStreamProgress.playAnimation", false )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot2, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f35_arg0, f35_arg2, "movieName" ) and IsGamepad( f35_arg2 ) then
			SetControllerModelValue( f35_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f35_arg2, f35_arg0, "" )
			DelayOpenOverlay( f35_arg1, "VoDViewer", f35_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f36_arg0, f36_arg2, "movieName" ) and IsGamepad( f36_arg2 ) then
			CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x52FB29ED3A3CA79, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot2, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_remove", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f37_arg0, f37_arg2, "movieName" ) and IsMouseOrKeyboard( f37_arg2 ) then
			SetControllerModelValue( f37_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f37_arg2, f37_arg0, "" )
			DelayOpenOverlay( f37_arg1, "VoDViewer", f37_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f38_arg0, f38_arg2, "movieName" ) and IsMouseOrKeyboard( f38_arg2 ) then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x52FB29ED3A3CA79, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot2, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "MWHEELDOWN", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if not IsRepeatButtonPress( f39_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f39_arg0, f39_arg2, true )
			return true
		else
			
		end
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( FeaturedSlot2, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MWHEELUP", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if not IsRepeatButtonPress( f41_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f41_arg0, f41_arg2, false )
			return true
		else
			
		end
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	FeaturedSlot2:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		local f43_local0 = FeaturedSlot2
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) then
			CoD.GridAndListUtility.UpdateDataSource( f43_local0, true, true, true )
		end
	end )
	FeaturedSlot2:AddContextualMenuAction( f1_arg0, f1_arg1, 0x52FB29ED3A3CA79, function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f44_arg0, f44_arg2, "movieName" ) then
			return function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
				SetControllerModelValue( f45_arg2, "LootStreamProgress.playAnimation", false )
				CoD.VideoStreamingUtility.SetupVoDMovie( f45_arg2, f45_arg0, "" )
				DelayOpenOverlay( f45_arg1, "VoDViewer", f45_arg2, {
					fullscreen = true
				} )
			end
			
		else
			
		end
	end )
	self:addElement( FeaturedSlot2 )
	self.FeaturedSlot2 = FeaturedSlot2
	
	SpecialOrders = LUI.UIList.new( f1_arg0, f1_arg1, 30, 0, nil, true, false, false, false )
	SpecialOrders:setLeftRight( 0.5, 0.5, -272, -32 )
	SpecialOrders:setTopBottom( 0.5, 0.5, -319, 191 )
	SpecialOrders:setWidgetType( CoD.BMTallItemContainer )
	SpecialOrders:setSpacing( 30 )
	SpecialOrders:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	SpecialOrders:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	SpecialOrders:setDataSource( "ItemShopSlot3List" )
	SpecialOrders:linkToElementModel( SpecialOrders, "movieName", true, function ( model, f46_arg1 )
		CoD.Menu.UpdateButtonShownState( f46_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f46_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	SpecialOrders:appendEventHandler( "input_source_changed", function ( f47_arg0, f47_arg1 )
		f47_arg1.menu = f47_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f47_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f47_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	SpecialOrdersLabel = SpecialOrders
	FeaturedItemsBracket = SpecialOrders.subscribeToModel
	local MyShopTimer = Engine.GetModelForController( f1_arg1 )
	FeaturedItemsBracket( SpecialOrdersLabel, MyShopTimer.LastInput, function ( f48_arg0, f48_arg1 )
		CoD.Menu.UpdateButtonShownState( f48_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f48_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	SpecialOrders:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f49_local0 = nil
		SetElementModelToFocusedElementModel( f1_arg1, self, element, "SupplyChainDetails" )
		CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_arg0, element, f1_arg1 )
		return f49_local0
	end )
	SpecialOrders:registerEventHandler( "occlusion_change", function ( element, event )
		local f50_local0 = nil
		if element.OcclusionChange then
			f50_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f50_local0 = element.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", false ) then
			CoD.BlackMarketUtility.TriggerItemShopRevealAnimation( f1_arg1, element )
		end
		if not f50_local0 then
			f50_local0 = element:dispatchEventToChildren( event )
		end
		return f50_local0
	end )
	SpecialOrders:registerEventHandler( "lose_list_focus", function ( element, event )
		local f51_local0 = nil
		CoD.GridAndListUtility.ReEnableAutoScrolling( f1_arg1, self.SpecialOrders )
		return f51_local0
	end )
	SpecialOrders:registerEventHandler( "gain_list_focus", function ( element, event )
		local f52_local0 = nil
		CoD.GridAndListUtility.DisableAutoScrolling( f1_arg1, self.SpecialOrders )
		return f52_local0
	end )
	SpecialOrders:registerEventHandler( "gain_focus", function ( element, event )
		local f53_local0 = nil
		if element.gainFocus then
			f53_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f53_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		return f53_local0
	end )
	f1_arg0:AddButtonCallbackFunction( SpecialOrders, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		CoD.BlackMarketUtility.PlayItemShopSelectSound( f54_arg0, f54_arg2 )
		SetControllerModelValue( f54_arg2, "LootStreamProgress.playAnimation", false )
		CoD.ContractUtility.OpenContractDetails( self, f54_arg0, f54_arg2 )
		return true
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( SpecialOrders, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f56_arg0, f56_arg2, "movieName" ) and IsGamepad( f56_arg2 ) then
			SetControllerModelValue( f56_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f56_arg2, f56_arg0, "" )
			DelayOpenOverlay( f56_arg1, "VoDViewer", f56_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f57_arg0, f57_arg1, f57_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f57_arg0, f57_arg2, "movieName" ) and IsGamepad( f57_arg2 ) then
			CoD.Menu.SetButtonLabel( f57_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x52FB29ED3A3CA79, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( SpecialOrders, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_remove", function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f58_arg0, f58_arg2, "movieName" ) and IsMouseOrKeyboard( f58_arg2 ) then
			SetControllerModelValue( f58_arg2, "LootStreamProgress.playAnimation", false )
			CoD.VideoStreamingUtility.SetupVoDMovie( f58_arg2, f58_arg0, "" )
			DelayOpenOverlay( f58_arg1, "VoDViewer", f58_arg2, {
				fullscreen = true
			} )
			return true
		else
			
		end
	end, function ( f59_arg0, f59_arg1, f59_arg2 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f59_arg0, f59_arg2, "movieName" ) and IsMouseOrKeyboard( f59_arg2 ) then
			CoD.Menu.SetButtonLabel( f59_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x52FB29ED3A3CA79, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( SpecialOrders, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "MWHEELDOWN", function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
		if not IsRepeatButtonPress( f60_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f60_arg0, f60_arg2, true )
			return true
		else
			
		end
	end, function ( f61_arg0, f61_arg1, f61_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f61_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( SpecialOrders, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MWHEELUP", function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
		if not IsRepeatButtonPress( f62_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f62_arg0, f62_arg2, false )
			return true
		else
			
		end
	end, function ( f63_arg0, f63_arg1, f63_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f63_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	SpecialOrders:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		local f64_local0 = SpecialOrders
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) then
			CoD.GridAndListUtility.UpdateDataSource( f64_local0, true, true, true )
		end
	end )
	SpecialOrders:AddContextualMenuAction( f1_arg0, f1_arg1, 0x52FB29ED3A3CA79, function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		if CoD.ModelUtility.IsSelfModelValueNonEmptyString( f65_arg0, f65_arg2, "movieName" ) then
			return function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
				SetControllerModelValue( f66_arg2, "LootStreamProgress.playAnimation", false )
				CoD.VideoStreamingUtility.SetupVoDMovie( f66_arg2, f66_arg0, "" )
				DelayOpenOverlay( f66_arg1, "VoDViewer", f66_arg2, {
					fullscreen = true
				} )
			end
			
		else
			
		end
	end )
	self:addElement( SpecialOrders )
	self.SpecialOrders = SpecialOrders
	
	FeaturedItemsBracket = LUI.UIImage.new( 0.5, 0.5, -846, -311, 0.5, 0.5, -364, -356 )
	FeaturedItemsBracket:setAlpha( 0.5 )
	FeaturedItemsBracket:setZRot( 180 )
	FeaturedItemsBracket:setImage( RegisterImage( 0xC325BED3F226657 ) )
	FeaturedItemsBracket:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFD777557404A7B3 ) )
	FeaturedItemsBracket:setShaderVector( 0, 0, 0, 0, 0 )
	FeaturedItemsBracket:setupNineSliceShader( 16, 4 )
	self:addElement( FeaturedItemsBracket )
	self.FeaturedItemsBracket = FeaturedItemsBracket
	
	SpecialOrdersLabel = LUI.UIText.new( 0.5, 0.5, -277, -36, 0.5, 0.5, -388, -370 )
	SpecialOrdersLabel:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	SpecialOrdersLabel:setText( LocalizeToUpperString( 0xD3C4B3D8C22E57C ) )
	SpecialOrdersLabel:setTTF( "ttmussels_regular" )
	SpecialOrdersLabel:setLetterSpacing( 4 )
	SpecialOrdersLabel:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	SpecialOrdersLabel:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	self:addElement( SpecialOrdersLabel )
	self.SpecialOrdersLabel = SpecialOrdersLabel
	
	MyShopTimer = CoD.ListLabel.new( f1_arg0, f1_arg1, 0.5, 0.5, 11, 253, 0.5, 0.5, -369, -319 )
	MyShopTimer:subscribeToGlobalModel( f1_arg1, "ItemshopRotation", "loot_itemshop_slot4_timer", function ( model )
		local f67_local0 = model:get()
		if f67_local0 ~= nil then
			MyShopTimer.TextBox2:setText( f67_local0 )
		end
	end )
	self:addElement( MyShopTimer )
	self.MyShopTimer = MyShopTimer
	
	local SpecialOrdersTimer = CoD.ListLabel.new( f1_arg0, f1_arg1, 0.5, 0.5, -273, -33, 0.5, 0.5, -369, -319 )
	SpecialOrdersTimer:subscribeToGlobalModel( f1_arg1, "ItemshopRotation", "loot_itemshop_slot3_timer", function ( model )
		local f68_local0 = model:get()
		if f68_local0 ~= nil then
			SpecialOrdersTimer.TextBox2:setText( f68_local0 )
		end
	end )
	self:addElement( SpecialOrdersTimer )
	self.SpecialOrdersTimer = SpecialOrdersTimer
	
	local MyShop = LUI.UIList.new( f1_arg0, f1_arg1, 30, 0, nil, true, false, false, false )
	MyShop:setLeftRight( 0.5, 0.5, 12, 252 )
	MyShop:setTopBottom( 0.5, 0.5, -319, 191 )
	MyShop:setWidgetType( CoD.BMTallItemContainer )
	MyShop:setSpacing( 30 )
	MyShop:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	MyShop:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	MyShop:setDataSource( "MyShopItemList" )
	MyShop:linkToElementModel( MyShop, "lootType", true, function ( model, f69_arg1 )
		CoD.Menu.UpdateButtonShownState( f69_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	MyShop:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f70_local0 = nil
		CoD.PlayerRoleUtility.StopGesturePreview( f1_arg0, f1_arg1 )
		return f70_local0
	end )
	MyShop:registerEventHandler( "occlusion_change", function ( element, event )
		local f71_local0 = nil
		if element.OcclusionChange then
			f71_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f71_local0 = element.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", false ) then
			CoD.BlackMarketUtility.TriggerItemShopRevealAnimation( f1_arg1, element )
			CoD.GridAndListUtility.UpdateDataSource( element, true, true, true )
		end
		if not f71_local0 then
			f71_local0 = element:dispatchEventToChildren( event )
		end
		return f71_local0
	end )
	MyShop:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f72_local0 = nil
		if not IsListElementChildInState( element, "BMTallItem", "MysteryItem" ) then
			SetElementModelToFocusedElementModel( f1_arg1, self, element, "SupplyChainDetails" )
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_arg0, element, f1_arg1 )
		end
		return f72_local0
	end )
	MyShop:registerEventHandler( "gain_focus", function ( element, event )
		local f73_local0 = nil
		if element.gainFocus then
			f73_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f73_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		return f73_local0
	end )
	f1_arg0:AddButtonCallbackFunction( MyShop, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f74_arg0, f74_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) and IsListElementChildInState( f74_arg0, "BMTallItem", "DefaultState" ) then
			CoD.BlackMarketUtility.PlayItemShopSelectSound( f74_arg0, f74_arg2 )
			SetControllerModelValue( f74_arg2, "LootStreamProgress.playAnimation", false )
			OpenOverlay( self, "ItemShopDetails", f74_arg2, {
				_model = f74_arg0:getModel()
			} )
			return true
		elseif IsListElementChildInState( f74_arg0, "BMTallItem", "MysteryItem" ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.RevealMyShopItem( f74_arg2, self.MyShop )
			return true
		elseif IsListElementChildInState( f74_arg0, "BMTallItem", "DefaultState" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f74_arg0, f74_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) then
			PlaySoundAlias( "uin_toggle_generic" )
			SetControllerModelValue( f74_arg2, "LootStreamProgress.playAnimation", false )
			CoD.ContractUtility.OpenContractDetails( self, f74_arg0, f74_arg2 )
			return true
		else
			
		end
	end, function ( f75_arg0, f75_arg1, f75_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f75_arg0, f75_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) and IsListElementChildInState( f75_arg0, "BMTallItem", "DefaultState" ) then
			CoD.Menu.SetButtonLabel( f75_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		elseif IsListElementChildInState( f75_arg0, "BMTallItem", "MysteryItem" ) then
			CoD.Menu.SetButtonLabel( f75_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		elseif IsListElementChildInState( f75_arg0, "BMTallItem", "DefaultState" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f75_arg0, f75_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) then
			CoD.Menu.SetButtonLabel( f75_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MyShop, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "MWHEELDOWN", function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
		if not IsRepeatButtonPress( f76_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f76_arg0, f76_arg2, true )
			return true
		else
			
		end
	end, function ( f77_arg0, f77_arg1, f77_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f77_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "MWHEELDOWN" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( MyShop, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MWHEELUP", function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3 )
		if not IsRepeatButtonPress( f78_arg3 ) then
			CoD.GridAndListUtility.NavigateGridItemOnParentGridOrList( f78_arg0, f78_arg2, false )
			return true
		else
			
		end
	end, function ( f79_arg0, f79_arg1, f79_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f79_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MWHEELUP" )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( MyShop, "updateDataSource", function ( element, controller, f80_arg2, f80_arg3 )
		if CoD.BlackMarketUtility.IsShopListInFocus( f1_arg1, element ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "lootType", LuaEnum.LOOT_TYPE.EMPTY ) then
			SetAlpha( self.MyShopTimer, 0 )
		elseif CoD.BlackMarketUtility.IsShopListInFocus( f1_arg1, element ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "lootType", LuaEnum.LOOT_TYPE.EMPTY ) then
			CoD.BlackMarketUtility.AutoPlayGestureIfApplicable( f1_arg0, element, f1_arg1 )
			SetAlpha( self.MyShopTimer, 1 )
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "lootType", LuaEnum.LOOT_TYPE.EMPTY ) then
			SetAlpha( self.MyShopTimer, 0 )
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "lootType", LuaEnum.LOOT_TYPE.EMPTY ) then
			SetAlpha( self.MyShopTimer, 1 )
		end
	end )
	MyShop:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ItemshopRotation.cycled", function ( model )
		local f81_local0 = MyShop
		if CoD.ModelUtility.IsGlobalModelValueTrue( "ItemshopRotation.cycled" ) then
			CoD.GridAndListUtility.UpdateDataSource( f81_local0, true, true, true )
		end
	end )
	self:addElement( MyShop )
	self.MyShop = MyShop
	
	local MyShopLabel = LUI.UIText.new( 0.5, 0.5, 7, 247, 0.5, 0.5, -388, -370 )
	MyShopLabel:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	MyShopLabel:setText( LocalizeToUpperString( 0x5DAEFC4C9B0A8FA ) )
	MyShopLabel:setTTF( "ttmussels_regular" )
	MyShopLabel:setLetterSpacing( 4 )
	MyShopLabel:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	MyShopLabel:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	self:addElement( MyShopLabel )
	self.MyShopLabel = MyShopLabel
	
	local TransactionDeepLinkButton = nil
	
	TransactionDeepLinkButton = CoD.DirectorPreGameButton.new( f1_arg0, f1_arg1, 0.5, 0.5, -840, -610, 0, 0, 748, 818 )
	TransactionDeepLinkButton.DirectorCustomStartButton.MiddleText:setText( LocalizeToUpperString( 0x4031C820A02E7BA ) )
	TransactionDeepLinkButton.DirectorCustomStartButton.MiddleTextFocus:setText( LocalizeToUpperString( 0x4031C820A02E7BA ) )
	TransactionDeepLinkButton:registerEventHandler( "gain_focus", function ( element, event )
		local f82_local0 = nil
		if element.gainFocus then
			f82_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f82_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f82_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TransactionDeepLinkButton, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "ui_confirm", function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
		if IsPC() and CoD.PCKoreaUtility.IsInKorea() then
			CoD.PCKoreaUtility.OpenTransactionsDeepLinkBlackmarket( f83_arg2 )
			return true
		else
			
		end
	end, function ( f84_arg0, f84_arg1, f84_arg2 )
		if IsPC() and CoD.PCKoreaUtility.IsInKorea() then
			CoD.Menu.SetButtonLabel( f84_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "ui_confirm" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( TransactionDeepLinkButton, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
		if IsPC() and CoD.PCKoreaUtility.IsInKorea() then
			CoD.PCKoreaUtility.OpenTransactionsDeepLinkBlackmarket( f85_arg2 )
			return true
		else
			
		end
	end, function ( f86_arg0, f86_arg1, f86_arg2 )
		if IsPC() and CoD.PCKoreaUtility.IsInKorea() then
			CoD.Menu.SetButtonLabel( f86_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( TransactionDeepLinkButton )
	self.TransactionDeepLinkButton = TransactionDeepLinkButton
	
	local MyShopBracket = LUI.UIImage.new( 0.5, 0.5, 7, 257, 0.5, 0.5, -364, -356 )
	MyShopBracket:setAlpha( 0.5 )
	MyShopBracket:setZRot( 180 )
	MyShopBracket:setImage( RegisterImage( 0xC325BED3F226657 ) )
	MyShopBracket:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFD777557404A7B3 ) )
	MyShopBracket:setShaderVector( 0, 0, 0, 0, 0 )
	MyShopBracket:setupNineSliceShader( 16, 4 )
	self:addElement( MyShopBracket )
	self.MyShopBracket = MyShopBracket
	
	local DiscountTiersWidget = CoD.DiscountTiersContainer.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	DiscountTiersWidget:registerEventHandler( "gain_list_focus", function ( element, event )
		local f87_local0 = nil
		SetElementState( self, self.DiscountTiersWidget, f1_arg1, "DefaultState" )
		return f87_local0
	end )
	DiscountTiersWidget:registerEventHandler( "lose_list_focus", function ( element, event )
		local f88_local0 = nil
		UpdateElementState( self, "DiscountTiersWidget", f1_arg1 )
		return f88_local0
	end )
	DiscountTiersWidget:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f89_local0 = nil
		CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_arg0, f1_arg1, element )
		return f89_local0
	end )
	self:addElement( DiscountTiersWidget )
	self.DiscountTiersWidget = DiscountTiersWidget
	
	self:mergeStateConditions( {
		{
			stateName = "KBM",
			condition = function ( menu, element, event )
				return IsPC() and IsMouseOrKeyboard( f1_arg1 )
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f91_arg0, f91_arg1 )
		f91_arg1.menu = f91_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f91_arg1 )
	end )
	local f1_local18 = self
	local f1_local19 = self.subscribeToModel
	local f1_local20 = Engine.GetModelForController( f1_arg1 )
	f1_local19( f1_local18, f1_local20.LastInput, function ( f92_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f92_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "RefreshDWInventoryMenu", function ( model )
		local f93_local0 = self
		if not CoD.BlackMarketUtility.IsMenuOccluded( f1_arg0 ) then
			UpdateDataSource( self, self.MyShop, f1_arg1 )
			UpdateDataSource( self, self.FeaturedSlot1, f1_arg1 )
			UpdateDataSource( self, self.SpecialOrders, f1_arg1 )
			UpdateDataSource( self, self.FeaturedSlot2, f1_arg1 )
		end
	end )
	FeaturedSlot1.id = "FeaturedSlot1"
	FeaturedSlot2.id = "FeaturedSlot2"
	SpecialOrders.id = "SpecialOrders"
	MyShop.id = "MyShop"
	if CoD.isPC then
		TransactionDeepLinkButton.id = "TransactionDeepLinkButton"
	end
	DiscountTiersWidget.id = "DiscountTiersWidget"
	self.__defaultFocus = SpecialOrders
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local19 = self
	SendClientScriptMenuChangeNotifyWithState( f1_arg1, f1_arg0, true, "character" )
	SetMenuProperty( f1_arg0, "__hideSupplyChainDetailsButtons", true )
	CoD.BlackMarketUtility.ForceStreamStoreImages( f1_arg1 )
	CoD.BlackMarketUtility.TriggerGreetingVO( self, f1_arg1 )
	CoD.BlackMarketUtility.SetupBlackJackFrameContextualMenus( self, f1_arg1 )
	CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_arg0, f1_arg1, f1_local19 )
	f1_local19 = FeaturedSlot1
	CoD.BaseUtility.DisableNavigation( f1_local19 )
	SetElementProperty( f1_local19, "__loopOnSameRow", true )
	SetElementProperty( f1_local19, "__allowCreateOnLoop", true )
	CoD.BlackMarketUtility.InitialHideScrollPrompts( self, f1_arg1, f1_local19 )
	CoD.BlackMarketUtility.ShopCycleThroughItems( f1_arg0, f1_arg1, f1_local19, 0.5 )
	f1_local19 = FeaturedSlot2
	CoD.BaseUtility.DisableNavigation( f1_local19 )
	SetElementProperty( f1_local19, "__loopOnSameRow", true )
	SetElementProperty( f1_local19, "__allowCreateOnLoop", true )
	CoD.BlackMarketUtility.InitialHideScrollPrompts( self, f1_arg1, f1_local19 )
	CoD.BlackMarketUtility.ShopCycleThroughItems( f1_arg0, f1_arg1, f1_local19, 0.5 )
	f1_local19 = SpecialOrders
	CoD.BaseUtility.DisableNavigation( f1_local19 )
	SetElementProperty( f1_local19, "__loopOnSameRow", true )
	SetElementProperty( f1_local19, "__allowCreateOnLoop", true )
	CoD.BlackMarketUtility.InitialHideScrollPrompts( self, f1_arg1, f1_local19 )
	CoD.BlackMarketUtility.ShopCycleThroughItems( f1_arg0, f1_arg1, f1_local19, 0.5 )
	f1_local19 = MyShop
	CoD.BaseUtility.DisableNavigation( f1_local19 )
	SetElementProperty( f1_local19, "__loopOnSameRow", true )
	SetElementProperty( f1_local19, "__allowCreateOnLoop", true )
	CoD.BlackMarketUtility.InitialHideScrollPrompts( self, f1_arg1, f1_local19 )
	f1_local19 = TransactionDeepLinkButton
	if IsPC() and not CoD.PCKoreaUtility.ShowTransactionHistoryButton() then
		ReplaceElementWithFake( self, "TransactionDeepLinkButton" )
	end
	return self
end

CoD.BlackJacksShopFrameNoPreview.__resetProperties = function ( f94_arg0 )
	f94_arg0.MyShop:completeAnimation()
	f94_arg0.SpecialOrders:completeAnimation()
	f94_arg0.FeaturedSlot2:completeAnimation()
	f94_arg0.FeaturedSlot1:completeAnimation()
	f94_arg0.MyShop:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	f94_arg0.SpecialOrders:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	f94_arg0.FeaturedSlot2:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
	f94_arg0.FeaturedSlot1:setHorizontalCounter( CoD.horizontalCounterTriggerPrompts )
end

CoD.BlackJacksShopFrameNoPreview.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f95_arg0, f95_arg1 )
			f95_arg0:__resetProperties()
			f95_arg0:setupElementClipCounter( 0 )
		end
	},
	KBM = {
		DefaultClip = function ( f96_arg0, f96_arg1 )
			f96_arg0:__resetProperties()
			f96_arg0:setupElementClipCounter( 4 )
			f96_arg0.FeaturedSlot1:completeAnimation()
			f96_arg0.FeaturedSlot1:setHorizontalCounter( CoD.horizontalCounter )
			f96_arg0.clipFinished( f96_arg0.FeaturedSlot1 )
			f96_arg0.FeaturedSlot2:completeAnimation()
			f96_arg0.FeaturedSlot2:setHorizontalCounter( CoD.horizontalCounter )
			f96_arg0.clipFinished( f96_arg0.FeaturedSlot2 )
			f96_arg0.SpecialOrders:completeAnimation()
			f96_arg0.SpecialOrders:setHorizontalCounter( CoD.horizontalCounter )
			f96_arg0.clipFinished( f96_arg0.SpecialOrders )
			f96_arg0.MyShop:completeAnimation()
			f96_arg0.MyShop:setHorizontalCounter( CoD.horizontalCounter )
			f96_arg0.clipFinished( f96_arg0.MyShop )
		end
	}
}
CoD.BlackJacksShopFrameNoPreview.__onClose = function ( f97_arg0 )
	f97_arg0.FeaturedSlot1Timer:close()
	f97_arg0.FeaturedSlot1:close()
	f97_arg0.FeaturedSlot2Timer:close()
	f97_arg0.FeaturedSlot2:close()
	f97_arg0.SpecialOrders:close()
	f97_arg0.MyShopTimer:close()
	f97_arg0.SpecialOrdersTimer:close()
	f97_arg0.MyShop:close()
	f97_arg0.TransactionDeepLinkButton:close()
	f97_arg0.DiscountTiersWidget:close()
end

