CoD.PC_SpectatingLabel = InheritFrom( LUI.UIElement )
CoD.PC_SpectatingLabel.__defaultWidth = 200
CoD.PC_SpectatingLabel.__defaultHeight = 33
CoD.PC_SpectatingLabel.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PC_SpectatingLabel )
	self.id = "PC_SpectatingLabel"
	self.soundSet = "default"
	
	local spectatingLabel0 = LUI.UIText.new( 0, 1, 0, 0, 0.06, 0.95, -2, -2 )
	spectatingLabel0:setRGB( 0, 0, 0 )
	spectatingLabel0:setAlpha( 0.65 )
	spectatingLabel0:setText( LocalizeToUpperString( "mpui/spectating" ) )
	spectatingLabel0:setTTF( "ttmussels_regular" )
	spectatingLabel0:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	spectatingLabel0:setShaderVector( 0, 0.11, 0, 0, 0 )
	spectatingLabel0:setShaderVector( 1, 0.5, 0, 0, 0 )
	spectatingLabel0:setShaderVector( 2, 2, 0, 0, 0 )
	spectatingLabel0:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	spectatingLabel0:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	LUI.OverrideFunction_CallOriginalFirst( spectatingLabel0, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element )
	end )
	self:addElement( spectatingLabel0 )
	self.spectatingLabel0 = spectatingLabel0
	
	local spectatingLabel00 = LUI.UIText.new( 0, 1, 0, 0, 0.06, 0.95, -2, -2 )
	spectatingLabel00:setText( LocalizeToUpperString( "mpui/spectating" ) )
	spectatingLabel00:setTTF( "ttmussels_regular" )
	spectatingLabel00:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	spectatingLabel00:setShaderVector( 0, 0, 0, 0, 0 )
	spectatingLabel00:setShaderVector( 1, 0, 0, 0, 0 )
	spectatingLabel00:setShaderVector( 2, 1, 0, 0, 0 )
	spectatingLabel00:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	spectatingLabel00:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	LUI.OverrideFunction_CallOriginalFirst( spectatingLabel00, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element )
	end )
	self:addElement( spectatingLabel00 )
	self.spectatingLabel00 = spectatingLabel00
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

