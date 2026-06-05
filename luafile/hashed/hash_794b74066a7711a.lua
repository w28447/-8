require( "x64:762eec3732db918" )

CoD.ZmAmmo_BGBCarouselButtonPromptFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBCarouselButtonPromptFactory.__defaultWidth = 68
CoD.ZmAmmo_BGBCarouselButtonPromptFactory.__defaultHeight = 68
CoD.ZmAmmo_BGBCarouselButtonPromptFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_BGBCarouselButtonPromptFactory )
	self.id = "ZmAmmo_BGBCarouselButtonPromptFactory"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DpadBackplate = LUI.UIImage.new( 0.5, 0.5, -34, 34, 0.5, 0.5, -34, 34 )
	DpadBackplate:setImage( RegisterImage( "uie_zm_hud_elixirdpadbacking" ) )
	self:addElement( DpadBackplate )
	self.DpadBackplate = DpadBackplate
	
	local DownArrowNew = CoD.ZmAmmo_BGBCarouselButtonFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -16, 16, 0.5, 0.5, -2, 30 )
	DownArrowNew:setZRot( 180 )
	DownArrowNew.ConsoleButton.GlobalDpadButton:setImage( RegisterImage( "uie_zm_hud_elixirdpaddown" ) )
	DownArrowNew:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "2", function ( model )
		DownArrowNew:setModel( model, f1_arg1 )
	end )
	self:addElement( DownArrowNew )
	self.DownArrowNew = DownArrowNew
	
	local UpArrowNew = CoD.ZmAmmo_BGBCarouselButtonFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -16, 16, 0.5, 0.5, -30, 2 )
	UpArrowNew:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "0", function ( model )
		UpArrowNew:setModel( model, f1_arg1 )
	end )
	self:addElement( UpArrowNew )
	self.UpArrowNew = UpArrowNew
	
	local RightArrowNew = CoD.ZmAmmo_BGBCarouselButtonFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -2, 30, 0.5, 0.5, -16, 16 )
	RightArrowNew:setZRot( -90 )
	RightArrowNew.ConsoleButton.GlobalDpadButton:setImage( RegisterImage( "uie_zm_hud_elixirdpadright" ) )
	RightArrowNew:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "1", function ( model )
		RightArrowNew:setModel( model, f1_arg1 )
	end )
	self:addElement( RightArrowNew )
	self.RightArrowNew = RightArrowNew
	
	local LeftArrowNew = CoD.ZmAmmo_BGBCarouselButtonFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -30, 2, 0.5, 0.5, -16, 16 )
	LeftArrowNew:setZRot( 90 )
	LeftArrowNew.ConsoleButton.GlobalDpadButton:setImage( RegisterImage( "uie_zm_hud_elixirdpadleft" ) )
	LeftArrowNew:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "3", function ( model )
		LeftArrowNew:setModel( model, f1_arg1 )
	end )
	self:addElement( LeftArrowNew )
	self.LeftArrowNew = LeftArrowNew
	
	self:mergeStateConditions( {
		{
			stateName = "DurangoControls",
			condition = function ( menu, element, event )
				return IsDurangoGamepad( f1_arg1 )
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f7_arg0, f7_arg1 )
		f7_arg1.menu = f7_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f7_arg1 )
	end )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local7( f1_local6, f1_local8.LastInput, function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBCarouselButtonPromptFactory.__onClose = function ( f9_arg0 )
	f9_arg0.DownArrowNew:close()
	f9_arg0.UpArrowNew:close()
	f9_arg0.RightArrowNew:close()
	f9_arg0.LeftArrowNew:close()
end

