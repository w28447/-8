require( "ui/uieditor/widgets/hud/zm_score/zmscr_pluspoints" )

CoD.ZMScr_PlusPointsContainer = InheritFrom( LUI.UIElement )
CoD.ZMScr_PlusPointsContainer.__defaultWidth = 127
CoD.ZMScr_PlusPointsContainer.__defaultHeight = 99
CoD.ZMScr_PlusPointsContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScr_PlusPointsContainer )
	self.id = "ZMScr_PlusPointsContainer"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZMScrPlusPoints = CoD.ZMScr_PlusPoints.new( f1_arg0, f1_arg1, 0, 0, 103, 231, 0, 0, 70, 169 )
	ZMScrPlusPoints.Label2:setText( CoD.BaseUtility.AlreadyLocalized( "+50" ) )
	ZMScrPlusPoints.Label1:setText( CoD.BaseUtility.AlreadyLocalized( "+50" ) )
	self:addElement( ZMScrPlusPoints )
	self.ZMScrPlusPoints = ZMScrPlusPoints
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMScr_PlusPointsContainer.__resetProperties = function ( f2_arg0 )
	f2_arg0.ZMScrPlusPoints:completeAnimation()
	f2_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 103, 231 )
	f2_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 70, 169 )
	f2_arg0.ZMScrPlusPoints:setAlpha( 1 )
end

CoD.ZMScr_PlusPointsContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			local f3_local0 = function ( f4_arg0 )
				f3_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f3_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
			end
			
			f3_arg0.ZMScrPlusPoints:completeAnimation()
			f3_arg0.ZMScrPlusPoints:setAlpha( 0 )
			f3_local0( f3_arg0.ZMScrPlusPoints )
		end,
		Anim1 = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			local f5_local0 = function ( f6_arg0 )
				f5_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f5_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 146, 274 )
				f5_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, -86, 13 )
				f5_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
			end
			
			f5_arg0.ZMScrPlusPoints:completeAnimation()
			f5_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f5_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f5_local0( f5_arg0.ZMScrPlusPoints )
		end,
		Anim2 = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			local f7_local0 = function ( f8_arg0 )
				f7_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f7_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 147, 275 )
				f7_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, -23, 76 )
				f7_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
				f7_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
			end
			
			f7_arg0.ZMScrPlusPoints:completeAnimation()
			f7_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f7_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f7_local0( f7_arg0.ZMScrPlusPoints )
		end,
		Anim3 = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			local f9_local0 = function ( f10_arg0 )
				f9_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f9_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 116, 244 )
				f9_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 67, 166 )
				f9_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f9_arg0.clipInterrupted )
				f9_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f9_arg0.clipFinished )
			end
			
			f9_arg0.ZMScrPlusPoints:completeAnimation()
			f9_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f9_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f9_local0( f9_arg0.ZMScrPlusPoints )
		end,
		Anim4 = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			local f11_local0 = function ( f12_arg0 )
				f11_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f11_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 125, 253 )
				f11_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, -23, 76 )
				f11_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
			end
			
			f11_arg0.ZMScrPlusPoints:completeAnimation()
			f11_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f11_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f11_local0( f11_arg0.ZMScrPlusPoints )
		end,
		Anim5 = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 1 )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f13_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 83, 211 )
				f13_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, -65, 34 )
				f13_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.ZMScrPlusPoints:completeAnimation()
			f13_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f13_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f13_local0( f13_arg0.ZMScrPlusPoints )
		end,
		Anim6 = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f15_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 124, 252 )
				f15_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 46, 145 )
				f15_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.ZMScrPlusPoints:completeAnimation()
			f15_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f15_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f15_local0( f15_arg0.ZMScrPlusPoints )
		end,
		Anim7 = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 1 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f17_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 126, 254 )
				f17_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, -58, 41 )
				f17_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.ZMScrPlusPoints:completeAnimation()
			f17_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f17_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f17_local0( f17_arg0.ZMScrPlusPoints )
		end,
		Anim8 = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 1 )
			local f19_local0 = function ( f20_arg0 )
				f19_arg0.ZMScrPlusPoints:beginAnimation( 750 )
				f19_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 103, 231 )
				f19_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 70, 169 )
				f19_arg0.ZMScrPlusPoints:registerEventHandler( "interrupted_keyframe", f19_arg0.clipInterrupted )
				f19_arg0.ZMScrPlusPoints:registerEventHandler( "transition_complete_keyframe", f19_arg0.clipFinished )
			end
			
			f19_arg0.ZMScrPlusPoints:completeAnimation()
			f19_arg0.ZMScrPlusPoints:setLeftRight( 0, 0, 0, 128 )
			f19_arg0.ZMScrPlusPoints:setTopBottom( 0, 0, 0, 99 )
			f19_local0( f19_arg0.ZMScrPlusPoints )
		end
	}
}
CoD.ZMScr_PlusPointsContainer.__onClose = function ( f21_arg0 )
	f21_arg0.ZMScrPlusPoints:close()
end

