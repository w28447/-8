require( "x64:12e111bc47287a0" )
require( "x64:2732b622c6a4207" )

CoD.ZmAmmo_BGBCarouselFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBCarouselFactory.__defaultWidth = 200
CoD.ZmAmmo_BGBCarouselFactory.__defaultHeight = 200
CoD.ZmAmmo_BGBCarouselFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BGBUtility.CreateBGBCarouselModels( f1_arg1 )
	self:setClass( CoD.ZmAmmo_BGBCarouselFactory )
	self.id = "ZmAmmo_BGBCarouselFactory"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local buttons = CoD.ZmAmmo_BGBCarouselFactory_Internal.new( f1_arg0, f1_arg1, 0.5, 0.5, -100, 100, 0.5, 0.5, -100, 100 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local PCButtons = nil
	
	PCButtons = CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.new( f1_arg0, f1_arg1, 1, 1, -400, 0, 0.5, 0.5, -237.5, 125.5 )
	self:addElement( PCButtons )
	self.PCButtons = PCButtons
	
	self:mergeStateConditions( {
		{
			stateName = "DefaultStateKeyboard",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 )
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f3_arg1 )
	end )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	f1_local4( f1_local3, f1_local5.LastInput, function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBCarouselFactory.__resetProperties = function ( f5_arg0 )
	f5_arg0.PCButtons:completeAnimation()
	f5_arg0.buttons:completeAnimation()
	f5_arg0.PCButtons:setAlpha( 1 )
	f5_arg0.buttons:setAlpha( 1 )
end

CoD.ZmAmmo_BGBCarouselFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.PCButtons:completeAnimation()
			f6_arg0.PCButtons:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.PCButtons )
		end
	},
	DefaultStateKeyboard = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.buttons:completeAnimation()
			f7_arg0.buttons:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.buttons )
		end
	}
}
CoD.ZmAmmo_BGBCarouselFactory.__onClose = function ( f8_arg0 )
	f8_arg0.buttons:close()
	f8_arg0.PCButtons:close()
end

