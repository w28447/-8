require( "x64:76b89c73379cfb5" )

CoD.ZMScoreInfo = InheritFrom( LUI.UIElement )
CoD.ZMScoreInfo.__defaultWidth = 166
CoD.ZMScoreInfo.__defaultHeight = 166
CoD.ZMScoreInfo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModel( f1_arg1, "gameScore.gameTimeLow", 0 )
	self:setClass( CoD.ZMScoreInfo )
	self.id = "ZMScoreInfo"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	
	local EnemyTeamScoreContainer = CoD.ScoreInfo_ScoreContainer.new( f1_arg0, f1_arg1, 0, 0, 86, 166, 0, 0, 0, 166 )
	EnemyTeamScoreContainer.ScoreContainerInternal.TeamLives.TeamLivesCount:setText( 0 )
	EnemyTeamScoreContainer:subscribeToGlobalModel( f1_arg1, "GameScore", "enemyScore", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			EnemyTeamScoreContainer.ScoreContainerInternal.ScoreBar.ScoreText:setText( f2_local0 )
		end
	end )
	self:addElement( EnemyTeamScoreContainer )
	self.EnemyTeamScoreContainer = EnemyTeamScoreContainer
	
	local PlayerTeamScoreContainer = CoD.ScoreInfo_ScoreContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 80, 0, 0, 0, 166 )
	PlayerTeamScoreContainer.ScoreContainerInternal.TeamLives.TeamLivesCount:setText( 0 )
	PlayerTeamScoreContainer:subscribeToGlobalModel( f1_arg1, "GameScore", "playerScore", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			PlayerTeamScoreContainer.ScoreContainerInternal.ScoreBar.ScoreText:setText( f3_local0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( PlayerTeamScoreContainer, "setHeight", function ( element, controller )
		ScaleToElementHeight( self, element, 0 )
	end )
	self:addElement( PlayerTeamScoreContainer )
	self.PlayerTeamScoreContainer = PlayerTeamScoreContainer
	
	EnemyTeamScoreContainer.id = "EnemyTeamScoreContainer"
	PlayerTeamScoreContainer.id = "PlayerTeamScoreContainer"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local3 = self
	CallCustomElementFunction_Self( self, "setupGameTimer" )
	return self
end

CoD.ZMScoreInfo.__onClose = function ( f5_arg0 )
	f5_arg0.EnemyTeamScoreContainer:close()
	f5_arg0.PlayerTeamScoreContainer:close()
end

