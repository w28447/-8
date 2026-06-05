CoD.ConsoleText = InheritFrom( LUI.UIElement )
CoD.ConsoleText.__defaultWidth = 495
CoD.ConsoleText.__defaultHeight = 21
CoD.ConsoleText.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ConsoleText )
	self.id = "ConsoleText"
	self.soundSet = "HUD"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Text = LUI.UIText.new( 0, 0, 0, 495, 0, 0, -2.5, 23.5 )
	Text:setText( "" )
	Text:setTTF( "ttmussels_regular" )
	Text:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( Text )
	self.Text = Text
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ConsoleText.__resetProperties = function ( f2_arg0 )
	f2_arg0.Text:completeAnimation()
	f2_arg0.Text:setAlpha( 1 )
end

CoD.ConsoleText.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			f3_arg0.Text:completeAnimation()
			f3_arg0.Text:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.Text )
		end,
		FadeOut = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			local f4_local0 = function ( f5_arg0 )
				f4_arg0.Text:beginAnimation( 100 )
				f4_arg0.Text:setAlpha( 0 )
				f4_arg0.Text:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Text:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
			end
			
			f4_arg0.Text:completeAnimation()
			f4_arg0.Text:setAlpha( 1 )
			f4_local0( f4_arg0.Text )
		end,
		FadeIn = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			local f6_local0 = function ( f7_arg0 )
				f6_arg0.Text:beginAnimation( 100 )
				f6_arg0.Text:setAlpha( 1 )
				f6_arg0.Text:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.Text:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
			end
			
			f6_arg0.Text:completeAnimation()
			f6_arg0.Text:setAlpha( 0 )
			f6_local0( f6_arg0.Text )
		end
	}
}
