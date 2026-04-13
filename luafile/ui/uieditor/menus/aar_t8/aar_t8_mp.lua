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

CoD.AAR_T8_MP = InheritFrom( CoD.Menu )
LUI.createMenu.AAR_T8_MP = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "AAR_T8_MP", f1_arg0 )
	local f1_local1 = self
	CoD.AARUtility.InitAARModels( f1_arg0 )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	self:setClass( CoD.AAR_T8_MP )
	self.soundSet = "CAC"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, -0.1, 1, 0, 0 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local AARSummaryTab = CoD.AARSummaryTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	AARSummaryTab:subscribeToGlobalModel( f1_arg0, "AARSummaryStats", nil, function ( model )
		AARSummaryTab:setModel( model, f1_arg0 )
	end )
	self:addElement( AARSummaryTab )
	self.AARSummaryTab = AARSummaryTab
	
	local AARContractsTab = CoD.AARContractsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -450, 450 )
	self:addElement( AARContractsTab )
	self.AARContractsTab = AARContractsTab
	
	local AARMedalsTab = CoD.AARMedalsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -440, 460 )
	self:addElement( AARMedalsTab )
	self.AARMedalsTab = AARMedalsTab
	
	local AARRewardsTab = CoD.AARRewardsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -442, 458 )
	self:addElement( AARRewardsTab )
	self.AARRewardsTab = AARRewardsTab
	
	local AARScoreboardTab = CoD.AARScoreboardTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -450, 350 )
	AARScoreboardTab:subscribeToGlobalModel( f1_arg0, "AARScoreboard", nil, function ( model )
		AARScoreboardTab:setModel( model, f1_arg0 )
	end )
	self:addElement( AARScoreboardTab )
	self.AARScoreboardTab = AARScoreboardTab
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local StageNotificationContainer = CoD.StageNotificationContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 120 )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "MapVote", "mapVoteGameModeNext", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.StageTitle:setText( CoD.GameTypeUtility.GameTypeToLocalizeToUpperName( f5_local0 ) )
		end
	end )
	StageNotificationContainer:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "publicLobby.stageDetails", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			StageNotificationContainer.CommonHeader.subtitle.subtitle:setText( ConvertToUpperString( CoD.BaseUtility.AlreadyLocalized( f6_local0 ) ) )
		end
	end )
	StageNotificationContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if element.menuLoaded then
			f7_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f7_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( StageNotificationContainer )
	self.StageNotificationContainer = StageNotificationContainer
	
	local CommonHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 67 )
	CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xEEF90B1483C4C23 ) )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f8_local0 ) )
		end
	end )
	CommonHeader:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	local ScoreboardTab = CoD.AARScoreboardTabButton.new( f1_local1, f1_arg0, 0.5, 0.5, -339, 339, 0, 0, 4, 38 )
	ScoreboardTab:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		if element.menuLoaded then
			f10_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f10_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( ScoreboardTab )
	self.ScoreboardTab = ScoreboardTab
	
	local TopBar = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 42 )
	TopBar:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		if element.menuLoaded then
			f11_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f11_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
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
	local f1_local14 = DoubleXPNotification
	local f1_local15 = DoubleXPNotification.subscribeToModel
	local f1_local16 = Engine.GetModelForController( f1_arg0 )
	f1_local15( f1_local14, f1_local16["AAR.activeTab"], function ( f13_arg0 )
		f1_local1:updateElementState( DoubleXPNotification, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f13_arg0:get(),
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
	f1_local14 = self
	f1_local15 = self.subscribeToModel
	f1_local16 = Engine.GetGlobalModel()
	f1_local15( f1_local14, f1_local16["lobbyRoot.lobbyNav"], function ( f15_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f15_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local14 = self
	f1_local15 = self.subscribeToModel
	f1_local16 = Engine.GetGlobalModel()
	f1_local15( f1_local14, f1_local16["lobbyRoot.lobbyNav"], function ( f16_arg0, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ui_confirm", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if not IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f17_arg1, f17_arg2 )
			MenuUnhideFreeCursor( f17_arg1, f17_arg2 )
			return true
		elseif IsPC() then
			CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f17_arg1, f17_arg2 )
			MenuUnhideFreeCursor( f17_arg1, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0xE4E038F4690D38D, nil, "ui_confirm" )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "ESCAPE", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		CoD.AnalyticsUtility.GoBackAndShowMatchSurveyIfNecessary( f19_arg1, f19_arg2 )
		return true
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "ESCAPE" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "ui_contextual_1", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( f21_arg2 ) then
			FileshareBookmarkRecentGame( f21_arg2 )
			UpdateButtonPromptState( f21_arg1, f21_arg0, f21_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if IsLobbyNetworkModeLive() and not IsRecentGameBookmarked( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x941662A2E0BF65E, nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		local f23_local0 = self
		CoD.AARUtility.OpenAAROverlays( f23_arg2, f23_arg1 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "AAR.activeTab", function ( model )
		local f25_local0 = self
		CoD.AARUtility.UpdateAARScene( f1_local1, f1_arg0 )
	end )
	AARSummaryTab.id = "AARSummaryTab"
	AARContractsTab.id = "AARContractsTab"
	AARMedalsTab.id = "AARMedalsTab"
	AARRewardsTab.id = "AARRewardsTab"
	AARScoreboardTab.id = "AARScoreboardTab"
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
	f1_local15 = self
	CoD.AARUtility.AARFirstTimeOpenActions( self, f1_arg0, f1_local1 )
	CoD.AARUtility.AnimateCurrentLevelProgress( f1_local1, f1_arg0 )
	f1_local15 = DoubleXPNotification
	if not IsPC() then
		SizeToSafeArea( f1_local15, f1_arg0 )
	end
	return self
end

CoD.AAR_T8_MP.__resetProperties = function ( f27_arg0 )
	f27_arg0.CommonHeader:completeAnimation()
	f27_arg0.StageNotificationContainer:completeAnimation()
	f27_arg0.CommonHeader:setAlpha( 1 )
	f27_arg0.StageNotificationContainer:setAlpha( 1 )
end

CoD.AAR_T8_MP.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 2 )
			f28_arg0.StageNotificationContainer:completeAnimation()
			f28_arg0.StageNotificationContainer:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.StageNotificationContainer )
			f28_arg0.CommonHeader:completeAnimation()
			f28_arg0.CommonHeader:setAlpha( 1 )
			f28_arg0.clipFinished( f28_arg0.CommonHeader )
		end
	},
	Offline = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 1 )
			f29_arg0.StageNotificationContainer:completeAnimation()
			f29_arg0.StageNotificationContainer:setAlpha( 0 )
			f29_arg0.clipFinished( f29_arg0.StageNotificationContainer )
		end
	}
}
CoD.AAR_T8_MP.__onClose = function ( f30_arg0 )
	f30_arg0.__on_close_removeOverrides()
	f30_arg0.AARSummaryTab:close()
	f30_arg0.AARContractsTab:close()
	f30_arg0.AARMedalsTab:close()
	f30_arg0.AARRewardsTab:close()
	f30_arg0.AARScoreboardTab:close()
	f30_arg0.FooterContainerFrontendRight:close()
	f30_arg0.StageNotificationContainer:close()
	f30_arg0.CommonHeader:close()
	f30_arg0.ScoreboardTab:close()
	f30_arg0.TopBar:close()
	f30_arg0.DoubleXPNotification:close()
end

