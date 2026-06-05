require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm" )

CoD.AmmoWidgetZMContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZMContainer.__defaultWidth = 597
CoD.AmmoWidgetZMContainer.__defaultHeight = 186
CoD.AmmoWidgetZMContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZMContainer )
	self.id = "AmmoWidgetZMContainer"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local AmmoWidgetZM = CoD.AmmoWidgetZM.new( f1_arg0, f1_arg1, 0, 0, 0, 597, 0, 0, 0, 186 )
	AmmoWidgetZM:setAlpha( 0 )
	self:addElement( AmmoWidgetZM )
	self.AmmoWidgetZM = AmmoWidgetZM
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f2_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" )
				if f2_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] ) then
						f2_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f3_local0
				if (Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] )) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) then
					f3_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f18_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["hudItems.playerSpawned"], function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "hudItems.playerSpawned"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f21_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f21_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]], function ( f22_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]
		} )
	end, false )
	AmmoWidgetZM.id = "AmmoWidgetZM"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZMContainer.__resetProperties = function ( f23_arg0 )
	f23_arg0.AmmoWidgetZM:completeAnimation()
	f23_arg0.AmmoWidgetZM:setAlpha( 0 )
end

CoD.AmmoWidgetZMContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 1 )
			f24_arg0.AmmoWidgetZM:completeAnimation()
			f24_arg0.AmmoWidgetZM:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.AmmoWidgetZM )
		end,
		Invisible = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 1 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.AmmoWidgetZM:beginAnimation( 150 )
				f25_arg0.AmmoWidgetZM:setAlpha( 0 )
				f25_arg0.AmmoWidgetZM:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.AmmoWidgetZM:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.AmmoWidgetZM:completeAnimation()
			f25_arg0.AmmoWidgetZM:setAlpha( 1 )
			f25_local0( f25_arg0.AmmoWidgetZM )
		end
	},
	Visible = {
		DefaultClip = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 1 )
			f27_arg0.AmmoWidgetZM:completeAnimation()
			f27_arg0.AmmoWidgetZM:setAlpha( 1 )
			f27_arg0.clipFinished( f27_arg0.AmmoWidgetZM )
		end,
		Invisible = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 1 )
			local f28_local0 = function ( f29_arg0 )
				f28_arg0.AmmoWidgetZM:beginAnimation( 150 )
				f28_arg0.AmmoWidgetZM:setAlpha( 0 )
				f28_arg0.AmmoWidgetZM:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.AmmoWidgetZM:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.AmmoWidgetZM:completeAnimation()
			f28_arg0.AmmoWidgetZM:setAlpha( 1 )
			f28_local0( f28_arg0.AmmoWidgetZM )
		end
	},
	Invisible = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 1 )
			f30_arg0.AmmoWidgetZM:completeAnimation()
			f30_arg0.AmmoWidgetZM:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.AmmoWidgetZM )
		end,
		Visible = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 1 )
			local f31_local0 = function ( f32_arg0 )
				f31_arg0.AmmoWidgetZM:beginAnimation( 150 )
				f31_arg0.AmmoWidgetZM:setAlpha( 1 )
				f31_arg0.AmmoWidgetZM:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.AmmoWidgetZM:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
			end
			
			f31_arg0.AmmoWidgetZM:completeAnimation()
			f31_arg0.AmmoWidgetZM:setAlpha( 0 )
			f31_local0( f31_arg0.AmmoWidgetZM )
		end,
		DefaultState = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 1 )
			local f33_local0 = function ( f34_arg0 )
				f33_arg0.AmmoWidgetZM:beginAnimation( 150 )
				f33_arg0.AmmoWidgetZM:setAlpha( 1 )
				f33_arg0.AmmoWidgetZM:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.AmmoWidgetZM:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.AmmoWidgetZM:completeAnimation()
			f33_arg0.AmmoWidgetZM:setAlpha( 0 )
			f33_local0( f33_arg0.AmmoWidgetZM )
		end
	}
}
CoD.AmmoWidgetZMContainer.__onClose = function ( f35_arg0 )
	f35_arg0.AmmoWidgetZM:close()
end

