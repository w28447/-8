require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )
require( "ui/uieditor/widgets/warzone/wzjumpkitselectorinternal" )

CoD.WZJumpKitSelector = InheritFrom( CoD.Menu )
LUI.createMenu.WZJumpKitSelector = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "WZJumpKitSelector", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetModelFromUserData( f1_arg0, f1_local1, f1_arg1.model )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1.properties )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	self:setClass( CoD.WZJumpKitSelector )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericMenuFrameIdentity = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	GenericMenuFrameIdentity.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x2A8D9058AD56819 ) )
	GenericMenuFrameIdentity:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			GenericMenuFrameIdentity.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( GenericMenuFrameIdentity )
	self.GenericMenuFrameIdentity = GenericMenuFrameIdentity
	
	local WZJumpKitSelectorInternal = CoD.WZJumpKitSelectorInternal.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	self:addElement( WZJumpKitSelectorInternal )
	self.WZJumpKitSelectorInternal = WZJumpKitSelectorInternal
	
	self:mergeStateConditions( {
		{
			stateName = "AppliedToAll",
			condition = function ( menu, element, event )
				return MenuPropertyIsTrue( menu, "_appliedToAll" )
			end
		}
	} )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		ClearMenuSavedState( f1_local1 )
	end )
	GenericMenuFrameIdentity.id = "GenericMenuFrameIdentity"
	WZJumpKitSelectorInternal.id = "WZJumpKitSelectorInternal"
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

CoD.WZJumpKitSelector.__onClose = function ( f7_arg0 )
	f7_arg0.Background:close()
	f7_arg0.GenericMenuFrameIdentity:close()
	f7_arg0.WZJumpKitSelectorInternal:close()
end

