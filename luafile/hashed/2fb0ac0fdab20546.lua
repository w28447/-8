require( "x64:e6df4068375d284" )
require( "x64:b64d9dfa5911bd2" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )
require( "ui/uieditor/widgets/startmenu/startmenu_signatureitem" )

CoD.ChooseSpecialistMidMatch = InheritFrom( CoD.Menu )
LUI.createMenu.ChooseSpecialistMidMatch = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ChooseSpecialistMidMatch", f1_arg0 )
	local f1_local1 = self
	CoD.StartMenuUtility.SetupMidMatchClassSelect( f1_arg0 )
	self:setClass( CoD.ChooseSpecialistMidMatch )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuOptionsBackground = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, -0, 1, 0, 0 )
	self:addElement( StartMenuOptionsBackground )
	self.StartMenuOptionsBackground = StartMenuOptionsBackground
	
	local specialistRespawnDesc = LUI.UIText.new( 0.5, 0.5, -281.5, 281.5, 0, 0, 256, 289 )
	specialistRespawnDesc:setZoom( 10 )
	specialistRespawnDesc:setText( LocalizeToUpperString( 0xAC6339F7CCE11C4 ) )
	specialistRespawnDesc:setTTF( "ttmussels_demibold" )
	specialistRespawnDesc:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	specialistRespawnDesc:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( specialistRespawnDesc )
	self.specialistRespawnDesc = specialistRespawnDesc
	
	local Characters = LUI.UIList.new( f1_local1, f1_arg0, 2, 0, nil, false, false, false, false )
	Characters:mergeStateConditions( {
		{
			stateName = "ViewSelectedPlayer_Searching",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	local SignatureEquipment = Characters
	local SignatureAbility = Characters.subscribeToModel
	local ChangeClassButton = Engine.GetModelForController( f1_arg0 )
	SignatureAbility( SignatureEquipment, ChangeClassButton["PositionEditLoadout.SelectedCharacterIndex"], function ( f3_arg0 )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f3_arg0:get(),
			modelName = "PositionEditLoadout.SelectedCharacterIndex"
		} )
	end, false )
	Characters:linkToElementModel( Characters, "characterIndex", true, function ( model )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "characterIndex"
		} )
	end )
	Characters:linkToElementModel( Characters, "isBMLocked", true, function ( model )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "isBMLocked"
		} )
	end )
	Characters:linkToElementModel( Characters, "disabled", true, function ( model )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "disabled"
		} )
	end )
	Characters:linkToElementModel( Characters, "unavailable", true, function ( model )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = model:get(),
			modelName = "unavailable"
		} )
	end )
	SignatureEquipment = Characters
	SignatureAbility = Characters.subscribeToModel
	ChangeClassButton = Engine.GetGlobalModel()
	SignatureAbility( SignatureEquipment, ChangeClassButton["hudItems.specialistSwitchIsLethal"], function ( f8_arg0 )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f8_arg0:get(),
			modelName = "hudItems.specialistSwitchIsLethal"
		} )
	end, false )
	SignatureEquipment = Characters
	SignatureAbility = Characters.subscribeToModel
	ChangeClassButton = Engine.GetModelForController( f1_arg0 )
	SignatureAbility( SignatureEquipment, ChangeClassButton["UIVisibilityBit." .. Enum.UIVisibilityBit[0x534C7B2375D2D47]], function ( f9_arg0 )
		f1_local1:updateElementState( Characters, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x534C7B2375D2D47]
		} )
	end, false )
	Characters:setLeftRight( 0.5, 0.5, -594, 594 )
	Characters:setTopBottom( 0, 0, 384, 696 )
	Characters:setWidgetType( CoD.PositionDraft_Character )
	Characters:setHorizontalCount( 7 )
	Characters:setVerticalCount( 2 )
	Characters:setBalanceGridRows( true )
	Characters:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Characters:setDataSource( "PositionDraftCharacters" )
	Characters:registerEventHandler( "lose_list_focus", function ( element, event )
		local f10_local0 = nil
		CoD.GridAndListUtility.UpdateDataSource( self.Characters, false, false, false )
		return f10_local0
	end )
	Characters:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_local1:AddButtonCallbackFunction( Characters, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsInDefaultState( f12_arg0 ) then
			CoD.PlayerRoleUtility.InGameChangeSpecialist( f12_arg0, f12_arg2 )
			PlaySoundAlias( "uin_start_char_select" )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if IsInDefaultState( f13_arg0 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Characters )
	self.Characters = Characters
	
	SignatureAbility = CoD.StartMenu_SignatureItem.new( f1_local1, f1_arg0, 0.5, 0.5, -27.5, 512.5, 1, 1, -237, -122 )
	SignatureAbility:setZoom( 10 )
	SignatureAbility:setScale( 0.8, 0.8 )
	self:addElement( SignatureAbility )
	self.SignatureAbility = SignatureAbility
	
	SignatureEquipment = CoD.StartMenu_SignatureItem.new( f1_local1, f1_arg0, 0.5, 0.5, -489, 51, 1, 1, -237, -122 )
	SignatureEquipment:setZoom( 10 )
	SignatureEquipment:setScale( 0.8, 0.8 )
	self:addElement( SignatureEquipment )
	self.SignatureEquipment = SignatureEquipment
	
	ChangeClassButton = CoD.DirectorGenericButton.new( f1_local1, f1_arg0, 0.5, 0.5, -125, 125, 1, 1, -356, -264 )
	ChangeClassButton:setScale( 0.8, 0.8 )
	ChangeClassButton.DirectorSelectButtonMiniInternal.MiddleText:setText( LocalizeToUpperString( "mpui/change_class" ) )
	ChangeClassButton.DirectorSelectButtonMiniInternal.MiddleTextFocus:setText( LocalizeToUpperString( "mpui/change_class" ) )
	ChangeClassButton:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f14_local0
	end )
	f1_local1:AddButtonCallbackFunction( ChangeClassButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		CoD.StartMenuUtility.ShowClassSelectSlideout( f15_arg1, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( ChangeClassButton )
	self.ChangeClassButton = ChangeClassButton
	
	SignatureAbility:linkToElementModel( Characters, "equipment", false, function ( model )
		SignatureAbility:setModel( model, f1_arg0 )
	end )
	SignatureEquipment:linkToElementModel( Characters, "ability", false, function ( model )
		SignatureEquipment:setModel( model, f1_arg0 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "PositionDraft.stage", function ( model )
		local f19_local0 = self
		if CoD.ModelUtility.IsParamModelEqualToEnum( model, CoD.PlayerRoleUtility.DraftStage.DRAFT_STAGE_NONE ) then
			GoBack( self, f1_arg0 )
		end
	end )
	Characters.id = "Characters"
	ChangeClassButton.id = "ChangeClassButton"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = Characters
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local8 = self
	CoD.StartMenuUtility.AddClassSelectSlideout( f1_local1, f1_arg0 )
	SetElementPropertyEnum( Characters, "tooltipArchetype", CoD.FreeCursorUtility.TooltipArchetypes.DEFAULT )
	return self
end

CoD.ChooseSpecialistMidMatch.__onClose = function ( f20_arg0 )
	f20_arg0.SignatureAbility:close()
	f20_arg0.SignatureEquipment:close()
	f20_arg0.StartMenuOptionsBackground:close()
	f20_arg0.Characters:close()
	f20_arg0.ChangeClassButton:close()
end

