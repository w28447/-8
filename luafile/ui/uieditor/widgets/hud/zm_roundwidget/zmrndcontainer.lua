require( "ui/uieditor/widgets/hud/zm_roundwidget/zmrnd" )

CoD.ZmRndContainer = InheritFrom( LUI.UIElement )
CoD.ZmRndContainer.__defaultWidth = 336
CoD.ZmRndContainer.__defaultHeight = 300
CoD.ZmRndContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmRndContainer )
	self.id = "ZmRndContainer"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZmRnd = CoD.ZmRnd.new( f1_arg0, f1_arg1, 0, 0, 0, 336, 1, 1, -300, 0 )
	ZmRnd:subscribeToGlobalModel( f1_arg1, "GameScore", nil, function ( model )
		ZmRnd:setModel( model, f1_arg1 )
	end )
	self:addElement( ZmRnd )
	self.ZmRnd = ZmRnd
	
	self:mergeStateConditions( {
		{
			stateName = "TrialsShow",
			condition = function ( menu, element, event )
				local f3_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
				if f3_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) then
						f3_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f4_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
				if f4_local0 then
					if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] ) then
						f4_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] )
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "InvisibleCopy",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard", "ztrials" )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["hudItems.playerSpawned"], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "hudItems.playerSpawned"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f18_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
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
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f22_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]], function ( f23_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmRndContainer.__resetProperties = function ( f24_arg0 )
	f24_arg0.ZmRnd:completeAnimation()
	f24_arg0.ZmRnd:setAlpha( 1 )
end

CoD.ZmRndContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 1 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.ZmRnd:beginAnimation( 190 )
				f25_arg0.ZmRnd:setAlpha( 1 )
				f25_arg0.ZmRnd:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.ZmRnd:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.ZmRnd:completeAnimation()
			f25_arg0.ZmRnd:setAlpha( 0 )
			f25_local0( f25_arg0.ZmRnd )
		end,
		Invisible = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 1 )
			local f27_local0 = function ( f28_arg0 )
				f27_arg0.ZmRnd:beginAnimation( 150 )
				f27_arg0.ZmRnd:setAlpha( 0 )
				f27_arg0.ZmRnd:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.ZmRnd:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
			end
			
			f27_arg0.ZmRnd:completeAnimation()
			f27_arg0.ZmRnd:setAlpha( 1 )
			f27_local0( f27_arg0.ZmRnd )
		end
	},
	TrialsShow = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 0 )
		end,
		Invisible = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 1 )
			local f30_local0 = function ( f31_arg0 )
				f30_arg0.ZmRnd:beginAnimation( 150 )
				f30_arg0.ZmRnd:setAlpha( 0 )
				f30_arg0.ZmRnd:registerEventHandler( "interrupted_keyframe", f30_arg0.clipInterrupted )
				f30_arg0.ZmRnd:registerEventHandler( "transition_complete_keyframe", f30_arg0.clipFinished )
			end
			
			f30_arg0.ZmRnd:completeAnimation()
			f30_arg0.ZmRnd:setAlpha( 1 )
			f30_local0( f30_arg0.ZmRnd )
		end
	},
	Invisible = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 1 )
			f32_arg0.ZmRnd:completeAnimation()
			f32_arg0.ZmRnd:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.ZmRnd )
		end,
		DefaultState = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 1 )
			local f33_local0 = function ( f34_arg0 )
				f33_arg0.ZmRnd:beginAnimation( 150 )
				f33_arg0.ZmRnd:setAlpha( 1 )
				f33_arg0.ZmRnd:registerEventHandler( "interrupted_keyframe", f33_arg0.clipInterrupted )
				f33_arg0.ZmRnd:registerEventHandler( "transition_complete_keyframe", f33_arg0.clipFinished )
			end
			
			f33_arg0.ZmRnd:completeAnimation()
			f33_arg0.ZmRnd:setAlpha( 0 )
			f33_local0( f33_arg0.ZmRnd )
		end
	},
	InvisibleCopy = {
		DefaultClip = function ( f35_arg0, f35_arg1 )
			f35_arg0:__resetProperties()
			f35_arg0:setupElementClipCounter( 1 )
			f35_arg0.ZmRnd:completeAnimation()
			f35_arg0.ZmRnd:setAlpha( 0 )
			f35_arg0.clipFinished( f35_arg0.ZmRnd )
		end,
		DefaultState = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 1 )
			local f36_local0 = function ( f37_arg0 )
				f36_arg0.ZmRnd:beginAnimation( 150 )
				f36_arg0.ZmRnd:setAlpha( 1 )
				f36_arg0.ZmRnd:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.ZmRnd:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
			end
			
			f36_arg0.ZmRnd:completeAnimation()
			f36_arg0.ZmRnd:setAlpha( 0 )
			f36_local0( f36_arg0.ZmRnd )
		end
	}
}
CoD.ZmRndContainer.__onClose = function ( f38_arg0 )
	f38_arg0.ZmRnd:close()
end

