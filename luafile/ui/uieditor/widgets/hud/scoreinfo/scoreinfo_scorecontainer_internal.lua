require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_roundlist" )
require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_scorebarwidget" )
require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_ticketsystemteam" )

CoD.ScoreInfo_ScoreContainer_Internal = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_ScoreContainer_Internal.__defaultWidth = 80
CoD.ScoreInfo_ScoreContainer_Internal.__defaultHeight = 166
CoD.ScoreInfo_ScoreContainer_Internal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIVerticalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 2, false )
	self:setAlignment( LUI.Alignment.Top )
	self:setClass( CoD.ScoreInfo_ScoreContainer_Internal )
	self.id = "ScoreInfo_ScoreContainer_Internal"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ControlRoundPips = CoD.ScoreInfo_RoundList.new( f1_arg0, f1_arg1, 0.5, 0.5, -36, 36, 0, 0, 0, 32 )
	ControlRoundPips.RoundScoreText:setText( Engine[0xF9F1239CFD921FE]( "menu/x_of_y" ) )
	self:addElement( ControlRoundPips )
	self.ControlRoundPips = ControlRoundPips
	
	local ScoreBar = CoD.ScoreInfo_ScoreBarWidget.new( f1_arg0, f1_arg1, 0.5, 0.5, -43, 57, 0, 0, 34, 90 )
	ScoreBar.Container2:setAlpha( 0.7 )
	self:addElement( ScoreBar )
	self.ScoreBar = ScoreBar
	
	local TeamLives = CoD.ScoreInfo_TicketSystemTeam.new( f1_arg0, f1_arg1, 0.5, 0.5, -40, 60, 0, 0, 92, 148 )
	TeamLives.Diamond2:setAlpha( 1 )
	TeamLives.Diamond:setAlpha( 1 )
	self:addElement( TeamLives )
	self.TeamLives = TeamLives
	
	self:mergeStateConditions( {
		{
			stateName = "ShowScoreBar",
			condition = function ( menu, element, event )
				local f2_local0
				if not HideHudScoreForCurrentGametype() then
					f2_local0 = not CoD.HUDUtility.ShouldShowTeamLives( f1_arg1 )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "ShowTeamLives",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.ShouldShowTeamLives( f1_arg1 )
			end
		}
	} )
	ControlRoundPips.id = "ControlRoundPips"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_ScoreContainer_Internal.__resetProperties = function ( f4_arg0 )
	f4_arg0.ScoreBar:completeAnimation()
	f4_arg0.TeamLives:completeAnimation()
	f4_arg0.ScoreBar:setAlpha( 1 )
	f4_arg0.TeamLives:setAlpha( 1 )
end

CoD.ScoreInfo_ScoreContainer_Internal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 2 )
			f5_arg0.ScoreBar:completeAnimation()
			f5_arg0.ScoreBar:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.ScoreBar )
			f5_arg0.TeamLives:completeAnimation()
			f5_arg0.TeamLives:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.TeamLives )
		end
	},
	ShowScoreBar = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.TeamLives:completeAnimation()
			f6_arg0.TeamLives:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.TeamLives )
		end
	},
	ShowTeamLives = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 2 )
			f7_arg0.ScoreBar:completeAnimation()
			f7_arg0.ScoreBar:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.ScoreBar )
			f7_arg0.TeamLives:completeAnimation()
			f7_arg0.TeamLives:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.TeamLives )
		end
	}
}
CoD.ScoreInfo_ScoreContainer_Internal.__onClose = function ( f8_arg0 )
	f8_arg0.ControlRoundPips:close()
	f8_arg0.ScoreBar:close()
	f8_arg0.TeamLives:close()
end

