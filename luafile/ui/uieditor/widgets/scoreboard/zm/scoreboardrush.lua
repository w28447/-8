require( "x64:1751eada73aefb5" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowrush" )

CoD.ScoreboardRush = InheritFrom( LUI.UIElement )
CoD.ScoreboardRush.__defaultWidth = 888
CoD.ScoreboardRush.__defaultHeight = 400
CoD.ScoreboardRush.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "Clients.clientChangedTeam" )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "Clients.clientCount" )
	CoD.ScoreboardUtility.InitScoreboardSortKey( f1_arg1 )
	self:setClass( CoD.ScoreboardRush )
	self.id = "ScoreboardRush"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Scoreboard = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Scoreboard:setLeftRight( 0.5, 0.5, -445, 443 )
	Scoreboard:setTopBottom( 0, 0, 141, 473 )
	Scoreboard:setWidgetType( CoD.ScoreboardRowRush )
	Scoreboard:setVerticalCount( 4 )
	Scoreboard:setSpacing( 20 )
	Scoreboard:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Scoreboard:setDataSource( "Clients" )
	Scoreboard:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		CoD.ScoreboardUtility.SetCurrentFocusedClient( element, f1_arg1 )
		return f2_local0
	end )
	Scoreboard:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.ScoreboardUtility.SetSavedActiveItemToLocalPlayer( element, f1_arg1 )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f3_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Scoreboard, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( element, menu, controller, model )
		CoD.ScoreboardUtility.ToggleClientMute( element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "", nil, nil )
		return false
	end, false )
	self.__on_onStartMenuOpened_Scoreboard = function ( f6_arg0, f6_arg1 )
		CoD.GridAndListUtility.SortListByControllerModelKeys( f6_arg1, Scoreboard, "scoreboardInfo.sortKey0", "scoreboardInfo.sortKey1", "scoreboardInfo.sortKey2" )
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "onStartMenuOpened", self.__on_onStartMenuOpened_Scoreboard )
	self:addElement( Scoreboard )
	self.Scoreboard = Scoreboard
	
	local ScoreboardColHeadersZM = CoD.ScoreboardColHeadersRush.new( f1_arg0, f1_arg1, 0.5, 0.5, 34, 444, 0, 0, 100, 130 )
	self:addElement( ScoreboardColHeadersZM )
	self.ScoreboardColHeadersZM = ScoreboardColHeadersZM
	
	local Map = LUI.UIText.new( 0.5, 0.5, -444, 444, 0, 0, 46, 86 )
	Map:setRGB( 0.48, 0.71, 0.84 )
	Map:setText( CoD.MapUtility.GetInGameLocalizedMapName( "mpui/seaside" ) )
	Map:setTTF( "skorzhen" )
	Map:setLetterSpacing( 4 )
	Map:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( Map )
	self.Map = Map
	
	self:mergeStateConditions( {
		{
			stateName = "InFrontend",
			condition = function ( menu, element, event )
				return InFrontend()
			end
		}
	} )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "Clients.clientCount", function ( model )
		local f8_local0 = self
		UpdateDataSource( self, self.Scoreboard, f1_arg1 )
	end )
	Scoreboard.id = "Scoreboard"
	self.__on_close_removeOverrides = function ()
		LUI.OverrideFunction_Remove( f1_arg0, "onStartMenuOpened", self.__on_onStartMenuOpened_Scoreboard )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local4 = self
	f1_local4 = Scoreboard
	SetElementProperty( f1_local4, "friendlyTeam", true )
	CoD.GridAndListUtility.AddListUpDownNavigation( f1_arg0, f1_local4, f1_arg1 )
	CoD.FreeCursorUtility.SetListFocusIgnoresFreeCursor( f1_local4, f1_arg1 )
	CoD.GridAndListUtility.SortListByControllerModelKeys( f1_arg1, f1_local4, "scoreboardInfo.sortKey0", "scoreboardInfo.sortKey1", "scoreboardInfo.sortKey2" )
	return self
end

CoD.ScoreboardRush.__resetProperties = function ( f10_arg0 )
	f10_arg0.Map:completeAnimation()
	f10_arg0.Map:setAlpha( 1 )
end

CoD.ScoreboardRush.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 0 )
		end
	},
	InFrontend = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.Map:completeAnimation()
			f12_arg0.Map:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Map )
		end
	}
}
CoD.ScoreboardRush.__onClose = function ( f13_arg0 )
	f13_arg0.__on_close_removeOverrides()
	f13_arg0.Scoreboard:close()
	f13_arg0.ScoreboardColHeadersZM:close()
end

