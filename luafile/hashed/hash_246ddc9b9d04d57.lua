CoD.ZmAmmo_BGBRingTimerFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBRingTimerFactory.__defaultWidth = 88
CoD.ZmAmmo_BGBRingTimerFactory.__defaultHeight = 88
CoD.ZmAmmo_BGBRingTimerFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_BGBRingTimerFactory )
	self.id = "ZmAmmo_BGBRingTimerFactory"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local BBGumRingLow = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BBGumRingLow:setYRot( 173 )
	BBGumRingLow:setImage( RegisterImage( "uie_zm_hud_elixirringmeter_low" ) )
	BBGumRingLow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRingLow:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRingLow:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRingLow:setShaderVector( 3, 0, 0, 0, 0 )
	BBGumRingLow:setShaderVector( 4, 0, 0, 0, 0 )
	BBGumRingLow:subscribeToGlobalModel( f1_arg1, "ZMHud", "bgb_timer", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			BBGumRingLow:setShaderVector( 0, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
		end
	end )
	self:addElement( BBGumRingLow )
	self.BBGumRingLow = BBGumRingLow
	
	local BBGumRing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BBGumRing:setImage( RegisterImage( "uie_zm_hud_elixirringmeterfg" ) )
	BBGumRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	BBGumRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	BBGumRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	BBGumRing:setShaderVector( 3, 0, 0, 0, 0 )
	BBGumRing:setShaderVector( 4, 0, 0, 0, 0 )
	BBGumRing:subscribeToGlobalModel( f1_arg1, "ZMHud", "bgb_timer", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			BBGumRing:setShaderVector( 0, SubtractVectorComponentFrom( 2, 1, SetVectorComponent( 1, 1, SwapVectorComponents( 1, 2, CoD.GetVectorComponentFromString( f3_local0, 1 ), CoD.GetVectorComponentFromString( f3_local0, 2 ), CoD.GetVectorComponentFromString( f3_local0, 3 ), CoD.GetVectorComponentFromString( f3_local0, 4 ) ) ) ) )
		end
	end )
	self:addElement( BBGumRing )
	self.BBGumRing = BBGumRing
	
	self:mergeStateConditions( {
		{
			stateName = "Low",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueLessThan( f1_arg1, "ZMHud", "bgb_timer", 0.25 )
			end
		}
	} )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = DataSources.ZMHud.getModel( f1_arg1 )
	f1_local4( f1_local3, f1_local5.bgb_timer, function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "bgb_timer"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBRingTimerFactory.__resetProperties = function ( f6_arg0 )
	f6_arg0.BBGumRingLow:completeAnimation()
	f6_arg0.BBGumRing:completeAnimation()
	f6_arg0.BBGumRingLow:setAlpha( 1 )
	f6_arg0.BBGumRing:setAlpha( 1 )
end

CoD.ZmAmmo_BGBRingTimerFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.BBGumRingLow:completeAnimation()
			f7_arg0.BBGumRingLow:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.BBGumRingLow )
		end
	},
	Low = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 2 )
			f8_arg0.BBGumRingLow:completeAnimation()
			f8_arg0.BBGumRingLow:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.BBGumRingLow )
			f8_arg0.BBGumRing:completeAnimation()
			f8_arg0.BBGumRing:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.BBGumRing )
		end
	}
}
CoD.ZmAmmo_BGBRingTimerFactory.__onClose = function ( f9_arg0 )
	f9_arg0.BBGumRingLow:close()
	f9_arg0.BBGumRing:close()
end

