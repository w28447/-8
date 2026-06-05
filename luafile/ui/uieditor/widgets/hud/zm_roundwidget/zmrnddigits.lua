require( "ui/uieditor/widgets/hud/zm_fx/zmfx_flsh1" )
require( "ui/uieditor/widgets/hud/zm_fx/zmfx_spark2" )
require( "ui/uieditor/widgets/hud/zm_roundwidget/zmrnddigitsint" )

CoD.ZmRndDigits = InheritFrom( LUI.UIElement )
CoD.ZmRndDigits.__defaultWidth = 159
CoD.ZmRndDigits.__defaultHeight = 120
CoD.ZmRndDigits.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmRndDigits )
	self.id = "ZmRndDigits"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DigitsInt = CoD.ZmRndDigitsInt.new( f1_arg0, f1_arg1, 0, 0, 0.5, 159.5, 0, 0, 0, 120 )
	DigitsInt:mergeStateConditions( {
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueGreaterThanOrEqualTo( element, f1_arg1, "roundsPlayed", 101 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueGreaterThanOrEqualTo( element, f1_arg1, "roundsPlayed", 11 )
			end
		}
	} )
	DigitsInt:linkToElementModel( DigitsInt, "roundsPlayed", true, function ( model )
		f1_arg0:updateElementState( DigitsInt, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "roundsPlayed"
		} )
	end )
	DigitsInt:setZRot( -10 )
	DigitsInt:linkToElementModel( self, nil, false, function ( model )
		DigitsInt:setModel( model, f1_arg1 )
	end )
	self:addElement( DigitsInt )
	self.DigitsInt = DigitsInt
	
	local DigitsOverlay = CoD.ZmRndDigitsInt.new( f1_arg0, f1_arg1, 0, 0, 0.5, 159.5, 0, 0, 0, 120 )
	DigitsOverlay:setAlpha( 0 )
	DigitsOverlay:setZRot( -19 )
	DigitsOverlay:setZoom( 52 )
	DigitsOverlay:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DigitsOverlay )
	self.DigitsOverlay = DigitsOverlay
	
	local GlowOrangeOver = LUI.UIImage.new( 0, 0, -24, 183, 0, 0, -37, 145 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local ZmFxFlsh10 = CoD.ZmFx_Flsh1.new( f1_arg0, f1_arg1, 0, 0, -101, 260, 0, 0, -41, 161 )
	ZmFxFlsh10:setRGB( 0, 0, 0 )
	ZmFxFlsh10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh10 )
	self.ZmFxFlsh10 = ZmFxFlsh10
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( f1_arg0, f1_arg1, 0, 0, -17.5, 177.5, 0, 0, -153, 171 )
	ZmFxSpark20:setRGB( 0.65, 0, 0 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 1.37, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.62, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	self:subscribeToGlobalModel( f1_arg1, "PerController", "gameScore.roundsPlayed", function ( model )
		local f6_local0 = self
		PlayClip( self, "Update", f1_arg1 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmRndDigits.__resetProperties = function ( f7_arg0 )
	f7_arg0.DigitsOverlay:completeAnimation()
	f7_arg0.DigitsInt:completeAnimation()
	f7_arg0.GlowOrangeOver:completeAnimation()
	f7_arg0.ZmFxFlsh10:completeAnimation()
	f7_arg0.DigitsOverlay:setAlpha( 0 )
	f7_arg0.DigitsOverlay:setZRot( -19 )
	f7_arg0.DigitsInt:setZoom( 0 )
	f7_arg0.GlowOrangeOver:setAlpha( 0 )
	f7_arg0.ZmFxFlsh10:setRGB( 0, 0, 0 )
	f7_arg0.ZmFxFlsh10:setAlpha( 1 )
end

CoD.ZmRndDigits.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end,
		Update = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 4 )
			f9_arg0.DigitsInt:completeAnimation()
			f9_arg0.DigitsInt:setZoom( 25 )
			f9_arg0.clipFinished( f9_arg0.DigitsInt )
			local f9_local0 = function ( f10_arg0 )
				local f10_local0 = function ( f11_arg0 )
					local f11_local0 = function ( f12_arg0 )
						local f12_local0 = function ( f13_arg0 )
							f13_arg0:beginAnimation( 60 )
							f13_arg0:setAlpha( 0 )
							f13_arg0:setZRot( -19 )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
						end
						
						f12_arg0:beginAnimation( 99 )
						f12_arg0:setAlpha( 0.13 )
						f12_arg0:setZRot( -2 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
					
					f11_arg0:beginAnimation( 290, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f11_arg0:setAlpha( 0.36 )
					f11_arg0:setZRot( -17 )
					f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
				end
				
				f9_arg0.DigitsOverlay:beginAnimation( 110 )
				f9_arg0.DigitsOverlay:setAlpha( 1 )
				f9_arg0.DigitsOverlay:setZRot( -8 )
				f9_arg0.DigitsOverlay:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.DigitsOverlay:registerEventHandler( "transition_complete_keyframe", f10_local0 )
			end
			
			f9_arg0.DigitsOverlay:completeAnimation()
			f9_arg0.DigitsOverlay:setAlpha( 0 )
			f9_arg0.DigitsOverlay:setZRot( 5 )
			f9_local0( f9_arg0.DigitsOverlay )
			local f9_local1 = function ( f14_arg0 )
				local f14_local0 = function ( f15_arg0 )
					local f15_local0 = function ( f16_arg0 )
						local f16_local0 = function ( f17_arg0 )
							local f17_local0 = function ( f18_arg0 )
								local f18_local0 = function ( f19_arg0 )
									local f19_local0 = function ( f20_arg0 )
										f20_arg0:beginAnimation( 840, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
										f20_arg0:setAlpha( 0 )
										f20_arg0:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
									end
									
									f19_arg0:beginAnimation( 9 )
									f19_arg0:setAlpha( 0.35 )
									f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
								end
								
								f18_arg0:beginAnimation( 20 )
								f18_arg0:setAlpha( 0.21 )
								f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
							end
							
							f17_arg0:beginAnimation( 69 )
							f17_arg0:setAlpha( 0.36 )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
						
						f16_arg0:beginAnimation( 20 )
						f16_arg0:setAlpha( 0.39 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
					
					f15_arg0:beginAnimation( 20 )
					f15_arg0:setAlpha( 0.01 )
					f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
				end
				
				f9_arg0.GlowOrangeOver:beginAnimation( 20 )
				f9_arg0.GlowOrangeOver:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f14_local0 )
			end
			
			f9_arg0.GlowOrangeOver:completeAnimation()
			f9_arg0.GlowOrangeOver:setAlpha( 0.4 )
			f9_local1( f9_arg0.GlowOrangeOver )
			local f9_local2 = function ( f21_arg0 )
				local f21_local0 = function ( f22_arg0 )
					f22_arg0:beginAnimation( 680, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f22_arg0:setRGB( 0, 0, 0 )
					f22_arg0:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
				end
				
				f9_arg0.ZmFxFlsh10:beginAnimation( 320 )
				f9_arg0.ZmFxFlsh10:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.ZmFxFlsh10:registerEventHandler( "transition_complete_keyframe", f21_local0 )
			end
			
			f9_arg0.ZmFxFlsh10:completeAnimation()
			f9_arg0.ZmFxFlsh10:setRGB( 0.9, 0.73, 0.68 )
			f9_arg0.ZmFxFlsh10:setAlpha( 1 )
			f9_local2( f9_arg0.ZmFxFlsh10 )
		end
	}
}
CoD.ZmRndDigits.__onClose = function ( f23_arg0 )
	f23_arg0.DigitsInt:close()
	f23_arg0.DigitsOverlay:close()
	f23_arg0.ZmFxFlsh10:close()
	f23_arg0.ZmFxSpark20:close()
end

