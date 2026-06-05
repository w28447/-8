require( "ui/uieditor/widgets/hud/zm_fx/zmfx_spark2ext" )

CoD.ZmRndDigitWidget = InheritFrom( LUI.UIElement )
CoD.ZmRndDigitWidget.__defaultWidth = 84
CoD.ZmRndDigitWidget.__defaultHeight = 120
CoD.ZmRndDigitWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmRndDigitWidget )
	self.id = "ZmRndDigitWidget"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Nine = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Nine:setAlpha( 0 )
	Nine:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9" ) )
	Nine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Nine )
	self.Nine = Nine
	
	local NineLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	NineLight:setAlpha( 0 )
	NineLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9_act" ) )
	NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	NineLight:setShaderVector( 0, 1, 0, 0, 0 )
	NineLight:setShaderVector( 1, 0, 0, 0, 0 )
	NineLight:setShaderVector( 2, 1, 0, 0, 0 )
	NineLight:setShaderVector( 3, 0, 0, 0, 0 )
	NineLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( NineLight )
	self.NineLight = NineLight
	
	local NineGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	NineGlow:setRGB( 1, 0.31, 0 )
	NineGlow:setAlpha( 0 )
	NineGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr9_glow" ) )
	NineGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NineGlow )
	self.NineGlow = NineGlow
	
	local Eight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Eight:setAlpha( 0 )
	Eight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8" ) )
	Eight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Eight )
	self.Eight = Eight
	
	local EightLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	EightLight:setAlpha( 0 )
	EightLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8_act" ) )
	EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EightLight:setShaderVector( 0, 1, 0, 0, 0 )
	EightLight:setShaderVector( 1, 0, 0, 0, 0 )
	EightLight:setShaderVector( 2, 1, 0, 0, 0 )
	EightLight:setShaderVector( 3, 0, 0, 0, 0 )
	EightLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( EightLight )
	self.EightLight = EightLight
	
	local EightGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	EightGlow:setRGB( 1, 0.31, 0 )
	EightGlow:setAlpha( 0 )
	EightGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr8_glow" ) )
	EightGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EightGlow )
	self.EightGlow = EightGlow
	
	local Seven = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Seven:setAlpha( 0 )
	Seven:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7" ) )
	Seven:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Seven )
	self.Seven = Seven
	
	local SevenLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	SevenLight:setAlpha( 0 )
	SevenLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7_act" ) )
	SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
	SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
	SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
	SevenLight:setShaderVector( 3, 0, 0, 0, 0 )
	SevenLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( SevenLight )
	self.SevenLight = SevenLight
	
	local SevenGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	SevenGlow:setRGB( 1, 0.31, 0 )
	SevenGlow:setAlpha( 0 )
	SevenGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr7_glow" ) )
	SevenGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SevenGlow )
	self.SevenGlow = SevenGlow
	
	local Six = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Six:setAlpha( 0 )
	Six:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6" ) )
	self:addElement( Six )
	self.Six = Six
	
	local SixLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	SixLight:setAlpha( 0 )
	SixLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6_act" ) )
	SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	SixLight:setShaderVector( 0, 1, 0, 0, 0 )
	SixLight:setShaderVector( 1, 0, 0, 0, 0 )
	SixLight:setShaderVector( 2, 1, 0, 0, 0 )
	SixLight:setShaderVector( 3, 0, 0, 0, 0 )
	SixLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( SixLight )
	self.SixLight = SixLight
	
	local SixGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	SixGlow:setRGB( 1, 0.31, 0 )
	SixGlow:setAlpha( 0 )
	SixGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr6_glow" ) )
	SixGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SixGlow )
	self.SixGlow = SixGlow
	
	local Five = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Five:setAlpha( 0 )
	Five:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5" ) )
	Five:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Five )
	self.Five = Five
	
	local FiveLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	FiveLight:setAlpha( 0 )
	FiveLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5_act" ) )
	FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
	FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
	FiveLight:setShaderVector( 2, 1, 0, 0, 0 )
	FiveLight:setShaderVector( 3, 0, 0, 0, 0 )
	FiveLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( FiveLight )
	self.FiveLight = FiveLight
	
	local FiveGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	FiveGlow:setRGB( 1, 0.31, 0 )
	FiveGlow:setAlpha( 0 )
	FiveGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr5_glow" ) )
	FiveGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FiveGlow )
	self.FiveGlow = FiveGlow
	
	local Four = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Four:setAlpha( 0 )
	Four:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4" ) )
	Four:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Four )
	self.Four = Four
	
	local FourLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	FourLight:setAlpha( 0 )
	FourLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4_act" ) )
	FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	FourLight:setShaderVector( 0, 1, 0, 0, 0 )
	FourLight:setShaderVector( 1, 0, 0, 0, 0 )
	FourLight:setShaderVector( 2, 1, 0, 0, 0 )
	FourLight:setShaderVector( 3, 0, 0, 0, 0 )
	FourLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( FourLight )
	self.FourLight = FourLight
	
	local FourGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	FourGlow:setRGB( 1, 0.31, 0 )
	FourGlow:setAlpha( 0 )
	FourGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr4_glow" ) )
	FourGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FourGlow )
	self.FourGlow = FourGlow
	
	local Three = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Three:setAlpha( 0 )
	Three:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3" ) )
	Three:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Three )
	self.Three = Three
	
	local ThreeLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	ThreeLight:setAlpha( 0 )
	ThreeLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3_act" ) )
	ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
	ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
	ThreeLight:setShaderVector( 2, 1, 0, 0, 0 )
	ThreeLight:setShaderVector( 3, 0, 0, 0, 0 )
	ThreeLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ThreeLight )
	self.ThreeLight = ThreeLight
	
	local ThreeGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	ThreeGlow:setRGB( 1, 0.31, 0 )
	ThreeGlow:setAlpha( 0 )
	ThreeGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr3_glow" ) )
	ThreeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ThreeGlow )
	self.ThreeGlow = ThreeGlow
	
	local Two = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Two:setAlpha( 0 )
	Two:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2" ) )
	self:addElement( Two )
	self.Two = Two
	
	local TwoLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	TwoLight:setAlpha( 0 )
	TwoLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2_act" ) )
	TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
	TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
	TwoLight:setShaderVector( 2, 1, 0, 0, 0 )
	TwoLight:setShaderVector( 3, 0, 0, 0, 0 )
	TwoLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( TwoLight )
	self.TwoLight = TwoLight
	
	local TwoGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	TwoGlow:setRGB( 1, 0.31, 0 )
	TwoGlow:setAlpha( 0 )
	TwoGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr2_glow" ) )
	TwoGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoGlow )
	self.TwoGlow = TwoGlow
	
	local One = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	One:setAlpha( 0 )
	One:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1" ) )
	One:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( One )
	self.One = One
	
	local OneLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	OneLight:setAlpha( 0 )
	OneLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1_act" ) )
	OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	OneLight:setShaderVector( 0, 1, 0, 0, 0 )
	OneLight:setShaderVector( 1, 0, 0, 0, 0 )
	OneLight:setShaderVector( 2, 1, 0, 0, 0 )
	OneLight:setShaderVector( 3, 0, 0, 0, 0 )
	OneLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( OneLight )
	self.OneLight = OneLight
	
	local OneGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	OneGlow:setRGB( 1, 0.31, 0 )
	OneGlow:setAlpha( 0 )
	OneGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr1_glow" ) )
	OneGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OneGlow )
	self.OneGlow = OneGlow
	
	local Zero = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	Zero:setAlpha( 0 )
	Zero:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0" ) )
	Zero:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Zero )
	self.Zero = Zero
	
	local ZeroLight = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	ZeroLight:setAlpha( 0 )
	ZeroLight:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0_act" ) )
	ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
	ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
	ZeroLight:setShaderVector( 2, 1, 0, 0, 0 )
	ZeroLight:setShaderVector( 3, 0, 0, 0, 0 )
	ZeroLight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ZeroLight )
	self.ZeroLight = ZeroLight
	
	local ZeroGlow = LUI.UIImage.new( 0, 0, 0, 84, 0, 0, 0, 120 )
	ZeroGlow:setRGB( 1, 0.31, 0 )
	ZeroGlow:setAlpha( 0 )
	ZeroGlow:setImage( RegisterImage( "uie_t7_zm_hud_rnd_nmbr0_glow" ) )
	ZeroGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZeroGlow )
	self.ZeroGlow = ZeroGlow
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( f1_arg0, f1_arg1, 0, 0, -26, 142, 0, 0, -206, 46 )
	ZmFxSpark2Ext0:setAlpha( 0 )
	ZmFxSpark2Ext0:setZRot( 9 )
	ZmFxSpark2Ext0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local ZmFxSpark2Ext00 = CoD.ZmFx_Spark2Ext.new( f1_arg0, f1_arg1, 0, 0, -5, 163, 0, 0, -192, 60 )
	ZmFxSpark2Ext00:setAlpha( 0 )
	ZmFxSpark2Ext00:setZRot( 9 )
	ZmFxSpark2Ext00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00 )
	self.ZmFxSpark2Ext00 = ZmFxSpark2Ext00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmRndDigitWidget.__resetProperties = function ( f2_arg0 )
	f2_arg0.One:completeAnimation()
	f2_arg0.OneLight:completeAnimation()
	f2_arg0.ZmFxSpark2Ext0:completeAnimation()
	f2_arg0.OneGlow:completeAnimation()
	f2_arg0.Two:completeAnimation()
	f2_arg0.TwoLight:completeAnimation()
	f2_arg0.TwoGlow:completeAnimation()
	f2_arg0.Three:completeAnimation()
	f2_arg0.ThreeLight:completeAnimation()
	f2_arg0.ThreeGlow:completeAnimation()
	f2_arg0.FourLight:completeAnimation()
	f2_arg0.ZmFxSpark2Ext00:completeAnimation()
	f2_arg0.FourGlow:completeAnimation()
	f2_arg0.Four:completeAnimation()
	f2_arg0.Five:completeAnimation()
	f2_arg0.FiveLight:completeAnimation()
	f2_arg0.FiveGlow:completeAnimation()
	f2_arg0.Six:completeAnimation()
	f2_arg0.SixLight:completeAnimation()
	f2_arg0.SixGlow:completeAnimation()
	f2_arg0.Seven:completeAnimation()
	f2_arg0.SevenLight:completeAnimation()
	f2_arg0.SevenGlow:completeAnimation()
	f2_arg0.Eight:completeAnimation()
	f2_arg0.EightLight:completeAnimation()
	f2_arg0.EightGlow:completeAnimation()
	f2_arg0.Nine:completeAnimation()
	f2_arg0.NineLight:completeAnimation()
	f2_arg0.NineGlow:completeAnimation()
	f2_arg0.ZeroLight:completeAnimation()
	f2_arg0.Zero:completeAnimation()
	f2_arg0.ZeroGlow:completeAnimation()
	f2_arg0.One:setAlpha( 0 )
	f2_arg0.OneLight:setAlpha( 0 )
	f2_arg0.OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.OneLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.OneLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.OneLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.OneLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.OneLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -26, 142 )
	f2_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -206, 46 )
	f2_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
	f2_arg0.OneGlow:setAlpha( 0 )
	f2_arg0.Two:setAlpha( 0 )
	f2_arg0.TwoLight:setAlpha( 0 )
	f2_arg0.TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.TwoLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.TwoLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.TwoLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.TwoGlow:setAlpha( 0 )
	f2_arg0.Three:setAlpha( 0 )
	f2_arg0.ThreeLight:setAlpha( 0 )
	f2_arg0.ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.ThreeLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.ThreeLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.ThreeLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.ThreeGlow:setAlpha( 0 )
	f2_arg0.FourLight:setAlpha( 0 )
	f2_arg0.FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.FourLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.FourLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.FourLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.FourLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.FourLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, -5, 163 )
	f2_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -192, 60 )
	f2_arg0.ZmFxSpark2Ext00:setAlpha( 0 )
	f2_arg0.FourGlow:setAlpha( 0 )
	f2_arg0.Four:setAlpha( 0 )
	f2_arg0.Five:setAlpha( 0 )
	f2_arg0.FiveLight:setAlpha( 0 )
	f2_arg0.FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.FiveLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.FiveLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.FiveLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.FiveGlow:setAlpha( 0 )
	f2_arg0.Six:setAlpha( 0 )
	f2_arg0.SixLight:setAlpha( 0 )
	f2_arg0.SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.SixLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.SixLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.SixLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.SixLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.SixLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.SixGlow:setAlpha( 0 )
	f2_arg0.Seven:setAlpha( 0 )
	f2_arg0.SevenLight:setAlpha( 0 )
	f2_arg0.SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.SevenLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.SevenLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.SevenGlow:setAlpha( 0 )
	f2_arg0.Eight:setAlpha( 0 )
	f2_arg0.EightLight:setAlpha( 0 )
	f2_arg0.EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.EightLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.EightLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.EightLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.EightLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.EightLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.EightGlow:setAlpha( 0 )
	f2_arg0.Nine:setAlpha( 0 )
	f2_arg0.NineLight:setAlpha( 0 )
	f2_arg0.NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.NineLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.NineLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.NineLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.NineLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.NineLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.NineGlow:setAlpha( 0 )
	f2_arg0.ZeroLight:setAlpha( 0 )
	f2_arg0.ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	f2_arg0.ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
	f2_arg0.ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
	f2_arg0.ZeroLight:setShaderVector( 2, 1, 0, 0, 0 )
	f2_arg0.ZeroLight:setShaderVector( 3, 0, 0, 0, 0 )
	f2_arg0.ZeroLight:setShaderVector( 4, 0, 0, 0, 0 )
	f2_arg0.Zero:setAlpha( 0 )
	f2_arg0.ZeroGlow:setAlpha( 0 )
