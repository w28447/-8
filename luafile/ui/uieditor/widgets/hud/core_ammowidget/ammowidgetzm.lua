require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_abilityorweaponcontainer" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_ammomodifier" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_mulekick" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_specialweaponprogress" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_weaponinfo" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_weaponlistpip" )
require( "ui/uieditor/widgets/zmhudwidgets/ammowidgetzm_equipmentcontainer" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_perks_disabled_container" )

CoD.AmmoWidgetZM = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM.__defaultWidth = 597
CoD.AmmoWidgetZM.__defaultHeight = 186
CoD.AmmoWidgetZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM )
	self.id = "AmmoWidgetZM"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local bgbGlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, -290, -48, 0.5, 0.5, -165, 196 )
	bgbGlowOrangeOver:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	bgbGlowOrangeOver:setAlpha( 0 )
	bgbGlowOrangeOver:setZRot( 90 )
	bgbGlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbGlowOrangeOver )
	self.bgbGlowOrangeOver = bgbGlowOrangeOver
	
	local TutorialHighlight = LUI.UIImage.new( 0, 0, 47.5, 193.5, 0, 0, 15, 177 )
	TutorialHighlight:setRGB( 0.87, 0.07, 0.78 )
	TutorialHighlight:setAlpha( 0 )
	self:addElement( TutorialHighlight )
	self.TutorialHighlight = TutorialHighlight
	
	local BackingBlur = LUI.UIImage.new( 0, 0, 245, 597, 0, 0, 56, 184 )
	BackingBlur:setAlpha( 0.9 )
	BackingBlur:setScale( 0.9, 0.9 )
	BackingBlur:setImage( RegisterImage( 0x907FA1028168086 ) )
	BackingBlur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	BackingBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BackingBlur )
	self.BackingBlur = BackingBlur
	
	local Backing = LUI.UIImage.new( 0, 0, 245, 597, 0, 0, 56, 184 )
	Backing:setScale( 0.9, 0.9 )
	Backing:setImage( RegisterImage( 0x62656BC725F9EEB ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local WeaponAmmoCount = CoD.AmmoWidgetZM_WeaponInfo.new( f1_arg0, f1_arg1, 0, 0, 587, 826, 0, 0, 85, 182 )
	WeaponAmmoCount:subscribeToGlobalModel( f1_arg1, "CurrentWeapon", nil, function ( model )
		WeaponAmmoCount:setModel( model, f1_arg1 )
	end )
	self:addElement( WeaponAmmoCount )
	self.WeaponAmmoCount = WeaponAmmoCount
	
	local MuleKick = CoD.AmmoWidgetZM_MuleKick.new( f1_arg0, f1_arg1, 0, 0, 305.5, 345.5, 0, 0, 26.5, 66.5 )
	self:addElement( MuleKick )
	self.MuleKick = MuleKick
	
	local AATIcon = LUI.UIImage.new( 0, 0, 339.5, 411.5, 0, 0, 9.5, 81.5 )
	AATIcon:setScale( 0.7, 0.7 )
	AATIcon:subscribeToGlobalModel( f1_arg1, "ZMHud", "aatIcon", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			AATIcon:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	self:addElement( AATIcon )
	self.AATIcon = AATIcon
	
	local aatText = LUI.UIText.new( 0, 0, 403, 529, 0, 0, 34.5, 54.5 )
	aatText:setRGB( 1, 0.87, 0.54 )
	aatText:setTTF( "skorzhen" )
	aatText:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	aatText:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	aatText:subscribeToGlobalModel( f1_arg1, "ZMHud", "aat", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			aatText:setText( Engine[0xF9F1239CFD921FE]( f4_local0 ) )
		end
	end )
	self:addElement( aatText )
	self.aatText = aatText
	
	local Equipment = CoD.AmmoWidgetZM_EquipmentContainer.new( f1_arg0, f1_arg1, 0, 0, 163.5, 235.5, 0, 0, 90.5, 149.5 )
	Equipment:subscribeToGlobalModel( f1_arg1, "LethalOffhands", "0", function ( model )
		Equipment:setModel( model, f1_arg1 )
	end )
	self:addElement( Equipment )
	self.Equipment = Equipment
	
	local AmmoWidgetZMAbilityOrWeaponContainer = CoD.AmmoWidgetZM_AbilityOrWeaponContainer.new( f1_arg0, f1_arg1, 0, 0, 84.5, 156.5, 0, 0, 90.5, 149.5 )
	self:addElement( AmmoWidgetZMAbilityOrWeaponContainer )
	self.AmmoWidgetZMAbilityOrWeaponContainer = AmmoWidgetZMAbilityOrWeaponContainer
	
	local specialWeaponLevel = CoD.AmmoWidgetZM_SpecialWeaponProgress.new( f1_arg0, f1_arg1, 0, 0, 73, 162, 0, 0, 142, 182 )
	specialWeaponLevel:subscribeToGlobalModel( f1_arg1, "PlayerAbilities", "playerGadget2", function ( model )
		specialWeaponLevel:setModel( model, f1_arg1 )
	end )
	self:addElement( specialWeaponLevel )
	self.specialWeaponLevel = specialWeaponLevel
	
	local HudZMWeaponDisabledContainer = CoD.Hud_ZM_Perks_Disabled_Container.new( f1_arg0, f1_arg1, 0, 0, 280, 630, 0, 0, 55, 190 )
	HudZMWeaponDisabledContainer:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentWeaponLocked", 0 ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableGun", 0 )
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				local f8_local0
				if not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" ) then
					f8_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
					if f8_local0 then
						f8_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentWeaponLocked", 1 )
						if f8_local0 then
							f8_local0 = CoD.ZombieUtility.GetIsDelayDisableWeaponEqualTo( f1_arg1, 2 )
							if f8_local0 then
								f8_local0 = not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableGun", 0 )
							end
						end
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "QuickShow",
			condition = function ( menu, element, event )
				local f9_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
				if f9_local0 then
					f9_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentWeaponLocked", 1 )
					if f9_local0 then
						if not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" ) then
							f9_local0 = CoD.ZombieUtility.GetIsDelayDisableWeaponEqualTo( f1_arg1, 0 )
							if f9_local0 then
								f9_local0 = not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableGun", 0 )
							end
						else
							f9_local0 = false
						end
					end
				end
				return f9_local0
			end
		}
	} )
	local HudZMSpecialWeaponDisabledContainer = HudZMWeaponDisabledContainer
	local HudZMEquipmentDisabledContainer = HudZMWeaponDisabledContainer.subscribeToModel
	local WeaponEquippedList = Engine.GetModelForController( f1_arg1 )
	HudZMEquipmentDisabledContainer( HudZMSpecialWeaponDisabledContainer, WeaponEquippedList["zmhud.currentWeaponLocked"], function ( f10_arg0 )
		f1_arg0:updateElementState( HudZMWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "zmhud.currentWeaponLocked"
		} )
	end, false )
	HudZMSpecialWeaponDisabledContainer = HudZMWeaponDisabledContainer
	HudZMEquipmentDisabledContainer = HudZMWeaponDisabledContainer.subscribeToModel
	WeaponEquippedList = Engine.GetGlobalModel()
	HudZMEquipmentDisabledContainer( HudZMSpecialWeaponDisabledContainer, WeaponEquippedList["ZMHudGlobal.trials.disableGun"], function ( f11_arg0 )
		f1_arg0:updateElementState( HudZMWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "ZMHudGlobal.trials.disableGun"
		} )
	end, false )
	HudZMSpecialWeaponDisabledContainer = HudZMWeaponDisabledContainer
	HudZMEquipmentDisabledContainer = HudZMWeaponDisabledContainer.subscribeToModel
	WeaponEquippedList = Engine.GetGlobalModel()
	HudZMEquipmentDisabledContainer( HudZMSpecialWeaponDisabledContainer, WeaponEquippedList["ZMHudGlobal.trials.infoHidden"], function ( f12_arg0 )
		f1_arg0:updateElementState( HudZMWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "ZMHudGlobal.trials.infoHidden"
		} )
	end, false )
	HudZMWeaponDisabledContainer:subscribeToGlobalModel( f1_arg1, "PerController", "ZMHud.updateDisableWeapon", function ( model )
		local f13_local0 = HudZMWeaponDisabledContainer
		if CoD.ModelUtility.IsModelValueGreaterThanOrEqualTo( f1_arg1, "ZMHud.updateDisableWeapon", 1 ) then
			UpdateElementState( self, "HudZMWeaponDisabledContainer", f1_arg1 )
		end
	end )
	self:addElement( HudZMWeaponDisabledContainer )
	self.HudZMWeaponDisabledContainer = HudZMWeaponDisabledContainer
	
	HudZMEquipmentDisabledContainer = CoD.Hud_ZM_Perks_Disabled_Container.new( f1_arg0, f1_arg1, 0, 0, 144, 255, 0, 0, 69.5, 179.5 )
	HudZMEquipmentDisabledContainer:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableEquip", 0 ) and CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentEquipmentLocked", 0 )
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				local f15_local0
				if not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" ) then
					f15_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
					if f15_local0 then
						if not CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "ZMHud.delayDisableEquipment", 1 ) then
							f15_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentEquipmentLocked", 1 )
							if f15_local0 then
								f15_local0 = not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableEquip", 0 )
							end
						else
							f15_local0 = false
						end
					end
				else
					f15_local0 = false
				end
				return f15_local0
			end
		}
	} )
	WeaponEquippedList = HudZMEquipmentDisabledContainer
	HudZMSpecialWeaponDisabledContainer = HudZMEquipmentDisabledContainer.subscribeToModel
	local bgbAbilitySwirl = Engine.GetGlobalModel()
	HudZMSpecialWeaponDisabledContainer( WeaponEquippedList, bgbAbilitySwirl["ZMHudGlobal.trials.disableEquip"], function ( f16_arg0 )
		f1_arg0:updateElementState( HudZMEquipmentDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "ZMHudGlobal.trials.disableEquip"
		} )
	end, false )
	WeaponEquippedList = HudZMEquipmentDisabledContainer
	HudZMSpecialWeaponDisabledContainer = HudZMEquipmentDisabledContainer.subscribeToModel
	bgbAbilitySwirl = Engine.GetModelForController( f1_arg1 )
	HudZMSpecialWeaponDisabledContainer( WeaponEquippedList, bgbAbilitySwirl["zmhud.currentEquipmentLocked"], function ( f17_arg0 )
		f1_arg0:updateElementState( HudZMEquipmentDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "zmhud.currentEquipmentLocked"
		} )
	end, false )
	WeaponEquippedList = HudZMEquipmentDisabledContainer
	HudZMSpecialWeaponDisabledContainer = HudZMEquipmentDisabledContainer.subscribeToModel
	bgbAbilitySwirl = Engine.GetGlobalModel()
	HudZMSpecialWeaponDisabledContainer( WeaponEquippedList, bgbAbilitySwirl["ZMHudGlobal.trials.infoHidden"], function ( f18_arg0 )
		f1_arg0:updateElementState( HudZMEquipmentDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "ZMHudGlobal.trials.infoHidden"
		} )
	end, false )
	WeaponEquippedList = HudZMEquipmentDisabledContainer
	HudZMSpecialWeaponDisabledContainer = HudZMEquipmentDisabledContainer.subscribeToModel
	bgbAbilitySwirl = Engine.GetModelForController( f1_arg1 )
	HudZMSpecialWeaponDisabledContainer( WeaponEquippedList, bgbAbilitySwirl["ZMHud.delayDisableEquipment"], function ( f19_arg0 )
		f1_arg0:updateElementState( HudZMEquipmentDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "ZMHud.delayDisableEquipment"
		} )
	end, false )
	self:addElement( HudZMEquipmentDisabledContainer )
	self.HudZMEquipmentDisabledContainer = HudZMEquipmentDisabledContainer
	
	HudZMSpecialWeaponDisabledContainer = CoD.Hud_ZM_Perks_Disabled_Container.new( f1_arg0, f1_arg1, 0, 0, 65, 176, 0, 0, 65, 175 )
	HudZMSpecialWeaponDisabledContainer:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableSpecial", 0 ) and CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentSpecialLocked", 0 )
			end
		},
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				local f21_local0
				if not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" ) then
					f21_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
					if f21_local0 then
						if not CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "ZMHud.delayDisableSpecial", 1 ) then
							f21_local0 = CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "zmhud.currentSpecialLocked", 1 )
							if f21_local0 then
								f21_local0 = not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.disableSpecial", 0 )
							end
						else
							f21_local0 = false
						end
					end
				else
					f21_local0 = false
				end
				return f21_local0
			end
		}
	} )
	bgbAbilitySwirl = HudZMSpecialWeaponDisabledContainer
	WeaponEquippedList = HudZMSpecialWeaponDisabledContainer.subscribeToModel
	local AmmoWidgetZMAmmoModifier = Engine.GetGlobalModel()
	WeaponEquippedList( bgbAbilitySwirl, AmmoWidgetZMAmmoModifier["ZMHudGlobal.trials.disableSpecial"], function ( f22_arg0 )
		f1_arg0:updateElementState( HudZMSpecialWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "ZMHudGlobal.trials.disableSpecial"
		} )
	end, false )
	bgbAbilitySwirl = HudZMSpecialWeaponDisabledContainer
	WeaponEquippedList = HudZMSpecialWeaponDisabledContainer.subscribeToModel
	AmmoWidgetZMAmmoModifier = Engine.GetModelForController( f1_arg1 )
	WeaponEquippedList( bgbAbilitySwirl, AmmoWidgetZMAmmoModifier["zmhud.currentSpecialLocked"], function ( f23_arg0 )
		f1_arg0:updateElementState( HudZMSpecialWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "zmhud.currentSpecialLocked"
		} )
	end, false )
	bgbAbilitySwirl = HudZMSpecialWeaponDisabledContainer
	WeaponEquippedList = HudZMSpecialWeaponDisabledContainer.subscribeToModel
	AmmoWidgetZMAmmoModifier = Engine.GetGlobalModel()
	WeaponEquippedList( bgbAbilitySwirl, AmmoWidgetZMAmmoModifier["ZMHudGlobal.trials.infoHidden"], function ( f24_arg0 )
		f1_arg0:updateElementState( HudZMSpecialWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "ZMHudGlobal.trials.infoHidden"
		} )
	end, false )
	bgbAbilitySwirl = HudZMSpecialWeaponDisabledContainer
	WeaponEquippedList = HudZMSpecialWeaponDisabledContainer.subscribeToModel
	AmmoWidgetZMAmmoModifier = Engine.GetModelForController( f1_arg1 )
	WeaponEquippedList( bgbAbilitySwirl, AmmoWidgetZMAmmoModifier["ZMHud.delayDisableSpecial"], function ( f25_arg0 )
		f1_arg0:updateElementState( HudZMSpecialWeaponDisabledContainer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f25_arg0:get(),
			modelName = "ZMHud.delayDisableSpecial"
		} )
	end, false )
	self:addElement( HudZMSpecialWeaponDisabledContainer )
	self.HudZMSpecialWeaponDisabledContainer = HudZMSpecialWeaponDisabledContainer
	
	WeaponEquippedList = LUI.UIList.new( f1_arg0, f1_arg1, 5, 0, nil, false, false, false, false )
	WeaponEquippedList:setLeftRight( 0, 0, 357.5, 457.5 )
	WeaponEquippedList:setTopBottom( 0, 0, 172, 182 )
	WeaponEquippedList:setWidgetType( CoD.AmmoWidgetZM_WeaponListPip )
	WeaponEquippedList:setHorizontalCount( 3 )
	WeaponEquippedList:setSpacing( 5 )
	WeaponEquippedList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	WeaponEquippedList:setDataSource( "AmmoWidgetZMEquippedWeaponsList" )
	self:addElement( WeaponEquippedList )
	self.WeaponEquippedList = WeaponEquippedList
	
	bgbAbilitySwirl = LUI.UIImage.new( 0.5, 0.5, -238.5, -117.5, 0, 0, 67, 186 )
	bgbAbilitySwirl:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	bgbAbilitySwirl:setAlpha( 0 )
	bgbAbilitySwirl:setZRot( 223 )
	bgbAbilitySwirl:setScale( 1.65, 1.65 )
	bgbAbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	bgbAbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbAbilitySwirl )
	self.bgbAbilitySwirl = bgbAbilitySwirl
	
	AmmoWidgetZMAmmoModifier = CoD.AmmoWidgetZM_AmmoModifier.new( f1_arg0, f1_arg1, 0, 0, 530, 570, 0, 0, 24.5, 64.5 )
	AmmoWidgetZMAmmoModifier:subscribeToGlobalModel( f1_arg1, "ZMHud", nil, function ( model )
		AmmoWidgetZMAmmoModifier:setModel( model, f1_arg1 )
	end )
	self:addElement( AmmoWidgetZMAmmoModifier )
	self.AmmoWidgetZMAmmoModifier = AmmoWidgetZMAmmoModifier
	
	self:mergeStateConditions( {
		{
			stateName = "hiddenTutorial",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztutorial" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "hudItems.ztut.showSpecial", 0 )
			end
		}
	} )
	local f1_local18 = self
	local f1_local19 = self.subscribeToModel
	local f1_local20 = Engine.GetGlobalModel()
	f1_local19( f1_local18, f1_local20["hudItems.ztut.showSpecial"], function ( f28_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f28_arg0:get(),
			modelName = "hudItems.ztut.showSpecial"
		} )
	end, false )
	WeaponEquippedList.id = "WeaponEquippedList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM.__resetProperties = function ( f29_arg0 )
	f29_arg0.AmmoWidgetZMAbilityOrWeaponContainer:completeAnimation()
	f29_arg0.specialWeaponLevel:completeAnimation()
	f29_arg0.bgbAbilitySwirl:completeAnimation()
	f29_arg0.bgbGlowOrangeOver:completeAnimation()
	f29_arg0.AmmoWidgetZMAbilityOrWeaponContainer:setAlpha( 1 )
	f29_arg0.specialWeaponLevel:setAlpha( 1 )
	f29_arg0.bgbAbilitySwirl:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	f29_arg0.bgbAbilitySwirl:setAlpha( 0 )
	f29_arg0.bgbAbilitySwirl:setZRot( 223 )
	f29_arg0.bgbGlowOrangeOver:setTopBottom( 0.5, 0.5, -165, 196 )
	f29_arg0.bgbGlowOrangeOver:setAlpha( 0 )
