require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_clipinfo" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_prompt" )
require( "ui/uieditor/widgets/hud/zm_ammowidget/ammowidgetzm_weaponimage" )

CoD.AmmoWidgetZM_WeaponInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_WeaponInfo.__defaultWidth = 239
CoD.AmmoWidgetZM_WeaponInfo.__defaultHeight = 97
CoD.AmmoWidgetZM_WeaponInfo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_WeaponInfo )
	self.id = "AmmoWidgetZM_WeaponInfo"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local WeaponImage = CoD.AmmoWidgetZM_WeaponImage.new( f1_arg0, f1_arg1, 0, 0, -44, 120, 0, 0, 20.5, 73.5 )
	WeaponImage:linkToElementModel( self, nil, false, function ( model )
		WeaponImage:setModel( model, f1_arg1 )
	end )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local WeaponAmmoCount = CoD.AmmoWidgetZM_ClipInfo.new( f1_arg0, f1_arg1, 0, 0, -123, -3, 0, 0, 0, 80 )
	WeaponAmmoCount:linkToElementModel( self, nil, false, function ( model )
		WeaponAmmoCount:setModel( model, f1_arg1 )
	end )
	self:addElement( WeaponAmmoCount )
	self.WeaponAmmoCount = WeaponAmmoCount
	
	local grappleWeapon = LUI.UIImage.new( 0, 0, 142, 207, 0, 0, -28, 2 )
	grappleWeapon:setAlpha( 0 )
	grappleWeapon:setZRot( -70 )
	grappleWeapon:linkToElementModel( self, "dwGrappleWeapon", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			grappleWeapon:setImage( RegisterImage( GetHudImageFromItemIndex( f4_local0 ) ) )
		end
	end )
	self:addElement( grappleWeapon )
	self.grappleWeapon = grappleWeapon
	
	local AmmoHeal_Prompt = CoD.AmmoWidgetZM_Prompt.new( f1_arg0, f1_arg1, 0, 0, -105, -41, 0, 0, 78, 90 )
	AmmoHeal_Prompt:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LowHealth",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	AmmoHeal_Prompt:setAlpha( 0 )
	self:addElement( AmmoHeal_Prompt )
	self.AmmoHeal_Prompt = AmmoHeal_Prompt
	
	self:mergeStateConditions( {
		{
			stateName = "NoAmmoWeapon",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsCurrentViewmodelWeaponGamemodeHiddenAmmo( f1_arg1 )
			end
		},
		{
			stateName = "MP",
			condition = function ( menu, element, event )
				return IsMultiplayer()
			end
		}
	} )
	local f1_local5 = self
	local f1_local6 = self.subscribeToModel
	local f1_local7 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local6( f1_local5, f1_local7.viewmodelWeaponName, function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "viewmodelWeaponName"
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetGlobalModel()
	f1_local6( f1_local5, f1_local7["lobbyRoot.lobbyNav"], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_WeaponInfo.__resetProperties = function ( f11_arg0 )
	f11_arg0.WeaponImage:completeAnimation()
	f11_arg0.WeaponAmmoCount:completeAnimation()
	f11_arg0.grappleWeapon:completeAnimation()
	f11_arg0.AmmoHeal_Prompt:completeAnimation()
	f11_arg0.WeaponImage:setLeftRight( 0, 0, -44, 120 )
	f11_arg0.WeaponImage:setAlpha( 1 )
	f11_arg0.WeaponAmmoCount:setAlpha( 1 )
	f11_arg0.grappleWeapon:setAlpha( 0 )
	f11_arg0.AmmoHeal_Prompt:setAlpha( 0 )
end

CoD.AmmoWidgetZM_WeaponInfo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.WeaponImage:completeAnimation()
			f12_arg0.WeaponImage:setLeftRight( 0, 0, -77, 87 )
			f12_arg0.clipFinished( f12_arg0.WeaponImage )
		end
	},
	NoAmmoWeapon = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 4 )
			f13_arg0.WeaponImage:completeAnimation()
			f13_arg0.WeaponImage:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.WeaponImage )
			f13_arg0.WeaponAmmoCount:completeAnimation()
			f13_arg0.WeaponAmmoCount:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.WeaponAmmoCount )
			f13_arg0.grappleWeapon:completeAnimation()
			f13_arg0.grappleWeapon:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.grappleWeapon )
			f13_arg0.AmmoHeal_Prompt:completeAnimation()
			f13_arg0.AmmoHeal_Prompt:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.AmmoHeal_Prompt )
		end
	},
	MP = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			f14_arg0.WeaponImage:completeAnimation()
			f14_arg0.WeaponImage:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.WeaponImage )
		end
	}
}
CoD.AmmoWidgetZM_WeaponInfo.__onClose = function ( f15_arg0 )
	f15_arg0.WeaponImage:close()
	f15_arg0.WeaponAmmoCount:close()
	f15_arg0.grappleWeapon:close()
	f15_arg0.AmmoHeal_Prompt:close()
end

