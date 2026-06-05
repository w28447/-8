require( "ui/uieditor/widgets/onoffvoip" )
require( "ui/uieditor/widgets/scoreboard/tabbedscoreboardrank" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowbackgroundzm" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowinformationlist" )
require( "x64:19cbac0317b95b4" )
require( "x64:1ef3663f11c21fa" )

CoD.ScoreboardRowRush = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowRush.__defaultWidth = 888
CoD.ScoreboardRowRush.__defaultHeight = 68
CoD.ScoreboardRowRush.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreboardRowRush )
	self.id = "ScoreboardRowRush"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Base = CoD.ScoreboardRowBackgroundZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -444, 444, 0.5, 0.5, -30, 30 )
	Base.Base:setAlpha( 0.7 )
	self:addElement( Base )
	self.Base = Base
	
	local SelectorOverlay = CoD.ScoreboardRowBackgroundZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -444, 444, 0.5, 0.5, -30, 30 )
	SelectorOverlay.Base:setRGB( 1, 1, 1 )
	SelectorOverlay.Base:setAlpha( 0 )
	SelectorOverlay.TextureMid:setAlpha( 0 )
	SelectorOverlay.TextureTip:setAlpha( 0 )
	SelectorOverlay.TextureEnd:setAlpha( 0 )
	self:addElement( SelectorOverlay )
	self.SelectorOverlay = SelectorOverlay
	
	local FrameTip = LUI.UIImage.new( 0, 0, -85, 55, 0.5, 0.5, -46.5, 46.5 )
	FrameTip:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_tip" ) )
	self:addElement( FrameTip )
	self.FrameTip = FrameTip
	
	local FrameEnd = LUI.UIImage.new( 0, 0, 830.5, 936.5, 0.5, 0.5, -46.5, 46.5 )
	FrameEnd:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_end" ) )
	self:addElement( FrameEnd )
	self.FrameEnd = FrameEnd
	
	local InformationList = CoD.ScoreboardRowInformationList.new( f1_arg0, f1_arg1, 0.5, 0.5, -382, 418, 0.5, 0.5, -30, 30 )
	InformationList:linkToElementModel( self, nil, false, function ( model )
		InformationList:setModel( model, f1_arg1 )
	end )
	self:addElement( InformationList )
	self.InformationList = InformationList
	
	local StatBox5 = CoD.ZMTabbedScoreboardStatBox.new( f1_arg0, f1_arg1, 0, 0, 775, 863, 0, 0, 7.5, 72.5 )
	StatBox5:setAlpha( 0 )
	StatBox5:linkToElementModel( self, nil, false, function ( model )
		StatBox5:setModel( model, f1_arg1 )
	end )
	StatBox5:linkToElementModel( self, "scoreboard.footer2", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			StatBox5.Value:setText( f4_local0 )
		end
	end )
	self:addElement( StatBox5 )
	self.StatBox5 = StatBox5
	
	local StatBox4 = CoD.ZMTabbedScoreboardStatBox.new( f1_arg0, f1_arg1, 0, 0, 680, 768, 0, 0, 7.5, 72.5 )
	StatBox4:setAlpha( 0 )
	StatBox4:linkToElementModel( self, nil, false, function ( model )
		StatBox4:setModel( model, f1_arg1 )
	end )
	StatBox4:linkToElementModel( self, "scoreboard.footer1", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			StatBox4.Value:setText( f6_local0 )
		end
	end )
	self:addElement( StatBox4 )
	self.StatBox4 = StatBox4
	
	local StatBox3 = CoD.ZMTabbedScoreboardStatBox.new( f1_arg0, f1_arg1, 0, 0, 592, 680, 0, 0, 7.5, 72.5 )
	StatBox3:setAlpha( 0 )
	StatBox3:linkToElementModel( self, nil, false, function ( model )
		StatBox3:setModel( model, f1_arg1 )
	end )
	StatBox3:linkToElementModel( self, "scoreboard.col3", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			StatBox3.Value:setText( f8_local0 )
		end
	end )
	self:addElement( StatBox3 )
	self.StatBox3 = StatBox3
	
	local StatBox2 = CoD.ZMTabbedScoreboardStatBox.new( f1_arg0, f1_arg1, 0, 0, 497, 585, 0, 0, 7.5, 72.5 )
	StatBox2:setAlpha( 0 )
	StatBox2:linkToElementModel( self, nil, false, function ( model )
		StatBox2:setModel( model, f1_arg1 )
	end )
	StatBox2:linkToElementModel( self, "scoreboard.col2", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			StatBox2.Value:setText( f10_local0 )
		end
	end )
	self:addElement( StatBox2 )
	self.StatBox2 = StatBox2
	
	local StatBox1 = CoD.ZMTabbedScoreboardStatBox.new( f1_arg0, f1_arg1, 0, 0, 326, 486, 0, 0, 7.5, 72.5 )
	StatBox1:setAlpha( 0 )
	StatBox1:linkToElementModel( self, nil, false, function ( model )
		StatBox1:setModel( model, f1_arg1 )
	end )
	StatBox1:linkToElementModel( self, "scoreboard.col1", true, function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			StatBox1.Value:setText( CoD.ZombieUtility.FormatNumbersWithDelimetersIfGametype( f1_arg1, "zstandard", f12_local0 ) )
		end
	end )
	self:addElement( StatBox1 )
	self.StatBox1 = StatBox1
	
	local ClanAndGamerName = LUI.UIText.new( 0, 0, 165, 375, 0, 0, 21, 42 )
	ClanAndGamerName:setAlpha( 0 )
	ClanAndGamerName:setTTF( "notosans_regular" )
	ClanAndGamerName:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ClanAndGamerName:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	ClanAndGamerName:linkToElementModel( self, "scoreboard.playerName", true, function ( model )
		local f13_local0 = model:get()
		if f13_local0 ~= nil then
			ClanAndGamerName:setText( CoD.SocialUtility.CleanGamerTag( f13_local0 ) )
		end
	end )
	self:addElement( ClanAndGamerName )
	self.ClanAndGamerName = ClanAndGamerName
	
	local playerPing = nil
	
	playerPing = LUI.UIText.new( 0, 0, 62, 140, 0, 0, 42, 57 )
	playerPing:setAlpha( 0.75 )
	playerPing:setTTF( "notosans_regular" )
	playerPing:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	playerPing:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	playerPing:linkToElementModel( self, "ping", true, function ( model )
		local f14_local0 = model:get()
		if f14_local0 ~= nil then
			playerPing:setText( CoD.ScoreboardUtility.UpdatePingValue( self, 0.5, self:getModel(), f14_local0 ) )
		end
	end )
	self:addElement( playerPing )
	self.playerPing = playerPing
	
	local Rank = CoD.TabbedScoreboardRank.new( f1_arg0, f1_arg1, 0, 0, 7.5, 53.5, 0.5, 0.5, -26, 34 )
	Rank:linkToElementModel( self, nil, false, function ( model )
		Rank:setModel( model, f1_arg1 )
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local VoipWaves = CoD.OnOffVoip.new( f1_arg0, f1_arg1, 0, 0, -128, -67, 0.5, 0.5, -11, 11 )
	VoipWaves:setZRot( 90 )
	VoipWaves:linkToElementModel( self, nil, false, function ( model )
		VoipWaves:setModel( model, f1_arg1 )
	end )
	self:addElement( VoipWaves )
	self.VoipWaves = VoipWaves
	
	local ZombiesPortrait = CoD.ZombiesPortrait.new( f1_arg0, f1_arg1, 0, 0, -80, 0, 0, 0, -6, 74 )
	ZombiesPortrait:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_rft" ) )
	ZombiesPortrait:setShaderVector( 0, 34, 6, 0, 0 )
	ZombiesPortrait:setShaderVector( 1, 80, 80, 0, 0 )
	ZombiesPortrait:setShaderVector( 2, 0, 0.05, 0, 0 )
	ZombiesPortrait.Portrait:setShaderVector( 0, 0.4, 0, 0, 0 )
	ZombiesPortrait:linkToElementModel( self, nil, false, function ( model )
		ZombiesPortrait:setModel( model, f1_arg1 )
	end )
	ZombiesPortrait:linkToElementModel( self, "scoreboard.characterIndex", true, function ( model )
		local f18_local0 = model:get()
		if f18_local0 ~= nil then
			ZombiesPortrait.Portrait:setImage( RegisterImage( GetPositionDraftIconByIndex( f18_local0 ) ) )
		end
	end )
	self:addElement( ZombiesPortrait )
	self.ZombiesPortrait = ZombiesPortrait
	
	self:mergeStateConditions( {
		{
			stateName = "Self",
			condition = function ( menu, element, event )
				return IsSelfClient( f1_arg1, element )
			end
		}
	} )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "clientNum"
		} )
	end )
	self:linkToElementModel( self, nil, true, function ( model )
		CoD.DirectorUtility.UpdateVOIPStatusForModel( self, model, "clientNum" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local16 = self
	if IsPC() then
		CoD.PCWidgetUtility.SetupRightClickableContextualPlayerMenuScoreboard( self, f1_arg1, f1_arg0 )
	end
	return self
end

CoD.ScoreboardRowRush.__resetProperties = function ( f22_arg0 )
	f22_arg0.ClanAndGamerName:completeAnimation()
	f22_arg0.SelectorOverlay:completeAnimation()
	f22_arg0.playerPing:completeAnimation()
	f22_arg0.InformationList:completeAnimation()
	f22_arg0.ClanAndGamerName:setRGB( 1, 1, 1 )
	f22_arg0.SelectorOverlay.Base:setAlpha( 0 )
	f22_arg0.playerPing:setRGB( 1, 1, 1 )
	f22_arg0.InformationList.ClanAndGamerName:setRGB( 0.92, 0.92, 0.92 )
end

CoD.ScoreboardRowRush.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 1 )
			f23_arg0.ClanAndGamerName:completeAnimation()
			f23_arg0.ClanAndGamerName:setRGB( 1, 1, 1 )
			f23_arg0.clipFinished( f23_arg0.ClanAndGamerName )
		end,
		Focus = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 2 )
			f24_arg0.SelectorOverlay:completeAnimation()
			f24_arg0.SelectorOverlay.Base:completeAnimation()
			f24_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f24_arg0.clipFinished( f24_arg0.SelectorOverlay )
			f24_arg0.ClanAndGamerName:completeAnimation()
			f24_arg0.ClanAndGamerName:setRGB( 1, 1, 1 )
			f24_arg0.clipFinished( f24_arg0.ClanAndGamerName )
		end,
		GainFocus = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 2 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.SelectorOverlay:beginAnimation( 150 )
				f25_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f25_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f25_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.SelectorOverlay:completeAnimation()
			f25_arg0.SelectorOverlay.Base:completeAnimation()
			f25_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f25_local0( f25_arg0.SelectorOverlay )
			f25_arg0.ClanAndGamerName:completeAnimation()
			f25_arg0.ClanAndGamerName:setRGB( 1, 1, 1 )
			f25_arg0.clipFinished( f25_arg0.ClanAndGamerName )
		end,
		LoseFocus = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 2 )
			local f27_local0 = function ( f28_arg0 )
				f27_arg0.SelectorOverlay:beginAnimation( 150 )
				f27_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f27_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f27_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.SelectorOverlay:completeAnimation()
			f27_arg0.SelectorOverlay.Base:completeAnimation()
			f27_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f27_local0( f27_arg0.SelectorOverlay )
			f27_arg0.ClanAndGamerName:completeAnimation()
			f27_arg0.ClanAndGamerName:setRGB( 1, 1, 1 )
			f27_arg0.clipFinished( f27_arg0.ClanAndGamerName )
		end
	},
	Self = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 3 )
			f29_arg0.InformationList:completeAnimation()
			f29_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f29_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f29_arg0.clipFinished( f29_arg0.InformationList )
			f29_arg0.ClanAndGamerName:completeAnimation()
			f29_arg0.ClanAndGamerName:setRGB( 1, 0.76, 0 )
			f29_arg0.clipFinished( f29_arg0.ClanAndGamerName )
			f29_arg0.playerPing:completeAnimation()
			f29_arg0.playerPing:setRGB( 0.89, 0.64, 0 )
			f29_arg0.clipFinished( f29_arg0.playerPing )
		end,
		Focus = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 4 )
			f30_arg0.SelectorOverlay:completeAnimation()
			f30_arg0.SelectorOverlay.Base:completeAnimation()
			f30_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f30_arg0.clipFinished( f30_arg0.SelectorOverlay )
			f30_arg0.InformationList:completeAnimation()
			f30_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f30_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f30_arg0.clipFinished( f30_arg0.InformationList )
			f30_arg0.ClanAndGamerName:completeAnimation()
			f30_arg0.ClanAndGamerName:setRGB( 1, 0.76, 0 )
			f30_arg0.clipFinished( f30_arg0.ClanAndGamerName )
			f30_arg0.playerPing:completeAnimation()
			f30_arg0.playerPing:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f30_arg0.clipFinished( f30_arg0.playerPing )
		end,
		GainFocus = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 4 )
			local f31_local0 = function ( f32_arg0 )
				f31_arg0.SelectorOverlay:beginAnimation( 150 )
				f31_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f31_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f31_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.SelectorOverlay:completeAnimation()
			f31_arg0.SelectorOverlay.Base:completeAnimation()
			f31_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f31_local0( f31_arg0.SelectorOverlay )
			f31_arg0.InformationList:completeAnimation()
			f31_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f31_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f31_arg0.clipFinished( f31_arg0.InformationList )
			f31_arg0.ClanAndGamerName:completeAnimation()
			f31_arg0.ClanAndGamerName:setRGB( 1, 0.76, 0 )
			f31_arg0.clipFinished( f31_arg0.ClanAndGamerName )
			f31_arg0.playerPing:completeAnimation()
			f31_arg0.playerPing:setRGB( 0.89, 0.64, 0 )
			f31_arg0.clipFinished( f31_arg0.playerPing )
		end,
		LoseFocus = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 4 )
			local f33_local0 = function ( f34_arg0 )
				f33_arg0.SelectorOverlay:beginAnimation( 150 )
				f33_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f33_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f33_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.SelectorOverlay:completeAnimation()
			f33_arg0.SelectorOverlay.Base:completeAnimation()
			f33_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f33_local0( f33_arg0.SelectorOverlay )
			f33_arg0.InformationList:completeAnimation()
			f33_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f33_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f33_arg0.clipFinished( f33_arg0.InformationList )
			f33_arg0.ClanAndGamerName:completeAnimation()
			f33_arg0.ClanAndGamerName:setRGB( 1, 0.76, 0 )
			f33_arg0.clipFinished( f33_arg0.ClanAndGamerName )
			f33_arg0.playerPing:completeAnimation()
			f33_arg0.playerPing:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f33_arg0.clipFinished( f33_arg0.playerPing )
		end
	}
}
CoD.ScoreboardRowRush.__onClose = function ( f35_arg0 )
	f35_arg0.Base:close()
	f35_arg0.SelectorOverlay:close()
	f35_arg0.InformationList:close()
	f35_arg0.StatBox5:close()
	f35_arg0.StatBox4:close()
	f35_arg0.StatBox3:close()
	f35_arg0.StatBox2:close()
	f35_arg0.StatBox1:close()
	f35_arg0.ClanAndGamerName:close()
	f35_arg0.playerPing:close()
	f35_arg0.Rank:close()
	f35_arg0.VoipWaves:close()
	f35_arg0.ZombiesPortrait:close()
end

