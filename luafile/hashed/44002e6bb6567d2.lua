require( "x64:c12626f56e6eb65" )
require( "ui/uieditor/widgets/arena/arenaprogresswidget" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlinedsafeareacontainer" )
require( "x64:de2199ef19d9304" )
require( "x64:7fcf708ed5e2cb1" )
require( "x64:75a9f83b5ec1af" )
require( "x64:c16487fea5a0141" )
require( "x64:b1264dcdcf2dd99" )
require( "x64:60e92f4004e2d3d" )
require( "x64:9f5fd294aba0edc" )
require( "x64:e7a9f9500d0792b" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.Prestige_PlayerLevel = InheritFrom( CoD.Menu )
LUI.createMenu.Prestige_PlayerLevel = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Prestige_PlayerLevel", f1_arg0 )
	local f1_local1 = self
	CoD.StartMenuUtility.SetModeForStartMenu( f1_local1 )
	CoD.StartMenuUtility.SetStorageBufferForMenu( f1_local1, f1_arg0 )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1_arg0 )
	self:setClass( CoD.Prestige_PlayerLevel )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BlackBacking:setRGB( 0, 0, 0 )
	BlackBacking:setAlpha( 0.15 )
	self:addElement( BlackBacking )
	self.BlackBacking = BlackBacking
	
	local TiledPlusGrid = LUI.UIImage.new( 0, 1.07, -135, -135, 0, 1, 0, 0 )
	TiledPlusGrid:setAlpha( 0.05 )
	TiledPlusGrid:setImage( RegisterImage( 0x6E37BAE22631294 ) )
	TiledPlusGrid:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	TiledPlusGrid:setShaderVector( 0, 0, 0, 0, 0 )
	TiledPlusGrid:setupNineSliceShader( 220, 220 )
	self:addElement( TiledPlusGrid )
	self.TiledPlusGrid = TiledPlusGrid
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( CoD.PrestigeUtility.GetPrestigeMenuTitleString( 0x2EB4043431740D3 ) ) )
	GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( "" )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local DetailsPanelMainImage = CoD.Prestige_DetailsPanel.new( f1_local1, f1_arg0, 0.5, 0.5, 432, 831, 0, 0, 347, 878 )
	DetailsPanelMainImage:subscribeToGlobalModel( f1_arg0, "PrestigeMenuInfo", "currentHighlightedItem", function ( model )
		DetailsPanelMainImage:setModel( model, f1_arg0 )
	end )
	self:addElement( DetailsPanelMainImage )
	self.DetailsPanelMainImage = DetailsPanelMainImage
	
	local LevelProgress = CoD.Prestige_LevelProgressWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -836, 272, 0, 0, 187, 281 )
	self:addElement( LevelProgress )
	self.LevelProgress = LevelProgress
	
	local ArenaProgressWidget = CoD.ArenaProgressWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -839, 271, 0, 0, 147, 347 )
	self:addElement( ArenaProgressWidget )
	self.ArenaProgressWidget = ArenaProgressWidget
	
	local PrestigeHeader = CoD.Prestige_PrestigeHeader.new( f1_local1, f1_arg0, 0.5, 0.5, 44, 262, 0, 0, 205, 225 )
	PrestigeHeader:setScale( 1.02, 1.02 )
	self:addElement( PrestigeHeader )
	self.PrestigeHeader = PrestigeHeader
	
	local RewardsWidget = CoD.Prestige_LevelContentWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 0, 370.5, 900.5 )
	self:addElement( RewardsWidget )
	self.RewardsWidget = RewardsWidget
	
	local PrestigeButton = CoD.Prestige_PrestigeButton.new( f1_local1, f1_arg0, 0.5, 0.5, 432, 832, 0, 0, 187, 281 )
	PrestigeButton:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( PrestigeButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if IsAtXPCap( f4_arg2 ) and not IsMaxPrestigeLevel( f4_arg2 ) then
			OpenEnterPrestigeModeMenu( self, f4_arg2, f4_arg1 )
			PlaySoundAlias( "uin_press_generic" )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if IsAtXPCap( f5_arg2 ) and not IsMaxPrestigeLevel( f5_arg2 ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrestigeButton )
	self.PrestigeButton = PrestigeButton
	
	local FreshStartButton = CoD.Prestige_PlayerLevelButton.new( f1_local1, f1_arg0, 0.5, 0.5, -832, -486, 0, 0, 911.5, 968.5 )
	FreshStartButton:mergeStateConditions( {
		{
			stateName = "TextOnly",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "QuantityActive",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "IconOnly",
			condition = function ( menu, element, event )
				return CoD.PrestigeUtility.ShowFreshStart( f1_arg0 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.PrestigeUtility.ShowFreshStart( f1_arg0 )
			end
		},
		{
			stateName = "UnlockTokenIndicator",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	FreshStartButton.CommonButtonOutlineThin.ButtonIcon:setImage( RegisterImage( 0xEDFCC1D710C02C ) )
	FreshStartButton.CommonButtonOutlineThin.MainText:setText( Engine[0xF9F1239CFD921FE]( 0xF98F72A48A5CFCA ) )
	FreshStartButton:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_local1:AddButtonCallbackFunction( FreshStartButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		OpenPrestigeFreshStartMenu( self, f12_arg2, f12_arg1 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	self:addElement( FreshStartButton )
	self.FreshStartButton = FreshStartButton
	
	local PrestigeUnlockTokenIndicatorBar = CoD.Prestige_UnlockTokenIndicatorBar.new( f1_local1, f1_arg0, 0.5, 0.5, -471.5, -125.5, 0, 0, 911.5, 968.5 )
	PrestigeUnlockTokenIndicatorBar:subscribeToGlobalModel( f1_arg0, "PerController", "permanentUnlockTokensCount", function ( model )
		local f14_local0 = model:get()
		if f14_local0 ~= nil then
			PrestigeUnlockTokenIndicatorBar:setAlpha( CoD.PrestigeUtility.HideIfPrestigeMasterOrValueZero( f1_arg0, f14_local0 ) )
		end
	end )
	PrestigeUnlockTokenIndicatorBar:subscribeToGlobalModel( f1_arg0, "PerController", "permanentUnlockTokensCount", function ( model )
		local f15_local0 = model:get()
		if f15_local0 ~= nil then
			PrestigeUnlockTokenIndicatorBar.CountText:setText( f15_local0 )
		end
	end )
	PrestigeUnlockTokenIndicatorBar:subscribeToGlobalModel( f1_arg0, "PerController", "permanentUnlockTokensCount", function ( model )
		local f16_local0 = model:get()
		if f16_local0 ~= nil then
			PrestigeUnlockTokenIndicatorBar.MainText:setText( ToUpper( GetPermanentUnlockTokenText( f1_arg0, f16_local0 ) ) )
		end
	end )
	self:addElement( PrestigeUnlockTokenIndicatorBar )
	self.PrestigeUnlockTokenIndicatorBar = PrestigeUnlockTokenIndicatorBar
	
	local CustomizePrestigeIconButton = CoD.Prestige_PlayerLevelButton.new( f1_local1, f1_arg0, 0.5, 0.5, -471.5, -125.5, 0, 0, 911.5, 968.5 )
	CustomizePrestigeIconButton:mergeStateConditions( {
		{
			stateName = "TextOnly",
			condition = function ( menu, element, event )
				return CoD.PrestigeUtility.CanCustomizePrestigeIcon( menu, f1_arg0 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.PrestigeUtility.CanCustomizePrestigeIcon( menu, f1_arg0 )
			end
		}
	} )
	CustomizePrestigeIconButton.CommonButtonOutlineThin.MainText:setText( LocalizeToUpperString( 0x754A8D073F00C06 ) )
	CustomizePrestigeIconButton:registerEventHandler( "gain_focus", function ( element, event )
		local f19_local0 = nil
		if element.gainFocus then
			f19_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f19_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f19_local0
	end )
	f1_local1:AddButtonCallbackFunction( CustomizePrestigeIconButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		PlaySoundAlias( "uin_toggle_generic" )
		OpenOverlay( self, "Prestige_CustomizeIcon", f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	self:addElement( CustomizePrestigeIconButton )
	self.CustomizePrestigeIconButton = CustomizePrestigeIconButton
	
	local PrestigeFanfare = CoD.Prestige_Fanfare.new( f1_local1, f1_arg0, 0.5, 0.5, -350, 350, 0.5, 0.5, -540, 540 )
	PrestigeFanfare.PrestigeImage:setImage( RegisterImage( CoD.PlayerStatsUtility.GetNextPrestigeIcon( f1_local1, true, 0x30F9A21089722D4 ) ) )
	PrestigeFanfare.PrestigeTitle:setText( Engine[0xF9F1239CFD921FE]( CoD.PlayerStatsUtility.GetNextPrestigeFanfareText( f1_local1, 0x9E3050512D6C49B ) ) )
	PrestigeFanfare.PrestigeTitle2:setText( CoD.PlayerStatsUtility.GetNextPrestigeTitle( f1_local1, 0x910399F02006FB7 ) )
	self:addElement( PrestigeFanfare )
	self.PrestigeFanfare = PrestigeFanfare
	
	local PermanentUnlockTokenText = LUI.UIText.new( 0.5, 0.5, -471.5, -125.5, 0, 0, 970.5, 988.5 )
	PermanentUnlockTokenText:setRGB( ColorSet.T8__OFF__GRAY.r, ColorSet.T8__OFF__GRAY.g, ColorSet.T8__OFF__GRAY.b )
	PermanentUnlockTokenText:setText( Engine[0xF9F1239CFD921FE]( CoD.PrestigeUtility.GetPermanentUnlockInfoString( 0xE84CE29A8B160AD ) ) )
	PermanentUnlockTokenText:setTTF( "ttmussels_regular" )
	PermanentUnlockTokenText:setLetterSpacing( 1 )
	PermanentUnlockTokenText:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	PermanentUnlockTokenText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	PermanentUnlockTokenText:subscribeToGlobalModel( f1_arg0, "PerController", "permanentUnlockTokensCount", function ( model )
		local f22_local0 = model:get()
		if f22_local0 ~= nil then
			PermanentUnlockTokenText:setAlpha( CoD.PrestigeUtility.HideIfPrestigeMasterOrValueZero( f1_arg0, f22_local0 ) )
		end
	end )
	self:addElement( PermanentUnlockTokenText )
	self.PermanentUnlockTokenText = PermanentUnlockTokenText
	
	local CommonIdentityWidgetStreamlinedSafeAreaContainer = CoD.CommonIdentityWidgetStreamlinedSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f23_local0 = nil
		if element.menuLoaded then
			f23_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f23_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f23_local0 then
			f23_local0 = element:dispatchEventToChildren( event )
		end
		return f23_local0
	end )
	self:addElement( CommonIdentityWidgetStreamlinedSafeAreaContainer )
	self.CommonIdentityWidgetStreamlinedSafeAreaContainer = CommonIdentityWidgetStreamlinedSafeAreaContainer
	
	self:mergeStateConditions( {
		{
			stateName = "WarzoneState",
			condition = function ( menu, element, event )
				return IsWarzone()
			end
		},
		{
			stateName = "ArenaState",
			condition = function ( menu, element, event )
				return IsArenaMode()
			end
		}
	} )
	local f1_local18 = self
	local f1_local19 = self.subscribeToModel
	local f1_local20 = Engine.GetGlobalModel()
	f1_local19( f1_local18, f1_local20["lobbyRoot.lobbyNav"], function ( f26_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f26_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		GoBack( self, f27_arg2 )
		ClearMenuSavedState( f27_arg1 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], "ui_prevtab", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if not IsRepeatButtonPress( f29_arg3 ) then
			PlaySoundAlias( "uin_list_horizontal_generic" )
			ClearRecordedFocus( f29_arg1, f29_arg2 )
			CoD.PrestigeUtility.UpdateCurrentTargetIndex( self, f29_arg2, f29_arg1, true )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "ui_prevtab" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], "ui_nexttab", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not IsRepeatButtonPress( f31_arg3 ) then
			PlaySoundAlias( "uin_list_horizontal_generic" )
			ClearRecordedFocus( f31_arg1, f31_arg2 )
			CoD.PrestigeUtility.UpdateCurrentTargetIndex( self, f31_arg2, f31_arg1, false )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "ui_nexttab" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		PlaySoundAlias( "uin_list_horizontal_generic" )
		ClearRecordedFocus( f33_arg1, f33_arg2 )
		CoD.PrestigeUtility.UpdateCurrentTargetIndex( self, f33_arg2, f33_arg1, true )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		PlaySoundAlias( "uin_list_horizontal_generic" )
		ClearRecordedFocus( f35_arg1, f35_arg2 )
		CoD.PrestigeUtility.UpdateCurrentTargetIndex( self, f35_arg2, f35_arg1, false )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
		return false
	end, false )
	self.__on_menuOpened_self = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		local f37_local0 = self
		CoD.PrestigeUtility.DisplayBetaRewardInventoryNotification( self, f37_arg1, f37_arg2 )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	self:subscribeToGlobalModel( f1_arg0, "PrestigeResult", "inprogress", function ( model )
		local f38_local0 = self
		CoD.PrestigeUtility.OnPrestigeTransactionResultUpdated( self, self.PrestigeFanfare, f1_arg0, model )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PrestigeUnlockResult", "inprogress", function ( model )
		local f39_local0 = self
		CoD.PrestigeUtility.OnPrestigeUnlockTransactionResultUpdated( self, f1_arg0, model )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PrestigeMenuInfo", "hasPrestiged", function ( model )
		local f40_local0 = self
		UpdateSelfState( self, f1_arg0 )
		CoD.ChallengesUtility.RefreshCategoryStats( f1_arg0, model )
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1_arg0 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PrestigeFreshStartResult", "inprogress", function ( model )
		local f41_local0 = self
		CoD.PrestigeUtility.OnFreshStartTransactionResultUpdated( self, f1_arg0, model )
	end )
	self:subscribeToGlobalModel( f1_arg0, "GlobalModel", "RefreshDWInventoryMenu", function ( model )
		local f42_local0 = self
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1_arg0 )
	end )
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	DetailsPanelMainImage.id = "DetailsPanelMainImage"
	PrestigeHeader.id = "PrestigeHeader"
	RewardsWidget.id = "RewardsWidget"
	PrestigeButton.id = "PrestigeButton"
	FreshStartButton.id = "FreshStartButton"
	CustomizePrestigeIconButton.id = "CustomizePrestigeIconButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = RewardsWidget
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
	
	f1_local19 = self
	CoD.PrestigeUtility.InitializePrestigeMenu( self, f1_arg0, f1_local1 )
	CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "WZProgressionInfo" )
	return self
end

CoD.Prestige_PlayerLevel.__resetProperties = function ( f44_arg0 )
	f44_arg0.ArenaProgressWidget:completeAnimation()
	f44_arg0.LevelProgress:completeAnimation()
	f44_arg0.PrestigeHeader:completeAnimation()
	f44_arg0.ArenaProgressWidget:setAlpha( 1 )
	f44_arg0.LevelProgress:setAlpha( 1 )
	f44_arg0.PrestigeHeader:setAlpha( 1 )
end

CoD.Prestige_PlayerLevel.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f45_arg0, f45_arg1 )
			f45_arg0:__resetProperties()
			f45_arg0:setupElementClipCounter( 1 )
			f45_arg0.ArenaProgressWidget:completeAnimation()
			f45_arg0.ArenaProgressWidget:setAlpha( 0 )
			f45_arg0.clipFinished( f45_arg0.ArenaProgressWidget )
		end
	},
	WarzoneState = {
		DefaultClip = function ( f46_arg0, f46_arg1 )
			f46_arg0:__resetProperties()
			f46_arg0:setupElementClipCounter( 1 )
			f46_arg0.ArenaProgressWidget:completeAnimation()
			f46_arg0.ArenaProgressWidget:setAlpha( 0 )
			f46_arg0.clipFinished( f46_arg0.ArenaProgressWidget )
		end
	},
	ArenaState = {
		DefaultClip = function ( f47_arg0, f47_arg1 )
			f47_arg0:__resetProperties()
			f47_arg0:setupElementClipCounter( 2 )
			f47_arg0.LevelProgress:completeAnimation()
			f47_arg0.LevelProgress:setAlpha( 0 )
			f47_arg0.clipFinished( f47_arg0.LevelProgress )
			f47_arg0.PrestigeHeader:completeAnimation()
			f47_arg0.PrestigeHeader:setAlpha( 0 )
			f47_arg0.clipFinished( f47_arg0.PrestigeHeader )
		end
	}
}
CoD.Prestige_PlayerLevel.__onClose = function ( f48_arg0 )
	f48_arg0.__on_close_removeOverrides()
	f48_arg0.Background:close()
	f48_arg0.GenericMenuFrame:close()
	f48_arg0.DetailsPanelMainImage:close()
	f48_arg0.LevelProgress:close()
	f48_arg0.ArenaProgressWidget:close()
	f48_arg0.PrestigeHeader:close()
	f48_arg0.RewardsWidget:close()
	f48_arg0.PrestigeButton:close()
	f48_arg0.FreshStartButton:close()
	f48_arg0.PrestigeUnlockTokenIndicatorBar:close()
	f48_arg0.CustomizePrestigeIconButton:close()
	f48_arg0.PrestigeFanfare:close()
	f48_arg0.PermanentUnlockTokenText:close()
	f48_arg0.CommonIdentityWidgetStreamlinedSafeAreaContainer:close()
end

