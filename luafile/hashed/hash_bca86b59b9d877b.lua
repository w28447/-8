CoD.ZM_SelfReviveCounter = InheritFrom( LUI.UIElement )
CoD.ZM_SelfReviveCounter.__defaultWidth = 85
CoD.ZM_SelfReviveCounter.__defaultHeight = 45
CoD.ZM_SelfReviveCounter.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "ZMInventoryPersonal.self_revive_count", 0 )
	self:setClass( CoD.ZM_SelfReviveCounter )
	self.id = "ZM_SelfReviveCounter"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Backer = LUI.UIImage.new( 0, 0, 13, 77, 0, 0, -9.5, 54.5 )
	Backer:setImage( RegisterImage( "uie_zm_hud_revive_backer" ) )
	self:addElement( Backer )
	self.Backer = Backer
	
	local HealthIcon = LUI.UIImage.new( 0, 0, 0, 45, 0, 0, 0, 45 )
	HealthIcon:setAlpha( 0 )
	HealthIcon:setImage( RegisterImage( 0x77AEC1394EC7604 ) )
	self:addElement( HealthIcon )
	self.HealthIcon = HealthIcon
	
	local ReviveCount = LUI.UIText.new( 0, 0, 25, 65, 0, 0, 8, 42 )
	ReviveCount:setTTF( "skorzhen" )
	ReviveCount:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	ReviveCount:setShaderVector( 0, 0.4, 0, 0, 0 )
	ReviveCount:setShaderVector( 1, 0.1, 0, 0, 0 )
	ReviveCount:setShaderVector( 2, 0, 0, 0, 0.8 )
	ReviveCount:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ReviveCount:subscribeToGlobalModel( f1_arg1, "ZMInventoryPersonal", "self_revive_count", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ReviveCount:setText( f2_local0 )
		end
	end )
	self:addElement( ReviveCount )
	self.ReviveCount = ReviveCount
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "ZMInventoryPersonal.self_revive_count", 0 )
			end
		}
	} )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["ZMInventoryPersonal.self_revive_count"], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "ZMInventoryPersonal.self_revive_count"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZM_SelfReviveCounter.__resetProperties = function ( f5_arg0 )
	f5_arg0.HealthIcon:completeAnimation()
	f5_arg0.ReviveCount:completeAnimation()
	f5_arg0.Backer:completeAnimation()
	f5_arg0.HealthIcon:setAlpha( 0 )
	f5_arg0.ReviveCount:setAlpha( 1 )
	f5_arg0.Backer:setAlpha( 1 )
end

CoD.ZM_SelfReviveCounter.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 3 )
			f6_arg0.Backer:completeAnimation()
			f6_arg0.Backer:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.Backer )
			f6_arg0.HealthIcon:completeAnimation()
			f6_arg0.HealthIcon:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.HealthIcon )
			f6_arg0.ReviveCount:completeAnimation()
			f6_arg0.ReviveCount:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.ReviveCount )
		end
	},
	Visible = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.ZM_SelfReviveCounter.__onClose = function ( f8_arg0 )
	f8_arg0.ReviveCount:close()
end

