require( "x64:32be451cbadd43b" )
require( "ui/uieditor/widgets/mphudwidgets/scorepopup/mpscr_pluspointscontainer" )
require( "ui/uieditor/widgets/mphudwidgets/scorepopup/mpscrfeeditem" )

CoD.MPScr = InheritFrom( LUI.UIElement )
CoD.MPScr.__defaultWidth = 150
CoD.MPScr.__defaultHeight = 37
CoD.MPScr.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPScr )
	self.id = "MPScr"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ScoreFeedGlow = LUI.UIImage.new( 0.5, 0.5, -93, 93, 0.5, 0.5, -83, 75 )
	ScoreFeedGlow:setRGB( 0.09, 0.16, 0.19 )
	ScoreFeedGlow:setAlpha( 0 )
	ScoreFeedGlow:setImage( RegisterImage( "uie_lui_score_feed_glow" ) )
	ScoreFeedGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScoreFeedGlow )
	self.ScoreFeedGlow = ScoreFeedGlow
	
	local Score = LUI.UIText.new( 0.5, 0.5, -75, 75, 0, 0, 3, 41 )
	Score:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	Score:setText( "" )
	Score:setTTF( "0arame_mono_stencil" )
	Score:setLetterSpacing( 2 )
	Score:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Score:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	LUI.OverrideFunction_CallOriginalFirst( Score, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 0 )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local ScoreFeedItem0 = CoD.MPScrFeedItem.new( f1_arg0, f1_arg1, 0, 0, 129, 489, 0, 0, -3, 24 )
	self:addElement( ScoreFeedItem0 )
	self.ScoreFeedItem0 = ScoreFeedItem0
	
	local MPScrPlusPointsContainer = CoD.MPScr_PlusPointsContainer.new( f1_arg0, f1_arg1, 0, 0, 37.5, 112.5, 0, 0, 8.5, 33.5 )
	self:addElement( MPScrPlusPointsContainer )
	self.MPScrPlusPointsContainer = MPScrPlusPointsContainer
	
	local BountyDollarsForDamage = CoD.BountyCashEventContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 150, 0, 0, 0, 38 )
	self:addElement( BountyDollarsForDamage )
	self.BountyDollarsForDamage = BountyDollarsForDamage
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f3_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] )
				if not f3_local0 then
					f3_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] )
					if not f3_local0 then
						f3_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
					end
				end
				return f3_local0
			end
		}
	} )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local7 = self
	CoD.ScoreboardUtility.MPScrPostLaod( self, f1_arg1, f1_arg0 )
	return self
end

CoD.MPScr.__resetProperties = function ( f7_arg0 )
	f7_arg0.Score:completeAnimation()
	f7_arg0.ScoreFeedGlow:completeAnimation()
	f7_arg0.ScoreFeedItem0:completeAnimation()
	f7_arg0.Score:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	f7_arg0.Score:setAlpha( 1 )
	f7_arg0.Score:setScale( 1, 1 )
	f7_arg0.ScoreFeedGlow:setLeftRight( 0.5, 0.5, -93, 93 )
	f7_arg0.ScoreFeedGlow:setTopBottom( 0.5, 0.5, -83, 75 )
	f7_arg0.ScoreFeedGlow:setRGB( 0.09, 0.16, 0.19 )
	f7_arg0.ScoreFeedGlow:setAlpha( 0 )
	f7_arg0.ScoreFeedGlow:setScale( 1, 1 )
	f7_arg0.ScoreFeedItem0:setRGB( 1, 1, 1 )
end

