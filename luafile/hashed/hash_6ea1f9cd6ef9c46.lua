require( "x64:aebff75d2008873" )
require( "x64:38477061097d02f" )

CoD.ZmAmmo_BGBCarouselItemInternalFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBCarouselItemInternalFactory.__defaultWidth = 30
CoD.ZmAmmo_BGBCarouselItemInternalFactory.__defaultHeight = 30
CoD.ZmAmmo_BGBCarouselItemInternalFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_BGBCarouselItemInternalFactory )
	self.id = "ZmAmmo_BGBCarouselItemInternalFactory"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local icon = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	icon:setYRot( 360 )
	icon:setScale( 0.85, 0.85 )
	icon:linkToElementModel( self, "gum_idx", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			icon:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f2_local0 ) ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local clockOverlay = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	clockOverlay:setRGB( 0.83, 0.83, 0.83 )
	clockOverlay:setAlpha( 0 )
	clockOverlay:setScale( 0.79, 0.79 )
	clockOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	clockOverlay:setShaderVector( 0, 0, 1, 0, 0 )
	clockOverlay:setShaderVector( 1, 0, 0, 0, 0 )
	clockOverlay:setShaderVector( 3, 0, 0, 0, 0 )
	clockOverlay:setShaderVector( 4, 0, 0, 0, 0 )
	clockOverlay:linkToElementModel( self, "gum_idx", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			clockOverlay:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f3_local0 ) ) )
		end
	end )
	clockOverlay:linkToElementModel( self, "cooldown_perc", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			clockOverlay:setShaderVector( 2, CoD.BGBUtility.CooldownToWideDelta( CoD.GetVectorComponentFromString( f4_local0, 1 ), CoD.GetVectorComponentFromString( f4_local0, 2 ), CoD.GetVectorComponentFromString( f4_local0, 3 ), CoD.GetVectorComponentFromString( f4_local0, 4 ) ) )
		end
	end )
	self:addElement( clockOverlay )
	self.clockOverlay = clockOverlay
	
	local RingTimer = CoD.ZmAmmo_BGBRingTimerFactory.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( RingTimer )
	self.RingTimer = RingTimer
	
	local Cross = LUI.UIImage.new( -0.03, 1.13, -2, -2, -0.03, 1.13, -2, -2 )
	Cross:setAlpha( 0 )
	Cross:setImage( RegisterImage( "uie_cross_abilities" ) )
	self:addElement( Cross )
	self.Cross = Cross
	
	local ZMConsumableItemCountInGame = CoD.ZMConsumableItemCountInGame.new( f1_arg0, f1_arg1, 0.6, 1.07, 0, 0, 0.6, 1.07, 0, 0 )
	ZMConsumableItemCountInGame:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.BGBUtility.IsBGBConsumableInGame( menu, element )
			end
		},
		{
			stateName = "Spectator",
			condition = function ( menu, element, event )
				local f6_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] )
				if not f6_local0 then
					f6_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] )
					if not f6_local0 then
						f6_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] )
					end
				end
				return f6_local0
			end
		}
	} )
	ZMConsumableItemCountInGame:linkToElementModel( ZMConsumableItemCountInGame, "gum_idx", true, function ( model )
		f1_arg0:updateElementState( ZMConsumableItemCountInGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "gum_idx"
		} )
	end )
	local f1_local6 = ZMConsumableItemCountInGame
	local f1_local7 = ZMConsumableItemCountInGame.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f8_arg0 )
		f1_arg0:updateElementState( ZMConsumableItemCountInGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local6 = ZMConsumableItemCountInGame
	f1_local7 = ZMConsumableItemCountInGame.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]], function ( f9_arg0 )
		f1_arg0:updateElementState( ZMConsumableItemCountInGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]
		} )
	end, false )
	f1_local6 = ZMConsumableItemCountInGame
	f1_local7 = ZMConsumableItemCountInGame.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]], function ( f10_arg0 )
		f1_arg0:updateElementState( ZMConsumableItemCountInGame, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]
		} )
	end, false )
	ZMConsumableItemCountInGame:linkToElementModel( self, nil, false, function ( model )
		ZMConsumableItemCountInGame:setModel( model, f1_arg1 )
	end )
	ZMConsumableItemCountInGame:linkToElementModel( self, "count", true, function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			ZMConsumableItemCountInGame.Count:setText( CoD.BGBUtility.LimitToRangeWithPlus( 0, 9, f12_local0 ) )
		end
	end )
	self:addElement( ZMConsumableItemCountInGame )
	self.ZMConsumableItemCountInGame = ZMConsumableItemCountInGame
	
	self:mergeStateConditions( {
		{
			stateName = "Available_Unavailable",
			condition = function ( menu, element, event )
				return CoD.BGBUtility.IsBGBDisabled( f1_arg1, self )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.BGBUtility.BGBCarouselStates.ACTIVE )
			end
		},
		{
			stateName = "CoolingDown_LockedDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.BGBUtility.BGBCarouselStates.COOLING_DOWN ) and CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "lockdown", 1 )
			end
		},
		{
			stateName = "CoolingDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.BGBUtility.BGBCarouselStates.COOLING_DOWN )
			end
		},
		{
			stateName = "GlobalCooldown_LockedDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "lockdown", 1 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueLessThan( f1_arg1, "BGBCarousel", "global_cooldown", 1 )
			end
		},
		{
			stateName = "GlobalCooldown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueLessThan( f1_arg1, "BGBCarousel", "global_cooldown", 1 )
			end
		},
		{
			stateName = "Available_LockedDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "lockdown", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "unavailable", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "unavailable"
		} )
	end )
	self:appendEventHandler( "<selfModelValue>state", function ( f21_arg0, f21_arg1 )
		f21_arg1.menu = f21_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f21_arg1 )
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
	self:linkToElementModel( self, "lockdown", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "lockdown"
		} )
	end )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = DataSources.BGBCarousel.getModel( f1_arg1 )
	f1_local7( f1_local6, f1_local8.global_cooldown, function ( f24_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "global_cooldown"
		} )
	end, false )
	self:linkToElementModel( self, "gum_idx", true, function ( model )
		if CoD.BGBUtility.IsBGBConsumableInGame( f1_arg0, self ) then
			CoD.BGBUtility.SetupBGBConsumableCounts( f1_arg1, self, f1_arg0 )
		end
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "scriptNotify", function ( model )
		local f26_local0 = self
		if CoD.ModelUtility.IsParamModelEqualToHashString( model, "zombie_bgb_used" ) and not IsSelfPropertyValue( self, "isKBMElixir", 1 ) then
			CoD.BGBUtility.UpdateBGBConsumableCounts( f1_arg1, model, self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBCarouselItemInternalFactory.__resetProperties = function ( f27_arg0 )
	f27_arg0.RingTimer:completeAnimation()
	f27_arg0.icon:completeAnimation()
	f27_arg0.Cross:completeAnimation()
	f27_arg0.clockOverlay:completeAnimation()
	f27_arg0.RingTimer:setAlpha( 1 )
	f27_arg0.icon:setRGB( 1, 1, 1 )
	f27_arg0.icon:setAlpha( 1 )
	f27_arg0.Cross:setAlpha( 0 )
	f27_arg0.clockOverlay:setAlpha( 0 )
end

CoD.ZmAmmo_BGBCarouselItemInternalFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 1 )
			f28_arg0.RingTimer:completeAnimation()
			f28_arg0.RingTimer:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.RingTimer )
		end
	},
	Available_Unavailable = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 3 )
			f29_arg0.icon:completeAnimation()
			f29_arg0.icon:setRGB( 0.33, 0.33, 0.33 )
			f29_arg0.icon:setAlpha( 0.75 )
			f29_arg0.clipFinished( f29_arg0.icon )
			f29_arg0.RingTimer:completeAnimation()
			f29_arg0.RingTimer:setAlpha( 0 )
			f29_arg0.clipFinished( f29_arg0.RingTimer )
			f29_arg0.Cross:completeAnimation()
			f29_arg0.Cross:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.Cross )
		end
	},
	Active = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 0 )
		end
	},
	CoolingDown_LockedDown = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 3 )
			f31_arg0.icon:completeAnimation()
			f31_arg0.icon:setRGB( 0.2, 0.2, 0.2 )
			f31_arg0.icon:setAlpha( 0.7 )
			f31_arg0.clipFinished( f31_arg0.icon )
			f31_arg0.clockOverlay:completeAnimation()
			f31_arg0.clockOverlay:setAlpha( 0.7 )
			f31_arg0.clipFinished( f31_arg0.clockOverlay )
			f31_arg0.RingTimer:completeAnimation()
			f31_arg0.RingTimer:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.RingTimer )
		end
	},
	CoolingDown = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 3 )
			f32_arg0.icon:completeAnimation()
			f32_arg0.icon:setRGB( 0.2, 0.2, 0.2 )
			f32_arg0.clipFinished( f32_arg0.icon )
			f32_arg0.clockOverlay:completeAnimation()
			f32_arg0.clockOverlay:setAlpha( 1 )
			f32_arg0.clipFinished( f32_arg0.clockOverlay )
			f32_arg0.RingTimer:completeAnimation()
			f32_arg0.RingTimer:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.RingTimer )
		end
	},
	GlobalCooldown_LockedDown = {
		DefaultClip = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 3 )
			f33_arg0.icon:completeAnimation()
			f33_arg0.icon:setRGB( 0.41, 0.41, 0.41 )
			f33_arg0.icon:setAlpha( 0.7 )
			f33_arg0.clipFinished( f33_arg0.icon )
			f33_arg0.clockOverlay:completeAnimation()
			f33_arg0.clockOverlay:setAlpha( 0 )
			f33_arg0.clipFinished( f33_arg0.clockOverlay )
			f33_arg0.RingTimer:completeAnimation()
			f33_arg0.RingTimer:setAlpha( 0 )
			f33_arg0.clipFinished( f33_arg0.RingTimer )
		end
	},
	GlobalCooldown = {
		DefaultClip = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 3 )
			f34_arg0.icon:completeAnimation()
			f34_arg0.icon:setRGB( 0.41, 0.41, 0.41 )
			f34_arg0.clipFinished( f34_arg0.icon )
			f34_arg0.clockOverlay:completeAnimation()
			f34_arg0.clockOverlay:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.clockOverlay )
			f34_arg0.RingTimer:completeAnimation()
			f34_arg0.RingTimer:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.RingTimer )
		end
	},
	Available_LockedDown = {
		DefaultClip = function ( f35_arg0, f35_arg1 )
			f35_arg0:__resetProperties()
			f35_arg0:setupElementClipCounter( 2 )
			f35_arg0.icon:completeAnimation()
			f35_arg0.icon:setRGB( 0.33, 0.33, 0.33 )
			f35_arg0.icon:setAlpha( 0.75 )
			f35_arg0.clipFinished( f35_arg0.icon )
			f35_arg0.RingTimer:completeAnimation()
			f35_arg0.RingTimer:setAlpha( 0 )
			f35_arg0.clipFinished( f35_arg0.RingTimer )
		end
	}
}
CoD.ZmAmmo_BGBCarouselItemInternalFactory.__onClose = function ( f36_arg0 )
	f36_arg0.icon:close()
	f36_arg0.clockOverlay:close()
	f36_arg0.RingTimer:close()
	f36_arg0.ZMConsumableItemCountInGame:close()
end

