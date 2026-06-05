CoD.MPDamageFeedback_PredictedIndicator = InheritFrom( LUI.UIElement )
CoD.MPDamageFeedback_PredictedIndicator.__defaultWidth = 60
CoD.MPDamageFeedback_PredictedIndicator.__defaultHeight = 60
CoD.MPDamageFeedback_PredictedIndicator.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPDamageFeedback_PredictedIndicator )
	self.id = "MPDamageFeedback_PredictedIndicator"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Indicator = LUI.UIImage.new( 0.45, 0.55, 0, 0, 0.45, 0.55, 0, 0 )
	Indicator:setRGB( ColorSet.PlayerGreen.r, ColorSet.PlayerGreen.g, ColorSet.PlayerGreen.b )
	Indicator:setAlpha( 0 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self:mergeStateConditions( {
		{
			stateName = "Predicted",
			condition = function ( menu, element, event )
				return DamageFeedbackFlagSet( element, Enum.DamageFeedbackFlags[0xE0574E9510E3672] )
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

CoD.MPDamageFeedback_PredictedIndicator.__resetProperties = function ( f4_arg0 )
	f4_arg0.Indicator:completeAnimation()
	f4_arg0.Indicator:setAlpha( 0 )
end

CoD.MPDamageFeedback_PredictedIndicator.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 0 )
		end
	},
	Predicted = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.Indicator:completeAnimation()
			f6_arg0.Indicator:setAlpha( 1 )
			f6_arg0.clipFinished( f6_arg0.Indicator )
		end
	}
}
