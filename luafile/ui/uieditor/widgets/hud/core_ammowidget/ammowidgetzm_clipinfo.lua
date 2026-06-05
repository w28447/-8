require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_clipcontainerhero" )
require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_clipcontainernew" )

CoD.AmmoWidgetZM_ClipInfo = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_ClipInfo.__defaultWidth = 120
CoD.AmmoWidgetZM_ClipInfo.__defaultHeight = 80
CoD.AmmoWidgetZM_ClipInfo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_ClipInfo )
	self.id = "AmmoWidgetZM_ClipInfo"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Clip = CoD.AmmoWidgetZM_ClipContainerNew.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 0, 1.5, 51.5 )
	Clip:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				local f2_local0 = IsLowAmmoClip( f1_arg1 )
				if f2_local0 then
					f2_local0 = WeaponHasAmmo( f1_arg1 )
					if f2_local0 then
						f2_local0 = not IsSignatureWeaponInUse( f1_arg1 )
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f3_local0
				if not WeaponHasAmmo( f1_arg1 ) then
					f3_local0 = CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 )
					if f3_local0 then
						f3_local0 = not CoD.HUDUtility.IsCurrentViewmodelWeaponGamemodeHiddenAmmo( f1_arg1 )
					end
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return IsSignatureWeaponInUse( f1_arg1 )
			end
		}
	} )
	local ClipHero = Clip
	local ClipDual = Clip.subscribeToModel
	local ClipOnly = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipDual( ClipHero, ClipOnly.ammoLow, function ( f5_arg0 )
		f1_arg0:updateElementState( Clip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "ammoLow"
		} )
	end, false )
	ClipHero = Clip
	ClipDual = Clip.subscribeToModel
	ClipOnly = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipDual( ClipHero, ClipOnly.weaponHasAmmo, function ( f6_arg0 )
		f1_arg0:updateElementState( Clip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "weaponHasAmmo"
		} )
	end, false )
	ClipHero = Clip
	ClipDual = Clip.subscribeToModel
	ClipOnly = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipDual( ClipHero, ClipOnly.equippedWeaponReference, function ( f7_arg0 )
		f1_arg0:updateElementState( Clip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "equippedWeaponReference"
		} )
	end, false )
	ClipHero = Clip
	ClipDual = Clip.subscribeToModel
	ClipOnly = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipDual( ClipHero, ClipOnly.viewmodelWeaponName, function ( f8_arg0 )
		f1_arg0:updateElementState( Clip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "viewmodelWeaponName"
		} )
	end, false )
	Clip:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			Clip.Clip.ClipShadow:setText( f9_local0 )
		end
	end )
	Clip:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			Clip.Clip.Clip:setText( f10_local0 )
		end
	end )
	Clip:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			Clip.ClipContainerPress.Clip:setText( f11_local0 )
		end
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	ClipDual = CoD.AmmoWidgetZM_ClipContainerNew.new( f1_arg0, f1_arg1, 1, 1, -198, -10, 1, 1, -89.5, 27.5 )
	ClipDual:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoDWClip( f1_arg1 )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	ClipOnly = ClipDual
	ClipHero = ClipDual.subscribeToModel
	local TotalAmmoLabel = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipHero( ClipOnly, TotalAmmoLabel.ammoDWLow, function ( f15_arg0 )
		f1_arg0:updateElementState( ClipDual, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "ammoDWLow"
		} )
	end, false )
	ClipDual:setAlpha( 0 )
	ClipDual:setZoom( 3 )
	ClipDual:linkToElementModel( self, "ammoInDWClip", true, function ( model )
		local f16_local0 = model:get()
		if f16_local0 ~= nil then
			ClipDual.Clip.ClipShadow:setText( f16_local0 )
		end
	end )
	ClipDual:linkToElementModel( self, "ammoInDWClip", true, function ( model )
		local f17_local0 = model:get()
		if f17_local0 ~= nil then
			ClipDual.Clip.Clip:setText( f17_local0 )
		end
	end )
	ClipDual:linkToElementModel( self, "ammoInDWClip", true, function ( model )
		local f18_local0 = model:get()
		if f18_local0 ~= nil then
			ClipDual.ClipContainerPress.Clip:setText( f18_local0 )
		end
	end )
	self:addElement( ClipDual )
	self.ClipDual = ClipDual
	
	ClipHero = CoD.AmmoWidgetZM_ClipContainerHero.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 17, 17 )
	ClipHero:mergeStateConditions( {
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.UsingPlayerGadgetWithBar( f1_arg1 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg1, "PlayerAbilities", "playerGadget3.state", Enum[0xF0447219F15F7F3][0x1873A43E9D1620E] )
			end
		},
		{
			stateName = "Ability",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.UsingPlayerGadgetWithBar( f1_arg1 )
			end
		}
	} )
	TotalAmmoLabel = ClipHero
	ClipOnly = ClipHero.subscribeToModel
	local TabBottomLine = DataSources.PlayerAbilities.getModel( f1_arg1 )
	ClipOnly( TotalAmmoLabel, TabBottomLine["playerGadget2.state"], function ( f21_arg0 )
		f1_arg0:updateElementState( ClipHero, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f21_arg0:get(),
			modelName = "playerGadget2.state"
		} )
	end, false )
	TotalAmmoLabel = ClipHero
	ClipOnly = ClipHero.subscribeToModel
	TabBottomLine = DataSources.PlayerAbilities.getModel( f1_arg1 )
	ClipOnly( TotalAmmoLabel, TabBottomLine["playerGadget3.state"], function ( f22_arg0 )
		f1_arg0:updateElementState( ClipHero, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "playerGadget3.state"
		} )
	end, false )
	TotalAmmoLabel = ClipHero
	ClipOnly = ClipHero.subscribeToModel
	TabBottomLine = DataSources.CurrentWeapon.getModel( f1_arg1 )
	ClipOnly( TotalAmmoLabel, TabBottomLine.viewmodelWeaponName, function ( f23_arg0 )
		f1_arg0:updateElementState( ClipHero, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "viewmodelWeaponName"
		} )
	end, false )
	ClipHero:setAlpha( 0 )
	ClipHero:setZoom( 3 )
	self:addElement( ClipHero )
	self.ClipHero = ClipHero
	
	ClipOnly = CoD.AmmoWidgetZM_ClipContainerNew.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0.5, 0.5, -37.5, 37.5 )
	ClipOnly:mergeStateConditions( {
		{
			stateName = "LowAmmo",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( f1_arg1 ) and WeaponHasAmmo( f1_arg1 )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				local f25_local0
				if not WeaponHasAmmo( f1_arg1 ) then
					f25_local0 = CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 )
				else
					f25_local0 = false
				end
				return f25_local0
			end
		},
		{
			stateName = "Hero",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	TabBottomLine = ClipOnly
	TotalAmmoLabel = ClipOnly.subscribeToModel
	local TabBottomLine2 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	TotalAmmoLabel( TabBottomLine, TabBottomLine2.ammoLow, function ( f27_arg0 )
		f1_arg0:updateElementState( ClipOnly, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f27_arg0:get(),
			modelName = "ammoLow"
		} )
	end, false )
	TabBottomLine = ClipOnly
	TotalAmmoLabel = ClipOnly.subscribeToModel
	TabBottomLine2 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	TotalAmmoLabel( TabBottomLine, TabBottomLine2.weaponHasAmmo, function ( f28_arg0 )
		f1_arg0:updateElementState( ClipOnly, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f28_arg0:get(),
			modelName = "weaponHasAmmo"
		} )
	end, false )
	TabBottomLine = ClipOnly
	TotalAmmoLabel = ClipOnly.subscribeToModel
	TabBottomLine2 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	TotalAmmoLabel( TabBottomLine, TabBottomLine2.equippedWeaponReference, function ( f29_arg0 )
		f1_arg0:updateElementState( ClipOnly, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f29_arg0:get(),
			modelName = "equippedWeaponReference"
		} )
	end, false )
	ClipOnly:setAlpha( 0 )
	ClipOnly:setScale( 0.8, 0.8 )
	ClipOnly:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f30_local0 = model:get()
		if f30_local0 ~= nil then
			ClipOnly.Clip.ClipShadow:setText( f30_local0 )
		end
	end )
	ClipOnly:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f31_local0 = model:get()
		if f31_local0 ~= nil then
			ClipOnly.Clip.Clip:setText( f31_local0 )
		end
	end )
	ClipOnly:linkToElementModel( self, "ammoInClip", true, function ( model )
		local f32_local0 = model:get()
		if f32_local0 ~= nil then
			ClipOnly.ClipContainerPress.Clip:setText( f32_local0 )
		end
	end )
	self:addElement( ClipOnly )
	self.ClipOnly = ClipOnly
	
	TotalAmmoLabel = LUI.UIText.new( 0, 1, 0, 0, 0, 0, 55, 75 )
	TotalAmmoLabel:setRGB( ColorSet.T8__OFF__GRAY.r, ColorSet.T8__OFF__GRAY.g, ColorSet.T8__OFF__GRAY.b )
	TotalAmmoLabel:setTTF( "skorzhen" )
	TotalAmmoLabel:setLetterSpacing( 2 )
	TotalAmmoLabel:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	TotalAmmoLabel:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	TotalAmmoLabel:linkToElementModel( self, "ammoStock", true, function ( model )
		local f33_local0 = model:get()
		if f33_local0 ~= nil then
			TotalAmmoLabel:setText( f33_local0 )
		end
	end )
	self:addElement( TotalAmmoLabel )
	self.TotalAmmoLabel = TotalAmmoLabel
	
	TabBottomLine = LUI.UIImage.new( 0.2, 0.8, 0, 0, 0, 0, 46.5, 50.5 )
	TabBottomLine:setAlpha( 0.5 )
	TabBottomLine:setImage( RegisterImage( "uie_ui_menu_common_tab_line_bottom" ) )
	TabBottomLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabBottomLine )
	self.TabBottomLine = TabBottomLine
	
	TabBottomLine2 = LUI.UIImage.new( 0.1, 0.1, 30.5, 65.5, 0, 0, 23, 18 )
	TabBottomLine2:setAlpha( 0 )
	TabBottomLine2:setZRot( 90 )
	TabBottomLine2:setImage( RegisterImage( "uie_ui_menu_common_tab_line_bottom" ) )
	TabBottomLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabBottomLine2 )
	self.TabBottomLine2 = TabBottomLine2
	
	self:mergeStateConditions( {
		{
			stateName = "HiddenGamemodeWeapon",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsCurrentViewmodelWeaponGamemodeHiddenAmmo( f1_arg1 )
			end
		},
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.UsingPlayerGadgetWithBar( f1_arg1 )
			end
		},
		{
			stateName = "ClipOnly",
			condition = function ( menu, element, event )
				return CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 ) and CoD.WeaponUtility.CurrentZMWeaponIsClipOnlyAmmo( f1_arg1 )
			end
		},
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				local f37_local0 = CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 )
				if f37_local0 then
					f37_local0 = CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f1_arg1, "CurrentWeapon", "ammoInDWClip", -1 )
					if f37_local0 then
						f37_local0 = not CoD.HUDUtility.IsCurrentViewmodelWeaponGamemodeHiddenDWAmmo( f1_arg1 )
					end
				end
				return f37_local0
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 ) and not IsWeaponClipGreaterThanOrEqualTo( f1_arg1, 100 )
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return CoD.WeaponUtility.CurrentZMWeaponUsesAmmo( f1_arg1 ) and IsWeaponClipGreaterThanOrEqualTo( f1_arg1, 100 )
			end
		}
	} )
	local f1_local8 = self
	local f1_local9 = self.subscribeToModel
	local f1_local10 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.viewmodelWeaponName, function ( f40_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f40_arg0:get(),
			modelName = "viewmodelWeaponName"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.PlayerAbilities.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10["playerGadget2.state"], function ( f41_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f41_arg0:get(),
			modelName = "playerGadget2.state"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.PlayerAbilities.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10["playerGadget3.state"], function ( f42_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f42_arg0:get(),
			modelName = "playerGadget3.state"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.equippedWeaponReference, function ( f43_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f43_arg0:get(),
			modelName = "equippedWeaponReference"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.isClipOnly, function ( f44_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f44_arg0:get(),
			modelName = "isClipOnly"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.ammoInDWClip, function ( f45_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f45_arg0:get(),
			modelName = "ammoInDWClip"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = DataSources.CurrentWeapon.getModel( f1_arg1 )
	f1_local9( f1_local8, f1_local10.clipMaxAmmo, function ( f46_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f46_arg0:get(),
			modelName = "clipMaxAmmo"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_ClipInfo.__resetProperties = function ( f47_arg0 )
	f47_arg0.TabBottomLine2:completeAnimation()
	f47_arg0.TabBottomLine:completeAnimation()
	f47_arg0.TotalAmmoLabel:completeAnimation()
	f47_arg0.ClipOnly:completeAnimation()
	f47_arg0.ClipHero:completeAnimation()
	f47_arg0.ClipDual:completeAnimation()
	f47_arg0.Clip:completeAnimation()
	f47_arg0.TabBottomLine2:setLeftRight( 0.1, 0.1, 30.5, 65.5 )
	f47_arg0.TabBottomLine2:setAlpha( 0 )
	f47_arg0.TabBottomLine:setAlpha( 0.5 )
	f47_arg0.TotalAmmoLabel:setAlpha( 1 )
	f47_arg0.ClipOnly:setAlpha( 0 )
	f47_arg0.ClipHero:setLeftRight( 0, 1, 0, 0 )
	f47_arg0.ClipHero:setTopBottom( 0, 1, 17, 17 )
	f47_arg0.ClipHero:setRGB( 1, 1, 1 )
	f47_arg0.ClipHero:setAlpha( 0 )
	f47_arg0.ClipDual:setLeftRight( 1, 1, -198, -10 )
	f47_arg0.ClipDual:setTopBottom( 1, 1, -89.5, 27.5 )
	f47_arg0.ClipDual:setAlpha( 0 )
	f47_arg0.Clip:setLeftRight( 0, 1, 0, 0 )
	f47_arg0.Clip:setTopBottom( 0, 0, 1.5, 51.5 )
	f47_arg0.Clip:setAlpha( 1 )
end

CoD.AmmoWidgetZM_ClipInfo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f48_arg0, f48_arg1 )
			f48_arg0:__resetProperties()
			f48_arg0:setupElementClipCounter( 7 )
			f48_arg0.Clip:completeAnimation()
			f48_arg0.Clip:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.Clip )
			f48_arg0.ClipDual:completeAnimation()
			f48_arg0.ClipDual:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.ClipDual )
			f48_arg0.ClipHero:completeAnimation()
			f48_arg0.ClipHero:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.ClipHero )
			f48_arg0.ClipOnly:completeAnimation()
			f48_arg0.ClipOnly:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.ClipOnly )
			f48_arg0.TotalAmmoLabel:completeAnimation()
			f48_arg0.TotalAmmoLabel:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.TotalAmmoLabel )
			f48_arg0.TabBottomLine:completeAnimation()
			f48_arg0.TabBottomLine:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.TabBottomLine )
			f48_arg0.TabBottomLine2:completeAnimation()
			f48_arg0.TabBottomLine2:setAlpha( 0 )
			f48_arg0.clipFinished( f48_arg0.TabBottomLine2 )
		end
	},
	HiddenGamemodeWeapon = {
		DefaultClip = function ( f49_arg0, f49_arg1 )
			f49_arg0:__resetProperties()
			f49_arg0:setupElementClipCounter( 7 )
			f49_arg0.Clip:completeAnimation()
			f49_arg0.Clip:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.Clip )
			f49_arg0.ClipDual:completeAnimation()
			f49_arg0.ClipDual:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.ClipDual )
			f49_arg0.ClipHero:completeAnimation()
			f49_arg0.ClipHero:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.ClipHero )
			f49_arg0.ClipOnly:completeAnimation()
			f49_arg0.ClipOnly:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.ClipOnly )
			f49_arg0.TotalAmmoLabel:completeAnimation()
			f49_arg0.TotalAmmoLabel:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.TotalAmmoLabel )
			f49_arg0.TabBottomLine:completeAnimation()
			f49_arg0.TabBottomLine:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.TabBottomLine )
			f49_arg0.TabBottomLine2:completeAnimation()
			f49_arg0.TabBottomLine2:setAlpha( 0 )
			f49_arg0.clipFinished( f49_arg0.TabBottomLine2 )
		end
	},
	HeroWeapon = {
		DefaultClip = function ( f50_arg0, f50_arg1 )
			f50_arg0:__resetProperties()
			f50_arg0:setupElementClipCounter( 4 )
			f50_arg0.Clip:completeAnimation()
			f50_arg0.Clip:setAlpha( 0 )
			f50_arg0.clipFinished( f50_arg0.Clip )
			f50_arg0.ClipHero:completeAnimation()
			f50_arg0.ClipHero:setLeftRight( 0, 1, 0, 0 )
			f50_arg0.ClipHero:setTopBottom( 0, 1, 0, 0 )
			f50_arg0.ClipHero:setRGB( 1, 1, 1 )
			f50_arg0.ClipHero:setAlpha( 1 )
			f50_arg0.clipFinished( f50_arg0.ClipHero )
			f50_arg0.TotalAmmoLabel:completeAnimation()
			f50_arg0.TotalAmmoLabel:setAlpha( 0 )
			f50_arg0.clipFinished( f50_arg0.TotalAmmoLabel )
			f50_arg0.TabBottomLine:completeAnimation()
			f50_arg0.TabBottomLine:setAlpha( 0 )
			f50_arg0.clipFinished( f50_arg0.TabBottomLine )
		end
	},
	ClipOnly = {
		DefaultClip = function ( f51_arg0, f51_arg1 )
			f51_arg0:__resetProperties()
			f51_arg0:setupElementClipCounter( 5 )
			f51_arg0.Clip:completeAnimation()
			f51_arg0.Clip:setLeftRight( 0, 1, 0, 0 )
			f51_arg0.Clip:setTopBottom( 0, 0, 2.5, 77.5 )
			f51_arg0.Clip:setAlpha( 0 )
			f51_arg0.clipFinished( f51_arg0.Clip )
			f51_arg0.ClipHero:completeAnimation()
			f51_arg0.ClipHero:setLeftRight( 0, 1, 0, 0 )
			f51_arg0.ClipHero:setTopBottom( 0, 1, 0, 0 )
			f51_arg0.ClipHero:setRGB( 1, 1, 1 )
			f51_arg0.ClipHero:setAlpha( 0 )
			f51_arg0.clipFinished( f51_arg0.ClipHero )
			f51_arg0.ClipOnly:completeAnimation()
			f51_arg0.ClipOnly:setAlpha( 1 )
			f51_arg0.clipFinished( f51_arg0.ClipOnly )
			f51_arg0.TotalAmmoLabel:completeAnimation()
			f51_arg0.TotalAmmoLabel:setAlpha( 0 )
			f51_arg0.clipFinished( f51_arg0.TotalAmmoLabel )
			f51_arg0.TabBottomLine:completeAnimation()
			f51_arg0.TabBottomLine:setAlpha( 0 )
			f51_arg0.clipFinished( f51_arg0.TabBottomLine )
		end
	},
	WeaponDual = {
		DefaultClip = function ( f52_arg0, f52_arg1 )
			f52_arg0:__resetProperties()
			f52_arg0:setupElementClipCounter( 4 )
			f52_arg0.Clip:completeAnimation()
			f52_arg0.Clip:setLeftRight( 0.45, 0.95, 0, 0 )
			f52_arg0.Clip:setTopBottom( 0, 0, 10.5, 44.5 )
			f52_arg0.clipFinished( f52_arg0.Clip )
			f52_arg0.ClipDual:completeAnimation()
			f52_arg0.ClipDual:setLeftRight( 0, 0.5, 6, 6 )
			f52_arg0.ClipDual:setTopBottom( 0, 0, 10.5, 44.5 )
			f52_arg0.ClipDual:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.ClipDual )
			f52_arg0.ClipHero:completeAnimation()
			f52_arg0.ClipHero:setLeftRight( 1, 1, -218, -30 )
			f52_arg0.ClipHero:setTopBottom( 1, 1, -78.5, 38.5 )
			f52_arg0.clipFinished( f52_arg0.ClipHero )
			f52_arg0.TabBottomLine2:completeAnimation()
			f52_arg0.TabBottomLine2:setLeftRight( 0.1, 0.1, 28.5, 67.5 )
			f52_arg0.TabBottomLine2:setAlpha( 0.5 )
			f52_arg0.clipFinished( f52_arg0.TabBottomLine2 )
		end
	},
	Weapon = {
		DefaultClip = function ( f53_arg0, f53_arg1 )
			f53_arg0:__resetProperties()
			f53_arg0:setupElementClipCounter( 0 )
		end
	},
	Weapon3Digits = {
		DefaultClip = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 1 )
			f54_arg0.ClipHero:completeAnimation()
			f54_arg0.ClipHero:setLeftRight( 1, 2, -248, -248 )
			f54_arg0.ClipHero:setTopBottom( 1, 2, -96, -96 )
			f54_arg0.clipFinished( f54_arg0.ClipHero )
		end,
		HeroWeapon = function ( f55_arg0, f55_arg1 )
			f55_arg0:__resetProperties()
			f55_arg0:setupElementClipCounter( 1 )
			f55_arg0.ClipHero:completeAnimation()
			f55_arg0.ClipHero:setAlpha( 1 )
			f55_arg0.clipFinished( f55_arg0.ClipHero )
		end
	}
}
CoD.AmmoWidgetZM_ClipInfo.__onClose = function ( f56_arg0 )
	f56_arg0.Clip:close()
	f56_arg0.ClipDual:close()
	f56_arg0.ClipHero:close()
	f56_arg0.ClipOnly:close()
	f56_arg0.TotalAmmoLabel:close()
end

