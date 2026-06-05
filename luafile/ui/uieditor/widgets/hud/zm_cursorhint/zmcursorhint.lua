require( "x64:e974620a2d49d8f" )

CoD.ZMCursorHint = InheritFrom( LUI.UIElement )
CoD.ZMCursorHint.__defaultWidth = 750
CoD.ZMCursorHint.__defaultHeight = 135
CoD.ZMCursorHint.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMCursorHint )
	self.id = "ZMCursorHint"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local CursorHintText = LUI.UIText.new( 0.5, 0.5, -375, 375, 0, 0, 3, 25 )
	CursorHintText:setTTF( "skorzhen" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	CursorHintText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	CursorHintText:setBackingType( 1 )
	CursorHintText:setBackingWidget( CoD.Corner9SliceZM, f1_arg0, f1_arg1 )
	CursorHintText:setBackingAlpha( 0.8 )
	CursorHintText:setBackingXPadding( 40 )
	CursorHintText:setBackingYPadding( 4 )
	CursorHintText:subscribeToGlobalModel( f1_arg1, "HUDItems", "cursorHintText", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			CursorHintText:setText( f2_local0 )
		end
	end )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	self:mergeStateConditions( {
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				local f3_local0 = IsCursorHintActive( f1_arg1 )
				if f3_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD567EDB5609CCEC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA77EB9347BE4DFF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x4828BED794DA0A5] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1C630DB86D235A5] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
						f3_local0 = CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f1_arg1, "HUDItems", "cursorHintImage", "blacktransparent" )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f4_local0 = IsCursorHintActive( f1_arg1 )
				if f4_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD567EDB5609CCEC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA77EB9347BE4DFF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x4828BED794DA0A5] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1C630DB86D235A5] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) then
						f4_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
					else
						f4_local0 = false
					end
				end
				return f4_local0
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["hudItems.showCursorHint"], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "hudItems.showCursorHint"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["hudItems.inventory.open"], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "hudItems.inventory.open"
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]
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
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD567EDB5609CCEC]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD567EDB5609CCEC]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA77EB9347BE4DFF]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA77EB9347BE4DFF]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x4828BED794DA0A5]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x4828BED794DA0A5]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1C630DB86D235A5]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1C630DB86D235A5]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]], function ( f18_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = DataSources.HUDItems.getModel( f1_arg1 )
	f1_local3( f1_local2, f1_local4.cursorHintImage, function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "cursorHintImage"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMCursorHint.__resetProperties = function ( f21_arg0 )
	f21_arg0.CursorHintText:completeAnimation()
	f21_arg0.CursorHintText:setAlpha( 1 )
end

CoD.ZMCursorHint.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 1 )
			f22_arg0.CursorHintText:completeAnimation()
			f22_arg0.CursorHintText:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.CursorHintText )
		end
	},
	Active_NoImage = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 1 )
			local f23_local0 = function ( f24_arg0 )
				f23_arg0.CursorHintText:beginAnimation( 300 )
				f23_arg0.CursorHintText:setAlpha( 1 )
				f23_arg0.CursorHintText:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.CursorHintText:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.CursorHintText:completeAnimation()
			f23_arg0.CursorHintText:setAlpha( 0 )
			f23_local0( f23_arg0.CursorHintText )
		end
	},
	Active = {
		DefaultClip = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 1 )
			local f25_local0 = function ( f26_arg0 )
				f25_arg0.CursorHintText:beginAnimation( 300 )
				f25_arg0.CursorHintText:setAlpha( 1 )
				f25_arg0.CursorHintText:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.CursorHintText:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
			end
			
			f25_arg0.CursorHintText:completeAnimation()
			f25_arg0.CursorHintText:setAlpha( 0 )
			f25_local0( f25_arg0.CursorHintText )
		end
	}
}
CoD.ZMCursorHint.__onClose = function ( f27_arg0 )
	f27_arg0.CursorHintText:close()
end

