require( "ui/uieditor/widgets/controllerdependent_textbox" )
require( "ui/uieditor/widgets/hud/core_ammowidget/abilityholdtoactivate" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidget_abilitycontainer" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidget_equipmentempty" )

CoD.AmmoWidgetZM_AbilityItem = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_AbilityItem.__defaultWidth = 72
CoD.AmmoWidgetZM_AbilityItem.__defaultHeight = 59
CoD.AmmoWidgetZM_AbilityItem.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_AbilityItem )
	self.id = "AmmoWidgetZM_AbilityItem"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local SecondaryWeaponBGBlur = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0, 0, -7, 73 )
	SecondaryWeaponBGBlur:setImage( RegisterImage( 0xFE9388BE79636F7 ) )
	SecondaryWeaponBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	SecondaryWeaponBGBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( SecondaryWeaponBGBlur )
	self.SecondaryWeaponBGBlur = SecondaryWeaponBGBlur
	
	local SecondaryWeaponBG = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0, 0, -7, 73 )
	SecondaryWeaponBG:setImage( RegisterImage( 0x6E5BECCF89F9216 ) )
	self:addElement( SecondaryWeaponBG )
	self.SecondaryWeaponBG = SecondaryWeaponBG
	
	local SecondaryWeaponMeterBGBlur = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0, 0, -16, 12 )
	SecondaryWeaponMeterBGBlur:setImage( RegisterImage( 0xBCE5D90EBC1F88 ) )
	SecondaryWeaponMeterBGBlur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	SecondaryWeaponMeterBGBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( SecondaryWeaponMeterBGBlur )
	self.SecondaryWeaponMeterBGBlur = SecondaryWeaponMeterBGBlur
	
	local SecondaryWeaponMeterBG = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0, 0, -16, 12 )
	SecondaryWeaponMeterBG:setImage( RegisterImage( 0x7A319569188B535 ) )
	self:addElement( SecondaryWeaponMeterBG )
	self.SecondaryWeaponMeterBG = SecondaryWeaponMeterBG
	
	local ClockMeter = LUI.UIImage.new( 0.5, 0.5, -47, 47, 0.5, 0.5, -45.5, 48.5 )
	ClockMeter:setAlpha( 0 )
	ClockMeter:setImage( RegisterImage( "uie_zm_hud_elixirringmeterfg" ) )
	ClockMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ClockMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	ClockMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	ClockMeter:setShaderVector( 3, 0, 0, 0, 0 )
	ClockMeter:setShaderVector( 4, 0, 0, 0, 0 )
	ClockMeter:linkToElementModel( self, "powerRatio", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ClockMeter:setShaderVector( 0, AddToVector( 0.38, 0, 0.5, 0, ScaleVectorComponents( 0.25, 1, 1, 1, SetVectorComponent( 2, 0.38, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) ) ) ) )
		end
	end )
	self:addElement( ClockMeter )
	self.ClockMeter = ClockMeter
	
	local ClockMeterAdd = LUI.UIImage.new( 0.5, 0.5, -47, 47, 0.5, 0.5, -45.5, 48.5 )
	ClockMeterAdd:setAlpha( 0 )
	ClockMeterAdd:setImage( RegisterImage( "uie_zm_hud_elixirringmeterfg" ) )
	ClockMeterAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	ClockMeterAdd:setShaderVector( 1, 0.5, 0, 0, 0 )
	ClockMeterAdd:setShaderVector( 2, 0.5, 0, 0, 0 )
	ClockMeterAdd:setShaderVector( 3, 0, 0, 0, 0 )
	ClockMeterAdd:setShaderVector( 4, 0, 0, 0, 0 )
	ClockMeterAdd:linkToElementModel( self, "powerRatio", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ClockMeterAdd:setShaderVector( 0, AddToVector( 0.38, 0, 0.5, 0, ScaleVectorComponents( 0.25, 1, 1, 1, SetVectorComponent( 2, 0.38, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) ) ) ) )
		end
	end )
	self:addElement( ClockMeterAdd )
	self.ClockMeterAdd = ClockMeterAdd
	
	local FlareBack = LUI.UIImage.new( 0, 0, -45.5, 114.5, 0, 0, -40, 100 )
	FlareBack:setAlpha( 0 )
	FlareBack:setImage( RegisterImage( "uie_abeq_flare_back" ) )
	FlareBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FlareBack )
	self.FlareBack = FlareBack
	
	local Glow = LUI.UIImage.new( 0, 0, 9, 61, 0, 0, 7, 59 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( 0x613317835FD35EB ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AmmoWidgetAbilityContainer = CoD.AmmoWidget_AbilityContainer.new( f1_arg0, f1_arg1, 0, 0, -23, 69, 0, 0, -9, 35 )
	AmmoWidgetAbilityContainer:setAlpha( 0 )
	AmmoWidgetAbilityContainer:setScale( 1.4, 1.4 )
	self:addElement( AmmoWidgetAbilityContainer )
	self.AmmoWidgetAbilityContainer = AmmoWidgetAbilityContainer
	
	local FullBackingDeployed = LUI.UIImage.new( 0, 0, 8, 64, 0, 0, 2, 58 )
	FullBackingDeployed:setRGB( 0.84, 0.83, 0.77 )
	FullBackingDeployed:setAlpha( 0 )
	FullBackingDeployed:setZRot( 180 )
	FullBackingDeployed:setImage( RegisterImage( "uie_ui_hud_core_abeg_widget_x" ) )
	FullBackingDeployed:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FullBackingDeployed )
	self.FullBackingDeployed = FullBackingDeployed
	
	local EquipmentBacking = LUI.UIImage.new( 0, 0, 5, 67, 0, 0, -1, 61 )
	EquipmentBacking:setRGB( 0, 0, 0 )
	EquipmentBacking:setAlpha( 0.6 )
	EquipmentBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_normal" ) )
	EquipmentBacking:setShaderVector( 0, 50, 1, 0, 0 )
	EquipmentBacking:setShaderVector( 1, 100, 100, 0, 0 )
	EquipmentBacking:setShaderVector( 2, 0, 0.81, 0, 0 )
	self:addElement( EquipmentBacking )
	self.EquipmentBacking = EquipmentBacking
	
	local PowerBasedImageAvailable = LUI.UIImage.new( 0, 0, 9, 64, 0, 0, 3.5, 58.5 )
	PowerBasedImageAvailable:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	PowerBasedImageAvailable:setScale( 0.86, 0.86 )
	PowerBasedImageAvailable:linkToElementModel( self, "id", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			PowerBasedImageAvailable:setImage( GetWeaponGadgetIconAvailable( f4_local0 ) )
		end
	end )
	self:addElement( PowerBasedImageAvailable )
	self.PowerBasedImageAvailable = PowerBasedImageAvailable
	
	local PowerBasedImageUnavailable = LUI.UIImage.new( 0, 0, 9, 64, 0, 0, 3.5, 58.5 )
	PowerBasedImageUnavailable:setAlpha( 0 )
	PowerBasedImageUnavailable:setScale( 0.86, 0.86 )
	PowerBasedImageUnavailable:linkToElementModel( self, "id", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			PowerBasedImageUnavailable:setImage( GetWeaponGadgetIconUnavailable( f5_local0 ) )
		end
	end )
	self:addElement( PowerBasedImageUnavailable )
	self.PowerBasedImageUnavailable = PowerBasedImageUnavailable
	
	local NotAvailable = CoD.AmmoWidget_EquipmentEmpty.new( f1_arg0, f1_arg1, 0.5, 0.5, -26, 26, 0.5, 0.5, -18.5, 23.5 )
	NotAvailable:linkToElementModel( self, nil, false, function ( model )
		NotAvailable:setModel( model, f1_arg1 )
	end )
	NotAvailable:linkToElementModel( self, "id", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			NotAvailable.ImgIcon:setImage( GetWeaponGadgetIconAvailable( f7_local0 ) )
		end
	end )
	NotAvailable:linkToElementModel( self, "id", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			NotAvailable.ImgIconGrow:setImage( GetWeaponGadgetIconAvailable( f8_local0 ) )
		end
	end )
	self:addElement( NotAvailable )
	self.NotAvailable = NotAvailable
	
	local HeroAbilityUseString = CoD.ControllerDependent_TextBox.new( f1_arg0, f1_arg1, 0.5, 0.5, -50, 50, 0, 0, -33, -9 )
	HeroAbilityUseString:mergeStateConditions( {
		{
			stateName = "KeyboardAndMouse",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 ) and AlwaysFalse()
			end
		},
		{
			stateName = "KeyboardAndMouseAbility",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 ) and AlwaysFalse()
			end
		},
		{
			stateName = "KeyboardAndMouseUltimate",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 ) and AlwaysFalse()
			end
		},
		{
			stateName = "KeyboardAndMouseScoreStreak",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 ) and AlwaysFalse()
			end
		},
		{
			stateName = "KeyboardAndMouseAbilityWZ",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 ) and AlwaysFalse()
			end
		},
		{
			stateName = "KeyboardAndMouseZM",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 )
			end
		}
	} )
	local HeroAbilityHoldStringPC = HeroAbilityUseString
	local HeroAbilityHoldString = HeroAbilityUseString.subscribeToModel
	local f1_local18 = Engine.GetModelForController( f1_arg1 )
	HeroAbilityHoldString( HeroAbilityHoldStringPC, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f15_arg0 )
		f1_arg0:updateElementState( HeroAbilityUseString, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	HeroAbilityHoldStringPC = HeroAbilityUseString
	HeroAbilityHoldString = HeroAbilityUseString.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	HeroAbilityHoldString( HeroAbilityHoldStringPC, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f16_arg0 )
		f1_arg0:updateElementState( HeroAbilityUseString, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	HeroAbilityUseString:appendEventHandler( "input_source_changed", function ( f17_arg0, f17_arg1 )
		f17_arg1.menu = f17_arg1.menu or f1_arg0
		f1_arg0:updateElementState( HeroAbilityUseString, f17_arg1 )
	end )
	HeroAbilityHoldStringPC = HeroAbilityUseString
	HeroAbilityHoldString = HeroAbilityUseString.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	HeroAbilityHoldString( HeroAbilityHoldStringPC, f1_local18.LastInput, function ( f18_arg0 )
		f1_arg0:updateElementState( HeroAbilityUseString, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	HeroAbilityUseString:setScale( LanguageOverrideNumberForScale( "arabic", 0.65, 1, 1 ) )
	HeroAbilityUseString.KBMText:setText( Engine[0xF9F1239CFD921FE]( 0xEC61C43D90FCF56 ) )
	HeroAbilityUseString.GamepadText:setText( Engine[0xF9F1239CFD921FE]( 0x9E6A8D0F83F4FC6 ) )
	HeroAbilityUseString.GamepadText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( HeroAbilityUseString )
	self.HeroAbilityUseString = HeroAbilityUseString
	
	HeroAbilityHoldString = CoD.AbilityHoldToActivate.new( f1_arg0, f1_arg1, 0.5, 0.5, -100, 100, 0, 0, -78, -29 )
	HeroAbilityHoldString:linkToElementModel( self, nil, false, function ( model )
		HeroAbilityHoldString:setModel( model, f1_arg1 )
	end )
	self:addElement( HeroAbilityHoldString )
	self.HeroAbilityHoldString = HeroAbilityHoldString
	
	HeroAbilityHoldStringPC = nil
	
	HeroAbilityHoldStringPC = CoD.AbilityHoldToActivate.new( f1_arg0, f1_arg1, 0.5, 0.5, -100, 100, 0, 0, -93, -44 )
	HeroAbilityHoldStringPC.__Alpha = function ()
		HeroAbilityHoldStringPC:setAlpha( CoD.HUDUtility.GetAbilityHoldToActivateAlpha( f1_arg1, self, 1 ) )
	end
	
	HeroAbilityHoldStringPC.__Alpha()
	HeroAbilityHoldStringPC:linkToElementModel( self, nil, false, function ( model )
		HeroAbilityHoldStringPC:setModel( model, f1_arg1 )
	end )
	self:addElement( HeroAbilityHoldStringPC )
	self.HeroAbilityHoldStringPC = HeroAbilityHoldStringPC
	
	HeroAbilityHoldStringPC:linkToElementModel( self, "powerRatio", true, HeroAbilityHoldStringPC.__Alpha )
	local f1_local19 = HeroAbilityHoldStringPC
	f1_local18 = HeroAbilityHoldStringPC.subscribeToModel
	local f1_local20 = Engine.GetModelForController( f1_arg1 )
	f1_local18( f1_local19, f1_local20["GameplayFeedbackSettings.hideRadiationHold"], HeroAbilityHoldStringPC.__Alpha )
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueNonEmptyString( element, f1_arg1, "id" )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", Enum[0xF0447219F15F7F3][0x1873A43E9D1620E] )
			end
		},
		{
			stateName = "Deployed",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "PowerBasedEmptyCharging",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", Enum[0xF0447219F15F7F3][0x958A6962CA8F9B7] ) and CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "powerRatio", 0 )
			end
		},
		{
			stateName = "PowerBasedCharging",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", Enum[0xF0447219F15F7F3][0x958A6962CA8F9B7] ) and not IsWarzone()
			end
		},
		{
			stateName = "PowerBased",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", Enum[0xF0447219F15F7F3][0x29529861EAA8D1C] )
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
	self:linkToElementModel( self, "state", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	self:linkToElementModel( self, "powerRatio", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "powerRatio"
		} )
	end )
	f1_local19 = self
	f1_local18 = self.subscribeToModel
	f1_local20 = Engine.GetGlobalModel()
	f1_local18( f1_local19, f1_local20["lobbyRoot.lobbyNav"], function ( f31_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f31_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f32_arg2, f32_arg3, f32_arg4 )
		if CoD.HUDUtility.ShouldPulseNewAmmo( self ) and IsSelfInState( self, "PowerBased" ) then
			PlayClip( self, "Pulse", controller )
		end
	end )
	self:linkToElementModel( self, "ammo", true, function ( model )
		local f33_local0 = self
		if IsSelfInState( self, "PowerBased" ) and CoD.HUDUtility.ShouldPulseNewAmmo( self ) then
			PlayClip( self, "Pulse", f1_arg1 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local18 = self
	f1_local18 = HeroAbilityUseString
	if IsPC() then
		CoD.PCWidgetUtility.EnableShrinkToFit( f1_local18 )
	end
	f1_local18 = HeroAbilityHoldString
	if IsPC() then
		HideWidget( self.HeroAbilityHoldString )
	end
	return self
end

CoD.AmmoWidgetZM_AbilityItem.__resetProperties = function ( f34_arg0 )
	f34_arg0.NotAvailable:completeAnimation()
	f34_arg0.HeroAbilityUseString:completeAnimation()
	f34_arg0.FlareBack:completeAnimation()
	f34_arg0.PowerBasedImageUnavailable:completeAnimation()
	f34_arg0.PowerBasedImageAvailable:completeAnimation()
	f34_arg0.FullBackingDeployed:completeAnimation()
	f34_arg0.AmmoWidgetAbilityContainer:completeAnimation()
	f34_arg0.Glow:completeAnimation()
	f34_arg0.SecondaryWeaponBG:completeAnimation()
	f34_arg0.SecondaryWeaponMeterBG:completeAnimation()
	f34_arg0.SecondaryWeaponMeterBGBlur:completeAnimation()
	f34_arg0.SecondaryWeaponBGBlur:completeAnimation()
	f34_arg0.EquipmentBacking:completeAnimation()
	f34_arg0.ClockMeter:completeAnimation()
	f34_arg0.ClockMeterAdd:completeAnimation()
	f34_arg0.NotAvailable:setAlpha( 1 )
	f34_arg0.HeroAbilityUseString:setRGB( 1, 1, 1 )
	f34_arg0.HeroAbilityUseString:setAlpha( 1 )
	f34_arg0.FlareBack:setAlpha( 0 )
	f34_arg0.FlareBack:setScale( 1, 1 )
	f34_arg0.PowerBasedImageUnavailable:setRGB( 1, 1, 1 )
	f34_arg0.PowerBasedImageUnavailable:setAlpha( 0 )
	f34_arg0.PowerBasedImageAvailable:setAlpha( 1 )
	f34_arg0.FullBackingDeployed:setRGB( 0.84, 0.83, 0.77 )
	f34_arg0.FullBackingDeployed:setAlpha( 0 )
	f34_arg0.AmmoWidgetAbilityContainer:setAlpha( 0 )
	f34_arg0.Glow:setAlpha( 0 )
	f34_arg0.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	f34_arg0.SecondaryWeaponBG:setAlpha( 1 )
	f34_arg0.SecondaryWeaponMeterBG:setAlpha( 1 )
	f34_arg0.SecondaryWeaponMeterBGBlur:setAlpha( 1 )
	f34_arg0.SecondaryWeaponBGBlur:setAlpha( 1 )
	f34_arg0.EquipmentBacking:setAlpha( 0.6 )
	f34_arg0.ClockMeter:setAlpha( 0 )
	f34_arg0.ClockMeterAdd:setAlpha( 0 )
end

CoD.AmmoWidgetZM_AbilityItem.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f35_arg0, f35_arg1 )
			f35_arg0:__resetProperties()
			f35_arg0:setupElementClipCounter( 3 )
			f35_arg0.FlareBack:completeAnimation()
			f35_arg0.FlareBack:setAlpha( 0 )
			f35_arg0.clipFinished( f35_arg0.FlareBack )
			f35_arg0.NotAvailable:completeAnimation()
			f35_arg0.NotAvailable:setAlpha( 1 )
			f35_arg0.clipFinished( f35_arg0.NotAvailable )
			f35_arg0.HeroAbilityUseString:completeAnimation()
			f35_arg0.HeroAbilityUseString:setRGB( 0.47, 0.47, 0.47 )
			f35_arg0.HeroAbilityUseString:setAlpha( 0 )
			f35_arg0.clipFinished( f35_arg0.HeroAbilityUseString )
			f35_arg0.nextClip = "DefaultClip"
		end
	},
	Hidden = {
		DefaultClip = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 12 )
			f36_arg0.SecondaryWeaponBGBlur:completeAnimation()
			f36_arg0.SecondaryWeaponBGBlur:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.SecondaryWeaponBGBlur )
			f36_arg0.SecondaryWeaponBG:completeAnimation()
			f36_arg0.SecondaryWeaponBG:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.SecondaryWeaponBG )
			f36_arg0.SecondaryWeaponMeterBGBlur:completeAnimation()
			f36_arg0.SecondaryWeaponMeterBGBlur:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.SecondaryWeaponMeterBGBlur )
			f36_arg0.SecondaryWeaponMeterBG:completeAnimation()
			f36_arg0.SecondaryWeaponMeterBG:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.SecondaryWeaponMeterBG )
			f36_arg0.Glow:completeAnimation()
			f36_arg0.Glow:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.Glow )
			f36_arg0.AmmoWidgetAbilityContainer:completeAnimation()
			f36_arg0.AmmoWidgetAbilityContainer:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.AmmoWidgetAbilityContainer )
			f36_arg0.FullBackingDeployed:completeAnimation()
			f36_arg0.FullBackingDeployed:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.FullBackingDeployed )
			f36_arg0.EquipmentBacking:completeAnimation()
			f36_arg0.EquipmentBacking:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.EquipmentBacking )
			f36_arg0.PowerBasedImageAvailable:completeAnimation()
			f36_arg0.PowerBasedImageAvailable:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.PowerBasedImageAvailable )
			f36_arg0.PowerBasedImageUnavailable:completeAnimation()
			f36_arg0.PowerBasedImageUnavailable:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.PowerBasedImageUnavailable )
			f36_arg0.NotAvailable:completeAnimation()
			f36_arg0.NotAvailable:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.NotAvailable )
			f36_arg0.HeroAbilityUseString:completeAnimation()
			f36_arg0.HeroAbilityUseString:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.HeroAbilityUseString )
		end
	},
	InUse = {
		DefaultClip = function ( f37_arg0, f37_arg1 )
			f37_arg0:__resetProperties()
			f37_arg0:setupElementClipCounter( 4 )
			f37_arg0.ClockMeter:completeAnimation()
			f37_arg0.ClockMeter:setAlpha( 1 )
			f37_arg0.clipFinished( f37_arg0.ClockMeter )
			f37_arg0.ClockMeterAdd:completeAnimation()
			f37_arg0.ClockMeterAdd:setAlpha( 1 )
			f37_arg0.clipFinished( f37_arg0.ClockMeterAdd )
			f37_arg0.NotAvailable:completeAnimation()
			f37_arg0.NotAvailable:setAlpha( 0 )
			f37_arg0.clipFinished( f37_arg0.NotAvailable )
			f37_arg0.HeroAbilityUseString:completeAnimation()
			f37_arg0.HeroAbilityUseString:setAlpha( 0 )
			f37_arg0.clipFinished( f37_arg0.HeroAbilityUseString )
			f37_arg0.nextClip = "DefaultClip"
		end
	},
	Deployed = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 2 )
			f38_arg0.NotAvailable:completeAnimation()
			f38_arg0.NotAvailable:setAlpha( 1 )
			f38_arg0.clipFinished( f38_arg0.NotAvailable )
			f38_arg0.HeroAbilityUseString:completeAnimation()
			f38_arg0.HeroAbilityUseString:setRGB( 0.47, 0.47, 0.47 )
			f38_arg0.HeroAbilityUseString:setAlpha( 1 )
			f38_arg0.clipFinished( f38_arg0.HeroAbilityUseString )
		end
	},
	PowerBasedEmptyCharging = {
		DefaultClip = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 5 )
			f39_arg0.FullBackingDeployed:completeAnimation()
			f39_arg0.FullBackingDeployed:setRGB( 1, 1, 1 )
			f39_arg0.FullBackingDeployed:setAlpha( 0.03 )
			f39_arg0.clipFinished( f39_arg0.FullBackingDeployed )
			f39_arg0.PowerBasedImageAvailable:completeAnimation()
			f39_arg0.PowerBasedImageAvailable:setAlpha( 0 )
			f39_arg0.clipFinished( f39_arg0.PowerBasedImageAvailable )
			f39_arg0.PowerBasedImageUnavailable:completeAnimation()
			f39_arg0.PowerBasedImageUnavailable:setAlpha( 1 )
			f39_arg0.clipFinished( f39_arg0.PowerBasedImageUnavailable )
			f39_arg0.NotAvailable:completeAnimation()
			f39_arg0.NotAvailable:setAlpha( 1 )
			f39_arg0.clipFinished( f39_arg0.NotAvailable )
			f39_arg0.HeroAbilityUseString:completeAnimation()
			f39_arg0.HeroAbilityUseString:setAlpha( 0 )
			f39_arg0.clipFinished( f39_arg0.HeroAbilityUseString )
		end
	},
	PowerBasedCharging = {
		DefaultClip = function ( f40_arg0, f40_arg1 )
			f40_arg0:__resetProperties()
			f40_arg0:setupElementClipCounter( 6 )
			f40_arg0.ClockMeter:completeAnimation()
			f40_arg0.ClockMeter:setAlpha( 1 )
			f40_arg0.clipFinished( f40_arg0.ClockMeter )
			f40_arg0.FullBackingDeployed:completeAnimation()
			f40_arg0.FullBackingDeployed:setAlpha( 0 )
			f40_arg0.clipFinished( f40_arg0.FullBackingDeployed )
			f40_arg0.PowerBasedImageAvailable:completeAnimation()
			f40_arg0.PowerBasedImageAvailable:setAlpha( 0 )
			f40_arg0.clipFinished( f40_arg0.PowerBasedImageAvailable )
			f40_arg0.PowerBasedImageUnavailable:completeAnimation()
			f40_arg0.PowerBasedImageUnavailable:setRGB( 1, 1, 1 )
			f40_arg0.PowerBasedImageUnavailable:setAlpha( 1 )
			f40_arg0.clipFinished( f40_arg0.PowerBasedImageUnavailable )
			f40_arg0.NotAvailable:completeAnimation()
			f40_arg0.NotAvailable:setAlpha( 1 )
			f40_arg0.clipFinished( f40_arg0.NotAvailable )
			f40_arg0.HeroAbilityUseString:completeAnimation()
			f40_arg0.HeroAbilityUseString:setAlpha( 0 )
			f40_arg0.clipFinished( f40_arg0.HeroAbilityUseString )
		end
	},
	PowerBased = {
		DefaultClip = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 7 )
			f41_arg0.ClockMeter:completeAnimation()
			f41_arg0.ClockMeter:setAlpha( 1 )
			f41_arg0.clipFinished( f41_arg0.ClockMeter )
			local f41_local0 = function ( f42_arg0 )
				local f42_local0 = function ( f43_arg0 )
					local f43_local0 = function ( f44_arg0 )
						f44_arg0:beginAnimation( 2320 )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f41_arg0.clipFinished )
					end
					
					f43_arg0:beginAnimation( 340 )
					f43_arg0:setAlpha( 0 )
					f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
				end
				
				f41_arg0.ClockMeterAdd:beginAnimation( 340 )
				f41_arg0.ClockMeterAdd:setAlpha( 1 )
				f41_arg0.ClockMeterAdd:registerEventHandler( "interrupted_keyframe", f41_arg0.clipInterrupted )
				f41_arg0.ClockMeterAdd:registerEventHandler( "transition_complete_keyframe", f42_local0 )
			end
			
			f41_arg0.ClockMeterAdd:completeAnimation()
			f41_arg0.ClockMeterAdd:setAlpha( 0 )
			f41_local0( f41_arg0.ClockMeterAdd )
			f41_arg0.FlareBack:completeAnimation()
			f41_arg0.FlareBack:setAlpha( 0 )
			f41_arg0.FlareBack:setScale( 0.5, 0.5 )
			f41_arg0.clipFinished( f41_arg0.FlareBack )
			f41_arg0.Glow:completeAnimation()
			f41_arg0.Glow:setAlpha( 0.1 )
			f41_arg0.Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
			f41_arg0.clipFinished( f41_arg0.Glow )
			f41_arg0.PowerBasedImageUnavailable:completeAnimation()
			f41_arg0.PowerBasedImageUnavailable:setRGB( 0.74, 0.69, 0.42 )
			f41_arg0.PowerBasedImageUnavailable:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.PowerBasedImageUnavailable )
			f41_arg0.NotAvailable:completeAnimation()
			f41_arg0.NotAvailable:setAlpha( 1 )
			f41_arg0.clipFinished( f41_arg0.NotAvailable )
			f41_arg0.HeroAbilityUseString:completeAnimation()
			f41_arg0.HeroAbilityUseString:setRGB( 1, 1, 1 )
			f41_arg0.HeroAbilityUseString:setAlpha( 1 )
			f41_arg0.clipFinished( f41_arg0.HeroAbilityUseString )
			f41_arg0.nextClip = "DefaultClip"
		end,
		Pulse = function ( f45_arg0, f45_arg1 )
			f45_arg0:__resetProperties()
			f45_arg0:setupElementClipCounter( 3 )
			f45_arg0.ClockMeter:completeAnimation()
			f45_arg0.ClockMeter:setAlpha( 1 )
			f45_arg0.clipFinished( f45_arg0.ClockMeter )
			local f45_local0 = function ( f46_arg0 )
				local f46_local0 = function ( f47_arg0 )
					local f47_local0 = function ( f48_arg0 )
						f48_arg0:beginAnimation( 2320 )
						f48_arg0:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
					end
					
					f47_arg0:beginAnimation( 340 )
					f47_arg0:setAlpha( 0 )
					f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
				end
				
				f45_arg0.ClockMeterAdd:beginAnimation( 340 )
				f45_arg0.ClockMeterAdd:setAlpha( 1 )
				f45_arg0.ClockMeterAdd:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.ClockMeterAdd:registerEventHandler( "transition_complete_keyframe", f46_local0 )
			end
			
			f45_arg0.ClockMeterAdd:completeAnimation()
			f45_arg0.ClockMeterAdd:setAlpha( 0 )
			f45_local0( f45_arg0.ClockMeterAdd )
			f45_arg0.NotAvailable:completeAnimation()
			f45_arg0.NotAvailable:setAlpha( 1 )
			f45_arg0.clipFinished( f45_arg0.NotAvailable )
			f45_arg0.nextClip = "Pulse"
		end
	}
}
CoD.AmmoWidgetZM_AbilityItem.__onClose = function ( f49_arg0 )
	f49_arg0.ClockMeter:close()
	f49_arg0.ClockMeterAdd:close()
	f49_arg0.AmmoWidgetAbilityContainer:close()
	f49_arg0.PowerBasedImageAvailable:close()
	f49_arg0.PowerBasedImageUnavailable:close()
	f49_arg0.NotAvailable:close()
	f49_arg0.HeroAbilityUseString:close()
	f49_arg0.HeroAbilityHoldString:close()
	f49_arg0.HeroAbilityHoldStringPC:close()
end

