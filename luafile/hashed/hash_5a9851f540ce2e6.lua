require( "x64:857aae823214ba2" )
require( "x64:7139dde30490cc8" )
require( "x64:76b99ac28573661" )
require( "x64:be457f86919afa5" )

CoD.ZMPerkVaporItem = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporItem.__defaultWidth = 70
CoD.ZMPerkVaporItem.__defaultHeight = 98
CoD.ZMPerkVaporItem.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporItem )
	self.id = "ZMPerkVaporItem"
	self.soundSet = "none"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local VaporIcon = CoD.ZMPerkVaporIcon.new( f1_arg0, f1_arg1, 0, 0, 10, 60, 0, 0, 23.5, 73.5 )
	VaporIcon:setScale( 0.8, 0.8 )
	VaporIcon:linkToElementModel( self, nil, false, function ( model )
		VaporIcon:setModel( model, f1_arg1 )
	end )
	self:addElement( VaporIcon )
	self.VaporIcon = VaporIcon
	
	local ModifierFrame = CoD.ZMPerkVaporModifierFrame.new( f1_arg0, f1_arg1, 0, 0, -1, 71, 0, 0, 13, 85 )
	ModifierFrame:linkToElementModel( self, nil, false, function ( model )
		ModifierFrame:setModel( model, f1_arg1 )
	end )
	self:addElement( ModifierFrame )
	self.ModifierFrame = ModifierFrame
	
	local AltarName = LUI.UIText.new( 0.5, 1.5, -35, -35, 0, 0, 7, 24 )
	AltarName:setTTF( "skorzhen" )
	AltarName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	AltarName:setShaderVector( 0, 0, 0, 0, 0 )
	AltarName:setShaderVector( 1, 0, 0, 0, 1 )
	AltarName:setLetterSpacing( 2 )
	AltarName:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	AltarName:linkToElementModel( self, "altarName", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			AltarName:setText( Engine[0xF9F1239CFD921FE]( f4_local0 ) )
		end
	end )
	self:addElement( AltarName )
	self.AltarName = AltarName
	
	local Charges = CoD.ZMPerkVaporItemChargeCountListWidget.new( f1_arg0, f1_arg1, 0, 0, 39, 75, 0, 0, 50.5, 74.5 )
	Charges:linkToElementModel( self, nil, false, function ( model )
		Charges:setModel( model, f1_arg1 )
	end )
	self:addElement( Charges )
	self.Charges = Charges
	
	local DeadshotCharges = CoD.ZMPerkVaporDeadshotCountList.new( f1_arg0, f1_arg1, 0, 0, 14, 56, 0, 0, 26, 70 )
	DeadshotCharges:linkToElementModel( self, nil, false, function ( model )
		DeadshotCharges:setModel( model, f1_arg1 )
	end )
	self:addElement( DeadshotCharges )
	self.DeadshotCharges = DeadshotCharges
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.HIDDEN )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.DEFAULT )
			end
		},
		{
			stateName = "Consumed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.CONSUMED )
			end
		},
		{
			stateName = "CoolingDown",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.COOLING_DOWN )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	self:linkToElementModel( self, "state", true, function ( model )
		local f12_local0 = self
		ForceNotifyControllerModel( f1_arg1, "PerkVaporStateUpdated" )
	end )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		local f13_local0 = self
		ForceNotifyControllerModel( f1_arg1, "PerkVaporStateUpdated" )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporItem.__resetProperties = function ( f14_arg0 )
	f14_arg0.AltarName:completeAnimation()
	f14_arg0.VaporIcon:completeAnimation()
	f14_arg0.ModifierFrame:completeAnimation()
	f14_arg0.DeadshotCharges:completeAnimation()
	f14_arg0.Charges:completeAnimation()
	f14_arg0.AltarName:setLeftRight( 0.5, 1.5, -35, -35 )
	f14_arg0.AltarName:setTopBottom( 0, 0, 7, 24 )
	f14_arg0.AltarName:setRGB( 1, 1, 1 )
	f14_arg0.AltarName:setAlpha( 1 )
	f14_arg0.VaporIcon:setAlpha( 1 )
	f14_arg0.ModifierFrame:setAlpha( 1 )
	f14_arg0.DeadshotCharges:setAlpha( 1 )
	f14_arg0.Charges:setAlpha( 1 )
