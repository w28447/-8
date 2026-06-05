require( "ui/uieditor/widgets/hud/console/consoleicon" )
require( "ui/uieditor/widgets/hud/console/consoletext" )

CoD.ConsoleEntry = InheritFrom( LUI.UIElement )
CoD.ConsoleEntry.__defaultWidth = 1035
CoD.ConsoleEntry.__defaultHeight = 34
CoD.ConsoleEntry.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ConsoleEntry )
	self.id = "ConsoleEntry"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Panel = LUI.UIImage.new( 0, 1, -5, 5, 0.04, 0.96, -2, 2 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	Panel:setMaterial( LUI.UIImage.GetCachedMaterial( 0x81EEB1F96D4BE0A ) )
	Panel:setShaderVector( 0, 0, 0.68, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Icon1 = CoD.ConsoleIcon.new( f1_arg0, f1_arg1, 0, 0, 517.5, 539.5, 0.18, 0.18, -0.5, 20.5 )
	Icon1:linkToElementModel( self, "icon1", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Icon1.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f2_local0 ) ) )
		end
	end )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Icon0 = CoD.ConsoleIcon.new( f1_arg0, f1_arg1, 0, 0, 0, 22, 0.18, 0.18, -0.5, 20.5 )
	Icon0:linkToElementModel( self, "icon0", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			Icon0.Icon:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f3_local0 ) ) )
		end
	end )
	self:addElement( Icon0 )
	self.Icon0 = Icon0
	
	local Text0 = CoD.ConsoleText.new( f1_arg0, f1_arg1, 0, 0, 22.5, 517.5, 0.18, 0.18, -0.5, 20.5 )
	Text0.Text.__Color = function ( f4_arg0 )
		local f4_local0 = f4_arg0:get()
		if f4_local0 ~= nil then
			Text0.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f4_local0 ) )
		end
	end
	
	Text0:linkToElementModel( self, "text0color", true, Text0.Text.__Color )
	Text0.Text.__Color_FullPath = function ()
		local f5_local0 = self:getModel()
		if f5_local0 then
			f5_local0 = self:getModel()
			f5_local0 = f5_local0.text0color
		end
		if f5_local0 then
			Text0.Text.__Color( f5_local0 )
		end
	end
	
	Text0:linkToElementModel( self, "text0", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			Text0.Text:setText( CoD.BaseUtility.AlreadyLocalized( f6_local0 ) )
		end
	end )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	local Text1 = CoD.ConsoleText.new( f1_arg0, f1_arg1, 0, 0, 540.5, 1035.5, 0.18, 0.18, -0.5, 20.5 )
	Text1.Text.__Color = function ( f7_arg0 )
		local f7_local0 = f7_arg0:get()
		if f7_local0 ~= nil then
			Text1.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f7_local0 ) )
		end
	end
	
	Text1:linkToElementModel( self, "text1color", true, Text1.Text.__Color )
	Text1.Text.__Color_FullPath = function ()
		local f8_local0 = self:getModel()
		if f8_local0 then
			f8_local0 = self:getModel()
			f8_local0 = f8_local0.text1color
		end
		if f8_local0 then
			Text1.Text.__Color( f8_local0 )
		end
	end
	
	Text1:linkToElementModel( self, "text1", true, function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			Text1.Text:setText( CoD.BaseUtility.AlreadyLocalized( f9_local0 ) )
		end
	end )
	self:addElement( Text1 )
	self.Text1 = Text1
	
	local Text2 = CoD.ConsoleText.new( f1_arg0, f1_arg1, 0, 0, 1035, 1530, 0.18, 0.18, -0.5, 20.5 )
	Text2.Text.__Color = function ( f10_arg0 )
		local f10_local0 = f10_arg0:get()
		if f10_local0 ~= nil then
			Text2.Text:setRGB( ConsoleColorFromIndex( f1_arg1, f10_local0 ) )
		end
	end
	
	Text2:linkToElementModel( self, "text2color", true, Text2.Text.__Color )
	Text2.Text.__Color_FullPath = function ()
		local f11_local0 = self:getModel()
		if f11_local0 then
			f11_local0 = self:getModel()
			f11_local0 = f11_local0.text2color
		end
		if f11_local0 then
			Text2.Text.__Color( f11_local0 )
		end
	end
	
	Text2:linkToElementModel( self, "text2", true, function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			Text2.Text:setText( CoD.BaseUtility.AlreadyLocalized( f12_local0 ) )
		end
	end )
	self:addElement( Text2 )
	self.Text2 = Text2
	
	local f1_local7 = Text0
	local f1_local8 = Text0.subscribeToModel
	local f1_local9 = Engine.GetModelForController( f1_arg1 )
	f1_local8( f1_local7, f1_local9["profile.colorblindMode"], Text0.Text.__Color_FullPath )
	f1_local7 = Text1
	f1_local8 = Text1.subscribeToModel
	f1_local9 = Engine.GetModelForController( f1_arg1 )
	f1_local8( f1_local7, f1_local9["profile.colorblindMode"], Text1.Text.__Color_FullPath )
	f1_local7 = Text2
	f1_local8 = Text2.subscribeToModel
	f1_local9 = Engine.GetModelForController( f1_arg1 )
	f1_local8( f1_local7, f1_local9["profile.colorblindMode"], Text2.Text.__Color_FullPath )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ConsoleEntry.__resetProperties = function ( f13_arg0 )
	f13_arg0.Panel:completeAnimation()
	f13_arg0.Panel:setAlpha( 0 )
end

CoD.ConsoleEntry.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 0 )
		end,
		FadeIn = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.Panel:beginAnimation( 130, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
				f15_arg0.Panel:setAlpha( 1 )
				f15_arg0.Panel:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.Panel:completeAnimation()
			f15_arg0.Panel:setAlpha( 0 )
			f15_local0( f15_arg0.Panel )
		end,
		FadeOut = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 1 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.Panel:beginAnimation( 130 )
				f17_arg0.Panel:setAlpha( 0 )
				f17_arg0.Panel:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.Panel:completeAnimation()
			f17_arg0.Panel:setAlpha( 1 )
			f17_local0( f17_arg0.Panel )
		end
	}
}
CoD.ConsoleEntry.__onClose = function ( f19_arg0 )
	f19_arg0.Icon1:close()
	f19_arg0.Icon0:close()
	f19_arg0.Text0:close()
	f19_arg0.Text1:close()
	f19_arg0.Text2:close()
end

