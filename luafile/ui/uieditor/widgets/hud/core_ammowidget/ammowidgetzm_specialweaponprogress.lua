require( "ui/uieditor/widgets/hud/zm_ammowidgetfactory/zmammo_weaponprogressfactory" )

CoD.AmmoWidgetZM_SpecialWeaponProgress = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_SpecialWeaponProgress.__defaultWidth = 89
CoD.AmmoWidgetZM_SpecialWeaponProgress.__defaultHeight = 40
CoD.AmmoWidgetZM_SpecialWeaponProgress.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_SpecialWeaponProgress )
	self.id = "AmmoWidgetZM_SpecialWeaponProgress"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZmAmmoWeaponProgressFactory = CoD.ZmAmmo_WeaponProgressFactory.new( f1_arg0, f1_arg1, 0, 0, 29.5, 88.5, 0, 0, 8.5, 32.5 )
	self:addElement( ZmAmmoWeaponProgressFactory )
	self.ZmAmmoWeaponProgressFactory = ZmAmmoWeaponProgressFactory
	
	local specialWeaponLevelBacking = LUI.UIImage.new( 0, 0, 0, 40, 0, 0, 0, 40 )
	specialWeaponLevelBacking:setImage( RegisterImage( "uie_zm_hud_specweapon_diamondbg" ) )
	self:addElement( specialWeaponLevelBacking )
	self.specialWeaponLevelBacking = specialWeaponLevelBacking
	
	local specialWeaponLevel = LUI.UIText.new( 0, 0, 3.5, 37.5, 0, 0, 12, 30 )
	specialWeaponLevel:setTTF( "skorzhen" )
	specialWeaponLevel:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	specialWeaponLevel:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	specialWeaponLevel:subscribeToGlobalModel( f1_arg1, "ZMHud", "weaponLevel", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			specialWeaponLevel:setText( StringAdd( 1, f2_local0 ) )
		end
	end )
	self:addElement( specialWeaponLevel )
	self.specialWeaponLevel = specialWeaponLevel
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueNonEmptyString( element, f1_arg1, "id" )
			end
		}
	} )
	self:linkToElementModel( self, "id", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "id"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_SpecialWeaponProgress.__resetProperties = function ( f5_arg0 )
	f5_arg0.specialWeaponLevel:completeAnimation()
	f5_arg0.specialWeaponLevelBacking:completeAnimation()
	f5_arg0.ZmAmmoWeaponProgressFactory:completeAnimation()
	f5_arg0.specialWeaponLevel:setAlpha( 1 )
	f5_arg0.specialWeaponLevelBacking:setAlpha( 1 )
	f5_arg0.ZmAmmoWeaponProgressFactory:setAlpha( 1 )
end

CoD.AmmoWidgetZM_SpecialWeaponProgress.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 3 )
			f7_arg0.ZmAmmoWeaponProgressFactory:completeAnimation()
			f7_arg0.ZmAmmoWeaponProgressFactory:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.ZmAmmoWeaponProgressFactory )
			f7_arg0.specialWeaponLevelBacking:completeAnimation()
			f7_arg0.specialWeaponLevelBacking:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.specialWeaponLevelBacking )
			f7_arg0.specialWeaponLevel:completeAnimation()
			f7_arg0.specialWeaponLevel:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.specialWeaponLevel )
		end
	}
}
CoD.AmmoWidgetZM_SpecialWeaponProgress.__onClose = function ( f8_arg0 )
	f8_arg0.ZmAmmoWeaponProgressFactory:close()
	f8_arg0.specialWeaponLevel:close()
end

