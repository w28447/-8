CoD.MPDamageFeedback_FriendlyIndicator = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback_FriendlyIndicator.__defaultWidth = 60
CoD.MPDamageFeedback_FriendlyIndicator.__defaultHeight = 60
CoD.MPDamageFeedback_FriendlyIndicator.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPDamageFeedback_FriendlyIndicator )
	self.id = "MPDamageFeedback_FriendlyIndicator"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local death = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	death:setAlpha( 0 )
	death:setImage( RegisterImage( 0x33BF1F900365A8F ) )
	death:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( death )
	self.death = death
	
	local damage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	damage:setRGB( ColorSet.T8_PC_CHAT_EVENT_ALLY.r, ColorSet.T8_PC_CHAT_EVENT_ALLY.g, ColorSet.T8_PC_CHAT_EVENT_ALLY.b )
	damage:setAlpha( 0 )
	damage:setImage( RegisterImage( 0xA262576CC178699 ) )
	self:addElement( damage )
	self.damage = damage
	
	local DownArrow = LUI.UIImage.new( 0.5, 0.5, -5, 5, 0.5, 0.5, 5, 15 )
	DownArrow:setAlpha( 0 )
	DownArrow:setImage( RegisterImage( "uie_ui_icon_damagefeedback_downarrow_glow_orange" ) )
	DownArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DownArrow )
	self.DownArrow = DownArrow
	
	self:mergeStateConditions( {
		{
			stateName = "Stage1",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D705CCFC73984] )
			end
		},
		{
			stateName = "Stage2",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D705CCFC73984] )
			end
		},
		{
			stateName = "Stage3",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D725CCFC73CEA] )
			end
		},
		{
			stateName = "Stage4",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D6D5CCFC7346B] )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x5B0576E9C2CFCC3] )
			end
		},
		{
			stateName = "Death",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D6C5CCFC732B8] ) and DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x1A54B9091B60520] )
			end
		},
		{
			stateName = "Stage5",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D6C5CCFC732B8] )
			end
		}
	} )
	self:linkToElementModel( self, "damageFeedbackState", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "damageFeedbackState"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.MPDamageFeedback_FriendlyIndicator.__resetProperties = function ( f10_arg0 )
	f10_arg0.damage:completeAnimation()
	f10_arg0.death:completeAnimation()
	f10_arg0.DownArrow:completeAnimation()
	f10_arg0.damage:setLeftRight( 0, 1, 0, 0 )
	f10_arg0.damage:setTopBottom( 0, 1, 0, 0 )
	f10_arg0.damage:setAlpha( 0 )
	f10_arg0.death:setLeftRight( 0, 1, 0, 0 )
	f10_arg0.death:setTopBottom( 0, 1, 0, 0 )
	f10_arg0.death:setAlpha( 0 )
	f10_arg0.death:setScale( 1, 1 )
	f10_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
	f10_arg0.DownArrow:setAlpha( 0 )
end

CoD.MPDamageFeedback_FriendlyIndicator.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 2 )
			f11_arg0.death:completeAnimation()
			f11_arg0.death:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.death )
			f11_arg0.damage:completeAnimation()
			f11_arg0.damage:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.damage )
		end
	},
	Stage1 = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.damage:completeAnimation()
			f12_arg0.damage:setLeftRight( 0, 1, -2, 2 )
			f12_arg0.damage:setTopBottom( 0, 1, -2, 2 )
			f12_arg0.damage:setAlpha( 1 )
			f12_arg0.clipFinished( f12_arg0.damage )
		end,
		DefaultState = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 2 )
			f13_arg0.death:completeAnimation()
			f13_arg0.death:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.death )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.damage:beginAnimation( 750 )
				f13_arg0.damage:setAlpha( 0 )
				f13_arg0.damage:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.damage:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.damage:completeAnimation()
			f13_arg0.damage:setLeftRight( 0, 1, -2, 2 )
			f13_arg0.damage:setTopBottom( 0, 1, -2, 2 )
			f13_arg0.damage:setAlpha( 1 )
			f13_local0( f13_arg0.damage )
		end
	},
	Stage2 = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.damage:completeAnimation()
			f15_arg0.damage:setLeftRight( 0, 1, -3, 3 )
			f15_arg0.damage:setTopBottom( 0, 1, -3, 3 )
			f15_arg0.damage:setAlpha( 1 )
			f15_arg0.clipFinished( f15_arg0.damage )
		end,
		DefaultState = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			f16_arg0.death:completeAnimation()
			f16_arg0.death:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.death )
			local f16_local0 = function ( f17_arg0 )
				f16_arg0.damage:beginAnimation( 750 )
				f16_arg0.damage:setAlpha( 0 )
				f16_arg0.damage:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.damage:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.damage:completeAnimation()
			f16_arg0.damage:setLeftRight( 0, 1, -3, 3 )
			f16_arg0.damage:setTopBottom( 0, 1, -3, 3 )
			f16_arg0.damage:setAlpha( 1 )
			f16_local0( f16_arg0.damage )
		end
	},
	Stage3 = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.damage:completeAnimation()
			f18_arg0.damage:setLeftRight( 0, 1, -4, 4 )
			f18_arg0.damage:setTopBottom( 0, 1, -4, 4 )
			f18_arg0.damage:setAlpha( 1 )
			f18_arg0.clipFinished( f18_arg0.damage )
		end,
		DefaultState = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 2 )
			f19_arg0.death:completeAnimation()
			f19_arg0.death:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.death )
			local f19_local0 = function ( f20_arg0 )
				f19_arg0.damage:beginAnimation( 750 )
				f19_arg0.damage:setAlpha( 0 )
				f19_arg0.damage:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.damage:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.damage:completeAnimation()
			f19_arg0.damage:setLeftRight( 0, 1, -4, 4 )
			f19_arg0.damage:setTopBottom( 0, 1, -4, 4 )
			f19_arg0.damage:setAlpha( 1 )
			f19_local0( f19_arg0.damage )
		end
	},
	Stage4 = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 1 )
			f21_arg0.damage:completeAnimation()
			f21_arg0.damage:setLeftRight( 0, 1, -6, 6 )
			f21_arg0.damage:setTopBottom( 0, 1, -6, 6 )
			f21_arg0.damage:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.damage )
		end,
		DefaultState = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 2 )
			f22_arg0.death:completeAnimation()
			f22_arg0.death:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.death )
			local f22_local0 = function ( f23_arg0 )
				f22_arg0.damage:beginAnimation( 750 )
				f22_arg0.damage:setAlpha( 0 )
				f22_arg0.damage:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.damage:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.damage:completeAnimation()
			f22_arg0.damage:setLeftRight( 0, 1, -6, 6 )
			f22_arg0.damage:setTopBottom( 0, 1, -6, 6 )
			f22_arg0.damage:setAlpha( 1 )
			f22_local0( f22_arg0.damage )
		end
	},
	Downed = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 2 )
			local f24_local0 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					f26_arg0:beginAnimation( 390 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
				end
				
				f24_arg0.death:beginAnimation( 200 )
				f24_arg0.death:setScale( 1, 1 )
				f24_arg0.death:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.death:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f24_arg0.death:completeAnimation()
			f24_arg0.death:setAlpha( 1 )
			f24_arg0.death:setScale( 1.6, 1.6 )
			f24_local0( f24_arg0.death )
			local f24_local1 = function ( f27_arg0 )
				f24_arg0.DownArrow:beginAnimation( 300 )
				f24_arg0.DownArrow:setTopBottom( 0.5, 0.5, 27, 37 )
				f24_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.DownArrow:completeAnimation()
			f24_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
			f24_arg0.DownArrow:setAlpha( 1 )
			f24_local1( f24_arg0.DownArrow )
		end,
		DefaultState = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 3 )
			local f28_local0 = function ( f29_arg0 )
				local f29_local0 = function ( f30_arg0 )
					f30_arg0:beginAnimation( 80 )
					f30_arg0:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
				end
				
				f28_arg0.death:beginAnimation( 120 )
				f28_arg0.death:setAlpha( 0 )
				f28_arg0.death:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.death:registerEventHandler( "transition_complete_keyframe", f29_local0 )
			end
			
			f28_arg0.death:completeAnimation()
			f28_arg0.death:setAlpha( 1 )
			f28_local0( f28_arg0.death )
			f28_arg0.damage:completeAnimation()
			f28_arg0.damage:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.damage )
			local f28_local1 = function ( f31_arg0 )
				local f31_local0 = function ( f32_arg0 )
					f32_arg0:beginAnimation( 80 )
					f32_arg0:setAlpha( 0 )
					f32_arg0:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
				end
				
				f28_arg0.DownArrow:beginAnimation( 120 )
				f28_arg0.DownArrow:setAlpha( 0.4 )
				f28_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f31_local0 )
			end
			
			f28_arg0.DownArrow:completeAnimation()
			f28_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
			f28_arg0.DownArrow:setAlpha( 1 )
			f28_local1( f28_arg0.DownArrow )
		end
	},
	Death = {
		DefaultClip = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 1 )
			local f33_local0 = function ( f34_arg0 )
				local f34_local0 = function ( f35_arg0 )
					f35_arg0:beginAnimation( 390 )
					f35_arg0:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
				end
				
				f33_arg0.death:beginAnimation( 200 )
				f33_arg0.death:setScale( 1, 1 )
				f33_arg0.death:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.death:registerEventHandler( "transition_complete_keyframe", f34_local0 )
			end
			
			f33_arg0.death:completeAnimation()
			f33_arg0.death:setAlpha( 1 )
			f33_arg0.death:setScale( 1.6, 1.6 )
			f33_local0( f33_arg0.death )
		end,
		DefaultState = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 3 )
			local f36_local0 = function ( f37_arg0 )
				f36_arg0.death:beginAnimation( 120 )
				f36_arg0.death:setAlpha( 0 )
				f36_arg0.death:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.death:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
			end
			
			f36_arg0.death:completeAnimation()
			f36_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f36_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f36_arg0.death:setAlpha( 1 )
			f36_arg0.death:setScale( 1, 1 )
			f36_local0( f36_arg0.death )
			f36_arg0.damage:completeAnimation()
			f36_arg0.damage:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.damage )
			f36_arg0.DownArrow:completeAnimation()
			f36_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
			f36_arg0.DownArrow:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.DownArrow )
		end
	},
	Stage5 = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 1 )
			f38_arg0.damage:completeAnimation()
			f38_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f38_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f38_arg0.damage:setAlpha( 1 )
			f38_arg0.clipFinished( f38_arg0.damage )
		end,
		DefaultState = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 2 )
			f39_arg0.death:completeAnimation()
			f39_arg0.death:setAlpha( 0 )
			f39_arg0.clipFinished( f39_arg0.death )
			local f39_local0 = function ( f40_arg0 )
				f39_arg0.damage:beginAnimation( 750 )
				f39_arg0.damage:setAlpha( 0 )
				f39_arg0.damage:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.damage:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.damage:completeAnimation()
			f39_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f39_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f39_arg0.damage:setAlpha( 1 )
			f39_local0( f39_arg0.damage )
		end
	}
}
