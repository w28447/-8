require( "ui/uieditor/menus/codcaster/editteamlogo" )
require( "ui/uieditor/widgets/codcaster/codcaster_color_element" )
require( "ui/uieditor/widgets/codcaster/codcasterfakemap" )
require( "ui/uieditor/widgets/codcaster/codcasterteamlogobutton" )
require( "x64:d56f0abc01d5b34" )

CoD.CodCasterTeamIdentitysettingscontainer = InheritFrom( LUI.UIElement )
CoD.CodCasterTeamIdentitysettingscontainer.__defaultWidth = 1569
CoD.CodCasterTeamIdentitysettingscontainer.__defaultHeight = 903
CoD.CodCasterTeamIdentitysettingscontainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CodCasterTeamIdentitysettingscontainer )
	self.id = "CodCasterTeamIdentitysettingscontainer"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TeamLogoTitle = LUI.UIText.new( 0, 0, 0, 300, 0, 0, 153.5, 174.5 )
	TeamLogoTitle:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	TeamLogoTitle:setText( LocalizeToUpperString( 0xA3B7C749002927B ) )
	TeamLogoTitle:setTTF( "ttmussels_regular" )
	TeamLogoTitle:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	TeamLogoTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLogoTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamLogoTitle:setLetterSpacing( 1 )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamLogoTitle:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TeamLogoTitle )
	self.TeamLogoTitle = TeamLogoTitle
	
	local TeamNameTitle = LUI.UIText.new( 0, 0, 0, 300, 0, 0, 538, 555 )
	TeamNameTitle:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	TeamNameTitle:setText( LocalizeToUpperString( 0x50940719C87AA8F ) )
	TeamNameTitle:setTTF( "ttmussels_regular" )
	TeamNameTitle:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	TeamNameTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamNameTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamNameTitle:setLetterSpacing( 1 )
	TeamNameTitle:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamNameTitle:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TeamNameTitle )
	self.TeamNameTitle = TeamNameTitle
	
	local TeamNameInputTextBox = nil
	
	TeamNameInputTextBox = CoD.CodCasterTeamRenameTextBox.new( f1_arg0, f1_arg1, 0.5, 0.5, -783.5, -383.5, 0, 0, 571.5, 631.5 )
	TeamNameInputTextBox:subscribeToGlobalModel( f1_arg1, "TeamIdentityInformation", "teamName", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			TeamNameInputTextBox.RenameText:setText( f2_local0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( TeamNameInputTextBox, "childFocusLost", function ( element )
		if CoD.ModelUtility.IsControllerModelValueNonEmptyString( f1_arg1, "renameEmblemText" ) then
			SetElementState( self, element, f1_arg1, "DefaultState" )
			CoD.PCUtility.EmblemEditor_RenameEmblem( self, f1_arg1 )
			CoD.CodCasterUtility.TeamSettings_RenameTeam( self, f1_arg1 )
		end
	end )
	self:addElement( TeamNameInputTextBox )
	self.TeamNameInputTextBox = TeamNameInputTextBox
	
	local f1_local4 = nil
	f1_local4 = LUI.UIElement.createFake()
	self.TeamNameInputButton2 = f1_local4
	
	local TeamColorTitle = LUI.UIText.new( 0, 0, 0, 300, 0, 0, 678.5, 699.5 )
	TeamColorTitle:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	TeamColorTitle:setText( LocalizeToUpperString( 0x89D11442E6707B ) )
	TeamColorTitle:setTTF( "ttmussels_regular" )
	TeamColorTitle:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	TeamColorTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 1, 0, 0, 0, 0 )
	TeamColorTitle:setShaderVector( 2, 1, 0, 0, 0 )
	TeamColorTitle:setLetterSpacing( 0.08 )
	TeamColorTitle:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamColorTitle:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TeamColorTitle )
	self.TeamColorTitle = TeamColorTitle
	
	local TeamLogoImageButton = CoD.CodCasterTeamLogoButton.new( f1_arg0, f1_arg1, 0, 0, 1, 460, 0, 0, 190.5, 485.5 )
	TeamLogoImageButton:subscribeToGlobalModel( f1_arg1, "TeamIdentityInformation", "teamLogo", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			TeamLogoImageButton.unfocused:setImage( RegisterImage( f4_local0 ) )
		end
	end )
	TeamLogoImageButton:subscribeToGlobalModel( f1_arg1, "TeamIdentityInformation", "teamLogoName", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			TeamLogoImageButton.LabelButton.itemName:setText( Engine[0xF9F1239CFD921FE]( f5_local0 ) )
		end
	end )
	TeamLogoImageButton:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f6_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TeamLogoImageButton, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		OpenOverlay( self, "EditTeamLogo", f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( TeamLogoImageButton )
	self.TeamLogoImageButton = TeamLogoImageButton
	
	local CodCasterFakeMap = CoD.CodCasterFakeMap.new( f1_arg0, f1_arg1, 0, 0, 783, 1569, 0, 0, 0, 903 )
	self:addElement( CodCasterFakeMap )
	self.CodCasterFakeMap = CodCasterFakeMap
	
	local TeamColorList = LUI.UIList.new( f1_arg0, f1_arg1, 12, 0, nil, false, false, false, false )
	TeamColorList:setLeftRight( 0, 0, 0, 597 )
	TeamColorList:setTopBottom( 0, 0, 712.5, 874.5 )
	TeamColorList:setWidgetType( CoD.codcaster_color_element )
	TeamColorList:setHorizontalCount( 7 )
	TeamColorList:setVerticalCount( 2 )
	TeamColorList:setSpacing( 12 )
	TeamColorList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamColorList:setDataSource( "TeamIdentityColorList" )
	TeamColorList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f9_local0
	end )
	f1_arg0:AddButtonCallbackFunction( TeamColorList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		UpdateSelectedTeamIdentityColorElement( self, f10_arg0, f10_arg2 )
		SetTeamIdentityTeamColor( self, f10_arg0, f10_arg2 )
		SetTeamIdentityProfileValue( self, f10_arg0, f10_arg2, "color" )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( TeamColorList )
	self.TeamColorList = TeamColorList
	
	if CoD.isPC then
		TeamNameInputTextBox.id = "TeamNameInputTextBox"
	end
	f1_local4.id = "TeamNameInputButton2"
	TeamLogoImageButton.id = "TeamLogoImageButton"
	TeamColorList.id = "TeamColorList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.CodCasterTeamIdentitysettingscontainer.__onClose = function ( f12_arg0 )
	f12_arg0.TeamNameInputTextBox:close()
	f12_arg0.TeamNameInputButton2:close()
	f12_arg0.TeamLogoImageButton:close()
	f12_arg0.CodCasterFakeMap:close()
	f12_arg0.TeamColorList:close()
end

