require( "ui/uieditor/widgets/onoffvoip" )
require( "ui/uieditor/widgets/scoreboard/tabbedscoreboardrank" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowbackgroundzm" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowinformationlist" )
require( "x64:1ef3663f11c21fa" )

CoD.ScoreboardRowZM = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowZM.__defaultWidth = 888
CoD.ScoreboardRowZM.__defaultHeight = 68
CoD.ScoreboardRowZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreboardRowZM )
	self.id = "ScoreboardRowZM"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Base = CoD.ScoreboardRowBackgroundZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -444, 444, 0.5, 0.5, -30, 30 )
	Base.Base:setAlpha( 0.5 )
	Base.TextureMid:setAlpha( 0.8 )
	self:addElement( Base )
	self.Base = Base
	
	local SelectorOverlay = CoD.ScoreboardRowBackgroundZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -444, 444, 0.5, 0.5, -30, 30 )
	SelectorOverlay:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	SelectorOverlay.Base:setRGB( 1, 1, 1 )
	SelectorOverlay.Base:setAlpha( 0 )
	SelectorOverlay.TextureMid:setAlpha( 0 )
	SelectorOverlay.TextureTip:setAlpha( 0 )
	SelectorOverlay.TextureEnd:setAlpha( 0 )
	self:addElement( SelectorOverlay )
	self.SelectorOverlay = SelectorOverlay
	
	local InformationList = CoD.ScoreboardRowInformationList.new( f1_arg0, f1_arg1, 0.5, 0.5, -382, 418, 0.5, 0.5, -30, 30 )
	InformationList:linkToElementModel( self, nil, false, function ( model )
		InformationList:setModel( model, f1_arg1 )
	end )
	self:addElement( InformationList )
	self.InformationList = InformationList
	
	local FrameTip = LUI.UIImage.new( 0, 0, -85, 55, 0.5, 0.5, -46.5, 46.5 )
	FrameTip:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_tip" ) )
	self:addElement( FrameTip )
	self.FrameTip = FrameTip
	
	local FrameEnd = LUI.UIImage.new( 0, 0, 830.5, 936.5, 0.5, 0.5, -46.5, 46.5 )
	FrameEnd:setImage( RegisterImage( "uie_zm_hud_scoreboard_frame_end" ) )
	self:addElement( FrameEnd )
	self.FrameEnd = FrameEnd
	
	local playerPing = nil
	
	playerPing = LUI.UIText.new( 0, 0, 62, 140, 0, 0, 42, 57 )
	playerPing:setAlpha( 0.75 )
	playerPing:setTTF( "skorzhen" )
	playerPing:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	playerPing:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	playerPing:linkToElementModel( self, "ping", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			playerPing:setText( CoD.ScoreboardUtility.UpdatePingValue( self, 0.5, self:getModel(), f3_local0 ) )
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
	
	local VoipWaves = CoD.OnOffVoip.new( f1_arg0, f1_arg1, 0, 0, -128, -67, 0, 0, 23, 45 )
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
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			ZombiesPortrait.Portrait:setImage( RegisterImage( GetPositionDraftIconByIndex( f7_local0 ) ) )
		end
	end )
	self:addElement( ZombiesPortrait )
	self.ZombiesPortrait = ZombiesPortrait
	
	self:mergeStateConditions( {
		{
			stateName = "Self_KoreanZHT",
			condition = function ( menu, element, event )
				local f8_local0 = IsSelfClient( f1_arg1, element )
				if f8_local0 then
					f8_local0 = IsCurrentLanguageKoreanOrTraditionalChinese()
					if f8_local0 then
						f8_local0 = IsPC()
					end
				end
				return f8_local0
			end
		},
		{
			stateName = "DefaultState_KoreanZHT",
			condition = function ( menu, element, event )
				return IsCurrentLanguageKoreanOrTraditionalChinese() and IsPC()
			end
		},
		{
			stateName = "Self",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, f1_arg1 )
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
	local f1_local10 = self
	local f1_local11 = self.subscribeToModel
	local f1_local12 = Engine.GetModelForController( f1_arg1 )
	f1_local11( f1_local10, f1_local12["deadSpectator.playerIndex"], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "deadSpectator.playerIndex"
		} )
	end, false )
	f1_local10 = self
	f1_local11 = self.subscribeToModel
	f1_local12 = Engine.GetModelForController( f1_arg1 )
	f1_local11( f1_local10, f1_local12["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	self:linkToElementModel( self, nil, true, function ( model )
		CoD.DirectorUtility.UpdateVOIPStatusForModel( self, model, "clientNum" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local11 = self
	if IsPC() then
		CoD.PCWidgetUtility.SetupRightClickableContextualPlayerMenuScoreboard( self, f1_arg1, f1_arg0 )
	end
	return self
end

CoD.ScoreboardRowZM.__resetProperties = function ( f15_arg0 )
	f15_arg0.SelectorOverlay:completeAnimation()
	f15_arg0.playerPing:completeAnimation()
	f15_arg0.InformationList:completeAnimation()
	f15_arg0.SelectorOverlay.Base:setAlpha( 0 )
	f15_arg0.playerPing:setTopBottom( 0, 0, 42, 57 )
	f15_arg0.playerPing:setRGB( 1, 1, 1 )
	f15_arg0.InformationList:setTopBottom( 0.5, 0.5, -30, 30 )
	f15_arg0.InformationList.ClanAndGamerName:setRGB( 0.92, 0.92, 0.92 )
end

CoD.ScoreboardRowZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 0 )
		end,
		Focus = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 1 )
			f17_arg0.SelectorOverlay:completeAnimation()
			f17_arg0.SelectorOverlay.Base:completeAnimation()
			f17_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f17_arg0.clipFinished( f17_arg0.SelectorOverlay )
		end,
		GainFocus = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			local f18_local0 = function ( f19_arg0 )
				f18_arg0.SelectorOverlay:beginAnimation( 150 )
				f18_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f18_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f18_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.SelectorOverlay:completeAnimation()
			f18_arg0.SelectorOverlay.Base:completeAnimation()
			f18_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f18_local0( f18_arg0.SelectorOverlay )
		end,
		LoseFocus = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 1 )
			local f20_local0 = function ( f21_arg0 )
				f20_arg0.SelectorOverlay:beginAnimation( 150 )
				f20_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f20_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f20_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.SelectorOverlay:completeAnimation()
			f20_arg0.SelectorOverlay.Base:completeAnimation()
			f20_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f20_local0( f20_arg0.SelectorOverlay )
		end
	},
	Self_KoreanZHT = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 2 )
			f22_arg0.InformationList:completeAnimation()
			f22_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f22_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f22_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f22_arg0.clipFinished( f22_arg0.InformationList )
			f22_arg0.playerPing:completeAnimation()
			f22_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f22_arg0.playerPing:setRGB( 0.89, 0.64, 0 )
			f22_arg0.clipFinished( f22_arg0.playerPing )
		end,
		Focus = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 3 )
			f23_arg0.SelectorOverlay:completeAnimation()
			f23_arg0.SelectorOverlay.Base:completeAnimation()
			f23_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f23_arg0.clipFinished( f23_arg0.SelectorOverlay )
			f23_arg0.InformationList:completeAnimation()
			f23_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f23_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f23_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f23_arg0.clipFinished( f23_arg0.InformationList )
			f23_arg0.playerPing:completeAnimation()
			f23_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f23_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f23_arg0.clipFinished( f23_arg0.playerPing )
		end,
		GainFocus = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 3 )
			local f24_local0 = function ( f25_arg0 )
				f24_arg0.SelectorOverlay:beginAnimation( 150 )
				f24_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f24_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f24_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.SelectorOverlay:completeAnimation()
			f24_arg0.SelectorOverlay.Base:completeAnimation()
			f24_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f24_local0( f24_arg0.SelectorOverlay )
			f24_arg0.InformationList:completeAnimation()
			f24_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f24_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f24_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f24_arg0.clipFinished( f24_arg0.InformationList )
			f24_arg0.playerPing:completeAnimation()
			f24_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f24_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f24_arg0.clipFinished( f24_arg0.playerPing )
		end,
		LoseFocus = function ( f26_arg0, f26_arg1 )
			f26_arg0:__resetProperties()
			f26_arg0:setupElementClipCounter( 3 )
			local f26_local0 = function ( f27_arg0 )
				f26_arg0.SelectorOverlay:beginAnimation( 150 )
				f26_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f26_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f26_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
			end
			
			f26_arg0.SelectorOverlay:completeAnimation()
			f26_arg0.SelectorOverlay.Base:completeAnimation()
			f26_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f26_local0( f26_arg0.SelectorOverlay )
			f26_arg0.InformationList:completeAnimation()
			f26_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f26_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f26_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f26_arg0.clipFinished( f26_arg0.InformationList )
			f26_arg0.playerPing:completeAnimation()
			f26_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f26_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f26_arg0.clipFinished( f26_arg0.playerPing )
		end
	},
	DefaultState_KoreanZHT = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 2 )
			f28_arg0.InformationList:completeAnimation()
			f28_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f28_arg0.clipFinished( f28_arg0.InformationList )
			f28_arg0.playerPing:completeAnimation()
			f28_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f28_arg0.clipFinished( f28_arg0.playerPing )
		end,
		Focus = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 3 )
			f29_arg0.SelectorOverlay:completeAnimation()
			f29_arg0.SelectorOverlay.Base:completeAnimation()
			f29_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f29_arg0.clipFinished( f29_arg0.SelectorOverlay )
			f29_arg0.InformationList:completeAnimation()
			f29_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f29_arg0.clipFinished( f29_arg0.InformationList )
			f29_arg0.playerPing:completeAnimation()
			f29_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f29_arg0.clipFinished( f29_arg0.playerPing )
		end,
		GainFocus = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 3 )
			local f30_local0 = function ( f31_arg0 )
				f30_arg0.SelectorOverlay:beginAnimation( 150 )
				f30_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f30_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f30_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.SelectorOverlay:completeAnimation()
			f30_arg0.SelectorOverlay.Base:completeAnimation()
			f30_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f30_local0( f30_arg0.SelectorOverlay )
			f30_arg0.InformationList:completeAnimation()
			f30_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f30_arg0.clipFinished( f30_arg0.InformationList )
			f30_arg0.playerPing:completeAnimation()
			f30_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f30_arg0.clipFinished( f30_arg0.playerPing )
		end,
		LoseFocus = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 3 )
			local f32_local0 = function ( f33_arg0 )
				f32_arg0.SelectorOverlay:beginAnimation( 150 )
				f32_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f32_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f32_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.SelectorOverlay:completeAnimation()
			f32_arg0.SelectorOverlay.Base:completeAnimation()
			f32_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f32_local0( f32_arg0.SelectorOverlay )
			f32_arg0.InformationList:completeAnimation()
			f32_arg0.InformationList:setTopBottom( 0.5, 0.5, -38, 22 )
			f32_arg0.clipFinished( f32_arg0.InformationList )
			f32_arg0.playerPing:completeAnimation()
			f32_arg0.playerPing:setTopBottom( 0.5, 0.5, 9, 24 )
			f32_arg0.clipFinished( f32_arg0.playerPing )
		end
	},
	Self = {
		DefaultClip = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 2 )
			f34_arg0.InformationList:completeAnimation()
			f34_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f34_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f34_arg0.clipFinished( f34_arg0.InformationList )
			f34_arg0.playerPing:completeAnimation()
			f34_arg0.playerPing:setRGB( 0.89, 0.64, 0 )
			f34_arg0.clipFinished( f34_arg0.playerPing )
		end,
		Focus = function ( f35_arg0, f35_arg1 )
			f35_arg0:__resetProperties()
			f35_arg0:setupElementClipCounter( 3 )
			f35_arg0.SelectorOverlay:completeAnimation()
			f35_arg0.SelectorOverlay.Base:completeAnimation()
			f35_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f35_arg0.clipFinished( f35_arg0.SelectorOverlay )
			f35_arg0.InformationList:completeAnimation()
			f35_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f35_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f35_arg0.clipFinished( f35_arg0.InformationList )
			f35_arg0.playerPing:completeAnimation()
			f35_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f35_arg0.clipFinished( f35_arg0.playerPing )
		end,
		GainFocus = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 3 )
			local f36_local0 = function ( f37_arg0 )
				f36_arg0.SelectorOverlay:beginAnimation( 150 )
				f36_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f36_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
				f36_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
			end
			
			f36_arg0.SelectorOverlay:completeAnimation()
			f36_arg0.SelectorOverlay.Base:completeAnimation()
			f36_arg0.SelectorOverlay.Base:setAlpha( 0 )
			f36_local0( f36_arg0.SelectorOverlay )
			f36_arg0.InformationList:completeAnimation()
			f36_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f36_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f36_arg0.clipFinished( f36_arg0.InformationList )
			f36_arg0.playerPing:completeAnimation()
			f36_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f36_arg0.clipFinished( f36_arg0.playerPing )
		end,
		LoseFocus = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 3 )
			local f38_local0 = function ( f39_arg0 )
				f38_arg0.SelectorOverlay:beginAnimation( 150 )
				f38_arg0.SelectorOverlay.Base:beginAnimation( 150 )
				f38_arg0.SelectorOverlay.Base:setAlpha( 0 )
				f38_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
			end
			
			f38_arg0.SelectorOverlay:completeAnimation()
			f38_arg0.SelectorOverlay.Base:completeAnimation()
			f38_arg0.SelectorOverlay.Base:setAlpha( 0.02 )
			f38_local0( f38_arg0.SelectorOverlay )
			f38_arg0.InformationList:completeAnimation()
			f38_arg0.InformationList.ClanAndGamerName:completeAnimation()
			f38_arg0.InformationList.ClanAndGamerName:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
			f38_arg0.clipFinished( f38_arg0.InformationList )
			f38_arg0.playerPing:completeAnimation()
			f38_arg0.playerPing:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
			f38_arg0.clipFinished( f38_arg0.playerPing )
		end
	}
}
CoD.ScoreboardRowZM.__onClose = function ( f40_arg0 )
	f40_arg0.Base:close()
	f40_arg0.SelectorOverlay:close()
	f40_arg0.InformationList:close()
	f40_arg0.playerPing:close()
	f40_arg0.Rank:close()
	f40_arg0.VoipWaves:close()
	f40_arg0.ZombiesPortrait:close()
end

