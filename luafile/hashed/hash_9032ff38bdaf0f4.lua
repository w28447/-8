require( "x64:9220087c645f831" )
require( "x64:edc0771252f0eb7" )

CoD.ZMPerkVaporIcon = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporIcon.__defaultWidth = 50
CoD.ZMPerkVaporIcon.__defaultHeight = 50
CoD.ZMPerkVaporIcon.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporIcon )
	self.id = "ZMPerkVaporIcon"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local vaporImageBacking = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	vaporImageBacking:setRGB( 0.45, 0.45, 0.45 )
	vaporImageBacking:setYRot( 360 )
	vaporImageBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	vaporImageBacking:setShaderVector( 0, 1, 0, 0, 0 )
	vaporImageBacking:linkToElementModel( self, "itemIndex", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			vaporImageBacking:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x9AF82A21BAD026D], f2_local0 ) ) )
		end
	end )
	self:addElement( vaporImageBacking )
	self.vaporImageBacking = vaporImageBacking
	
	local vaporImageFull = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	vaporImageFull:setYRot( 360 )
	vaporImageFull:linkToElementModel( self, "itemIndex", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			vaporImageFull:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x9AF82A21BAD026D], f3_local0 ) ) )
		end
	end )
	self:addElement( vaporImageFull )
	self.vaporImageFull = vaporImageFull
	
	local CooldownAndTimerEffects = CoD.ZMPerkVaporCooldownPulse.new( f1_arg0, f1_arg1, 0, 0, 0, 50, 0, 0, 0, 50 )
	CooldownAndTimerEffects:linkToElementModel( self, nil, false, function ( model )
		CooldownAndTimerEffects:setModel( model, f1_arg1 )
	end )
	self:addElement( CooldownAndTimerEffects )
	self.CooldownAndTimerEffects = CooldownAndTimerEffects
	
	local PhDSliderEffect = CoD.ZMPerkVaporPhDSliderEffect.new( f1_arg0, f1_arg1, 0, 0, 0, 50, 0, 0, 0, 50 )
	PhDSliderEffect:linkToElementModel( self, nil, false, function ( model )
		PhDSliderEffect:setModel( model, f1_arg1 )
	end )
	self:addElement( PhDSliderEffect )
	self.PhDSliderEffect = PhDSliderEffect
	
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "timerActive", 1 )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.DEFAULT )
			end
		},
		{
			stateName = "Consumed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.CONSUMED )
			end
		},
		{
			stateName = "CoolingDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.COOLING_DOWN )
			end
		}
	} )
	self:linkToElementModel( self, "timerActive", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "timerActive"
		} )
	end )
	self:linkToElementModel( self, "state", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporIcon.__resetProperties = function ( f12_arg0 )
	f12_arg0.vaporImageBacking:completeAnimation()
	f12_arg0.CooldownAndTimerEffects:completeAnimation()
	f12_arg0.vaporImageFull:completeAnimation()
	f12_arg0.vaporImageBacking:setAlpha( 1 )
	f12_arg0.CooldownAndTimerEffects:setAlpha( 1 )
	f12_arg0.vaporImageFull:setAlpha( 1 )
end

CoD.ZMPerkVaporIcon.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 3 )
			f13_arg0.vaporImageBacking:completeAnimation()
			f13_arg0.vaporImageBacking:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.vaporImageBacking )
			f13_arg0.vaporImageFull:completeAnimation()
			f13_arg0.vaporImageFull:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.vaporImageFull )
			f13_arg0.CooldownAndTimerEffects:completeAnimation()
			f13_arg0.CooldownAndTimerEffects:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.CooldownAndTimerEffects )
		end
	},
	Active = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 3 )
			f14_arg0.vaporImageBacking:completeAnimation()
			f14_arg0.vaporImageBacking:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.vaporImageBacking )
			f14_arg0.vaporImageFull:completeAnimation()
			f14_arg0.vaporImageFull:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.vaporImageFull )
			f14_arg0.CooldownAndTimerEffects:completeAnimation()
			f14_arg0.CooldownAndTimerEffects:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.CooldownAndTimerEffects )
		end
	},
	Available = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 2 )
			f15_arg0.vaporImageFull:completeAnimation()
			f15_arg0.vaporImageFull:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.vaporImageFull )
			f15_arg0.CooldownAndTimerEffects:completeAnimation()
			f15_arg0.CooldownAndTimerEffects:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.CooldownAndTimerEffects )
		end
	},
	Consumed = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			f16_arg0.vaporImageFull:completeAnimation()
			f16_arg0.vaporImageFull:setAlpha( 1 )
			f16_arg0.clipFinished( f16_arg0.vaporImageFull )
			f16_arg0.CooldownAndTimerEffects:completeAnimation()
			f16_arg0.CooldownAndTimerEffects:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.CooldownAndTimerEffects )
		end
	},
	CoolingDown = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 3 )
			f17_arg0.vaporImageBacking:completeAnimation()
			f17_arg0.vaporImageBacking:setAlpha( 1 )
			f17_arg0.clipFinished( f17_arg0.vaporImageBacking )
			f17_arg0.vaporImageFull:completeAnimation()
			f17_arg0.vaporImageFull:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.vaporImageFull )
			f17_arg0.CooldownAndTimerEffects:completeAnimation()
			f17_arg0.CooldownAndTimerEffects:setAlpha( 1 )
			f17_arg0.clipFinished( f17_arg0.CooldownAndTimerEffects )
		end
	}
}
CoD.ZMPerkVaporIcon.__onClose = function ( f18_arg0 )
	f18_arg0.vaporImageBacking:close()
	f18_arg0.vaporImageFull:close()
	f18_arg0.CooldownAndTimerEffects:close()
	f18_arg0.PhDSliderEffect:close()
end

