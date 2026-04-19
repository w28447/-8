require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/director/theater/directortheaterselectfile" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.Theater_SelectFilm = InheritFrom( CoD.Menu )
LUI.createMenu.Theater_SelectFilm = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Theater_SelectFilm", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.Theater_SelectFilm )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BGBlur = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BGBlur:setRGB( 0.08, 0.08, 0.08 )
	BGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	BGBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BGBlur )
	self.BGBlur = BGBlur
	
	local BGBlack = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BGBlack:setAlpha( 0.9 )
	BGBlack:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BGBlack )
	self.BGBlack = BGBlack
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local BlackBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BlackBacking:setRGB( 0, 0, 0 )
	BlackBacking:setAlpha( 0 )
	self:addElement( BlackBacking )
	self.BlackBacking = BlackBacking
	
	local DirectorTheaterSelectFile = CoD.DirectorTheaterSelectFile.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	DirectorTheaterSelectFile.TabBacking.TabBackingBlur:setAlpha( 0 )
	DirectorTheaterSelectFile:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( DirectorTheaterSelectFile )
	self.DirectorTheaterSelectFile = DirectorTheaterSelectFile
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x60E17AB37AB4874 ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f3_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		ShowHeaderIconOnly( f1_local1 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		CoD.FileshareUtility.ClearCurrentFilter()
		CoD.FileshareUtility.SetupFileshareForTheater( f5_arg2 )
		GoBack( self, f5_arg2 )
		ClearMenuSavedState( f5_arg1 )
		ResetThumbnailViewer( f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	DirectorTheaterSelectFile.id = "DirectorTheaterSelectFile"
	GenericMenuFrameIdentity:setModel( self.buttonModel, f1_arg0 )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.Theater_SelectFilm.__onClose = function ( f7_arg0 )
	f7_arg0.Background:close()
	f7_arg0.DirectorTheaterSelectFile:close()
	f7_arg0.GenericMenuFrameIdentity:close()
end

