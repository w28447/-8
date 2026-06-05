require( "ui/uieditor/widgets/hud/deadspectate/deadspectate_internal" )

CoD.DeadSpectate = InheritFrom( LUI.UIElement )
CoD.DeadSpectate.__defaultWidth = 450
CoD.DeadSpectate.__defaultHeight = 90
CoD.DeadSpectate.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setUseCylinderMapping( false )
	self:setClass( CoD.DeadSpectate )
	self.id = "DeadSpectate"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local internal = CoD.DeadSpectate_Internal.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	internal:subscribeToGlobalModel( f1_arg1, "PerController", "predictedClientModel", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			internal:setModel( f2_local0, f1_arg1 )
		end
	end )
	self:addElement( internal )
	self.internal = internal
	
	self:mergeStateConditions( {
		{
			stateName = "VisiblePC",
			condition = function ( menu, element, event )
				local f3_local0
				if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
					f3_local0 = IsPC()
				else
					f3_local0 = false
				end
				return f3_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f4_local0
				if Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6FFF566DCC09BBD] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) then
					f4_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6]], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xDFB7B5BCEFCABF6]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6FFF566DCC09BBD]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	internal.id = "internal"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DeadSpectate.__resetProperties = function ( f14_arg0 )
	f14_arg0.internal:completeAnimation()
	f14_arg0.internal:setTopBottom( 0, 1, 0, 0 )
	f14_arg0.internal:setAlpha( 1 )
end

CoD.DeadSpectate.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.internal:completeAnimation()
			f15_arg0.internal:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.internal )
		end
	},
	VisiblePC = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			f16_arg0.internal:completeAnimation()
			f16_arg0.internal:setTopBottom( 0.5, 1.5, -245, -245 )
			f16_arg0.clipFinished( f16_arg0.internal )
		end
	},
	Visible = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.DeadSpectate.__onClose = function ( f18_arg0 )
	f18_arg0.internal:close()
end

