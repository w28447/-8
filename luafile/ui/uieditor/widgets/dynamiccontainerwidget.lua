CoD.DynamicContainerWidget = InheritFrom( LUI.UIElement )
CoD.DynamicContainerWidget.__defaultWidth = 1920
CoD.DynamicContainerWidget.__defaultHeight = 1080
CoD.DynamicContainerWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DynamicContainerWidget )
	self.id = "DynamicContainerWidget"
	self.soundSet = "HUD"
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local1 = self
	SetupDynamicContainer( self )
	return self
end

