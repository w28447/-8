require( "ui/uieditor/widgets/hud/zm_roundwidget/zmrnddigitwidget" )

CoD.ZmRndDigitsInt = InheritFrom( LUI.UIElement )
CoD.ZmRndDigitsInt.__defaultWidth = 159
CoD.ZmRndDigitsInt.__defaultHeight = 120
CoD.ZmRndDigitsInt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmRndDigitsInt )
	self.id = "ZmRndDigitsInt"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZmRndDigitWidget = CoD.ZmRndDigitWidget.new( f1_arg0, f1_arg1, 0, 0, -60, 24, 0, 0, 0, 120 )
	ZmRndDigitWidget:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsZombieRoundTensDigitEqualTo( element, f1_arg1, 0 )
			end
		}
	} )
	ZmRndDigitWidget:linkToElementModel( ZmRndDigitWidget, "roundsPlayed", true, function ( model )
		f1_arg0:updateElementState( ZmRndDigitWidget, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "roundsPlayed"
		} )
	end )
	ZmRndDigitWidget:linkToElementModel( self, nil, false, function ( model )
		ZmRndDigitWidget:setModel( model, f1_arg1 )
	end )
	ZmRndDigitWidget:linkToElementModel( self, "roundsPlayed", true, function ( model )
		local f14_local0 = ZmRndDigitWidget
		PlayClipOnElement( self, {
			elementName = "ZmRndDigitWidget",
			clipName = "DefaultClip"
		}, f1_arg1 )
	end )
	self:addElement( ZmRndDigitWidget )
	self.ZmRndDigitWidget = ZmRndDigitWidget
	
	local ZmRndDigitWidget0 = CoD.ZmRndDigitWidget.new( f1_arg0, f1_arg1, 0, 0, 37.5, 121.5, 0, 0, 0, 120 )
	ZmRndDigitWidget0:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsZombieRoundOnesDigitEqualTo( element, f1_arg1, 0 )
			end
		}
	} )
	ZmRndDigitWidget0:linkToElementModel( ZmRndDigitWidget0, "roundsPlayed", true, function ( model )
		f1_arg0:updateElementState( ZmRndDigitWidget0, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "roundsPlayed"
		} )
	end )
	ZmRndDigitWidget0:linkToElementModel( self, nil, false, function ( model )
		ZmRndDigitWidget0:setModel( model, f1_arg1 )
	end )
	self:addElement( ZmRndDigitWidget0 )
	self.ZmRndDigitWidget0 = ZmRndDigitWidget0
	
	local ZmRndDigitWidget1 = CoD.ZmRndDigitWidget.new( f1_arg0, f1_arg1, 0, 0, -60, 24, 0, 0, 0, 120 )
	ZmRndDigitWidget1:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsZombieRoundHundredsDigitEqualTo( element, f1_arg1, 0 )
			end
		}
	} )
	ZmRndDigitWidget1:linkToElementModel( ZmRndDigitWidget1, "roundsPlayed", true, function ( model )
		f1_arg0:updateElementState( ZmRndDigitWidget1, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "roundsPlayed"
		} )
	end )
	ZmRndDigitWidget1:linkToElementModel( self, nil, false, function ( model )
		ZmRndDigitWidget1:setModel( model, f1_arg1 )
	end )
	ZmRndDigitWidget1:linkToElementModel( self, "roundsPlayed", true, function ( model )
		local f39_local0 = ZmRndDigitWidget1
		PlayClipOnElement( self, {
			elementName = "ZmRndDigitWidget1",
			clipName = "DefaultClip"
		}, f1_arg1 )
	end )
	self:addElement( ZmRndDigitWidget1 )
	self.ZmRndDigitWidget1 = ZmRndDigitWidget1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmRndDigitsInt.__resetProperties = function ( f40_arg0 )
	f40_arg0.ZmRndDigitWidget:completeAnimation()
	f40_arg0.ZmRndDigitWidget1:completeAnimation()
	f40_arg0.ZmRndDigitWidget0:completeAnimation()
	f40_arg0.ZmRndDigitWidget:setLeftRight( 0, 0, -60, 24 )
	f40_arg0.ZmRndDigitWidget:setTopBottom( 0, 0, 0, 120 )
	f40_arg0.ZmRndDigitWidget:setAlpha( 1 )
	f40_arg0.ZmRndDigitWidget1:setLeftRight( 0, 0, -60, 24 )
	f40_arg0.ZmRndDigitWidget1:setTopBottom( 0, 0, 0, 120 )
	f40_arg0.ZmRndDigitWidget1:setAlpha( 1 )
	f40_arg0.ZmRndDigitWidget0:setLeftRight( 0, 0, 37.5, 121.5 )
	f40_arg0.ZmRndDigitWidget0:setTopBottom( 0, 0, 0, 120 )
