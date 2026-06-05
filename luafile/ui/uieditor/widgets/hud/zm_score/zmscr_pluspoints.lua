CoD.ZMScr_PlusPoints = InheritFrom( LUI.UIElement )
CoD.ZMScr_PlusPoints.__defaultWidth = 140
CoD.ZMScr_PlusPoints.__defaultHeight = 99
CoD.ZMScr_PlusPoints.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScr_PlusPoints )
	self.id = "ZMScr_PlusPoints"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Label2 = LUI.UIText.new( 0, 0, 1.5, 151.5, 0, 0, 21, 77 )
	Label2:setRGB( 1, 0.52, 0 )
	Label2:setAlpha( 0.01 )
	Label2:setZoom( -8 )
	Label2:setText( "" )
	Label2:setTTF( "skorzhen" )
	Label2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	Label2:setShaderVector( 0, 0.21, 0, 0, 0 )
	Label2:setShaderVector( 1, 0, 0, 0, 0 )
	Label2:setShaderVector( 2, 1, 0, 0, 0 )
	Label2:setLetterSpacing( 0.9 )
	Label2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Label2:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label1 = LUI.UIText.new( 0, 0, 0.5, 150.5, 0, 0, 21, 77 )
	Label1:setRGB( 0.99, 0.95, 0.62 )
	Label1:setAlpha( 0 )
	Label1:setText( "" )
	Label1:setTTF( "skorzhen" )
	Label1:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Label1:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Glow = LUI.UIImage.new( 0, 0, 0, 140, 0, 0, 0, 99 )
	Glow:setRGB( 1, 0.26, 0 )
	Glow:setAlpha( 0.01 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local4 = self
	CoD.HUDUtility.ForceCloseOnClose( self.Glow )
	CoD.HUDUtility.ForceCloseOnClose( self.Label1 )
	CoD.HUDUtility.ForceCloseOnClose( self.Label2 )
	return self
end

CoD.ZMScr_PlusPoints.__resetProperties = function ( f2_arg0 )
	f2_arg0.Glow:completeAnimation()
	f2_arg0.Label1:completeAnimation()
	f2_arg0.Label2:completeAnimation()
	f2_arg0.Glow:setRGB( 1, 0.26, 0 )
	f2_arg0.Glow:setAlpha( 0.01 )
	f2_arg0.Label1:setRGB( 0.99, 0.95, 0.62 )
	f2_arg0.Label1:setAlpha( 0 )
	f2_arg0.Label2:setRGB( 1, 0.52, 0 )
	f2_arg0.Label2:setAlpha( 0.01 )
end

CoD.ZMScr_PlusPoints.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 3 )
			local f3_local0 = function ( f4_arg0 )
				local f4_local0 = function ( f5_arg0 )
					local f5_local0 = function ( f6_arg0 )
						local f6_local0 = function ( f7_arg0 )
							f7_arg0:beginAnimation( 169, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f7_arg0:setAlpha( 0 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f6_arg0:beginAnimation( 330 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
					
					f5_arg0:beginAnimation( 140, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
				end
				
				f3_arg0.Label2:beginAnimation( 130, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f3_arg0.Label2:setAlpha( 0.43 )
				f3_arg0.Label2:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Label2:registerEventHandler( "transition_complete_keyframe", f4_local0 )
			end
			
			f3_arg0.Label2:completeAnimation()
			f3_arg0.Label2:setAlpha( 0 )
			f3_local0( f3_arg0.Label2 )
			local f3_local1 = function ( f8_arg0 )
				local f8_local0 = function ( f9_arg0 )
					local f9_local0 = function ( f10_arg0 )
						f10_arg0:beginAnimation( 100, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f10_arg0:setAlpha( 0 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
					end
					
					f9_arg0:beginAnimation( 580 )
					f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
				end
				
				f3_arg0.Label1:beginAnimation( 70 )
				f3_arg0.Label1:setAlpha( 1 )
				f3_arg0.Label1:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Label1:registerEventHandler( "transition_complete_keyframe", f8_local0 )
			end
			
			f3_arg0.Label1:completeAnimation()
			f3_arg0.Label1:setAlpha( 0 )
			f3_local1( f3_arg0.Label1 )
			local f3_local2 = function ( f11_arg0 )
				local f11_local0 = function ( f12_arg0 )
					local f12_local0 = function ( f13_arg0 )
						local f13_local0 = function ( f14_arg0 )
							f14_arg0:beginAnimation( 190, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f14_arg0:setAlpha( 0 )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f13_arg0:beginAnimation( 470 )
						f13_arg0:setAlpha( 0.34 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
					
					f12_arg0:beginAnimation( 60, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f12_arg0:setAlpha( 0.42 )
					f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
				end
				
				f3_arg0.Glow:beginAnimation( 40 )
				f3_arg0.Glow:setAlpha( 1 )
				f3_arg0.Glow:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f11_local0 )
			end
			
			f3_arg0.Glow:completeAnimation()
			f3_arg0.Glow:setAlpha( 0 )
			f3_local2( f3_arg0.Glow )
		end,
		NegativeScore = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 3 )
			local f15_local0 = function ( f16_arg0 )
				local f16_local0 = function ( f17_arg0 )
					local f17_local0 = function ( f18_arg0 )
						local f18_local0 = function ( f19_arg0 )
							f19_arg0:beginAnimation( 169, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f19_arg0:setAlpha( 0 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
						end
						
						f18_arg0:beginAnimation( 330 )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
					
					f17_arg0:beginAnimation( 140, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
				end
				
				f15_arg0.Label2:beginAnimation( 130, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f15_arg0.Label2:setAlpha( 0.43 )
				f15_arg0.Label2:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.Label2:registerEventHandler( "transition_complete_keyframe", f16_local0 )
			end
			
			f15_arg0.Label2:completeAnimation()
			f15_arg0.Label2:setRGB( 0.59, 0.15, 0.11 )
			f15_arg0.Label2:setAlpha( 0 )
			f15_local0( f15_arg0.Label2 )
			local f15_local1 = function ( f20_arg0 )
				local f20_local0 = function ( f21_arg0 )
					local f21_local0 = function ( f22_arg0 )
						f22_arg0:beginAnimation( 100, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f22_arg0:setAlpha( 0 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
					end
					
					f21_arg0:beginAnimation( 580 )
					f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
				end
				
				f15_arg0.Label1:beginAnimation( 70 )
				f15_arg0.Label1:setAlpha( 1 )
				f15_arg0.Label1:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.Label1:registerEventHandler( "transition_complete_keyframe", f20_local0 )
			end
			
			f15_arg0.Label1:completeAnimation()
			f15_arg0.Label1:setRGB( 0.78, 0.14, 0.08 )
			f15_arg0.Label1:setAlpha( 0 )
			f15_local1( f15_arg0.Label1 )
			local f15_local2 = function ( f23_arg0 )
				local f23_local0 = function ( f24_arg0 )
					local f24_local0 = function ( f25_arg0 )
						local f25_local0 = function ( f26_arg0 )
							f26_arg0:beginAnimation( 190, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f26_arg0:setAlpha( 0 )
							f26_arg0:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
						end
						
						f25_arg0:beginAnimation( 470 )
						f25_arg0:setAlpha( 0.34 )
						f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
					end
					
					f24_arg0:beginAnimation( 60, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f24_arg0:setAlpha( 0.42 )
					f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
				end
				
				f15_arg0.Glow:beginAnimation( 40 )
				f15_arg0.Glow:setAlpha( 1 )
				f15_arg0.Glow:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f23_local0 )
			end
			
			f15_arg0.Glow:completeAnimation()
			f15_arg0.Glow:setAlpha( 0 )
			f15_local2( f15_arg0.Glow )
		end,
		BonusScore = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 3 )
			local f27_local0 = function ( f28_arg0 )
				local f28_local0 = function ( f29_arg0 )
					local f29_local0 = function ( f30_arg0 )
						local f30_local0 = function ( f31_arg0 )
							f31_arg0:beginAnimation( 169, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f31_arg0:setAlpha( 0 )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
						end
						
						f30_arg0:beginAnimation( 330 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
					
					f29_arg0:beginAnimation( 140, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
				end
				
				f27_arg0.Label2:beginAnimation( 130, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f27_arg0.Label2:setAlpha( 0.43 )
				f27_arg0.Label2:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.Label2:registerEventHandler( "transition_complete_keyframe", f28_local0 )
			end
			
			f27_arg0.Label2:completeAnimation()
			f27_arg0.Label2:setRGB( 0.23, 0.45, 0.34 )
			f27_arg0.Label2:setAlpha( 0 )
			f27_local0( f27_arg0.Label2 )
			local f27_local1 = function ( f32_arg0 )
				local f32_local0 = function ( f33_arg0 )
					local f33_local0 = function ( f34_arg0 )
						f34_arg0:beginAnimation( 100, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f34_arg0:setAlpha( 0 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
					end
					
					f33_arg0:beginAnimation( 580 )
					f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
				end
				
				f27_arg0.Label1:beginAnimation( 70 )
				f27_arg0.Label1:setAlpha( 1 )
				f27_arg0.Label1:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.Label1:registerEventHandler( "transition_complete_keyframe", f32_local0 )
			end
			
			f27_arg0.Label1:completeAnimation()
			f27_arg0.Label1:setRGB( 0.33, 0.95, 0.65 )
			f27_arg0.Label1:setAlpha( 0 )
			f27_local1( f27_arg0.Label1 )
			local f27_local2 = function ( f35_arg0 )
				local f35_local0 = function ( f36_arg0 )
					local f36_local0 = function ( f37_arg0 )
						local f37_local0 = function ( f38_arg0 )
							f38_arg0:beginAnimation( 190, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
							f38_arg0:setAlpha( 0 )
							f38_arg0:registerEventHandler( "transition_complete_keyframe", f27_arg0.clipFinished )
						end
						
						f37_arg0:beginAnimation( 470 )
						f37_arg0:setAlpha( 0.34 )
						f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
					end
					
					f36_arg0:beginAnimation( 60, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f36_arg0:setAlpha( 0.42 )
					f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
				end
				
				f27_arg0.Glow:beginAnimation( 40 )
				f27_arg0.Glow:setAlpha( 1 )
				f27_arg0.Glow:registerEventHandler( "interrupted_keyframe", f27_arg0.clipInterrupted )
				f27_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f35_local0 )
			end
			
			f27_arg0.Glow:completeAnimation()
			f27_arg0.Glow:setRGB( 0.14, 0.46, 0.3 )
			f27_arg0.Glow:setAlpha( 0 )
			f27_local2( f27_arg0.Glow )
		end
	}
}
CoD.ZMScr_PlusPoints.__onClose = function ( f39_arg0 )
	f39_arg0.Label2:close()
	f39_arg0.Label1:close()
	f39_arg0.Glow:close()
end

