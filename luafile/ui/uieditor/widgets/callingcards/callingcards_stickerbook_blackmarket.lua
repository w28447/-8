require( "ui/uieditor/widgets/callingcards/callingcards_blackmarket_cardwidget" )
require( "ui/uieditor/widgets/callingcards/callingcards_blackmarket_profiler" )
require( "ui/uieditor/widgets/challenges/challenges_framewidget_titlebackground" )
require( "ui/uieditor/widgets/playercard/selfidentitybadgepreview" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )

CoD.CallingCards_Stickerbook_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Stickerbook_BlackMarket.__defaultWidth = 1725
CoD.CallingCards_Stickerbook_BlackMarket.__defaultHeight = 780
CoD.CallingCards_Stickerbook_BlackMarket.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "hudItems.evalEquippedCard", 0 )
	self:setClass( CoD.CallingCards_Stickerbook_BlackMarket )
	self.id = "CallingCards_Stickerbook_BlackMarket"
	self.soundSet = "ChooseDecal"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardGrid = LUI.UIList.new( f1_arg0, f1_arg1, 15, 0, nil, true, false, false, false )
	CallingCardGrid:setLeftRight( 0, 0, 15, 1125 )
	CallingCardGrid:setTopBottom( 0, 0, 24, 744 )
	CallingCardGrid:setWidgetType( CoD.CallingCards_BlackMarket_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 7 )
	CallingCardGrid:setSpacing( 15 )
	CallingCardGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	CallingCardGrid:setVerticalCounter( CoD.verticalCounter )
	CallingCardGrid:setDataSource( "CallingCardsBlackMarket" )
	CallingCardGrid:linkToElementModel( CallingCardGrid, "owned", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	CallingCardGrid:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f3_local0 = nil
		CoD.BreadcrumbUtility.SetCallingCardsAsOld( f1_arg0, element, f1_arg1 )
		return f3_local0
	end )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f4_local0
	end )
	f1_arg0:AddButtonCallbackFunction( CallingCardGrid, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f5_arg0, f5_arg2, "owned" ) then
			CallingCards_SetPlayerBackground( f5_arg1, f5_arg0, f5_arg2 )
			PlaySoundSetSound( self, "action" )
			ForceNotifyModel( f5_arg2, "hudItems.evalEquippedCard" )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f6_arg0, f6_arg2, "owned" ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local TitleBG = CoD.Challenges_FrameWidget_TitleBackground.new( f1_arg0, f1_arg1, 0, 0, 1177, 1710, 0, 0, 1, 645 )
	TitleBG.HeaderStripeBot:setAlpha( 0.5 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local CallingCardsBlackMarketProfiler = CoD.CallingCards_BlackMarket_Profiler.new( f1_arg0, f1_arg1, 0, 0, 1181, 1706, 0, 0.79, 20, 20 )
	self:addElement( CallingCardsBlackMarketProfiler )
	self.CallingCardsBlackMarketProfiler = CallingCardsBlackMarketProfiler
	
	local SelfIdentityBadgePreview = CoD.SelfIdentityBadgePreview.new( f1_arg0, f1_arg1, 0, 0, 1181, 1705, 0, 0, 654, 744 )
	self:addElement( SelfIdentityBadgePreview )
	self.SelfIdentityBadgePreview = SelfIdentityBadgePreview
	
	CallingCardsBlackMarketProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		CallingCardsBlackMarketProfiler:setModel( model, f1_arg1 )
	end )
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

CoD.CallingCards_Stickerbook_BlackMarket.__onClose = function ( f8_arg0 )
	f8_arg0.CallingCardsBlackMarketProfiler:close()
	f8_arg0.CallingCardGrid:close()
	f8_arg0.TitleBG:close()
	f8_arg0.SelfIdentityBadgePreview:close()
end

