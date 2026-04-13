require( "ui/uieditor/widgets/arena/gauntlet/arenagauntlettierprogress" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.ArenaGauntletProgressionDetails = InheritFrom( CoD.Menu )
LUI.createMenu.ArenaGauntletProgressionDetails = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ArenaGauntletProgressionDetails", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.ArenaGauntletProgressionDetails )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xA5CBEE1298159B6 ) )
	GenericMenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local ArenaGauntletTierProgress = CoD.ArenaGauntletTierProgress.new( f1_local1, f1_arg0, 0.5, 0.5, -75, 75, 0, 0, 390, 690 )
	ArenaGauntletTierProgress:subscribeToGlobalModel( f1_arg0, "ArenaGauntlet", nil, function ( model )
		ArenaGauntletTierProgress:setModel( model, f1_arg0 )
	end )
	self:addElement( ArenaGauntletTierProgress )
	self.ArenaGauntletTierProgress = ArenaGauntletTierProgress
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	if CoD.isPC then
		GenericMenuFrame.id = "GenericMenuFrame"
	end
	ArenaGauntletTierProgress.id = "ArenaGauntletTierProgress"
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
	
	local f1_local5 = self
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	return self
end

CoD.ArenaGauntletProgressionDetails.__onClose = function ( f6_arg0 )
	f6_arg0.Background:close()
	f6_arg0.GenericMenuFrame:close()
	f6_arg0.ArenaGauntletTierProgress:close()
end

