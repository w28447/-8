require( "ui/uieditor/widgets/cac/attachmentloadoutclasslistitem" )
require( "ui/uieditor/widgets/cac/loadoutclassitem" )
require( "ui/uieditor/widgets/cac/loadoutclassitemequipment" )
require( "ui/uieditor/widgets/cac/loadoutclassitemequipmenttaketwo" )
require( "ui/uieditor/widgets/cac/menuchooseclass/categoryheader" )
require( "ui/uieditor/widgets/cac/menuchooseclass/chooseclasslockedoverlay" )
require( "ui/uieditor/widgets/cac/restricteditemwarningtext" )
require( "ui/uieditor/widgets/cac/specialistissueequipmentwidget" )
require( "ui/uieditor/widgets/cac/talentloadoutlistitem" )
require( "ui/uieditor/widgets/cac/wildcardloadoutlistitem" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.ChooseClassWidget = InheritFrom( LUI.UIElement )
CoD.ChooseClassWidget.__defaultWidth = 1920
CoD.ChooseClassWidget.__defaultHeight = 1080
CoD.ChooseClassWidget.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModel( f1_arg1, "WildcardMenuOpen", false )
	CoD.BaseUtility.InitControllerModel( f1_arg1, "CACHasSelection", false )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "CustomClassList.equippedItemsChanged", false )
	self:setClass( CoD.ChooseClassWidget )
	self.id = "ChooseClassWidget"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 0, 146, 566 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local perk1Header = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 335, 460, 1, 1, -497, -481 )
	perk1Header.header:setText( LocalizeToUpperString( 0xCC26359EAAED27A ) )
	perk1Header:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "talent1", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			perk1Header:setModel( f2_local0, f1_arg1 )
		end
	end )
	self:addElement( perk1Header )
	self.perk1Header = perk1Header
	
	local perk2Header = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 455, 580, 1, 1, -497, -481 )
	perk2Header.header:setText( LocalizeToUpperString( 0xCC26259EAAED0C7 ) )
	perk2Header:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "talent2", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			perk2Header:setModel( f3_local0, f1_arg1 )
		end
	end )
	self:addElement( perk2Header )
	self.perk2Header = perk2Header
	
	local perk3Header = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 575, 700, 1, 1, -497, -481 )
	perk3Header.header:setText( LocalizeToUpperString( 0xCC26159EAAECF14 ) )
	perk3Header:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "talent3", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			perk3Header:setModel( f4_local0, f1_arg1 )
		end
	end )
	self:addElement( perk3Header )
	self.perk3Header = perk3Header
	
	local SecondaryAttachmentHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, -184, -59, 1, 1, -287, -271 )
	SecondaryAttachmentHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0x56E6F15BA89EEED ) )
	self:addElement( SecondaryAttachmentHeader )
	self.SecondaryAttachmentHeader = SecondaryAttachmentHeader
	
	local SecondaryOpticsHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, -305, -180, 1, 1, -287, -271 )
	SecondaryOpticsHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0xBB87386985BA15F ) )
	self:addElement( SecondaryOpticsHeader )
	self.SecondaryOpticsHeader = SecondaryOpticsHeader
	
	local wildcardsHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 336.5, 528.5, 1, 1, -287, -271 )
	wildcardsHeader.header:setText( LocalizeToUpperString( 0x8DEB3201AB34D8E ) )
	wildcardsHeader:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "bonuscard1", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			wildcardsHeader:setModel( f5_local0, f1_arg1 )
		end
	end )
	self:addElement( wildcardsHeader )
	self.wildcardsHeader = wildcardsHeader
	
	local EquipmentHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 83, 208, 1, 1, -287, -271 )
	EquipmentHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0x562BD8EE9E11C5B ) )
	EquipmentHeader:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "primarygrenade", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			EquipmentHeader:setModel( f6_local0, f1_arg1 )
		end
	end )
	self:addElement( EquipmentHeader )
	self.EquipmentHeader = EquipmentHeader
	
	local PrimaryAttachmentHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, -563, -438, 1, 1, -287, -271 )
	PrimaryAttachmentHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0x56E6F15BA89EEED ) )
	self:addElement( PrimaryAttachmentHeader )
	self.PrimaryAttachmentHeader = PrimaryAttachmentHeader
	
	local PrimaryOpticsHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, -684, -559, 1, 1, -287, -271 )
	PrimaryOpticsHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0xBB87386985BA15F ) )
	self:addElement( PrimaryOpticsHeader )
	self.PrimaryOpticsHeader = PrimaryOpticsHeader
	
	local GearHeader = CoD.CategoryHeader.new( f1_arg0, f1_arg1, 0.5, 0.5, 83, 208, 1, 1, -497, -481 )
	GearHeader.header:setText( LocalizeToUpperString( 0x305E03714EE77FC ) )
	GearHeader:subscribeToGlobalModel( f1_arg1, "LoadoutBreadcrumbs", "tacticalgear", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			GearHeader:setModel( f7_local0, f1_arg1 )
		end
	end )
	self:addElement( GearHeader )
	self.GearHeader = GearHeader
	
	local tacticalgear = CoD.LoadoutClassItemEquipment.new( f1_arg0, f1_arg1, 0.5, 0.5, 84.5, 297.5, 1, 1, -475, -305 )
	tacticalgear:linkToElementModel( self, "tacticalgear", false, function ( model )
		tacticalgear:setModel( model, f1_arg1 )
	end )
	tacticalgear:linkToElementModel( tacticalgear, "itemIndex", true, function ( model, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	tacticalgear:appendEventHandler( "input_source_changed", function ( f10_arg0, f10_arg1 )
		f10_arg1.menu = f10_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f10_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f10_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	local primary = tacticalgear
	local perkTalents = tacticalgear.subscribeToModel
	local primaryAttachments = Engine.GetModelForController( f1_arg1 )
	perkTalents( primary, primaryAttachments.LastInput, function ( f11_arg0, f11_arg1 )
		CoD.Menu.UpdateButtonShownState( f11_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f11_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	tacticalgear:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f12_local0
	end )
	f1_arg0:AddButtonCallbackFunction( tacticalgear, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		CoD.CACUtility.OpenCACOverlay( self, f13_arg1, f13_arg2, "EquipmentSelect", self, "tacticalgear" )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( tacticalgear, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f15_arg0, f15_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f15_arg2 ) then
			CoD.CACUtility.UnequipItem( f15_arg2, f15_arg1, f15_arg0 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f16_arg0, f16_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f16_arg2 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( tacticalgear, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsMouseOrKeyboard( f17_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f17_arg0, f17_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.UnequipItem( f17_arg2, f17_arg1, f17_arg0 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if IsMouseOrKeyboard( f18_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f18_arg0, f18_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	tacticalgear:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f19_arg0, f19_arg2, "itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
				CoD.CACUtility.UnequipItem( f20_arg2, f20_arg1, f20_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( tacticalgear )
	self.tacticalgear = tacticalgear
	
	perkTalents = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	perkTalents:mergeStateConditions( {
		{
			stateName = "WildcardHighlight",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsControllerModelValueEqualToSelfModelValue( element, f1_arg1, "BonuscardModifiedSlotEnum", "bonuscardModifier" )
			end
		}
	} )
	primaryAttachments = perkTalents
	primary = perkTalents.subscribeToModel
	local wildcards = Engine.GetModelForController( f1_arg1 )
	primary( primaryAttachments, wildcards.BonuscardModifiedSlotEnum, function ( f22_arg0 )
		f1_arg0:updateElementState( perkTalents, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "BonuscardModifiedSlotEnum"
		} )
	end, false )
	perkTalents:linkToElementModel( perkTalents, "bonuscardModifier", true, function ( model )
		f1_arg0:updateElementState( perkTalents, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "bonuscardModifier"
		} )
	end )
	perkTalents:setLeftRight( 0.5, 0.5, 336, 686 )
	perkTalents:setTopBottom( 1, 1, -475, -305 )
	perkTalents:setWidgetType( CoD.TalentLoadoutListItem )
	perkTalents:setHorizontalCount( 3 )
	perkTalents:setVerticalCount( 2 )
	perkTalents:setSpacing( 10 )
	perkTalents:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	perkTalents:linkToElementModel( self, "talents", true, function ( model )
		local f24_local0 = model:get()
		if f24_local0 ~= nil then
			perkTalents:setDataSource( f24_local0 )
		end
	end )
	primaryAttachments = perkTalents
	primary = perkTalents.subscribeToModel
	wildcards = Engine.GetModelForController( f1_arg1 )
	primary( primaryAttachments, wildcards["CustomClassList.equippedItemsChanged"], function ( f25_arg0, f25_arg1 )
		CoD.Menu.UpdateButtonShownState( f25_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	perkTalents:linkToElementModel( perkTalents, "loadoutListItem", true, function ( model, f26_arg1 )
		if perkTalents["__buttonPrompt_loadoutListItem->itemIndex"] then
			perkTalents:removeSubscription( perkTalents["__buttonPrompt_loadoutListItem->itemIndex"] )
			perkTalents["__buttonPrompt_loadoutListItem->itemIndex"] = nil
		end
		if model then
			local f26_local0 = model:get()
			local f26_local1 = model:get()
			model = f26_local0 and f26_local1.itemIndex
		end
		if model then
			perkTalents["__buttonPrompt_loadoutListItem->itemIndex"] = perkTalents:subscribeToModel( model, function ( model )
				CoD.Menu.UpdateButtonShownState( f26_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
				CoD.Menu.UpdateButtonShownState( f26_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
			end )
		end
	end )
	perkTalents:appendEventHandler( "input_source_changed", function ( f28_arg0, f28_arg1 )
		f28_arg1.menu = f28_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f28_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f28_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	primaryAttachments = perkTalents
	primary = perkTalents.subscribeToModel
	wildcards = Engine.GetModelForController( f1_arg1 )
	primary( primaryAttachments, wildcards.LastInput, function ( f29_arg0, f29_arg1 )
		CoD.Menu.UpdateButtonShownState( f29_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f29_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	perkTalents:registerEventHandler( "gain_focus", function ( element, event )
		local f30_local0 = nil
		if element.gainFocus then
			f30_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f30_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f30_local0
	end )
	f1_arg0:AddButtonCallbackFunction( perkTalents, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not CoD.BonuscardUtility.IsRequiredGreedWildcardEquipped( f31_arg1, f31_arg0 ) then
			CoD.CACUtility.OpenWildcardPopup( self, f31_arg0, f31_arg1, f31_arg2, "WildcardSelect", self, "bonuscard", true )
			return true
		else
			CoD.CACUtility.OpenPerkTalentOverlay( self, f31_arg0, f31_arg1, f31_arg2, "PerkTalentSelect", self, "talent" )
			return true
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( perkTalents, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f33_arg0, f33_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f33_arg2 ) then
			CoD.CACUtility.UnequipLoadoutListItem( f33_arg0, f33_arg1, f33_arg2 )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f33_arg0, f33_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f33_arg1, f33_arg0, f33_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f33_arg1, f33_arg0, f33_arg2 )
			return true
		else
			
		end
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f34_arg0, f34_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f34_arg2 ) then
			CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( perkTalents, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		if IsMouseOrKeyboard( f35_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f35_arg0, f35_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.UnequipLoadoutListItem( f35_arg0, f35_arg1, f35_arg2 )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f35_arg0, f35_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f35_arg1, f35_arg0, f35_arg2 )
			return true
		else
			
		end
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		if IsMouseOrKeyboard( f36_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f36_arg0, f36_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	perkTalents:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f37_arg0, f37_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
				CoD.CACUtility.UnequipLoadoutListItem( f38_arg0, f38_arg1, f38_arg2 )
				CoD.CACUtility.UpdateItemListSlotSetupContext( f38_arg0, f38_arg2 )
				CoD.CACUtility.UpdateClassWeaponModel( f38_arg1, f38_arg0, f38_arg2 )
			end
			
		else
			
		end
	end )
	self:addElement( perkTalents )
	self.perkTalents = perkTalents
	
	primary = CoD.LoadoutClassItem.new( f1_arg0, f1_arg1, 0.5, 0.5, -683, -333, 1, 1, -475, -271 )
	primary:linkToElementModel( self, "primary", false, function ( model )
		primary:setModel( model, f1_arg1 )
	end )
	primary:appendEventHandler( "input_source_changed", function ( f40_arg0, f40_arg1 )
		f40_arg1.menu = f40_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f40_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f40_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f40_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f40_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f40_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	wildcards = primary
	primaryAttachments = primary.subscribeToModel
	local secondary = Engine.GetModelForController( f1_arg1 )
	primaryAttachments( wildcards, secondary.LastInput, function ( f41_arg0, f41_arg1 )
		CoD.Menu.UpdateButtonShownState( f41_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f41_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f41_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f41_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f41_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	primary:linkToElementModel( primary, "itemIndex", true, function ( model, f42_arg1 )
		CoD.Menu.UpdateButtonShownState( f42_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f42_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f42_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f42_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	wildcards = primary
	primaryAttachments = primary.subscribeToModel
	secondary = Engine.GetGlobalModel()
	primaryAttachments( wildcards, secondary["lobbyRoot.lobbyNetworkMode"], function ( f43_arg0, f43_arg1 )
		CoD.Menu.UpdateButtonShownState( f43_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f43_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	wildcards = primary
	primaryAttachments = primary.subscribeToModel
	secondary = Engine.GetGlobalModel()
	primaryAttachments( wildcards, secondary["lobbyRoot.lobbyNav"], function ( f44_arg0, f44_arg1 )
		CoD.Menu.UpdateButtonShownState( f44_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f44_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	primary:registerEventHandler( "gain_focus", function ( element, event )
		local f45_local0 = nil
		if element.gainFocus then
			f45_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f45_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f45_local0
	end )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
		if not IsElementPropertyValue( f46_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.OpenCACOverlay( self, f46_arg1, f46_arg2, "WeaponSelectFlyout", self, "primary" )
			return true
		else
			
		end
	end, function ( f47_arg0, f47_arg1, f47_arg2 )
		if not IsElementPropertyValue( f47_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f47_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_remove", function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
		if IsGamepad( f48_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f48_arg0, f48_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f48_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.UnequipItem( f48_arg2, f48_arg1, f48_arg0 )
			return true
		elseif IsMouseOrKeyboard( f48_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f48_arg0, f48_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f48_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.UnequipItem( f48_arg2, f48_arg1, f48_arg0 )
			return true
		else
			
		end
	end, function ( f49_arg0, f49_arg1, f49_arg2 )
		if IsGamepad( f49_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f49_arg0, f49_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f49_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f49_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f49_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f49_arg0, f49_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f49_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f49_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		if IsGamepad( f50_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f50_arg0, f50_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f50_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f50_arg0, f50_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f50_arg1, f50_arg2, self, f50_arg0, "primary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f51_arg0, f51_arg1, f51_arg2 )
		if IsGamepad( f51_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f51_arg0, f51_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f51_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f51_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x94122F68876E5D9, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if IsMouseOrKeyboard( f52_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f52_arg0, f52_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f52_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f52_arg0, f52_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f52_arg1, f52_arg2, self, f52_arg0, "primary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f53_arg0, f53_arg1, f53_arg2 )
		if IsMouseOrKeyboard( f53_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f53_arg0, f53_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f53_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f53_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x94122F68876E5D9, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		if IsGamepad( f54_arg2 ) and not IsLocal() and not IsCustomLobby() and not IsElementPropertyValue( f54_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.SetShowcaseWeapon( f54_arg1, f54_arg2, f54_arg0 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f55_arg0, f55_arg1, f55_arg2 )
		if IsGamepad( f55_arg2 ) and not IsLocal() and not IsCustomLobby() and not IsElementPropertyValue( f55_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f55_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0xE629850E7968A6E, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primary, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_contextual_2", function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		if IsMouseOrKeyboard( f56_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f56_arg0, f56_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f56_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.SetShowcaseWeapon( f56_arg1, f56_arg2, f56_arg0 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f57_arg0, f57_arg1, f57_arg2 )
		if IsMouseOrKeyboard( f57_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f57_arg0, f57_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f57_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f57_arg1, Enum.LUIButton[0x4D2505E19049444], 0x2BA0F750E758177, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	primary:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f58_arg0, f58_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f58_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
				CoD.CACUtility.UnequipItem( f59_arg2, f59_arg1, f59_arg0 )
			end
			
		else
			
		end
	end )
	primary:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f60_arg0, f60_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f60_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
				CoD.CraftUtility.SetupPaintjobPersonalization( self, f61_arg0, f61_arg2 )
				CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f61_arg1, f61_arg2, self, f61_arg0, "primary" )
			end
			
		else
			
		end
	end )
	primary:AddContextualMenuAction( f1_arg0, f1_arg1, 0xE092C2BE5DD4778, function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
		if not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f62_arg0, f62_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f62_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
				CoD.CACUtility.SetShowcaseWeapon( f63_arg1, f63_arg2, f63_arg0 )
				PlaySoundAlias( "cac_overload_select" )
			end
			
		else
			
		end
	end )
	self:addElement( primary )
	self.primary = primary
	
	primaryAttachments = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	primaryAttachments:mergeStateConditions( {
		{
			stateName = "WildcardHighlight",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsControllerModelValueEqualToSelfModelValue( element, f1_arg1, "BonuscardModifiedSlotEnum", "bonuscardModifier" ) and CoD.BonuscardUtility.IsNextAvailableAttachmentSlotForGunfighter( menu, element )
			end
		}
	} )
	secondary = primaryAttachments
	wildcards = primaryAttachments.subscribeToModel
	local secondaryAttachments = Engine.GetModelForController( f1_arg1 )
	wildcards( secondary, secondaryAttachments.BonuscardModifiedSlotEnum, function ( f65_arg0 )
		f1_arg0:updateElementState( primaryAttachments, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f65_arg0:get(),
			modelName = "BonuscardModifiedSlotEnum"
		} )
	end, false )
	primaryAttachments:linkToElementModel( primaryAttachments, "bonuscardModifier", true, function ( model )
		f1_arg0:updateElementState( primaryAttachments, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "bonuscardModifier"
		} )
	end )
	primaryAttachments:setLeftRight( 0.5, 0.5, -683, -333 )
	primaryAttachments:setTopBottom( 1, 1, -265, -95 )
	primaryAttachments:setWidgetType( CoD.AttachmentLoadoutClassListItem )
	primaryAttachments:setHorizontalCount( 3 )
	primaryAttachments:setVerticalCount( 2 )
	primaryAttachments:setSpacing( 10 )
	primaryAttachments:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	primaryAttachments:linkToElementModel( self, "primaryattachments", true, function ( model )
		local f67_local0 = model:get()
		if f67_local0 ~= nil then
			primaryAttachments:setDataSource( f67_local0 )
		end
	end )
	primaryAttachments:linkToElementModel( primaryAttachments, "itemIndex", true, function ( model, f68_arg1 )
		CoD.Menu.UpdateButtonShownState( f68_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f68_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f68_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	primaryAttachments:appendEventHandler( "input_source_changed", function ( f69_arg0, f69_arg1 )
		f69_arg1.menu = f69_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f69_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f69_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f69_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	secondary = primaryAttachments
	wildcards = primaryAttachments.subscribeToModel
	secondaryAttachments = Engine.GetModelForController( f1_arg1 )
	wildcards( secondary, secondaryAttachments.LastInput, function ( f70_arg0, f70_arg1 )
		CoD.Menu.UpdateButtonShownState( f70_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f70_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f70_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	primaryAttachments:linkToElementModel( primaryAttachments, "loadoutListItem", true, function ( model, f71_arg1 )
		if primaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] then
			primaryAttachments:removeSubscription( primaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] )
			primaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] = nil
		end
		if model then
			local f71_local0 = model:get()
			local f71_local1 = model:get()
			model = f71_local0 and f71_local1.itemIndex
		end
		if model then
			primaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] = primaryAttachments:subscribeToModel( model, function ( model )
				CoD.Menu.UpdateButtonShownState( f71_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
			end )
		end
	end )
	primaryAttachments:linkToElementModel( primaryAttachments, "attachmentSlotIndex", true, function ( model, f73_arg1 )
		CoD.Menu.UpdateButtonShownState( f73_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f73_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	primaryAttachments:registerEventHandler( "gain_focus", function ( element, event )
		local f74_local0 = nil
		if element.gainFocus then
			f74_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f74_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		return f74_local0
	end )
	f1_arg0:AddButtonCallbackFunction( primaryAttachments, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
		if IsListElementChildInState( f75_arg0, "AttachmentSlot", "WildcardNeeded" ) then
			CoD.CACUtility.OpenWildcardPopup( self, f75_arg0, f75_arg1, f75_arg2, "WildcardSelect", self, "bonuscard", true )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f75_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.HasChildElement( f75_arg0, "AttachmentSlot" ) and not IsListElementChildInState( f75_arg0, "AttachmentSlot", "WildcardNotAvailable" ) then
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f75_arg0, f75_arg1, f75_arg2, "WeaponAttachmentSelect", self, "primary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f76_arg0, f76_arg1, f76_arg2 )
		if IsListElementChildInState( f76_arg0, "AttachmentSlot", "WildcardNeeded" ) then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f76_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.HasChildElement( f76_arg0, "AttachmentSlot" ) and not IsListElementChildInState( f76_arg0, "AttachmentSlot", "WildcardNotAvailable" ) then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primaryAttachments, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_remove", function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
		if IsGamepad( f77_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f77_arg0, f77_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.RemoveAttachmentFromClass( f77_arg0, f77_arg1, f77_arg2, "primary" )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f77_arg0, f77_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f77_arg1, f77_arg0, f77_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f77_arg1, f77_arg0, f77_arg2 )
			return true
		elseif IsMouseOrKeyboard( f77_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f77_arg0, f77_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.RemoveAttachmentFromClass( f77_arg0, f77_arg1, f77_arg2, "primary" )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f77_arg0, f77_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f77_arg1, f77_arg0, f77_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f77_arg1, f77_arg0, f77_arg2 )
			return true
		else
			
		end
	end, function ( f78_arg0, f78_arg1, f78_arg2 )
		if IsGamepad( f78_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f78_arg0, f78_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f78_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f78_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f78_arg0, f78_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f78_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primaryAttachments, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
		if IsGamepad( f79_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f79_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f79_arg0, f79_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f79_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f79_arg1, f79_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f79_arg0, f79_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f79_arg0, f79_arg1, f79_arg2, "ReticleSelect", self, "primary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f80_arg0, f80_arg1, f80_arg2 )
		if IsGamepad( f80_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f80_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f80_arg0, f80_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f80_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f80_arg1, f80_arg0 ) then
			CoD.Menu.SetButtonLabel( f80_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x94122F68876E5D9, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( primaryAttachments, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3 )
		if IsMouseOrKeyboard( f81_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f81_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f81_arg0, f81_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f81_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f81_arg1, f81_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f81_arg0, f81_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f81_arg0, f81_arg1, f81_arg2, "ReticleSelect", self, "primary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f82_arg0, f82_arg1, f82_arg2 )
		if IsMouseOrKeyboard( f82_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f82_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f82_arg0, f82_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f82_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f82_arg1, f82_arg0 ) then
			CoD.Menu.SetButtonLabel( f82_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x94122F68876E5D9, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	primaryAttachments:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f83_arg0, f83_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f84_arg0, f84_arg1, f84_arg2, f84_arg3 )
				CoD.CACUtility.RemoveAttachmentFromClass( f84_arg0, f84_arg1, f84_arg2, "primary" )
				CoD.CACUtility.UpdateItemListSlotSetupContext( f84_arg0, f84_arg2 )
				CoD.CACUtility.UpdateClassWeaponModel( f84_arg1, f84_arg0, f84_arg2 )
			end
			
		else
			
		end
	end )
	primaryAttachments:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f85_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f85_arg0, f85_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f85_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f85_arg1, f85_arg0 ) then
			return function ( f86_arg0, f86_arg1, f86_arg2, f86_arg3 )
				CoD.CraftUtility.SetUpOpticPersonalization( f86_arg0, f86_arg2 )
				CoD.CACUtility.OpenCACAttachmentOverlay( self, f86_arg0, f86_arg1, f86_arg2, "ReticleSelect", self, "primary" )
				PlaySoundAlias( "cac_open_wpn_cust" )
			end
			
		else
			
		end
	end )
	self:addElement( primaryAttachments )
	self.primaryAttachments = primaryAttachments
	
	wildcards = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	wildcards:setLeftRight( 0.5, 0.5, 336, 686 )
	wildcards:setTopBottom( 1, 1, -265, -97 )
	wildcards:setWidgetType( CoD.WildcardLoadoutListItem )
	wildcards:setHorizontalCount( 3 )
	wildcards:setSpacing( 10 )
	wildcards:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	wildcards:linkToElementModel( self, "bonuscards", true, function ( model )
		local f87_local0 = model:get()
		if f87_local0 ~= nil then
			wildcards:setDataSource( f87_local0 )
		end
	end )
	wildcards:linkToElementModel( wildcards, "loadoutListItem", true, function ( model, f88_arg1 )
		if wildcards["__buttonPrompt_loadoutListItem->itemIndex"] then
			wildcards:removeSubscription( wildcards["__buttonPrompt_loadoutListItem->itemIndex"] )
			wildcards["__buttonPrompt_loadoutListItem->itemIndex"] = nil
		end
		if model then
			local f88_local0 = model:get()
			local f88_local1 = model:get()
			model = f88_local0 and f88_local1.itemIndex
		end
		if model then
			wildcards["__buttonPrompt_loadoutListItem->itemIndex"] = wildcards:subscribeToModel( model, function ( model )
				CoD.Menu.UpdateButtonShownState( f88_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
				CoD.Menu.UpdateButtonShownState( f88_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
			end )
		end
	end )
	wildcards:appendEventHandler( "input_source_changed", function ( f90_arg0, f90_arg1 )
		f90_arg1.menu = f90_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f90_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f90_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end )
	secondaryAttachments = wildcards
	secondary = wildcards.subscribeToModel
	local TempSelectedImage = Engine.GetModelForController( f1_arg1 )
	secondary( secondaryAttachments, TempSelectedImage.LastInput, function ( f91_arg0, f91_arg1 )
		CoD.Menu.UpdateButtonShownState( f91_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f91_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	wildcards:registerEventHandler( "gain_focus", function ( element, event )
		local f92_local0 = nil
		if element.gainFocus then
			f92_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f92_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		return f92_local0
	end )
	f1_arg0:AddButtonCallbackFunction( wildcards, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3 )
		CoD.CACUtility.OpenWildcardPopup( self, f93_arg0, f93_arg1, f93_arg2, "WildcardSelect", self, "bonuscard", false )
		return true
	end, function ( f94_arg0, f94_arg1, f94_arg2 )
		CoD.Menu.SetButtonLabel( f94_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( wildcards, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f95_arg0, f95_arg1, f95_arg2, f95_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f95_arg0, f95_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f95_arg2 ) then
			CoD.CACUtility.UnequipLoadoutListItem( f95_arg0, f95_arg1, f95_arg2 )
			CoD.CACUtility.EquippedItemsChanged( f95_arg1, f95_arg2 )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f95_arg0, f95_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f95_arg1, f95_arg0, f95_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f95_arg1, f95_arg0, f95_arg2 )
			return true
		else
			
		end
	end, function ( f96_arg0, f96_arg1, f96_arg2 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f96_arg0, f96_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f96_arg2 ) then
			CoD.Menu.SetButtonLabel( f96_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( wildcards, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f97_arg0, f97_arg1, f97_arg2, f97_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f97_arg0, f97_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsMouseOrKeyboard( f97_arg2 ) then
			CoD.CACUtility.UnequipLoadoutListItem( f97_arg0, f97_arg1, f97_arg2 )
			CoD.CACUtility.EquippedItemsChanged( f97_arg1, f97_arg2 )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f97_arg0, f97_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f97_arg1, f97_arg0, f97_arg2 )
			return true
		else
			
		end
	end, function ( f98_arg0, f98_arg1, f98_arg2 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f98_arg0, f98_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) and IsMouseOrKeyboard( f98_arg2 ) then
			CoD.Menu.SetButtonLabel( f98_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	wildcards:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f99_arg0, f99_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3 )
				CoD.CACUtility.UnequipLoadoutListItem( f100_arg0, f100_arg1, f100_arg2 )
				CoD.CACUtility.EquippedItemsChanged( f100_arg1, f100_arg2 )
				CoD.CACUtility.UpdateItemListSlotSetupContext( f100_arg0, f100_arg2 )
				CoD.CACUtility.UpdateClassWeaponModel( f100_arg1, f100_arg0, f100_arg2 )
			end
			
		else
			
		end
	end )
	self:addElement( wildcards )
	self.wildcards = wildcards
	
	secondary = CoD.LoadoutClassItem.new( f1_arg0, f1_arg1, 0.5, 0.5, -304, 46, 1, 1, -475, -271 )
	secondary.PrimaryHeader.header:setText( Engine[0xF9F1239CFD921FE]( 0x73F876131FB1D9D ) )
	secondary:linkToElementModel( self, "secondary", false, function ( model )
		secondary:setModel( model, f1_arg1 )
	end )
	secondary:linkToElementModel( secondary, "itemIndex", true, function ( model, f102_arg1 )
		CoD.Menu.UpdateButtonShownState( f102_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f102_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f102_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f102_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	secondary:appendEventHandler( "input_source_changed", function ( f103_arg0, f103_arg1 )
		f103_arg1.menu = f103_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f103_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f103_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f103_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f103_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f103_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	TempSelectedImage = secondary
	secondaryAttachments = secondary.subscribeToModel
	local primarygrenade = Engine.GetModelForController( f1_arg1 )
	secondaryAttachments( TempSelectedImage, primarygrenade.LastInput, function ( f104_arg0, f104_arg1 )
		CoD.Menu.UpdateButtonShownState( f104_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f104_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f104_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f104_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f104_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	TempSelectedImage = secondary
	secondaryAttachments = secondary.subscribeToModel
	primarygrenade = Engine.GetGlobalModel()
	secondaryAttachments( TempSelectedImage, primarygrenade["lobbyRoot.lobbyNetworkMode"], function ( f105_arg0, f105_arg1 )
		CoD.Menu.UpdateButtonShownState( f105_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f105_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	TempSelectedImage = secondary
	secondaryAttachments = secondary.subscribeToModel
	primarygrenade = Engine.GetGlobalModel()
	secondaryAttachments( TempSelectedImage, primarygrenade["lobbyRoot.lobbyNav"], function ( f106_arg0, f106_arg1 )
		CoD.Menu.UpdateButtonShownState( f106_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f106_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	secondary:registerEventHandler( "gain_focus", function ( element, event )
		local f107_local0 = nil
		if element.gainFocus then
			f107_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f107_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f107_local0
	end )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f108_arg0, f108_arg1, f108_arg2, f108_arg3 )
		if not IsElementPropertyValue( f108_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.OpenCACOverlay( self, f108_arg1, f108_arg2, "WeaponSelectFlyout", self, "secondary" )
			return true
		else
			
		end
	end, function ( f109_arg0, f109_arg1, f109_arg2 )
		if not IsElementPropertyValue( f109_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f109_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f110_arg0, f110_arg1, f110_arg2, f110_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f110_arg0, f110_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f110_arg2 ) and not IsElementPropertyValue( f110_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f110_arg0, f110_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f110_arg1, f110_arg2, self, f110_arg0, "secondary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f111_arg0, f111_arg1, f111_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f111_arg0, f111_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f111_arg2 ) and not IsElementPropertyValue( f111_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f111_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x94122F68876E5D9, nil, "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_remove", function ( f112_arg0, f112_arg1, f112_arg2, f112_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f112_arg0, f112_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f112_arg2 ) and not IsElementPropertyValue( f112_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.UnequipItem( f112_arg2, f112_arg1, f112_arg0 )
			return true
		elseif IsMouseOrKeyboard( f112_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f112_arg0, f112_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f112_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.UnequipItem( f112_arg2, f112_arg1, f112_arg0 )
			return true
		else
			
		end
	end, function ( f113_arg0, f113_arg1, f113_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f113_arg0, f113_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsGamepad( f113_arg2 ) and not IsElementPropertyValue( f113_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f113_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f113_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f113_arg0, f113_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f113_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f113_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( f114_arg0, f114_arg1, f114_arg2, f114_arg3 )
		if IsGamepad( f114_arg2 ) and not IsLocal() and not IsCustomLobby() and not IsElementPropertyValue( f114_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.SetShowcaseWeapon( f114_arg1, f114_arg2, f114_arg0 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f115_arg0, f115_arg1, f115_arg2 )
		if IsGamepad( f115_arg2 ) and not IsLocal() and not IsCustomLobby() and not IsElementPropertyValue( f115_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f115_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0xE629850E7968A6E, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f116_arg0, f116_arg1, f116_arg2, f116_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f116_arg0, f116_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsMouseOrKeyboard( f116_arg2 ) and not IsElementPropertyValue( f116_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CraftUtility.SetupPaintjobPersonalization( self, f116_arg0, f116_arg2 )
			CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f116_arg1, f116_arg2, self, f116_arg0, "secondary" )
			return true
		else
			
		end
	end, function ( f117_arg0, f117_arg1, f117_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f117_arg0, f117_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and IsMouseOrKeyboard( f117_arg2 ) and not IsElementPropertyValue( f117_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f117_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x94122F68876E5D9, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondary, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_contextual_2", function ( f118_arg0, f118_arg1, f118_arg2, f118_arg3 )
		if IsMouseOrKeyboard( f118_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f118_arg0, f118_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f118_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.CACUtility.SetShowcaseWeapon( f118_arg1, f118_arg2, f118_arg0 )
			PlaySoundAlias( "cac_overload_select" )
			return true
		else
			
		end
	end, function ( f119_arg0, f119_arg1, f119_arg2 )
		if IsMouseOrKeyboard( f119_arg2 ) and not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f119_arg0, f119_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f119_arg0, "__hasFocusOnVariantWidget", true ) then
			CoD.Menu.SetButtonLabel( f119_arg1, Enum.LUIButton[0x4D2505E19049444], 0x2BA0F750E758177, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_2" )
			return true
		else
			return false
		end
	end, false )
	secondary:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f120_arg0, f120_arg1, f120_arg2, f120_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f120_arg0, f120_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f120_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
				CoD.CACUtility.UnequipItem( f121_arg2, f121_arg1, f121_arg0 )
			end
			
		else
			
		end
	end )
	secondary:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f122_arg0, f122_arg1, f122_arg2, f122_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( f122_arg0, f122_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f122_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f123_arg0, f123_arg1, f123_arg2, f123_arg3 )
				CoD.CraftUtility.SetupPaintjobPersonalization( self, f123_arg0, f123_arg2 )
				CoD.CACUtility.OpenWeaponPersonalizationOverlay( self, f123_arg1, f123_arg2, self, f123_arg0, "secondary" )
			end
			
		else
			
		end
	end )
	secondary:AddContextualMenuAction( f1_arg0, f1_arg1, 0xE092C2BE5DD4778, function ( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
		if not IsLocal() and not IsCustomLobby() and not CoD.ModelUtility.IsSelfModelValueEqualTo( f124_arg0, f124_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and not IsElementPropertyValue( f124_arg0, "__hasFocusOnVariantWidget", true ) then
			return function ( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
				CoD.CACUtility.SetShowcaseWeapon( f125_arg1, f125_arg2, f125_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( secondary )
	self.secondary = secondary
	
	secondaryAttachments = LUI.UIList.new( f1_arg0, f1_arg1, 10, 0, nil, false, false, false, false )
	secondaryAttachments:mergeStateConditions( {
		{
			stateName = "WildcardHighlight",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsControllerModelValueEqualToSelfModelValue( element, f1_arg1, "BonuscardModifiedSlotEnum", "bonuscardModifier" ) and CoD.BonuscardUtility.IsNextAvailableAttachmentSlotForGunfighter( menu, element )
			end
		}
	} )
	primarygrenade = secondaryAttachments
	TempSelectedImage = secondaryAttachments.subscribeToModel
	local SpecialistEquipmentWidget = Engine.GetModelForController( f1_arg1 )
	TempSelectedImage( primarygrenade, SpecialistEquipmentWidget.BonuscardModifiedSlotEnum, function ( f127_arg0 )
		f1_arg0:updateElementState( secondaryAttachments, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f127_arg0:get(),
			modelName = "BonuscardModifiedSlotEnum"
		} )
	end, false )
	secondaryAttachments:linkToElementModel( secondaryAttachments, "bonuscardModifier", true, function ( model )
		f1_arg0:updateElementState( secondaryAttachments, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "bonuscardModifier"
		} )
	end )
	secondaryAttachments:setLeftRight( 0.5, 0.5, -304.5, 45.5 )
	secondaryAttachments:setTopBottom( 1, 1, -265, -95 )
	secondaryAttachments:setWidgetType( CoD.AttachmentLoadoutClassListItem )
	secondaryAttachments:setHorizontalCount( 3 )
	secondaryAttachments:setVerticalCount( 2 )
	secondaryAttachments:setSpacing( 10 )
	secondaryAttachments:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	secondaryAttachments:linkToElementModel( self, "secondaryattachments", true, function ( model )
		local f129_local0 = model:get()
		if f129_local0 ~= nil then
			secondaryAttachments:setDataSource( f129_local0 )
		end
	end )
	secondaryAttachments:linkToElementModel( secondaryAttachments, "itemIndex", true, function ( model, f130_arg1 )
		CoD.Menu.UpdateButtonShownState( f130_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f130_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f130_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	secondaryAttachments:appendEventHandler( "input_source_changed", function ( f131_arg0, f131_arg1 )
		f131_arg1.menu = f131_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f131_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f131_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f131_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	primarygrenade = secondaryAttachments
	TempSelectedImage = secondaryAttachments.subscribeToModel
	SpecialistEquipmentWidget = Engine.GetModelForController( f1_arg1 )
	TempSelectedImage( primarygrenade, SpecialistEquipmentWidget.LastInput, function ( f132_arg0, f132_arg1 )
		CoD.Menu.UpdateButtonShownState( f132_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f132_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f132_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	secondaryAttachments:linkToElementModel( secondaryAttachments, "loadoutListItem", true, function ( model, f133_arg1 )
		if secondaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] then
			secondaryAttachments:removeSubscription( secondaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] )
			secondaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] = nil
		end
		if model then
			local f133_local0 = model:get()
			local f133_local1 = model:get()
			model = f133_local0 and f133_local1.itemIndex
		end
		if model then
			secondaryAttachments["__buttonPrompt_loadoutListItem->itemIndex"] = secondaryAttachments:subscribeToModel( model, function ( model )
				CoD.Menu.UpdateButtonShownState( f133_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
			end )
		end
	end )
	secondaryAttachments:linkToElementModel( secondaryAttachments, "attachmentSlotIndex", true, function ( model, f135_arg1 )
		CoD.Menu.UpdateButtonShownState( f135_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f135_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	secondaryAttachments:registerEventHandler( "gain_focus", function ( element, event )
		local f136_local0 = nil
		if element.gainFocus then
			f136_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f136_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		return f136_local0
	end )
	f1_arg0:AddButtonCallbackFunction( secondaryAttachments, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3 )
		if IsListElementChildInState( f137_arg0, "AttachmentSlot", "WildcardNeeded" ) then
			CoD.CACUtility.OpenWildcardPopup( self, f137_arg0, f137_arg1, f137_arg2, "WildcardSelect", self, "bonuscard", true )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f137_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.HasChildElement( f137_arg0, "AttachmentSlot" ) and not IsListElementChildInState( f137_arg0, "AttachmentSlot", "WildcardNotAvailable" ) then
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f137_arg0, f137_arg1, f137_arg2, "WeaponAttachmentSelect", self, "secondary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f138_arg0, f138_arg1, f138_arg2 )
		if IsListElementChildInState( f138_arg0, "AttachmentSlot", "WildcardNeeded" ) then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f138_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.BaseUtility.HasChildElement( f138_arg0, "AttachmentSlot" ) and not IsListElementChildInState( f138_arg0, "AttachmentSlot", "WildcardNotAvailable" ) then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondaryAttachments, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_remove", function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3 )
		if IsGamepad( f139_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f139_arg0, f139_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.RemoveAttachmentFromClass( f139_arg0, f139_arg1, f139_arg2, "secondary" )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f139_arg0, f139_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f139_arg1, f139_arg0, f139_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f139_arg1, f139_arg0, f139_arg2 )
			return true
		elseif IsMouseOrKeyboard( f139_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f139_arg0, f139_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.CACUtility.RemoveAttachmentFromClass( f139_arg0, f139_arg1, f139_arg2, "secondary" )
			CoD.CACUtility.UpdateItemListSlotSetupContext( f139_arg0, f139_arg2 )
			CoD.CACUtility.UpdateButtonPromptStatesForListSlots( f139_arg1, f139_arg0, f139_arg2 )
			CoD.CACUtility.UpdateClassWeaponModel( f139_arg1, f139_arg0, f139_arg2 )
			return true
		else
			
		end
	end, function ( f140_arg0, f140_arg1, f140_arg2 )
		if IsGamepad( f140_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f140_arg0, f140_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f140_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f140_arg2 ) and not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f140_arg0, f140_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			CoD.Menu.SetButtonLabel( f140_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondaryAttachments, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3 )
		if IsGamepad( f141_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f141_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f141_arg0, f141_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f141_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f141_arg1, f141_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f141_arg0, f141_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f141_arg0, f141_arg1, f141_arg2, "ReticleSelect", self, "secondary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f142_arg0, f142_arg1, f142_arg2 )
		if IsGamepad( f142_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f142_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f142_arg0, f142_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f142_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f142_arg1, f142_arg0 ) then
			CoD.Menu.SetButtonLabel( f142_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x94122F68876E5D9, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( secondaryAttachments, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f143_arg0, f143_arg1, f143_arg2, f143_arg3 )
		if IsMouseOrKeyboard( f143_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f143_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f143_arg0, f143_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f143_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f143_arg1, f143_arg0 ) then
			CoD.CraftUtility.SetUpOpticPersonalization( f143_arg0, f143_arg2 )
			CoD.CACUtility.OpenCACAttachmentOverlay( self, f143_arg0, f143_arg1, f143_arg2, "ReticleSelect", self, "secondary" )
			PlaySoundAlias( "cac_open_wpn_cust" )
			return true
		else
			
		end
	end, function ( f144_arg0, f144_arg1, f144_arg2 )
		if IsMouseOrKeyboard( f144_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( self.secondary, f144_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f144_arg0, f144_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and IsListElementChildInState( f144_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f144_arg1, f144_arg0 ) then
			CoD.Menu.SetButtonLabel( f144_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x94122F68876E5D9, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	secondaryAttachments:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3 )
		if not CoD.ModelUtility.IsSelfModelPathValueEqualTo( f145_arg0, f145_arg2, "loadoutListItem->itemIndex", CoDShared.EmptyItemIndex ) then
			return function ( f146_arg0, f146_arg1, f146_arg2, f146_arg3 )
				CoD.CACUtility.RemoveAttachmentFromClass( f146_arg0, f146_arg1, f146_arg2, "secondary" )
				CoD.CACUtility.UpdateItemListSlotSetupContext( f146_arg0, f146_arg2 )
				CoD.CACUtility.UpdateClassWeaponModel( f146_arg1, f146_arg0, f146_arg2 )
			end
			
		else
			
		end
	end )
	secondaryAttachments:AddContextualMenuAction( f1_arg0, f1_arg1, 0xAFF37175F950D17, function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualTo( self.primary, f147_arg2, "itemIndex", CoDShared.EmptyItemIndex ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f147_arg0, f147_arg2, "attachmentSlotIndex", CoD.CACUtility.OpticSlotIndex ) and CoD.CACUtility.IsAttachmentWithCustomReticle( f147_arg1, f147_arg0 ) and IsListElementChildInState( f147_arg0, "AttachmentSlot", "DefaultStateHiddenName" ) then
			return function ( f148_arg0, f148_arg1, f148_arg2, f148_arg3 )
				CoD.CraftUtility.SetUpOpticPersonalization( f148_arg0, f148_arg2 )
				CoD.CACUtility.OpenCACAttachmentOverlay( self, f148_arg0, f148_arg1, f148_arg2, "ReticleSelect", self, "secondary" )
				PlaySoundAlias( "cac_open_wpn_cust" )
			end
			
		else
			
		end
	end )
	self:addElement( secondaryAttachments )
	self.secondaryAttachments = secondaryAttachments
	
	TempSelectedImage = LUI.UIFixedAspectRatioImage.new( 0.5, 0.5, -256, 256, 1, 1, -968, -456 )
	TempSelectedImage:setZoom( 40 )
	TempSelectedImage:setScale( 0.8, 0.8 )
	TempSelectedImage:linkToElementModel( self, "tempLargeImageForModel", true, function ( model )
		local f149_local0 = model:get()
		if f149_local0 ~= nil then
			TempSelectedImage:setImage( CoD.BaseUtility.AlreadyRegistered( f149_local0 ) )
		end
	end )
	self:addElement( TempSelectedImage )
	self.TempSelectedImage = TempSelectedImage
	
	primarygrenade = CoD.LoadoutClassItemEquipmentTakeTwo.new( f1_arg0, f1_arg1, 0.5, 0.5, 84.5, 297.5, 1, 1, -265, -95 )
	primarygrenade:linkToElementModel( self, nil, false, function ( model )
		primarygrenade:setModel( model, f1_arg1 )
	end )
	self:addElement( primarygrenade )
	self.primarygrenade = primarygrenade
	
	SpecialistEquipmentWidget = CoD.SpecialistIssueEquipmentWidget.new( f1_arg0, f1_arg1, 0.5, 0.5, -200, 200, 1, 1, -912, -512 )
	SpecialistEquipmentWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "showSpecialistEquipmentWidgetModel" )
			end
		}
	} )
	SpecialistEquipmentWidget:linkToElementModel( SpecialistEquipmentWidget, "showSpecialistEquipmentWidgetModel", true, function ( model )
		f1_arg0:updateElementState( SpecialistEquipmentWidget, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "showSpecialistEquipmentWidgetModel"
		} )
	end )
	SpecialistEquipmentWidget:linkToElementModel( self, nil, false, function ( model )
		SpecialistEquipmentWidget:setModel( model, f1_arg1 )
	end )
	self:addElement( SpecialistEquipmentWidget )
	self.SpecialistEquipmentWidget = SpecialistEquipmentWidget
	
	local ChooseClassLockedOverlay = CoD.ChooseClassLockedOverlay.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 1, 1, -1080, 0 )
	ChooseClassLockedOverlay:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.CACUtility.IsCurrentClassLocked( menu, f1_arg1 )
			end
		}
	} )
	ChooseClassLockedOverlay:linkToElementModel( ChooseClassLockedOverlay, nil, true, function ( model )
		f1_arg0:updateElementState( ChooseClassLockedOverlay, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = nil
		} )
	end )
	ChooseClassLockedOverlay:linkToElementModel( self, nil, false, function ( model )
		ChooseClassLockedOverlay:setModel( model, f1_arg1 )
	end )
	self:addElement( ChooseClassLockedOverlay )
	self.ChooseClassLockedOverlay = ChooseClassLockedOverlay
	
	local RestrictedText = CoD.RestrictedItemWarningText.new( f1_arg0, f1_arg1, 0.5, 0.5, -247, 247, 0.5, 0.5, -15, 15 )
	RestrictedText:linkToElementModel( self, nil, false, function ( model )
		RestrictedText:setModel( model, f1_arg1 )
	end )
	self:addElement( RestrictedText )
	self.RestrictedText = RestrictedText
	
	self:mergeStateConditions( {
		{
			stateName = "CompactText",
			condition = function ( menu, element, event )
				return not IsCurrentLanguageEnglish()
			end
		},
		{
			stateName = "TempInGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	tacticalgear.id = "tacticalgear"
	perkTalents.id = "perkTalents"
	primary.id = "primary"
	primaryAttachments.id = "primaryAttachments"
	wildcards.id = "wildcards"
	secondary.id = "secondary"
	secondaryAttachments.id = "secondaryAttachments"
	primarygrenade.id = "primarygrenade"
	if CoD.isPC then
		ChooseClassLockedOverlay.id = "ChooseClassLockedOverlay"
	end
	self.__defaultFocus = primary
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local24 = self
	CoD.BreadcrumbUtility.UpdateLoadoutBreadcrumbs( f1_arg0, f1_arg1 )
	CoD.BreadcrumbUtility.UpdateWeaponOpticBreadcrumbs( f1_arg0, f1_arg1 )
	f1_local24 = tacticalgear
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "name", "", "" )
	end
	f1_local24 = perkTalents
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "loadoutListItem->name", "", "" )
	end
	f1_local24 = primary
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "name", "", "" )
	end
	f1_local24 = primaryAttachments
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "loadoutListItem->name", "", "" )
	end
	f1_local24 = wildcards
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "loadoutListItem->name", "", "" )
	end
	f1_local24 = secondary
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "name", "", "" )
	end
	f1_local24 = secondaryAttachments
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local24, f1_arg1, "loadoutListItem->name", "", "" )
	end
	return self
end

CoD.ChooseClassWidget.__resetProperties = function ( f160_arg0 )
	f160_arg0.perk1Header:completeAnimation()
	f160_arg0.perk2Header:completeAnimation()
	f160_arg0.perk3Header:completeAnimation()
	f160_arg0.perk1Header:setScale( 1, 1 )
	f160_arg0.perk2Header:setScale( 1, 1 )
	f160_arg0.perk3Header:setScale( 1, 1 )
end

CoD.ChooseClassWidget.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f161_arg0, f161_arg1 )
			f161_arg0:__resetProperties()
			f161_arg0:setupElementClipCounter( 0 )
		end
	},
	CompactText = {
		DefaultClip = function ( f162_arg0, f162_arg1 )
			f162_arg0:__resetProperties()
			f162_arg0:setupElementClipCounter( 3 )
			f162_arg0.perk1Header:completeAnimation()
			f162_arg0.perk1Header:setScale( 0.9, 1 )
			f162_arg0.clipFinished( f162_arg0.perk1Header )
			f162_arg0.perk2Header:completeAnimation()
			f162_arg0.perk2Header:setScale( 0.9, 1 )
			f162_arg0.clipFinished( f162_arg0.perk2Header )
			f162_arg0.perk3Header:completeAnimation()
			f162_arg0.perk3Header:setScale( 0.9, 1 )
			f162_arg0.clipFinished( f162_arg0.perk3Header )
		end
	},
	TempInGame = {
		DefaultClip = function ( f163_arg0, f163_arg1 )
			f163_arg0:__resetProperties()
			f163_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.ChooseClassWidget.__onClose = function ( f164_arg0 )
	f164_arg0.XCamMouseControl:close()
	f164_arg0.perk1Header:close()
	f164_arg0.perk2Header:close()
	f164_arg0.perk3Header:close()
	f164_arg0.SecondaryAttachmentHeader:close()
	f164_arg0.SecondaryOpticsHeader:close()
	f164_arg0.wildcardsHeader:close()
	f164_arg0.EquipmentHeader:close()
	f164_arg0.PrimaryAttachmentHeader:close()
	f164_arg0.PrimaryOpticsHeader:close()
	f164_arg0.GearHeader:close()
	f164_arg0.tacticalgear:close()
	f164_arg0.perkTalents:close()
	f164_arg0.primary:close()
	f164_arg0.primaryAttachments:close()
	f164_arg0.wildcards:close()
	f164_arg0.secondary:close()
	f164_arg0.secondaryAttachments:close()
	f164_arg0.TempSelectedImage:close()
	f164_arg0.primarygrenade:close()
	f164_arg0.SpecialistEquipmentWidget:close()
	f164_arg0.ChooseClassLockedOverlay:close()
	f164_arg0.RestrictedText:close()
end

