require( "x64:8fb761d8fded738" )
require( "ui/uieditor/widgets/mp/mpdamagefeedback_perkfeedback" )
require( "x64:7a5216c5a646b1" )

CoD.MPDamageFeedback = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback.__defaultWidth = 60
CoD.MPDamageFeedback.__defaultHeight = 60
CoD.MPDamageFeedback.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPDamageFeedback )
	self.id = "MPDamageFeedback"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local perkFeedback = CoD.MPDamageFeedback_PerkFeedback.new( f1_arg0, f1_arg1, 0.5, 0.5, -30, 30, 1, 1, -60, 60 )
	perkFeedback:linkToElementModel( self, nil, false, function ( model )
		perkFeedback:setModel( model, f1_arg1 )
	end )
	self:addElement( perkFeedback )
	self.perkFeedback = perkFeedback
	
	local damage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	damage:setImage( RegisterImage( "uie_t7_damage_feedback" ) )
	self:addElement( damage )
	self.damage = damage
	
	local death = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	death:setImage( RegisterImage( "uie_t7_damage_feedback_glow_orange" ) )
	death:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( death )
	self.death = death
	
	local DownArrow = LUI.UIImage.new( 0.5, 0.5, -5, 5, 0.5, 0.5, 5, 15 )
	DownArrow:setAlpha( 0 )
	DownArrow:setImage( RegisterImage( "uie_ui_icon_damagefeedback_downarrow_glow_orange" ) )
	DownArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DownArrow )
	self.DownArrow = DownArrow
	
	local MPDamageFeedbackFriendlyIndicator = CoD.MPDamageFeedback_FriendlyIndicator.new( f1_arg0, f1_arg1, 0.5, 0.5, -30, 30, 0.5, 0.5, -30, 30 )
	MPDamageFeedbackFriendlyIndicator:setAlpha( 0 )
	MPDamageFeedbackFriendlyIndicator:linkToElementModel( self, nil, false, function ( model )
		MPDamageFeedbackFriendlyIndicator:setModel( model, f1_arg1 )
	end )
	self:addElement( MPDamageFeedbackFriendlyIndicator )
	self.MPDamageFeedbackFriendlyIndicator = MPDamageFeedbackFriendlyIndicator
	
	local MPDamageFeedbackPredictedIndicator = CoD.MPDamageFeedback_PredictedIndicator.new( f1_arg0, f1_arg1, 0.5, 0.5, -30, 30, 0.5, 0.5, -30, 30 )
	MPDamageFeedbackPredictedIndicator:linkToElementModel( self, nil, false, function ( model )
		MPDamageFeedbackPredictedIndicator:setModel( model, f1_arg1 )
	end )
	self:addElement( MPDamageFeedbackPredictedIndicator )
	self.MPDamageFeedbackPredictedIndicator = MPDamageFeedbackPredictedIndicator
	
	self:mergeStateConditions( {
		{
			stateName = "VehicleDeath",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xFE06100A5689C76] ) and DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x1A54B9091B60520] )
			end
		},
		{
			stateName = "Vehicle",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xFE06100A5689C76] )
			end
		},
		{
			stateName = "Alternate_Downed",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x8B636437CCB1D61] ) and DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x5B0576E9C2CFCC3] )
			end
		},
		{
			stateName = "Alternate_Death",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x8B636437CCB1D61] ) and DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x1A54B9091B60520] )
			end
		},
		{
			stateName = "Alternate",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x8B636437CCB1D61] )
			end
		},
		{
			stateName = "FriendlyFire",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xC75BDFC08D00C05] )
			end
		},
		{
			stateName = "Stage1",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D705CCFC73984] )
			end
		},
		{
			stateName = "Stage2",
			condition = function ( menu, element, event )
				return DamageFeedbackInStage( element, Enum.DamageFeedbackState[0x74D735CCFC73E9D] )
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f19_arg2, f19_arg3, f19_arg4 )
		CoD.HUDUtility.OnDamageFeedbackSetState( self, controller, f19_arg2 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.MPDamageFeedback.__resetProperties = function ( f20_arg0 )
	f20_arg0.damage:completeAnimation()
	f20_arg0.perkFeedback:completeAnimation()
	f20_arg0.death:completeAnimation()
	f20_arg0.MPDamageFeedbackFriendlyIndicator:completeAnimation()
	f20_arg0.MPDamageFeedbackPredictedIndicator:completeAnimation()
	f20_arg0.DownArrow:completeAnimation()
	f20_arg0.damage:setLeftRight( 0, 1, 0, 0 )
	f20_arg0.damage:setTopBottom( 0, 1, 0, 0 )
	f20_arg0.damage:setRGB( 1, 1, 1 )
	f20_arg0.damage:setAlpha( 1 )
	f20_arg0.damage:setScale( 1, 1 )
	f20_arg0.damage:setImage( RegisterImage( "uie_t7_damage_feedback" ) )
	f20_arg0.perkFeedback:setAlpha( 1 )
	f20_arg0.death:setLeftRight( 0, 1, 0, 0 )
	f20_arg0.death:setTopBottom( 0, 1, 0, 0 )
	f20_arg0.death:setAlpha( 1 )
	f20_arg0.death:setScale( 1, 1 )
	f20_arg0.MPDamageFeedbackFriendlyIndicator:setAlpha( 0 )
	f20_arg0.MPDamageFeedbackPredictedIndicator:setAlpha( 1 )
	f20_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
	f20_arg0.DownArrow:setAlpha( 0 )
end

CoD.MPDamageFeedback.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 5 )
			f21_arg0.perkFeedback:completeAnimation()
			f21_arg0.perkFeedback:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.perkFeedback )
			f21_arg0.damage:completeAnimation()
			f21_arg0.damage:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.damage )
			f21_arg0.death:completeAnimation()
			f21_arg0.death:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.death )
			f21_arg0.MPDamageFeedbackFriendlyIndicator:completeAnimation()
			f21_arg0.MPDamageFeedbackFriendlyIndicator:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.MPDamageFeedbackFriendlyIndicator )
			f21_arg0.MPDamageFeedbackPredictedIndicator:completeAnimation()
			f21_arg0.MPDamageFeedbackPredictedIndicator:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.MPDamageFeedbackPredictedIndicator )
		end
	},
	VehicleDeath = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 2 )
			local f22_local0 = function ( f23_arg0 )
				f22_arg0.damage:beginAnimation( 200 )
				f22_arg0.damage:setScale( 1.5, 1.5 )
				f22_arg0.damage:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.damage:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.damage:completeAnimation()
			f22_arg0.damage:setRGB( 0.96, 0.05, 0.05 )
			f22_arg0.damage:setAlpha( 1 )
			f22_arg0.damage:setScale( 1, 1 )
			f22_arg0.damage:setImage( RegisterImage( "uie_t7_damage_feedback_vehicle" ) )
			f22_local0( f22_arg0.damage )
			f22_arg0.death:completeAnimation()
			f22_arg0.death:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.death )
		end,
		DefaultState = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 3 )
			f24_arg0.perkFeedback:completeAnimation()
			f24_arg0.perkFeedback:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.perkFeedback )
			local f24_local0 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					f26_arg0:beginAnimation( 550 )
					f26_arg0:setAlpha( 0 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
				end
				
				f24_arg0.damage:beginAnimation( 200 )
				f24_arg0.damage:setAlpha( 0.73 )
				f24_arg0.damage:setScale( 1, 1 )
				f24_arg0.damage:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.damage:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f24_arg0.damage:completeAnimation()
			f24_arg0.damage:setRGB( 0.96, 0.05, 0.05 )
			f24_arg0.damage:setAlpha( 1 )
			f24_arg0.damage:setScale( 1.5, 1.5 )
			f24_arg0.damage:setImage( RegisterImage( "uie_t7_damage_feedback_vehicle" ) )
			f24_local0( f24_arg0.damage )
			f24_arg0.death:completeAnimation()
			f24_arg0.death:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.death )
		end
	},
	Vehicle = {
		DefaultClip = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 2 )
			f27_arg0.damage:completeAnimation()
			f27_arg0.damage:setAlpha( 1 )
			f27_arg0.damage:setImage( RegisterImage( "uie_t7_damage_feedback_vehicle" ) )
			f27_arg0.clipFinished( f27_arg0.damage )
			f27_arg0.death:completeAnimation()
			f27_arg0.death:setAlpha( 0 )
			f27_arg0.clipFinished( f27_arg0.death )
		end,
		DefaultState = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 3 )
			f28_arg0.perkFeedback:completeAnimation()
			f28_arg0.perkFeedback:setAlpha( 1 )
			f28_arg0.clipFinished( f28_arg0.perkFeedback )
			local f28_local0 = function ( f29_arg0 )
				f28_arg0.damage:beginAnimation( 750 )
				f28_arg0.damage:setAlpha( 0 )
				f28_arg0.damage:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.damage:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.damage:completeAnimation()
			f28_arg0.damage:setAlpha( 1 )
			f28_arg0.damage:setImage( RegisterImage( "uie_t7_damage_feedback_vehicle" ) )
			f28_local0( f28_arg0.damage )
			f28_arg0.death:completeAnimation()
			f28_arg0.death:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.death )
		end
	},
	Alternate_Downed = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 3 )
			f30_arg0.damage:completeAnimation()
			f30_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f30_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f30_arg0.damage:setRGB( 1, 0, 0 )
			f30_arg0.damage:setScale( 1, 1 )
			f30_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f30_arg0.clipFinished( f30_arg0.damage )
			f30_arg0.death:completeAnimation()
			f30_arg0.death:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.death )
			local f30_local0 = function ( f31_arg0 )
				local f31_local0 = function ( f32_arg0 )
					f32_arg0:beginAnimation( 300 )
					f32_arg0:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
				end
				
				f30_arg0.DownArrow:beginAnimation( 300 )
				f30_arg0.DownArrow:setTopBottom( 0.5, 0.5, 26, 38 )
				f30_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f31_local0 )
			end
			
			f30_arg0.DownArrow:completeAnimation()
			f30_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
			f30_arg0.DownArrow:setAlpha( 1 )
			f30_local0( f30_arg0.DownArrow )
		end,
		DefaultState = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 4 )
			local f33_local0 = function ( f34_arg0 )
				f33_arg0.perkFeedback:beginAnimation( 750 )
				f33_arg0.perkFeedback:setAlpha( 0 )
				f33_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.perkFeedback:completeAnimation()
			f33_arg0.perkFeedback:setAlpha( 1 )
			f33_local0( f33_arg0.perkFeedback )
			local f33_local1 = function ( f35_arg0 )
				f33_arg0.damage:beginAnimation( 750 )
				f33_arg0.damage:setLeftRight( 0, 1, 0, 0 )
				f33_arg0.damage:setTopBottom( 0, 1, 0, 0 )
				f33_arg0.damage:setAlpha( 0 )
				f33_arg0.damage:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.damage:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.damage:completeAnimation()
			f33_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f33_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f33_arg0.damage:setRGB( 1, 0, 0 )
			f33_arg0.damage:setAlpha( 1 )
			f33_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f33_local1( f33_arg0.damage )
			f33_arg0.death:completeAnimation()
			f33_arg0.death:setAlpha( 0 )
			f33_arg0.clipFinished( f33_arg0.death )
			local f33_local2 = function ( f36_arg0 )
				f33_arg0.DownArrow:beginAnimation( 600 )
				f33_arg0.DownArrow:setAlpha( 0 )
				f33_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.DownArrow:completeAnimation()
			f33_arg0.DownArrow:setTopBottom( 0.5, 0.5, 27, 37 )
			f33_arg0.DownArrow:setAlpha( 1 )
			f33_local2( f33_arg0.DownArrow )
		end
	},
	Alternate_Death = {
		DefaultClip = function ( f37_arg0, f37_arg1 )
			f37_arg0:__resetProperties()
			f37_arg0:setupElementClipCounter( 2 )
			f37_arg0.damage:completeAnimation()
			f37_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f37_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f37_arg0.damage:setRGB( 1, 0, 0 )
			f37_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f37_arg0.clipFinished( f37_arg0.damage )
			f37_arg0.death:completeAnimation()
			f37_arg0.death:setAlpha( 0 )
			f37_arg0.clipFinished( f37_arg0.death )
		end,
		DefaultState = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 3 )
			local f38_local0 = function ( f39_arg0 )
				f38_arg0.perkFeedback:beginAnimation( 750 )
				f38_arg0.perkFeedback:setAlpha( 0 )
				f38_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
			end
			
			f38_arg0.perkFeedback:completeAnimation()
			f38_arg0.perkFeedback:setAlpha( 1 )
			f38_local0( f38_arg0.perkFeedback )
			local f38_local1 = function ( f40_arg0 )
				f38_arg0.damage:beginAnimation( 750 )
				f38_arg0.damage:setLeftRight( 0, 1, 0, 0 )
				f38_arg0.damage:setTopBottom( 0, 1, 0, 0 )
				f38_arg0.damage:setAlpha( 0 )
				f38_arg0.damage:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.damage:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
			end
			
			f38_arg0.damage:completeAnimation()
			f38_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f38_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f38_arg0.damage:setRGB( 1, 0, 0 )
			f38_arg0.damage:setAlpha( 1 )
			f38_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f38_local1( f38_arg0.damage )
			f38_arg0.death:completeAnimation()
			f38_arg0.death:setAlpha( 0 )
			f38_arg0.clipFinished( f38_arg0.death )
		end
	},
	Alternate = {
		DefaultClip = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 2 )
			f41_arg0.damage:completeAnimation()
			f41_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f41_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f41_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f41_arg0.clipFinished( f41_arg0.damage )
			f41_arg0.death:completeAnimation()
			f41_arg0.death:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.death )
		end,
		DefaultState = function ( f42_arg0, f42_arg1 )
			f42_arg0:__resetProperties()
			f42_arg0:setupElementClipCounter( 3 )
			local f42_local0 = function ( f43_arg0 )
				f42_arg0.perkFeedback:beginAnimation( 750 )
				f42_arg0.perkFeedback:setAlpha( 0 )
				f42_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
			end
			
			f42_arg0.perkFeedback:completeAnimation()
			f42_arg0.perkFeedback:setAlpha( 1 )
			f42_local0( f42_arg0.perkFeedback )
			local f42_local1 = function ( f44_arg0 )
				f42_arg0.damage:beginAnimation( 750 )
				f42_arg0.damage:setLeftRight( 0, 1, 0, 0 )
				f42_arg0.damage:setTopBottom( 0, 1, 0, 0 )
				f42_arg0.damage:setAlpha( 0 )
				f42_arg0.damage:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.damage:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
			end
			
			f42_arg0.damage:completeAnimation()
			f42_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f42_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f42_arg0.damage:setAlpha( 1 )
			f42_arg0.damage:setImage( RegisterImage( 0xE830966C621808A ) )
			f42_local1( f42_arg0.damage )
			f42_arg0.death:completeAnimation()
			f42_arg0.death:setAlpha( 0 )
			f42_arg0.clipFinished( f42_arg0.death )
		end
	},
	FriendlyFire = {
		DefaultClip = function ( f45_arg0, f45_arg1 )
			f45_arg0:__resetProperties()
			f45_arg0:setupElementClipCounter( 3 )
			f45_arg0.damage:completeAnimation()
			f45_arg0.damage:setAlpha( 0 )
			f45_arg0.clipFinished( f45_arg0.damage )
			f45_arg0.death:completeAnimation()
			f45_arg0.death:setAlpha( 0 )
			f45_arg0.clipFinished( f45_arg0.death )
			f45_arg0.MPDamageFeedbackFriendlyIndicator:completeAnimation()
			f45_arg0.MPDamageFeedbackFriendlyIndicator:setAlpha( 1 )
			f45_arg0.clipFinished( f45_arg0.MPDamageFeedbackFriendlyIndicator )
		end,
		DefaultState = function ( f46_arg0, f46_arg1 )
			f46_arg0:__resetProperties()
			f46_arg0:setupElementClipCounter( 3 )
			f46_arg0.damage:completeAnimation()
			f46_arg0.damage:setAlpha( 0 )
			f46_arg0.clipFinished( f46_arg0.damage )
			f46_arg0.death:completeAnimation()
			f46_arg0.death:setAlpha( 0 )
			f46_arg0.clipFinished( f46_arg0.death )
			local f46_local0 = function ( f47_arg0 )
				f46_arg0.MPDamageFeedbackFriendlyIndicator:beginAnimation( 120 )
				f46_arg0.MPDamageFeedbackFriendlyIndicator:setAlpha( 0 )
				f46_arg0.MPDamageFeedbackFriendlyIndicator:registerEventHandler( "interrupted_keyframe", f46_arg0.clipInterrupted )
				f46_arg0.MPDamageFeedbackFriendlyIndicator:registerEventHandler( "transition_complete_keyframe", f46_arg0.clipFinished )
			end
			
			f46_arg0.MPDamageFeedbackFriendlyIndicator:completeAnimation()
			f46_arg0.MPDamageFeedbackFriendlyIndicator:setAlpha( 1 )
			f46_local0( f46_arg0.MPDamageFeedbackFriendlyIndicator )
		end
	},
	Stage1 = {
		DefaultClip = function ( f48_arg0, f48_arg1 )
			f48_arg0:__resetProperties()
			f48_arg0:setupElementClipCounter( 2 )
			local f48_local0 = function ( f49_arg0 )
				local f49_local0 = function ( f50_arg0 )
					f50_arg0:beginAnimation( 100 )
					f50_arg0:setRGB( 1, 1, 1 )
					f50_arg0:registerEventHandler( "transition_complete_keyframe", f48_arg0.clipFinished )
				end
				
				f48_arg0.damage:beginAnimation( 100 )
				f48_arg0.damage:registerEventHandler( "interrupted_keyframe", f48_arg0.clipInterrupted )
				f48_arg0.damage:registerEventHandler( "transition_complete_keyframe", f49_local0 )
			end
			
			f48_arg0.damage:completeAnimation()
			f48_arg0.damage:setLeftRight( 0, 1, -2, 2 )
			f48_arg0.damage:setTopBottom( 0, 1, -2, 2 )
			f48_arg0.damage:setRGB( 0.84, 0.99, 1 )
			f48_local0( f48_arg0.damage )
			f48_arg0.death:completeAnimation()
			f48_arg0.death:setLeftRight( 0, 1, -2, 2 )
			f48_arg0.death:setTopBottom( 0, 1, -2, 2 )
			f48_arg0.death:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.death )
		end,
		DefaultState = function ( f51_arg0, f51_arg1 )
			f51_arg0:__resetProperties()
			f51_arg0:setupElementClipCounter( 3 )
			local f51_local0 = function ( f52_arg0 )
				f51_arg0.perkFeedback:beginAnimation( 750 )
				f51_arg0.perkFeedback:setAlpha( 0 )
				f51_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
				f51_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
			end
			
			f51_arg0.perkFeedback:completeAnimation()
			f51_arg0.perkFeedback:setAlpha( 1 )
			f51_local0( f51_arg0.perkFeedback )
			local f51_local1 = function ( f53_arg0 )
				f51_arg0.damage:beginAnimation( 750 )
				f51_arg0.damage:setAlpha( 0 )
				f51_arg0.damage:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
				f51_arg0.damage:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
			end
			
			f51_arg0.damage:completeAnimation()
			f51_arg0.damage:setLeftRight( 0, 1, -2, 2 )
			f51_arg0.damage:setTopBottom( 0, 1, -2, 2 )
			f51_arg0.damage:setAlpha( 1 )
			f51_local1( f51_arg0.damage )
			local f51_local2 = function ( f54_arg0 )
				f51_arg0.death:beginAnimation( 750 )
				f51_arg0.death:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
				f51_arg0.death:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
			end
			
			f51_arg0.death:completeAnimation()
			f51_arg0.death:setLeftRight( 0, 1, -2, 2 )
			f51_arg0.death:setTopBottom( 0, 1, -2, 2 )
			f51_arg0.death:setAlpha( 0 )
			f51_local2( f51_arg0.death )
		end
	},
	Stage2 = {
		DefaultClip = function ( f55_arg0, f55_arg1 )
			f55_arg0:__resetProperties()
			f55_arg0:setupElementClipCounter( 2 )
			local f55_local0 = function ( f56_arg0 )
				local f56_local0 = function ( f57_arg0 )
					f57_arg0:beginAnimation( 100 )
					f57_arg0:setRGB( 1, 1, 1 )
					f57_arg0:registerEventHandler( "transition_complete_keyframe", f55_arg0.clipFinished )
				end
				
				f55_arg0.damage:beginAnimation( 100 )
				f55_arg0.damage:registerEventHandler( "interrupted_keyframe", f55_arg0.clipInterrupted )
				f55_arg0.damage:registerEventHandler( "transition_complete_keyframe", f56_local0 )
			end
			
			f55_arg0.damage:completeAnimation()
			f55_arg0.damage:setLeftRight( 0, 1, -3, 3 )
			f55_arg0.damage:setTopBottom( 0, 1, -3, 3 )
			f55_arg0.damage:setRGB( 0.84, 0.99, 1 )
			f55_local0( f55_arg0.damage )
			f55_arg0.death:completeAnimation()
			f55_arg0.death:setLeftRight( 0, 1, -3, 3 )
			f55_arg0.death:setTopBottom( 0, 1, -3, 3 )
			f55_arg0.death:setAlpha( 0 )
			f55_arg0.clipFinished( f55_arg0.death )
		end,
		DefaultState = function ( f58_arg0, f58_arg1 )
			f58_arg0:__resetProperties()
			f58_arg0:setupElementClipCounter( 3 )
			local f58_local0 = function ( f59_arg0 )
				f58_arg0.perkFeedback:beginAnimation( 750 )
				f58_arg0.perkFeedback:setAlpha( 0 )
				f58_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.perkFeedback:completeAnimation()
			f58_arg0.perkFeedback:setAlpha( 1 )
			f58_local0( f58_arg0.perkFeedback )
			local f58_local1 = function ( f60_arg0 )
				f58_arg0.damage:beginAnimation( 750 )
				f58_arg0.damage:setAlpha( 0 )
				f58_arg0.damage:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.damage:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.damage:completeAnimation()
			f58_arg0.damage:setLeftRight( 0, 1, -3, 3 )
			f58_arg0.damage:setTopBottom( 0, 1, -3, 3 )
			f58_arg0.damage:setAlpha( 1 )
			f58_local1( f58_arg0.damage )
			local f58_local2 = function ( f61_arg0 )
				f58_arg0.death:beginAnimation( 750 )
				f58_arg0.death:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.death:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.death:completeAnimation()
			f58_arg0.death:setLeftRight( 0, 1, -3, 3 )
			f58_arg0.death:setTopBottom( 0, 1, -3, 3 )
			f58_arg0.death:setAlpha( 0 )
			f58_local2( f58_arg0.death )
		end
	},
	Stage3 = {
		DefaultClip = function ( f62_arg0, f62_arg1 )
			f62_arg0:__resetProperties()
			f62_arg0:setupElementClipCounter( 2 )
			local f62_local0 = function ( f63_arg0 )
				local f63_local0 = function ( f64_arg0 )
					f64_arg0:beginAnimation( 100 )
					f64_arg0:setRGB( 1, 1, 1 )
					f64_arg0:registerEventHandler( "transition_complete_keyframe", f62_arg0.clipFinished )
				end
				
				f62_arg0.damage:beginAnimation( 100 )
				f62_arg0.damage:registerEventHandler( "interrupted_keyframe", f62_arg0.clipInterrupted )
				f62_arg0.damage:registerEventHandler( "transition_complete_keyframe", f63_local0 )
			end
			
			f62_arg0.damage:completeAnimation()
			f62_arg0.damage:setLeftRight( 0, 1, -4, 4 )
			f62_arg0.damage:setTopBottom( 0, 1, -4, 4 )
			f62_arg0.damage:setRGB( 0.84, 0.99, 1 )
			f62_local0( f62_arg0.damage )
			f62_arg0.death:completeAnimation()
			f62_arg0.death:setLeftRight( 0, 1, -4, 4 )
			f62_arg0.death:setTopBottom( 0, 1, -4, 4 )
			f62_arg0.death:setAlpha( 0 )
			f62_arg0.clipFinished( f62_arg0.death )
		end,
		DefaultState = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 3 )
			local f65_local0 = function ( f66_arg0 )
				f65_arg0.perkFeedback:beginAnimation( 750 )
				f65_arg0.perkFeedback:setAlpha( 0 )
				f65_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
			end
			
			f65_arg0.perkFeedback:completeAnimation()
			f65_arg0.perkFeedback:setAlpha( 1 )
			f65_local0( f65_arg0.perkFeedback )
			local f65_local1 = function ( f67_arg0 )
				f65_arg0.damage:beginAnimation( 750 )
				f65_arg0.damage:setAlpha( 0 )
				f65_arg0.damage:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.damage:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
			end
			
			f65_arg0.damage:completeAnimation()
			f65_arg0.damage:setLeftRight( 0, 1, -4, 4 )
			f65_arg0.damage:setTopBottom( 0, 1, -4, 4 )
			f65_arg0.damage:setAlpha( 1 )
			f65_local1( f65_arg0.damage )
			local f65_local2 = function ( f68_arg0 )
				f65_arg0.death:beginAnimation( 750 )
				f65_arg0.death:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.death:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
			end
			
			f65_arg0.death:completeAnimation()
			f65_arg0.death:setLeftRight( 0, 1, -4, 4 )
			f65_arg0.death:setTopBottom( 0, 1, -4, 4 )
			f65_arg0.death:setAlpha( 0 )
			f65_local2( f65_arg0.death )
		end
	},
	Stage4 = {
		DefaultClip = function ( f69_arg0, f69_arg1 )
			f69_arg0:__resetProperties()
			f69_arg0:setupElementClipCounter( 2 )
			local f69_local0 = function ( f70_arg0 )
				local f70_local0 = function ( f71_arg0 )
					f71_arg0:beginAnimation( 100 )
					f71_arg0:setRGB( 1, 1, 1 )
					f71_arg0:registerEventHandler( "transition_complete_keyframe", f69_arg0.clipFinished )
				end
				
				f69_arg0.damage:beginAnimation( 100 )
				f69_arg0.damage:registerEventHandler( "interrupted_keyframe", f69_arg0.clipInterrupted )
				f69_arg0.damage:registerEventHandler( "transition_complete_keyframe", f70_local0 )
			end
			
			f69_arg0.damage:completeAnimation()
			f69_arg0.damage:setLeftRight( 0, 1, -6, 6 )
			f69_arg0.damage:setTopBottom( 0, 1, -6, 6 )
			f69_arg0.damage:setRGB( 0.84, 0.99, 1 )
			f69_local0( f69_arg0.damage )
			f69_arg0.death:completeAnimation()
			f69_arg0.death:setLeftRight( 0, 1, -6, 6 )
			f69_arg0.death:setTopBottom( 0, 1, -6, 6 )
			f69_arg0.death:setAlpha( 0 )
			f69_arg0.clipFinished( f69_arg0.death )
		end,
		DefaultState = function ( f72_arg0, f72_arg1 )
			f72_arg0:__resetProperties()
			f72_arg0:setupElementClipCounter( 3 )
			local f72_local0 = function ( f73_arg0 )
				f72_arg0.perkFeedback:beginAnimation( 760 )
				f72_arg0.perkFeedback:setAlpha( 0 )
				f72_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f72_arg0.clipInterrupted )
				f72_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f72_arg0.clipFinished )
			end
			
			f72_arg0.perkFeedback:completeAnimation()
			f72_arg0.perkFeedback:setAlpha( 1 )
			f72_local0( f72_arg0.perkFeedback )
			local f72_local1 = function ( f74_arg0 )
				f72_arg0.damage:beginAnimation( 760 )
				f72_arg0.damage:setAlpha( 0 )
				f72_arg0.damage:registerEventHandler( "interrupted_keyframe", f72_arg0.clipInterrupted )
				f72_arg0.damage:registerEventHandler( "transition_complete_keyframe", f72_arg0.clipFinished )
			end
			
			f72_arg0.damage:completeAnimation()
			f72_arg0.damage:setLeftRight( 0, 1, -6, 6 )
			f72_arg0.damage:setTopBottom( 0, 1, -6, 6 )
			f72_arg0.damage:setAlpha( 1 )
			f72_local1( f72_arg0.damage )
			local f72_local2 = function ( f75_arg0 )
				f72_arg0.death:beginAnimation( 760 )
				f72_arg0.death:registerEventHandler( "interrupted_keyframe", f72_arg0.clipInterrupted )
				f72_arg0.death:registerEventHandler( "transition_complete_keyframe", f72_arg0.clipFinished )
			end
			
			f72_arg0.death:completeAnimation()
			f72_arg0.death:setLeftRight( 0, 1, -6, 6 )
			f72_arg0.death:setTopBottom( 0, 1, -6, 6 )
			f72_arg0.death:setAlpha( 0 )
			f72_local2( f72_arg0.death )
		end
	},
	Downed = {
		DefaultClip = function ( f76_arg0, f76_arg1 )
			f76_arg0:__resetProperties()
			f76_arg0:setupElementClipCounter( 3 )
			f76_arg0.damage:completeAnimation()
			f76_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f76_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f76_arg0.damage:setAlpha( 0 )
			f76_arg0.clipFinished( f76_arg0.damage )
			local f76_local0 = function ( f77_arg0 )
				local f77_local0 = function ( f78_arg0 )
					f78_arg0:beginAnimation( 400 )
					f78_arg0:registerEventHandler( "transition_complete_keyframe", f76_arg0.clipFinished )
				end
				
				f76_arg0.death:beginAnimation( 200 )
				f76_arg0.death:setScale( 1, 1 )
				f76_arg0.death:registerEventHandler( "interrupted_keyframe", f76_arg0.clipInterrupted )
				f76_arg0.death:registerEventHandler( "transition_complete_keyframe", f77_local0 )
			end
			
			f76_arg0.death:completeAnimation()
			f76_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f76_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f76_arg0.death:setScale( 1.6, 1.6 )
			f76_local0( f76_arg0.death )
			local f76_local1 = function ( f79_arg0 )
				local f79_local0 = function ( f80_arg0 )
					local f80_local0 = function ( f81_arg0 )
						f81_arg0:beginAnimation( 300 )
						f81_arg0:registerEventHandler( "transition_complete_keyframe", f76_arg0.clipFinished )
					end
					
					f80_arg0:beginAnimation( 100 )
					f80_arg0:setTopBottom( 0.5, 0.5, 27, 37 )
					f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
				end
				
				f76_arg0.DownArrow:beginAnimation( 200 )
				f76_arg0.DownArrow:setTopBottom( 0.5, 0.5, 19.67, 29.67 )
				f76_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f76_arg0.clipInterrupted )
				f76_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f79_local0 )
			end
			
			f76_arg0.DownArrow:completeAnimation()
			f76_arg0.DownArrow:setTopBottom( 0.5, 0.5, 5, 15 )
			f76_arg0.DownArrow:setAlpha( 1 )
			f76_local1( f76_arg0.DownArrow )
		end,
		DefaultState = function ( f82_arg0, f82_arg1 )
			f82_arg0:__resetProperties()
			f82_arg0:setupElementClipCounter( 4 )
			local f82_local0 = function ( f83_arg0 )
				f82_arg0.perkFeedback:beginAnimation( 200 )
				f82_arg0.perkFeedback:setAlpha( 0 )
				f82_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f82_arg0.clipInterrupted )
				f82_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f82_arg0.clipFinished )
			end
			
			f82_arg0.perkFeedback:completeAnimation()
			f82_arg0.perkFeedback:setAlpha( 1 )
			f82_local0( f82_arg0.perkFeedback )
			local f82_local1 = function ( f84_arg0 )
				f82_arg0.damage:beginAnimation( 200 )
				f82_arg0.damage:registerEventHandler( "interrupted_keyframe", f82_arg0.clipInterrupted )
				f82_arg0.damage:registerEventHandler( "transition_complete_keyframe", f82_arg0.clipFinished )
			end
			
			f82_arg0.damage:completeAnimation()
			f82_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f82_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f82_arg0.damage:setAlpha( 0 )
			f82_local1( f82_arg0.damage )
			local f82_local2 = function ( f85_arg0 )
				f82_arg0.death:beginAnimation( 120 )
				f82_arg0.death:setAlpha( 0 )
				f82_arg0.death:registerEventHandler( "interrupted_keyframe", f82_arg0.clipInterrupted )
				f82_arg0.death:registerEventHandler( "transition_complete_keyframe", f82_arg0.clipFinished )
			end
			
			f82_arg0.death:completeAnimation()
			f82_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f82_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f82_arg0.death:setAlpha( 1 )
			f82_local2( f82_arg0.death )
			local f82_local3 = function ( f86_arg0 )
				f82_arg0.DownArrow:beginAnimation( 200 )
				f82_arg0.DownArrow:setAlpha( 0 )
				f82_arg0.DownArrow:registerEventHandler( "interrupted_keyframe", f82_arg0.clipInterrupted )
				f82_arg0.DownArrow:registerEventHandler( "transition_complete_keyframe", f82_arg0.clipFinished )
			end
			
			f82_arg0.DownArrow:completeAnimation()
			f82_arg0.DownArrow:setTopBottom( 0.5, 0.5, 27, 37 )
			f82_arg0.DownArrow:setAlpha( 1 )
			f82_local3( f82_arg0.DownArrow )
		end
	},
	Death = {
		DefaultClip = function ( f87_arg0, f87_arg1 )
			f87_arg0:__resetProperties()
			f87_arg0:setupElementClipCounter( 2 )
			f87_arg0.damage:completeAnimation()
			f87_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f87_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f87_arg0.damage:setAlpha( 0 )
			f87_arg0.clipFinished( f87_arg0.damage )
			local f87_local0 = function ( f88_arg0 )
				local f88_local0 = function ( f89_arg0 )
					f89_arg0:beginAnimation( 400 )
					f89_arg0:registerEventHandler( "transition_complete_keyframe", f87_arg0.clipFinished )
				end
				
				f87_arg0.death:beginAnimation( 200, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f87_arg0.death:setScale( 1, 1 )
				f87_arg0.death:registerEventHandler( "interrupted_keyframe", f87_arg0.clipInterrupted )
				f87_arg0.death:registerEventHandler( "transition_complete_keyframe", f88_local0 )
			end
			
			f87_arg0.death:completeAnimation()
			f87_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f87_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f87_arg0.death:setScale( 1.6, 1.6 )
			f87_local0( f87_arg0.death )
		end,
		DefaultState = function ( f90_arg0, f90_arg1 )
			f90_arg0:__resetProperties()
			f90_arg0:setupElementClipCounter( 3 )
			local f90_local0 = function ( f91_arg0 )
				f90_arg0.perkFeedback:beginAnimation( 200 )
				f90_arg0.perkFeedback:setAlpha( 0 )
				f90_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
			end
			
			f90_arg0.perkFeedback:completeAnimation()
			f90_arg0.perkFeedback:setAlpha( 1 )
			f90_local0( f90_arg0.perkFeedback )
			local f90_local1 = function ( f92_arg0 )
				f90_arg0.damage:beginAnimation( 200 )
				f90_arg0.damage:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.damage:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
			end
			
			f90_arg0.damage:completeAnimation()
			f90_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f90_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f90_arg0.damage:setAlpha( 0 )
			f90_local1( f90_arg0.damage )
			local f90_local2 = function ( f93_arg0 )
				f90_arg0.death:beginAnimation( 120 )
				f90_arg0.death:setAlpha( 0 )
				f90_arg0.death:registerEventHandler( "interrupted_keyframe", f90_arg0.clipInterrupted )
				f90_arg0.death:registerEventHandler( "transition_complete_keyframe", f90_arg0.clipFinished )
			end
			
			f90_arg0.death:completeAnimation()
			f90_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f90_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f90_arg0.death:setAlpha( 1 )
			f90_local2( f90_arg0.death )
		end
	},
	Stage5 = {
		DefaultClip = function ( f94_arg0, f94_arg1 )
			f94_arg0:__resetProperties()
			f94_arg0:setupElementClipCounter( 2 )
			local f94_local0 = function ( f95_arg0 )
				local f95_local0 = function ( f96_arg0 )
					f96_arg0:beginAnimation( 100 )
					f96_arg0:setRGB( 1, 1, 1 )
					f96_arg0:registerEventHandler( "transition_complete_keyframe", f94_arg0.clipFinished )
				end
				
				f94_arg0.damage:beginAnimation( 100 )
				f94_arg0.damage:registerEventHandler( "interrupted_keyframe", f94_arg0.clipInterrupted )
				f94_arg0.damage:registerEventHandler( "transition_complete_keyframe", f95_local0 )
			end
			
			f94_arg0.damage:completeAnimation()
			f94_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f94_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f94_arg0.damage:setRGB( 0.84, 0.99, 1 )
			f94_local0( f94_arg0.damage )
			f94_arg0.death:completeAnimation()
			f94_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f94_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f94_arg0.death:setAlpha( 0 )
			f94_arg0.clipFinished( f94_arg0.death )
		end,
		DefaultState = function ( f97_arg0, f97_arg1 )
			f97_arg0:__resetProperties()
			f97_arg0:setupElementClipCounter( 3 )
			local f97_local0 = function ( f98_arg0 )
				f97_arg0.perkFeedback:beginAnimation( 750 )
				f97_arg0.perkFeedback:setAlpha( 0 )
				f97_arg0.perkFeedback:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.perkFeedback:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
			end
			
			f97_arg0.perkFeedback:completeAnimation()
			f97_arg0.perkFeedback:setAlpha( 1 )
			f97_local0( f97_arg0.perkFeedback )
			local f97_local1 = function ( f99_arg0 )
				f97_arg0.damage:beginAnimation( 750 )
				f97_arg0.damage:setAlpha( 0 )
				f97_arg0.damage:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.damage:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
			end
			
			f97_arg0.damage:completeAnimation()
			f97_arg0.damage:setLeftRight( 0, 1, -8, 8 )
			f97_arg0.damage:setTopBottom( 0, 1, -8, 8 )
			f97_arg0.damage:setAlpha( 1 )
			f97_local1( f97_arg0.damage )
			local f97_local2 = function ( f100_arg0 )
				f97_arg0.death:beginAnimation( 750 )
				f97_arg0.death:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.death:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
			end
			
			f97_arg0.death:completeAnimation()
			f97_arg0.death:setLeftRight( 0, 1, -8, 8 )
			f97_arg0.death:setTopBottom( 0, 1, -8, 8 )
			f97_arg0.death:setAlpha( 0 )
			f97_local2( f97_arg0.death )
		end
	}
}
CoD.MPDamageFeedback.__onClose = function ( f101_arg0 )
	f101_arg0.perkFeedback:close()
	f101_arg0.MPDamageFeedbackFriendlyIndicator:close()
	f101_arg0.MPDamageFeedbackPredictedIndicator:close()
end

