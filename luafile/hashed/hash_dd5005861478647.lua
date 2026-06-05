CoD.ZmNotif1Factory = InheritFrom( LUI.UIElement )
CoD.ZmNotif1Factory.__defaultWidth = 800
CoD.ZmNotif1Factory.__defaultHeight = 82
CoD.ZmNotif1Factory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmNotif1Factory )
	self.id = "ZmNotif1Factory"
	self.soundSet = "HUD"
	
	local Label1 = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, -21, 24 )
	Label1:setRGB( 0, 0, 0 )
	Label1:setText( Engine[0xF9F1239CFD921FE]( "menu/new" ) )
	Label1:setTTF( "skorzhen" )
	Label1:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, -21, 24 )
	Label2:setRGB( 0.96, 0.66, 0 )
	Label2:setText( Engine[0xF9F1239CFD921FE]( "menu/new" ) )
	Label2:setTTF( "skorzhen" )
	Label2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	Label2:setShaderVector( 0, 0.6, 0, 0, 0 )
	Label2:setShaderVector( 1, 0.4, 0, 0, 0 )
	Label2:setShaderVector( 2, 0, 0, 0, 1 )
	Label2:setLetterSpacing( 0.2 )
	Label2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

