require( "ui/uieditor/widgets/aar_t8/arena/aarladdertab" )
require( "ui/uieditor/widgets/aar_t8/contracts/aarcontractstab" )
require( "ui/uieditor/widgets/aar_t8/medals/aarmedalstab" )
require( "ui/uieditor/widgets/aar_t8/rewards/aarrewardstab" )
require( "ui/uieditor/widgets/aar_t8/scoreboard/aarscoreboardtab" )
require( "ui/uieditor/widgets/aar_t8/scoreboard/aarscoreboardtabbutton" )
require( "ui/uieditor/widgets/aar_t8/summary/aarsummarytab" )
require( "ui/uieditor/widgets/common/commonheader" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "ui/uieditor/widgets/header/header_container_frontend" )
require( "ui/uieditor/widgets/notifications/publiclobbystagenotification/stagenotificationcontainer" )
require( "ui/uieditor/widgets/notifications/xp/aardoublexpnotification" )
require( "x64:6ee653ade3452f5" )

CoD.AAR_T8_Arena = InheritFrom( CoD.Menu )
LUI.createMenu.AAR_T8_Arena = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "AAR_T8_Arena", f1_arg0 )
	local f1_local1 = self
	CoD.AARUtility.InitAARModels( f1_arg0 )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	self:setClass( CoD.AAR_T8_Arena )
	self.soundSet = "CAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local ScorestreakAspectRatioFix = nil
	
	ScorestreakAspectRatioFix = CoD.Scorestreak_AspectRatioFix.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	ScorestreakAspectRatioFix:mergeStateConditions( {
		{
			stateName = "Warzone",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ScorestreakAspectRatioFix )
	self.ScorestreakAspectRatioFix = ScorestreakAspectRatioFix
	
	local AARSummaryTab = CoD.AARSummaryTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -447, 453 )
	AARSummaryTab:subscribeToGlobalModel( f1_arg0, "AARSummaryStats", nil, function ( model )
		AARSummaryTab:setModel( model, f1_arg0 )
	end )
	self:addElement( AARSummaryTab )
	self.AARSummaryTab = AARSummaryTab
	
	local AARContractsTab = CoD.AARContractsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -450, 450 )
	self:addElement( AARContractsTab )
	self.AARContractsTab = AARContractsTab
	
	local AARRewardsTab = CoD.AARRewardsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	self:addElement( AARRewardsTab )
	self.AARRewardsTab = AARRewardsTab
	
	local AARMedalsTab = CoD.AARMedalsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -445, 455 )
	self:addElement( AARMedalsTab )
	self.AARMedalsTab = AARMedalsTab
	
	local AARScoreboardTab = CoD.AARScoreboardTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -445, 355 )
	AARScoreboardTab:subscribeToGlobalModel( f1_arg0, "AARScoreboard", nil, function ( model )
		AARScoreboardTab:setModel( model, f1_arg0 )
	end )
	self:addElement( AARScoreboardTab )
	self.AARScoreboardTab = AARScoreboardTab
	
	local AARLadderTab = CoD.AARLadderTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -446, 454 )
	AARLadderTab:subscribeToGlobalModel( f1_arg0, "AARLadderStats", nil, function ( model )
		AARLadderTab:setModel( model, f1_arg0 )
	end )
	self:addElement( AARLadderTab )
	self.AARLadderTab = AARLadderTab
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		if element.menuLoaded then
			f6_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f6_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local StageNotificationContainer = CoD.StageNotificationContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 120 )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "MapVote", "mapVoteGameModeNext", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.StageTitle:setText( CoD.GameTypeUtility.GameTypeToLocalizeToUpperName( f7_local0 ) )
		end
	end )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "publicLobby.stageDetails", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.subtitle:setText( ConvertToUpperString( CoD.BaseUtility.AlreadyLocalized( f8_local0 ) ) )
		end
	end )
	StageNotificationContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		if element.menuLoaded then
			f9_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f9_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( StageNotificationContainer )
	self.StageNotificationContainer = StageNotificationContainer
	
	local CommonHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 67 )
	CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xEEF90B1483C4C23 ) )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f10_local0 ) )
		end
	end )
	CommonHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		if element.menuLoaded then
			f11_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f11_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	local ScoreboardTab = CoD.AARScoreboardTabButton.new( f1_local1, f1_arg0, 0.5, 0.5, -339, 339, 0, 0, 4, 38 )
	ScoreboardTab:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( ScoreboardTab )
	self.ScoreboardTab = ScoreboardTab
	
	local TopBar = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 42 )
	TopBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		if element.menuLoaded then
			f13_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f13_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	self:addElement( TopBar )
	self.TopBar = TopBar
	
	local DoubleXPNotification = CoD.AARDoubleXPNotification.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 0, 1080 )
	DoubleXPNotification:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualToEnum( f1_arg0, "AAR.activeTab", CoD.AARUtility.AARTabs.AAR_SUMMARY )
			end
		}
	} )
	local f1_local15 = DoubleXPNotification
	local f1_local16 = DoubleXPNotification.subscribeToModel
	local f1_local17 = Engine.GetModelForController( f1_arg0 )
	f1_local16( f1_local15, f1_local17["AAR.activeTab"], function ( f15_arg0 )
		f1_local1:updateElementState( DoubleXPNotification, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f15_arg0:get(),
			modelName = "AAR.activeTab"
		} )
	end, false )
	self:addElement( DoubleXPNotification )
	self.DoubleXPNotification = DoubleXPNotification
	
	self:mergeStateConditions( {
		{
			stateName = "Offline",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetGlobalModel()
	f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyNav"], function ( f17_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f17_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetGlobalModel()
	f1_local16( f1_local15, f1_local17["lobbyRoot.lobbyNav"], function ( f18_arg0, f18_arg1 )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ui_confirm", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f19_arg1, f19_arg2 )
			MenuUnhideFreeCursor( f19_arg1, f19_arg2 )
			return true
		elseif IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f19_arg1, f19_arg2 )
			MenuUnhideFreeCursor( f19_arg1, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0xE4E038F4690D38D, nil, "ui_confirm" )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ESCAPE", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f21_arg1, f21_arg2 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ESCAPE" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "ui_contextual_1", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( f23_arg2 ) then
			FileshareBookmarkRecentGame( f23_arg2 )
			UpdateButtonPromptState( f23_arg1, f23_arg0, f23_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x941662A2E0BF65E, nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		local f25_local0 = self
		CoD.AARUtility.OpenAAROverlays( f25_arg2, f25_arg1 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "AAR.activeTab", function ( model )
		local f27_local0 = self
		CoD.AARUtility.UpdateAARScene( f1_local1, f1_arg0 )
	end )
	AARSummaryTab.id = "AARSummaryTab"
	AARContractsTab.id = "AARContractsTab"
	AARRewardsTab.id = "AARRewardsTab"
	AARMedalsTab.id = "AARMedalsTab"
	AARScoreboardTab.id = "AARScoreboardTab"
	AARLadderTab.id = "AARLadderTab"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	ScoreboardTab.id = "ScoreboardTab"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = AARSummaryTab
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local16 = self
	CoD.AARUtility.AARFirstTimeOpenActions( self, f1_arg0, f1_local1 )
	CoD.AARUtility.AnimateCurrentLevelProgress( f1_local1, f1_arg0 )
	f1_local16 = DoubleXPNotification
	if not IsPC() then
		SizeToSafeArea( f1_local16, f1_arg0 )
	end
	return self
end

CoD.AAR_T8_Arena.__resetProperties = function ( f29_arg0 )
	f29_arg0.CommonHeader:completeAnimation()
	f29_arg0.StageNotificationContainer:completeAnimation()
	f29_arg0.CommonHeader:setAlpha( 1 )
	f29_arg0.StageNotificationContainer:setAlpha( 1 )
end

CoD.AAR_T8_Arena.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 2 )
			f30_arg0.StageNotificationContainer:completeAnimation()
			f30_arg0.StageNotificationContainer:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.StageNotificationContainer )
			f30_arg0.CommonHeader:completeAnimation()
			f30_arg0.CommonHeader:setAlpha( 1 )
			f30_arg0.clipFinished( f30_arg0.CommonHeader )
		end
	},
	Offline = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 1 )
			f31_arg0.StageNotificationContainer:completeAnimation()
			f31_arg0.StageNotificationContainer:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.StageNotificationContainer )
		end
	}
}
CoD.AAR_T8_Arena.__onClose = function ( f32_arg0 )
	f32_arg0.__on_close_removeOverrides()
	f32_arg0.ScorestreakAspectRatioFix:close()
	f32_arg0.AARSummaryTab:close()
	f32_arg0.AARContractsTab:close()
	f32_arg0.AARRewardsTab:close()
	f32_arg0.AARMedalsTab:close()
	f32_arg0.AARScoreboardTab:close()
	f32_arg0.AARLadderTab:close()
	f32_arg0.FooterContainerFrontendRight:close()
	f32_arg0.StageNotificationContainer:close()
	f32_arg0.CommonHeader:close()
	f32_arg0.ScoreboardTab:close()
	f32_arg0.TopBar:close()
	f32_arg0.DoubleXPNotification:close()
end

