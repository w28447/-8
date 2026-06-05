CoD.ZMTabbedScoreboardStatBox = InheritFrom( LUI.UIElement )
CoD.ZMTabbedScoreboardStatBox.__defaultWidth = 88
CoD.ZMTabbedScoreboardStatBox.__defaultHeight = 65
CoD.ZMTabbedScoreboardStatBox.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMTabbedScoreboardStatBox )
	self.id = "ZMTabbedScoreboardStatBox"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local BarBot = LUI.UIImage.new( 0, 0, 0, 88, 0, 0, 55, 65 )
	BarBot:setAlpha( 0 )
	BarBot:setImage( RegisterImage( "uie_ui_menu_mp_scoreboard_list_score_bot" ) )
	self:addElement( BarBot )
	self.BarBot = BarBot
	
	local Tint = LUI.UIImage.new( 0.5, 0.5, -43, 41, 0, 0, 0, 58 )
	Tint:setAlpha( 0 )
	Tint:setImage( RegisterImage( "uie_ui_menu_mp_scoreboard_list_score_bg" ) )
	self:addElement( Tint )
	self.Tint = Tint
	
	local Value = LUI.UIText.new( 0.5, 0.5, -43, 41, 0.5, 0.5, -16.5, 13.5 )
	Value:setText( Engine[0xF9F1239CFD921FE]( "menu/new" ) )
	Value:setTTF( "skorzhen" )
	Value:setLetterSpacing( -1 )
	Value:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Value:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Value )
	self.Value = Value
	
	self:mergeStateConditions( {
		{
			stateName = "Self",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( element, f1_arg1 )
			end
		}
	} )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "clientNum"
		} )
	end )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["deadSpectator.playerIndex"], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "deadSpectator.playerIndex"
		} )
	end, false )
	f1_local4 = self
	f1_local5 = self.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMTabbedScoreboardStatBox.__resetProperties = function ( f6_arg0 )
	f6_arg0.Tint:completeAnimation()
	f6_arg0.Value:completeAnimation()
	f6_arg0.Tint:setAlpha( 0 )
	f6_arg0.Value:setRGB( 1, 1, 1 )
end

CoD.ZMTabbedScoreboardStatBox.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 0 )
		end
	},
	Self = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 2 )
			f8_arg0.Tint:completeAnimation()
			f8_arg0.Tint:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Tint )
			f8_arg0.Value:completeAnimation()
			f8_arg0.Value:setRGB( 1, 0.76, 0 )
			f8_arg0.clipFinished( f8_arg0.Value )
		end
	}
}
