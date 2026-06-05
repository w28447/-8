require( "ui/uieditor/widgets/hud/zm_ammowidgetfactory/zmammofactory" )

CoD.ZmAmmoContainerFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmoContainerFactory.__defaultWidth = 510
CoD.ZmAmmoContainerFactory.__defaultHeight = 373
CoD.ZmAmmoContainerFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmoContainerFactory )
	self.id = "ZmAmmoContainerFactory"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local bgbGlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, 27, 466, 0.5, 0.5, -252.5, 253.5 )
	bgbGlowOrangeOver:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	bgbGlowOrangeOver:setAlpha( 0 )
	bgbGlowOrangeOver:setZRot( 90 )
	bgbGlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbGlowOrangeOver )
	self.bgbGlowOrangeOver = bgbGlowOrangeOver
	
	local ZmAmmo = CoD.ZmAmmoFactory.new( f1_arg0, f1_arg1, 0, 0, 0, 510, 0, 0, 0, 374 )
	ZmAmmo:mergeStateConditions( {
		{
			stateName = "HudStartPC",
			condition = function ( menu, element, event )
				local f2_local0 = IsPC()
				if f2_local0 then
					f2_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
					if f2_local0 then
						if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
							f2_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] )
						else
							f2_local0 = false
						end
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f3_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
				if f3_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
						f3_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		}
	} )
	local bgbAbilitySwirl = ZmAmmo
	local CrossAbilities = ZmAmmo.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["hudItems.playerSpawned"], function ( f4_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "hudItems.playerSpawned"
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f5_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f6_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f7_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f8_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]], function ( f9_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f10_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f11_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f12_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f13_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f14_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f15_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f16_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f17_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f18_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	bgbAbilitySwirl = ZmAmmo
	CrossAbilities = ZmAmmo.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	CrossAbilities( bgbAbilitySwirl, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]], function ( f19_arg0 )
		f1_arg0:updateElementState( ZmAmmo, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]
		} )
	end, false )
	self:addElement( ZmAmmo )
	self.ZmAmmo = ZmAmmo
	
	CrossAbilities = LUI.UIImage.new( 0, 0, 288, 709, 0, 0, 30, 344 )
	CrossAbilities:setImage( RegisterImage( "uie_cross_abilities" ) )
	CrossAbilities:subscribeToGlobalModel( f1_arg1, "ZMHudGlobal", "trials.disableAbilities", function ( model )
		local f20_local0 = model:get()
		if f20_local0 ~= nil then
			CrossAbilities:setAlpha( f20_local0 )
		end
	end )
	self:addElement( CrossAbilities )
	self.CrossAbilities = CrossAbilities
	
	bgbAbilitySwirl = LUI.UIImage.new( 0.5, 0.5, 126.5, 365.5, 0, 0, 71, 307 )
	bgbAbilitySwirl:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	bgbAbilitySwirl:setAlpha( 0 )
	bgbAbilitySwirl:setZRot( 330 )
	bgbAbilitySwirl:setScale( 1.65, 1.65 )
	bgbAbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	bgbAbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbAbilitySwirl )
	self.bgbAbilitySwirl = bgbAbilitySwirl
	
	self:mergeStateConditions( {
		{
			stateName = "ScoreboardPC",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f1_arg1, "ZMHudGlobal", "isScoreboardPCOpen" )
			end
		},
		{
			stateName = "hiddenTutorial",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztutorial" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "hudItems.ztut.showElixirs", 0 )
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f23_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
				if f23_local0 then
					f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] )
					if not f23_local0 then
						f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] )
						if not f23_local0 then
							f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] )
							if not f23_local0 then
								f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] )
								if not f23_local0 then
									f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] )
									if not f23_local0 then
										if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) then
											f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] )
											if not f23_local0 then
												f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] )
												if not f23_local0 then
													f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] )
													if not f23_local0 then
														f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] )
														if not f23_local0 then
															f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] )
															if not f23_local0 then
																f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] )
																if not f23_local0 then
																	f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] )
																	if not f23_local0 then
																		f23_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
																		if not f23_local0 then
																			f23_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] )
																		end
																	end
																end
															end
														end
													end
												end
											end
										else
											f23_local0 = true
										end
									end
								end
							end
						end
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "ScoreboardKeyboardMouse",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and IsMouseOrKeyboard( f1_arg1 )
			end
		},
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] )
			end
		}
	} )
	local f1_local6 = self
	f1_local5 = self.subscribeToModel
	local f1_local7 = DataSources.ZMHudGlobal.getModel( f1_arg1 )
	f1_local5( f1_local6, f1_local7.isScoreboardPCOpen, function ( f26_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f26_arg0:get(),
			modelName = "isScoreboardPCOpen"
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetGlobalModel()
	f1_local5( f1_local6, f1_local7["hudItems.ztut.showElixirs"], function ( f27_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f27_arg0:get(),
			modelName = "hudItems.ztut.showElixirs"
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["hudItems.playerSpawned"], function ( f28_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f28_arg0:get(),
			modelName = "hudItems.playerSpawned"
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f29_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f29_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f30_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f30_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f31_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f31_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f32_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f32_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]], function ( f33_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f33_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f34_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f34_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f35_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f35_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f36_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f36_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f37_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f37_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f38_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f38_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f39_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f39_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f40_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f40_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f41_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f41_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f42_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f42_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]], function ( f43_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f43_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]
		} )
	end, false )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f44_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f44_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f45_arg0, f45_arg1 )
		f45_arg1.menu = f45_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f45_arg1 )
	end )
	f1_local6 = self
	f1_local5 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local6, f1_local7.LastInput, function ( f46_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f46_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmoContainerFactory.__resetProperties = function ( f47_arg0 )
	f47_arg0.ZmAmmo:completeAnimation()
	f47_arg0.CrossAbilities:completeAnimation()
	f47_arg0.bgbAbilitySwirl:completeAnimation()
	f47_arg0.bgbGlowOrangeOver:completeAnimation()
	f47_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
	f47_arg0.ZmAmmo:setAlpha( 1 )
	f47_arg0.CrossAbilities:setLeftRight( 0, 0, 288, 709 )
	f47_arg0.bgbAbilitySwirl:setAlpha( 0 )
	f47_arg0.bgbAbilitySwirl:setZRot( 330 )
	f47_arg0.bgbGlowOrangeOver:setAlpha( 0 )
end

CoD.ZmAmmoContainerFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f48_arg0, f48_arg1 )
			f48_arg0:__resetProperties()
			f48_arg0:setupElementClipCounter( 0 )
		end,
		Invisible = function ( f49_arg0, f49_arg1 )
			f49_arg0:__resetProperties()
			f49_arg0:setupElementClipCounter( 1 )
			local f49_local0 = function ( f50_arg0 )
				f49_arg0.ZmAmmo:beginAnimation( 150 )
				f49_arg0.ZmAmmo:setAlpha( 0 )
				f49_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
				f49_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
			end
			
			f49_arg0.ZmAmmo:completeAnimation()
			f49_arg0.ZmAmmo:setAlpha( 1 )
			f49_local0( f49_arg0.ZmAmmo )
		end,
		Scoreboard = function ( f51_arg0, f51_arg1 )
			f51_arg0:__resetProperties()
			f51_arg0:setupElementClipCounter( 2 )
			local f51_local0 = function ( f52_arg0 )
				f51_arg0.ZmAmmo:beginAnimation( 150 )
				f51_arg0.ZmAmmo:setLeftRight( 0, 0, -120, 390 )
				f51_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
				f51_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
			end
			
			f51_arg0.ZmAmmo:completeAnimation()
			f51_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
			f51_local0( f51_arg0.ZmAmmo )
			local f51_local1 = function ( f53_arg0 )
				f51_arg0.CrossAbilities:beginAnimation( 150 )
				f51_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
				f51_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f51_arg0.clipInterrupted )
				f51_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f51_arg0.clipFinished )
			end
			
			f51_arg0.CrossAbilities:completeAnimation()
			f51_arg0.CrossAbilities:setLeftRight( 0, 0, 288, 709 )
			f51_local1( f51_arg0.CrossAbilities )
		end,
		ScoreboardPC = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 2 )
			local f54_local0 = function ( f55_arg0 )
				f54_arg0.ZmAmmo:beginAnimation( 150 )
				f54_arg0.ZmAmmo:setAlpha( 0 )
				f54_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
			end
			
			f54_arg0.ZmAmmo:completeAnimation()
			f54_arg0.ZmAmmo:setAlpha( 1 )
			f54_local0( f54_arg0.ZmAmmo )
			local f54_local1 = function ( f56_arg0 )
				f54_arg0.CrossAbilities:beginAnimation( 150 )
				f54_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
			end
			
			f54_arg0.CrossAbilities:completeAnimation()
			f54_local1( f54_arg0.CrossAbilities )
		end
	},
	ScoreboardPC = {
		DefaultClip = function ( f57_arg0, f57_arg1 )
			f57_arg0:__resetProperties()
			f57_arg0:setupElementClipCounter( 2 )
			f57_arg0.ZmAmmo:completeAnimation()
			f57_arg0.ZmAmmo:setAlpha( 0 )
			f57_arg0.clipFinished( f57_arg0.ZmAmmo )
			f57_arg0.CrossAbilities:completeAnimation()
			f57_arg0.clipFinished( f57_arg0.CrossAbilities )
		end,
		DefaultState = function ( f58_arg0, f58_arg1 )
			f58_arg0:__resetProperties()
			f58_arg0:setupElementClipCounter( 2 )
			local f58_local0 = function ( f59_arg0 )
				f58_arg0.ZmAmmo:beginAnimation( 150 )
				f58_arg0.ZmAmmo:setAlpha( 1 )
				f58_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.ZmAmmo:completeAnimation()
			f58_arg0.ZmAmmo:setAlpha( 0 )
			f58_local0( f58_arg0.ZmAmmo )
			local f58_local1 = function ( f60_arg0 )
				f58_arg0.CrossAbilities:beginAnimation( 150 )
				f58_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f58_arg0.clipInterrupted )
				f58_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f58_arg0.clipFinished )
			end
			
			f58_arg0.CrossAbilities:completeAnimation()
			f58_local1( f58_arg0.CrossAbilities )
		end
	},
	hiddenTutorial = {
		DefaultClip = function ( f61_arg0, f61_arg1 )
			f61_arg0:__resetProperties()
			f61_arg0:setupElementClipCounter( 1 )
			f61_arg0.ZmAmmo:completeAnimation()
			f61_arg0.ZmAmmo:setAlpha( 0 )
			f61_arg0.clipFinished( f61_arg0.ZmAmmo )
		end,
		DefaultState = function ( f62_arg0, f62_arg1 )
			f62_arg0:__resetProperties()
			f62_arg0:setupElementClipCounter( 3 )
			local f62_local0 = function ( f63_arg0 )
				local f63_local0 = function ( f64_arg0 )
					local f64_local0 = function ( f65_arg0 )
						local f65_local0 = function ( f66_arg0 )
							local f66_local0 = function ( f67_arg0 )
								local f67_local0 = function ( f68_arg0 )
									local f68_local0 = function ( f69_arg0 )
										f69_arg0:beginAnimation( 200 )
										f69_arg0:setAlpha( 0 )
										f69_arg0:registerEventHandler( "transition_complete_keyframe", f62_arg0.clipFinished )
									end
									
									f68_arg0:beginAnimation( 139 )
									f68_arg0:setAlpha( 0.7 )
									f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
								end
								
								f67_arg0:beginAnimation( 199 )
								f67_arg0:setAlpha( 0 )
								f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
							end
							
							f66_arg0:beginAnimation( 130 )
							f66_arg0:setAlpha( 0.7 )
							f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
						end
						
						f65_arg0:beginAnimation( 170 )
						f65_arg0:setAlpha( 0 )
						f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
					end
					
					f64_arg0:beginAnimation( 160 )
					f64_arg0:setAlpha( 0.7 )
					f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
				end
				
				f62_arg0.bgbGlowOrangeOver:beginAnimation( 330 )
				f62_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f62_arg0.clipInterrupted )
				f62_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f63_local0 )
			end
			
			f62_arg0.bgbGlowOrangeOver:completeAnimation()
			f62_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f62_local0( f62_arg0.bgbGlowOrangeOver )
			local f62_local1 = function ( f70_arg0 )
				local f70_local0 = function ( f71_arg0 )
					local f71_local0 = function ( f72_arg0 )
						f72_arg0:beginAnimation( 340 )
						f72_arg0:setAlpha( 1 )
						f72_arg0:registerEventHandler( "transition_complete_keyframe", f62_arg0.clipFinished )
					end
					
					f71_arg0:beginAnimation( 329 )
					f71_arg0:setAlpha( 0 )
					f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
				end
				
				f70_arg0:beginAnimation( 330 )
				f70_arg0:setAlpha( 1 )
				f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
			end
			
			f62_arg0.ZmAmmo:beginAnimation( 330 )
			f62_arg0.ZmAmmo:setAlpha( 0 )
			f62_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f62_arg0.clipInterrupted )
			f62_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f62_local1 )
			local f62_local2 = function ( f73_arg0 )
				local f73_local0 = function ( f74_arg0 )
					f74_arg0:beginAnimation( 199 )
					f74_arg0:setAlpha( 0 )
					f74_arg0:setZRot( 360 )
					f74_arg0:registerEventHandler( "transition_complete_keyframe", f62_arg0.clipFinished )
				end
				
				f62_arg0.bgbAbilitySwirl:beginAnimation( 330 )
				f62_arg0.bgbAbilitySwirl:setAlpha( 1 )
				f62_arg0.bgbAbilitySwirl:setZRot( 240 )
				f62_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f62_arg0.clipInterrupted )
				f62_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f73_local0 )
			end
			
			f62_arg0.bgbAbilitySwirl:completeAnimation()
			f62_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f62_arg0.bgbAbilitySwirl:setZRot( 0 )
			f62_local2( f62_arg0.bgbAbilitySwirl )
		end
	},
	Invisible = {
		DefaultClip = function ( f75_arg0, f75_arg1 )
			f75_arg0:__resetProperties()
			f75_arg0:setupElementClipCounter( 1 )
			f75_arg0.ZmAmmo:completeAnimation()
			f75_arg0.ZmAmmo:setAlpha( 0 )
			f75_arg0.clipFinished( f75_arg0.ZmAmmo )
		end,
		DefaultState = function ( f76_arg0, f76_arg1 )
			f76_arg0:__resetProperties()
			f76_arg0:setupElementClipCounter( 1 )
			local f76_local0 = function ( f77_arg0 )
				f76_arg0.ZmAmmo:beginAnimation( 150 )
				f76_arg0.ZmAmmo:setAlpha( 1 )
				f76_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f76_arg0.clipInterrupted )
				f76_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f76_arg0.clipFinished )
			end
			
			f76_arg0.ZmAmmo:completeAnimation()
			f76_arg0.ZmAmmo:setAlpha( 0 )
			f76_local0( f76_arg0.ZmAmmo )
		end
	},
	ScoreboardKeyboardMouse = {
		DefaultClip = function ( f78_arg0, f78_arg1 )
			f78_arg0:__resetProperties()
			f78_arg0:setupElementClipCounter( 2 )
			f78_arg0.ZmAmmo:completeAnimation()
			f78_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
			f78_arg0.clipFinished( f78_arg0.ZmAmmo )
			f78_arg0.CrossAbilities:completeAnimation()
			f78_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
			f78_arg0.clipFinished( f78_arg0.CrossAbilities )
		end,
		ScoreboardPC = function ( f79_arg0, f79_arg1 )
			f79_arg0:__resetProperties()
			f79_arg0:setupElementClipCounter( 2 )
			local f79_local0 = function ( f80_arg0 )
				f79_arg0.ZmAmmo:beginAnimation( 150 )
				f79_arg0.ZmAmmo:setAlpha( 0 )
				f79_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f79_arg0.clipInterrupted )
				f79_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f79_arg0.clipFinished )
			end
			
			f79_arg0.ZmAmmo:completeAnimation()
			f79_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
			f79_arg0.ZmAmmo:setAlpha( 1 )
			f79_local0( f79_arg0.ZmAmmo )
			local f79_local1 = function ( f81_arg0 )
				f79_arg0.CrossAbilities:beginAnimation( 150 )
				f79_arg0.CrossAbilities:setLeftRight( 0, 0, 288, 709 )
				f79_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f79_arg0.clipInterrupted )
				f79_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f79_arg0.clipFinished )
			end
			
			f79_arg0.CrossAbilities:completeAnimation()
			f79_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
			f79_local1( f79_arg0.CrossAbilities )
		end
	},
	Scoreboard = {
		DefaultClip = function ( f82_arg0, f82_arg1 )
			f82_arg0:__resetProperties()
			f82_arg0:setupElementClipCounter( 2 )
			f82_arg0.ZmAmmo:completeAnimation()
			f82_arg0.ZmAmmo:setLeftRight( 0, 0, -120, 390 )
			f82_arg0.clipFinished( f82_arg0.ZmAmmo )
			f82_arg0.CrossAbilities:completeAnimation()
			f82_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
			f82_arg0.clipFinished( f82_arg0.CrossAbilities )
		end,
		DefaultState = function ( f83_arg0, f83_arg1 )
			f83_arg0:__resetProperties()
			f83_arg0:setupElementClipCounter( 2 )
			local f83_local0 = function ( f84_arg0 )
				f83_arg0.ZmAmmo:beginAnimation( 150 )
				f83_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
				f83_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f83_arg0.clipInterrupted )
				f83_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f83_arg0.clipFinished )
			end
			
			f83_arg0.ZmAmmo:completeAnimation()
			f83_arg0.ZmAmmo:setLeftRight( 0, 0, -120, 390 )
			f83_local0( f83_arg0.ZmAmmo )
			local f83_local1 = function ( f85_arg0 )
				f83_arg0.CrossAbilities:beginAnimation( 150 )
				f83_arg0.CrossAbilities:setLeftRight( 0, 0, 288, 709 )
				f83_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f83_arg0.clipInterrupted )
				f83_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f83_arg0.clipFinished )
			end
			
			f83_arg0.CrossAbilities:completeAnimation()
			f83_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
			f83_local1( f83_arg0.CrossAbilities )
		end,
		ScoreboardPC = function ( f86_arg0, f86_arg1 )
			f86_arg0:__resetProperties()
			f86_arg0:setupElementClipCounter( 2 )
			local f86_local0 = function ( f87_arg0 )
				f86_arg0.ZmAmmo:beginAnimation( 150 )
				f86_arg0.ZmAmmo:setLeftRight( 0, 0, 0, 510 )
				f86_arg0.ZmAmmo:setAlpha( 0 )
				f86_arg0.ZmAmmo:registerEventHandler( "interrupted_keyframe", f86_arg0.clipInterrupted )
				f86_arg0.ZmAmmo:registerEventHandler( "transition_complete_keyframe", f86_arg0.clipFinished )
			end
			
			f86_arg0.ZmAmmo:completeAnimation()
			f86_arg0.ZmAmmo:setLeftRight( 0, 0, -120, 390 )
			f86_arg0.ZmAmmo:setAlpha( 1 )
			f86_local0( f86_arg0.ZmAmmo )
			local f86_local1 = function ( f88_arg0 )
				f86_arg0.CrossAbilities:beginAnimation( 150 )
				f86_arg0.CrossAbilities:setLeftRight( 0, 0, 288, 709 )
				f86_arg0.CrossAbilities:registerEventHandler( "interrupted_keyframe", f86_arg0.clipInterrupted )
				f86_arg0.CrossAbilities:registerEventHandler( "transition_complete_keyframe", f86_arg0.clipFinished )
			end
			
			f86_arg0.CrossAbilities:completeAnimation()
			f86_arg0.CrossAbilities:setLeftRight( 0, 0, 168, 589 )
			f86_local1( f86_arg0.CrossAbilities )
		end
	}
}
CoD.ZmAmmoContainerFactory.__onClose = function ( f89_arg0 )
	f89_arg0.ZmAmmo:close()
	f89_arg0.CrossAbilities:close()
end

