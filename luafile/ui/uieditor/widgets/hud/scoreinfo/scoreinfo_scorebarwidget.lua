require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_scorebarroundpip" )

CoD.ScoreInfo_ScoreBarWidget = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_ScoreBarWidget.__defaultWidth = 100
CoD.ScoreInfo_ScoreBarWidget.__defaultHeight = 56
CoD.ScoreInfo_ScoreBarWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_ScoreBarWidget )
	self.id = "ScoreInfo_ScoreBarWidget"
	self.soundSet = "default"
	
	local Container2 = LUI.UIImage.new( 0, 0, -16.5, 5.5, 0, 0, -38, 26 )
	Container2:setRGB( 0, 0, 0 )
	Container2:setAlpha( 0 )
	Container2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_container" ) )
	self:addElement( Container2 )
	self.Container2 = Container2
	
	local MeterEmpty2 = LUI.UIImage.new( 0, 0, -11.5, 0.5, 0, 0, -38, 26 )
	MeterEmpty2:setRGB( 0.18, 0.18, 0.18 )
	MeterEmpty2:setAlpha( 0 )
	MeterEmpty2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_empty" ) )
	self:addElement( MeterEmpty2 )
	self.MeterEmpty2 = MeterEmpty2
	
	local MeterFill2 = LUI.UIImage.new( 0, 0, -11.5, 0.5, 0, 0, -30, 18 )
	MeterFill2:setAlpha( 0 )
	MeterFill2:setZRot( 180 )
	MeterFill2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_fill" ) )
	MeterFill2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFF505FE6AFC47D5 ) )
	MeterFill2:setShaderVector( 0, 1, 0, 0, 0 )
	MeterFill2:setShaderVector( 1, 0, 0, 0, 0 )
	MeterFill2:setShaderVector( 2, 0.25, 0, 0, 0 )
	MeterFill2:setShaderVector( 3, 0, 0, 0, 0 )
	MeterFill2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( MeterFill2 )
	self.MeterFill2 = MeterFill2
	
	local CapBottom2 = LUI.UIImage.new( 0.02, 0.02, -13.5, -2.5, 0, 0, 13, 23 )
	CapBottom2:setAlpha( 0 )
	CapBottom2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	self:addElement( CapBottom2 )
	self.CapBottom2 = CapBottom2
	
	local CapTop2 = LUI.UIImage.new( 0.02, 0.02, -13.5, -1.5, 0, 0, -35.5, -25.5 )
	CapTop2:setAlpha( 0 )
	CapTop2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	self:addElement( CapTop2 )
	self.CapTop2 = CapTop2
	
	local Container = LUI.UIImage.new( 0, 0, 79, 101, 0, 0, -38, 26 )
	Container:setRGB( 0, 0, 0 )
	Container:setAlpha( 0.9 )
	Container:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_container" ) )
	self:addElement( Container )
	self.Container = Container
	
	local MeterEmpty = LUI.UIImage.new( 0, 0, 84, 96, 0, 0, -38, 26 )
	MeterEmpty:setRGB( 0.18, 0.18, 0.18 )
	MeterEmpty:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_empty" ) )
	self:addElement( MeterEmpty )
	self.MeterEmpty = MeterEmpty
	
	local MeterFill = LUI.UIImage.new( 0, 0, 84, 96, 0, 0, -30, 18 )
	MeterFill:setZRot( 180 )
	MeterFill:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_fill" ) )
	MeterFill:setMaterial( LUI.UIImage.GetCachedMaterial( 0xFF505FE6AFC47D5 ) )
	MeterFill:setShaderVector( 0, 1, 0, 0, 0 )
	MeterFill:setShaderVector( 1, 0, 0, 0, 0 )
	MeterFill:setShaderVector( 2, 0.25, 0, 0, 0 )
	MeterFill:setShaderVector( 3, 0, 0, 0, 0 )
	MeterFill:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( MeterFill )
	self.MeterFill = MeterFill
	
	local CapBottom = LUI.UIImage.new( 0.02, 0.02, 82, 94, 0, 0, 13, 23 )
	CapBottom:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	self:addElement( CapBottom )
	self.CapBottom = CapBottom
	
	local CapTop = LUI.UIImage.new( 0.02, 0.02, 82, 94, 0, 0, -35.5, -25.5 )
	CapTop:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	self:addElement( CapTop )
	self.CapTop = CapTop
	
	local RoundPipLeft = CoD.ScoreInfo_ScoreBarRoundPip.new( f1_arg0, f1_arg1, 0, 0, 2, 14, 0.5, 0.5, -37, -34 )
	self:addElement( RoundPipLeft )
	self.RoundPipLeft = RoundPipLeft
	
	local ScoreText2 = LUI.UIText.new( 0, 0, 0, 80, 0.5, 0.5, -46, -20 )
	ScoreText2:setAlpha( 0 )
	ScoreText2:setText( 888 )
	ScoreText2:setTTF( "0arame_mono_stencil" )
	ScoreText2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	ScoreText2:setShaderVector( 0, 1, 0, 0, 0 )
	ScoreText2:setShaderVector( 1, 0, 0, 0, 0 )
	ScoreText2:setShaderVector( 2, 1, 1, 1, 1 )
	ScoreText2:setLetterSpacing( 2 )
	ScoreText2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ScoreText2:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( ScoreText2 )
	self.ScoreText2 = ScoreText2
	
	local ScoreText = LUI.UIText.new( 0, 0, 2, 82, 0.5, 0.5, -48, -22 )
	ScoreText:setText( 888 )
	ScoreText:setTTF( "0arame_mono_stencil" )
	ScoreText:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	ScoreText:setShaderVector( 0, 0.68, 0, 0, 0 )
	ScoreText:setShaderVector( 1, 0, 0, 0, 0 )
	ScoreText:setShaderVector( 2, 1, 1, 1, 0.4 )
	ScoreText:setLetterSpacing( 2 )
	ScoreText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ScoreText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( ScoreText )
	self.ScoreText = ScoreText
	
	local RuleTop = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, -30, -14 )
	RuleTop:setAlpha( 0 )
	RuleTop:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_rule" ) )
	self:addElement( RuleTop )
	self.RuleTop = RuleTop
	
	local RuleBottom = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, -2, 14 )
	RuleBottom:setAlpha( 0 )
	RuleBottom:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_rule" ) )
	self:addElement( RuleBottom )
	self.RuleBottom = RuleBottom
	
	local BarStripes = LUI.UIImage.new( 0, 0, 1, 85, 0, 0, -37.5, -21.5 )
	BarStripes:setAlpha( 0 )
	BarStripes:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_bar" ) )
	BarStripes:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BarStripes )
	self.BarStripes = BarStripes
	
	local BarStripes2 = LUI.UIImage.new( 0, 0, 1, 85, 0, 0, 7.5, 23.5 )
	BarStripes2:setAlpha( 0 )
	BarStripes2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_bar" ) )
	BarStripes2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BarStripes2 )
	self.BarStripes2 = BarStripes2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_ScoreBarWidget.__onClose = function ( f2_arg0 )
	f2_arg0.RoundPipLeft:close()
end

