CoD.Prompt_Arrow = InheritFrom( LUI.UIElement )
CoD.Prompt_Arrow.__defaultWidth = 10
CoD.Prompt_Arrow.__defaultHeight = 10
CoD.Prompt_Arrow.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Prompt_Arrow )
	self.id = "Prompt_Arrow"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Text_Prompt_Arrow = LUI.UIImage.new( 0, 0, -14, -4, 0, 0, 0, 10 )
	Text_Prompt_Arrow:setAlpha( 0.35 )
	Text_Prompt_Arrow:setImage( RegisterImage( 0xD3A6F196D4105C9 ) )
	self:addElement( Text_Prompt_Arrow )
	self.Text_Prompt_Arrow = Text_Prompt_Arrow
	
	local Text_Prompt_Arrow2 = LUI.UIImage.new( 0, 0, -7, 3, 0, 0, 0, 10 )
	Text_Prompt_Arrow2:setAlpha( 0.65 )
	Text_Prompt_Arrow2:setImage( RegisterImage( 0xD3A6F196D4105C9 ) )
	self:addElement( Text_Prompt_Arrow2 )
	self.Text_Prompt_Arrow2 = Text_Prompt_Arrow2
	
	local Text_Prompt_Arrow3 = LUI.UIImage.new( 0, 0, 0, 10, 0, 0, 0, 10 )
	Text_Prompt_Arrow3:setImage( RegisterImage( 0xD3A6F196D4105C9 ) )
	self:addElement( Text_Prompt_Arrow3 )
	self.Text_Prompt_Arrow3 = Text_Prompt_Arrow3
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.Prompt_Arrow.__resetProperties = function ( f2_arg0 )
	f2_arg0.Text_Prompt_Arrow3:completeAnimation()
	f2_arg0.Text_Prompt_Arrow:completeAnimation()
	f2_arg0.Text_Prompt_Arrow2:completeAnimation()
	f2_arg0.Text_Prompt_Arrow3:setAlpha( 1 )
	f2_arg0.Text_Prompt_Arrow:setAlpha( 0.35 )
	f2_arg0.Text_Prompt_Arrow2:setAlpha( 0.65 )
end

CoD.Prompt_Arrow.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 3 )
			local f3_local0 = function ( f4_arg0 )
				local f4_local0 = function ( f5_arg0 )
					local f5_local0 = function ( f6_arg0 )
						local f6_local0 = function ( f7_arg0 )
							f7_arg0:beginAnimation( 209 )
							f7_arg0:setAlpha( 0.15 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f6_arg0:beginAnimation( 200 )
						f6_arg0:setAlpha( 0 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
					
					f5_arg0:beginAnimation( 200 )
					f5_arg0:setAlpha( 1 )
					f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
				end
				
				f3_arg0.Text_Prompt_Arrow:beginAnimation( 200 )
				f3_arg0.Text_Prompt_Arrow:setAlpha( 0.5 )
				f3_arg0.Text_Prompt_Arrow:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Text_Prompt_Arrow:registerEventHandler( "transition_complete_keyframe", f4_local0 )
			end
			
			f3_arg0.Text_Prompt_Arrow:completeAnimation()
			f3_arg0.Text_Prompt_Arrow:setAlpha( 0.15 )
			f3_local0( f3_arg0.Text_Prompt_Arrow )
			local f3_local1 = function ( f8_arg0 )
				local f8_local0 = function ( f9_arg0 )
					local f9_local0 = function ( f10_arg0 )
						local f10_local0 = function ( f11_arg0 )
							f11_arg0:beginAnimation( 209 )
							f11_arg0:setAlpha( 0 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f10_arg0:beginAnimation( 200 )
						f10_arg0:setAlpha( 1 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
					
					f9_arg0:beginAnimation( 200 )
					f9_arg0:setAlpha( 0.5 )
					f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
				end
				
				f3_arg0.Text_Prompt_Arrow2:beginAnimation( 200 )
				f3_arg0.Text_Prompt_Arrow2:setAlpha( 0.15 )
				f3_arg0.Text_Prompt_Arrow2:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Text_Prompt_Arrow2:registerEventHandler( "transition_complete_keyframe", f8_local0 )
			end
			
			f3_arg0.Text_Prompt_Arrow2:completeAnimation()
			f3_arg0.Text_Prompt_Arrow2:setAlpha( 0 )
			f3_local1( f3_arg0.Text_Prompt_Arrow2 )
			local f3_local2 = function ( f12_arg0 )
				local f12_local0 = function ( f13_arg0 )
					local f13_local0 = function ( f14_arg0 )
						local f14_local0 = function ( f15_arg0 )
							f15_arg0:beginAnimation( 209 )
							f15_arg0:setAlpha( 1 )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f14_arg0:beginAnimation( 200 )
						f14_arg0:setAlpha( 0.5 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
					
					f13_arg0:beginAnimation( 200 )
					f13_arg0:setAlpha( 0.15 )
					f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
				end
				
				f3_arg0.Text_Prompt_Arrow3:beginAnimation( 200 )
				f3_arg0.Text_Prompt_Arrow3:setAlpha( 0 )
				f3_arg0.Text_Prompt_Arrow3:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.Text_Prompt_Arrow3:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
			
			f3_arg0.Text_Prompt_Arrow3:completeAnimation()
			f3_arg0.Text_Prompt_Arrow3:setAlpha( 1 )
			f3_local2( f3_arg0.Text_Prompt_Arrow3 )
			f3_arg0.nextClip = "DefaultClip"
		end
	}
}