end

CoD.ZMPerkVaporItem.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 5 )
			f15_arg0.VaporIcon:completeAnimation()
			f15_arg0.VaporIcon:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.VaporIcon )
			f15_arg0.ModifierFrame:completeAnimation()
			f15_arg0.ModifierFrame:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ModifierFrame )
			f15_arg0.AltarName:completeAnimation()
			f15_arg0.AltarName:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.AltarName )
			f15_arg0.Charges:completeAnimation()
			f15_arg0.Charges:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.Charges )
			f15_arg0.DeadshotCharges:completeAnimation()
			f15_arg0.DeadshotCharges:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.DeadshotCharges )
		end
	},
	Hidden = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 5 )
			f16_arg0.VaporIcon:completeAnimation()
			f16_arg0.VaporIcon:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.VaporIcon )
			f16_arg0.ModifierFrame:completeAnimation()
			f16_arg0.ModifierFrame:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.ModifierFrame )
			f16_arg0.AltarName:completeAnimation()
			f16_arg0.AltarName:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.AltarName )
			f16_arg0.Charges:completeAnimation()
			f16_arg0.Charges:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.Charges )
			f16_arg0.DeadshotCharges:completeAnimation()
			f16_arg0.DeadshotCharges:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.DeadshotCharges )
		end
	},
	Available = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 4 )
			f17_arg0.VaporIcon:completeAnimation()
			f17_arg0.VaporIcon:setAlpha( 1 )
			f17_arg0.clipFinished( f17_arg0.VaporIcon )
			f17_arg0.AltarName:completeAnimation()
			f17_arg0.AltarName:setLeftRight( 0.5, 1.5, -35, -35 )
			f17_arg0.AltarName:setTopBottom( 0, 0, 7, 24 )
			f17_arg0.AltarName:setRGB( 0.45, 0.45, 0.45 )
			f17_arg0.clipFinished( f17_arg0.AltarName )
			f17_arg0.Charges:completeAnimation()
			f17_arg0.Charges:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.Charges )
			f17_arg0.DeadshotCharges:completeAnimation()
			f17_arg0.DeadshotCharges:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.DeadshotCharges )
		end
	},
	Consumed = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 3 )
			f18_arg0.VaporIcon:completeAnimation()
			f18_arg0.VaporIcon:setAlpha( 1 )
			f18_arg0.clipFinished( f18_arg0.VaporIcon )
			f18_arg0.AltarName:completeAnimation()
			f18_arg0.AltarName:setRGB( 1, 1, 1 )
			f18_arg0.clipFinished( f18_arg0.AltarName )
			f18_arg0.DeadshotCharges:completeAnimation()
			f18_arg0.DeadshotCharges:setAlpha( 1 )
			f18_arg0.clipFinished( f18_arg0.DeadshotCharges )
		end
	},
	CoolingDown = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 3 )
			f19_arg0.VaporIcon:completeAnimation()
			f19_arg0.VaporIcon:setAlpha( 1 )
			f19_arg0.clipFinished( f19_arg0.VaporIcon )
			f19_arg0.AltarName:completeAnimation()
			f19_arg0.AltarName:setRGB( 1, 1, 1 )
			f19_arg0.clipFinished( f19_arg0.AltarName )
			f19_arg0.DeadshotCharges:completeAnimation()
			f19_arg0.DeadshotCharges:setAlpha( 1 )
			f19_arg0.clipFinished( f19_arg0.DeadshotCharges )
		end
	}
}
CoD.ZMPerkVaporItem.__onClose = function ( f20_arg0 )
	f20_arg0.VaporIcon:close()
	f20_arg0.ModifierFrame:close()
	f20_arg0.AltarName:close()
	f20_arg0.Charges:close()
	f20_arg0.DeadshotCharges:close()
end

