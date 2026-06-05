require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_timer" )
require( "x64:7b29be6d79555b6" )

CoD.ZMScoreInfoContainer = InheritFrom( LUI.UIElement )
CoD.ZMScoreInfoContainer.__defaultWidth = 166
CoD.ZMScoreInfoContainer.__defaultHeight = 206
CoD.ZMScoreInfoContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIVerticalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 2, false )
	self:setAlignment( LUI.Alignment.Top )
	self:setClass( CoD.ZMScoreInfoContainer )
	self.id = "ZMScoreInfoContainer"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ScoreInfo = CoD.ZMScoreInfo.new( f1_arg0, f1_arg1, 0, 0, 0, 166, 0, 0, 0, 166 )
	self:addElement( ScoreInfo )
	self.ScoreInfo = ScoreInfo
	
	local DividerBar = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, 168, 170 )
	DividerBar:setAlpha( 0.4 )
	self:addElement( DividerBar )
	self.DividerBar = DividerBar
	
	local ScoreInfoTimer = CoD.ScoreInfo_Timer.new( f1_arg0, f1_arg1, 0.5, 0.5, -57, 148, 0, 0, 172, 212 )
	ScoreInfoTimer:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f2_local0 = CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "gameScore.gameTimeEnd", 0 )
				if f2_local0 then
					if not CoD.ModelUtility.IsModelValueEqualTo( f1_arg1, "gameScore.gameTimeLow", 1 ) then
						f2_local0 = not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "TimeLow",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "gameScore.gameTimeEnd", 0 ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] )
			end
		}
	} )
	local f1_local4 = ScoreInfoTimer
	local f1_local5 = ScoreInfoTimer.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["gameScore.gameTimeEnd"], function ( f4_arg0 )
		f1_arg0:updateElementState( ScoreInfoTimer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "gameScore.gameTimeEnd"
		} )
	end, false )
	f1_local4 = ScoreInfoTimer
	f1_local5 = ScoreInfoTimer.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["gameScore.gameTimeLow"], function ( f5_arg0 )
		f1_arg0:updateElementState( ScoreInfoTimer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "gameScore.gameTimeLow"
		} )
	end, false )
	f1_local4 = ScoreInfoTimer
	f1_local5 = ScoreInfoTimer.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f6_arg0 )
		f1_arg0:updateElementState( ScoreInfoTimer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	self:addElement( ScoreInfoTimer )
	self.ScoreInfoTimer = ScoreInfoTimer
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f7_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "hudItems.playerSpawned" )
				if f7_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x59333FC97F7870] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x69C28E2FCA82769] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xADC477DDE486DD7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x7B52A87BC9AA4C7] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x9BF57CE75A8755E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x3AEEAA452536E6E] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD298E43D0B6FEF2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xBB045E46E88E762] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xC57360571B0917E] ) then
						f7_local0 = IsGametypeTeambased()
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "VisibleCodCaster",
			condition = function ( menu, element, event )
				local f8_local0 = IsCodCaster( f1_arg1 )
				if f8_local0 then
					f8_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_teamscore", 1 )
					if f8_local0 then
						f8_local0 = IsGametypeTeambased()
					end
				end
				return f8_local0
			end
		}
	} )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["hudItems.playerSpawned"], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "hudItems.playerSpawned"
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x59333FC97F7870]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x69C28E2FCA82769]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xADC477DDE486DD7]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x23CD9BAB9B9F4C8]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7B52A87BC9AA4C7]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]], function ( f18_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x9BF57CE75A8755E]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]], function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3AEEAA452536E6E]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]], function ( f21_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f21_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD298E43D0B6FEF2]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f22_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f23_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f24_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]], function ( f25_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f25_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xBB045E46E88E762]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f26_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f26_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]], function ( f27_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f27_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xC57360571B0917E]
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["factions.isCoDCaster"], function ( f28_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f28_arg0:get(),
			modelName = "factions.isCoDCaster"
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = DataSources.CodCaster.getModel( f1_arg1 )
	f1_local5( f1_local4, f1_local6.profileSettingsUpdated, function ( f29_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f29_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	ScoreInfo.id = "ScoreInfo"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMScoreInfoContainer.__resetProperties = function ( f30_arg0 )
	f30_arg0.ScoreInfoTimer:completeAnimation()
	f30_arg0.DividerBar:completeAnimation()
	f30_arg0.ScoreInfo:completeAnimation()
	f30_arg0.ScoreInfoTimer:setAlpha( 1 )
	f30_arg0.DividerBar:setAlpha( 0.4 )
	f30_arg0.ScoreInfo:setAlpha( 1 )
end

CoD.ZMScoreInfoContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 3 )
			f31_arg0.ScoreInfo:completeAnimation()
			f31_arg0.ScoreInfo:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.ScoreInfo )
			f31_arg0.DividerBar:completeAnimation()
			f31_arg0.DividerBar:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.DividerBar )
			f31_arg0.ScoreInfoTimer:completeAnimation()
			f31_arg0.ScoreInfoTimer:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.ScoreInfoTimer )
		end
	},
	Visible = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 0 )
		end
	},
	VisibleCodCaster = {
		DefaultClip = function ( f33_arg0, f33_arg1 )
			f33_arg0:__resetProperties()
			f33_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.ZMScoreInfoContainer.__onClose = function ( f34_arg0 )
	f34_arg0.ScoreInfo:close()
	f34_arg0.ScoreInfoTimer:close()
end

