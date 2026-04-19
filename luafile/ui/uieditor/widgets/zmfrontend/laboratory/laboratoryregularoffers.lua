require( "ui/uieditor/menus/zm/purchaseplasma" )
require( "ui/uieditor/widgets/zmfrontend/laboratory/laboratorylistitem" )
require( "ui/uieditor/widgets/zmfrontend/laboratory/laboratoryoffersheader" )

CoD.LaboratoryRegularOffers = InheritFrom( LUI.UIElement )
CoD.LaboratoryRegularOffers.__defaultWidth = 480
CoD.LaboratoryRegularOffers.__defaultHeight = 350
CoD.LaboratoryRegularOffers.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.LaboratoryRegularOffers )
	self.id = "LaboratoryRegularOffers"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local LaboratoryOffersHeader = CoD.LaboratoryOffersHeader.new( f1_arg0, f1_arg1, 0, 0, -30, 510, 0, 0, -20, 23 )
	LaboratoryOffersHeader.Divider.R:setScale( 1, 1 )
	LaboratoryOffersHeader.Divider.L:setScale( 1, 1 )
	self:addElement( LaboratoryOffersHeader )
	self.LaboratoryOffersHeader = LaboratoryOffersHeader
	
	local RegularOffers = LUI.UIList.new( f1_arg0, f1_arg1, 16, 0, nil, false, false, false, false )
	RegularOffers:setLeftRight( 0, 0, 0, 482 )
	RegularOffers:setTopBottom( 0, 0, 62.5, 212.5 )
	RegularOffers:setWidgetType( CoD.LaboratoryListItem )
	RegularOffers:setHorizontalCount( 3 )
	RegularOffers:setSpacing( 16 )
	RegularOffers:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	RegularOffers:setFilter( function ( f2_arg0 )
		return f2_arg0.specialOffer:get() == false
	end )
	RegularOffers:setDataSource( "ZMLaboratoryNPItemList" )
	local f1_local3 = RegularOffers
	local TextBox = RegularOffers.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	TextBox( f1_local3, f1_local5["Laboratory.animState"], function ( f3_arg0, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	f1_local3 = RegularOffers
	TextBox = RegularOffers.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	TextBox( f1_local3, f1_local5["Laboratory.disableInput"], function ( f4_arg0, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RegularOffers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		CoD.ZMLaboratoryUtility.ClientScriptNotifyFocusChanged( self, element, f1_arg1, f1_arg0 )
		return f5_local0
	end )
	RegularOffers:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f6_local0
	end )
	f1_arg0:AddButtonCallbackFunction( RegularOffers, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if CoD.ModelUtility.IsModelValueEqualToEnum( f7_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and CoD.ZMLaboratoryUtility.CanPurchase( f7_arg2, f7_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f7_arg2, "Laboratory.disableInput", 0 ) then
			ProcessListAction( self, f7_arg0, f7_arg2, f7_arg1 )
			CoD.ZMLaboratoryUtility.CacheOfferButtonModel( f7_arg2, f7_arg0, f7_arg1 )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualToEnum( f7_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and not CoD.ZMLaboratoryUtility.CanPurchase( f7_arg2, f7_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f7_arg2, "Laboratory.disableInput", 0 ) and IsBooleanDvarSet( "laboratory_codpoints_enabled" ) then
			CoD.ZMLaboratoryUtility.CacheOfferButtonModel( f7_arg2, f7_arg0, f7_arg1 )
			OpenPopup( self, "PurchasePlasma", f7_arg2, f7_arg0:getModel() )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualToEnum( f7_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and not CoD.ZMLaboratoryUtility.CanPurchase( f7_arg2, f7_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f7_arg2, "Laboratory.disableInput", 0 ) then
			CoD.ZMLaboratoryUtility.CacheOfferButtonModel( f7_arg2, f7_arg0, f7_arg1 )
			local f7_local0 = OpenSystemOverlay
			local f7_local1 = self
			local f7_local2 = f7_arg1
			local f7_local3 = f7_arg2
			local f7_local4 = "NotEnoughNPPopup"
			local f7_local5 = {}
			local f7_local6 = f7_arg0:getModel()
			f7_local5.npRequired = f7_local6.plasmaPrice:get()
			f7_local0( f7_local1, f7_local2, f7_local3, f7_local4, f7_local5 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if CoD.ModelUtility.IsModelValueEqualToEnum( f8_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and CoD.ZMLaboratoryUtility.CanPurchase( f8_arg2, f8_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f8_arg2, "Laboratory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualToEnum( f8_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and not CoD.ZMLaboratoryUtility.CanPurchase( f8_arg2, f8_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f8_arg2, "Laboratory.disableInput", 0 ) and IsBooleanDvarSet( "laboratory_codpoints_enabled" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualToEnum( f8_arg2, "Laboratory.animState", CoD.ZMLaboratoryUtility.LabAnimState.NOT_PLAYING ) and not CoD.ZMLaboratoryUtility.CanPurchase( f8_arg2, f8_arg0 ) and CoD.ModelUtility.IsModelValueEqualTo( f8_arg2, "Laboratory.disableInput", 0 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( RegularOffers )
	self.RegularOffers = RegularOffers
	
	TextBox = LUI.UIText.new( 0, 0, -26, 510, 0, 0, -15.5, 21.5 )
	TextBox:setRGB( 0.58, 0.85, 1 )
	TextBox:setText( LocalizeToUpperString( "zmui/concoctions" ) )
	TextBox:setTTF( "skorzhen" )
	TextBox:setLetterSpacing( 3 )
	TextBox:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TextBox:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	RegularOffers.id = "RegularOffers"
	self.__defaultFocus = RegularOffers
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.LaboratoryRegularOffers.__resetProperties = function ( f10_arg0 )
	f10_arg0.RegularOffers:completeAnimation()
	f10_arg0.RegularOffers:setAlpha( 1 )
end

CoD.LaboratoryRegularOffers.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.RegularOffers:completeAnimation()
			f12_arg0.RegularOffers:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.RegularOffers )
		end
	}
}
CoD.LaboratoryRegularOffers.__onClose = function ( f13_arg0 )
	f13_arg0.LaboratoryOffersHeader:close()
	f13_arg0.RegularOffers:close()
end

