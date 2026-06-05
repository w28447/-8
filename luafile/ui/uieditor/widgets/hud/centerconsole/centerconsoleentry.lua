require( "x64:c50f23ab4600782" )
require( "x64:ee862a5c760e804" )
require( "ui/uieditor/widgets/lobby/common/fe_listsubheaderpanel" )

CoD.CenterConsoleEntry = InheritFrom( LUI.UIElement )
CoD.CenterConsoleEntry.__defaultWidth = 1110
CoD.CenterConsoleEntry.__defaultHeight = 33
CoD.CenterConsoleEntry.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CenterConsoleEntry )
	self.id = "CenterConsoleEntry"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Panel = CoD.FE_ListSubHeaderPanel.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 0, 0, 33 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Text1 = CoD.CenterConsoleText.new( f1_arg0, f1_arg1, 0.5, 0.5, 53, 555, 0.5, 0.5, -19.5, 19.5 )
	Text1:setRGB( 1, 0, 0 )
	Text1:setAlpha( 0.9 )
	Text1.Text.__Color = function ( f2_arg0 )
		local f2_local0 = f2_arg0:get()
		if f2_local0 ~= nil then
			Text1.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f2_local0 ) )
		end
	end
	
	Text1:linkToElementModel( self, "text1color", true, Text1.Text.__Color )
	Text1.Text.__Color_FullPath = function ()
		local f3_local0 = self:getModel()
		if f3_local0 then
			f3_local0 = self:getModel()
			f3_local0 = f3_local0.text1color
		end
		if f3_local0 then
			Text1.Text.__Color( f3_local0 )
		end
	end
	
	Text1:linkToElementModel( self, "text1", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			Text1.Text:setText( CoD.BaseUtility.AlreadyLocalized( f4_local0 ) )
		end
	end )
	self:addElement( Text1 )
	self.Text1 = Text1
	
	local Icon1 = CoD.CenterConsoleIcon.new( f1_arg0, f1_arg1, 0.5, 0.5, 14, 53, 0.5, 0.5, -19.5, 19.5 )
	Icon1:linkToElementModel( self, "icon1", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			Icon1.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f5_local0 ) ) )
		end
	end )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Text0 = CoD.CenterConsoleText.new( f1_arg0, f1_arg1, 0.5, 0.5, -516, 14, 0.5, 0.5, -19.5, 19.5 )
	Text0.Text.__Color = function ( f6_arg0 )
		local f6_local0 = f6_arg0:get()
		if f6_local0 ~= nil then
			Text0.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f6_local0 ) )
		end
	end
	
	Text0:linkToElementModel( self, "text0color", true, Text0.Text.__Color )
	Text0.Text.__Color_FullPath = function ()
		local f7_local0 = self:getModel()
		if f7_local0 then
			f7_local0 = self:getModel()
			f7_local0 = f7_local0.text0color
		end
		if f7_local0 then
			Text0.Text.__Color( f7_local0 )
		end
	end
	
	Text0:linkToElementModel( self, "text0", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			Text0.Text:setText( CoD.BaseUtility.AlreadyLocalized( f8_local0 ) )
		end
	end )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	local Icon0 = CoD.CenterConsoleIcon.new( f1_arg0, f1_arg1, 0.5, 0.5, -555, -516, 0.5, 0.5, -19.5, 19.5 )
	Icon0:linkToElementModel( self, "icon0", true, function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			Icon0.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f9_local0 ) ) )
		end
	end )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	local f1_local6 = Text1
	local f1_local7 = Text1.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["profile.colorblindMode"], Text1.Text.__Color_FullPath )
	f1_local6 = Text0
	f1_local7 = Text0.subscribeToModel
	f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8["profile.colorblindMode"], Text0.Text.__Color_FullPath )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.CenterConsoleEntry.__resetProperties = function ( f10_arg0 )
	f10_arg0.Panel:completeAnimation()
	f10_arg0.Panel:setRGB( 0, 0, 0 )
	f10_arg0.Panel:setAlpha( 0 )
end

CoD.CenterConsoleEntry.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 0 )
		end,
		FadeOut = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			local f12_local0 = function ( f13_arg0 )
				f12_arg0.Panel:beginAnimation( 280, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f12_arg0.Panel:setAlpha( 0 )
				f12_arg0.Panel:registerEventHandler( "interrupted_keyframe", f12_arg0.clipInterrupted )
				f12_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f12_arg0.clipFinished )
			end
			
			f12_arg0.Panel:completeAnimation()
			f12_arg0.Panel:setRGB( 0, 0, 0 )
			f12_arg0.Panel:setAlpha( 0.4 )
			f12_local0( f12_arg0.Panel )
		end,
		FadeIn = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			local f14_local0 = function ( f15_arg0 )
				local f15_local0 = function ( f16_arg0 )
					local f16_local0 = function ( f17_arg0 )
						local f17_local0 = function ( f18_arg0 )
							local f18_local0 = function ( f19_arg0 )
								local f19_local0 = function ( f20_arg0 )
									local f20_local0 = function ( f21_arg0 )
										local f21_local0 = function ( f22_arg0 )
											local f22_local0 = function ( f23_arg0 )
												f23_arg0:beginAnimation( 9 )
												f23_arg0:setAlpha( 0.4 )
												f23_arg0:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
											end
											
											f22_arg0:beginAnimation( 19 )
											f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
										end
										
										f21_arg0:beginAnimation( 9 )
										f21_arg0:setAlpha( 0.1 )
										f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
									end
									
									f20_arg0:beginAnimation( 20 )
									f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
								end
								
								f19_arg0:beginAnimation( 10 )
								f19_arg0:setRGB( 0, 0, 0 )
								f19_arg0:setAlpha( 0.4 )
								f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
							end
							
							f18_arg0:beginAnimation( 20 )
							f18_arg0:setRGB( 0.33, 0.33, 0.33 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
						
						f17_arg0:beginAnimation( 10 )
						f17_arg0:setAlpha( 0.1 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
					
					f16_arg0:beginAnimation( 20 )
					f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				end
				
				f14_arg0.Panel:beginAnimation( 10 )
				f14_arg0.Panel:setAlpha( 0.4 )
				f14_arg0.Panel:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f15_local0 )
			end
			
			f14_arg0.Panel:completeAnimation()
			f14_arg0.Panel:setRGB( 1, 1, 1 )
			f14_arg0.Panel:setAlpha( 0 )
			f14_local0( f14_arg0.Panel )
		end
	}
}
CoD.CenterConsoleEntry.__onClose = function ( f24_arg0 )
	f24_arg0.Panel:close()
	f24_arg0.Text1:close()
	f24_arg0.Icon1:close()
	f24_arg0.Text0:close()
	f24_arg0.Icon0:close()
end

