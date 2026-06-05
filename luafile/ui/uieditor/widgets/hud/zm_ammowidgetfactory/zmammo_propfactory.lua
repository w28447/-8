require( "x64:27fbd7728ac85f8" )

CoD.ZmAmmo_PropFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_PropFactory.__defaultWidth = 349
CoD.ZmAmmo_PropFactory.__defaultHeight = 216
CoD.ZmAmmo_PropFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "hudItems.actionSlot0ammo" )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "hudItems.actionSlot1ammo" )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "hudItems.actionSlot2ammo" )
	CoD.BaseUtility.CreateControllerModel( f1_arg1, "hudItems.actionSlot3ammo" )
	self:setClass( CoD.ZmAmmo_PropFactory )
	self.id = "ZmAmmo_PropFactory"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZmAmmoBGBCarouselFactory = CoD.ZmAmmo_BGBCarouselFactory.new( f1_arg0, f1_arg1, 1, 1, -200, 0, 0, 0, 8, 208 )
	self:addElement( ZmAmmoBGBCarouselFactory )
	self.ZmAmmoBGBCarouselFactory = ZmAmmoBGBCarouselFactory
	
	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f1_arg1, "CurrentWeapon", "ammoInDWClip", -1 ) and not CoD.HUDUtility.IsCurrentViewmodelWeaponGamemodeHiddenDWAmmo( f1_arg1 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local3( f1_local2, f1_local4.ammoInDWClip, function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "ammoInDWClip"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local3( f1_local2, f1_local4.viewmodelWeaponName, function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "viewmodelWeaponName"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_PropFactory.__onClose = function ( f5_arg0 )
	f5_arg0.ZmAmmoBGBCarouselFactory:close()
end

