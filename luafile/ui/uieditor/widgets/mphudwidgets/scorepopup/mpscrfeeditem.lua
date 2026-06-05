CoD.MPScrFeedItem = InheritFrom( LUI.UIElement )
CoD.MPScrFeedItem.__defaultWidth = 360
CoD.MPScrFeedItem.__defaultHeight = 27
CoD.MPScrFeedItem.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPScrFeedItem )
	self.id = "MPScrFeedItem"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local TextBox = LUI.UIText.new( 0, 0, 0, 360, 0, 0, 5.5, 31.5 )
	TextBox:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	TextBox:setText( "" )
	TextBox:setTTF( "ttmussels_demibold" )
	TextBox:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TextBox:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f2_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xB8E9B69F4B87954] )
				if not f2_local0 then
					f2_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xD3ABF9A2753CE40] )
				end
				return f2_local0
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xB8E9B69F4B87954]
		} )
	end, false )
	f1_local2 = self
	f1_local3 = self.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xD3ABF9A2753CE40]
		} )
	end, false )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.MPScrFeedItem.__resetProperties = function ( f5_arg0 )
	f5_arg0.TextBox:completeAnimation()
	f5_arg0.TextBox:setLeftRight( 0, 0, 0, 360 )
	f5_arg0.TextBox:setTopBottom( 0, 0, 5.5, 31.5 )
	f5_arg0.TextBox:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	f5_arg0.TextBox:setAlpha( 1 )
end

CoD.MPScrFeedItem.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end,
		NewLine = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			local f7_local0 = function ( f8_arg0 )
				f7_arg0.TextBox:beginAnimation( 100 )
				f7_arg0.TextBox:setTopBottom( 0, 0, 0, 27 )
				f7_arg0.TextBox:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
				f7_arg0.TextBox:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
			end
			
			f7_arg0.TextBox:completeAnimation()
			f7_arg0.TextBox:setLeftRight( 0, 0, 0, 360 )
			f7_arg0.TextBox:setTopBottom( 0, 0, 0.5, 6.5 )
			f7_local0( f7_arg0.TextBox )
		end,
		PositionScore = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.TextBox:completeAnimation()
			f9_arg0.TextBox:setRGB( 0.18, 0.57, 0.91 )
			f9_arg0.clipFinished( f9_arg0.TextBox )
		end,
		GoldenScore = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.TextBox:completeAnimation()
			f10_arg0.TextBox:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
			f10_arg0.clipFinished( f10_arg0.TextBox )
		end
	},
	Hidden = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			f11_arg0.TextBox:completeAnimation()
			f11_arg0.TextBox:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.TextBox )
		end
	}
}
