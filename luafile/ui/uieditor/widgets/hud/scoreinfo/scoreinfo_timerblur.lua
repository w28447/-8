CoD.ScoreInfo_TimerBlur = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TimerBlur.__defaultWidth = 196
CoD.ScoreInfo_TimerBlur.__defaultHeight = 33
CoD.ScoreInfo_TimerBlur.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_TimerBlur )
	self.id = "ScoreInfo_TimerBlur"
	self.soundSet = "default"
	
	local Blur2 = LUI.UIImage.new( 0.5, 0.5, -98, 98, 0.5, 0.5, -16.5, 16.5 )
	Blur2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	Blur2:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( Blur2 )
	self.Blur2 = Blur2
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

