CoD.AmmoWidgetZM_WeaponListPip = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_WeaponListPip.__defaultWidth = 30
CoD.AmmoWidgetZM_WeaponListPip.__defaultHeight = 10
CoD.AmmoWidgetZM_WeaponListPip.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_WeaponListPip )
	self.id = "AmmoWidgetZM_WeaponListPip"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local FeaturedPipEmpty = LUI.UIImage.new( 0, 0, -12, 42, 0, 0, -6, 16 )
	FeaturedPipEmpty:setAlpha( 0.8 )
	FeaturedPipEmpty:setImage( RegisterImage( 0x4C042BC6C9D43A9 ) )
	self:addElement( FeaturedPipEmpty )
	self.FeaturedPipEmpty = FeaturedPipEmpty
	
	local FeaturedPipCurrent = LUI.UIImage.new( 0, 0, -12, 42, 0, 0, -6, 16 )
	FeaturedPipCurrent:setRGB( 0.93, 0.81, 0.03 )
	FeaturedPipCurrent:setAlpha( 0 )
	FeaturedPipCurrent:setImage( RegisterImage( 0x9D0184504FDF2CD ) )
	FeaturedPipCurrent:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	FeaturedPipCurrent:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( FeaturedPipCurrent )
	self.FeaturedPipCurrent = FeaturedPipCurrent
	
	self:mergeStateConditions( {
		{
			stateName = "HasWeapon",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "", CoD.ZMAmmoWidgetUtility.AmmoWidgetZMEquipedWeaponsListPipState.HAS_WEAPON )
			end
		},
		{
			stateName = "HasEquippedWeapon",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "", CoD.ZMAmmoWidgetUtility.AmmoWidgetZMEquipedWeaponsListPipState.HAS_EQUIPPED_WEAPON )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = nil
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_WeaponListPip.__resetProperties = function ( f5_arg0 )
	f5_arg0.FeaturedPipCurrent:completeAnimation()
	f5_arg0.FeaturedPipCurrent:setRGB( 0.93, 0.81, 0.03 )
	f5_arg0.FeaturedPipCurrent:setAlpha( 0 )
end

CoD.AmmoWidgetZM_WeaponListPip.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end
	},
	HasWeapon = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.FeaturedPipCurrent:completeAnimation()
			f7_arg0.FeaturedPipCurrent:setRGB( 0.32, 0.33, 0.27 )
			f7_arg0.FeaturedPipCurrent:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.FeaturedPipCurrent )
		end
	},
	HasEquippedWeapon = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			f8_arg0.FeaturedPipCurrent:completeAnimation()
			f8_arg0.FeaturedPipCurrent:setRGB( 0.37, 0.68, 0.18 )
			f8_arg0.FeaturedPipCurrent:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.FeaturedPipCurrent )
		end
	}
}
