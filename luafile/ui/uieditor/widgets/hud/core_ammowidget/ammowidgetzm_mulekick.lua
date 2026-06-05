CoD.AmmoWidgetZM_MuleKick = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_MuleKick.__defaultWidth = 40
CoD.AmmoWidgetZM_MuleKick.__defaultHeight = 40
CoD.AmmoWidgetZM_MuleKick.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_MuleKick )
	self.id = "AmmoWidgetZM_MuleKick"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Icon = LUI.UIImage.new( 0, 0, 0, 40, 0, 0, 0, 40 )
	Icon:setImage( RegisterImage( 0xA00B1CACA4A428B ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "hudItems.perks.additional_primary_weapon", 0 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["hudItems.perks.additional_primary_weapon"], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "hudItems.perks.additional_primary_weapon"
		} )
	end, false )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_MuleKick.__resetProperties = function ( f4_arg0 )
	f4_arg0.Icon:completeAnimation()
	f4_arg0.Icon:setAlpha( 1 )
end

CoD.AmmoWidgetZM_MuleKick.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.Icon:completeAnimation()
			f5_arg0.Icon:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.Icon )
		end
	},
	Visible = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end
	}
}
