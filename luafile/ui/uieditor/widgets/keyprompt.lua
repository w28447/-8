require( "ui/uieditor/widgets/border" )

CoD.KeyPrompt = InheritFrom( LUI.UIElement )
CoD.KeyPrompt.__defaultWidth = 36
CoD.KeyPrompt.__defaultHeight = 36
CoD.KeyPrompt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.KeyPrompt )
	self.id = "KeyPrompt"
	self.soundSet = "default"
	
	local Border = CoD.Border.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	local keybind = LUI.UIText.new( 0.5, 0.5, -119.5, 119.5, 0.5, 0.5, -12, 12 )
	keybind:setText( Engine[0xF9F1239CFD921FE]( "menu/new" ) )
	keybind:setTTF( "notosans_regular" )
	keybind:setLetterSpacing( 1 )
	keybind:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	keybind:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	LUI.OverrideFunction_CallOriginalFirst( keybind, "setText", function ( element, controller )
		if IsPC() and not CoD.PCUtility.IsContextualMousePrompt( element, f1_arg1 ) then
			ScaleWidgetToLabelCentered( self, element, 6 )
		elseif IsPC() and CoD.PCUtility.IsContextualMousePrompt( element, f1_arg1 ) then
			CoD.PCUtility.ScaleDownKeyPromptIfMouseIcon( self, f1_arg1, self.Border )
		end
	end )
	self:addElement( keybind )
	self.keybind = keybind
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.KeyPrompt.__onClose = function ( f3_arg0 )
	f3_arg0.Border:close()
end

