CoD.ZMPerkVaporCooldownPulse = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporCooldownPulse.__defaultWidth = 50
CoD.ZMPerkVaporCooldownPulse.__defaultHeight = 50
CoD.ZMPerkVaporCooldownPulse.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporCooldownPulse )
	self.id = "ZMPerkVaporCooldownPulse"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local vaporImageActive = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	vaporImageActive:setRGB( 1, 0.95, 0.57 )
	vaporImageActive:setAlpha( 0.6 )
	vaporImageActive:setYRot( 360 )
	vaporImageActive:linkToElementModel( self, "itemIndex", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			vaporImageActive:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x9AF82A21BAD026D], f2_local0 ) ) )
		end
	end )
	self:addElement( vaporImageActive )
	self.vaporImageActive = vaporImageActive
	
	local vaporImageFull = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	vaporImageFull:setYRot( 360 )
	vaporImageFull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	vaporImageFull:setShaderVector( 0, 0, 1, 0, 0 )
	vaporImageFull:setShaderVector( 1, 0, 0, 0, 0 )
	vaporImageFull:setShaderVector( 3, 0, 0, 0, 0 )
	vaporImageFull:setShaderVector( 4, 0, 0, 0, 0 )
	vaporImageFull:linkToElementModel( self, "itemIndex", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			vaporImageFull:setImage( RegisterImage( GetItemImageFromIndex( Enum[0x6EB546760F890D2][0x9AF82A21BAD026D], f3_local0 ) ) )
		end
	end )
	vaporImageFull:linkToElementModel( self, "progress", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			vaporImageFull:setShaderVector( 2, SetVectorComponent( 2, 1, SubtractVectorComponentFrom( 1, 1, CoD.GetVectorComponentFromString( f4_local0, 1 ), CoD.GetVectorComponentFromString( f4_local0, 2 ), CoD.GetVectorComponentFromString( f4_local0, 3 ), CoD.GetVectorComponentFromString( f4_local0, 4 ) ) ) )
		end
	end )
	self:addElement( vaporImageFull )
	self.vaporImageFull = vaporImageFull
	
	local ElectricCherryEffect = LUI.UIImage.new( 0, 0, 0, 50, 0, 0, 0, 50 )
	ElectricCherryEffect:setAlpha( 0 )
	ElectricCherryEffect:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA372C0731E3E2F8 ) )
	ElectricCherryEffect:setShaderVector( 0, 100, 0, 0, 0 )
	self:addElement( ElectricCherryEffect )
	self.ElectricCherryEffect = ElectricCherryEffect
	
	local ElectricBorder = LUI.UIImage.new( 0, 0, -8, 57, 0, 0, -7.5, 57.5 )
	ElectricBorder:setImage( RegisterImage( "uie_ui_icon_perks_zm_electricburst_active" ) )
	ElectricBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	ElectricBorder:setShaderVector( 0, 1, 5, 0, 0 )
	ElectricBorder:setShaderVector( 1, 10, 0, 0, 0 )
	self:addElement( ElectricBorder )
	self.ElectricBorder = ElectricBorder
	
	self:mergeStateConditions( {
		{
			stateName = "ElectricCherry",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 ) and CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_electric_cherry" )
			end
		},
		{
			stateName = "Timer",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "timerActive", 1 )
			end
		},
		{
			stateName = "CoolingDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.COOLING_DOWN )
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

CoD.ZMPerkVaporCooldownPulse.__resetProperties = function ( f12_arg0 )
	f12_arg0.ElectricCherryEffect:completeAnimation()
	f12_arg0.vaporImageActive:completeAnimation()
	f12_arg0.ElectricBorder:completeAnimation()
	f12_arg0.ElectricCherryEffect:setAlpha( 0 )
	f12_arg0.vaporImageActive:setAlpha( 0.6 )
	f12_arg0.ElectricBorder:setAlpha( 1 )
end

CoD.ZMPerkVaporCooldownPulse.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 3 )
			f13_arg0.vaporImageActive:completeAnimation()
			f13_arg0.vaporImageActive:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.vaporImageActive )
			f13_arg0.ElectricCherryEffect:completeAnimation()
			f13_arg0.ElectricCherryEffect:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.ElectricCherryEffect )
			f13_arg0.ElectricBorder:completeAnimation()
			f13_arg0.ElectricBorder:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.ElectricBorder )
		end
	},
	ElectricCherry = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 3 )
			f14_arg0.vaporImageActive:completeAnimation()
			f14_arg0.vaporImageActive:setAlpha( 0.7 )
			f14_arg0.clipFinished( f14_arg0.vaporImageActive )
			f14_arg0.ElectricCherryEffect:completeAnimation()
			f14_arg0.ElectricCherryEffect:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.ElectricCherryEffect )
			f14_arg0.ElectricBorder:completeAnimation()
			f14_arg0.ElectricBorder:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.ElectricBorder )
		end
	},
	Timer = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 3 )
			f15_arg0.vaporImageActive:completeAnimation()
			f15_arg0.vaporImageActive:setAlpha( 0.7 )
			f15_arg0.clipFinished( f15_arg0.vaporImageActive )
			f15_arg0.ElectricCherryEffect:completeAnimation()
			f15_arg0.ElectricCherryEffect:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ElectricCherryEffect )
			f15_arg0.ElectricBorder:completeAnimation()
			f15_arg0.ElectricBorder:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ElectricBorder )
		end
	},
	CoolingDown = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 3 )
			f16_arg0.vaporImageActive:completeAnimation()
			f16_arg0.vaporImageActive:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.vaporImageActive )
			f16_arg0.ElectricCherryEffect:completeAnimation()
			f16_arg0.ElectricCherryEffect:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.ElectricCherryEffect )
			f16_arg0.ElectricBorder:completeAnimation()
			f16_arg0.ElectricBorder:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.ElectricBorder )
		end
	}
}
CoD.ZMPerkVaporCooldownPulse.__onClose = function ( f17_arg0 )
	f17_arg0.vaporImageActive:close()
	f17_arg0.vaporImageFull:close()
end

