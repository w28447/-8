CoD.ZMPerkVaporPhDSliderEffect = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporPhDSliderEffect.__defaultWidth = 50
CoD.ZMPerkVaporPhDSliderEffect.__defaultHeight = 50
CoD.ZMPerkVaporPhDSliderEffect.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporPhDSliderEffect )
	self.id = "ZMPerkVaporPhDSliderEffect"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PhDSliderEffect = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	PhDSliderEffect:setAlpha( 0 )
	PhDSliderEffect:setMaterial( LUI.UIImage.GetCachedMaterial( 0x1CC85D0A86303B0 ) )
	PhDSliderEffect:setShaderVector( 0, 3, 0, 0, 0 )
	PhDSliderEffect:linkToElementModel( self, "itemIndex", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			PhDSliderEffect:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x9AF82A21BAD026D], f2_local0 ) ) )
		end
	end )
	self:addElement( PhDSliderEffect )
	self.PhDSliderEffect = PhDSliderEffect
	
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 ) and CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_slider" )
			end
		}
	} )
	self:linkToElementModel( self, "specialEffectActive", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "specialEffectActive"
		} )
	end )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporPhDSliderEffect.__resetProperties = function ( f6_arg0 )
	f6_arg0.PhDSliderEffect:completeAnimation()
	f6_arg0.PhDSliderEffect:setAlpha( 0 )
end

CoD.ZMPerkVaporPhDSliderEffect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 0 )
		end
	},
	Ready = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 310 )
					f10_arg0:setAlpha( 0 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.PhDSliderEffect:beginAnimation( 300 )
				f8_arg0.PhDSliderEffect:setAlpha( 1 )
				f8_arg0.PhDSliderEffect:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.PhDSliderEffect:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.PhDSliderEffect:completeAnimation()
			f8_arg0.PhDSliderEffect:setAlpha( 0 )
			f8_local0( f8_arg0.PhDSliderEffect )
			f8_arg0.nextClip = "DefaultClip"
		end
	}
}
CoD.ZMPerkVaporPhDSliderEffect.__onClose = function ( f11_arg0 )
	f11_arg0.PhDSliderEffect:close()
end

