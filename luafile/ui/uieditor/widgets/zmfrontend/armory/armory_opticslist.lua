require( "ui/uieditor/widgets/zmfrontend/armory/armory_attachmentpip" )
require( "ui/uieditor/widgets/zmfrontend/armory/armory_attachmentslotcontainer" )

CoD.Armory_OpticsList = InheritFrom( LUI.UIElement )
CoD.Armory_OpticsList.__defaultWidth = 500
CoD.Armory_OpticsList.__defaultHeight = 300
CoD.Armory_OpticsList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Armory_OpticsList )
	self.id = "Armory_OpticsList"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackGradientBG = LUI.UIImage.new( 0, 1, 5, -5, 0, 1, 35, 31 )
	BlackGradientBG:setRGB( 0, 0, 0 )
	BlackGradientBG:setAlpha( 0.3 )
	BlackGradientBG:setZRot( 180 )
	BlackGradientBG:setZoom( 10 )
	BlackGradientBG:setImage( RegisterImage( 0x78A6742E3F9A2ED ) )
	self:addElement( BlackGradientBG )
	self.BlackGradientBG = BlackGradientBG
	
	local TopLine = LUI.UIImage.new( 0, 1, 1, -1, 0, 0, 31, 49 )
	TopLine:setAlpha( 0.5 )
	TopLine:setZoom( 10 )
	TopLine:setImage( RegisterImage( "uie_ui_menu_cac_primary_button_top_line" ) )
	TopLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopLine )
	self.TopLine = TopLine
	
	local OpticsHeader = LUI.UIText.new( 0.5, 0.5, -192.5, 192.5, 0, 0, -8, 10 )
	OpticsHeader:setRGB( 0.39, 0.39, 0.39 )
	OpticsHeader:setText( Engine[0xF9F1239CFD921FE]( 0xBB87386985BA15F ) )
	OpticsHeader:setTTF( "ttmussels_demibold" )
	OpticsHeader:setLetterSpacing( 4 )
	OpticsHeader:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	OpticsHeader:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( OpticsHeader )
	self.OpticsHeader = OpticsHeader
	
	local Optics = LUI.UIList.new( f1_arg0, f1_arg1, 15, 0, nil, false, false, false, false )
	Optics:setLeftRight( 0.5, 0.5, -237, 237 )
	Optics:setTopBottom( 0, 0, 42, 281 )
	Optics:setZoom( 13 )
	Optics:setWidgetType( CoD.Armory_AttachmentSlotContainer )
	Optics:setHorizontalCount( 3 )
	Optics:setVerticalCount( 2 )
	Optics:setSpacing( 15 )
	Optics:setBalanceGridRows( true )
	Optics:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Optics:setFilter( function ( f2_arg0 )
		return f2_arg0.attachmentGroup:get() == Enum[0x7420BCDBDE17A84][0x6AC43DB9B6634DA]
	end )
	Optics:setDataSource( "ArmoryWeaponAttachments" )
	Optics:linkToElementModel( Optics, "itemIndex", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	local f1_local5 = Optics
	local OpticAttachmentPip = Optics.subscribeToModel
	local f1_local7 = Engine.GetModelForController( f1_arg1 )
	OpticAttachmentPip( f1_local5, f1_local7.armoryAttachmentUpdated, function ( f4_arg0, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	Optics:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	f1_local5 = Optics
	OpticAttachmentPip = Optics.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	OpticAttachmentPip( f1_local5, f1_local7.LastInput, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	Optics:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		CoD.ZMLoadoutUtility.UpdateArmoryAttachmentModel( f1_arg0, element, f1_arg1, true )
		CoD.ZMLoadoutUtility.UpdateAttachmentListModelForWeaponAttributes( f1_arg0, self.Optics, f1_arg1 )
		return f7_local0
	end )
	Optics:registerEventHandler( "gain_list_focus", function ( element, event )
		return nil
	end )
	Optics:registerEventHandler( "lose_list_focus", function ( element, event )
		local f9_local0 = nil
		CoD.ZMLoadoutUtility.UpdateArmoryAttachmentModel( f1_arg0, element, f1_arg1, false )
		CoD.WeaponAttachmentsUtility.ResetActiveListItemForList( element, f1_arg1 )
		CoD.ZMLoadoutUtility.ResetAttachmentListModelForWeaponAttributes( f1_arg0, f1_arg0, f1_arg1 )
		return f9_local0
	end )
	Optics:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		return f10_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Optics, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if not IsListElementChildInState( f11_arg0, "AttachmentSlot", "NotAvailable" ) and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f11_arg0, f11_arg2, f11_arg1 ) and not CoD.ZMLoadoutUtility.IsArmoryAnyOpticAttachmentEquipped( f11_arg2, f11_arg1 ) then
			CoD.ZMLoadoutUtility.EquipArmoryElementAttachment( f11_arg0, f11_arg2, f11_arg1 )
			PlaySoundAlias( "uin_cac_attach_base" )
			return true
		elseif IsPC() and not IsListElementChildInState( f11_arg0, "AttachmentSlot", "NotAvailable" ) and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f11_arg0, f11_arg2, f11_arg1 ) then
			CoD.ZMLoadoutUtility.ToggleArmoryElementAttachment( f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif IsPC() and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f11_arg1, f11_arg0, f11_arg2 ) and not IsListElementChildInState( f11_arg0, "AttachmentSlot", "NotAvailable" ) then
			CoD.ZMLoadoutUtility.ForceEquipArmoryOpticElementAttachment( f11_arg0, f11_arg2, f11_arg1 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if not IsListElementChildInState( f12_arg0, "AttachmentSlot", "NotAvailable" ) and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f12_arg0, f12_arg2, f12_arg1 ) and not CoD.ZMLoadoutUtility.IsArmoryAnyOpticAttachmentEquipped( f12_arg2, f12_arg1 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif IsPC() and not IsListElementChildInState( f12_arg0, "AttachmentSlot", "NotAvailable" ) and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f12_arg0, f12_arg2, f12_arg1 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif IsPC() and not CoD.ZMLoadoutUtility.IsArmoryAttachmentItemLocked( f12_arg1, f12_arg0, f12_arg2 ) and not IsListElementChildInState( f12_arg0, "AttachmentSlot", "NotAvailable" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( Optics, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsGamepad( f13_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f13_arg0, f13_arg2, f13_arg1 ) then
			CoD.ZMLoadoutUtility.RemoveArmoryElementAttachment( f13_arg0, f13_arg2, f13_arg1 )
			PlaySoundAlias( "uin_cac_attach_remove" )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsGamepad( f14_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f14_arg0, f14_arg2, f14_arg1 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( Optics, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "ui_remove", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsMouseOrKeyboard( f15_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f15_arg0, f15_arg2, f15_arg1 ) then
			CoD.ZMLoadoutUtility.RemoveArmoryElementAttachment( f15_arg0, f15_arg2, f15_arg1 )
			PlaySoundAlias( "uin_cac_attach_remove" )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if IsMouseOrKeyboard( f16_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f16_arg0, f16_arg2, f16_arg1 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "ui_remove" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( Optics, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsGamepad( f17_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f17_arg0, f17_arg2, f17_arg1 ) and not IsListElementChildInState( f17_arg0, "AttachmentSlot", "NotAvailable" ) and IsBooleanDvarSet( "tu12_zmEnableReticleCustomization" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f17_arg1, f17_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f17_arg0, f17_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f17_arg0, f17_arg1, f17_arg2, "ReticleSelect", f17_arg0, "primary" )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if IsGamepad( f18_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f18_arg0, f18_arg2, f18_arg1 ) and not IsListElementChildInState( f18_arg0, "AttachmentSlot", "NotAvailable" ) and IsBooleanDvarSet( "tu12_zmEnableReticleCustomization" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f18_arg1, f18_arg0 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0xAFF37175F950D17, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( Optics, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsMouseOrKeyboard( f19_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f19_arg0, f19_arg2, f19_arg1 ) and not IsListElementChildInState( f19_arg0, "AttachmentSlot", "NotAvailable" ) and IsBooleanDvarSet( "tu12_zmEnableReticleCustomization" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f19_arg1, f19_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f19_arg0, f19_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f19_arg0, f19_arg1, f19_arg2, "ReticleSelect", f19_arg0, "primary" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if IsMouseOrKeyboard( f20_arg2 ) and CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f20_arg0, f20_arg2, f20_arg1 ) and not IsListElementChildInState( f20_arg0, "AttachmentSlot", "NotAvailable" ) and IsBooleanDvarSet( "tu12_zmEnableReticleCustomization" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f20_arg1, f20_arg0 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xAFF37175F950D17, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	Optics:subscribeToGlobalModel( f1_arg1, "PerController", "LastInput", function ( model )
		local f21_local0 = Optics
		if not IsMouse( f1_arg1 ) and AlwaysFalse() then
			CoD.ZMLoadoutUtility.UpdateArmoryAttachmentModel( f1_arg0, f21_local0, f1_arg1, true )
		end
	end )
	Optics:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f22_arg0, f22_arg2, f22_arg1 ) then
			return function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
				CoD.ZMLoadoutUtility.RemoveArmoryElementAttachment( f23_arg0, f23_arg2, f23_arg1 )
				PlaySoundAlias( "uin_cac_attach_remove" )
			end
			
		else
			
		end
	end )
	Optics:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if CoD.ZMLoadoutUtility.IsArmoryElementAttachmentEquipped( f24_arg0, f24_arg2, f24_arg1 ) and not IsListElementChildInState( f24_arg0, "AttachmentSlot", "NotAvailable" ) and IsBooleanDvarSet( "tu12_zmEnableReticleCustomization" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f24_arg1, f24_arg0 ) then
			return function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
				CoD.CraftUtility.SetUpOpticPersonalization( f25_arg0, f25_arg2 )
				CoD.CACUtility.OpenCACAttachmentOverlay( self, f25_arg0, f25_arg1, f25_arg2, "ReticleSelect", f25_arg0, "primary" )
			end
			
		else
			
		end
	end )
	self:addElement( Optics )
	self.Optics = Optics
	
	OpticAttachmentPip = CoD.Armory_AttachmentPip.new( f1_arg0, f1_arg1, 0.5, 0.5, -6, 6, 0, 0, 25, 37 )
	OpticAttachmentPip:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return not CoD.ZMLoadoutUtility.IsArmoryAnyOpticAttachmentEquipped( f1_arg1, menu )
			end
		}
	} )
	OpticAttachmentPip:linkToElementModel( OpticAttachmentPip, "itemIndex", true, function ( model )
		f1_arg0:updateElementState( OpticAttachmentPip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "itemIndex"
		} )
	end )
	f1_local7 = OpticAttachmentPip
	f1_local5 = OpticAttachmentPip.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local7, f1_local8.armoryAttachmentUpdated, function ( f30_arg0 )
		f1_arg0:updateElementState( OpticAttachmentPip, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f30_arg0:get(),
			modelName = "armoryAttachmentUpdated"
		} )
	end, false )
	self:addElement( OpticAttachmentPip )
	self.OpticAttachmentPip = OpticAttachmentPip
	
	self.__on_menuOpened_self = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		local f31_local0 = self
		ScaleToElementWidth( self, self.Optics, 30 )
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_self )
	Optics.id = "Optics"
	self.__defaultFocus = Optics
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local5 = self
	f1_local5 = Optics
	if IsPC() then
		SetElementProperty( f1_local5, "_isOptic", true )
		CoD.WeaponAttachmentsUtility.UpdateHorizontalCount( f1_arg0, f1_local5, f1_arg1 )
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local5, f1_arg1, "name", "", "" )
	else
		SetElementProperty( f1_local5, "_isOptic", true )
		CoD.WeaponAttachmentsUtility.UpdateHorizontalCount( f1_arg0, f1_local5, f1_arg1 )
	end
	return self
end

CoD.Armory_OpticsList.__onClose = function ( f33_arg0 )
	f33_arg0.__on_close_removeOverrides()
	f33_arg0.Optics:close()
	f33_arg0.OpticAttachmentPip:close()
end

