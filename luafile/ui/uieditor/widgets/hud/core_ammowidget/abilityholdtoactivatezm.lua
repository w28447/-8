CoD.AbilityHoldToActivateZM = InheritFrom( LUI.UIElement )
CoD.AbilityHoldToActivateZM.__defaultWidth = 200
CoD.AbilityHoldToActivateZM.__defaultHeight = 49
CoD.AbilityHoldToActivateZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AbilityHoldToActivateZM )
	self.id = "AbilityHoldToActivateZM"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Arrow = LUI.UIImage.new( 0.5, 0.5, -4, 4, 0, 0, 38, 46 )
	Arrow:setRGB( 0.06, 0.06, 0.06 )
	Arrow:setAlpha( 0.94 )
	Arrow:setZRot( -90 )
	Arrow:setImage( RegisterImage( "uie_ui_hud_common_triangle" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local ProgressBacking = LUI.UIImage.new( 0.5, 0.5, -33.5, 33.5, 0, 0, 30.5, 39.5 )
	ProgressBacking:setRGB( 0.06, 0.06, 0.06 )
	ProgressBacking:setAlpha( 0.94 )
	self:addElement( ProgressBacking )
	self.ProgressBacking = ProgressBacking
	
	local HeroAbilityHoldString = LUI.UIText.new( 0, 0, 0, 200, 0, 0, 11, 29 )
	HeroAbilityHoldString:setText( CoD.BaseUtility.AlreadyLocalized( "HOLD" ) )
	HeroAbilityHoldString:setTTF( "ttmussels_regular" )
	HeroAbilityHoldString:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	HeroAbilityHoldString:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( HeroAbilityHoldString )
	self.HeroAbilityHoldString = HeroAbilityHoldString
	
	local empty = LUI.UIImage.new( 0, 0, 69, 131, 0, 0, 33.5, 36.5 )
	empty:setRGB( ColorSet.T8__SLATE.r, ColorSet.T8__SLATE.g, ColorSet.T8__SLATE.b )
	empty:setAlpha( 0.2 )
	self:addElement( empty )
	self.empty = empty
	
	local ProgressFillManual = LUI.UIImage.new( 0.5, 0.5, -31.5, 31.5, 0, 0, 32.5, 37.5 )
	ProgressFillManual:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
	ProgressFillManual:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ProgressFillManual:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressFillManual:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressFillManual:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressFillManual:setShaderVector( 4, 0, 0, 0, 0 )
	ProgressFillManual:subscribeToGlobalModel( f1_arg1, "HUDItems", "abilityDelayProgress", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ProgressFillManual:setShaderVector( 0, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
		end
	end )
	self:addElement( ProgressFillManual )
	self.ProgressFillManual = ProgressFillManual
	
	self:mergeStateConditions( {
		{
			stateName = "NonHoldToActivate",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "hudItems.abilityHoldToActivate", 0 )
			end
		},
		{
			stateName = "VisibleCharged",
			condition = function ( menu, element, event )
				local f4_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "powerRatio", 1 )
				if f4_local0 then
					f4_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "hudItems.abilityHoldToActivate", 1 )
					if f4_local0 then
						f4_local0 = CoD.HUDUtility.GadgetHasHoldPrompt( element, f1_arg1 )
						if f4_local0 then
							if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) then
								f4_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] )
							else
								f4_local0 = false
							end
						end
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "VisibleInUse",
			condition = function ( menu, element, event )
				local f5_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "hudItems.abilityHoldToActivate", 2 )
				if f5_local0 then
					if not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "powerRatio", 1 ) then
						f5_local0 = CoD.HUDUtility.GadgetHasHoldPrompt( element, f1_arg1 )
						if f5_local0 then
							if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) then
								f5_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] )
							else
								f5_local0 = false
							end
						else
							return f5_local0
						end
					end
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["hudItems.abilityHoldToActivate"], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "hudItems.abilityHoldToActivate"
		} )
	end, false )
	self:linkToElementModel( self, "powerRatio", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "powerRatio"
		} )
	end )
	self:linkToElementModel( self, "id", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "id"
		} )
	end )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AbilityHoldToActivateZM.__resetProperties = function ( f11_arg0 )
	f11_arg0.ProgressFillManual:completeAnimation()
	f11_arg0.ProgressBacking:completeAnimation()
	f11_arg0.HeroAbilityHoldString:completeAnimation()
	f11_arg0.Arrow:completeAnimation()
	f11_arg0.empty:completeAnimation()
	f11_arg0.ProgressFillManual:setAlpha( 1 )
	f11_arg0.ProgressBacking:setAlpha( 0.94 )
	f11_arg0.HeroAbilityHoldString:setAlpha( 1 )
	f11_arg0.HeroAbilityHoldString:setText( CoD.BaseUtility.AlreadyLocalized( "HOLD" ) )
	f11_arg0.Arrow:setAlpha( 0.94 )
	f11_arg0.empty:setAlpha( 0.2 )
end

CoD.AbilityHoldToActivateZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 5 )
			f12_arg0.Arrow:completeAnimation()
			f12_arg0.Arrow:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Arrow )
			f12_arg0.ProgressBacking:completeAnimation()
			f12_arg0.ProgressBacking:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.ProgressBacking )
			f12_arg0.HeroAbilityHoldString:completeAnimation()
			f12_arg0.HeroAbilityHoldString:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.HeroAbilityHoldString )
			f12_arg0.empty:completeAnimation()
			f12_arg0.empty:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.empty )
			f12_arg0.ProgressFillManual:completeAnimation()
			f12_arg0.ProgressFillManual:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.ProgressFillManual )
		end
	},
	NonHoldToActivate = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 5 )
			f13_arg0.Arrow:completeAnimation()
			f13_arg0.Arrow:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Arrow )
			f13_arg0.ProgressBacking:completeAnimation()
			f13_arg0.ProgressBacking:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.ProgressBacking )
			f13_arg0.HeroAbilityHoldString:completeAnimation()
			f13_arg0.HeroAbilityHoldString:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.HeroAbilityHoldString )
			f13_arg0.empty:completeAnimation()
			f13_arg0.empty:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.empty )
			f13_arg0.ProgressFillManual:completeAnimation()
			f13_arg0.ProgressFillManual:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.ProgressFillManual )
		end
	},
	VisibleCharged = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 0 )
		end
	},
	VisibleInUse = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.HeroAbilityHoldString:completeAnimation()
			f15_arg0.HeroAbilityHoldString:setText( CoD.BaseUtility.AlreadyLocalized( "DESTROY" ) )
			f15_arg0.clipFinished( f15_arg0.HeroAbilityHoldString )
		end
	}
}
CoD.AbilityHoldToActivateZM.__onClose = function ( f16_arg0 )
	f16_arg0.ProgressFillManual:close()
end

