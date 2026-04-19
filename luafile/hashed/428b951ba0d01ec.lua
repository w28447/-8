require( "ui/uieditor/menus/charactercustomization/personalizecharacter" )
require( "x64:86b4582183041dd" )
require( "ui/uieditor/widgets/scoreboard/tabbedscoreboardfuibox" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )
require( "x64:1bbde4283bb35f8" )

CoD.CharacterSelection_StandardFrameWidget = InheritFrom( LUI.UIElement )
CoD.CharacterSelection_StandardFrameWidget.__defaultWidth = 1718
CoD.CharacterSelection_StandardFrameWidget.__defaultHeight = 800
CoD.CharacterSelection_StandardFrameWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CharacterSelection_StandardFrameWidget )
	self.id = "CharacterSelection_StandardFrameWidget"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Characters = LUI.UIList.new( f1_arg0, f1_arg1, 0, 0, nil, false, false, false, false )
	Characters:setLeftRight( 1, 1, -790, 0 )
	Characters:setTopBottom( 0, 0, 162, 782 )
	Characters:setWidgetType( CoD.CharacterSelection_CharacterListWidget )
	Characters:setHorizontalCount( 5 )
	Characters:setVerticalCount( 4 )
	Characters:setSpacing( 0 )
	Characters:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Characters:setVerticalCounter( CoD.verticalCounter )
	Characters:linkToElementModel( self, "characterDatasource", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Characters:setDataSource( f2_local0 )
		end
	end )
	Characters:linkToElementModel( Characters, "purchasable", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Characters:linkToElementModel( Characters, "disabled", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	local CharacterText = Characters
	local SpecialistText = Characters.subscribeToModel
	local HeaderLine = Engine.GetGlobalModel()
	SpecialistText( CharacterText, HeaderLine["lobbyRoot.playlistId"], function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Characters:appendEventHandler( "input_source_changed", function ( f6_arg0, f6_arg1 )
		f6_arg1.menu = f6_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f6_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	CharacterText = Characters
	SpecialistText = Characters.subscribeToModel
	HeaderLine = Engine.GetModelForController( f1_arg1 )
	SpecialistText( CharacterText, HeaderLine.LastInput, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	Characters:linkToElementModel( Characters, "hasCustomization", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	Characters:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		PositionDraftOnFocusCharacter( self, element, f1_arg1 )
		SetControllerModelValue( f1_arg1, "WZCharacterInfo.infoModel", element:getModel() )
		CoD.ModelUtility.SetControllerModelValueToEnum( f1_arg1, "WZCharacterInfo.showInfoState", CoD.WZUtility.CharacterInfoShowState.SHOW )
		return f9_local0
	end )
	Characters:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f10_local0 = nil
		if not CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "Characters" ) then
			PositionDraftOnFocusCharacterLost( self, element, f1_arg1, false )
			CoD.ModelUtility.SetControllerModelValueToEnum( f1_arg1, "WZCharacterInfo.showInfoState", CoD.WZUtility.CharacterInfoShowState.HIDE )
		end
		return f10_local0
	end )
	Characters:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Characters, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f12_arg0, f12_arg2, "purchasable" ) and not CoD.ModelUtility.IsSelfModelValueTrue( f12_arg0, f12_arg2, "disabled" ) and not IsGameTrial() and CoD.PlayerRoleUtility[0x7841254A6DA6220]( f12_arg0, f12_arg2 ) then
			PositionDraftSelectCharacterFrontend( self, f12_arg0, f12_arg2 )
			GoBack( self, f12_arg2 )
			PlaySoundAlias( "uin_specialist_select" )
			SaveLoadout( self, f12_arg2 )
			return true
		elseif IsElementInState( f12_arg0, "Purchasable" ) and not IsGameTrial() and CoD.StoreUtility.IsStoreEnabled( f12_arg2 ) then
			OpenStore( self, f12_arg0, f12_arg2, "", f12_arg1 )
			return true
		elseif IsPC() and IsElementInState( f12_arg0, "Selected" ) and not IsGameTrial() then
			GoBack( self, f12_arg2 )
			PlaySoundAlias( "uin_specialist_select" )
			return true
		elseif IsPC() and IsElementInState( f12_arg0, "Purchasable" ) and not IsGameTrial() and CoD.StoreUtility.IsStoreEnabled( f12_arg2 ) then
			OpenOverlay( self, "Store", f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f13_arg0, f13_arg2, "purchasable" ) and not CoD.ModelUtility.IsSelfModelValueTrue( f13_arg0, f13_arg2, "disabled" ) and not IsGameTrial() and CoD.PlayerRoleUtility[0x7841254A6DA6220]( f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif IsElementInState( f13_arg0, "Purchasable" ) and not IsGameTrial() and CoD.StoreUtility.IsStoreEnabled( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x191CDDA584B4408, nil, "ui_confirm" )
			return true
		elseif IsPC() and IsElementInState( f13_arg0, "Selected" ) and not IsGameTrial() then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif IsPC() and IsElementInState( f13_arg0, "Purchasable" ) and not IsGameTrial() and CoD.StoreUtility.IsStoreEnabled( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x191CDDA584B4408, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( Characters, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_contextual_1", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if IsGamepad( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( f14_arg0, f14_arg2, "disabled" ) and not IsGameTrial() and CoD.ModelUtility.IsSelfModelValueTrue( f14_arg0, f14_arg2, "hasCustomization" ) then
			PlaySoundAlias( "uin_cac_menu_open_2" )
			OpenOverlay( self, "PersonalizeCharacter", f14_arg2, {
				model = f14_arg0:getModel(),
				properties = {
					_sessionMode = f14_arg1._sessionMode,
					_storageLoadoutBuffer = f14_arg1._storageLoadoutBuffer
				}
			} )
			return true
		elseif not IsGamepad( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( f14_arg0, f14_arg2, "disabled" ) and not IsGameTrial() and CoD.ModelUtility.IsSelfModelValueTrue( f14_arg0, f14_arg2, "hasCustomization" ) then
			PlaySoundAlias( "uin_cac_menu_open_2" )
			OpenOverlay( self, "PersonalizeCharacter", f14_arg2, {
				model = f14_arg0:getModel(),
				properties = {
					_sessionMode = f14_arg1._sessionMode,
					_storageLoadoutBuffer = f14_arg1._storageLoadoutBuffer
				}
			} )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if IsGamepad( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( f15_arg0, f15_arg2, "disabled" ) and not IsGameTrial() and CoD.ModelUtility.IsSelfModelValueTrue( f15_arg0, f15_arg2, "hasCustomization" ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x2AA2EA68ACC2317, nil, "ui_contextual_1" )
			return true
		elseif not IsGamepad( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( f15_arg0, f15_arg2, "disabled" ) and not IsGameTrial() and CoD.ModelUtility.IsSelfModelValueTrue( f15_arg0, f15_arg2, "hasCustomization" ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x2AA2EA68ACC2317, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	Characters:AddContextualMenuAction( f1_arg0, f1_arg1, 0x2AA2EA68ACC2317, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f16_arg0, f16_arg2, "disabled" ) and not IsGameTrial() and CoD.ModelUtility.IsSelfModelValueTrue( f16_arg0, f16_arg2, "hasCustomization" ) then
			return function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
				PlaySoundAlias( "uin_cac_menu_open_2" )
				OpenOverlay( self, "PersonalizeCharacter", f17_arg2, {
					model = f17_arg0:getModel(),
					properties = {
						_sessionMode = f17_arg1._sessionMode,
						_storageLoadoutBuffer = f17_arg1._storageLoadoutBuffer
					}
				} )
			end
			
		else
			
		end
	end )
	self:addElement( Characters )
	self.Characters = Characters
	
	SpecialistText = LUI.UIText.new( 1, 1, -781, -480, 0, 0, 143, 164 )
	SpecialistText:setRGB( 0.38, 0.38, 0.4 )
	SpecialistText:setText( LocalizeToUpperString( 0xE5960B3E0AF9188 ) )
	SpecialistText:setTTF( "default" )
	SpecialistText:setLetterSpacing( 3 )
	SpecialistText:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	SpecialistText:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	self:addElement( SpecialistText )
	self.SpecialistText = SpecialistText
	
	CharacterText = LUI.UIText.new( 1, 1, -781, -480, 0, 0, 143, 164 )
	CharacterText:setRGB( 0.38, 0.38, 0.4 )
	CharacterText:setAlpha( 0 )
	CharacterText:setText( LocalizeToUpperString( 0x328B80BBA7F8455 ) )
	CharacterText:setTTF( "default" )
	CharacterText:setLetterSpacing( 3 )
	CharacterText:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	CharacterText:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	self:addElement( CharacterText )
	self.CharacterText = CharacterText
	
	HeaderLine = LUI.UIImage.new( 1, 1, -781, -6, 0, 0, 164, 165 )
	HeaderLine:setRGB( 0.38, 0.38, 0.4 )
	HeaderLine:setAlpha( 0.8 )
	self:addElement( HeaderLine )
	self.HeaderLine = HeaderLine
	
	local TabbedScoreboardFuiBox = CoD.TabbedScoreboardFuiBox.new( f1_arg0, f1_arg1, 0, 0, 1624, 1736, 0, 0, 150.5, 166.5 )
	TabbedScoreboardFuiBox:setAlpha( 0.6 )
	TabbedScoreboardFuiBox:setScale( 0.6, 0.6 )
	self:addElement( TabbedScoreboardFuiBox )
	self.TabbedScoreboardFuiBox = TabbedScoreboardFuiBox
	
	local DotPipR = LUI.UIImage.new( 0, 0, 1710, 1714, 0, 0, 162.5, 166.5 )
	DotPipR:setRGB( 0.38, 0.38, 0.4 )
	DotPipR:setAlpha( 0.2 )
	DotPipR:setImage( RegisterImage( 0x3854665C02218EF ) )
	DotPipR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotPipR )
	self.DotPipR = DotPipR
	
	local DotPipL = LUI.UIImage.new( 0, 0, 935, 939, 0, 0, 162.5, 166.5 )
	DotPipL:setRGB( 0.38, 0.38, 0.4 )
	DotPipL:setAlpha( 0.2 )
	DotPipL:setImage( RegisterImage( 0x3854665C02218EF ) )
	DotPipL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotPipL )
	self.DotPipL = DotPipL
	
	self:mergeStateConditions( {
		{
			stateName = "Zombies",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "mode", Enum.eModes[0x3723205FAE52C4A] )
			end
		}
	} )
	self:linkToElementModel( self, "mode", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "mode"
		} )
	end )
	local f1_local8 = self
	local f1_local9 = self.subscribeToModel
	local f1_local10 = DataSources.CharacterBreadcrumbs.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.breadcrumbCount, function ( f20_arg0, f20_arg1 )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x29E5695FF1401AD] )
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x29E5695FF1401AD], nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f21_arg2, "CharacterBreadcrumbs", "breadcrumbCount", 0 ) and not IsPC() then
			CoD.BreadcrumbUtility.ClearAllPersonalizationBreadcrumbs( f21_arg1, f21_arg2 )
			UpdateElementState( self, "specialists", f21_arg2 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f22_arg2, "CharacterBreadcrumbs", "breadcrumbCount", 0 ) and not IsPC() then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x5619D8212EDA599, nil, nil )
			return true
		else
			return false
		end
	end, false )
	Characters.id = "Characters"
	self.__defaultFocus = Characters
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local9 = self
	f1_local9 = Characters
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local9, f1_arg1, "name", "", "" )
	end
	return self
end

CoD.CharacterSelection_StandardFrameWidget.__resetProperties = function ( f23_arg0 )
	f23_arg0.CharacterText:completeAnimation()
	f23_arg0.SpecialistText:completeAnimation()
	f23_arg0.CharacterText:setAlpha( 0 )
	f23_arg0.SpecialistText:setAlpha( 1 )
end

CoD.CharacterSelection_StandardFrameWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 0 )
		end
	},
	Zombies = {
		DefaultClip = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 2 )
			f25_arg0.SpecialistText:completeAnimation()
			f25_arg0.SpecialistText:setAlpha( 0 )
			f25_arg0.clipFinished( f25_arg0.SpecialistText )
			f25_arg0.CharacterText:completeAnimation()
			f25_arg0.CharacterText:setAlpha( 1 )
			f25_arg0.clipFinished( f25_arg0.CharacterText )
		end
	}
}
CoD.CharacterSelection_StandardFrameWidget.__onClose = function ( f26_arg0 )
	f26_arg0.Characters:close()
	f26_arg0.TabbedScoreboardFuiBox:close()
end

