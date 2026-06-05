CoD.MPScr_PlusPoints = InheritFrom( LUI.UIElement )
CoD.MPScr_PlusPoints.__defaultWidth = 75
CoD.MPScr_PlusPoints.__defaultHeight = 27
CoD.MPScr_PlusPoints.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.MPScr_PlusPoints )
	self.id = "MPScr_PlusPoints"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Score = LUI.UIText.new( 0, 0, 0, 75, 0, 0, 0, 27 )
	Score:setAlpha( 0 )
	Score:setText( "" )
	Score:setTTF( "0arame_mono_stencil" )
	Score:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( Score )
	self.Score = Score
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.MPScr_PlusPoints.__resetProperties = function ( f2_arg0 )
	f2_arg0.Score:completeAnimation()
	f2_arg0.Score:setRGB( 1, 1, 1 )
	f2_arg0.Score:setAlpha( 0 )
end

CoD.MPScr_PlusPoints.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 0 )
		end,
		GoldenScore = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			local f4_local0 = function ( f5_arg0 )
				local f5_local0 = function ( f6_arg0 )
					f6_arg0:beginAnimation( 250 )
					f6_arg0:setAlpha( 0 )
					f6_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
				end
				
				f4_arg0.Score:beginAnimation( 500 )
				f4_arg0.Score:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Score:registerEventHandler( "transition_complete_keyframe", f5_local0 )
			end
			
			f4_arg0.Score:completeAnimation()
			f4_arg0.Score:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
			f4_arg0.Score:setAlpha( 1 )
			f4_local0( f4_arg0.Score )
		end
	}
}
