CoD.TabbedScoreboardRank = InheritFrom( LUI.UIElement )
CoD.TabbedScoreboardRank.__defaultWidth = 20
CoD.TabbedScoreboardRank.__defaultHeight = 60
CoD.TabbedScoreboardRank.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.TabbedScoreboardRank )
	self.id = "TabbedScoreboardRank"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local RankIcon = LUI.UIImage.new( 0.5, 0.5, -17, 17, 0, 0, -1, 33 )
	RankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			RankIcon:setImage( RegisterImage( f2_local0 ) )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = LUI.UIText.new( 0.5, 0.5, -22, 22, 0, 0, 33, 53 )
	Rank:setTTF( "0arame_mono_stencil" )
	Rank:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Rank:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			Rank:setRGB( CoD.RankUtility.GetInGameColorForRankTextByRank( f3_local0 ) )
		end
	end )
	Rank:linkToElementModel( self, "rank", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			Rank:setText( f4_local0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local ArenaRankIcon = LUI.UIImage.new( 0.5, 0.5, -17, 17, 0, 0, -1, 33 )
	ArenaRankIcon.__Image = function ( f5_arg0 )
		local f5_local0 = f5_arg0:get()
		if f5_local0 ~= nil then
			ArenaRankIcon:setImage( RegisterImage( CoD.ArenaLeaguePlayUtility.GetLeagueLadderPlayerSmallRankIconFromXuid( f5_local0 ) ) )
		end
	end
	
	ArenaRankIcon:linkToElementModel( self, "xuid", true, ArenaRankIcon.__Image )
	ArenaRankIcon.__Image_FullPath = function ()
		local f6_local0 = self:getModel()
		if f6_local0 then
			f6_local0 = self:getModel()
			f6_local0 = f6_local0.xuid
		end
		if f6_local0 then
			ArenaRankIcon.__Image( f6_local0 )
		end
	end
	
	self:addElement( ArenaRankIcon )
	self.ArenaRankIcon = ArenaRankIcon
	
	local ArenaSkillDivision = LUI.UIImage.new( 0.5, 0.5, -17, 17, 0, 0, -1, 33 )
	ArenaSkillDivision.__Image = function ( f7_arg0 )
		local f7_local0 = f7_arg0:get()
		if f7_local0 ~= nil then
			ArenaSkillDivision:setImage( RegisterImage( CoD.ArenaLeaguePlayUtility.GetClientSkillDivisionIconForScoreboardSmall( f7_local0 ) ) )
		end
	end
	
	ArenaSkillDivision:linkToElementModel( self, "xuid", true, ArenaSkillDivision.__Image )
	ArenaSkillDivision.__Image_FullPath = function ()
		local f8_local0 = self:getModel()
		if f8_local0 then
			f8_local0 = self:getModel()
			f8_local0 = f8_local0.xuid
		end
		if f8_local0 then
			ArenaSkillDivision.__Image( f8_local0 )
		end
	end
	
	self:addElement( ArenaSkillDivision )
	self.ArenaSkillDivision = ArenaSkillDivision
	
	local ArenaRank = LUI.UIText.new( 0.5, 0.5, -22, 22, 0, 0, 33, 53 )
	ArenaRank:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	ArenaRank:setTTF( "0arame_mono_stencil" )
	ArenaRank:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ArenaRank:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	ArenaRank.__String_Reference = function ( f9_arg0 )
		local f9_local0 = f9_arg0:get()
		if f9_local0 ~= nil then
			ArenaRank:setText( CoD.ArenaLeaguePlayUtility.GetLeagueLadderPlayerRankFromXuid( f9_local0 ) )
		end
	end
	
	ArenaRank:linkToElementModel( self, "xuid", true, ArenaRank.__String_Reference )
	ArenaRank.__String_Reference_FullPath = function ()
		local f10_local0 = self:getModel()
		if f10_local0 then
			f10_local0 = self:getModel()
			f10_local0 = f10_local0.xuid
		end
		if f10_local0 then
			ArenaRank.__String_Reference( f10_local0 )
		end
	end
	
	self:addElement( ArenaRank )
	self.ArenaRank = ArenaRank
	
	local f1_local6 = ArenaRankIcon
	local f1_local7 = ArenaRankIcon.subscribeToModel
	local f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8.lobbyNav, ArenaRankIcon.__Image_FullPath )
	f1_local6 = ArenaRankIcon
	f1_local7 = ArenaRankIcon.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["privateClient.update"], ArenaRankIcon.__Image_FullPath )
	f1_local6 = ArenaRankIcon
	f1_local7 = ArenaRankIcon.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["gameClient.update"], ArenaRankIcon.__Image_FullPath )
	f1_local6 = ArenaRankIcon
	f1_local7 = ArenaRankIcon.subscribeToModel
	f1_local8 = Engine.GetGlobalModel()
	f1_local7( f1_local6, f1_local8["PartyPrivacy.privacy"], ArenaRankIcon.__Image_FullPath )
	f1_local6 = ArenaSkillDivision
	f1_local7 = ArenaSkillDivision.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8.lobbyNav, ArenaSkillDivision.__Image_FullPath )
	f1_local6 = ArenaSkillDivision
	f1_local7 = ArenaSkillDivision.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["privateClient.update"], ArenaSkillDivision.__Image_FullPath )
	f1_local6 = ArenaSkillDivision
	f1_local7 = ArenaSkillDivision.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["gameClient.update"], ArenaSkillDivision.__Image_FullPath )
	f1_local6 = ArenaSkillDivision
	f1_local7 = ArenaSkillDivision.subscribeToModel
	f1_local8 = Engine.GetGlobalModel()
	f1_local7( f1_local6, f1_local8["PartyPrivacy.privacy"], ArenaSkillDivision.__Image_FullPath )
	f1_local6 = ArenaRank
	f1_local7 = ArenaRank.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8.lobbyNav, ArenaRank.__String_Reference_FullPath )
	f1_local6 = ArenaRank
	f1_local7 = ArenaRank.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["privateClient.update"], ArenaRank.__String_Reference_FullPath )
	f1_local6 = ArenaRank
	f1_local7 = ArenaRank.subscribeToModel
	f1_local8 = DataSources.LobbyRoot.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8["gameClient.update"], ArenaRank.__String_Reference_FullPath )
	f1_local6 = ArenaRank
	f1_local7 = ArenaRank.subscribeToModel
	f1_local8 = Engine.GetGlobalModel()
	f1_local7( f1_local6, f1_local8["PartyPrivacy.privacy"], ArenaRank.__String_Reference_FullPath )
	self:mergeStateConditions( {
		{
			stateName = "ArenaVisible",
			condition = function ( menu, element, event )
				return IsPublicOnlineGame() and IsArenaMode()
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPublicOnlineGame()
			end
		}
	} )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetGlobalModel()
	f1_local7( f1_local6, f1_local8["lobbyRoot.lobbyNav"], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.TabbedScoreboardRank.__resetProperties = function ( f14_arg0 )
	f14_arg0.RankIcon:completeAnimation()
	f14_arg0.Rank:completeAnimation()
	f14_arg0.ArenaRank:completeAnimation()
	f14_arg0.ArenaRankIcon:completeAnimation()
	f14_arg0.ArenaSkillDivision:completeAnimation()
	f14_arg0.RankIcon:setAlpha( 1 )
	f14_arg0.Rank:setAlpha( 1 )
	f14_arg0.ArenaRank:setAlpha( 1 )
	f14_arg0.ArenaRankIcon:setAlpha( 1 )
	f14_arg0.ArenaSkillDivision:setAlpha( 1 )
end

CoD.TabbedScoreboardRank.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 4 )
			f15_arg0.RankIcon:completeAnimation()
			f15_arg0.RankIcon:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.RankIcon )
			f15_arg0.Rank:completeAnimation()
			f15_arg0.Rank:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.Rank )
			f15_arg0.ArenaRankIcon:completeAnimation()
			f15_arg0.ArenaRankIcon:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ArenaRankIcon )
			f15_arg0.ArenaRank:completeAnimation()
			f15_arg0.ArenaRank:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ArenaRank )
		end
	},
	ArenaVisible = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 5 )
			f16_arg0.RankIcon:completeAnimation()
			f16_arg0.RankIcon:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.RankIcon )
			f16_arg0.Rank:completeAnimation()
			f16_arg0.Rank:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.Rank )
			f16_arg0.ArenaRankIcon:completeAnimation()
			f16_arg0.ArenaRankIcon:setAlpha( 1 )
			f16_arg0.clipFinished( f16_arg0.ArenaRankIcon )
			f16_arg0.ArenaSkillDivision:completeAnimation()
			f16_arg0.ArenaSkillDivision:setAlpha( 1 )
			f16_arg0.clipFinished( f16_arg0.ArenaSkillDivision )
			f16_arg0.ArenaRank:completeAnimation()
			f16_arg0.ArenaRank:setAlpha( 1 )
			f16_arg0.clipFinished( f16_arg0.ArenaRank )
		end
	},
	Visible = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 5 )
			f17_arg0.RankIcon:completeAnimation()
			f17_arg0.RankIcon:setAlpha( 1 )
			f17_arg0.clipFinished( f17_arg0.RankIcon )
			f17_arg0.Rank:completeAnimation()
			f17_arg0.Rank:setAlpha( 1 )
			f17_arg0.clipFinished( f17_arg0.Rank )
			f17_arg0.ArenaRankIcon:completeAnimation()
			f17_arg0.ArenaRankIcon:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.ArenaRankIcon )
			f17_arg0.ArenaSkillDivision:completeAnimation()
			f17_arg0.ArenaSkillDivision:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.ArenaSkillDivision )
			f17_arg0.ArenaRank:completeAnimation()
			f17_arg0.ArenaRank:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.ArenaRank )
		end
	}
}
CoD.TabbedScoreboardRank.__onClose = function ( f18_arg0 )
	f18_arg0.RankIcon:close()
	f18_arg0.Rank:close()
	f18_arg0.ArenaRankIcon:close()
	f18_arg0.ArenaSkillDivision:close()
	f18_arg0.ArenaRank:close()
end

