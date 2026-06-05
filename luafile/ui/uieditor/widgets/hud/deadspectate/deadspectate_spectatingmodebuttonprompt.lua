CoD.DeadSpectate_SpectatingModeButtonPrompt = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingModeButtonPrompt.__defaultWidth = 37
CoD.DeadSpectate_SpectatingModeButtonPrompt.__defaultHeight = 37
CoD.DeadSpectate_SpectatingModeButtonPrompt.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DeadSpectate_SpectatingModeButtonPrompt )
	self.id = "DeadSpectate_SpectatingModeButtonPrompt"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local button = LUI.UIImage.new( 0.5, 0.5, -19, 19, 0.5, 0.5, -19, 19 )
	button:subscribeToGlobalModel( f1_arg1, "Controller", "alt2_button_image", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			button:setImage( RegisterImage( f2_local0 ) )
		end
	end )
	self:addElement( button )
	self.button = button
	
	local buttonMouse = nil
	
	buttonMouse = LUI.UIImage.new( 0.5, 0.5, -19, 19, 0.5, 0.5, -26, 19 )
	buttonMouse:setAlpha( 0 )
	buttonMouse:subscribeToGlobalModel( f1_arg1, "Controller", "mouse_middle_button_image", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			buttonMouse:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	self:addElement( buttonMouse )
	self.buttonMouse = buttonMouse
	
	self:mergeStateConditions( {
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsGamepad( f1_arg1 ) then
					f4_local0 = IsPC()
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f5_arg1 )
	end )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	f1_local4( f1_local3, f1_local5.LastInput, function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DeadSpectate_SpectatingModeButtonPrompt.__resetProperties = function ( f7_arg0 )
	f7_arg0.button:completeAnimation()
	f7_arg0.buttonMouse:completeAnimation()
	f7_arg0.button:setAlpha( 1 )
	f7_arg0.buttonMouse:setAlpha( 0 )
end

CoD.DeadSpectate_SpectatingModeButtonPrompt.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end
	},
	KeyMouse = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 2 )
			f9_arg0.button:completeAnimation()
			f9_arg0.button:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.button )
			f9_arg0.buttonMouse:completeAnimation()
			f9_arg0.buttonMouse:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.buttonMouse )
		end
	}
}
CoD.DeadSpectate_SpectatingModeButtonPrompt.__onClose = function ( f10_arg0 )
	f10_arg0.button:close()
	f10_arg0.buttonMouse:close()
end

