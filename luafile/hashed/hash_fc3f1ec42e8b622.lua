CoD.ZMPerkVaporDeadshotCountList = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporDeadshotCountList.__defaultWidth = 42
CoD.ZMPerkVaporDeadshotCountList.__defaultHeight = 44
CoD.ZMPerkVaporDeadshotCountList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporDeadshotCountList )
	self.id = "ZMPerkVaporDeadshotCountList"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DeadshotImage = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 1, 45 )
	DeadshotImage:setScale( 0.98, 0.98 )
	DeadshotImage:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot_active" ) )
	self:addElement( DeadshotImage )
	self.DeadshotImage = DeadshotImage
	
	local Image = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 28, 42 )
	Image:setRGB( 0.76, 0, 0 )
	Image:setScale( 0.95, 0.95 )
	Image:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA02C44161370F6D ) )
	Image:setShaderVector( 0, 0, 1, 0, 0 )
	Image:setShaderVector( 1, 1, 1, 0, 0 )
	Image:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Image )
	self.Image = Image
	
	local Image2 = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 21, 27 )
	Image2:setRGB( 0.76, 0, 0 )
	Image2:setScale( 0.95, 0.95 )
	Image2:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA02C44161370F6D ) )
	Image2:setShaderVector( 0, 0, 0.55, 0, 0 )
	Image2:setShaderVector( 1, 1, 1, 0, 0 )
	Image2:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 14, 20 )
	Image3:setRGB( 0.76, 0, 0 )
	Image3:setScale( 0.95, 0.95 )
	Image3:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA02C44161370F6D ) )
	Image3:setShaderVector( 0, 0, 0.35, 0, 0 )
	Image3:setShaderVector( 1, 1, 1, 0, 0 )
	Image3:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 7, 13 )
	Image4:setRGB( 0.76, 0, 0 )
	Image4:setScale( 0.95, 0.95 )
	Image4:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA02C44161370F6D ) )
	Image4:setShaderVector( 0, 0, 0.14, 0, 0 )
	Image4:setShaderVector( 1, 1, 1, 0, 0 )
	Image4:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new( 0, 0, 0, 42, 0, 0, 0, 6 )
	Image5:setRGB( 0.76, 0, 0 )
	Image5:setScale( 0.95, 0.95 )
	Image5:setImage( RegisterImage( "uie_ui_icon_perks_zm_deadshot" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( 0xA02C44161370F6D ) )
	Image5:setShaderVector( 0, 0, 0, 0, 0 )
	Image5:setShaderVector( 1, 1, 1, 0, 0 )
	Image5:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	self:mergeStateConditions( {
		{
			stateName = "DeadshotActive",
			condition = function ( menu, element, event )
				local f2_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f2_local0 then
					f2_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f2_local0 then
						f2_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 5 )
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "Charge4",
			condition = function ( menu, element, event )
				local f3_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f3_local0 then
					f3_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f3_local0 then
						f3_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 4 )
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Charge3",
			condition = function ( menu, element, event )
				local f4_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f4_local0 then
					f4_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f4_local0 then
						f4_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 3 )
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "Charge2",
			condition = function ( menu, element, event )
				local f5_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f5_local0 then
					f5_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f5_local0 then
						f5_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 2 )
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "Charge1",
			condition = function ( menu, element, event )
				local f6_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f6_local0 then
					f6_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f6_local0 then
						f6_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 1 )
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				local f7_local0 = CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_dead_shot" )
				if f7_local0 then
					f7_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "specialEffectActive", 1 )
					if f7_local0 then
						f7_local0 = CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "chargeCount", 0 )
					end
				end
				return f7_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	self:linkToElementModel( self, "specialEffectActive", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "specialEffectActive"
		} )
	end )
	self:linkToElementModel( self, "chargeCount", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "chargeCount"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporDeadshotCountList.__resetProperties = function ( f11_arg0 )
	f11_arg0.DeadshotImage:completeAnimation()
	f11_arg0.Image5:completeAnimation()
	f11_arg0.Image4:completeAnimation()
	f11_arg0.Image3:completeAnimation()
	f11_arg0.Image2:completeAnimation()
	f11_arg0.Image:completeAnimation()
	f11_arg0.DeadshotImage:setAlpha( 1 )
	f11_arg0.Image5:setAlpha( 1 )
	f11_arg0.Image4:setAlpha( 1 )
	f11_arg0.Image3:setAlpha( 1 )
	f11_arg0.Image2:setAlpha( 1 )
	f11_arg0.Image:setAlpha( 1 )
end

CoD.ZMPerkVaporDeadshotCountList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 6 )
			f12_arg0.DeadshotImage:completeAnimation()
			f12_arg0.DeadshotImage:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.DeadshotImage )
			f12_arg0.Image:completeAnimation()
			f12_arg0.Image:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image )
			f12_arg0.Image2:completeAnimation()
			f12_arg0.Image2:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image2 )
			f12_arg0.Image3:completeAnimation()
			f12_arg0.Image3:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image3 )
			f12_arg0.Image4:completeAnimation()
			f12_arg0.Image4:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image4 )
			f12_arg0.Image5:completeAnimation()
			f12_arg0.Image5:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image5 )
		end
	},
	DeadshotActive = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 6 )
			local f13_local0 = function ( f14_arg0 )
				local f14_local0 = function ( f15_arg0 )
					f15_arg0:beginAnimation( 500 )
					f15_arg0:setAlpha( 0 )
					f15_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
				end
				
				f13_arg0.DeadshotImage:beginAnimation( 500 )
				f13_arg0.DeadshotImage:setAlpha( 1 )
				f13_arg0.DeadshotImage:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.DeadshotImage:registerEventHandler( "transition_complete_keyframe", f14_local0 )
			end
			
			f13_arg0.DeadshotImage:completeAnimation()
			f13_arg0.DeadshotImage:setAlpha( 0 )
			f13_local0( f13_arg0.DeadshotImage )
			f13_arg0.Image:completeAnimation()
			f13_arg0.Image:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Image )
			f13_arg0.Image2:completeAnimation()
			f13_arg0.Image2:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Image2 )
			f13_arg0.Image3:completeAnimation()
			f13_arg0.Image3:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Image3 )
			f13_arg0.Image4:completeAnimation()
			f13_arg0.Image4:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Image4 )
			f13_arg0.Image5:completeAnimation()
			f13_arg0.Image5:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Image5 )
			f13_arg0.nextClip = "DefaultClip"
		end
	},
	Charge4 = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			f16_arg0.DeadshotImage:completeAnimation()
			f16_arg0.DeadshotImage:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.DeadshotImage )
			f16_arg0.Image5:completeAnimation()
			f16_arg0.Image5:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.Image5 )
		end
	},
	Charge3 = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 3 )
			f17_arg0.DeadshotImage:completeAnimation()
			f17_arg0.DeadshotImage:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.DeadshotImage )
			f17_arg0.Image4:completeAnimation()
			f17_arg0.Image4:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.Image4 )
			f17_arg0.Image5:completeAnimation()
			f17_arg0.Image5:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.Image5 )
		end
	},
	Charge2 = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 4 )
			f18_arg0.DeadshotImage:completeAnimation()
			f18_arg0.DeadshotImage:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.DeadshotImage )
			f18_arg0.Image3:completeAnimation()
			f18_arg0.Image3:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.Image3 )
			f18_arg0.Image4:completeAnimation()
			f18_arg0.Image4:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.Image4 )
			f18_arg0.Image5:completeAnimation()
			f18_arg0.Image5:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.Image5 )
		end
	},
	Charge1 = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 5 )
			f19_arg0.DeadshotImage:completeAnimation()
			f19_arg0.DeadshotImage:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.DeadshotImage )
			f19_arg0.Image2:completeAnimation()
			f19_arg0.Image2:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.Image2 )
			f19_arg0.Image3:completeAnimation()
			f19_arg0.Image3:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.Image3 )
			f19_arg0.Image4:completeAnimation()
			f19_arg0.Image4:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.Image4 )
			f19_arg0.Image5:completeAnimation()
			f19_arg0.Image5:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.Image5 )
		end
	},
	Empty = {
		DefaultClip = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 6 )
			f20_arg0.DeadshotImage:completeAnimation()
			f20_arg0.DeadshotImage:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.DeadshotImage )
			f20_arg0.Image:completeAnimation()
			f20_arg0.Image:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Image )
			f20_arg0.Image2:completeAnimation()
			f20_arg0.Image2:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Image2 )
			f20_arg0.Image3:completeAnimation()
			f20_arg0.Image3:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Image3 )
			f20_arg0.Image4:completeAnimation()
			f20_arg0.Image4:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Image4 )
			f20_arg0.Image5:completeAnimation()
			f20_arg0.Image5:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Image5 )
		end
	}
}