CoD.MPScr.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 2 )
			f8_arg0.ScoreFeedGlow:completeAnimation()
			f8_arg0.ScoreFeedGlow:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.ScoreFeedGlow )
			f8_arg0.Score:completeAnimation()
			f8_arg0.Score:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Score )
		end,
		CombatEfficiencyScore = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 2 )
			local f9_local0 = function ( f10_arg0 )
				local f10_local0 = function ( f11_arg0 )
					local f11_local0 = function ( f12_arg0 )
						local f12_local0 = function ( f13_arg0 )
							local f13_local0 = function ( f14_arg0 )
								f14_arg0:beginAnimation( 60 )
								f14_arg0:setLeftRight( 0.5, 0.5, -75, 75 )
								f14_arg0:setTopBottom( 0.5, 0.5, 0, 0 )
								f14_arg0:setRGB( 0, 0, 0 )
								f14_arg0:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
							end
							
							f13_arg0:beginAnimation( 9 )
							f13_arg0:setRGB( 1, 1, 1 )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
						
						f12_arg0:beginAnimation( 500 )
						f12_arg0:setRGB( 0.18, 0.33, 0.37 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
					
					f11_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f11_arg0:setRGB( 0.07, 0.27, 0.31 )
					f11_arg0:setAlpha( 1 )
					f11_arg0:setScale( 1, 1 )
					f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
				end
				
				f9_arg0.ScoreFeedGlow:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f9_arg0.ScoreFeedGlow:setRGB( 0.53, 0.63, 0.66 )
				f9_arg0.ScoreFeedGlow:setAlpha( 0.5 )
				f9_arg0.ScoreFeedGlow:setScale( 1.5, 1.5 )
				f9_arg0.ScoreFeedGlow:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", f10_local0 )
			end
			
			f9_arg0.ScoreFeedGlow:completeAnimation()
			f9_arg0.ScoreFeedGlow:setLeftRight( 0.5, 0.5, -93, 93 )
			f9_arg0.ScoreFeedGlow:setTopBottom( 0.5, 0.5, -83, 75 )
			f9_arg0.ScoreFeedGlow:setRGB( 1, 1, 1 )
			f9_arg0.ScoreFeedGlow:setAlpha( 0 )
			f9_arg0.ScoreFeedGlow:setScale( 0.2, 0.2 )
			f9_local0( f9_arg0.ScoreFeedGlow )
			local f9_local1 = function ( f15_arg0 )
				local f15_local0 = function ( f16_arg0 )
					local f16_local0 = function ( f17_arg0 )
						local f17_local0 = function ( f18_arg0 )
							f18_arg0:beginAnimation( 9 )
							f18_arg0:setAlpha( 0 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
						end
						
						f17_arg0:beginAnimation( 500 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
					
					f16_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f16_arg0:setScale( 1, 1 )
					f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				end
				
				f9_arg0.Score:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f9_arg0.Score:setScale( 1.75, 1.75 )
				f9_arg0.Score:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.Score:registerEventHandler( "transition_complete_keyframe", f15_local0 )
			end
			
			f9_arg0.Score:completeAnimation()
			f9_arg0.Score:setRGB( 0.6, 0.83, 0.96 )
			f9_arg0.Score:setAlpha( 1 )
			f9_arg0.Score:setScale( 0, 0 )
			f9_local1( f9_arg0.Score )
		end,
		NormalScore = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 2 )
			local f19_local0 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					local f21_local0 = function ( f22_arg0 )
						local f22_local0 = function ( f23_arg0 )
							local f23_local0 = function ( f24_arg0 )
								f24_arg0:beginAnimation( 60 )
								f24_arg0:setLeftRight( 0.5, 0.5, -75, 75 )
								f24_arg0:setTopBottom( 0.5, 0.5, 0, 0 )
								f24_arg0:setRGB( 0, 0, 0 )
								f24_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
							end
							
							f23_arg0:beginAnimation( 9 )
							f23_arg0:setRGB( 1, 1, 1 )
							f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
						end
						
						f22_arg0:beginAnimation( 500 )
						f22_arg0:setRGB( 0.13, 0.13, 0.13 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
					
					f21_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f21_arg0:setRGB( 0.19, 0.19, 0.19 )
					f21_arg0:setScale( 1, 1 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
				end
				
				f19_arg0.ScoreFeedGlow:beginAnimation( 250 )
				f19_arg0.ScoreFeedGlow:setRGB( 0.59, 0.59, 0.59 )
				f19_arg0.ScoreFeedGlow:setAlpha( 0.5 )
				f19_arg0.ScoreFeedGlow:setScale( 1.5, 1.5 )
				f19_arg0.ScoreFeedGlow:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f19_arg0.ScoreFeedGlow:completeAnimation()
			f19_arg0.ScoreFeedGlow:setLeftRight( 0.5, 0.5, -93, 93 )
			f19_arg0.ScoreFeedGlow:setTopBottom( 0.5, 0.5, -83, 75 )
			f19_arg0.ScoreFeedGlow:setRGB( 1, 1, 1 )
			f19_arg0.ScoreFeedGlow:setAlpha( 0 )
			f19_arg0.ScoreFeedGlow:setScale( 0.2, 0.2 )
			f19_local0( f19_arg0.ScoreFeedGlow )
			local f19_local1 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					local f26_local0 = function ( f27_arg0 )
						local f27_local0 = function ( f28_arg0 )
							f28_arg0:beginAnimation( 9 )
							f28_arg0:setAlpha( 0 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
						end
						
						f27_arg0:beginAnimation( 500, Enum[0xF50FFF429AB1890][0xC91E32008D731D0] | Enum[0xF50FFF429AB1890][0x5193EA7825DC097] )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
					
					f26_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f26_arg0:setScale( 1, 1 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
				end
				
				f19_arg0.Score:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f19_arg0.Score:setScale( 1.75, 1.75 )
				f19_arg0.Score:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.Score:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f19_arg0.Score:completeAnimation()
			f19_arg0.Score:setAlpha( 1 )
			f19_arg0.Score:setScale( 0, 0 )
			f19_local1( f19_arg0.Score )
		end,
		PositionScore = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 2 )
			local f29_local0 = function ( f30_arg0 )
				local f30_local0 = function ( f31_arg0 )
					local f31_local0 = function ( f32_arg0 )
						local f32_local0 = function ( f33_arg0 )
							f33_arg0:beginAnimation( 60 )
							f33_arg0:setLeftRight( 0.5, 0.5, -75, 75 )
							f33_arg0:setTopBottom( 0.5, 0.5, 0, 0 )
							f33_arg0:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
						end
						
						f32_arg0:beginAnimation( 510 )
						f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
					end
					
					f31_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f31_arg0:setScale( 1, 1 )
					f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
				end
				
				f29_arg0.ScoreFeedGlow:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f29_arg0.ScoreFeedGlow:setAlpha( 1 )
				f29_arg0.ScoreFeedGlow:setScale( 1.5, 1.5 )
				f29_arg0.ScoreFeedGlow:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", f30_local0 )
			end
			
			f29_arg0.ScoreFeedGlow:completeAnimation()
			f29_arg0.ScoreFeedGlow:setLeftRight( 0.5, 0.5, -93, 93 )
			f29_arg0.ScoreFeedGlow:setTopBottom( 0.5, 0.5, -83, 75 )
			f29_arg0.ScoreFeedGlow:setRGB( 0.05, 0.22, 0.3 )
			f29_arg0.ScoreFeedGlow:setAlpha( 0 )
			f29_arg0.ScoreFeedGlow:setScale( 0.2, 0.2 )
			f29_local0( f29_arg0.ScoreFeedGlow )
			local f29_local1 = function ( f34_arg0 )
				local f34_local0 = function ( f35_arg0 )
					local f35_local0 = function ( f36_arg0 )
						local f36_local0 = function ( f37_arg0 )
							f37_arg0:beginAnimation( 9 )
							f37_arg0:setAlpha( 0 )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
						end
						
						f36_arg0:beginAnimation( 500 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
					
					f35_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f35_arg0:setScale( 1, 1 )
					f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
				end
				
				f29_arg0.Score:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f29_arg0.Score:setScale( 1.75, 1.75 )
				f29_arg0.Score:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.Score:registerEventHandler( "transition_complete_keyframe", f34_local0 )
			end
			
			f29_arg0.Score:completeAnimation()
			f29_arg0.Score:setRGB( 0.18, 0.57, 0.91 )
			f29_arg0.Score:setAlpha( 1 )
			f29_arg0.Score:setScale( 0, 0 )
			f29_local1( f29_arg0.Score )
		end,
		BountyCash = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 3 )
			local f38_local0 = function ( f39_arg0 )
				local f39_local0 = function ( f40_arg0 )
					local f40_local0 = function ( f41_arg0 )
						local f41_local0 = function ( f42_arg0 )
							local f42_local0 = function ( f43_arg0 )
								f43_arg0:beginAnimation( 60 )
								f43_arg0:setLeftRight( 0.5, 0.5, -75, 75 )
								f43_arg0:setTopBottom( 0.5, 0.5, 0, 0 )
								f43_arg0:setRGB( 0, 0, 0 )
								f43_arg0:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
							end
							
							f42_arg0:beginAnimation( 9 )
							f42_arg0:setRGB( 0, 1, 0.07 )
							f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
						end
						
						f41_arg0:beginAnimation( 500 )
						f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
					end
					
					f40_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f40_arg0:setRGB( 0.09, 0.19, 0.1 )
					f40_arg0:setScale( 1, 1 )
					f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
				end
				
				f38_arg0.ScoreFeedGlow:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f38_arg0.ScoreFeedGlow:setRGB( 0.04, 0.59, 0.09 )
				f38_arg0.ScoreFeedGlow:setAlpha( 0.5 )
				f38_arg0.ScoreFeedGlow:setScale( 1.5, 1.5 )
				f38_arg0.ScoreFeedGlow:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", f39_local0 )
			end
			
			f38_arg0.ScoreFeedGlow:completeAnimation()
			f38_arg0.ScoreFeedGlow:setLeftRight( 0.5, 0.5, -93, 93 )
			f38_arg0.ScoreFeedGlow:setTopBottom( 0.5, 0.5, -83, 75 )
			f38_arg0.ScoreFeedGlow:setRGB( 0, 1, 0.07 )
			f38_arg0.ScoreFeedGlow:setAlpha( 0 )
			f38_arg0.ScoreFeedGlow:setScale( 0.2, 0.2 )
			f38_local0( f38_arg0.ScoreFeedGlow )
			local f38_local1 = function ( f44_arg0 )
				local f44_local0 = function ( f45_arg0 )
					local f45_local0 = function ( f46_arg0 )
						local f46_local0 = function ( f47_arg0 )
							f47_arg0:beginAnimation( 9 )
							f47_arg0:setAlpha( 0 )
							f47_arg0:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
						end
						
						f46_arg0:beginAnimation( 500, Enum[0xF50FFF429AB1890][0xC91E32008D731D0] | Enum[0xF50FFF429AB1890][0x5193EA7825DC097] )
						f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
					end
					
					f45_arg0:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f45_arg0:setScale( 1, 1 )
					f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
				end
				
				f38_arg0.Score:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f38_arg0.Score:setScale( 1.75, 1.75 )
				f38_arg0.Score:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.Score:registerEventHandler( "transition_complete_keyframe", f44_local0 )
			end
			
			f38_arg0.Score:completeAnimation()
			f38_arg0.Score:setRGB( 0, 1, 0.07 )
			f38_arg0.Score:setAlpha( 1 )
			f38_arg0.Score:setScale( 0, 0 )
			f38_local1( f38_arg0.Score )
			f38_arg0.ScoreFeedItem0:completeAnimation()
			f38_arg0.ScoreFeedItem0:setRGB( 0, 1, 0.07 )
			f38_arg0.clipFinished( f38_arg0.ScoreFeedItem0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f48_arg0, f48_arg1 )
			f48_arg0:__resetProperties()
			f48_arg0:setupElementClipCounter( 2 )
			f48_arg0.ScoreFeedGlow:completeAnimation()
			f48_arg0.ScoreFeedGlow:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.ScoreFeedGlow )
			f48_arg0.Score:completeAnimation()
			f48_arg0.Score:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.Score )
		end
	}
}
CoD.MPScr.__onClose = function ( f49_arg0 )
	f49_arg0.ScoreFeedItem0:close()
	f49_arg0.MPScrPlusPointsContainer:close()
	f49_arg0.BountyDollarsForDamage:close()
end

