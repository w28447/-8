require( "ui/uieditor/widgets/hud/zm_fx/zmfx_spark1img" )

CoD.ZmFx_Spark2Ext = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark2Ext.__defaultWidth = 168
CoD.ZmFx_Spark2Ext.__defaultHeight = 252
CoD.ZmFx_Spark2Ext.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmFx_Spark2Ext )
	self.id = "ZmFx_Spark2Ext"
	self.soundSet = "HUD"
	
	local ZmFxSpark1Img0 = CoD.ZmFx_Spark1Img.new( f1_arg0, f1_arg1, 0, 1, 23, -9, 0, 1, 35, -13 )
	ZmFxSpark1Img0:setRGB( 0.66, 0.25, 0 )
	ZmFxSpark1Img0:setAlpha( 0.55 )
	ZmFxSpark1Img0.Image00:setShaderVector( 1, 12.59, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img0 )
	self.ZmFxSpark1Img0 = ZmFxSpark1Img0
	
	local ZmFxSpark1Img1 = CoD.ZmFx_Spark1Img.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( ZmFxSpark1Img1 )
	self.ZmFxSpark1Img1 = ZmFxSpark1Img1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmFx_Spark2Ext.__onClose = function ( f2_arg0 )
	f2_arg0.ZmFxSpark1Img0:close()
	f2_arg0.ZmFxSpark1Img1:close()
end

