require( "ui/uieditor/widgets/warzone/warzoneinventorymenuitemsmall" )
require( "x64:bf776923c7291f4" )

CoD.StartMenu_ArmorPlatesList = InheritFrom( LUI.UIElement )
CoD.StartMenu_ArmorPlatesList.__defaultWidth = 215
CoD.StartMenu_ArmorPlatesList.__defaultHeight = 124
CoD.StartMenu_ArmorPlatesList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StartMenu_ArmorPlatesList )
	self.id = "StartMenu_ArmorPlatesList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Backing = LUI.UIImage.new( 0, 0.4, 0, 0, -0.1, 0.5, 37, 5 )
	Backing:setRGB( 0.45, 0.45, 0.45 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local BottomBracket9Slice = LUI.UIImage.new( 0, 0, 1, 209, 0, 0, -7, 2 )
	BottomBracket9Slice:setRGB( 0.55, 0.54, 0.49 )
	BottomBracket9Slice:setZRot( 180 )
	BottomBracket9Slice:setImage( RegisterImage( "uie_ui_menu_specialist_hub_bot_frame" ) )
	BottomBracket9Slice:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	BottomBracket9Slice:setShaderVector( 0, 0, 0, 0, 0 )
	BottomBracket9Slice:setupNineSliceShader( 16, 4 )
	self:addElement( BottomBracket9Slice )
	self.BottomBracket9Slice = BottomBracket9Slice
	
	local Title = LUI.UIText.new( 0, 0, 17.5, 117.5, 0, 0, -4.5, 17.5 )
	Title:setRGB( 0, 0, 0 )
	Title:setText( LocalizeToUpperString( "warzone/armor_plates" ) )
	Title:setTTF( "ttmussels_regular" )
	Title:setLetterSpacing( 4 )
	Title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Title:setBackingType( 1 )
	Title:setBackingWidget( CoD.WZBox9Slice, f1_arg0, f1_arg1 )
	Title:setBackingColor( 0.55, 0.54, 0.49 )
	Title:setBackingXPadding( 16 )
	Title:setBackingYPadding( 2 )
	self:addElement( Title )
	self.Title = Title
	
	local List = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	List:setLeftRight( 0, 0, 0, 212 )
	List:setTopBottom( 0, 0, 28, 124 )
	List:setWidgetType( CoD.WarzoneInventoryMenuItemSmall )
	List:setHorizontalCount( 2 )
	List:setSpacing( 20 )
	List:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	List:setDataSource( "WarzoneShards" )
	List:linkToElementModel( List, "id", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	List:linkToElementModel( List, "availableAction", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end )
	List:linkToElementModel( List, "castTime", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	local f1_local5 = List
	local f1_local6 = List.subscribeToModel
	local f1_local7 = DataSources.HUDItems.getModel( f1_arg1 )
	f1_local6( f1_local5, f1_local7.armorType, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine[0xE4D2F32833CFA6C]( Engine.GetClientNum( f1_arg1 ) )
	f1_local6( f1_local5, f1_local7.armor, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine[0xE4D2F32833CFA6C]( Engine.GetClientNum( f1_arg1 ) )
	f1_local6( f1_local5, f1_local7.armorMax, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine[0xE4D2F32833CFA6C]( Engine.GetClientNum( f1_arg1 ) )
	f1_local6( f1_local5, f1_local7.isInVehicle, function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.0"], function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.1"], function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.2"], function ( f11_arg0, f11_arg1 )
		CoD.Menu.UpdateButtonShownState( f11_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.3"], function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.4"], function ( f13_arg0, f13_arg1 )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	List:linkToElementModel( List, "stackCount", true, function ( model, f14_arg1 )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	List:appendEventHandler( "input_source_changed", function ( f15_arg0, f15_arg1 )
		f15_arg1.menu = f15_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7.LastInput, function ( f16_arg0, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	List:registerEventHandler( "list_active_changed", function ( element, event )
		local f17_local0 = nil
		CoD.GridAndListUtility.AlignElementToListItem2D( f1_arg1, element, self.InventorySplitter )
		return f17_local0
	end )
	List:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f18_local0 = nil
		CoD.WZUtility.SendInventoryItemFocusNotify( f1_arg1, element )
		CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg1, self, element )
		return f18_local0
	end )
	List:registerEventHandler( "lose_list_focus", function ( element, event )
		local f19_local0 = nil
		CoD.WZUtility.SendInventoryItemFocusNoneNotify( f1_arg1 )
		return f19_local0
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f20_local0
	end )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_confirm", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 1 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 1 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 3 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 3 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 4 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 4 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 5 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f21_arg0, f21_arg2, "castTime", 5 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f21_arg2, 0xEA01DCD66EB31BC ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f21_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f21_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f21_arg2 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f21_arg2, f21_arg0, f21_arg1, false )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 1 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 1 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 1000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 1000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 2 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 2000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 3 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 1500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 3 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 3000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 4 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 2000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 4 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 4000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 5 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 2500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 5 ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 5000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 3000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f22_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f22_arg2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 6000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not IsPC() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f23_arg0, f23_arg2, "stackCount", 1 ) then
			CoD.WZUtility.SetupSplitCount( f23_arg2, f23_arg0 )
			MenuHidesFreeCursor( f23_arg1, f23_arg2 )
			SetElementState( self, self.InventorySplitter, f23_arg2, "Open" )
			SetLoseFocusToElement( self, "List", f23_arg2 )
			SetFocusToElement( self, "InventorySplitter", f23_arg2 )
			return true
		elseif IsPC() and IsGamepad( f23_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f23_arg0, f23_arg2, "stackCount", 1 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f23_arg1, f23_arg2, f23_arg0 )
			return true
		elseif IsGamepad( f23_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f23_arg0, f23_arg2, "stackCount", 0 ) then
			CoD.WZUtility.SendInventoryDropNotify( f23_arg2, f23_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsGamepad( f23_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.WZUtility.SendInventoryDropNotify( f23_arg2, f23_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsGamepad( f23_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f23_arg0, f23_arg2, "stackCount", 0 ) then
			CoD.WZUtility.SendInventoryDropNotify( f23_arg2, f23_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not IsPC() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsPC() and IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 0 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x44DB3A08BE7FB92, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 0 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x22361E23588705A], "F", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and IsMouseOrKeyboard( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f25_arg0, f25_arg2, "stackCount", 1 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f25_arg1, f25_arg2, f25_arg0 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f26_arg2 ) and IsMouseOrKeyboard( f26_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f26_arg0, f26_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f26_arg0, f26_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x22361E23588705A], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "F" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsMouseOrKeyboard( f27_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f27_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f27_arg0, f27_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f27_arg0, f27_arg2, "stackCount", 0 ) then
			CoD.WZUtility.SendInventoryDropNotify( f27_arg2, f27_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsMouseOrKeyboard( f28_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f28_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f28_arg0, f28_arg2, "stackCount", 0 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MOUSE1", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		if IsMouseOrKeyboard( f29_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f29_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f29_arg2 ) then
			CoD.WZUtility.SendInventoryConsumeNotify( f29_arg2, f29_arg0 )
			return true
		else
			
		end
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		if IsMouseOrKeyboard( f30_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f30_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f30_arg2 ) then
			CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x2C27E2320C64A74, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f31_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f31_arg2 ) then
			CoD.WZUtility.SendInventoryConsumeNotify( f31_arg2, f31_arg0 )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f32_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f32_arg2 ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "MOUSE3", function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f33_arg0, f33_arg2, "stackCount", 1 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f33_arg2 ) and IsMouseOrKeyboard( f33_arg2 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f33_arg1, f33_arg2, f33_arg0 )
			return true
		else
			
		end
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f34_arg0, f34_arg2, "stackCount", 1 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f34_arg2 ) and IsMouseOrKeyboard( f34_arg2 ) then
			CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "MOUSE2", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f35_arg0, f35_arg2, "stackCount", 0 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f35_arg2 ) and IsMouseOrKeyboard( f35_arg2 ) then
			CoD.WZUtility.SendInventoryDropNotify( f35_arg2, f35_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f36_arg0, f36_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f36_arg0, f36_arg2, "stackCount", 0 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f36_arg2 ) and IsMouseOrKeyboard( f36_arg2 ) then
			CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton[0x4D2505E19049444], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE2" )
			return true
		else
			return false
		end
	end, false )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0x2C27E2320C64A74, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f37_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f37_arg0, f37_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f37_arg0, f37_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.REPAIR ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualTo( f37_arg2, "HUDItems", "armorType", 0 ) and not CoD.HUDUtility.IsArmorAtFullHealth( f37_arg2 ) then
			return function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
				CoD.WZUtility.SendInventoryConsumeNotify( f38_arg2, f38_arg0 )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, "warzone/drop", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f39_arg0, f39_arg2, "stackCount", 0 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f39_arg2 ) then
			return function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
				CoD.WZUtility.SendInventoryDropNotify( f40_arg2, f40_arg0 )
				CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0xDCD547765767788, function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f41_arg0, f41_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f41_arg0, f41_arg2, "stackCount", 1 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f41_arg2 ) then
			return function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
				CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f42_arg1, f42_arg2, f42_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( List )
	self.List = List
	
	f1_local6 = nil
	f1_local6 = LUI.UIElement.createFake()
	self.InventorySplitter = f1_local6
	self.__on_onStartMenuOpened_self = function ( f43_arg0, f43_arg1 )
		local f43_local0 = self
		CoD.GridAndListUtility.UpdateDataSource( self.List, false, false, true )
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "onStartMenuOpened", self.__on_onStartMenuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f44_arg2, f44_arg3, f44_arg4 )
		CoD.GridAndListUtility.UpdateDataSource( self.List, false, false, true )
	end )
	List.id = "List"
	f1_local6.id = "InventorySplitter"
	self.__defaultFocus = List
	self.__on_close_removeOverrides = function ()
		LUI.OverrideFunction_Remove( f1_arg0, "onStartMenuOpened", self.__on_onStartMenuOpened_self )
		LUI.OverrideFunction_Remove( f1_arg0, "onStartMenuClosed", self.__on_onStartMenuClosed_InventorySplitter )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local5 = self
	f1_local5 = List
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local5, f1_arg1, "name", "", "" )
	end
	return self
end

CoD.StartMenu_ArmorPlatesList.__resetProperties = function ( f46_arg0 )
	f46_arg0.List:completeAnimation()
	f46_arg0.Title:completeAnimation()
	f46_arg0.BottomBracket9Slice:completeAnimation()
	f46_arg0.InventorySplitter:completeAnimation()
	f46_arg0.Backing:completeAnimation()
	f46_arg0.List:setTopBottom( 0, 0, 28, 124 )
	f46_arg0.Title:setTopBottom( 0, 0, -4.5, 17.5 )
	f46_arg0.BottomBracket9Slice:setTopBottom( 0, 0, -7, 2 )
	f46_arg0.InventorySplitter:setTopBottom( 0, 0, 0, 50 )
	f46_arg0.Backing:setTopBottom( -0.1, 0.5, 37, 5 )
end

CoD.StartMenu_ArmorPlatesList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f47_arg0, f47_arg1 )
			f47_arg0:__resetProperties()
			f47_arg0:setupElementClipCounter( 4 )
			f47_arg0.Backing:completeAnimation()
			f47_arg0.Backing:setTopBottom( -0.1, 0.9, 73, 41 )
			f47_arg0.clipFinished( f47_arg0.Backing )
			f47_arg0.BottomBracket9Slice:completeAnimation()
			f47_arg0.BottomBracket9Slice:setTopBottom( 0, 0, 73, 82 )
			f47_arg0.clipFinished( f47_arg0.BottomBracket9Slice )
			f47_arg0.Title:completeAnimation()
			f47_arg0.Title:setTopBottom( 0, 0, 76, 100 )
			f47_arg0.clipFinished( f47_arg0.Title )
			f47_arg0.List:completeAnimation()
			f47_arg0.List:setTopBottom( 0, 0, 115.5, 211.5 )
			f47_arg0.clipFinished( f47_arg0.List )
			f47_arg0.InventorySplitter:completeAnimation()
			f47_arg0.InventorySplitter:setTopBottom( 0, 0, 97.5, 147.5 )
			f47_arg0.clipFinished( f47_arg0.InventorySplitter )
		end
	}
}
CoD.StartMenu_ArmorPlatesList.__onClose = function ( f48_arg0 )
	f48_arg0.__on_close_removeOverrides()
	f48_arg0.List:close()
	f48_arg0.InventorySplitter:close()
end

