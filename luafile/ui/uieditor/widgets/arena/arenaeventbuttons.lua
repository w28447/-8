require( "ui/uieditor/menus/arena/leagueplayleaderboardmenu" )
require( "ui/uieditor/widgets/arena/arenaeventbutton" )

CoD.ArenaEventButtons = InheritFrom( LUI.UIElement )
CoD.ArenaEventButtons.__defaultWidth = 200
CoD.ArenaEventButtons.__defaultHeight = 70
CoD.ArenaEventButtons.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.CreateGlobalModel( "lobbyPlaylist.name" )
	self:setClass( CoD.ArenaEventButtons )
	self.id = "ArenaEventButtons"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ArenaLeagueEventButton = CoD.ArenaEventButton.new( f1_arg0, f1_arg1, 0, 0, 0, 200, 0, 0, 0, 70 )
	ArenaLeagueEventButton:setAlpha( 0 )
	ArenaLeagueEventButton.ArenaButtonInternal.MiddleTextFocus:setText( LocalizeToUpperString( 0xA81622B007EDBAA ) )
	ArenaLeagueEventButton.ArenaButtonInternal.MiddleText:setText( LocalizeToUpperString( 0xA81622B007EDBAA ) )
	ArenaLeagueEventButton:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( ArenaLeagueEventButton, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		PlaySoundAlias( "uin_press_generic" )
		SetLoseFocusToSelf( self, f3_arg2 )
		CoD.ArenaLeaguePlayUtility.ForceRefreshLadder( f3_arg1, f3_arg2 )
		OpenOverlay( self, "LeaguePlayLeaderboardMenu", f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( ArenaLeagueEventButton )
	self.ArenaLeagueEventButton = ArenaLeagueEventButton
	
	self:mergeStateConditions( {
		{
			stateName = "LeaguePlay",
			condition = function ( menu, element, event )
				return CoD.ArenaUtility.CurrentArenaEventTypeEquals( self, Enum[0xC0EA92D04BC003B][0xC32571741C5B730] ) and CoD.ArenaLeaguePlayUtility.HasOneMatchPlayed( self, f1_arg1 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetGlobalModel()
	f1_local3( f1_local2, f1_local4["lobbyPlaylist.name"], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "lobbyPlaylist.name"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetGlobalModel()
	f1_local3( f1_local2, f1_local4["lobbyRoot.lobbyNav"], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetGlobalModel()
	f1_local3( f1_local2, f1_local4["LeaguePlayLadder.entityLadderRank"], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "LeaguePlayLadder.entityLadderRank"
		} )
	end, false )
	ArenaLeagueEventButton.id = "ArenaLeagueEventButton"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ArenaEventButtons.__resetProperties = function ( f9_arg0 )
	f9_arg0.ArenaLeagueEventButton:completeAnimation()
	f9_arg0.ArenaLeagueEventButton:setAlpha( 0 )
end

CoD.ArenaEventButtons.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 0 )
		end
	},
	LeaguePlay = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			f11_arg0.ArenaLeagueEventButton:completeAnimation()
			f11_arg0.ArenaLeagueEventButton:setAlpha( 1 )
			f11_arg0.clipFinished( f11_arg0.ArenaLeagueEventButton )
		end
	}
}
CoD.ArenaEventButtons.__onClose = function ( f12_arg0 )
	f12_arg0.ArenaLeagueEventButton:close()
end