end

CoD.ZmRndDigitWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 0 )
		end
	},
	One = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 4 )
			local f4_local0 = function ( f5_arg0 )
				local f5_local0 = function ( f6_arg0 )
					f6_arg0:beginAnimation( 1510 )
					f6_arg0:setAlpha( 1 )
					f6_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
				end
				
				f4_arg0.One:beginAnimation( 1500 )
				f4_arg0.One:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.One:registerEventHandler( "transition_complete_keyframe", f5_local0 )
			end
			
			f4_arg0.One:completeAnimation()
			f4_arg0.One:setAlpha( 0 )
			f4_local0( f4_arg0.One )
			local f4_local1 = function ( f7_arg0 )
				local f7_local0 = function ( f8_arg0 )
					local f8_local0 = function ( f9_arg0 )
						f9_arg0:beginAnimation( 2210 )
						f9_arg0:setAlpha( 0 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
					end
					
					f8_arg0:beginAnimation( 610 )
					f8_arg0:setShaderVector( 2, 1.16, 0, 0, 0 )
					f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
				end
				
				f4_arg0.OneLight:beginAnimation( 190 )
				f4_arg0.OneLight:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.OneLight:registerEventHandler( "transition_complete_keyframe", f7_local0 )
			end
			
			f4_arg0.OneLight:completeAnimation()
			f4_arg0.OneLight:setAlpha( 1 )
			f4_arg0.OneLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f4_arg0.OneLight:setShaderVector( 0, 1, 0, 0, 0 )
			f4_arg0.OneLight:setShaderVector( 1, 0, 0, 0, 0 )
			f4_arg0.OneLight:setShaderVector( 2, 0, 0, 0, 0 )
			f4_arg0.OneLight:setShaderVector( 3, 0.26, 0, 0, 0 )
			f4_arg0.OneLight:setShaderVector( 4, 0, 0, 0, 0 )
			f4_local1( f4_arg0.OneLight )
			local f4_local2 = function ( f10_arg0 )
				local f10_local0 = function ( f11_arg0 )
					local f11_local0 = function ( f12_arg0 )
						f12_arg0:beginAnimation( 1010 )
						f12_arg0:setAlpha( 0 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
					end
					
					f11_arg0:beginAnimation( 1510 )
					f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
				end
				
				f4_arg0.OneGlow:beginAnimation( 490 )
				f4_arg0.OneGlow:setAlpha( 1 )
				f4_arg0.OneGlow:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.OneGlow:registerEventHandler( "transition_complete_keyframe", f10_local0 )
			end
			
			f4_arg0.OneGlow:completeAnimation()
			f4_arg0.OneGlow:setAlpha( 0 )
			f4_local2( f4_arg0.OneGlow )
			local f4_local3 = function ( f13_arg0 )
				local f13_local0 = function ( f14_arg0 )
					local f14_local0 = function ( f15_arg0 )
						local f15_local0 = function ( f16_arg0 )
							f16_arg0:beginAnimation( 450 )
							f16_arg0:setAlpha( 0 )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
						end
						
						f15_arg0:beginAnimation( 610 )
						f15_arg0:setLeftRight( 0, 0, -20, 148 )
						f15_arg0:setTopBottom( 0, 0, -113, 139 )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
					
					f14_arg0:beginAnimation( 80 )
					f14_arg0:setAlpha( 0.8 )
					f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
				end
				
				f4_arg0.ZmFxSpark2Ext0:beginAnimation( 110 )
				f4_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
			end
			
			f4_arg0.ZmFxSpark2Ext0:completeAnimation()
			f4_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -26, 142 )
			f4_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -206, 46 )
			f4_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f4_local3( f4_arg0.ZmFxSpark2Ext0 )
		end
	},
	Two = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 4 )
			local f17_local0 = function ( f18_arg0 )
				local f18_local0 = function ( f19_arg0 )
					f19_arg0:beginAnimation( 1520 )
					f19_arg0:setAlpha( 1 )
					f19_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.Two:beginAnimation( 1500 )
				f17_arg0.Two:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.Two:registerEventHandler( "transition_complete_keyframe", f18_local0 )
			end
			
			f17_arg0.Two:completeAnimation()
			f17_arg0.Two:setAlpha( 0 )
			f17_local0( f17_arg0.Two )
			local f17_local1 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					local f21_local0 = function ( f22_arg0 )
						f22_arg0:beginAnimation( 1000 )
						f22_arg0:setAlpha( 0 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
					end
					
					f21_arg0:beginAnimation( 810 )
					f21_arg0:setAlpha( 0.55 )
					f21_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
				end
				
				f17_arg0.TwoLight:beginAnimation( 200 )
				f17_arg0.TwoLight:setAlpha( 1 )
				f17_arg0.TwoLight:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TwoLight:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f17_arg0.TwoLight:completeAnimation()
			f17_arg0.TwoLight:setAlpha( 0 )
			f17_arg0.TwoLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f17_arg0.TwoLight:setShaderVector( 0, 1, 0, 0, 0 )
			f17_arg0.TwoLight:setShaderVector( 1, 0, 0, 0, 0 )
			f17_arg0.TwoLight:setShaderVector( 2, 0, 0, 0, 0 )
			f17_arg0.TwoLight:setShaderVector( 3, 0.22, 0, 0, 0 )
			f17_arg0.TwoLight:setShaderVector( 4, 0, 0, 0, 0 )
			f17_local1( f17_arg0.TwoLight )
			local f17_local2 = function ( f23_arg0 )
				local f23_local0 = function ( f24_arg0 )
					local f24_local0 = function ( f25_arg0 )
						local f25_local0 = function ( f26_arg0 )
							f26_arg0:beginAnimation( 1010 )
							f26_arg0:setAlpha( 0 )
							f26_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
						end
						
						f25_arg0:beginAnimation( 1380 )
						f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
					end
					
					f24_arg0:beginAnimation( 430 )
					f24_arg0:setAlpha( 1 )
					f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
				end
				
				f17_arg0.TwoGlow:beginAnimation( 200 )
				f17_arg0.TwoGlow:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TwoGlow:registerEventHandler( "transition_complete_keyframe", f23_local0 )
			end
			
			f17_arg0.TwoGlow:completeAnimation()
			f17_arg0.TwoGlow:setAlpha( 0 )
			f17_local2( f17_arg0.TwoGlow )
			local f17_local3 = function ( f27_arg0 )
				local f27_local0 = function ( f28_arg0 )
					local f28_local0 = function ( f29_arg0 )
						local f29_local0 = function ( f30_arg0 )
							local f30_local0 = function ( f31_arg0 )
								local f31_local0 = function ( f32_arg0 )
									local f32_local0 = function ( f33_arg0 )
										local f33_local0 = function ( f34_arg0 )
											local f34_local0 = function ( f35_arg0 )
												f35_arg0:beginAnimation( 359 )
												f35_arg0:setAlpha( 0 )
												f35_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
											end
											
											f34_arg0:beginAnimation( 50 )
											f34_arg0:setLeftRight( 0, 0, -11, 157 )
											f34_arg0:setTopBottom( 0, 0, -129, 123 )
											f34_arg0:setAlpha( 0.7 )
											f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
										end
										
										f33_arg0:beginAnimation( 79 )
										f33_arg0:setLeftRight( 0, 0, -18.69, 149.31 )
										f33_arg0:setTopBottom( 0, 0, -124, 128 )
										f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
									end
									
									f32_arg0:beginAnimation( 139 )
									f32_arg0:setLeftRight( 0, 0, -31, 137 )
									f32_arg0:setTopBottom( 0, 0, -116, 136 )
									f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
								end
								
								f31_arg0:beginAnimation( 150 )
								f31_arg0:setLeftRight( 0, 0, -25, 143 )
								f31_arg0:setTopBottom( 0, 0, -138, 114 )
								f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
							end
							
							f30_arg0:beginAnimation( 189 )
							f30_arg0:setLeftRight( 0, 0, -17, 151 )
							f30_arg0:setTopBottom( 0, 0, -170, 82 )
							f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
						end
						
						f29_arg0:beginAnimation( 160 )
						f29_arg0:setLeftRight( 0, 0, -16, 152 )
						f29_arg0:setTopBottom( 0, 0, -192, 60 )
						f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
					end
					
					f28_arg0:beginAnimation( 100 )
					f28_arg0:setLeftRight( 0, 0, -29, 139 )
					f28_arg0:setTopBottom( 0, 0, -198, 54 )
					f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
				end
				
				f17_arg0.ZmFxSpark2Ext0:beginAnimation( 200 )
				f17_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f17_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
			end
			
			f17_arg0.ZmFxSpark2Ext0:completeAnimation()
			f17_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -44, 124 )
			f17_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -182, 70 )
			f17_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f17_local3( f17_arg0.ZmFxSpark2Ext0 )
		end
	},
	Three = {
		DefaultClip = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 4 )
			local f36_local0 = function ( f37_arg0 )
				local f37_local0 = function ( f38_arg0 )
					f38_arg0:beginAnimation( 1480 )
					f38_arg0:setAlpha( 1 )
					f38_arg0:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
				end
				
				f36_arg0.Three:beginAnimation( 1530 )
				f36_arg0.Three:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.Three:registerEventHandler( "transition_complete_keyframe", f37_local0 )
			end
			
			f36_arg0.Three:completeAnimation()
			f36_arg0.Three:setAlpha( 0 )
			f36_local0( f36_arg0.Three )
			local f36_local1 = function ( f39_arg0 )
				local f39_local0 = function ( f40_arg0 )
					local f40_local0 = function ( f41_arg0 )
						f41_arg0:beginAnimation( 2000 )
						f41_arg0:setAlpha( 0 )
						f41_arg0:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
					end
					
					f40_arg0:beginAnimation( 810 )
					f40_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
				end
				
				f36_arg0.ThreeLight:beginAnimation( 200 )
				f36_arg0.ThreeLight:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.ThreeLight:registerEventHandler( "transition_complete_keyframe", f39_local0 )
			end
			
			f36_arg0.ThreeLight:completeAnimation()
			f36_arg0.ThreeLight:setAlpha( 1 )
			f36_arg0.ThreeLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f36_arg0.ThreeLight:setShaderVector( 0, 1, 0, 0, 0 )
			f36_arg0.ThreeLight:setShaderVector( 1, 0, 0, 0, 0 )
			f36_arg0.ThreeLight:setShaderVector( 2, 0, 0, 0, 0 )
			f36_arg0.ThreeLight:setShaderVector( 3, 0.21, 0, 0, 0 )
			f36_arg0.ThreeLight:setShaderVector( 4, 0, 0, 0, 0 )
			f36_local1( f36_arg0.ThreeLight )
			local f36_local2 = function ( f42_arg0 )
				local f42_local0 = function ( f43_arg0 )
					local f43_local0 = function ( f44_arg0 )
						local f44_local0 = function ( f45_arg0 )
							f45_arg0:beginAnimation( 1000 )
							f45_arg0:setAlpha( 0 )
							f45_arg0:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
						end
						
						f44_arg0:beginAnimation( 1530 )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
					
					f43_arg0:beginAnimation( 279 )
					f43_arg0:setAlpha( 1 )
					f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
				end
				
				f36_arg0.ThreeGlow:beginAnimation( 200 )
				f36_arg0.ThreeGlow:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.ThreeGlow:registerEventHandler( "transition_complete_keyframe", f42_local0 )
			end
			
			f36_arg0.ThreeGlow:completeAnimation()
			f36_arg0.ThreeGlow:setAlpha( 0 )
			f36_local2( f36_arg0.ThreeGlow )
			local f36_local3 = function ( f46_arg0 )
				local f46_local0 = function ( f47_arg0 )
					local f47_local0 = function ( f48_arg0 )
						local f48_local0 = function ( f49_arg0 )
							local f49_local0 = function ( f50_arg0 )
								local f50_local0 = function ( f51_arg0 )
									local f51_local0 = function ( f52_arg0 )
										local f52_local0 = function ( f53_arg0 )
											local f53_local0 = function ( f54_arg0 )
												local f54_local0 = function ( f55_arg0 )
													local f55_local0 = function ( f56_arg0 )
														local f56_local0 = function ( f57_arg0 )
															local f57_local0 = function ( f58_arg0 )
																f58_arg0:beginAnimation( 2240 )
																f58_arg0:setLeftRight( 0, 0, -29, 139 )
																f58_arg0:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
															end
															
															f57_arg0:beginAnimation( 470 )
															f57_arg0:setLeftRight( 0, 0, -28.17, 139.83 )
															f57_arg0:setAlpha( 0 )
															f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
														end
														
														f56_arg0:beginAnimation( 79 )
														f56_arg0:setLeftRight( 0, 0, -28, 140 )
														f56_arg0:setTopBottom( 0, 0, -108, 144 )
														f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
													end
													
													f55_arg0:beginAnimation( 90 )
													f55_arg0:setLeftRight( 0, 0, -4, 164 )
													f55_arg0:setTopBottom( 0, 0, -129, 123 )
													f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
												end
												
												f54_arg0:beginAnimation( 100 )
												f54_arg0:setLeftRight( 0, 0, -5, 163 )
												f54_arg0:setTopBottom( 0, 0, -142, 110 )
												f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
											end
											
											f53_arg0:beginAnimation( 109 )
											f53_arg0:setLeftRight( 0, 0, -24, 144 )
											f53_arg0:setTopBottom( 0, 0, -154, 98 )
											f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
										end
										
										f52_arg0:beginAnimation( 120 )
										f52_arg0:setLeftRight( 0, 0, -16, 152 )
										f52_arg0:setTopBottom( 0, 0, -165, 87 )
										f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
									end
									
									f51_arg0:beginAnimation( 110 )
									f51_arg0:setLeftRight( 0, 0, -8, 160 )
									f51_arg0:setTopBottom( 0, 0, -180, 72 )
									f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
								end
								
								f50_arg0:beginAnimation( 99 )
								f50_arg0:setLeftRight( 0, 0, -15, 153 )
								f50_arg0:setTopBottom( 0, 0, -202, 50 )
								f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
							end
							
							f49_arg0:beginAnimation( 100 )
							f49_arg0:setLeftRight( 0, 0, -28, 140 )
							f49_arg0:setTopBottom( 0, 0, -206, 46 )
							f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
						end
						
						f48_arg0:beginAnimation( 69 )
						f48_arg0:setLeftRight( 0, 0, -38.59, 129.41 )
						f48_arg0:setTopBottom( 0, 0, -190.71, 61.29 )
						f48_arg0:setAlpha( 0.8 )
						f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
					end
					
					f47_arg0:beginAnimation( 40 )
					f47_arg0:setAlpha( 0.29 )
					f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
				end
				
				f36_arg0.ZmFxSpark2Ext0:beginAnimation( 130 )
				f36_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
			end
			
			f36_arg0.ZmFxSpark2Ext0:completeAnimation()
			f36_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -46, 122 )
			f36_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -180, 72 )
			f36_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f36_local3( f36_arg0.ZmFxSpark2Ext0 )
		end
	},
	Four = {
		DefaultClip = function ( f59_arg0, f59_arg1 )
			f59_arg0:__resetProperties()
			f59_arg0:setupElementClipCounter( 5 )
			local f59_local0 = function ( f60_arg0 )
				local f60_local0 = function ( f61_arg0 )
					f61_arg0:beginAnimation( 1540 )
					f61_arg0:setAlpha( 1 )
					f61_arg0:registerEventHandler( "transition_complete_keyframe", f59_arg0.clipFinished )
				end
				
				f59_arg0.Four:beginAnimation( 1480 )
				f59_arg0.Four:registerEventHandler( "interrupted_keyframe", f59_arg0.clipInterrupted )
				f59_arg0.Four:registerEventHandler( "transition_complete_keyframe", f60_local0 )
			end
			
			f59_arg0.Four:completeAnimation()
			f59_arg0.Four:setAlpha( 0 )
			f59_local0( f59_arg0.Four )
			local f59_local1 = function ( f62_arg0 )
				local f62_local0 = function ( f63_arg0 )
					local f63_local0 = function ( f64_arg0 )
						local f64_local0 = function ( f65_arg0 )
							f65_arg0:beginAnimation( 650 )
							f65_arg0:setAlpha( 0 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f59_arg0.clipFinished )
						end
						
						f64_arg0:beginAnimation( 380 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
					
					f63_arg0:beginAnimation( 850 )
					f63_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
				end
				
				f59_arg0.FourLight:beginAnimation( 150 )
				f59_arg0.FourLight:registerEventHandler( "interrupted_keyframe", f59_arg0.clipInterrupted )
				f59_arg0.FourLight:registerEventHandler( "transition_complete_keyframe", f62_local0 )
			end
			
			f59_arg0.FourLight:completeAnimation()
			f59_arg0.FourLight:setAlpha( 1 )
			f59_arg0.FourLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f59_arg0.FourLight:setShaderVector( 0, 1, 0, 0, 0 )
			f59_arg0.FourLight:setShaderVector( 1, 0, 0, 0, 0 )
			f59_arg0.FourLight:setShaderVector( 2, 0, 0, 0, 0 )
			f59_arg0.FourLight:setShaderVector( 3, 0.22, 0, 0, 0 )
			f59_arg0.FourLight:setShaderVector( 4, 0, 0, 0, 0 )
			f59_local1( f59_arg0.FourLight )
			local f59_local2 = function ( f66_arg0 )
				local f66_local0 = function ( f67_arg0 )
					local f67_local0 = function ( f68_arg0 )
						f68_arg0:beginAnimation( 1000 )
						f68_arg0:setAlpha( 0 )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f59_arg0.clipFinished )
					end
					
					f67_arg0:beginAnimation( 1780 )
					f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
				end
				
				f59_arg0.FourGlow:beginAnimation( 240 )
				f59_arg0.FourGlow:setAlpha( 1 )
				f59_arg0.FourGlow:registerEventHandler( "interrupted_keyframe", f59_arg0.clipInterrupted )
				f59_arg0.FourGlow:registerEventHandler( "transition_complete_keyframe", f66_local0 )
			end
			
			f59_arg0.FourGlow:completeAnimation()
			f59_arg0.FourGlow:setAlpha( 0 )
			f59_local2( f59_arg0.FourGlow )
			local f59_local3 = function ( f69_arg0 )
				local f69_local0 = function ( f70_arg0 )
					local f70_local0 = function ( f71_arg0 )
						local f71_local0 = function ( f72_arg0 )
							local f72_local0 = function ( f73_arg0 )
								f73_arg0:beginAnimation( 149 )
								f73_arg0:setAlpha( 0 )
								f73_arg0:registerEventHandler( "transition_complete_keyframe", f59_arg0.clipFinished )
							end
							
							f72_arg0:beginAnimation( 130 )
							f72_arg0:setLeftRight( 0, 0, -7, 161 )
							f72_arg0:setTopBottom( 0, 0, -176, 76 )
							f72_arg0:setAlpha( 0.43 )
							f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
						end
						
						f71_arg0:beginAnimation( 140 )
						f71_arg0:setLeftRight( 0, 0, -21.93, 146.07 )
						f71_arg0:setTopBottom( 0, 0, -166.37, 85.63 )
						f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
					end
					
					f70_arg0:beginAnimation( 429 )
					f70_arg0:setLeftRight( 0, 0, -38, 130 )
					f70_arg0:setTopBottom( 0, 0, -156, 96 )
					f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
				end
				
				f59_arg0.ZmFxSpark2Ext0:beginAnimation( 150 )
				f59_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -33.55, 134.45 )
				f59_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -190.84, 61.16 )
				f59_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f59_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f59_arg0.clipInterrupted )
				f59_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
			end
			
			f59_arg0.ZmFxSpark2Ext0:completeAnimation()
			f59_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -32, 136 )
			f59_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -203, 49 )
			f59_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f59_local3( f59_arg0.ZmFxSpark2Ext0 )
			local f59_local4 = function ( f74_arg0 )
				local f74_local0 = function ( f75_arg0 )
					local f75_local0 = function ( f76_arg0 )
						local f76_local0 = function ( f77_arg0 )
							f77_arg0:beginAnimation( 470 )
							f77_arg0:setAlpha( 0 )
							f77_arg0:registerEventHandler( "transition_complete_keyframe", f59_arg0.clipFinished )
						end
						
						f76_arg0:beginAnimation( 190 )
						f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
					end
					
					f75_arg0:beginAnimation( 520 )
					f75_arg0:setLeftRight( 0, 0, -16, 152 )
					f75_arg0:setTopBottom( 0, 0, -114, 138 )
					f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
				end
				
				f59_arg0.ZmFxSpark2Ext00:beginAnimation( 150 )
				f59_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, -9.01, 158.99 )
				f59_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -176.87, 75.13 )
				f59_arg0.ZmFxSpark2Ext00:setAlpha( 0.8 )
				f59_arg0.ZmFxSpark2Ext00:registerEventHandler( "interrupted_keyframe", f59_arg0.clipInterrupted )
				f59_arg0.ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", f74_local0 )
			end
			
			f59_arg0.ZmFxSpark2Ext00:completeAnimation()
			f59_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, -7, 161 )
			f59_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -195, 57 )
			f59_arg0.ZmFxSpark2Ext00:setAlpha( 0 )
			f59_local4( f59_arg0.ZmFxSpark2Ext00 )
		end
	},
	Five = {
		DefaultClip = function ( f78_arg0, f78_arg1 )
			f78_arg0:__resetProperties()
			f78_arg0:setupElementClipCounter( 4 )
			local f78_local0 = function ( f79_arg0 )
				local f79_local0 = function ( f80_arg0 )
					f80_arg0:beginAnimation( 1530 )
					f80_arg0:setAlpha( 1 )
					f80_arg0:registerEventHandler( "transition_complete_keyframe", f78_arg0.clipFinished )
				end
				
				f78_arg0.Five:beginAnimation( 1490 )
				f78_arg0.Five:registerEventHandler( "interrupted_keyframe", f78_arg0.clipInterrupted )
				f78_arg0.Five:registerEventHandler( "transition_complete_keyframe", f79_local0 )
			end
			
			f78_arg0.Five:completeAnimation()
			f78_arg0.Five:setAlpha( 0 )
			f78_local0( f78_arg0.Five )
			local f78_local1 = function ( f81_arg0 )
				local f81_local0 = function ( f82_arg0 )
					local f82_local0 = function ( f83_arg0 )
						f83_arg0:beginAnimation( 1020 )
						f83_arg0:setAlpha( 0 )
						f83_arg0:registerEventHandler( "transition_complete_keyframe", f78_arg0.clipFinished )
					end
					
					f82_arg0:beginAnimation( 810 )
					f82_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
				end
				
				f78_arg0.FiveLight:beginAnimation( 190 )
				f78_arg0.FiveLight:registerEventHandler( "interrupted_keyframe", f78_arg0.clipInterrupted )
				f78_arg0.FiveLight:registerEventHandler( "transition_complete_keyframe", f81_local0 )
			end
			
			f78_arg0.FiveLight:completeAnimation()
			f78_arg0.FiveLight:setAlpha( 1 )
			f78_arg0.FiveLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f78_arg0.FiveLight:setShaderVector( 0, 1, 0, 0, 0 )
			f78_arg0.FiveLight:setShaderVector( 1, 0, 0, 0, 0 )
			f78_arg0.FiveLight:setShaderVector( 2, 0, 0, 0, 0 )
			f78_arg0.FiveLight:setShaderVector( 3, 0.2, 0, 0, 0 )
			f78_arg0.FiveLight:setShaderVector( 4, 0, 0, 0, 0 )
			f78_local1( f78_arg0.FiveLight )
			local f78_local2 = function ( f84_arg0 )
				local f84_local0 = function ( f85_arg0 )
					local f85_local0 = function ( f86_arg0 )
						f86_arg0:beginAnimation( 1000 )
						f86_arg0:setAlpha( 0 )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f78_arg0.clipFinished )
					end
					
					f85_arg0:beginAnimation( 1650 )
					f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
				end
				
				f78_arg0.FiveGlow:beginAnimation( 370 )
				f78_arg0.FiveGlow:setAlpha( 1 )
				f78_arg0.FiveGlow:registerEventHandler( "interrupted_keyframe", f78_arg0.clipInterrupted )
				f78_arg0.FiveGlow:registerEventHandler( "transition_complete_keyframe", f84_local0 )
			end
			
			f78_arg0.FiveGlow:completeAnimation()
			f78_arg0.FiveGlow:setAlpha( 0 )
			f78_local2( f78_arg0.FiveGlow )
			local f78_local3 = function ( f87_arg0 )
				local f87_local0 = function ( f88_arg0 )
					local f88_local0 = function ( f89_arg0 )
						local f89_local0 = function ( f90_arg0 )
							local f90_local0 = function ( f91_arg0 )
								local f91_local0 = function ( f92_arg0 )
									local f92_local0 = function ( f93_arg0 )
										local f93_local0 = function ( f94_arg0 )
											local f94_local0 = function ( f95_arg0 )
												local f95_local0 = function ( f96_arg0 )
													f96_arg0:beginAnimation( 289 )
													f96_arg0:setAlpha( 0 )
													f96_arg0:registerEventHandler( "transition_complete_keyframe", f78_arg0.clipFinished )
												end
												
												f95_arg0:beginAnimation( 100 )
												f95_arg0:setLeftRight( 0, 0, -34, 134 )
												f95_arg0:setTopBottom( 0, 0, -110, 142 )
												f95_arg0:setAlpha( 0.59 )
												f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
											end
											
											f94_arg0:beginAnimation( 50 )
											f94_arg0:setLeftRight( 0, 0, -28, 140 )
											f94_arg0:setTopBottom( 0, 0, -108, 144 )
											f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
										end
										
										f93_arg0:beginAnimation( 59 )
										f93_arg0:setLeftRight( 0, 0, -14, 154 )
										f93_arg0:setTopBottom( 0, 0, -113, 139 )
										f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
									end
									
									f92_arg0:beginAnimation( 150 )
									f92_arg0:setLeftRight( 0, 0, -8, 160 )
									f92_arg0:setTopBottom( 0, 0, -123, 129 )
									f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
								end
								
								f91_arg0:beginAnimation( 79 )
								f91_arg0:setLeftRight( 0, 0, -11, 157 )
								f91_arg0:setTopBottom( 0, 0, -141, 111 )
								f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
							end
							
							f90_arg0:beginAnimation( 89 )
							f90_arg0:setLeftRight( 0, 0, -21, 147 )
							f90_arg0:setTopBottom( 0, 0, -166, 86 )
							f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
						end
						
						f89_arg0:beginAnimation( 290 )
						f89_arg0:setLeftRight( 0, 0, -35, 133 )
						f89_arg0:setTopBottom( 0, 0, -165, 87 )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
					
					f88_arg0:beginAnimation( 179 )
					f88_arg0:setLeftRight( 0, 0, -34, 134 )
					f88_arg0:setTopBottom( 0, 0, -200, 52 )
					f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
				end
				
				f78_arg0.ZmFxSpark2Ext0:beginAnimation( 200 )
				f78_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -23.11, 144.89 )
				f78_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -204.74, 47.26 )
				f78_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f78_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f78_arg0.clipInterrupted )
				f78_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
			end
			
			f78_arg0.ZmFxSpark2Ext0:completeAnimation()
			f78_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -11, 157 )
			f78_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -210, 42 )
			f78_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f78_local3( f78_arg0.ZmFxSpark2Ext0 )
		end
	},
	Six = {
		DefaultClip = function ( f97_arg0, f97_arg1 )
			f97_arg0:__resetProperties()
			f97_arg0:setupElementClipCounter( 4 )
			local f97_local0 = function ( f98_arg0 )
				local f98_local0 = function ( f99_arg0 )
					f99_arg0:beginAnimation( 1550 )
					f99_arg0:setAlpha( 1 )
					f99_arg0:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
				end
				
				f97_arg0.Six:beginAnimation( 1470 )
				f97_arg0.Six:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.Six:registerEventHandler( "transition_complete_keyframe", f98_local0 )
			end
			
			f97_arg0.Six:completeAnimation()
			f97_arg0.Six:setAlpha( 0 )
			f97_local0( f97_arg0.Six )
			local f97_local1 = function ( f100_arg0 )
				local f100_local0 = function ( f101_arg0 )
					local f101_local0 = function ( f102_arg0 )
						local f102_local0 = function ( f103_arg0 )
							f103_arg0:beginAnimation( 510 )
							f103_arg0:setAlpha( 0 )
							f103_arg0:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
						end
						
						f102_arg0:beginAnimation( 630 )
						f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
					end
					
					f101_arg0:beginAnimation( 720 )
					f101_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
				end
				
				f97_arg0.SixLight:beginAnimation( 160 )
				f97_arg0.SixLight:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.SixLight:registerEventHandler( "transition_complete_keyframe", f100_local0 )
			end
			
			f97_arg0.SixLight:completeAnimation()
			f97_arg0.SixLight:setAlpha( 1 )
			f97_arg0.SixLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f97_arg0.SixLight:setShaderVector( 0, 1, 0, 0, 0 )
			f97_arg0.SixLight:setShaderVector( 1, 0, 0, 0, 0 )
			f97_arg0.SixLight:setShaderVector( 2, 0, 0, 0, 0 )
			f97_arg0.SixLight:setShaderVector( 3, 0.2, 0, 0, 0 )
			f97_arg0.SixLight:setShaderVector( 4, 0, 0, 0, 0 )
			f97_local1( f97_arg0.SixLight )
			local f97_local2 = function ( f104_arg0 )
				local f104_local0 = function ( f105_arg0 )
					local f105_local0 = function ( f106_arg0 )
						f106_arg0:beginAnimation( 1000 )
						f106_arg0:setAlpha( 0 )
						f106_arg0:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
					end
					
					f105_arg0:beginAnimation( 1600 )
					f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
				end
				
				f97_arg0.SixGlow:beginAnimation( 420 )
				f97_arg0.SixGlow:setAlpha( 1 )
				f97_arg0.SixGlow:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.SixGlow:registerEventHandler( "transition_complete_keyframe", f104_local0 )
			end
			
			f97_arg0.SixGlow:completeAnimation()
			f97_arg0.SixGlow:setAlpha( 0 )
			f97_local2( f97_arg0.SixGlow )
			local f97_local3 = function ( f107_arg0 )
				local f107_local0 = function ( f108_arg0 )
					local f108_local0 = function ( f109_arg0 )
						local f109_local0 = function ( f110_arg0 )
							local f110_local0 = function ( f111_arg0 )
								local f111_local0 = function ( f112_arg0 )
									local f112_local0 = function ( f113_arg0 )
										local f113_local0 = function ( f114_arg0 )
											local f114_local0 = function ( f115_arg0 )
												local f115_local0 = function ( f116_arg0 )
													f116_arg0:beginAnimation( 340 )
													f116_arg0:setAlpha( 0 )
													f116_arg0:registerEventHandler( "transition_complete_keyframe", f97_arg0.clipFinished )
												end
												
												f115_arg0:beginAnimation( 79 )
												f115_arg0:setLeftRight( 0, 0, -32, 136 )
												f115_arg0:setTopBottom( 0, 0, -144, 108 )
												f115_arg0:setAlpha( 0.65 )
												f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
											end
											
											f114_arg0:beginAnimation( 19 )
											f114_arg0:setLeftRight( 0, 0, -24.8, 143.2 )
											f114_arg0:setTopBottom( 0, 0, -153.6, 98.4 )
											f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
										end
										
										f113_arg0:beginAnimation( 100 )
										f113_arg0:setLeftRight( 0, 0, -23, 145 )
										f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
									end
									
									f112_arg0:beginAnimation( 110 )
									f112_arg0:setLeftRight( 0, 0, -11, 157 )
									f112_arg0:setTopBottom( 0, 0, -156, 96 )
									f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
								end
								
								f111_arg0:beginAnimation( 120 )
								f111_arg0:setLeftRight( 0, 0, -21, 147 )
								f111_arg0:setTopBottom( 0, 0, -118, 134 )
								f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
							end
							
							f110_arg0:beginAnimation( 120 )
							f110_arg0:setLeftRight( 0, 0, -35, 133 )
							f110_arg0:setTopBottom( 0, 0, -110, 142 )
							f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
						end
						
						f109_arg0:beginAnimation( 130 )
						f109_arg0:setTopBottom( 0, 0, -142, 110 )
						f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
					end
					
					f108_arg0:beginAnimation( 340 )
					f108_arg0:setLeftRight( 0, 0, -38, 130 )
					f108_arg0:setTopBottom( 0, 0, -158, 94 )
					f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
				end
				
				f97_arg0.ZmFxSpark2Ext0:beginAnimation( 160 )
				f97_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -21, 147 )
				f97_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -190.64, 61.36 )
				f97_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f97_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f97_arg0.clipInterrupted )
				f97_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
			end
			
			f97_arg0.ZmFxSpark2Ext0:completeAnimation()
			f97_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -13, 155 )
			f97_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -206, 46 )
			f97_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f97_local3( f97_arg0.ZmFxSpark2Ext0 )
		end
	},
	Seven = {
		DefaultClip = function ( f117_arg0, f117_arg1 )
			f117_arg0:__resetProperties()
			f117_arg0:setupElementClipCounter( 4 )
			local f117_local0 = function ( f118_arg0 )
				local f118_local0 = function ( f119_arg0 )
					f119_arg0:beginAnimation( 1560 )
					f119_arg0:setAlpha( 1 )
					f119_arg0:registerEventHandler( "transition_complete_keyframe", f117_arg0.clipFinished )
				end
				
				f117_arg0.Seven:beginAnimation( 1450 )
				f117_arg0.Seven:registerEventHandler( "interrupted_keyframe", f117_arg0.clipInterrupted )
				f117_arg0.Seven:registerEventHandler( "transition_complete_keyframe", f118_local0 )
			end
			
			f117_arg0.Seven:completeAnimation()
			f117_arg0.Seven:setAlpha( 0 )
			f117_local0( f117_arg0.Seven )
			local f117_local1 = function ( f120_arg0 )
				local f120_local0 = function ( f121_arg0 )
					f121_arg0:beginAnimation( 929 )
					f121_arg0:setAlpha( 0 )
					f121_arg0:registerEventHandler( "transition_complete_keyframe", f117_arg0.clipFinished )
				end
				
				f117_arg0.SevenLight:beginAnimation( 1080 )
				f117_arg0.SevenLight:setShaderVector( 2, 1, 0, 0, 0 )
				f117_arg0.SevenLight:registerEventHandler( "interrupted_keyframe", f117_arg0.clipInterrupted )
				f117_arg0.SevenLight:registerEventHandler( "transition_complete_keyframe", f120_local0 )
			end
			
			f117_arg0.SevenLight:completeAnimation()
			f117_arg0.SevenLight:setAlpha( 1 )
			f117_arg0.SevenLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f117_arg0.SevenLight:setShaderVector( 0, 1, 0, 0, 0 )
			f117_arg0.SevenLight:setShaderVector( 1, 0, 0, 0, 0 )
			f117_arg0.SevenLight:setShaderVector( 2, 0, 0, 0, 0 )
			f117_arg0.SevenLight:setShaderVector( 3, 0.2, 0, 0, 0 )
			f117_arg0.SevenLight:setShaderVector( 4, 0, 0, 0, 0 )
			f117_local1( f117_arg0.SevenLight )
			local f117_local2 = function ( f122_arg0 )
				local f122_local0 = function ( f123_arg0 )
					local f123_local0 = function ( f124_arg0 )
						f124_arg0:beginAnimation( 990 )
						f124_arg0:setAlpha( 0 )
						f124_arg0:registerEventHandler( "transition_complete_keyframe", f117_arg0.clipFinished )
					end
					
					f123_arg0:beginAnimation( 1530 )
					f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
				end
				
				f117_arg0.SevenGlow:beginAnimation( 490 )
				f117_arg0.SevenGlow:setAlpha( 1 )
				f117_arg0.SevenGlow:registerEventHandler( "interrupted_keyframe", f117_arg0.clipInterrupted )
				f117_arg0.SevenGlow:registerEventHandler( "transition_complete_keyframe", f122_local0 )
			end
			
			f117_arg0.SevenGlow:completeAnimation()
			f117_arg0.SevenGlow:setAlpha( 0 )
			f117_local2( f117_arg0.SevenGlow )
			local f117_local3 = function ( f125_arg0 )
				local f125_local0 = function ( f126_arg0 )
					local f126_local0 = function ( f127_arg0 )
						local f127_local0 = function ( f128_arg0 )
							local f128_local0 = function ( f129_arg0 )
								local f129_local0 = function ( f130_arg0 )
									f130_arg0:beginAnimation( 480 )
									f130_arg0:setAlpha( 0 )
									f130_arg0:registerEventHandler( "transition_complete_keyframe", f117_arg0.clipFinished )
								end
								
								f129_arg0:beginAnimation( 39 )
								f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
							end
							
							f128_arg0:beginAnimation( 480 )
							f128_arg0:setLeftRight( 0, 0, -17, 151 )
							f128_arg0:setTopBottom( 0, 0, -110, 142 )
							f128_arg0:registerEventHandler( "transition_complete_keyframe", f128_local0 )
						end
						
						f127_arg0:beginAnimation( 60 )
						f127_arg0:registerEventHandler( "transition_complete_keyframe", f127_local0 )
					end
					
					f126_arg0:beginAnimation( 250 )
					f126_arg0:setLeftRight( 0, 0, -11, 157 )
					f126_arg0:setTopBottom( 0, 0, -198, 54 )
					f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
				end
				
				f117_arg0.ZmFxSpark2Ext0:beginAnimation( 190 )
				f117_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f117_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f117_arg0.clipInterrupted )
				f117_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f125_local0 )
			end
			
			f117_arg0.ZmFxSpark2Ext0:completeAnimation()
			f117_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -44, 124 )
			f117_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -182, 70 )
			f117_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f117_local3( f117_arg0.ZmFxSpark2Ext0 )
		end
	},
	Eight = {
		DefaultClip = function ( f131_arg0, f131_arg1 )
			f131_arg0:__resetProperties()
			f131_arg0:setupElementClipCounter( 5 )
			local f131_local0 = function ( f132_arg0 )
				local f132_local0 = function ( f133_arg0 )
					f133_arg0:beginAnimation( 1530 )
					f133_arg0:setAlpha( 1 )
					f133_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
				end
				
				f131_arg0.Eight:beginAnimation( 1470 )
				f131_arg0.Eight:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.Eight:registerEventHandler( "transition_complete_keyframe", f132_local0 )
			end
			
			f131_arg0.Eight:completeAnimation()
			f131_arg0.Eight:setAlpha( 0 )
			f131_local0( f131_arg0.Eight )
			local f131_local1 = function ( f134_arg0 )
				local f134_local0 = function ( f135_arg0 )
					local f135_local0 = function ( f136_arg0 )
						local f136_local0 = function ( f137_arg0 )
							f137_arg0:beginAnimation( 549 )
							f137_arg0:setAlpha( 0 )
							f137_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
						end
						
						f136_arg0:beginAnimation( 360 )
						f136_arg0:registerEventHandler( "transition_complete_keyframe", f136_local0 )
					end
					
					f135_arg0:beginAnimation( 999 )
					f135_arg0:setShaderVector( 2, 1, 0, 0, 0 )
					f135_arg0:registerEventHandler( "transition_complete_keyframe", f135_local0 )
				end
				
				f131_arg0.EightLight:beginAnimation( 180 )
				f131_arg0.EightLight:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.EightLight:registerEventHandler( "transition_complete_keyframe", f134_local0 )
			end
			
			f131_arg0.EightLight:completeAnimation()
			f131_arg0.EightLight:setAlpha( 1 )
			f131_arg0.EightLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f131_arg0.EightLight:setShaderVector( 0, 1, 0, 0, 0 )
			f131_arg0.EightLight:setShaderVector( 1, 0, 0, 0, 0 )
			f131_arg0.EightLight:setShaderVector( 2, 0, 0, 0, 0 )
			f131_arg0.EightLight:setShaderVector( 3, 0.2, 0, 0, 0 )
			f131_arg0.EightLight:setShaderVector( 4, 0, 0, 0, 0 )
			f131_local1( f131_arg0.EightLight )
			local f131_local2 = function ( f138_arg0 )
				local f138_local0 = function ( f139_arg0 )
					local f139_local0 = function ( f140_arg0 )
						f140_arg0:beginAnimation( 1000 )
						f140_arg0:setAlpha( 0 )
						f140_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
					end
					
					f139_arg0:beginAnimation( 1490 )
					f139_arg0:registerEventHandler( "transition_complete_keyframe", f139_local0 )
				end
				
				f131_arg0.EightGlow:beginAnimation( 510 )
				f131_arg0.EightGlow:setAlpha( 1 )
				f131_arg0.EightGlow:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.EightGlow:registerEventHandler( "transition_complete_keyframe", f138_local0 )
			end
			
			f131_arg0.EightGlow:completeAnimation()
			f131_arg0.EightGlow:setAlpha( 0 )
			f131_local2( f131_arg0.EightGlow )
			local f131_local3 = function ( f141_arg0 )
				local f141_local0 = function ( f142_arg0 )
					local f142_local0 = function ( f143_arg0 )
						local f143_local0 = function ( f144_arg0 )
							local f144_local0 = function ( f145_arg0 )
								local f145_local0 = function ( f146_arg0 )
									local f146_local0 = function ( f147_arg0 )
										local f147_local0 = function ( f148_arg0 )
											local f148_local0 = function ( f149_arg0 )
												f149_arg0:beginAnimation( 360 )
												f149_arg0:setAlpha( 0 )
												f149_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
											end
											
											f148_arg0:beginAnimation( 9 )
											f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
										end
										
										f147_arg0:beginAnimation( 130 )
										f147_arg0:setLeftRight( 0, 0, -23, 145 )
										f147_arg0:setTopBottom( 0, 0, -114, 138 )
										f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
									end
									
									f146_arg0:beginAnimation( 99 )
									f146_arg0:setTopBottom( 0, 0, -132, 120 )
									f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
								end
								
								f145_arg0:beginAnimation( 139 )
								f145_arg0:setLeftRight( 0, 0, -10, 158 )
								f145_arg0:setTopBottom( 0, 0, -149, 103 )
								f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
							end
							
							f144_arg0:beginAnimation( 160 )
							f144_arg0:setLeftRight( 0, 0, -26, 142 )
							f144_arg0:setTopBottom( 0, 0, -161, 91 )
							f144_arg0:registerEventHandler( "transition_complete_keyframe", f144_local0 )
						end
						
						f143_arg0:beginAnimation( 220 )
						f143_arg0:setLeftRight( 0, 0, -44, 124 )
						f143_arg0:setTopBottom( 0, 0, -177, 75 )
						f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
					end
					
					f142_arg0:beginAnimation( 239 )
					f142_arg0:setLeftRight( 0, 0, -37, 131 )
					f142_arg0:setTopBottom( 0, 0, -195, 57 )
					f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
				end
				
				f131_arg0.ZmFxSpark2Ext0:beginAnimation( 180 )
				f131_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f131_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f141_local0 )
			end
			
			f131_arg0.ZmFxSpark2Ext0:completeAnimation()
			f131_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -29, 139 )
			f131_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -206, 46 )
			f131_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f131_local3( f131_arg0.ZmFxSpark2Ext0 )
			local f131_local4 = function ( f150_arg0 )
				local f150_local0 = function ( f151_arg0 )
					local f151_local0 = function ( f152_arg0 )
						local f152_local0 = function ( f153_arg0 )
							local f153_local0 = function ( f154_arg0 )
								local f154_local0 = function ( f155_arg0 )
									local f155_local0 = function ( f156_arg0 )
										local f156_local0 = function ( f157_arg0 )
											local f157_local0 = function ( f158_arg0 )
												f158_arg0:beginAnimation( 360 )
												f158_arg0:setAlpha( 0 )
												f158_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
											end
											
											f157_arg0:beginAnimation( 9 )
											f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
										end
										
										f156_arg0:beginAnimation( 130 )
										f156_arg0:setLeftRight( 0, 0, -26, 142 )
										f156_arg0:setTopBottom( 0, 0, -114, 138 )
										f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
									end
									
									f155_arg0:beginAnimation( 99 )
									f155_arg0:setLeftRight( 0, 0, -46, 122 )
									f155_arg0:setTopBottom( 0, 0, -123, 129 )
									f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
								end
								
								f154_arg0:beginAnimation( 139 )
								f154_arg0:setLeftRight( 0, 0, -42, 126 )
								f154_arg0:setTopBottom( 0, 0, -141, 111 )
								f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
							end
							
							f153_arg0:beginAnimation( 160 )
							f153_arg0:setLeftRight( 0, 0, -26, 142 )
							f153_arg0:setTopBottom( 0, 0, -167, 85 )
							f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
						end
						
						f152_arg0:beginAnimation( 220 )
						f152_arg0:setLeftRight( 0, 0, -5, 163 )
						f152_arg0:setTopBottom( 0, 0, -177, 75 )
						f152_arg0:registerEventHandler( "transition_complete_keyframe", f152_local0 )
					end
					
					f151_arg0:beginAnimation( 239 )
					f151_arg0:setLeftRight( 0, 0, -10, 158 )
					f151_arg0:setTopBottom( 0, 0, -201, 51 )
					f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
				end
				
				f131_arg0.ZmFxSpark2Ext00:beginAnimation( 180 )
				f131_arg0.ZmFxSpark2Ext00:setAlpha( 0.8 )
				f131_arg0.ZmFxSpark2Ext00:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", f150_local0 )
			end
			
			f131_arg0.ZmFxSpark2Ext00:completeAnimation()
			f131_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, -29, 139 )
			f131_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -206, 46 )
			f131_arg0.ZmFxSpark2Ext00:setAlpha( 0 )
			f131_local4( f131_arg0.ZmFxSpark2Ext00 )
		end
	},
	Nine = {
		DefaultClip = function ( f159_arg0, f159_arg1 )
			f159_arg0:__resetProperties()
			f159_arg0:setupElementClipCounter( 5 )
			local f159_local0 = function ( f160_arg0 )
				local f160_local0 = function ( f161_arg0 )
					f161_arg0:beginAnimation( 1460 )
					f161_arg0:setAlpha( 1 )
					f161_arg0:registerEventHandler( "transition_complete_keyframe", f159_arg0.clipFinished )
				end
				
				f159_arg0.Nine:beginAnimation( 1550 )
				f159_arg0.Nine:registerEventHandler( "interrupted_keyframe", f159_arg0.clipInterrupted )
				f159_arg0.Nine:registerEventHandler( "transition_complete_keyframe", f160_local0 )
			end
			
			f159_arg0.Nine:completeAnimation()
			f159_arg0.Nine:setAlpha( 0 )
			f159_local0( f159_arg0.Nine )
			local f159_local1 = function ( f162_arg0 )
				local f162_local0 = function ( f163_arg0 )
					local f163_local0 = function ( f164_arg0 )
						f164_arg0:beginAnimation( 1010 )
						f164_arg0:setAlpha( 0 )
						f164_arg0:registerEventHandler( "transition_complete_keyframe", f159_arg0.clipFinished )
					end
					
					f163_arg0:beginAnimation( 149 )
					f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
				end
				
				f159_arg0.NineLight:beginAnimation( 850 )
				f159_arg0.NineLight:setShaderVector( 2, 1, 0, 0, 0 )
				f159_arg0.NineLight:registerEventHandler( "interrupted_keyframe", f159_arg0.clipInterrupted )
				f159_arg0.NineLight:registerEventHandler( "transition_complete_keyframe", f162_local0 )
			end
			
			f159_arg0.NineLight:completeAnimation()
			f159_arg0.NineLight:setAlpha( 1 )
			f159_arg0.NineLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f159_arg0.NineLight:setShaderVector( 0, 1, 0, 0, 0 )
			f159_arg0.NineLight:setShaderVector( 1, 0, 0, 0, 0 )
			f159_arg0.NineLight:setShaderVector( 2, 0, 0, 0, 0 )
			f159_arg0.NineLight:setShaderVector( 3, 0.2, 0, 0, 0 )
			f159_arg0.NineLight:setShaderVector( 4, 0, 0, 0, 0 )
			f159_local1( f159_arg0.NineLight )
			local f159_local2 = function ( f165_arg0 )
				local f165_local0 = function ( f166_arg0 )
					local f166_local0 = function ( f167_arg0 )
						f167_arg0:beginAnimation( 1000 )
						f167_arg0:setAlpha( 0 )
						f167_arg0:registerEventHandler( "transition_complete_keyframe", f159_arg0.clipFinished )
					end
					
					f166_arg0:beginAnimation( 1620 )
					f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
				end
				
				f159_arg0.NineGlow:beginAnimation( 390 )
				f159_arg0.NineGlow:setAlpha( 1 )
				f159_arg0.NineGlow:registerEventHandler( "interrupted_keyframe", f159_arg0.clipInterrupted )
				f159_arg0.NineGlow:registerEventHandler( "transition_complete_keyframe", f165_local0 )
			end
			
			f159_arg0.NineGlow:completeAnimation()
			f159_arg0.NineGlow:setAlpha( 0 )
			f159_local2( f159_arg0.NineGlow )
			local f159_local3 = function ( f168_arg0 )
				local f168_local0 = function ( f169_arg0 )
					local f169_local0 = function ( f170_arg0 )
						local f170_local0 = function ( f171_arg0 )
							local f171_local0 = function ( f172_arg0 )
								local f172_local0 = function ( f173_arg0 )
									f173_arg0:beginAnimation( 590 )
									f173_arg0:setAlpha( 0 )
									f173_arg0:registerEventHandler( "transition_complete_keyframe", f159_arg0.clipFinished )
								end
								
								f172_arg0:beginAnimation( 30 )
								f172_arg0:registerEventHandler( "transition_complete_keyframe", f172_local0 )
							end
							
							f171_arg0:beginAnimation( 159 )
							f171_arg0:setLeftRight( 0, 0, -13, 155 )
							f171_arg0:setTopBottom( 0, 0, -181, 71 )
							f171_arg0:registerEventHandler( "transition_complete_keyframe", f171_local0 )
						end
						
						f170_arg0:beginAnimation( 180 )
						f170_arg0:setLeftRight( 0, 0, -30, 138 )
						f170_arg0:registerEventHandler( "transition_complete_keyframe", f170_local0 )
					end
					
					f169_arg0:beginAnimation( 299 )
					f169_arg0:setLeftRight( 0, 0, -46, 122 )
					f169_arg0:setTopBottom( 0, 0, -162, 90 )
					f169_arg0:registerEventHandler( "transition_complete_keyframe", f169_local0 )
				end
				
				f159_arg0.ZmFxSpark2Ext0:beginAnimation( 180 )
				f159_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -34, 134 )
				f159_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -195, 57 )
				f159_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f159_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f159_arg0.clipInterrupted )
				f159_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
			end
			
			f159_arg0.ZmFxSpark2Ext0:completeAnimation()
			f159_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -7, 161 )
			f159_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -202, 50 )
			f159_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f159_local3( f159_arg0.ZmFxSpark2Ext0 )
			local f159_local4 = function ( f174_arg0 )
				local f174_local0 = function ( f175_arg0 )
					local f175_local0 = function ( f176_arg0 )
						f176_arg0:beginAnimation( 590 )
						f176_arg0:setAlpha( 0 )
						f176_arg0:registerEventHandler( "transition_complete_keyframe", f159_arg0.clipFinished )
					end
					
					f175_arg0:beginAnimation( 670 )
					f175_arg0:setLeftRight( 0, 0, -29, 139 )
					f175_arg0:setTopBottom( 0, 0, -106, 146 )
					f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
				end
				
				f159_arg0.ZmFxSpark2Ext00:beginAnimation( 180 )
				f159_arg0.ZmFxSpark2Ext00:setAlpha( 0.8 )
				f159_arg0.ZmFxSpark2Ext00:registerEventHandler( "interrupted_keyframe", f159_arg0.clipInterrupted )
				f159_arg0.ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", f174_local0 )
			end
			
			f159_arg0.ZmFxSpark2Ext00:completeAnimation()
			f159_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, 7, 175 )
			f159_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -202, 50 )
			f159_arg0.ZmFxSpark2Ext00:setAlpha( 0 )
			f159_local4( f159_arg0.ZmFxSpark2Ext00 )
		end
	},
	Zero = {
		DefaultClip = function ( f177_arg0, f177_arg1 )
			f177_arg0:__resetProperties()
			f177_arg0:setupElementClipCounter( 5 )
			local f177_local0 = function ( f178_arg0 )
				local f178_local0 = function ( f179_arg0 )
					f179_arg0:beginAnimation( 1500 )
					f179_arg0:setAlpha( 1 )
					f179_arg0:registerEventHandler( "transition_complete_keyframe", f177_arg0.clipFinished )
				end
				
				f177_arg0.Zero:beginAnimation( 1530 )
				f177_arg0.Zero:registerEventHandler( "interrupted_keyframe", f177_arg0.clipInterrupted )
				f177_arg0.Zero:registerEventHandler( "transition_complete_keyframe", f178_local0 )
			end
			
			f177_arg0.Zero:completeAnimation()
			f177_arg0.Zero:setAlpha( 0 )
			f177_local0( f177_arg0.Zero )
			local f177_local1 = function ( f180_arg0 )
				local f180_local0 = function ( f181_arg0 )
					local f181_local0 = function ( f182_arg0 )
						f182_arg0:beginAnimation( 1020 )
						f182_arg0:setAlpha( 0 )
						f182_arg0:registerEventHandler( "transition_complete_keyframe", f177_arg0.clipFinished )
					end
					
					f181_arg0:beginAnimation( 810 )
					f181_arg0:setShaderVector( 2, 1.08, 0, 0, 0 )
					f181_arg0:registerEventHandler( "transition_complete_keyframe", f181_local0 )
				end
				
				f177_arg0.ZeroLight:beginAnimation( 190 )
				f177_arg0.ZeroLight:setShaderVector( 2, 0.26, 0, 0, 0 )
				f177_arg0.ZeroLight:registerEventHandler( "interrupted_keyframe", f177_arg0.clipInterrupted )
				f177_arg0.ZeroLight:registerEventHandler( "transition_complete_keyframe", f180_local0 )
			end
			
			f177_arg0.ZeroLight:completeAnimation()
			f177_arg0.ZeroLight:setAlpha( 1 )
			f177_arg0.ZeroLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
			f177_arg0.ZeroLight:setShaderVector( 0, 1, 0, 0, 0 )
			f177_arg0.ZeroLight:setShaderVector( 1, 0, 0, 0, 0 )
			f177_arg0.ZeroLight:setShaderVector( 2, 0, 0, 0, 0 )
			f177_arg0.ZeroLight:setShaderVector( 3, 0.21, -0.23, 0, 0 )
			f177_arg0.ZeroLight:setShaderVector( 4, 0, 0, 0, 0 )
			f177_local1( f177_arg0.ZeroLight )
			local f177_local2 = function ( f183_arg0 )
				local f183_local0 = function ( f184_arg0 )
					local f184_local0 = function ( f185_arg0 )
						f185_arg0:beginAnimation( 1000 )
						f185_arg0:setAlpha( 0 )
						f185_arg0:registerEventHandler( "transition_complete_keyframe", f177_arg0.clipFinished )
					end
					
					f184_arg0:beginAnimation( 1020 )
					f184_arg0:registerEventHandler( "transition_complete_keyframe", f184_local0 )
				end
				
				f177_arg0.ZeroGlow:beginAnimation( 1000 )
				f177_arg0.ZeroGlow:setAlpha( 1 )
				f177_arg0.ZeroGlow:registerEventHandler( "interrupted_keyframe", f177_arg0.clipInterrupted )
				f177_arg0.ZeroGlow:registerEventHandler( "transition_complete_keyframe", f183_local0 )
			end
			
			f177_arg0.ZeroGlow:completeAnimation()
			f177_arg0.ZeroGlow:setAlpha( 0 )
			f177_local2( f177_arg0.ZeroGlow )
			local f177_local3 = function ( f186_arg0 )
				local f186_local0 = function ( f187_arg0 )
					local f187_local0 = function ( f188_arg0 )
						local f188_local0 = function ( f189_arg0 )
							local f189_local0 = function ( f190_arg0 )
								local f190_local0 = function ( f191_arg0 )
									local f191_local0 = function ( f192_arg0 )
										local f192_local0 = function ( f193_arg0 )
											f193_arg0:beginAnimation( 100 )
											f193_arg0:setAlpha( 0 )
											f193_arg0:registerEventHandler( "transition_complete_keyframe", f177_arg0.clipFinished )
										end
										
										f192_arg0:beginAnimation( 99 )
										f192_arg0:setLeftRight( 0, 0, -32, 136 )
										f192_arg0:setTopBottom( 0, 0, -109, 143 )
										f192_arg0:registerEventHandler( "transition_complete_keyframe", f192_local0 )
									end
									
									f191_arg0:beginAnimation( 90 )
									f191_arg0:setLeftRight( 0, 0, -42, 126 )
									f191_arg0:setTopBottom( 0, 0, -120, 132 )
									f191_arg0:registerEventHandler( "transition_complete_keyframe", f191_local0 )
								end
								
								f190_arg0:beginAnimation( 99 )
								f190_arg0:setLeftRight( 0, 0, -52, 116 )
								f190_arg0:setTopBottom( 0, 0, -132, 120 )
								f190_arg0:registerEventHandler( "transition_complete_keyframe", f190_local0 )
							end
							
							f189_arg0:beginAnimation( 110 )
							f189_arg0:setLeftRight( 0, 0, -54, 114 )
							f189_arg0:setTopBottom( 0, 0, -148, 104 )
							f189_arg0:registerEventHandler( "transition_complete_keyframe", f189_local0 )
						end
						
						f188_arg0:beginAnimation( 160 )
						f188_arg0:setLeftRight( 0, 0, -50, 118 )
						f188_arg0:setTopBottom( 0, 0, -180, 72 )
						f188_arg0:registerEventHandler( "transition_complete_keyframe", f188_local0 )
					end
					
					f187_arg0:beginAnimation( 150 )
					f187_arg0:setLeftRight( 0, 0, -42, 126 )
					f187_arg0:setTopBottom( 0, 0, -192, 60 )
					f187_arg0:registerEventHandler( "transition_complete_keyframe", f187_local0 )
				end
				
				f177_arg0.ZmFxSpark2Ext0:beginAnimation( 190 )
				f177_arg0.ZmFxSpark2Ext0:setAlpha( 0.8 )
				f177_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f177_arg0.clipInterrupted )
				f177_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f186_local0 )
			end
			
			f177_arg0.ZmFxSpark2Ext0:completeAnimation()
			f177_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -22, 146 )
			f177_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -206, 46 )
			f177_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f177_local3( f177_arg0.ZmFxSpark2Ext0 )
			local f177_local4 = function ( f194_arg0 )
				local f194_local0 = function ( f195_arg0 )
					local f195_local0 = function ( f196_arg0 )
						local f196_local0 = function ( f197_arg0 )
							local f197_local0 = function ( f198_arg0 )
								f198_arg0:beginAnimation( 100 )
								f198_arg0:setAlpha( 0 )
								f198_arg0:registerEventHandler( "transition_complete_keyframe", f177_arg0.clipFinished )
							end
							
							f197_arg0:beginAnimation( 260 )
							f197_arg0:setLeftRight( 0, 0, -15, 153 )
							f197_arg0:setTopBottom( 0, 0, -111, 141 )
							f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
						end
						
						f196_arg0:beginAnimation( 290 )
						f196_arg0:setLeftRight( 0, 0, 7, 175 )
						f196_arg0:setTopBottom( 0, 0, -141, 111 )
						f196_arg0:registerEventHandler( "transition_complete_keyframe", f196_local0 )
					end
					
					f195_arg0:beginAnimation( 160 )
					f195_arg0:setLeftRight( 0, 0, 2, 170 )
					f195_arg0:setTopBottom( 0, 0, -170, 82 )
					f195_arg0:registerEventHandler( "transition_complete_keyframe", f195_local0 )
				end
				
				f177_arg0.ZmFxSpark2Ext00:beginAnimation( 190 )
				f177_arg0.ZmFxSpark2Ext00:setAlpha( 0.8 )
				f177_arg0.ZmFxSpark2Ext00:registerEventHandler( "interrupted_keyframe", f177_arg0.clipInterrupted )
				f177_arg0.ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", f194_local0 )
			end
			
			f177_arg0.ZmFxSpark2Ext00:completeAnimation()
			f177_arg0.ZmFxSpark2Ext00:setLeftRight( 0, 0, -5, 163 )
			f177_arg0.ZmFxSpark2Ext00:setTopBottom( 0, 0, -192, 60 )
			f177_arg0.ZmFxSpark2Ext00:setAlpha( 0 )
			f177_local4( f177_arg0.ZmFxSpark2Ext00 )
		end
	}
}
CoD.ZmRndDigitWidget.__onClose = function ( f199_arg0 )
	f199_arg0.ZmFxSpark2Ext0:close()
	f199_arg0.ZmFxSpark2Ext00:close()
end

