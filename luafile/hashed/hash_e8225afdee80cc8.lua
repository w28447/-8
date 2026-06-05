CoD.HealthBarWidgetZM = InheritFrom( LUI.UIElement )
CoD.HealthBarWidgetZM.__defaultWidth = 152
CoD.HealthBarWidgetZM.__defaultHeight = 12
CoD.HealthBarWidgetZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.HealthBarWidgetZM )
	self.id = "HealthBarWidgetZM"
	self.soundSet = "default"
	
	local HealthBackground = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 12 )
	HealthBackground:setRGB( 0.37, 0.4, 0.44 )
	HealthBackground:setImage( RegisterImage( 0x75CDE8BCCBD6F24 ) )
	HealthBackground:setMaterial( LUI.UIImage.GetCachedMaterial( 0xBEEFD90021D3628 ) )
	HealthBackground:setShaderVector( 0, 0, 0, 0, 0 )
	HealthBackground:setShaderVector( 1, 4, 1, 0, 0 )
	HealthBackground:setShaderVector( 2, 0, 1, 0, 1 )
	HealthBackground:setupNineSliceShader( 6, 6 )
	self:addElement( HealthBackground )
	self.HealthBackground = HealthBackground
	
	local WoundBar = LUI.UIImage.new( 0.5, 0.5, -75, 75, 0.5, 0.5, -1, 1 )
	WoundBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	WoundBar:setShaderVector( 0, 0, 1, 0, 0 )
	WoundBar:setShaderVector( 1, 0, 0, 0, 0 )
	WoundBar:setShaderVector( 2, 0, 1, 0, 0 )
	WoundBar:setShaderVector( 3, 0, 0, 0, 0 )
	WoundBar:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( WoundBar )
	self.WoundBar = WoundBar
	
	local CleanseBarBG = LUI.UIImage.new( 0.5, 0.5, -76, 76, -0.07, -0.07, 0.5, 13.5 )
	CleanseBarBG:setRGB( ColorSet.CleanseBar.r, ColorSet.CleanseBar.g, ColorSet.CleanseBar.b )
	CleanseBarBG:setImage( RegisterImage( 0x75961ABECF3E11A ) )
	CleanseBarBG:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7E89392B94A41DE ) )
	CleanseBarBG:setShaderVector( 0, 0, 0, 0, 0 )
	CleanseBarBG:setShaderVector( 1, 4, 1, 0, 0 )
	CleanseBarBG:setShaderVector( 2, 0, 1, 0, 1 )
	CleanseBarBG:setupNineSliceShader( 6, 6 )
	self:addElement( CleanseBarBG )
	self.CleanseBarBG = CleanseBarBG
	
	local HealthFill = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 12 )
	HealthFill:setRGB( 0.92, 0.92, 0.92 )
	HealthFill:setImage( RegisterImage( 0x700B275CC09FEF2 ) )
	HealthFill:setMaterial( LUI.UIImage.GetCachedMaterial( 0xBEEFD90021D3628 ) )
	HealthFill:setShaderVector( 0, 0, 0, 0, 0 )
	HealthFill:setShaderVector( 1, 4, 1, 0, 0 )
	HealthFill:setShaderVector( 2, 0, 1, 0, 1 )
	HealthFill:setupNineSliceShader( 6, 6 )
	self:addElement( HealthFill )
	self.HealthFill = HealthFill
	
	local CleanseBar = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 12 )
	CleanseBar:setRGB( ColorSet.CleanseBar.r, ColorSet.CleanseBar.g, ColorSet.CleanseBar.b )
	CleanseBar:setImage( RegisterImage( 0x700B275CC09FEF2 ) )
	CleanseBar:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7E89392B94A41DE ) )
	CleanseBar:setShaderVector( 0, 0, 0, 0, 0 )
	CleanseBar:setShaderVector( 1, 4, 1, 0, 0 )
	CleanseBar:setShaderVector( 2, 0, 1, 0, 1 )
	CleanseBar:setupNineSliceShader( 6, 6 )
	self:addElement( CleanseBar )
	self.CleanseBar = CleanseBar
	
	local WoundBarBGZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0.5, 0.5, -95.5, 103.5 )
	WoundBarBGZM:setRGB( 1, 0, 0 )
	WoundBarBGZM:setAlpha( 0 )
	WoundBarBGZM:setScale( 0.95, 1 )
	WoundBarBGZM:setImage( RegisterImage( 0xD5B703C3B0F386D ) )
	WoundBarBGZM:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7EA4827662D4CD4 ) )
	WoundBarBGZM:setShaderVector( 0, 3, 1, 0, 0 )
	WoundBarBGZM:setShaderVector( 1, 0, 1, 0, 1 )
	self:addElement( WoundBarBGZM )
	self.WoundBarBGZM = WoundBarBGZM
	
	local HealthBackgroundZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 16 )
	HealthBackgroundZM:setRGB( 0.44, 0.44, 0.44 )
	HealthBackgroundZM:setAlpha( 0 )
	HealthBackgroundZM:setImage( RegisterImage( 0xD2ED8639C87F2F6 ) )
	HealthBackgroundZM:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	HealthBackgroundZM:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBackgroundZM:setShaderVector( 1, 0, 0, 0, 0 )
	HealthBackgroundZM:setShaderVector( 2, 1, 0, 0, 0 )
	HealthBackgroundZM:setShaderVector( 3, 0, 0, 0, 0 )
	HealthBackgroundZM:setShaderVector( 4, 3, 0.02, 1, 0 )
	self:addElement( HealthBackgroundZM )
	self.HealthBackgroundZM = HealthBackgroundZM
	
	local WoundBarZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 16 )
	WoundBarZM:setRGB( 1, 0.39, 0 )
	WoundBarZM:setAlpha( 0 )
	WoundBarZM:setImage( RegisterImage( 0xD2ED8639C87F2F6 ) )
	WoundBarZM:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	WoundBarZM:setShaderVector( 0, 1, 0, 0, 0 )
	WoundBarZM:setShaderVector( 1, 0, 0, 0, 0 )
	WoundBarZM:setShaderVector( 2, 1, 0, 0, 0 )
	WoundBarZM:setShaderVector( 3, 0, 0, 0, 0 )
	WoundBarZM:setShaderVector( 4, 3, 0.02, 1, 0 )
	self:addElement( WoundBarZM )
	self.WoundBarZM = WoundBarZM
	
	local CleanseBarBGZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 16 )
	CleanseBarBGZM:setRGB( 1, 0.73, 0 )
	CleanseBarBGZM:setAlpha( 0 )
	CleanseBarBGZM:setImage( RegisterImage( 0xD2ED8639C87F2F6 ) )
	CleanseBarBGZM:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	CleanseBarBGZM:setShaderVector( 0, 1, 0, 0, 0 )
	CleanseBarBGZM:setShaderVector( 1, 0, 0, 0, 0 )
	CleanseBarBGZM:setShaderVector( 2, 1, 0, 0, 0 )
	CleanseBarBGZM:setShaderVector( 3, 0, 0, 0, 0 )
	CleanseBarBGZM:setShaderVector( 4, 3, 0.02, 1, 0 )
	self:addElement( CleanseBarBGZM )
	self.CleanseBarBGZM = CleanseBarBGZM
	
	local HealthFillZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 16 )
	HealthFillZM:setAlpha( 0 )
	HealthFillZM:setImage( RegisterImage( 0xD2ED8639C87F2F6 ) )
	HealthFillZM:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	HealthFillZM:setShaderVector( 0, 1, 0, 0, 0 )
	HealthFillZM:setShaderVector( 1, 0, 0, 0, 0 )
	HealthFillZM:setShaderVector( 2, 1, 0, 0, 0 )
	HealthFillZM:setShaderVector( 3, 0, 0, 0, 0 )
	HealthFillZM:setShaderVector( 4, 3, 0.02, 1, 0 )
	self:addElement( HealthFillZM )
	self.HealthFillZM = HealthFillZM
	
	local CleanseBarZM = LUI.UIImage.new( 0.5, 0.5, -76, 76, 0, 0, 0, 16 )
	CleanseBarZM:setRGB( 1, 0.73, 0 )
	CleanseBarZM:setAlpha( 0 )
	CleanseBarZM:setImage( RegisterImage( 0xD2ED8639C87F2F6 ) )
	CleanseBarZM:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	CleanseBarZM:setShaderVector( 0, 1, 0, 0, 0 )
	CleanseBarZM:setShaderVector( 1, 0, 0, 0, 0 )
	CleanseBarZM:setShaderVector( 2, 1, 0, 0, 0 )
	CleanseBarZM:setShaderVector( 3, 0, 0, 0, 0 )
	CleanseBarZM:setShaderVector( 4, 3, 0.02, 1, 0 )
	self:addElement( CleanseBarZM )
	self.CleanseBarZM = CleanseBarZM
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

