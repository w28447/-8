require( "x64:75eea72778ac622" )

CoD.DeadSpectate_SpectatingBarPC = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingBarPC.__defaultWidth = 266
CoD.DeadSpectate_SpectatingBarPC.__defaultHeight = 37
CoD.DeadSpectate_SpectatingBarPC.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 0, false )
	self:setAlignment( LUI.Alignment.Center )
	self:setClass( CoD.DeadSpectate_SpectatingBarPC )
	self.id = "DeadSpectate_SpectatingBarPC"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local leftButton = LUI.UIImage.new( 0.5, 0.5, -133, -95, 0.5, 0.5, -22, 18 )
	leftButton:subscribeToGlobalModel( f1_arg1, "Controller", "mouse_left_button_image", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			leftButton:setImage( RegisterImage( f2_local0 ) )
		end
	end )
	self:addElement( leftButton )
	self.leftButton = leftButton
	
	local spectatingLabel0 = CoD.PC_SpectatingLabel.new( f1_arg0, f1_arg1, 0.5, 0.5, -95, 95, 0.5, 0.5, -15, 18 )
	self:addElement( spectatingLabel0 )
	self.spectatingLabel0 = spectatingLabel0
	
	local rightButton = LUI.UIImage.new( 0.5, 0.5, 95, 133, 0.5, 0.5, -22, 18 )
	rightButton:subscribeToGlobalModel( f1_arg1, "Controller", "mouse_right_button_image", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			rightButton:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	self:addElement( rightButton )
	self.rightButton = rightButton
	
	self:mergeStateConditions( {
		{
			stateName = "VisibleLastPlayer",
			condition = function ( menu, element, event )
				local f4_local0
				if (Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )) and not IsGamepad( f1_arg1 ) then
					f4_local0 = CoD.ModelUtility.IsModelValueEqualToEitherValue( f1_arg1, "gameScore.alliesAlive", 0, 1 )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f5_local0
				if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) or Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) or not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
					f5_local0 = not IsGamepad( f1_arg1 )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f13_arg0, f13_arg1 )
		f13_arg1.menu = f13_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f13_arg1 )
	end )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6.LastInput, function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["gameScore.alliesAlive"], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "gameScore.alliesAlive"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DeadSpectate_SpectatingBarPC.__resetProperties = function ( f16_arg0 )
	f16_arg0.rightButton:completeAnimation()
	f16_arg0.leftButton:completeAnimation()
	f16_arg0.spectatingLabel0:completeAnimation()
	f16_arg0.rightButton:setAlpha( 1 )
	f16_arg0.leftButton:setAlpha( 1 )
	f16_arg0.spectatingLabel0:setAlpha( 1 )
end

CoD.DeadSpectate_SpectatingBarPC.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 3 )
			f17_arg0.leftButton:completeAnimation()
			f17_arg0.leftButton:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.leftButton )
			f17_arg0.spectatingLabel0:completeAnimation()
			f17_arg0.spectatingLabel0:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.spectatingLabel0 )
			f17_arg0.rightButton:completeAnimation()
			f17_arg0.rightButton:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.rightButton )
		end
	},
	VisibleLastPlayer = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 2 )
			f18_arg0.leftButton:completeAnimation()
			f18_arg0.leftButton:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.leftButton )
			f18_arg0.rightButton:completeAnimation()
			f18_arg0.rightButton:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.rightButton )
		end
	},
	Visible = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.DeadSpectate_SpectatingBarPC.__onClose = function ( f20_arg0 )
	f20_arg0.leftButton:close()
	f20_arg0.spectatingLabel0:close()
	f20_arg0.rightButton:close()
end

