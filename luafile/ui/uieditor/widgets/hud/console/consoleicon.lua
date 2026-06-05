CoD.ConsoleIcon = InheritFrom( LUI.UIElement )
CoD.ConsoleIcon.__defaultWidth = 22
CoD.ConsoleIcon.__defaultHeight = 21
CoD.ConsoleIcon.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ConsoleIcon )
	self.id = "ConsoleIcon"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Icon = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Icon:setImage( RegisterImage( "uie_death_headshot" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ConsoleIcon.__resetProperties = function ( f2_arg0 )
	f2_arg0.Icon:completeAnimation()
	f2_arg0.Icon:setAlpha( 1 )
end

CoD.ConsoleIcon.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			f3_arg0.Icon:completeAnimation()
			f3_arg0.Icon:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.Icon )
		end,
		FadeIn = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			local f4_local0 = function ( f5_arg0 )
				local f5_local0 = function ( f6_arg0 )
					local f6_local0 = function ( f7_arg0 )
						local f7_local0 = function ( f8_arg0 )
							local f8_local0 = function ( f9_arg0 )
								local f9_local0 = function ( f10_arg0 )
									local f10_local0 = function ( f11_arg0 )
										local f11_local0 = function ( f12_arg0 )
											local f12_local0 = function ( f13_arg0 )
												f13_arg0:beginAnimation( 9 )
												f13_arg0:setAlpha( 1 )
												f13_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
											end
											
											f12_arg0:beginAnimation( 19 )
											f12_arg0:setAlpha( 0.75 )
											f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
										end
										
										f11_arg0:beginAnimation( 9 )
										f11_arg0:setAlpha( 0.74 )
										f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
									end
									
									f10_arg0:beginAnimation( 20 )
									f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
								end
								
								f9_arg0:beginAnimation( 10 )
								f9_arg0:setAlpha( 1 )
								f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
							end
							
							f8_arg0:beginAnimation( 20 )
							f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
						end
						
						f7_arg0:beginAnimation( 10 )
						f7_arg0:setAlpha( 0.4 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
					
					f6_arg0:beginAnimation( 20 )
					f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
				end
				
				f4_arg0.Icon:beginAnimation( 10 )
				f4_arg0.Icon:setAlpha( 1 )
				f4_arg0.Icon:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Icon:registerEventHandler( "transition_complete_keyframe", f5_local0 )
			end
			
			f4_arg0.Icon:completeAnimation()
			f4_arg0.Icon:setAlpha( 0 )
			f4_local0( f4_arg0.Icon )
		end,
		FadeOut = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			local f14_local0 = function ( f15_arg0 )
				f14_arg0.Icon:beginAnimation( 100 )
				f14_arg0.Icon:setAlpha( 0 )
				f14_arg0.Icon:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.Icon:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
			end
			
			f14_arg0.Icon:completeAnimation()
			f14_arg0.Icon:setAlpha( 1 )
			f14_local0( f14_arg0.Icon )
		end
	}
}
