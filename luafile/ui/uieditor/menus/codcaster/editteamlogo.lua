require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/cac/cac_listbuttonlabel" )
require( "ui/uieditor/widgets/codcaster/codcasterteamlogobutton" )
require( "ui/uieditor/widgets/lobby/common/fe_buttonpanelshadercontainer" )
require( "ui/uieditor/widgets/lobby/common/fe_menu_leftgraphics" )
require( "ui/uieditor/widgets/lobby/lobbystreamerblackfade" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "TeamIdentity" )
	if f1_local0 then
		f1_arg0.GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( Engine.ToUpper( Engine[0xF9F1239CFD921FE]( 0xF3217BFCDBF3B46 .. Engine.GetModelValue( Engine.GetModel( f1_local0, "team" ) ) .. "_LOGO" ) ) )
	end
end

CoD.EditTeamLogo = InheritFrom( CoD.Menu )
LUI.createMenu.EditTeamLogo = function ( f2_arg0, f2_arg1 )
	local self = CoD.Menu.NewForUIEditor( "EditTeamLogo", f2_arg0 )
	local f2_local1 = self
	self:setClass( CoD.EditTeamLogo )
	self.soundSet = "ChooseDecal"
	self:setOwner( f2_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f2_arg0 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f2_local1, f2_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f2_local1, f2_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueEqualTo( "hideWorldForStreamer", 0 )
			end
		}
	} )
	local BoxButtonLrgIdle = FadeForStreamer
	local GenericMenuFrame = FadeForStreamer.subscribeToModel
	local Border = Engine.GetGlobalModel()
	GenericMenuFrame( BoxButtonLrgIdle, Border.hideWorldForStreamer, function ( f4_arg0 )
		f2_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f2_local1,
			controller = f2_arg0,
			modelValue = f4_arg0:get(),
			modelName = "hideWorldForStreamer"
		} )
	end, false )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	GenericMenuFrame = CoD.GenericMenuFrame.new( f2_local1, f2_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x4E051F15AE3B3B8 ) )
	GenericMenuFrame:subscribeToGlobalModel( f2_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f5_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	BoxButtonLrgIdle = LUI.UIImage.new( 0.5, 0.5, -66, 697, 0, 0, 216, 694 )
	BoxButtonLrgIdle:setAlpha( 0.45 )
	BoxButtonLrgIdle:setImage( RegisterImage( 0x535D18C44834110 ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFD777557404A7B3 ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	Border = LUI.UIImage.new( 0.5, 0.5, -58, 687, 0, 0, 220, 689 )
	Border:setAlpha( 0.43 )
	Border:setImage( RegisterImage( 0x8F6569FEEE42A57 ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFD777557404A7B3 ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local LogoList = LUI.UIList.new( f2_local1, f2_arg0, 10, 0, nil, true, false, false, false )
	LogoList:setLeftRight( 0.5, 0.5, -762, -112 )
	LogoList:setTopBottom( 0, 0, 222, 792 )
	LogoList:setWidgetType( CoD.CodCasterTeamLogoButton )
	LogoList:setHorizontalCount( 3 )
	LogoList:setVerticalCount( 4 )
	LogoList:setSpacing( 10 )
	LogoList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	LogoList:setDataSource( "TeamIdentityLogoList" )
	LogoList:linkToElementModel( LogoList, "disabled", true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f2_local1, f2_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	LogoList:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, f2_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f2_local1:AddButtonCallbackFunction( LogoList, f2_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsDisabled( f8_arg0, f8_arg2 ) then
			SetTeamIdentityTeamLogo( self, f8_arg0, f8_arg2 )
			SetTeamIdentityProfileValue( self, f8_arg0, f8_arg2, "icon" )
			SaveShoutcasterSettings( self, f8_arg0, f8_arg2 )
			GoBack( self, f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsDisabled( f9_arg0, f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( LogoList )
	self.LogoList = LogoList
	
	local LogoImageHintImage = LUI.UIImage.new( 0.5, 0.5, 87, 556, 0, 0, 219, 688 )
	self:addElement( LogoImageHintImage )
	self.LogoImageHintImage = LogoImageHintImage
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f2_local1, f2_arg0, 0.5, 0.5, -949, -871, 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local LabelButton = CoD.cac_ListButtonLabel.new( f2_local1, f2_arg0, 0.5, 0.5, -17, 139, 1, 1, -438, -408 )
	LabelButton:setAlpha( 0.6 )
	LabelButton:setScale( 1.25, 1.25 )
	self:addElement( LabelButton )
	self.LabelButton = LabelButton
	
	LogoImageHintImage:linkToElementModel( LogoList, "ref", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			LogoImageHintImage:setImage( RegisterImage( f10_local0 ) )
		end
	end )
	LabelButton:linkToElementModel( LogoList, "name", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			LabelButton.itemName:setText( Engine[0xF9F1239CFD921FE]( f11_local0 ) )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f12_local0 = nil
		HandleTeamIdentityKeyboardComplete( self, element, f2_arg0, event )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, f2_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		SaveShoutcasterSettings( self, f13_arg0, f13_arg2 )
		GoBack( self, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, f2_arg0 )
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	LogoList.id = "LogoList"
	self:processEvent( {
		name = "menu_loaded",
		controller = f2_arg0
	} )
	self.__defaultFocus = LogoList
	if CoD.isPC and (IsKeyboard( f2_arg0 ) or self.ignoreCursor) then
		self:restoreState( f2_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f2_arg0 )
	end
	
	return self
end

CoD.EditTeamLogo.__onClose = function ( f15_arg0 )
	f15_arg0.LogoImageHintImage:close()
	f15_arg0.LabelButton:close()
	f15_arg0.FEButtonPanelShaderContainer0:close()
	f15_arg0.FadeForStreamer:close()
	f15_arg0.GenericMenuFrame:close()
	f15_arg0.LogoList:close()
	f15_arg0.FEMenuLeftGraphics:close()
end

