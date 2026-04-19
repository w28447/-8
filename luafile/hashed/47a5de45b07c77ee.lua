require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlined" )
require( "ui/uieditor/widgets/fileshare/fullscreenpopup/fullscreenpopuptemplate" )
require( "ui/uieditor/widgets/itemshop/purchasereservesitembutton" )
require( "ui/uieditor/widgets/playercard/selfidentitybadge" )
require( "ui/uieditor/widgets/startmenu/startmenu_codpoints" )

CoD.OpenBribeConfirmation = InheritFrom( CoD.Menu )
LUI.createMenu.OpenBribeConfirmation = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "OpenBribeConfirmation", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1._properties )
	SetMenuProperty( f1_local1, "__keepPopupButtonListPC", true )
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, self, f1_arg1._model )
	CoD.BlackMarketUtility.SetBribeNamePropertyByType( f1_arg0, f1_local1 )
	self:setClass( CoD.OpenBribeConfirmation )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate = CoD.FullscreenPopupTemplate.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	FullscreenPopupTemplate:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return IsElementInState( element, "WorkingState" )
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return IsElementInState( element, "ErrorState" )
			end
		},
		{
			stateName = "CustomState",
			condition = function ( menu, element, event )
				return IsElementInState( element, "CustomState" )
			end
		},
		{
			stateName = "FinishedState",
			condition = function ( menu, element, event )
				return IsElementInState( element, "FinishedState" )
			end
		}
	} )
	FullscreenPopupTemplate.ButtonList:setWidgetType( CoD.PurchaseReservesItemButton )
	FullscreenPopupTemplate.Subtitle:setText( Engine[0xF9F1239CFD921FE]( CoD.BlackMarketUtility.GetBribeDescFromMenuProperty( f1_arg0, f1_local1, 0x90DD4B440AD5949 ) ) )
	FullscreenPopupTemplate.ErrorSubtitle:setText( "" )
	FullscreenPopupTemplate.WorkingTitle:setText( LocalizeToUpperString( "menu/purchase_processing" ) )
	FullscreenPopupTemplate.Title:setText( LocalizeToUpperString( CoD.BlackMarketUtility.GetBribeNameFromMenuProperty( f1_arg0, f1_local1, 0x63FCD1B0849669E ) ) )
	FullscreenPopupTemplate.DoneTitle:setText( LocalizeToUpperString( "menu/purchase_complete" ) )
	FullscreenPopupTemplate:linkToElementModel( self, nil, false, function ( model )
		FullscreenPopupTemplate:setModel( model, f1_arg0 )
	end )
	self:addElement( FullscreenPopupTemplate )
	self.FullscreenPopupTemplate = FullscreenPopupTemplate
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, f1_arg0, 0.5, 0.5, 541, 872, 0, 0, 33.5, 98.5 )
	SelfIdentityBadge:setAlpha( 0 )
	SelfIdentityBadge:subscribeToGlobalModel( f1_arg0, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, f1_arg0 )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FixedAspectRatioImage = LUI.UIFixedAspectRatioImage.new( 0.5, 0.5, -960, -324, 0.5, 0.5, -215.5, 228.5 )
	FixedAspectRatioImage:setStretchedDimension( 6 )
	FixedAspectRatioImage:subscribeToGlobalModel( f1_arg0, "ReservesItemCounts", "lootCaseCount", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			FixedAspectRatioImage:setImage( RegisterImage( CoD.BlackMarketUtility.GetBribeImageFromMenuProperty( f1_arg0, f1_local1, f8_local0 ) ) )
		end
	end )
	self:addElement( FixedAspectRatioImage )
	self.FixedAspectRatioImage = FixedAspectRatioImage
	
	local Linker = LUI.UIImage.new( 0.5, 0.5, -330, -326, 0.5, 0.5, -192, 205 )
	Linker:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	Linker:setAlpha( 0.35 )
	Linker:setImage( RegisterImage( "uie_ui_hud_tak5_repeat_linker" ) )
	Linker:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	Linker:setShaderVector( 0, 0, 0, 0, 0 )
	Linker:setupNineSliceShader( 4, 8 )
	self:addElement( Linker )
	self.Linker = Linker
	
	local StartMenuCODpoints = CoD.StartMenu_CODpoints.new( f1_local1, f1_arg0, 0.5, 0.5, 341, 445, 0, 0, 23.5, 103.5 )
	StartMenuCODpoints:setAlpha( 0 )
	StartMenuCODpoints:subscribeToGlobalModel( f1_arg0, "LootStreamProgress", "codPoints", function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			StartMenuCODpoints.codpointsCount:setText( SetValueIfNumberEqualTo( -1, "-", f9_local0 ) )
		end
	end )
	self:addElement( StartMenuCODpoints )
	self.StartMenuCODpoints = StartMenuCODpoints
	
	local CommonIdentityWidgetStreamlinedPC = nil
	
	CommonIdentityWidgetStreamlinedPC = CoD.CommonIdentityWidgetStreamlined.new( f1_local1, f1_arg0, 0.5, 0.5, 426, 956, 0.5, 0.5, -282, -242 )
	CommonIdentityWidgetStreamlinedPC:subscribeToGlobalModel( f1_arg0, "PerController", "identityBadge", function ( model )
		CommonIdentityWidgetStreamlinedPC:setModel( model, f1_arg0 )
	end )
	self:addElement( CommonIdentityWidgetStreamlinedPC )
	self.CommonIdentityWidgetStreamlinedPC = CommonIdentityWidgetStreamlinedPC
	
	local f1_local8 = nil
	self.CommonIdentityWidgetStreamlinedC = LUI.UIElement.createFake()
	
	local Purchase = LUI.UIText.new( 0.5, 0.5, -960, -330, 0.5, 0.5, 104, 124 )
	Purchase:setRGB( 0.82, 0.95, 1 )
	Purchase:setText( LocalizeToUpperString( 0x4E98D63EA5A0BD3 ) )
	Purchase:setTTF( "ttmussels_regular" )
	Purchase:setLetterSpacing( 3 )
	Purchase:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Purchase:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Purchase )
	self.Purchase = Purchase
	
	local ItemName = LUI.UIText.new( 0.5, 0.5, -914.5, -370.5, 0.5, 0.5, 138, 178 )
	ItemName:setRGB( 0.5, 0.85, 1 )
	ItemName:setText( LocalizeToUpperString( CoD.BlackMarketUtility.GetBribeNameFromMenuProperty( f1_arg0, f1_local1, 0x0 ) ) )
	ItemName:setTTF( "ttmussels_demibold" )
	ItemName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x93F361CC41C94AF ) )
	ItemName:setShaderVector( 0, 0.8, 0, 0, 0 )
	ItemName:setShaderVector( 1, 0, 0, 0, 0 )
	ItemName:setShaderVector( 2, 0, 0.7, 1, 0.2 )
	ItemName:setLetterSpacing( 6 )
	ItemName:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ItemName:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local BracketLeft = LUI.UIImage.new( 0.5, 0.5, -926, -902, 0.5, 0.5, 121, 193 )
	BracketLeft:setRGB( 0.79, 0.94, 1 )
	BracketLeft:setYRot( 180 )
	BracketLeft:setImage( RegisterImage( 0xE1C1C55D18A0A1B ) )
	self:addElement( BracketLeft )
	self.BracketLeft = BracketLeft
	
	local BracketRight = LUI.UIImage.new( 0.5, 0.5, -383, -359, 0.5, 0.5, 121, 193 )
	BracketRight:setRGB( 0.79, 0.94, 1 )
	BracketRight:setImage( RegisterImage( 0xE1C1C55D18A0A1B ) )
	self:addElement( BracketRight )
	self.BracketRight = BracketRight
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		PlaySoundAlias( "uin_toggle_generic" )
		CoD.BlackMarketUtility.OpenNonCPBribe( f13_arg2, f13_arg1 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
		return true
	end, false )
	FullscreenPopupTemplate.buttons:setModel( self.buttonModel, f1_arg0 )
	FullscreenPopupTemplate.buttonPC:setModel( self.buttonModel, f1_arg0 )
	FullscreenPopupTemplate.id = "FullscreenPopupTemplate"
	SelfIdentityBadge.id = "SelfIdentityBadge"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = FullscreenPopupTemplate
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local13 = self
	f1_local13 = FullscreenPopupTemplate
	if IsPC() then
		CoD.PCUtility.LinkPCSmallCloseButtonToInput( f1_local1, f1_arg0, f1_local13, Enum.LUIButton[0x805EFA15E9E7E5A] )
	end
	f1_local13 = FixedAspectRatioImage
	return self
end

CoD.OpenBribeConfirmation.__onClose = function ( f15_arg0 )
	f15_arg0.FullscreenPopupTemplate:close()
	f15_arg0.SelfIdentityBadge:close()
	f15_arg0.FixedAspectRatioImage:close()
	f15_arg0.StartMenuCODpoints:close()
	f15_arg0.CommonIdentityWidgetStreamlinedPC:close()
	f15_arg0.CommonIdentityWidgetStreamlinedC:close()
end

