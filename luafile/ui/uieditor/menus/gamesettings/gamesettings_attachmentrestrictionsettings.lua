require( "ui/uieditor/widgets/customgames/customgames_optioncategorybutton" )
require( "ui/uieditor/widgets/customgames/customgames_settingslider" )
require( "ui/uieditor/widgets/gamesettings/gamesettings_background" )
require( "ui/uieditor/widgets/gamesettings/gamesettings_selectediteminfo" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )

CoD.GameSettings_AttachmentRestrictionSettings = InheritFrom( CoD.Menu )
LUI.createMenu.GameSettings_AttachmentRestrictionSettings = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "GameSettings_AttachmentRestrictionSettings", f1_arg0 )
	local f1_local1 = self
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	self:setClass( CoD.GameSettings_AttachmentRestrictionSettings )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local GameSettingsBackground = CoD.GameSettings_Background.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GameSettingsBackground.BackingBlur:setAlpha( 0 )
	GameSettingsBackground.MenuFrame.CommonHeader.BGSceneBlur:setAlpha( 0 )
	GameSettingsBackground.MenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x8B13CD4A57F560 ) )
	GameSettingsBackground:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GameSettingsBackground.MenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GameSettingsBackground )
	self.GameSettingsBackground = GameSettingsBackground
	
	local f1_local3 = nil
	
	local OptionCategoryGrid = LUI.GridLayout.new( f1_local1, f1_arg0, false, 0, 0, 8, 0, nil, nil, false, false, false, false )
	OptionCategoryGrid:setLeftRight( 0, 0, 100, 350 )
	OptionCategoryGrid:setTopBottom( 0, 0, 114, 3528 )
	OptionCategoryGrid:setWidgetType( CoD.CustomGames_OptionCategoryButton )
	OptionCategoryGrid:setVerticalCount( 29 )
	OptionCategoryGrid:setSpacing( 8 )
	OptionCategoryGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	OptionCategoryGrid:setDataSource( "WeaponAttachmentOptionCategories" )
	self:addElement( OptionCategoryGrid )
	self.OptionCategoryGrid = OptionCategoryGrid
	
	local f1_local5 = nil
	
	local SlidersPC = LUI.UIList.new( f1_local1, f1_arg0, 8, 0, nil, false, false, false, false )
	SlidersPC:setLeftRight( 0, 0, 426, 1126 )
	SlidersPC:setTopBottom( 0, 0, 142, 950 )
	SlidersPC:setWidgetType( CoD.CustomGames_SettingSlider )
	SlidersPC:setVerticalCount( 12 )
	SlidersPC:setSpacing( 8 )
	SlidersPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	SlidersPC:setVerticalCounter( CoD.verticalCounter )
	SlidersPC:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		ProcessListAction( self, element, f1_arg0, f1_local1 )
		GameSettingsButtonGainFocus( self, element, f1_arg0 )
		SetCurrentElementAsActive( self, element, f1_arg0 )
		return f3_local0
	end )
	self:addElement( SlidersPC )
	self.SlidersPC = SlidersPC
	
	local f1_local7 = nil
	f1_local7 = LUI.UIElement.createFake()
	self.OptionCategoryList = f1_local7
	local f1_local8 = nil
	f1_local8 = LUI.UIElement.createFake()
	self.Sliders = f1_local8
	
	local GameSettingsSelectedItemInfo = CoD.GameSettings_SelectedItemInfo.new( f1_local1, f1_arg0, 0, 1, 59, 59, -0.31, 0.69, 262, 464 )
	GameSettingsSelectedItemInfo.GameModeName:setAlpha( 0 )
	self:addElement( GameSettingsSelectedItemInfo )
	self.GameSettingsSelectedItemInfo = GameSettingsSelectedItemInfo
	
	SlidersPC:linkToElementModel( OptionCategoryGrid, "optionsListDatasource", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			SlidersPC:setDataSource( f4_local0 )
		end
	end )
	f1_local8:linkToElementModel( f1_local7, "optionsListDatasource", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			f1_local8:setDataSource( f5_local0 )
		end
	end )
	self:appendEventHandler( "input_source_changed", function ( f6_arg0, f6_arg1 )
		f6_arg1.menu = f6_arg1.menu or f1_local1
		CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg0, f1_local1, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA] )
	end )
	local f1_local10 = self
	local f1_local11 = self.subscribeToModel
	local f1_local12 = Engine.GetModelForController( f1_arg0 )
	f1_local11( f1_local10, f1_local12.LastInput, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, "ESCAPE" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsGamepad( f10_arg2 ) then
			ResetGameSettings()
			PlaySoundAlias( "uin_party_ease_slide" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsGamepad( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton[0xC083113BC81F23F], 0xFA987631536BD44, Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 1500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], "ui_contextual_2", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsMouseOrKeyboard( f12_arg2 ) then
			OpenResetGameSettingsPopup( self, f12_arg0, f12_arg2, "", f12_arg1 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if IsMouseOrKeyboard( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0xFA987631536BD44, nil, "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		local f14_local0 = self
		if IsPC() then
			CoD.OptionsUtility.SetCurrentActiveWeaponAttachmentCategory( f14_arg2 )
			HideWidget( self.OptionCategoryGrid )
			SetFocusToElement( self, "SlidersPC", f14_arg1 )
			CoD.GridAndListUtility.SetFocusToFirstSelectableItem( self.SlidersPC )
		else
			CoD.OptionsUtility.SetCurrentActiveWeaponAttachmentCategory( f14_arg2 )
			HideWidget( self.OptionCategoryList )
			SetFocusToElement( self, "Sliders", f14_arg1 )
			CoD.GridAndListUtility.SetFocusToFirstSelectableItem( self.Sliders )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.OptionsUtility.ClearInfoModels()
	end )
	GameSettingsBackground.MenuFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		GameSettingsBackground.id = "GameSettingsBackground"
	end
	OptionCategoryGrid.id = "OptionCategoryGrid"
	SlidersPC.id = "SlidersPC"
	f1_local7.id = "OptionCategoryList"
	f1_local8.id = "Sliders"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local11 = self
	f1_local11 = SlidersPC
	if IsPC() then
		SetElementProperty( f1_local11, "ignoreSavedActive", true )
	end
	return self
end

CoD.GameSettings_AttachmentRestrictionSettings.__onClose = function ( f17_arg0 )
	f17_arg0.__on_close_removeOverrides()
	f17_arg0.SlidersPC:close()
	f17_arg0.Sliders:close()
	f17_arg0.GameSettingsBackground:close()
	f17_arg0.OptionCategoryGrid:close()
	f17_arg0.OptionCategoryList:close()
	f17_arg0.GameSettingsSelectedItemInfo:close()
end

