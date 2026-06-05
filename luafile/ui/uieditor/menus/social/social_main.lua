require( "x64:c036a164ffe44a7" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/social/social_safeareacontainer" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.Social_Main = InheritFrom( CoD.Menu )
LUI.createMenu.Social_Main = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Social_Main", f1_arg0 )
	local f1_local1 = self
	CoD.ClanUtility.Social_MainPreLoad( f1_arg0 )
	CoD.LobbyUtility.SocialMainPreLoad( self, f1_arg0 )
	CoD.RankUtility.InitRankModeIfSetToNone( f1_arg0 )
	self:setClass( CoD.Social_Main )
	self.soundSet = "ChooseDecal"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BlackBacking:setRGB( 0, 0, 0 )
	BlackBacking:setAlpha( 0.5 )
	self:addElement( BlackBacking )
	self.BlackBacking = BlackBacking
	
	local TabFrame = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
	TabFrame:setLeftRight( 0, 1, 0, 0 )
	TabFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( "menu/social_caps" ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	local SocialSafeAreaContainer = CoD.Social_SafeAreaContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	SocialSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( SocialSafeAreaContainer )
	self.SocialSafeAreaContainer = SocialSafeAreaContainer
	
	TabFrame:linkToElementModel( SocialSafeAreaContainer.tabs.Tabs.grid, "tabWidget", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			TabFrame:changeFrameWidget( f4_local0 )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Ingame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	local f1_local7 = self
	local f1_local8 = self.subscribeToModel
	local f1_local9 = Engine.GetGlobalModel()
	f1_local8( f1_local7, f1_local9["socialRoot.tab"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1] )
	end, false )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = Engine.GetGlobalModel()
	f1_local8( f1_local7, f1_local9["socialRoot.sort"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1] )
	end, false )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = DataSources.SocialRoot.getModel( f1_arg0 )
	f1_local8( f1_local7, f1_local9.tab, function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x22361E23588705A] )
	end, false )
	self:appendEventHandler( "<datasourceChange>ClanInfo", function ( f9_arg0, f9_arg1 )
		f9_arg1.menu = f9_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f9_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x22361E23588705A] )
	end )
	f1_local7 = self
	f1_local8 = self.subscribeToModel
	f1_local9 = Engine.GetGlobalModel()
	f1_local8( f1_local7, f1_local9["lobbyRoot.rankMode"], function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC] )
	end, false )
	self:registerEventHandler( "close_all_ingame_menus", function ( self, event )
		local f11_local0 = nil
		if IsPC() then
			CoD.PCUtility.ShortcutMenuGoBack( f1_local1, f1_arg0 )
		end
		if not f11_local0 then
			f11_local0 = self:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xE6DB407A2AF8B09], "", nil, nil )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( element, menu, controller, model )
		if not IsPC() and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.tab", "friends" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.sort", Enum.PresenceSorting[0x378D2974EF235BB] ) then
			SocialToggleSorting( self, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton[0x93AB4C84F113EE1] )
			return true
		elseif not IsPC() and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.tab", "friends" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.sort", Enum.PresenceSorting[0x874C3506F8D93CE] ) then
			SocialToggleSorting( self, element, controller )
			UpdateButtonPromptState( menu, element, controller, Enum.LUIButton[0x93AB4C84F113EE1] )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPC() and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.tab", "friends" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.sort", Enum.PresenceSorting[0x378D2974EF235BB] ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x93AB4C84F113EE1], "menu/online_sort_allphabetical", nil, nil )
			return true
		elseif not IsPC() and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.tab", "friends" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "socialRoot.sort", Enum.PresenceSorting[0x874C3506F8D93CE] ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x93AB4C84F113EE1], "menu/online_sort_most_recent", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], nil, function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xC083113BC81F23F], "", nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x22361E23588705A], "ui_contextual_1", function ( element, menu, controller, model )
		if CoD.ClanUtility.ShowClanOptionPrompt( controller ) then
			OpenPopup( self, "ClanOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.ClanUtility.ShowClanOptionPrompt( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x22361E23588705A], "menu/options_caps", nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], nil, function ( element, menu, controller, model )
		if not IsPC() and not IsRepeatButtonPress( model ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Multiplayer ) then
			CoD.RankUtility.ToggleRankMode()
			return true
		elseif not IsPC() and not IsRepeatButtonPress( model ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Arena ) then
			CoD.RankUtility.ToggleRankMode()
			return true
		elseif not IsPC() and not IsRepeatButtonPress( model ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Warzone ) then
			CoD.RankUtility.ToggleRankMode()
			return true
		elseif not IsPC() and not IsRepeatButtonPress( model ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Zombies ) then
			CoD.RankUtility.ToggleRankMode()
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local f23_local0 = nil
		if not IsPC() and not IsRepeatButtonPress( f23_local0 ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Multiplayer ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xD2F467A6C6DA1AC], "menu/rank_multiplayer", nil, nil )
			return true
		elseif not IsPC() and not IsRepeatButtonPress( f23_local0 ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Arena ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xD2F467A6C6DA1AC], "menu/rank_arena", nil, nil )
			return true
		elseif not IsPC() and not IsRepeatButtonPress( f23_local0 ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Warzone ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xD2F467A6C6DA1AC], "menu/rank_warzone", nil, nil )
			return true
		elseif not IsPC() and not IsRepeatButtonPress( f23_local0 ) and CoD.RankUtility.IsCurrentRankModeEqualTo( CoD.RankUtility.RankMode.Zombies ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0xD2F467A6C6DA1AC], "menu/rank_zombies", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		local f24_local0 = self
		SocialEnablePresenceCacheAutoupdate( f24_arg1, true )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		OnSocialMenuBack( f1_local1, f1_arg0 )
		SocialEnablePresenceCacheAutoupdate( f1_arg0, false )
		CoD.RankUtility.RestoreRankMode()
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "goBack", function ( element, controller )
		MenuUnhideFreeCursor( element, controller )
	end )
	TabFrame.id = "TabFrame"
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	SocialSafeAreaContainer.id = "SocialSafeAreaContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = TabFrame
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
	
	return self
end

CoD.Social_Main.__resetProperties = function ( f28_arg0 )
	f28_arg0.Background:completeAnimation()
	f28_arg0.Background:setAlpha( 0 )
end

CoD.Social_Main.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 0 )
		end
	},
	Ingame = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 1 )
			f30_arg0.Background:completeAnimation()
			f30_arg0.Background:setAlpha( 1 )
			f30_arg0.clipFinished( f30_arg0.Background )
		end
	}
}
CoD.Social_Main.__onClose = function ( f31_arg0 )
	f31_arg0.__on_close_removeOverrides()
	f31_arg0.TabFrame:close()
	f31_arg0.Background:close()
	f31_arg0.GenericMenuFrameIdentity:close()
	f31_arg0.SocialSafeAreaContainer:close()
end

