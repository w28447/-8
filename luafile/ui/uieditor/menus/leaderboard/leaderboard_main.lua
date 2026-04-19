require( "ui/uieditor/menus/leaderboard/leaderboard_gamemode" )
require( "x64:fd50e0f2de27d70" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlinedsafeareacontainer" )
require( "ui/uieditor/widgets/leaderboard/leaderboard_gamemodebutton" )
require( "ui/uieditor/widgets/leaderboard/leaderboard_safeareatabs" )
require( "ui/uieditor/widgets/leaderboard/leaderboardlistbutton" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.Leaderboard_Main = InheritFrom( CoD.Menu )
LUI.createMenu.Leaderboard_Main = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Leaderboard_Main", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.LeaderboardUtility.UpdatePlayersListCount( f1_arg0 )
	self:setClass( CoD.Leaderboard_Main )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xFE3665244ECF33B ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local GameModeList = LUI.UIList.new( f1_local1, f1_arg0, 18, 0, nil, false, false, false, false )
	GameModeList:setLeftRight( 0.5, 0.5, -811, 455 )
	GameModeList:setTopBottom( 0, 0, 224, 866 )
	GameModeList:setWidgetType( CoD.Leaderboard_GameModeButton )
	GameModeList:setHorizontalCount( 4 )
	GameModeList:setVerticalCount( 3 )
	GameModeList:setSpacing( 18 )
	GameModeList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	GameModeList:setDataSource( "LeaderboardGameModeButton" )
	GameModeList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( GameModeList, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		CoD.LeaderboardUtility.AutoAddFriends( f4_arg2 )
		CoD.LeaderboardUtility.SetLeaderboardDef( self, f4_arg0, f4_arg2 )
		CoD.LeaderboardUtility.LoadLeaderboard( self, f4_arg2 )
		OpenOverlay( self, "Leaderboard_GameMode", f4_arg2, nil )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( GameModeList )
	self.GameModeList = GameModeList
	
	local PlaylistButton = CoD.LeaderboardListButton.new( f1_local1, f1_arg0, 0.5, 0.5, 539.5, 842.5, 0, 0, 224, 316 )
	PlaylistButton.CommonListButtonShortInternal.Title.__CommonListButtonShortInternal_Title_String_Reference = function ()
		PlaylistButton.CommonListButtonShortInternal.Title:setText( Engine[0xF9F1239CFD921FE]( CoD.LeaderboardUtility.PlayerListCountAndMax( 0x52A206848432462 ) ) )
	end
	
	PlaylistButton.CommonListButtonShortInternal.Title.__CommonListButtonShortInternal_Title_String_Reference()
	PlaylistButton:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( PlaylistButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsPC() then
			CoD.LeaderboardUtility.AutoAddFriends( f8_arg2 )
			OpenPopup( self, "Leaderboards_PlayersList", f8_arg2 )
			return true
		elseif IsPC() then
			CoD.LeaderboardUtility.AutoAddFriends( f8_arg2 )
			OpenOverlay( self, "Leaderboards_PlayersList", f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xAC3B80C833B60E1, nil, "ui_confirm" )
			return true
		elseif IsPC() then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xAC3B80C833B60E1, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PlaylistButton )
	self.PlaylistButton = PlaylistButton
	
	local CommonIdentityWidgetStreamlinedSafeAreaContainer = CoD.CommonIdentityWidgetStreamlinedSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( CommonIdentityWidgetStreamlinedSafeAreaContainer )
	self.CommonIdentityWidgetStreamlinedSafeAreaContainer = CommonIdentityWidgetStreamlinedSafeAreaContainer
	
	local TabBacking = CoD.Leaderboard_SafeAreaTabs.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	TabBacking:registerEventHandler( "list_active_changed", function ( element, event )
		local f11_local0 = nil
		SetElementProperty( f1_local1, "_category", element.category )
		CoD.GridAndListUtility.UpdateDataSource( self.GameModeList, false, false, true )
		return f11_local0
	end )
	self:addElement( TabBacking )
	self.TabBacking = TabBacking
	
	local f1_local8 = PlaylistButton
	local f1_local9 = PlaylistButton.subscribeToModel
	local f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["socialRoot.playersListCount"], PlaylistButton.CommonListButtonShortInternal.Title.__CommonListButtonShortInternal_Title_String_Reference )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		GoBack( self, f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, "ESCAPE" )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	GameModeList.id = "GameModeList"
	PlaylistButton.id = "PlaylistButton"
	TabBacking.id = "TabBacking"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = GameModeList
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local9 = self
	f1_local9 = TabBacking
	if not IsPC() then
		SizeToSafeArea( f1_local9, f1_arg0 )
	end
	return self
end

CoD.Leaderboard_Main.__onClose = function ( f14_arg0 )
	f14_arg0.Background:close()
	f14_arg0.GenericMenuFrame:close()
	f14_arg0.GameModeList:close()
	f14_arg0.PlaylistButton:close()
	f14_arg0.CommonIdentityWidgetStreamlinedSafeAreaContainer:close()
	f14_arg0.TabBacking:close()
end

