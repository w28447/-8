require( "x64:fa9b3c4076531ba" )

CoD.List1ButtonLarge_PH = InheritFrom( LUI.UIElement )
CoD.List1ButtonLarge_PH.__defaultWidth = 310
CoD.List1ButtonLarge_PH.__defaultHeight = 60
CoD.List1ButtonLarge_PH.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.List1ButtonLarge_PH )
	self.id = "List1ButtonLarge_PH"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Text = CoD.List1ButtonLarge_PH_Internal.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Text )
	self.Text = Text
	
	self.Text:linkToElementModel( self, "displayText", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Text.Text:setText( LocalizeToUpperString( f2_local0 ) )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, f1_arg1 ) and not PropertyIsTrue( self, "hideHelpItemLabel" )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "disabled"
		} )
	end )
	Text.id = "Text"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.List1ButtonLarge_PH.__resetProperties = function ( f5_arg0 )
	f5_arg0.Text:completeAnimation()
	f5_arg0.Text:setScale( 1, 1 )
end

CoD.List1ButtonLarge_PH.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end,
		ChildFocus = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.Text:completeAnimation()
			f7_arg0.Text:setScale( 1.05, 1.05 )
			f7_arg0.clipFinished( f7_arg0.Text )
		end,
		GainChildFocus = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			local f8_local0 = function ( f9_arg0 )
				f8_arg0.Text:beginAnimation( 150 )
				f8_arg0.Text:setScale( 1.05, 1.05 )
				f8_arg0.Text:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.Text:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.Text:completeAnimation()
			f8_arg0.Text:setScale( 1, 1 )
			f8_local0( f8_arg0.Text )
		end,
		LoseChildFocus = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			local f10_local0 = function ( f11_arg0 )
				f10_arg0.Text:beginAnimation( 150 )
				f10_arg0.Text:setScale( 1, 1 )
				f10_arg0.Text:registerEventHandler( "interrupted_keyframe", f10_arg0.clipInterrupted )
				f10_arg0.Text:registerEventHandler( "transition_complete_keyframe", f10_arg0.clipFinished )
			end
			
			f10_arg0.Text:completeAnimation()
			f10_arg0.Text:setScale( 1.05, 1.05 )
			f10_local0( f10_arg0.Text )
		end
	},
	Disabled = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.List1ButtonLarge_PH.__onClose = function ( f13_arg0 )
	f13_arg0.Text:close()
end

