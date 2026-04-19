require( "x64:3c489c2e8f56ee9" )
require( "x64:b083cf2b5832e0" )
require( "x64:971953d269ced4e" )
require( "x64:bf776923c7291f4" )

CoD.PC_MultiItemPickup = InheritFrom( LUI.UIElement )
CoD.PC_MultiItemPickup.__defaultWidth = 877
CoD.PC_MultiItemPickup.__defaultHeight = 585
CoD.PC_MultiItemPickup.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PC_MultiItemPickup )
	self.id = "PC_MultiItemPickup"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ItemPickupList = LUI.UIList.new( f1_arg0, f1_arg1, 11, 100, nil, false, false, false, false )
	ItemPickupList:setLeftRight( 0.5, 0.5, -438.5, 438.5 )
	ItemPickupList:setTopBottom( 0, 0, 40.5, 584.5 )
	ItemPickupList:setWidgetType( CoD.MultiItemPickupWaypointItemKBM )
	ItemPickupList:setHorizontalCount( 8 )
	ItemPickupList:setVerticalCount( 5 )
	ItemPickupList:setSpacing( 11 )
	ItemPickupList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ItemPickupList:setVerticalScrollbar( CoD.PC_MultiItemPickup_Scrollbar )
	ItemPickupList:setBackingWidget( CoD.PC_MultiItemPickupBacking )
	ItemPickupList:setBackingWidgetXPadding( 5 )
	ItemPickupList:setBackingWidgetYPadding( 5 )
	ItemPickupList:setDataSource( "MultiItemPickup" )
	ItemPickupList:appendEventHandler( "input_source_changed", function ( f2_arg0, f2_arg1 )
		f2_arg1.menu = f2_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	local HeaderStash = ItemPickupList
	local StashLine = ItemPickupList.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	StashLine( HeaderStash, f1_local4.LastInput, function ( f3_arg0, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	ItemPickupList:linkToElementModel( ItemPickupList, "id", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	HeaderStash = ItemPickupList
	StashLine = ItemPickupList.subscribeToModel
	f1_local4 = DataSources.HUDItems.getModel( f1_arg1 )
	StashLine( HeaderStash, f1_local4.weapon3dHintState, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	HeaderStash = ItemPickupList
	StashLine = ItemPickupList.subscribeToModel
	f1_local4 = DataSources.WarzoneInventory.getModel( f1_arg1 )
	StashLine( HeaderStash, f1_local4.canTransferFromStash, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	HeaderStash = ItemPickupList
	StashLine = ItemPickupList.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	StashLine( HeaderStash, f1_local4["hudItems.inventory.filledSlots"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	ItemPickupList:linkToElementModel( ItemPickupList, "itemtype", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	ItemPickupList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f9_local0 = nil
		if IsMouseOrKeyboard( f1_arg1 ) then
			CoD.HUDUtility.SetAsCurrentMultiItemPickup( f1_arg1, element )
			CoD.WZUtility.SendInventoryItemFocusNotify( f1_arg1, element )
			CoD.WZUtility.UpdateWZInventoryTooltipOnElementPC( f1_arg1, element )
			CoD.HUDUtility.UpdateFocusStashModel( self, f1_arg1, true )
		end
		return f9_local0
	end )
	ItemPickupList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f10_local0 = nil
		if IsMouseOrKeyboard( f1_arg1 ) then
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f1_arg1 )
			CoD.HUDUtility.UpdateFocusStashModel( self, f1_arg1, false )
		end
		return f10_local0
	end )
	ItemPickupList:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( ItemPickupList, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MOUSE1", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsMouseOrKeyboard( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f12_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			return true
		elseif IsMouseOrKeyboard( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f12_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.AMMO_FULL ) then
			return true
		elseif IsMouseOrKeyboard( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f12_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.EQUIPS ) then
			CoD.WZUtility.SendInventoryPickUpNotify( f12_arg2, f12_arg0 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f12_arg2 )
			return true
		elseif IsMouseOrKeyboard( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f12_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.SWAPS ) then
			CoD.WZUtility.SendInventoryPickUpNotify( f12_arg2, f12_arg0 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f12_arg2 )
			return true
		elseif IsMouseOrKeyboard( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f12_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			CoD.WZUtility.SendInventoryPickUpNotify( f12_arg2, f12_arg0 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f13_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MOUSE1" )
			return false
		elseif IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f13_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.AMMO_FULL ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "MOUSE1" )
			return false
		elseif IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f13_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.EQUIPS ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x38B775D97E72F0C, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		elseif IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f13_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.SWAPS ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x25F8C30A0958A7B, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		elseif IsMouseOrKeyboard( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f13_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x339E923E692AD5E, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( ItemPickupList, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "MOUSE3", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f14_arg2, "WarzoneInventory", "canTransferFromStash" ) then
			CoD.WZUtility.SendInventoryPickUpStowedWeaponNotify( f14_arg2, f14_arg0 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f14_arg2 )
			return true
		elseif IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f14_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.ALSO_ALLOW_WEAPON_ATTACHMENT_SWAP ) then
			CoD.WZUtility.SendInventoryAttachmentPickUpNotify( f14_arg2 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f14_arg2 )
			return true
		elseif IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.HUDUtility.ShowTriangleAttachmentPickupPrompt( f14_arg2 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f14_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			CoD.WZUtility.SendInventoryAttachmentPickUpNotify( f14_arg2 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f14_arg2 )
			return true
		elseif IsMouseOrKeyboard( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.HUDUtility.ShowTriangleAttachmentPickupPrompt( f14_arg2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f14_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.SWAPS ) and not CoD.WZUtility.InventoryItemDisplaysEquip( f14_arg0, f14_arg2 ) then
			CoD.WZUtility.SendInventoryAttachmentPickUpNotify( f14_arg2 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f14_arg2 )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and IsMouseOrKeyboard( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f15_arg2, "WarzoneInventory", "canTransferFromStash" ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x234736A1C101BE7, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif IsMouseOrKeyboard( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f15_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.ALSO_ALLOW_WEAPON_ATTACHMENT_SWAP ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x928DC6C23119D85, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif IsMouseOrKeyboard( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.HUDUtility.ShowTriangleAttachmentPickupPrompt( f15_arg2 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f15_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x25F8C30A0958A7B, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif IsMouseOrKeyboard( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.HUDUtility.ShowTriangleAttachmentPickupPrompt( f15_arg2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f15_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.SWAPS ) and not CoD.WZUtility.InventoryItemDisplaysEquip( f15_arg0, f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x38B775D97E72F0C, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( ItemPickupList, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "MOUSE2", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and CoD.WZUtility.InventoryItemDisplaysPickup( f16_arg0, f16_arg2 ) then
			CoD.WZUtility.SendInventoryAttachmentPickUpNotify( f16_arg2 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f16_arg2 )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and IsMouseOrKeyboard( f16_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f16_arg0, f16_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f16_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f16_arg0, f16_arg2, "itemtype", "weapon" ) then
			CoD.WZUtility.SendInventoryAttachmentPickUpNotify( f16_arg2 )
			CoD.WZUtility.SendInventoryItemFocusNoneNotify( f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and CoD.WZUtility.InventoryItemDisplaysPickup( f17_arg0, f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0x4D2505E19049444], 0x0, nil, "MOUSE2" )
			return false
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and IsMouseOrKeyboard( f17_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f17_arg0, f17_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEnumBitSet( f17_arg2, "HUDItems", "weapon3dHintState", CoD.HUDUtility.Weapon3DHintStateFlags.INVENTORY_FULL ) and not CoD.ModelUtility.IsSelfModelValueEqualTo( f17_arg0, f17_arg2, "itemtype", "weapon" ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0x4D2505E19049444], 0x339E923E692AD5E, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE2" )
			return true
		else
			return false
		end
	end, false )
	ItemPickupList:subscribeToGlobalModel( f1_arg1, "MultiItemPickup", "status", function ( model )
		local f18_local0 = ItemPickupList
		if CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg1, "MultiItemPickup", "status", Enum[0x163CDAE6010C493][0xC9FADA56582F80F] ) and IsMouseOrKeyboard( f1_arg1 ) then
			CoD.BaseUtility.EnableNavigation( f18_local0 )
		elseif IsMouseOrKeyboard( f1_arg1 ) then
			CoD.BaseUtility.DisableNavigation( f18_local0 )
		end
	end )
	ItemPickupList:subscribeToGlobalModel( f1_arg1, "PerController", "scriptNotify", function ( model )
		local f19_local0 = ItemPickupList
		if CoD.ModelUtility.IsParamModelEqualToHashString( model, 0x15EF5E7734C15F5 ) and IsMouseOrKeyboard( f1_arg1 ) then
			CoD.ScoreboardUtility.HideScoreboard( f1_arg0, f1_arg1 )
		end
	end )
	self:addElement( ItemPickupList )
	self.ItemPickupList = ItemPickupList
	
	StashLine = LUI.UIImage.new( 0.5, 0.5, -442, 440, 0, 0, -1, 8 )
	StashLine:setRGB( 0.55, 0.54, 0.49 )
	StashLine:setAlpha( 0 )
	StashLine:setZRot( 180 )
	StashLine:setImage( RegisterImage( "uie_ui_menu_specialist_hub_bot_frame" ) )
	StashLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	StashLine:setShaderVector( 0, 0, 0, 0, 0 )
	StashLine:setupNineSliceShader( 16, 4 )
	self:addElement( StashLine )
	self.StashLine = StashLine
	
	HeaderStash = LUI.UIText.new( 0.5, 0.5, -101, 99, 0, 0, 3.5, 25.5 )
	HeaderStash:setRGB( 0, 0, 0 )
	HeaderStash:setText( LocalizeToUpperString( 0xCBB57645849CE8E ) )
	HeaderStash:setTTF( "ttmussels_regular" )
	HeaderStash:setLetterSpacing( 4 )
	HeaderStash:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	HeaderStash:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	HeaderStash:setBackingType( 1 )
	HeaderStash:setBackingWidget( CoD.WZBox9Slice, f1_arg0, f1_arg1 )
	HeaderStash:setBackingColor( 0.55, 0.54, 0.49 )
	HeaderStash:setBackingXPadding( 16 )
	HeaderStash:setBackingYPadding( 2 )
	self:addElement( HeaderStash )
	self.HeaderStash = HeaderStash
	
	ItemPickupList.id = "ItemPickupList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local4 = self
	f1_local4 = ItemPickupList
	if IsPC() then
		CoD.PCUtility.ActivateListPCSelectionBehavior( f1_local4 )
		CoD.GridAndListUtility.AddListUpDownNavigation( f1_arg0, f1_local4, f1_arg1 )
		CoD.GridAndListUtility.AddListLeftRightNavigation( f1_arg0, f1_local4, f1_arg1 )
		SetElementProperty( f1_local4, "__focusableBackingWidget", true )
		SetElementProperty( self.ItemPickupList, "__isForKBM", true )
	end
	return self
end

CoD.PC_MultiItemPickup.__onClose = function ( f20_arg0 )
	f20_arg0.ItemPickupList:close()
end

