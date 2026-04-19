require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/lobby/common/fe_buttonpanelshadercontainer" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.CallingCards_BlackMarket = InheritFrom( CoD.Menu )
LUI.createMenu.CallingCards_BlackMarket = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "CallingCards_BlackMarket", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.CallingCards_BlackMarket )
	self.soundSet = "ChooseDecal"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f1_local1, f1_arg0, 0, 0, -16, 1928, 0, 0, 174, 1101 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new( 0, 1, 0, 0, 0.5, 0.5, -504, -414 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	MenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xED22CCD3920E18B ) )
	MenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			MenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local Frame = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
	Frame:setLeftRight( 0.5, 0.5, -862.5, 862.5 )
	Frame:setTopBottom( 0.5, 0.5, -390, 390 )
	Frame:subscribeToGlobalModel( f1_arg0, "BlackMarketCallingCardMenu", "frameWidget", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			Frame:changeFrameWidget( f3_local0 )
		end
	end )
	self:addElement( Frame )
	self.Frame = Frame
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		SetPerControllerTableProperty( f4_arg2, "currentCallingCardBlackMarketElement", nil )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.BreadcrumbUtility.UploadBuffer( f1_arg0, Enum.eModes[0x83EBA96F36BC4E5] )
	end )
	MenuFrame:setModel( self.buttonModel, f1_arg0 )
	MenuFrame.id = "MenuFrame"
	Frame.id = "Frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = Frame
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.CallingCards_BlackMarket.__onClose = function ( f9_arg0 )
	f9_arg0.Background:close()
	f9_arg0.FEButtonPanelShaderContainer0:close()
	f9_arg0.MenuFrame:close()
	f9_arg0.Frame:close()
end

