CoD.MPDamageFeedback_PerkFeedback = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback_PerkFeedback.__defaultWidth = 96
CoD.MPDamageFeedback_PerkFeedback.__defaultHeight = 192
CoD.MPDamageFeedback_PerkFeedback.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPDamageFeedback_PerkFeedback )
	self.id = "MPDamageFeedback_PerkFeedback"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PerkFeedbackImage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	PerkFeedbackImage:setAlpha( 0 )
	PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_tac" ) )
	PerkFeedbackImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PerkFeedbackImage )
	self.PerkFeedbackImage = PerkFeedbackImage
	
	self:mergeStateConditions( {
		{
			stateName = "FlakJacket",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xCFB3D7EA4F69BC0] )
			end
		},
		{
			stateName = "Armor",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xE7D0193336912F1] )
			end
		},
		{
			stateName = "TacMask",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0x4A41481E493017F] )
			end
		},
		{
			stateName = "Resistance",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xCA09F684523702B] )
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
	
	local f1_local2 = self
	SetProperty( self, "ignoreCurrentStateCheck", true )
	return self
end

CoD.MPDamageFeedback_PerkFeedback.__resetProperties = function ( f7_arg0 )
	f7_arg0.PerkFeedbackImage:completeAnimation()
	f7_arg0.PerkFeedbackImage:setAlpha( 0 )
	f7_arg0.PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_tac" ) )
end

CoD.MPDamageFeedback_PerkFeedback.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end
	},
	FlakJacket = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.PerkFeedbackImage:completeAnimation()
			f9_arg0.PerkFeedbackImage:setAlpha( 1 )
			f9_arg0.PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_flak" ) )
			f9_arg0.clipFinished( f9_arg0.PerkFeedbackImage )
		end,
		DefaultState = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			local f10_local0 = function ( f11_arg0 )
				f10_arg0.PerkFeedbackImage:beginAnimation( 300 )
				f10_arg0.PerkFeedbackImage:setAlpha( 0 )
				f10_arg0.PerkFeedbackImage:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
				f10_arg0.PerkFeedbackImage:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
			end
			
			f10_arg0.PerkFeedbackImage:completeAnimation()
			f10_arg0.PerkFeedbackImage:setAlpha( 1 )
			f10_arg0.PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_flak" ) )
			f10_local0( f10_arg0.PerkFeedbackImage )
		end
	},
	Armor = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.PerkFeedbackImage:completeAnimation()
			f12_arg0.PerkFeedbackImage:setAlpha( 1 )
			f12_arg0.PerkFeedbackImage:setImage( RegisterImage( "ui_icon_hud_armor_feedback" ) )
			f12_arg0.clipFinished( f12_arg0.PerkFeedbackImage )
		end,
		DefaultState = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 1 )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.PerkFeedbackImage:beginAnimation( 300 )
				f13_arg0.PerkFeedbackImage:setAlpha( 0 )
				f13_arg0.PerkFeedbackImage:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.PerkFeedbackImage:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.PerkFeedbackImage:completeAnimation()
			f13_arg0.PerkFeedbackImage:setAlpha( 1 )
			f13_arg0.PerkFeedbackImage:setImage( RegisterImage( "ui_icon_hud_armor_feedback" ) )
			f13_local0( f13_arg0.PerkFeedbackImage )
		end
	},
	TacMask = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.PerkFeedbackImage:completeAnimation()
			f15_arg0.PerkFeedbackImage:setAlpha( 1 )
			f15_arg0.PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_tac" ) )
			f15_arg0.clipFinished( f15_arg0.PerkFeedbackImage )
		end,
		DefaultState = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			local f16_local0 = function ( f17_arg0 )
				f16_arg0.PerkFeedbackImage:beginAnimation( 300 )
				f16_arg0.PerkFeedbackImage:setAlpha( 0 )
				f16_arg0.PerkFeedbackImage:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.PerkFeedbackImage:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.PerkFeedbackImage:completeAnimation()
			f16_arg0.PerkFeedbackImage:setAlpha( 1 )
			f16_arg0.PerkFeedbackImage:setImage( RegisterImage( "uie_damage_feedback_tac" ) )
			f16_local0( f16_arg0.PerkFeedbackImage )
		end
	},
	Resistance = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.PerkFeedbackImage:completeAnimation()
			f18_arg0.PerkFeedbackImage:setAlpha( 1 )
			f18_arg0.PerkFeedbackImage:setImage( RegisterImage( 0x1C282F95B011231 ) )
			f18_arg0.clipFinished( f18_arg0.PerkFeedbackImage )
		end,
		DefaultState = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 1 )
			local f19_local0 = function ( f20_arg0 )
				f19_arg0.PerkFeedbackImage:beginAnimation( 300 )
				f19_arg0.PerkFeedbackImage:setAlpha( 0 )
				f19_arg0.PerkFeedbackImage:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.PerkFeedbackImage:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.PerkFeedbackImage:completeAnimation()
			f19_arg0.PerkFeedbackImage:setAlpha( 1 )
			f19_arg0.PerkFeedbackImage:setImage( RegisterImage( 0x1C282F95B011231 ) )
			f19_local0( f19_arg0.PerkFeedbackImage )
		end
	}
}
