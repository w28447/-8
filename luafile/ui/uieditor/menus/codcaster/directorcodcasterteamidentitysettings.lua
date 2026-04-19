require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/codcaster/codcasterteamidentitysettingscontainer" )
require( "ui/uieditor/widgets/lobby/common/fe_buttonpanelshadercontainer" )
require( "ui/uieditor/widgets/lobby/common/fe_menu_leftgraphics" )
require( "ui/uieditor/widgets/lobby/lobbystreamerblackfade" )

CoD.DirectorCodCasterTeamIdentitySettings = InheritFrom( CoD.Menu )
LUI.createMenu.DirectorCodCasterTeamIdentitySettings = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "DirectorCodCasterTeamIdentitySettings", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.DirectorCodCasterTeamIdentitySettings )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueEqualTo( "hideWorldForStreamer", 0 )
			end
		}
	} )
	local FEMenuLeftGraphics = FadeForStreamer
	local GenericMenuFrame = FadeForStreamer.subscribeToModel
	local TeamColorList = Engine.GetGlobalModel()
	GenericMenuFrame( FEMenuLeftGraphics, TeamColorList.hideWorldForStreamer, function ( f3_arg0 )
		f1_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f3_arg0:get(),
			modelName = "hideWorldForStreamer"
		} )
	end, false )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x7A023700261F0B2 ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f4_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f1_local1, f1_arg0, 0, 0, 29, 107, 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	TeamColorList = CoD.CodCasterTeamIdentitysettingscontainer.new( f1_local1, f1_arg0, 0.5, 0.5, -809.5, 759.5, 0, 0, -9.5, 893.5 )
	TeamColorList:subscribeToGlobalModel( f1_arg0, "TeamIdentityInformation", "teamName", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			TeamColorList.TeamNameInputButton2.Title:setText( f5_local0 )
		end
	end )
	self:addElement( TeamColorList )
	self.TeamColorList = TeamColorList
	
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f6_local0 = nil
		HandleTeamIdentityKeyboardComplete( self, element, f1_arg0, event )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		SaveShoutcasterSettings( self, f7_arg0, f7_arg2 )
		RefreshLobbyGameClient( self, f7_arg2 )
		GoBack( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
		return true
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	TeamColorList.id = "TeamColorList"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = GenericMenuFrame
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.DirectorCodCasterTeamIdentitySettings.__onClose = function ( f11_arg0 )
	f11_arg0.FEButtonPanelShaderContainer0:close()
	f11_arg0.FadeForStreamer:close()
	f11_arg0.GenericMenuFrame:close()
	f11_arg0.FEMenuLeftGraphics:close()
	f11_arg0.TeamColorList:close()
end

