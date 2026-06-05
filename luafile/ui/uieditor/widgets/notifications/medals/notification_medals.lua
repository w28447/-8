CoD.Notification_Medals = InheritFrom( LUI.UIElement )
CoD.Notification_Medals.__defaultWidth = 768
CoD.Notification_Medals.__defaultHeight = 267
CoD.Notification_Medals.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Notification_Medals )
	self.id = "Notification_Medals"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Image = LUI.UIImage.new( 0.5, 0.5, -96, 96, 0.5, 0.5, -134, 58 )
	Image:setAlpha( 0 )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, 58, 96 )
	Text:setAlpha( 0 )
	Text:setText( Engine[0xF9F1239CFD921FE]( "medal/headshot" ) )
	Text:setTTF( "default" )
	Text:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Text:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Text )
	self.Text = Text
	
	local SubText = LUI.UIText.new( 0, 1, 0, 0, 0.5, 0.5, 96, 134 )
	SubText:setAlpha( 0 )
	SubText:setText( Engine[0xF9F1239CFD921FE]( "medal/headshot" ) )
	SubText:setTTF( "default" )
	SubText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	SubText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( SubText )
	self.SubText = SubText
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.Notification_Medals.__resetProperties = function ( f2_arg0 )
	f2_arg0.Text:completeAnimation()
	f2_arg0.Image:completeAnimation()
	f2_arg0.SubText:completeAnimation()
	f2_arg0.Text:setAlpha( 0 )
	f2_arg0.Image:setAlpha( 0 )
	f2_arg0.SubText:setAlpha( 0 )
end

CoD.Notification_Medals.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 0 )
		end,
		medal_received = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 3 )
			local f4_local0 = function ( f5_arg0 )
				local f5_local0 = function ( f6_arg0 )
					local f6_local0 = function ( f7_arg0 )
						local f7_local0 = function ( f8_arg0 )
							f8_arg0:beginAnimation( 150 )
							f8_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
						end
						
						f7_arg0:beginAnimation( 250 )
						f7_arg0:setAlpha( 0 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
					
					f6_arg0:beginAnimation( 1500 )
					f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
				end
				
				f4_arg0.Image:beginAnimation( 250 )
				f4_arg0.Image:setAlpha( 1 )
				f4_arg0.Image:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Image:registerEventHandler( "transition_complete_keyframe", f5_local0 )
			end
			
			f4_arg0.Image:completeAnimation()
			f4_arg0.Image:setAlpha( 0 )
			f4_local0( f4_arg0.Image )
			local f4_local1 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					local f10_local0 = function ( f11_arg0 )
						local f11_local0 = function ( f12_arg0 )
							f12_arg0:beginAnimation( 150 )
							f12_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
						end
						
						f11_arg0:beginAnimation( 250 )
						f11_arg0:setAlpha( 0 )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
					
					f10_arg0:beginAnimation( 1500 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
				end
				
				f4_arg0.Text:beginAnimation( 250 )
				f4_arg0.Text:setAlpha( 1 )
				f4_arg0.Text:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Text:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f4_arg0.Text:completeAnimation()
			f4_arg0.Text:setAlpha( 0 )
			f4_local1( f4_arg0.Text )
			local f4_local2 = function ( f13_arg0 )
				local f13_local0 = function ( f14_arg0 )
					local f14_local0 = function ( f15_arg0 )
						local f15_local0 = function ( f16_arg0 )
							f16_arg0:beginAnimation( 150 )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
						end
						
						f15_arg0:beginAnimation( 250 )
						f15_arg0:setAlpha( 0 )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
					
					f14_arg0:beginAnimation( 1500 )
					f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
				end
				
				f4_arg0.SubText:beginAnimation( 250 )
				f4_arg0.SubText:setAlpha( 1 )
				f4_arg0.SubText:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.SubText:registerEventHandler( "transition_complete_keyframe", f13_local0 )
			end
			
			f4_arg0.SubText:completeAnimation()
			f4_arg0.SubText:setAlpha( 0 )
			f4_local2( f4_arg0.SubText )
		end
	}
}
