require( "ui/uieditor/widgets/mphudwidgets/scorepopup/mpscr_pluspoints" )

CoD.MPScr_PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.MPScr_PlusPointsContainer.__defaultWidth = 75
CoD.MPScr_PlusPointsContainer.__defaultHeight = 27
CoD.MPScr_PlusPointsContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPScr_PlusPointsContainer )
	self.id = "MPScr_PlusPointsContainer"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local MPScrPlusPoints = CoD.MPScr_PlusPoints.new( f1_arg0, f1_arg1, 0, 0, 0, 75, 0, 0, 0, 27 )
	self:addElement( MPScrPlusPoints )
	self.MPScrPlusPoints = MPScrPlusPoints
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.MPScr_PlusPointsContainer.__resetProperties = function ( f2_arg0 )
	f2_arg0.MPScrPlusPoints:completeAnimation()
	f2_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
	f2_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
end

CoD.MPScr_PlusPointsContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 0 )
		end,
		Anim1 = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			local f4_local0 = function ( f5_arg0 )
				f4_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f4_arg0.MPScrPlusPoints:setLeftRight( 0, 0, -141, -66 )
				f4_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -28, -1 )
				f4_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
			end
			
			f4_arg0.MPScrPlusPoints:completeAnimation()
			f4_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f4_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f4_local0( f4_arg0.MPScrPlusPoints )
		end,
		Anim2 = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			local f6_local0 = function ( f7_arg0 )
				f6_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f6_arg0.MPScrPlusPoints:setLeftRight( 0, 0, -19, 56 )
				f6_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -33, -6 )
				f6_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
			end
			
			f6_arg0.MPScrPlusPoints:completeAnimation()
			f6_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f6_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f6_local0( f6_arg0.MPScrPlusPoints )
		end,
		Anim3 = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			local f8_local0 = function ( f9_arg0 )
				f8_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f8_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 36, 111 )
				f8_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -54, -27 )
				f8_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.MPScrPlusPoints:completeAnimation()
			f8_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f8_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f8_local0( f8_arg0.MPScrPlusPoints )
		end,
		Anim4 = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			local f10_local0 = function ( f11_arg0 )
				f10_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f10_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 7, 82 )
				f10_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -43, -16 )
				f10_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
				f10_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
			end
			
			f10_arg0.MPScrPlusPoints:completeAnimation()
			f10_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f10_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f10_local0( f10_arg0.MPScrPlusPoints )
		end,
		Anim5 = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			local f12_local0 = function ( f13_arg0 )
				f12_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f12_arg0.MPScrPlusPoints:setLeftRight( 0, 0, -140, -65 )
				f12_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -49, -22 )
				f12_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f12_arg0.clipInterrupted )
				f12_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f12_arg0.clipFinished )
			end
			
			f12_arg0.MPScrPlusPoints:completeAnimation()
			f12_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f12_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f12_local0( f12_arg0.MPScrPlusPoints )
		end,
		Anim6 = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			local f14_local0 = function ( f15_arg0 )
				f14_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f14_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 144, 219 )
				f14_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -27, 0 )
				f14_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
			end
			
			f14_arg0.MPScrPlusPoints:completeAnimation()
			f14_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f14_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f14_local0( f14_arg0.MPScrPlusPoints )
		end,
		Anim7 = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			local f16_local0 = function ( f17_arg0 )
				f16_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f16_arg0.MPScrPlusPoints:setLeftRight( 0, 0, -12, 63 )
				f16_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -30, -3 )
				f16_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.MPScrPlusPoints:completeAnimation()
			f16_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f16_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f16_local0( f16_arg0.MPScrPlusPoints )
		end,
		Anim8 = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			local f18_local0 = function ( f19_arg0 )
				f18_arg0.MPScrPlusPoints:beginAnimation( 750 )
				f18_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 88, 163 )
				f18_arg0.MPScrPlusPoints:setTopBottom( 0, 0, -46, -19 )
				f18_arg0.MPScrPlusPoints:registerEventHandler( "interrupted_keyframe", f18_arg0.clipInterrupted )
				f18_arg0.MPScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f18_arg0.clipFinished )
			end
			
			f18_arg0.MPScrPlusPoints:completeAnimation()
			f18_arg0.MPScrPlusPoints:setLeftRight( 0, 0, 0, 75 )
			f18_arg0.MPScrPlusPoints:setTopBottom( 0, 0, 0, 27 )
			f18_local0( f18_arg0.MPScrPlusPoints )
		end
	}
}
CoD.MPScr_PlusPointsContainer.__onClose = function ( f20_arg0 )
	f20_arg0.MPScrPlusPoints:close()
end

