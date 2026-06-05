CoD.Corner9SliceZM = InheritFrom( LUI.UIElement )
CoD.Corner9SliceZM.__defaultWidth = 36
CoD.Corner9SliceZM.__defaultHeight = 36
CoD.Corner9SliceZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Corner9SliceZM )
	self.id = "Corner9SliceZM"
	self.soundSet = "none"
	
	local TiledShaderImage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TiledShaderImage:setAlpha( 0.92 )
	TiledShaderImage:setImage( RegisterImage( 0xDDC01A8C2C2B780 ) )
	TiledShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	TiledShaderImage:setShaderVector( 0, 0, 0, 0, 0 )
	TiledShaderImage:setupNineSliceShader( 64, 64 )
	self:addElement( TiledShaderImage )
	self.TiledShaderImage = TiledShaderImage
	
	local Pip = LUI.UIImage.new( 1, 1, -8.5, 7.5, 0, 0, -7.5, 8.5 )
	Pip:setImage( RegisterImage( "uie_zm_hud_notification_metal_diamond" ) )
	Pip:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	Pip:setShaderVector( 0, 1.2, 0, 0, 0 )
	self:addElement( Pip )
	self.Pip = Pip
	
	local Pip3 = LUI.UIImage.new( 0, 0, -7.5, 8.5, 0, 0, -7.5, 8.5 )
	Pip3:setZRot( 270 )
	Pip3:setImage( RegisterImage( "uie_zm_hud_notification_metal_diamond" ) )
	Pip3:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	Pip3:setShaderVector( 0, 1.2, 0, 0, 0 )
	self:addElement( Pip3 )
	self.Pip3 = Pip3
	
	local Pip4 = LUI.UIImage.new( 0, 0, -7.5, 8.5, 1, 1, -8.5, 7.5 )
	Pip4:setZRot( 270 )
	Pip4:setImage( RegisterImage( "uie_zm_hud_notification_metal_diamond" ) )
	Pip4:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	Pip4:setShaderVector( 0, 1.2, 0, 0, 0 )
	self:addElement( Pip4 )
	self.Pip4 = Pip4
	
	local Pip2 = LUI.UIImage.new( 1, 1, -8.5, 7.5, 1, 1, -8.5, 7.5 )
	Pip2:setImage( RegisterImage( "uie_zm_hud_notification_metal_diamond" ) )
	Pip2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	Pip2:setShaderVector( 0, 1.2, 0, 0, 0 )
	self:addElement( Pip2 )
	self.Pip2 = Pip2
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

