CoD.DamageWidget_Pixel = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Pixel.__defaultWidth = 10
CoD.DamageWidget_Pixel.__defaultHeight = 1
CoD.DamageWidget_Pixel.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DamageWidget_Pixel )
	self.id = "DamageWidget_Pixel"
	self.soundSet = "default"
	
	local ImgPixel = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	ImgPixel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgPixel )
	self.ImgPixel = ImgPixel
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

