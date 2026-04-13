require( "ui/uieditor/widgets/callingcards/callingcards_blackmarket_profiler" )
require( "ui/uieditor/widgets/callingcards/callingcards_blackmarketmastercardwidget" )
require( "ui/uieditor/widgets/callingcards/callingcardsset_blackmarketwidget" )
require( "ui/uieditor/widgets/challenges/challenges_framewidget_titlebackground" )
require( "ui/uieditor/widgets/playercard/selfidentitybadgepreview" )

CoD.CallingCards_Stickerbook_Set_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_Set_BlackMarket.__defaultWidth = 1725
CoD.CallingCards_Stickerbook_Set_BlackMarket.__defaultHeight = 780
CoD.CallingCards_Stickerbook_Set_BlackMarket.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "hudItems.evalEquippedCard", 0 )
	self:setClass( CoD.CallingCards_Stickerbook_Set_BlackMarket )
	self.id = "CallingCards_Stickerbook_Set_BlackMarket"
	self.soundSet = "ChooseDecal"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCallingCardWidget = CoD.CallingCards_BlackMarketMasterCardWidget.new( f1_arg0, f1_arg1, 0, 0, 15, 1140, 1, 1, -129.5, -29.5 )
	MasterCallingCardWidget:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsJapaneseSku()
			end
		}
	} )
	MasterCallingCardWidget:subscribeToGlobalModel( f1_arg1, "CallingCardsBlackMarketMasterCard", nil, function ( model )
		MasterCallingCardWidget:setModel( model, f1_arg1 )
	end )
	MasterCallingCardWidget:linkToElementModel( MasterCallingCardWidget, "owned", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	MasterCallingCardWidget:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f5_local0
	end )
	f1_arg0:AddButtonCallbackFunction( MasterCallingCardWidget, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f6_arg0, f6_arg2, "owned" ) then
			CallingCards_SetPlayerBackground( f6_arg1, f6_arg0, f6_arg2 )
			PlaySoundSetSound( self, "action" )
			ForceNotifyModel( f6_arg2, "hudItems.evalEquippedCard" )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f7_arg0, f7_arg2, "owned" ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( MasterCallingCardWidget, "childFocusGained", function ( element )
		SetElementModelToFocusedElementModel( f1_arg1, self, element, "CallingCardsBlackMarketProfiler" )
	end )
	self:addElement( MasterCallingCardWidget )
	self.MasterCallingCardWidget = MasterCallingCardWidget
	
	local CallingCardGrid = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, true, false, false, false )
	CallingCardGrid:setLeftRight( 0, 0, 15, 1135 )
	CallingCardGrid:setTopBottom( 0, 0, 24, 588 )
	CallingCardGrid:setWidgetType( CoD.CallingCardsSet_BlackMarketWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 20 )
	CallingCardGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarketCardSet" )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "owned", true, function ( model, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	CallingCardGrid:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		SetElementModelToFocusedElementModel( f1_arg1, self, element, "CallingCardsBlackMarketProfiler" )
		return f10_local0
	end )
	CallingCardGrid:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f11_local0 = nil
		CoD.BreadcrumbUtility.SetCallingCardsAsOld( f1_arg0, element, f1_arg1 )
		return f11_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f12_local0
	end )
	f1_arg0:AddButtonCallbackFunction( CallingCardGrid, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f13_arg0, f13_arg2, "owned" ) then
			CallingCards_SetPlayerBackground( f13_arg1, f13_arg0, f13_arg2 )
			PlaySoundSetSound( self, "action" )
			ForceNotifyModel( f13_arg2, "hudItems.evalEquippedCard" )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f14_arg0, f14_arg2, "owned" ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local TitleBG = CoD.Challenges_FrameWidget_TitleBackground.new( f1_arg0, f1_arg1, 0, 0, 1177, 1710, 0, 0, 1, 608 )
	TitleBG.HeaderStripeBot:setAlpha( 0.5 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local CallingCardsBlackMarketProfiler = CoD.CallingCards_BlackMarket_Profiler.new( f1_arg0, f1_arg1, 0, 0, 1181, 1706, 0, 0.75, 20, 20 )
	self:addElement( CallingCardsBlackMarketProfiler )
	self.CallingCardsBlackMarketProfiler = CallingCardsBlackMarketProfiler
	
	local SelfIdentityBadgePreview = CoD.SelfIdentityBadgePreview.new( f1_arg0, f1_arg1, 0, 0, 1181, 1706, 0, 0, 655.5, 745.5 )
	self:addElement( SelfIdentityBadgePreview )
	self.SelfIdentityBadgePreview = SelfIdentityBadgePreview
	
	CallingCardsBlackMarketProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardsBlackMarketProfiler:setModel( model, f1_arg1 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearMenuSavedState( f1_arg0 )
	end )
	MasterCallingCardWidget.id = "MasterCallingCardWidget"
	CallingCardGrid.id = "CallingCardGrid"
	CallingCardsBlackMarketProfiler.id = "CallingCardsBlackMarketProfiler"
	SelfIdentityBadgePreview.id = "SelfIdentityBadgePreview"
	self.__defaultFocus = CallingCardGrid
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.CallingCards_Stickerbook_Set_BlackMarket.__onClose = function ( f17_arg0 )
	f17_arg0.CallingCardsBlackMarketProfiler:close()
	f17_arg0.MasterCallingCardWidget:close()
	f17_arg0.CallingCardGrid:close()
	f17_arg0.TitleBG:close()
	f17_arg0.SelfIdentityBadgePreview:close()
end

