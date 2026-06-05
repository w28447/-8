CoD.CommonWipeMeterWithGlow = InheritFrom( LUI.UIElement )
CoD.CommonWipeMeterWithGlow.__defaultWidth = 1200
CoD.CommonWipeMeterWithGlow.__defaultHeight = 10
CoD.CommonWipeMeterWithGlow.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CommonWipeMeterWithGlow )
	self.id = "CommonWipeMeterWithGlow"
	self.soundSet = "none"
	
	local Meter = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Meter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	Meter:setShaderVector( 0, 1, 0, 0, 0 )
	Meter:setShaderVector( 1, 0, 0, 0, 0 )
	Meter:setShaderVector( 2, 1, 0, 0, 0 )
	Meter:setShaderVector( 3, 0, 0, 0, 0 )
	Meter:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Meter )
	self.Meter = Meter
	
	local MeterAdd = LUI.UIImage.new( 0, 1, 0, 0, 0.22, 0.78, 0, 0 )
	MeterAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	MeterAdd:setShaderVector( 0, 1, 0, 0, 0 )
	MeterAdd:setShaderVector( 1, 0, 0, 0, 0 )
	MeterAdd:setShaderVector( 2, 1, 0, 0, 0 )
	MeterAdd:setShaderVector( 3, 0, 0, 0, 0 )
	MeterAdd:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( MeterAdd )
	self.MeterAdd = MeterAdd
	
	local MeterGlow = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	MeterGlow:setShaderVector( 0, 1, 0, 0, 0 )
	MeterGlow:setShaderVector( 1, 0, 0, 0, 0 )
	MeterGlow:setShaderVector( 2, 1, 0, 0, 0 )
	MeterGlow:setShaderVector( 3, 0, 0, 0, 0 )
	MeterGlow:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