end

CoD.AmmoWidgetZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 0 )
		end
	},
	hiddenTutorial = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 2 )
			f31_arg0.AmmoWidgetZMAbilityOrWeaponContainer:completeAnimation()
			f31_arg0.AmmoWidgetZMAbilityOrWeaponContainer:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.AmmoWidgetZMAbilityOrWeaponContainer )
			f31_arg0.specialWeaponLevel:completeAnimation()
			f31_arg0.specialWeaponLevel:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.specialWeaponLevel )
		end,
		DefaultState = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 4 )
			local f32_local0 = function ( f33_arg0 )
				local f33_local0 = function ( f34_arg0 )
					local f34_local0 = function ( f35_arg0 )
						local f35_local0 = function ( f36_arg0 )
							local f36_local0 = function ( f37_arg0 )
								local f37_local0 = function ( f38_arg0 )
									local f38_local0 = function ( f39_arg0 )
										f39_arg0:beginAnimation( 290 )
										f39_arg0:setAlpha( 0 )
										f39_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
									end
									
									f38_arg0:beginAnimation( 119 )
									f38_arg0:setAlpha( 0.7 )
									f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
								end
								
								f37_arg0:beginAnimation( 160 )
								f37_arg0:setAlpha( 0 )
								f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
							end
							
							f36_arg0:beginAnimation( 99 )
							f36_arg0:setAlpha( 0.7 )
							f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
						end
						
						f35_arg0:beginAnimation( 110 )
						f35_arg0:setAlpha( 0 )
						f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
					end
					
					f34_arg0:beginAnimation( 220 )
					f34_arg0:setAlpha( 0.7 )
					f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
				end
				
				f32_arg0.bgbGlowOrangeOver:beginAnimation( 330 )
				f32_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f33_local0 )
			end
			
			f32_arg0.bgbGlowOrangeOver:completeAnimation()
			f32_arg0.bgbGlowOrangeOver:setTopBottom( 0.5, 0.5, -166, 195 )
			f32_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f32_local0( f32_arg0.bgbGlowOrangeOver )
			local f32_local1 = function ( f40_arg0 )
				local f40_local0 = function ( f41_arg0 )
					local f41_local0 = function ( f42_arg0 )
						f42_arg0:beginAnimation( 340 )
						f42_arg0:setAlpha( 1 )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
					end
					
					f41_arg0:beginAnimation( 329 )
					f41_arg0:setAlpha( 0 )
					f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
				end
				
				f40_arg0:beginAnimation( 330 )
				f40_arg0:setAlpha( 1 )
				f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
			end
			
			f32_arg0.AmmoWidgetZMAbilityOrWeaponContainer:beginAnimation( 330 )
			f32_arg0.AmmoWidgetZMAbilityOrWeaponContainer:setAlpha( 0 )
			f32_arg0.AmmoWidgetZMAbilityOrWeaponContainer:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
			f32_arg0.AmmoWidgetZMAbilityOrWeaponContainer:registerEventHandler( "transition_complete_keyframe", f32_local1 )
			local f32_local2 = function ( f43_arg0 )
				local f43_local0 = function ( f44_arg0 )
					local f44_local0 = function ( f45_arg0 )
						f45_arg0:beginAnimation( 340 )
						f45_arg0:setAlpha( 1 )
						f45_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
					end
					
					f44_arg0:beginAnimation( 329 )
					f44_arg0:setAlpha( 0 )
					f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
				end
				
				f43_arg0:beginAnimation( 330 )
				f43_arg0:setAlpha( 1 )
				f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
			end
			
			f32_arg0.specialWeaponLevel:beginAnimation( 330 )
			f32_arg0.specialWeaponLevel:setAlpha( 0 )
			f32_arg0.specialWeaponLevel:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
			f32_arg0.specialWeaponLevel:registerEventHandler( "transition_complete_keyframe", f32_local2 )
			local f32_local3 = function ( f46_arg0 )
				local f46_local0 = function ( f47_arg0 )
					f47_arg0:beginAnimation( 199 )
					f47_arg0:setAlpha( 0 )
					f47_arg0:setZRot( 360 )
					f47_arg0:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
				end
				
				f32_arg0.bgbAbilitySwirl:beginAnimation( 330 )
				f32_arg0.bgbAbilitySwirl:setAlpha( 1 )
				f32_arg0.bgbAbilitySwirl:setZRot( 240 )
				f32_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f46_local0 )
			end
			
			f32_arg0.bgbAbilitySwirl:completeAnimation()
			f32_arg0.bgbAbilitySwirl:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
			f32_arg0.bgbAbilitySwirl:setAlpha( 0.01 )
			f32_arg0.bgbAbilitySwirl:setZRot( 0 )
			f32_local3( f32_arg0.bgbAbilitySwirl )
		end
	}
}
CoD.AmmoWidgetZM.__onClose = function ( f48_arg0 )
	f48_arg0.WeaponAmmoCount:close()
	f48_arg0.MuleKick:close()
	f48_arg0.AATIcon:close()
	f48_arg0.aatText:close()
	f48_arg0.Equipment:close()
	f48_arg0.AmmoWidgetZMAbilityOrWeaponContainer:close()
	f48_arg0.specialWeaponLevel:close()
	f48_arg0.HudZMWeaponDisabledContainer:close()
	f48_arg0.HudZMEquipmentDisabledContainer:close()
	f48_arg0.HudZMSpecialWeaponDisabledContainer:close()
	f48_arg0.WeaponEquippedList:close()
	f48_arg0.AmmoWidgetZMAmmoModifier:close()
end

