CoD.AmmoWidgetZM_ClipContainerValue = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_ClipContainerValue.__defaultWidth = 120
CoD.AmmoWidgetZM_ClipContainerValue.__defaultHeight = 50
CoD.AmmoWidgetZM_ClipContainerValue.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_ClipContainerValue )
	self.id = "AmmoWidgetZM_ClipContainerValue"
	self.soundSet = "default"
	
	local ClipShadow = LUI.UIText.new( 0, 1, 2, 2, 0, 1, 0, 0 )
	ClipShadow:setRGB( 0.1, 0.1, 0.1 )
	ClipShadow:setText( 100 )
	ClipShadow:setTTF( "skorzhen" )
	ClipShadow:setMaterial( LUI.UIImage.GetCachedMaterial( 0x71E049B161CD00A ) )
	ClipShadow:setLetterSpacing( 2 )
	ClipShadow:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ClipShadow:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( ClipShadow )
	self.ClipShadow = ClipShadow
	
	local Clip = LUI.UIText.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Clip:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	Clip:setText( 100 )
	Clip:setTTF( "skorzhen" )
	Clip:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	Clip:setShaderVector( 0, 0.11, 0, 0, 0 )
	Clip:setShaderVector( 1, 0.13, 0, 0, 0 )
	Clip:setShaderVector( 2, 0, 0, 0, 1 )
	Clip:setLetterSpacing( 2 )
	Clip:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Clip:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Clip )
	self.Clip = Clip
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

