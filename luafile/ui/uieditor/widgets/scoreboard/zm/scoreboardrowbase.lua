CoD.ScoreboardRowBase = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowBase.__defaultWidth = 272
CoD.ScoreboardRowBase.__defaultHeight = 60
CoD.ScoreboardRowBase.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreboardRowBase )
	self.id = "ScoreboardRowBase"
	self.soundSet = "default"
	
	local BaseMid = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( BaseMid )
	self.BaseMid = BaseMid
	
	local BaseTip = LUI.UIImage.new( 0, 0, -48, 0, 0, 1, 0, 0 )
	BaseTip:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip_solid" ) )
	self:addElement( BaseTip )
	self.BaseTip = BaseTip
	
	local BaseEnd = LUI.UIImage.new( 1, 1, 0, 48, 0, 1, 0, 0 )
	BaseEnd:setYRot( 180 )
	BaseEnd:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip_solid" ) )
	self:addElement( BaseEnd )
	self.BaseEnd = BaseEnd
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

