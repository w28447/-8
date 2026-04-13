require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/director/directorcustomizeclasszm" )
require( "ui/uieditor/widgets/zmfrontend/cac/zmcustomizeclasssafeareacontainer" )
require( "x64:6ee653ade3452f5" )

CoD.ZMCustomizeClassMenu = InheritFrom( CoD.Menu )
LUI.createMenu.ZMCustomizeClassMenu = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ZMCustomizeClassMenu", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	CoD.ZMStoryUtility.SetSelectedStoryToCurrentMapStory( f1_arg0 )
	CoD.LobbyUtility.SetMenuControllerRestriction( self, f1_arg0, 1 )
	self:setClass( CoD.ZMCustomizeClassMenu )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	local ScorestreakAspectRatioFix = nil
	
	ScorestreakAspectRatioFix = CoD.Scorestreak_AspectRatioFix.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( ScorestreakAspectRatioFix )
	self.ScorestreakAspectRatioFix = ScorestreakAspectRatioFix
	
	local DirectorCustomizeClassZM = CoD.DirectorCustomizeClassZM.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( DirectorCustomizeClassZM )
	self.DirectorCustomizeClassZM = DirectorCustomizeClassZM
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.BGSceneBlur:setAlpha( 1 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xFE4770705278297 ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local SafeAreaContainer = CoD.ZMCustomizeClassSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	SafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( SafeAreaContainer )
	self.SafeAreaContainer = SafeAreaContainer
	
	DirectorCustomizeClassZM:linkToElementModel( SafeAreaContainer.customClassList.customClasssList, nil, false, function ( model )
		DirectorCustomizeClassZM:setModel( model, f1_arg0 )
	end )
	GenericMenuFrame:linkToElementModel( SafeAreaContainer.customClassList.customClasssList, nil, false, function ( model )
		GenericMenuFrame.CommonHeader:setModel( model, f1_arg0 )
	end )
	self:linkToElementModel( self, nil, true, function ( model, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x22361E23588705A] )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		GoBack( self, f7_arg2 )
		SendClientScriptMenuChangeNotify( f7_arg2, f7_arg1, false )
		SaveLoadoutGeneric( f7_arg2 )
		UpdateGamerprofile( self, f7_arg0, f7_arg2 )
		CoD.ZMLoadoutUtility.SaveZMLoadoutBuffer( f7_arg2 )
		CoD.LobbyUtility.SetMenuControllerRestriction( self, f7_arg2, 0 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x22361E23588705A], "ui_contextual_1", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not CoD.CACUtility.IsCurrentClassLocked( f9_arg1, f9_arg2 ) then
			CoD.CACUtility.OpenClassOptions( self, f9_arg1, f9_arg2, "ClassOptions" )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not CoD.CACUtility.IsCurrentClassLocked( f10_arg1, f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x22361E23588705A], 0x27F19FF8EF11A44, nil, "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ResetFrontendMusic( f1_arg0 )
		CoD.ZMStoryUtility.SetSelectedStoryToCurrentMapStory( f1_arg0 )
	end )
	DirectorCustomizeClassZM.id = "DirectorCustomizeClassZM"
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	SafeAreaContainer.id = "SafeAreaContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = DirectorCustomizeClassZM
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	local f1_local6 = self
	if not CoD.BaseUtility.IsMenuSessionModeEqualTo( f1_local1, Enum.eModes[0xB22E0240605CFFE] ) then
		CoD.BaseUtility.SetStateByMenuSessionMode( f1_local1, self, f1_arg0 )
		CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "ZMLoadoutIntroduction" )
	else
		SetCharacterModeToSessionMode( self, f1_arg0, Enum.eModes[0x3723205FAE52C4A] )
		CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg0, "ZMLoadoutIntroduction" )
	end
	return self
end

CoD.ZMCustomizeClassMenu.__onClose = function ( f12_arg0 )
	f12_arg0.DirectorCustomizeClassZM:close()
	f12_arg0.GenericMenuFrame:close()
	f12_arg0.ScorestreakAspectRatioFix:close()
	f12_arg0.SafeAreaContainer:close()
end

