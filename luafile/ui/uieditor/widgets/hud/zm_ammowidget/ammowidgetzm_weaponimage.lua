require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_powerweapondrain" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_weaponname" )

CoD.AmmoWidgetZM_WeaponImage = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_WeaponImage.__defaultWidth = 164
CoD.AmmoWidgetZM_WeaponImage.__defaultHeight = 50
CoD.AmmoWidgetZM_WeaponImage.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_WeaponImage )
	self.id = "AmmoWidgetZM_WeaponImage"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	
	local PowerWeaponDrainGadget3 = CoD.AmmoWidgetZM_PowerWeaponDrain.new( f1_arg0, f1_arg1, 0, 0, -290, -125, 0, 0, -19.5, 41.5 )
	PowerWeaponDrainGadget3:setAlpha( 0 )
	PowerWeaponDrainGadget3.Empty:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	PowerWeaponDrainGadget3.Fill2:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
	PowerWeaponDrainGadget3.Fill:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
	PowerWeaponDrainGadget3.Fill3:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
	PowerWeaponDrainGadget3:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget3", function ( model )
		PowerWeaponDrainGadget3:setModel( model, f1_arg1 )
	end )
	self:addElement( PowerWeaponDrainGadget3 )
	self.PowerWeaponDrainGadget3 = PowerWeaponDrainGadget3
	
	local PowerWeaponDrainGadget2 = CoD.AmmoWidgetZM_PowerWeaponDrain.new( f1_arg0, f1_arg1, 0, 0, -290, -125, 0, 0, -19.5, 41.5 )
	PowerWeaponDrainGadget2:setAlpha( 0 )
	PowerWeaponDrainGadget2.Empty:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	PowerWeaponDrainGadget2.Fill2:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	PowerWeaponDrainGadget2.Fill:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	PowerWeaponDrainGadget2.Fill3:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	PowerWeaponDrainGadget2:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget2", function ( model )
		PowerWeaponDrainGadget2:setModel( model, f1_arg1 )
	end )
	self:addElement( PowerWeaponDrainGadget2 )
	self.PowerWeaponDrainGadget2 = PowerWeaponDrainGadget2
	
	local WeaponImage = LUI.UIFixedAspectRatioImage.new( 0, 0, -236, -25, 0.5, 0.5, -34, 31 )
	WeaponImage:setScale( 0.8, 0.8 )
	WeaponImage:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	WeaponImage:setShaderVector( 0, 1, 0, 0, 0 )
	WeaponImage.__Image = function ( f4_arg0 )
		local f4_local0 = f4_arg0:get()
		if f4_local0 ~= nil then
			WeaponImage:setImage( RegisterImage( GetHudImageFromItemRefHash( self:getModel(), f4_local0 ) ) )
		end
	end
	
	WeaponImage:linkToElementModel( self, "equippedWeaponReference", true, WeaponImage.__Image )
	WeaponImage.__Image_FullPath = function ()
		local f5_local0 = self:getModel()
		if f5_local0 then
			f5_local0 = self:getModel()
			f5_local0 = f5_local0.equippedWeaponReference
		end
		if f5_local0 then
			WeaponImage.__Image( f5_local0 )
		end
	end
	
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local HeroAbilityUseString = CoD.AmmoWidgetZM_WeaponName.new( f1_arg0, f1_arg1, 0, 0, -212, -44, 0, 0, -28.5, 4.5 )
	HeroAbilityUseString:linkToElementModel( self, "weaponName", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			HeroAbilityUseString.HeroAbilityUseString:setText( ConvertToUpperString( CoD.BaseUtility.AlreadyLocalized( f6_local0 ) ) )
		end
	end )
	self:addElement( HeroAbilityUseString )
	self.HeroAbilityUseString = HeroAbilityUseString
	
	WeaponImage:linkToElementModel( self, "weapon", true, WeaponImage.__Image_FullPath )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_WeaponImage.__onClose = function ( f7_arg0 )
	f7_arg0.PowerWeaponDrainGadget3:close()
	f7_arg0.PowerWeaponDrainGadget2:close()
	f7_arg0.WeaponImage:close()
	f7_arg0.HeroAbilityUseString:close()
end

