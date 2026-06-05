require( "x64:61911de5d586c0e" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_perks_disabled_container" )

CoD.ZMPerkVaporsContainer = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporsContainer.__defaultWidth = 500
CoD.ZMPerkVaporsContainer.__defaultHeight = 150
CoD.ZMPerkVaporsContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModel( f1_arg1, "PerkVaporStateUpdated", 0 )
	self:setClass( CoD.ZMPerkVaporsContainer )
	self.id = "ZMPerkVaporsContainer"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local bgbGlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, -121, 121, 0.5, 0.5, -180.5, 180.5 )
	bgbGlowOrangeOver:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	bgbGlowOrangeOver:setAlpha( 0 )
	bgbGlowOrangeOver:setZRot( 90 )
	bgbGlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbGlowOrangeOver )
	self.bgbGlowOrangeOver = bgbGlowOrangeOver
	
	local Image = LUI.UIImage.new( 0.5, 0.5, -144, 144, 0, 0, 80, 124 )
	Image:setScale( 1.01, 1 )
	Image:setImage( RegisterImage( 0x730624C02DD347E ) )
	self:addElement( Image )
	self.Image = Image
	
	local vapors = LUI.UIList.new( f1_arg0, f1_arg1, -18, 0, nil, false, false, false, false )
	vapors:setLeftRight( 0.5, 0.5, -112.5, 113.5 )
	vapors:setTopBottom( 0, 0, 36, 134 )
	vapors:setWidgetType( CoD.ZMPerkVaporItem )
	vapors:setHorizontalCount( 4 )
	vapors:setSpacing( -18 )
	vapors:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	vapors:setDataSource( "PerkVapors" )
	self:addElement( vapors )
	self.vapors = vapors
	
	local CrossPerks = CoD.Hud_ZM_Perks_Disabled_Container.new( f1_arg0, f1_arg1, 0, 0, 83, 459, 0, 0, 14, 140 )
	self:addElement( CrossPerks )
	self.CrossPerks = CrossPerks
	
	local bgbAbilitySwirl = LUI.UIImage.new( 0.5, 0.5, -78.5, 83.5, 0, 0, 0, 160 )
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
			stateName = "TutorialHide",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztutorial" ) and CoD.ModelUtility.IsGlobalModelValueEqualTo( "hudItems.ztut.showPerks", 0 )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f3_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" )
				if f3_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) then
						f3_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] )
				if not f4_local0 then
					f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] )
					if not f4_local0 then
						f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] )
						if not f4_local0 then
							f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] )
							if not f4_local0 then
								if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) then
									f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] )
									if not f4_local0 then
										f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] )
										if not f4_local0 then
											f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] )
											if not f4_local0 then
												f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] )
												if not f4_local0 then
													f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] )
													if not f4_local0 then
														f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] )
														if not f4_local0 then
															f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
														end
													end
												end
											end
										end
									end
								else
									f4_local0 = true
								end
							end
						end
					end
				end
				return f4_local0
			end
		}
	} )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine.GetGlobalModel()
	f1_local7( f1_local6, f1_local8["hudItems.ztut.showPerks"], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "hudItems.ztut.showPerks"
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local6 = self
	f1_local7 = self.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	vapors.id = "vapors"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporsContainer.__resetProperties = function ( f18_arg0 )
	f18_arg0.vapors:completeAnimation()
	f18_arg0.Image:completeAnimation()
	f18_arg0.CrossPerks:completeAnimation()
	f18_arg0.bgbAbilitySwirl:completeAnimation()
	f18_arg0.bgbGlowOrangeOver:completeAnimation()
	f18_arg0.vapors:setAlpha( 1 )
	f18_arg0.Image:setAlpha( 1 )
	f18_arg0.CrossPerks:setAlpha( 1 )
	f18_arg0.bgbAbilitySwirl:setAlpha( 0 )
	f18_arg0.bgbAbilitySwirl:setZRot( 330 )
	f18_arg0.bgbGlowOrangeOver:setAlpha( 0 )
end

CoD.ZMPerkVaporsContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 0 )
		end,
		Hidden = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 3 )
			local f20_local0 = function ( f21_arg0 )
				f20_arg0.Image:beginAnimation( 150 )
				f20_arg0.Image:setAlpha( 0 )
				f20_arg0.Image:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.Image:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.Image:completeAnimation()
			f20_arg0.Image:setAlpha( 1 )
			f20_local0( f20_arg0.Image )
			local f20_local1 = function ( f22_arg0 )
				f20_arg0.vapors:beginAnimation( 150 )
				f20_arg0.vapors:setAlpha( 0 )
				f20_arg0.vapors:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.vapors:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.vapors:completeAnimation()
			f20_arg0.vapors:setAlpha( 1 )
			f20_local1( f20_arg0.vapors )
			local f20_local2 = function ( f23_arg0 )
				f20_arg0.CrossPerks:beginAnimation( 150 )
				f20_arg0.CrossPerks:setAlpha( 0 )
				f20_arg0.CrossPerks:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.CrossPerks:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.CrossPerks:completeAnimation()
			f20_arg0.CrossPerks:setAlpha( 1 )
			f20_local2( f20_arg0.CrossPerks )
		end
	},
	TutorialHide = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 3 )
			f24_arg0.Image:completeAnimation()
			f24_arg0.Image:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.Image )
			f24_arg0.vapors:completeAnimation()
			f24_arg0.vapors:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.vapors )
			f24_arg0.CrossPerks:completeAnimation()
			f24_arg0.CrossPerks:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.CrossPerks )
		end,
		DefaultState = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 4 )
			local f25_local0 = function ( f26_arg0 )
				local f26_local0 = function ( f27_arg0 )
					local f27_local0 = function ( f28_arg0 )
						local f28_local0 = function ( f29_arg0 )
							local f29_local0 = function ( f30_arg0 )
								local f30_local0 = function ( f31_arg0 )
									local f31_local0 = function ( f32_arg0 )
										f32_arg0:beginAnimation( 230 )
										f32_arg0:setAlpha( 0 )
										f32_arg0:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
									end
									
									f31_arg0:beginAnimation( 110 )
									f31_arg0:setAlpha( 0.7 )
									f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
								end
								
								f30_arg0:beginAnimation( 160 )
								f30_arg0:setAlpha( 0 )
								f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
							end
							
							f29_arg0:beginAnimation( 169 )
							f29_arg0:setAlpha( 0.7 )
							f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
						end
						
						f28_arg0:beginAnimation( 170 )
						f28_arg0:setAlpha( 0 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
					
					f27_arg0:beginAnimation( 160 )
					f27_arg0:setAlpha( 0.7 )
					f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
				end
				
				f25_arg0.bgbGlowOrangeOver:beginAnimation( 330 )
				f25_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f26_local0 )
			end
			
			f25_arg0.bgbGlowOrangeOver:completeAnimation()
			f25_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f25_local0( f25_arg0.bgbGlowOrangeOver )
			local f25_local1 = function ( f33_arg0 )
				f33_arg0:beginAnimation( 330 )
				f33_arg0:setAlpha( 1 )
				f33_arg0:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.Image:beginAnimation( 330 )
			f25_arg0.Image:setAlpha( 0 )
			f25_arg0.Image:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
			f25_arg0.Image:registerEventHandler( "transition_complete_keyframe", f25_local1 )
			local f25_local2 = function ( f34_arg0 )
				local f34_local0 = function ( f35_arg0 )
					local f35_local0 = function ( f36_arg0 )
						f36_arg0:beginAnimation( 340, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f36_arg0:setAlpha( 1 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
					end
					
					f35_arg0:beginAnimation( 329 )
					f35_arg0:setAlpha( 0 )
					f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
				end
				
				f34_arg0:beginAnimation( 330 )
				f34_arg0:setAlpha( 1 )
				f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
			end
			
			f25_arg0.vapors:beginAnimation( 330 )
			f25_arg0.vapors:setAlpha( 0 )
			f25_arg0.vapors:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
			f25_arg0.vapors:registerEventHandler( "transition_complete_keyframe", f25_local2 )
			local f25_local3 = function ( f37_arg0 )
				local f37_local0 = function ( f38_arg0 )
					f38_arg0:beginAnimation( 199 )
					f38_arg0:setAlpha( 0 )
					f38_arg0:setZRot( 360 )
					f38_arg0:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
				end
				
				f25_arg0.bgbAbilitySwirl:beginAnimation( 330 )
				f25_arg0.bgbAbilitySwirl:setAlpha( 1 )
				f25_arg0.bgbAbilitySwirl:setZRot( 240 )
				f25_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f37_local0 )
			end
			
			f25_arg0.bgbAbilitySwirl:completeAnimation()
			f25_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f25_arg0.bgbAbilitySwirl:setZRot( 0 )
			f25_local3( f25_arg0.bgbAbilitySwirl )
		end
	},
	Visible = {
		DefaultClip = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 0 )
		end,
		Hidden = function ( f40_arg0, f40_arg1 )
			f40_arg0:__resetProperties()
			f40_arg0:setupElementClipCounter( 3 )
			local f40_local0 = function ( f41_arg0 )
				f40_arg0.Image:beginAnimation( 150 )
				f40_arg0.Image:setAlpha( 0 )
				f40_arg0.Image:registerEventHandler( "interrupted_keyframe", f40_arg0.clipInterrupted )
				f40_arg0.Image:registerEventHandler( "transition_complete_keyframe", f40_arg0.clipFinished )
			end
			
			f40_arg0.Image:completeAnimation()
			f40_arg0.Image:setAlpha( 1 )
			f40_local0( f40_arg0.Image )
			local f40_local1 = function ( f42_arg0 )
				f40_arg0.vapors:beginAnimation( 150 )
				f40_arg0.vapors:setAlpha( 0 )
				f40_arg0.vapors:registerEventHandler( "interrupted_keyframe", f40_arg0.clipInterrupted )
				f40_arg0.vapors:registerEventHandler( "transition_complete_keyframe", f40_arg0.clipFinished )
			end
			
			f40_arg0.vapors:completeAnimation()
			f40_arg0.vapors:setAlpha( 1 )
			f40_local1( f40_arg0.vapors )
			local f40_local2 = function ( f43_arg0 )
				f40_arg0.CrossPerks:beginAnimation( 150 )
				f40_arg0.CrossPerks:setAlpha( 0 )
				f40_arg0.CrossPerks:registerEventHandler( "interrupted_keyframe", f40_arg0.clipInterrupted )
				f40_arg0.CrossPerks:registerEventHandler( "transition_complete_keyframe", f40_arg0.clipFinished )
			end
			
			f40_arg0.CrossPerks:completeAnimation()
			f40_arg0.CrossPerks:setAlpha( 1 )
			f40_local2( f40_arg0.CrossPerks )
		end
	},
	Hidden = {
		DefaultClip = function ( f44_arg0, f44_arg1 )
			f44_arg0:__resetProperties()
			f44_arg0:setupElementClipCounter( 3 )
			f44_arg0.Image:completeAnimation()
			f44_arg0.Image:setAlpha( 0 )
			f44_arg0.clipFinished( f44_arg0.Image )
			f44_arg0.vapors:completeAnimation()
			f44_arg0.vapors:setAlpha( 0 )
			f44_arg0.clipFinished( f44_arg0.vapors )
			f44_arg0.CrossPerks:completeAnimation()
			f44_arg0.CrossPerks:setAlpha( 0 )
			f44_arg0.clipFinished( f44_arg0.CrossPerks )
		end,
		Visible = function ( f45_arg0, f45_arg1 )
			f45_arg0:__resetProperties()
			f45_arg0:setupElementClipCounter( 3 )
			local f45_local0 = function ( f46_arg0 )
				f45_arg0.Image:beginAnimation( 150 )
				f45_arg0.Image:setAlpha( 1 )
				f45_arg0.Image:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.Image:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
			end
			
			f45_arg0.Image:completeAnimation()
			f45_arg0.Image:setAlpha( 0 )
			f45_local0( f45_arg0.Image )
			local f45_local1 = function ( f47_arg0 )
				f45_arg0.vapors:beginAnimation( 150 )
				f45_arg0.vapors:setAlpha( 1 )
				f45_arg0.vapors:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.vapors:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
			end
			
			f45_arg0.vapors:completeAnimation()
			f45_arg0.vapors:setAlpha( 0 )
			f45_local1( f45_arg0.vapors )
			local f45_local2 = function ( f48_arg0 )
				f45_arg0.CrossPerks:beginAnimation( 150 )
				f45_arg0.CrossPerks:setAlpha( 1 )
				f45_arg0.CrossPerks:registerEventHandler( "interrupted_keyframe", f45_arg0.clipInterrupted )
				f45_arg0.CrossPerks:registerEventHandler( "transition_complete_keyframe", f45_arg0.clipFinished )
			end
			
			f45_arg0.CrossPerks:completeAnimation()
			f45_arg0.CrossPerks:setAlpha( 0 )
			f45_local2( f45_arg0.CrossPerks )
		end,
		DefaultState = function ( f49_arg0, f49_arg1 )
			f49_arg0:__resetProperties()
			f49_arg0:setupElementClipCounter( 3 )
			local f49_local0 = function ( f50_arg0 )
				f49_arg0.Image:beginAnimation( 150 )
				f49_arg0.Image:setAlpha( 1 )
				f49_arg0.Image:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
				f49_arg0.Image:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
			end
			
			f49_arg0.Image:completeAnimation()
			f49_arg0.Image:setAlpha( 0 )
			f49_local0( f49_arg0.Image )
			local f49_local1 = function ( f51_arg0 )
				f49_arg0.vapors:beginAnimation( 150 )
				f49_arg0.vapors:setAlpha( 1 )
				f49_arg0.vapors:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
				f49_arg0.vapors:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
			end
			
			f49_arg0.vapors:completeAnimation()
			f49_arg0.vapors:setAlpha( 0 )
			f49_local1( f49_arg0.vapors )
			local f49_local2 = function ( f52_arg0 )
				f49_arg0.CrossPerks:beginAnimation( 150 )
				f49_arg0.CrossPerks:setAlpha( 1 )
				f49_arg0.CrossPerks:registerEventHandler( "interrupted_keyframe", f49_arg0.clipInterrupted )
				f49_arg0.CrossPerks:registerEventHandler( "transition_complete_keyframe", f49_arg0.clipFinished )
			end
			
			f49_arg0.CrossPerks:completeAnimation()
			f49_arg0.CrossPerks:setAlpha( 0 )
			f49_local2( f49_arg0.CrossPerks )
		end
	}
}
CoD.ZMPerkVaporsContainer.__onClose = function ( f53_arg0 )
	f53_arg0.vapors:close()
	f53_arg0.CrossPerks:close()
end

