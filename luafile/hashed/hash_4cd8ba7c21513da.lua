CoD.ZMScr_Portrait = InheritFrom( LUI.UIElement )
CoD.ZMScr_Portrait.__defaultWidth = 90
CoD.ZMScr_Portrait.__defaultHeight = 67
CoD.ZMScr_Portrait.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScr_Portrait )
	self.id = "ZMScr_Portrait"
	self.soundSet = "default"
	
	local FixedAspectRatioImage = LUI.UIFixedAspectRatioImage.new( 0, 0, 2, 92, 0, 0, 2, 69 )
	FixedAspectRatioImage:setScale( 0.85, 0.85 )
	FixedAspectRatioImage:setStretchedDimension( 4 )
	self:addElement( FixedAspectRatioImage )
	self.FixedAspectRatioImage = FixedAspectRatioImage
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

