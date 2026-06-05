CoD.Common_CappedLine = InheritFrom( LUI.UIElement )
CoD.Common_CappedLine.__defaultWidth = 44
CoD.Common_CappedLine.__defaultHeight = 3
CoD.Common_CappedLine.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Common_CappedLine )
	self.id = "Common_CappedLine"
	self.soundSet = "default"
	
	local EmptyLine = LUI.UIImage.new( 0, 1, 1, -1, 0, 0, 1, 2 )
	EmptyLine:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine:setAlpha( 0.06 )
	self:addElement( EmptyLine )
	self.EmptyLine = EmptyLine
	
	local EmptyLine3 = LUI.UIImage.new( 0, 0, 1, 2, 0, 0, 0, 1 )
	EmptyLine3:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine3:setAlpha( 0.05 )
	self:addElement( EmptyLine3 )
	self.EmptyLine3 = EmptyLine3
	
	local EmptyLine2 = LUI.UIImage.new( 0, 0, 1, 2, 0, 0, 2, 3 )
	EmptyLine2:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine2:setAlpha( 0.05 )
	self:addElement( EmptyLine2 )
	self.EmptyLine2 = EmptyLine2
	
	local EmptyLine5 = LUI.UIImage.new( 0, 0, 0, 1, 0, 0, 1, 2 )
	EmptyLine5:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine5:setAlpha( 0.05 )
	self:addElement( EmptyLine5 )
	self.EmptyLine5 = EmptyLine5
	
	local EmptyLine6 = LUI.UIImage.new( 0, 0, 0, 1, 0, 0, 2, 3 )
	EmptyLine6:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine6:setAlpha( 0.02 )
	self:addElement( EmptyLine6 )
	self.EmptyLine6 = EmptyLine6
	
	local EmptyLine7 = LUI.UIImage.new( 0, 0, 0, 1, 0, 0, 0, 1 )
	EmptyLine7:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine7:setAlpha( 0.02 )
	self:addElement( EmptyLine7 )
	self.EmptyLine7 = EmptyLine7
	
	local EmptyLine8 = LUI.UIImage.new( 0, 0, 2, 3, 0, 0, 2, 3 )
	EmptyLine8:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine8:setAlpha( 0.02 )
	self:addElement( EmptyLine8 )
	self.EmptyLine8 = EmptyLine8
	
	local EmptyLine9 = LUI.UIImage.new( 0, 0, 2, 3, 0, 0, 0, 1 )
	EmptyLine9:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine9:setAlpha( 0.02 )
	self:addElement( EmptyLine9 )
	self.EmptyLine9 = EmptyLine9
	
	local EmptyLine4 = LUI.UIImage.new( 1, 1, 0, -1, 0, 0, 1, 2 )
	EmptyLine4:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine4:setAlpha( 0.05 )
	self:addElement( EmptyLine4 )
	self.EmptyLine4 = EmptyLine4
	
	local EmptyLine10 = LUI.UIImage.new( 1, 1, -2, -1, 0, 0, 0, 1 )
	EmptyLine10:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine10:setAlpha( 0.05 )
	self:addElement( EmptyLine10 )
	self.EmptyLine10 = EmptyLine10
	
	local EmptyLine11 = LUI.UIImage.new( 1, 1, -2, -1, 0, 0, 2, 3 )
	EmptyLine11:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine11:setAlpha( 0.05 )
	self:addElement( EmptyLine11 )
	self.EmptyLine11 = EmptyLine11
	
	local EmptyLine13 = LUI.UIImage.new( 1, 1, -1, 0, 0, 0, 2, 3 )
	EmptyLine13:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine13:setAlpha( 0.02 )
	self:addElement( EmptyLine13 )
	self.EmptyLine13 = EmptyLine13
	
	local EmptyLine14 = LUI.UIImage.new( 1, 1, -1, 0, 0, 0, 0, 1 )
	EmptyLine14:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine14:setAlpha( 0.02 )
	self:addElement( EmptyLine14 )
	self.EmptyLine14 = EmptyLine14
	
	local EmptyLine15 = LUI.UIImage.new( 1, 1, -3, -2, 0, 0, 0, 1 )
	EmptyLine15:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine15:setAlpha( 0.02 )
	self:addElement( EmptyLine15 )
	self.EmptyLine15 = EmptyLine15
	
	local EmptyLine16 = LUI.UIImage.new( 1, 1, -3, -2, 0, 0, 2, 3 )
	EmptyLine16:setRGB( 0.92, 0.89, 0.72 )
	EmptyLine16:setAlpha( 0.02 )
	self:addElement( EmptyLine16 )
	self.EmptyLine16 = EmptyLine16
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

