require( "ui/uieditor/widgets/zmhudwidgets/zmequipmentitemcounter" )

CoD.ZMPerkVaporItemChargeCountListWidget = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporItemChargeCountListWidget.__defaultWidth = 36
CoD.ZMPerkVaporItemChargeCountListWidget.__defaultHeight = 24
CoD.ZMPerkVaporItemChargeCountListWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporItemChargeCountListWidget )
	self.id = "ZMPerkVaporItemChargeCountListWidget"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZMEquipmentItemCounter = CoD.ZMEquipmentItemCounter.new( f1_arg0, f1_arg1, 0, 0, 0, 36, 0, 0, 0, 24 )
	ZMEquipmentItemCounter:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	ZMEquipmentItemCounter:linkToElementModel( self, "chargeCount", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ZMEquipmentItemCounter.Quantity:setText( CoD.BaseUtility.AlreadyLocalized( f3_local0 ) )
		end
	end )
	self:addElement( ZMEquipmentItemCounter )
	self.ZMEquipmentItemCounter = ZMEquipmentItemCounter
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ZMPerkUtility.IsPerkSpecificItem( element, f1_arg1, "perk_widows_wine" )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporItemChargeCountListWidget.__resetProperties = function ( f6_arg0 )
	f6_arg0.ZMEquipmentItemCounter:completeAnimation()
	f6_arg0.ZMEquipmentItemCounter:setAlpha( 1 )
end

CoD.ZMPerkVaporItemChargeCountListWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.ZMEquipmentItemCounter:completeAnimation()
			f7_arg0.ZMEquipmentItemCounter:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.ZMEquipmentItemCounter )
		end
	},
	Visible = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			f8_arg0.ZMEquipmentItemCounter:completeAnimation()
			f8_arg0.ZMEquipmentItemCounter:setAlpha( 1 )
			f8_arg0.clipFinished( f8_arg0.ZMEquipmentItemCounter )
		end
	}
}
CoD.ZMPerkVaporItemChargeCountListWidget.__onClose = function ( f9_arg0 )
	f9_arg0.ZMEquipmentItemCounter:close()
end