end

CoD.ZmRndDigitsInt.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 2 )
			f41_arg0.ZmRndDigitWidget:completeAnimation()
			f41_arg0.ZmRndDigitWidget:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.ZmRndDigitWidget )
			f41_arg0.ZmRndDigitWidget1:completeAnimation()
			f41_arg0.ZmRndDigitWidget1:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.ZmRndDigitWidget1 )
		end
	},
	Triple = {
		DefaultClip = function ( f42_arg0, f42_arg1 )
			f42_arg0:__resetProperties()
			f42_arg0:setupElementClipCounter( 3 )
			f42_arg0.ZmRndDigitWidget:completeAnimation()
			f42_arg0.ZmRndDigitWidget:setLeftRight( 0, 0, 64, 148 )
			f42_arg0.ZmRndDigitWidget:setTopBottom( 0, 0, 0, 120 )
			f42_arg0.clipFinished( f42_arg0.ZmRndDigitWidget )
			f42_arg0.ZmRndDigitWidget0:completeAnimation()
			f42_arg0.ZmRndDigitWidget0:setLeftRight( 0, 0, 129, 213 )
			f42_arg0.ZmRndDigitWidget0:setTopBottom( 0, 0, 0, 120 )
			f42_arg0.clipFinished( f42_arg0.ZmRndDigitWidget0 )
			f42_arg0.ZmRndDigitWidget1:completeAnimation()
			f42_arg0.ZmRndDigitWidget1:setLeftRight( 0, 0, 0, 84 )
			f42_arg0.ZmRndDigitWidget1:setTopBottom( 0, 0, 0, 120 )
			f42_arg0.clipFinished( f42_arg0.ZmRndDigitWidget1 )
		end
	},
	Double = {
		DefaultClip = function ( f43_arg0, f43_arg1 )
			f43_arg0:__resetProperties()
			f43_arg0:setupElementClipCounter( 3 )
			f43_arg0.ZmRndDigitWidget:completeAnimation()
			f43_arg0.ZmRndDigitWidget:setLeftRight( 0, 0, -1, 83 )
			f43_arg0.clipFinished( f43_arg0.ZmRndDigitWidget )
			f43_arg0.ZmRndDigitWidget0:completeAnimation()
			f43_arg0.ZmRndDigitWidget0:setLeftRight( 0, 0, 62.5, 146.5 )
			f43_arg0.clipFinished( f43_arg0.ZmRndDigitWidget0 )
			f43_arg0.ZmRndDigitWidget1:completeAnimation()
			f43_arg0.ZmRndDigitWidget1:setAlpha( 0 )
			f43_arg0.clipFinished( f43_arg0.ZmRndDigitWidget1 )
		end
	}
}
CoD.ZmRndDigitsInt.__onClose = function ( f44_arg0 )
	f44_arg0.ZmRndDigitWidget:close()
	f44_arg0.ZmRndDigitWidget0:close()
	f44_arg0.ZmRndDigitWidget1:close()
end

