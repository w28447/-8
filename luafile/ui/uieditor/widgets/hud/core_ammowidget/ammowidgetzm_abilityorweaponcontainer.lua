require( "ui/uieditor/widgets/hud/core_ammowidget/abilityholdtoactivatezm" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidget_abilitytextzm" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_abilityitem" )

CoD.AmmoWidgetZM_AbilityOrWeaponContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_AbilityOrWeaponContainer.__defaultWidth = 72
CoD.AmmoWidgetZM_AbilityOrWeaponContainer.__defaultHeight = 59
CoD.AmmoWidgetZM_AbilityOrWeaponContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_AbilityOrWeaponContainer )
	self.id = "AmmoWidgetZM_AbilityOrWeaponContainer"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Ability = CoD.AmmoWidgetZM_AbilityItem.new( f1_arg0, f1_arg1, 0, 0, 0, 72, 0, 0, 0, 59 )
	Ability:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget2", function ( model )
		Ability:setModel( model, f1_arg1 )
	end )
	self:addElement( Ability )
	self.Ability = Ability
	
	local Weapon = CoD.AmmoWidgetZM_AbilityItem.new( f1_arg0, f1_arg1, 0, 0, 0, 72, 0, 0, 0, 59 )
	Weapon:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget2", function ( model )
		Weapon:setModel( model, f1_arg1 )
	end )
	self:addElement( Weapon )
	self.Weapon = Weapon
	
	local TankUseString = CoD.AmmoWidget_AbilityTextZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -58, 58, 0, 0, -64, -39 )
	TankUseString:mergeStateConditions( {
		{
			stateName = "TankInbound",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "TankReadyForCommands",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "TankEntered",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "SmartCoverHUDDestroy",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	local f1_local4 = TankUseString
	local HeroAbilityHoldString = TankUseString.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	HeroAbilityHoldString( f1_local4, f1_local6["hudItems.dogState"], function ( f8_arg0 )
		f1_arg0:updateElementState( TankUseString, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "hudItems.dogState"
		} )
	end, false )
	self:addElement( TankUseString )
	self.TankUseString = TankUseString
	
	HeroAbilityHoldString = CoD.AbilityHoldToActivateZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -100, 100, 0, 0, -83, -34 )
	HeroAbilityHoldString:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget2", function ( model )
		HeroAbilityHoldString:setModel( model, f1_arg1 )
	end )
	self:addElement( HeroAbilityHoldString )
	self.HeroAbilityHoldString = HeroAbilityHoldString
	
	self:mergeStateConditions( {
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueNonEmptyString( f1_arg1, "PlayerAbilities", "playerGadget3.id" )
			end
		}
	} )
	f1_local6 = self
	f1_local4 = self.subscribeToModel
	local f1_local7 = DataSources.PlayerAbilities.getModel( f1_arg1 )
	f1_local4( f1_local6, f1_local7["playerGadget3.id"], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "playerGadget3.id"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_AbilityOrWeaponContainer.__resetProperties = function ( f12_arg0 )
	f12_arg0.Weapon:completeAnimation()
	f12_arg0.Ability:completeAnimation()
	f12_arg0.Weapon:setAlpha( 1 )
	f12_arg0.Ability:setAlpha( 1 )
end

CoD.AmmoWidgetZM_AbilityOrWeaponContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 2 )
			f13_arg0.Ability:completeAnimation()
			f13_arg0.Ability:setAlpha( 1 )
			f13_arg0.clipFinished( f13_arg0.Ability )
			f13_arg0.Weapon:completeAnimation()
			f13_arg0.Weapon:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Weapon )
		end
	},
	Weapon = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 2 )
			f14_arg0.Ability:completeAnimation()
			f14_arg0.Ability:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.Ability )
			f14_arg0.Weapon:completeAnimation()
			f14_arg0.Weapon:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.Weapon )
		end
	}
}
CoD.AmmoWidgetZM_AbilityOrWeaponContainer.__onClose = function ( f15_arg0 )
	f15_arg0.Ability:close()
	f15_arg0.Weapon:close()
	f15_arg0.TankUseString:close()
	f15_arg0.HeroAbilityHoldString:close()
end

