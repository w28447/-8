require( "ui/uieditor/widgets/warzone/warzoneinventorymenuitemsmall" )
require( "x64:bf776923c7291f4" )

CoD.StartMenu_InventoryList = InheritFrom( LUI.UIElement )
CoD.StartMenu_InventoryList.__defaultWidth = 540
CoD.StartMenu_InventoryList.__defaultHeight = 239
CoD.StartMenu_InventoryList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StartMenu_InventoryList )
	self.id = "StartMenu_InventoryList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, -0.1, 0.9, 37, 5 )
	Backing:setRGB( 0.45, 0.45, 0.45 )
	Backing:setAlpha( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local BottomBracket9Slice = LUI.UIImage.new( 0, 0, 1, 560, 0, 0, -7, 2 )
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
	Title:setText( LocalizeToUpperString( "warzone/inventory" ) )
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
	List:setLeftRight( 0, 0, 0, 560 )
	List:setTopBottom( 0, 0, 27, 239 )
	List:setWidgetType( CoD.WarzoneInventoryMenuItemSmall )
	List:setHorizontalCount( 5 )
	List:setVerticalCount( 2 )
	List:setSpacing( 20 )
	List:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	List:setDataSource( "WarzoneInventory" )
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
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	List:linkToElementModel( List, "type", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
	end )
	local f1_local5 = List
	local f1_local6 = List.subscribeToModel
	local f1_local7 = Engine[0xE4D2F32833CFA6C]( Engine.GetClientNum( f1_arg1 ) )
	f1_local6( f1_local5, f1_local7.isInVehicle, function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.0"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.1"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.2"], function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.3"], function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["vehicle.seatOccupantClientNum.4"], function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end, false )
	List:linkToElementModel( List, "castTime", true, function ( model, f11_arg1 )
		CoD.Menu.UpdateButtonShownState( f11_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = DataSources.WarzoneInventory.getModel( f1_arg1 )
	f1_local6( f1_local5, f1_local7.showAttachments, function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	List:linkToElementModel( List, "stackCount", true, function ( model, f13_arg1 )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end )
	List:appendEventHandler( "input_source_changed", function ( f14_arg0, f14_arg1 )
		f14_arg1.menu = f14_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f14_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7.LastInput, function ( f15_arg0, f15_arg1 )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	List:linkToElementModel( List, "stowedAvailableAction", true, function ( model, f16_arg1 )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f16_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
	end )
	f1_local5 = List
	f1_local6 = List.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["hudItems.inventory.quickConsumeNetworkId"], function ( f17_arg0, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
	end, false )
	List:registerEventHandler( "list_active_changed", function ( element, event )
		local f18_local0 = nil
		CoD.GridAndListUtility.AlignElementToListItem2D( f1_arg1, element, self.InventorySplitter )
		return f18_local0
	end )
	List:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f19_local0 = nil
		CoD.WZUtility.SendInventoryItemFocusNotify( f1_arg1, element )
		CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg1, self, element )
		return f19_local0
	end )
	List:registerEventHandler( "lose_list_focus", function ( element, event )
		local f20_local0 = nil
		CoD.WZUtility.SendInventoryItemFocusNoneNotify( f1_arg1 )
		return f20_local0
	end )
	List:registerEventHandler( "gain_focus", function ( element, event )
		local f21_local0 = nil
		if element.gainFocus then
			f21_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f21_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f21_local0
	end )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], "ui_confirm", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f22_arg0, f22_arg2, "type", "killstreak" ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 1 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 1 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 3 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 3 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 4 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 4 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 5 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f22_arg0, f22_arg2, "castTime", 5 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f22_arg2, 0xEA01DCD66EB31BC ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f22_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f22_arg2, "WarzoneInventory", "showAttachments" ) and not CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) and not CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) and not CoD.BaseUtility.IsButtonHoldFinished( f22_arg3 ) then
			CoD.WZUtility.SendInventoryEquipNotify( f22_arg2, f22_arg0, f22_arg1, false )
			return true
		else
			
		end
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f23_arg0, f23_arg2, "type", "killstreak" ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 1 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 1 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 1000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 1000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 2 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 2000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 3 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 1500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 3 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 3000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 4 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 2000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 4 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 4000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 5 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 2500 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.ModelUtility.IsSelfModelValueLessThanOrEqualTo( f23_arg0, f23_arg2, "castTime", 5 ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 5000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and CoD.HUDUtility.PlayerHasPerk( f23_arg2, 0xEA01DCD66EB31BC ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 3000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and not CoD.WZUtility.CurrentlyIsDriverOrGunner( f23_arg2 ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 6000 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f23_arg2, "WarzoneInventory", "showAttachments" ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0xE7CFC872D6A405D, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0xB4A0F5945BB8108, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
			return true
		elseif not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x38B775D97E72F0C, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not IsPC() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 1 ) then
			CoD.WZUtility.SetupSplitCount( f24_arg2, f24_arg0 )
			MenuHidesFreeCursor( f24_arg1, f24_arg2 )
			SetElementState( self, self.InventorySplitter, f24_arg2, "Open" )
			SetLoseFocusToElement( self, "List", f24_arg2 )
			SetFocusToElement( self, "InventorySplitter", f24_arg2 )
			return true
		elseif IsPC() and IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f24_arg0, f24_arg2, "stackCount", 1 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f24_arg1, f24_arg2, f24_arg0 )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f24_arg0, f24_arg2, "stackCount", 1 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.WZUtility.SendInventoryDropNotify( f24_arg2, f24_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f24_arg0, f24_arg2, "stackCount", 1 ) then
			CoD.WZUtility.SendInventoryDropNotify( f24_arg2, f24_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.WZUtility.SendInventoryDropNotify( f24_arg2, f24_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsGamepad( f24_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f24_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.WZUtility.SendInventoryDropNotify( f24_arg2, f24_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not IsPC() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f25_arg0, f25_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsPC() and IsGamepad( f25_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f25_arg0, f25_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f25_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f25_arg0, f25_arg2, "stackCount", 1 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x44DB3A08BE7FB92, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f25_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f25_arg0, f25_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f25_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x44DB3A08BE7FB92, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		elseif IsGamepad( f25_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x22361E23588705A], "F", function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f26_arg2 ) and IsMouseOrKeyboard( f26_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f26_arg0, f26_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f26_arg0, f26_arg2, "stackCount", 1 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f26_arg1, f26_arg2, f26_arg0 )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f27_arg2 ) and IsMouseOrKeyboard( f27_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f27_arg0, f27_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f27_arg0, f27_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton[0x22361E23588705A], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "F" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if IsMouseOrKeyboard( f28_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f28_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f28_arg0, f28_arg2, "stackCount", 1 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.WZUtility.SendInventoryDropNotify( f28_arg2, f28_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsMouseOrKeyboard( f28_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f28_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f28_arg0, f28_arg2, "stackCount", 1 ) then
			CoD.WZUtility.SendInventoryDropNotify( f28_arg2, f28_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsMouseOrKeyboard( f28_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f28_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.WZUtility.SendInventoryDropNotify( f28_arg2, f28_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		elseif IsMouseOrKeyboard( f28_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f28_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f28_arg0, f28_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.WZUtility.SendInventoryDropNotify( f28_arg2, f28_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		if IsMouseOrKeyboard( f29_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f29_arg0, f29_arg2, "stackCount", 1 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x44DB3A08BE7FB92, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f29_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f29_arg0, f29_arg2, "stackCount", 1 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f29_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x44DB3A08BE7FB92, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		elseif IsMouseOrKeyboard( f29_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f29_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f29_arg0, f29_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MOUSE1", function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		if IsMouseOrKeyboard( f30_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			CoD.WZUtility.SendInventoryEquipNotify( f30_arg2, f30_arg0, f30_arg1, false )
			return true
		elseif IsMouseOrKeyboard( f30_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f30_arg2, "WarzoneInventory", "showAttachments" ) then
			CoD.WZUtility.SendInventoryEquipNotify( f30_arg2, f30_arg0, f30_arg1, false )
			return true
		elseif IsMouseOrKeyboard( f30_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) then
			CoD.WZUtility.SendInventoryConsumeNotify( f30_arg2, f30_arg0 )
			return true
		elseif IsMouseOrKeyboard( f30_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f30_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f30_arg0, f30_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.WZUtility.SendInventoryEquipNotify( f30_arg2, f30_arg0, f30_arg1, false )
			return true
		else
			
		end
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		if IsMouseOrKeyboard( f31_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f31_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0xBDF67DCF97EBC09, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		elseif IsMouseOrKeyboard( f31_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f31_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f31_arg2, "WarzoneInventory", "showAttachments" ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0xE7CFC872D6A405D, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		elseif IsMouseOrKeyboard( f31_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f31_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x1F464950EB4AA26, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		elseif IsMouseOrKeyboard( f31_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f31_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f31_arg0, f31_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0xB4A0F5945BB8108, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			CoD.WZUtility.SendInventoryEquipNotify( f32_arg2, f32_arg0, f32_arg1, false )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f32_arg2, "WarzoneInventory", "showAttachments" ) then
			CoD.WZUtility.SendInventoryEquipNotify( f32_arg2, f32_arg0, f32_arg1, false )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) then
			CoD.WZUtility.SendInventoryConsumeNotify( f32_arg2, f32_arg0 )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f32_arg0, f32_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.WZUtility.SendInventoryEquipNotify( f32_arg2, f32_arg0, f32_arg1, false )
			return true
		else
			
		end
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f33_arg2, "WarzoneInventory", "showAttachments" ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f33_arg0, f33_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "MOUSE3", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f34_arg0, f34_arg2, "stackCount", 1 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f34_arg2 ) and IsMouseOrKeyboard( f34_arg2 ) then
			CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f34_arg1, f34_arg2, f34_arg0 )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f34_arg2 ) and IsMouseOrKeyboard( f34_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f34_arg0, f34_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f34_arg2, f34_arg0, f34_arg1, false, true )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f34_arg2 ) and IsMouseOrKeyboard( f34_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f34_arg0, f34_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) then
			CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f34_arg2, f34_arg0, f34_arg1, false, true )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f34_arg2 ) and IsMouseOrKeyboard( f34_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f34_arg0, f34_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and not CoD.ModelUtility.IsControllerModelValueEqualToSelfModelValue( self, f34_arg2, "hudItems.inventory.quickConsumeNetworkId", "id" ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f34_arg0, f34_arg2, "type", "generic" ) then
			CoD.WZUtility.SendInventoryEquipCurrentConsumable( f34_arg2, f34_arg0 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f35_arg0, f35_arg2, "stackCount", 1 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f35_arg2 ) and IsMouseOrKeyboard( f35_arg2 ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xDCD547765767788, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f35_arg2 ) and IsMouseOrKeyboard( f35_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f35_arg0, f35_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xA86619565BE54DB], 0xD409BB4890E1387, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f35_arg2 ) and IsMouseOrKeyboard( f35_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f35_arg0, f35_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x234736A1C101BE7, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		elseif not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f35_arg2 ) and IsMouseOrKeyboard( f35_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f35_arg0, f35_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) and not CoD.ModelUtility.IsControllerModelValueEqualToSelfModelValue( self, f35_arg2, "hudItems.inventory.quickConsumeNetworkId", "id" ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f35_arg0, f35_arg2, "type", "generic" ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x2900747B42A56BA, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE3" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "MOUSE2", function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f36_arg0, f36_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f36_arg2 ) and IsMouseOrKeyboard( f36_arg2 ) then
			CoD.WZUtility.SendInventoryDropNotify( f36_arg2, f36_arg0 )
			CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			return true
		else
			
		end
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f37_arg0, f37_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f37_arg2 ) and IsMouseOrKeyboard( f37_arg2 ) then
			CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton[0x4D2505E19049444], "warzone/drop", Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE2" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( List, f1_arg1, Enum.LUIButton[0x22361E23588705A], "ui_contextual_1", function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f38_arg2 ) and IsMouseOrKeyboard( f38_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f38_arg0, f38_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f38_arg0, f38_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f38_arg0, f38_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f38_arg2, f38_arg0, f38_arg1, false, true )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f38_arg2 ) and IsMouseOrKeyboard( f38_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f38_arg0, f38_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f38_arg0, f38_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f38_arg0, f38_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) then
			CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f38_arg2, f38_arg0, f38_arg1, false, true )
			return true
		else
			
		end
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f39_arg2 ) and IsMouseOrKeyboard( f39_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f39_arg0, f39_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x22361E23588705A], 0xD409BB4890E1387, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		elseif not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f39_arg2 ) and IsMouseOrKeyboard( f39_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f39_arg0, f39_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f39_arg0, f39_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) then
			CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x22361E23588705A], 0x234736A1C101BE7, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0x1F464950EB4AA26, function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f40_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f40_arg0, f40_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f40_arg0, f40_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.CONSUME ) then
			return function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
				CoD.WZUtility.SendInventoryConsumeNotify( f41_arg2, f41_arg0 )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0xE7CFC872D6A405D, function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f42_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f42_arg0, f42_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f42_arg0, f42_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) and CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f42_arg2, "WarzoneInventory", "showAttachments" ) then
			return function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
				CoD.WZUtility.SendInventoryEquipNotify( f43_arg2, f43_arg0, f43_arg1, false )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0xB4A0F5945BB8108, function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f44_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f44_arg0, f44_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f44_arg0, f44_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			return function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
				CoD.WZUtility.SendInventoryEquipNotify( f45_arg2, f45_arg0, f45_arg1, false )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0x38B775D97E72F0C, function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f46_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f46_arg0, f46_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f46_arg0, f46_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.EQUIP ) then
			return function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
				CoD.WZUtility.SendInventoryEquipNotify( f47_arg2, f47_arg0, f47_arg1, false )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0x44DB3A08BE7FB92, function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f48_arg0, f48_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f48_arg0, f48_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f48_arg2 ) then
			return function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
				CoD.WZUtility.SendInventoryDropNotify( f49_arg2, f49_arg0 )
				CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, "warzone/drop", function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f50_arg0, f50_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f50_arg0, f50_arg2, "availableAction", CoD.WZUtility.ItemAvailableAction.DISCARD ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f50_arg2 ) then
			return function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
				CoD.WZUtility.SendInventoryDropNotify( f51_arg2, f51_arg0 )
				CoD.WZUtility.HackUpdateListDataSourceAfterDelay( self.List, true, false, true, "500" )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0xDCD547765767788, function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f52_arg0, f52_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.ModelUtility.IsSelfModelValueGreaterThan( f52_arg0, f52_arg2, "stackCount", 1 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f52_arg2 ) then
			return function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
				CoD.WZUtility.OpenPCSplitterWidgetForElement( self, f53_arg1, f53_arg2, f53_arg0 )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0xD409BB4890E1387, function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f54_arg0, f54_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f54_arg2 ) and IsMouseOrKeyboard( f54_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f54_arg0, f54_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f54_arg0, f54_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.SWAP ) then
			return function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
				CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f55_arg2, f55_arg0, f55_arg1, false, true )
			end
			
		else
			
		end
	end )
	List:AddContextualMenuAction( f1_arg0, f1_arg1, 0x234736A1C101BE7, function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		if not CoD.WZUtility.IsDualWeaponMiddleClickAttachmentTransferDisabled() and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f56_arg0, f56_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f56_arg2 ) and IsMouseOrKeyboard( f56_arg2 ) and CoD.ModelUtility.IsSelfModelValueEqualTo( f56_arg0, f56_arg2, "type", "attachment" ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( f56_arg0, f56_arg2, "stowedAvailableAction", CoD.WZUtility.ItemAvailableAction.ATTACH ) then
			return function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
				CoD.WZUtility.SendInventoryEquipOnWeaponNotify( f57_arg2, f57_arg0, f57_arg1, false, true )
			end
			
		else
			
		end
	end )
	self:addElement( List )
	self.List = List
	
	f1_local6 = nil
	f1_local6 = LUI.UIElement.createFake()
	self.InventorySplitter = f1_local6
	self:mergeStateConditions( {
		{
			stateName = "ExtraStorageVisible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "hudItems.inventory.count", CoD.WZUtility.InventorySize.ITEM_WORLD_PLAYER_INVENTORY_SIZE )
			end
		}
	} )
	f1_local7 = self
	f1_local5 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local7, f1_local8["hudItems.inventory.count"], function ( f59_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f59_arg0:get(),
			modelName = "hudItems.inventory.count"
		} )
	end, false )
	self.__on_onStartMenuOpened_self = function ( f60_arg0, f60_arg1 )
		local f60_local0 = self
		CoD.GridAndListUtility.UpdateDataSource( self.List, false, false, true )
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "onStartMenuOpened", self.__on_onStartMenuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f61_arg2, f61_arg3, f61_arg4 )
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

CoD.StartMenu_InventoryList.__resetProperties = function ( f63_arg0 )
	f63_arg0.List:completeAnimation()
	f63_arg0.Title:completeAnimation()
	f63_arg0.BottomBracket9Slice:completeAnimation()
	f63_arg0.InventorySplitter:completeAnimation()
	f63_arg0.Backing:completeAnimation()
	f63_arg0.List:setTopBottom( 0, 0, 27, 239 )
	f63_arg0.Title:setTopBottom( 0, 0, -4.5, 17.5 )
	f63_arg0.Title:setText( LocalizeToUpperString( "warzone/inventory" ) )
	f63_arg0.BottomBracket9Slice:setTopBottom( 0, 0, -7, 2 )
	f63_arg0.InventorySplitter:setTopBottom( 0, 0, 0, 50 )
	f63_arg0.Backing:setTopBottom( -0.1, 0.9, 37, 5 )
end

CoD.StartMenu_InventoryList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f64_arg0, f64_arg1 )
			f64_arg0:__resetProperties()
			f64_arg0:setupElementClipCounter( 4 )
			f64_arg0.Backing:completeAnimation()
			f64_arg0.Backing:setTopBottom( -0.1, 0.9, 73, 41 )
			f64_arg0.clipFinished( f64_arg0.Backing )
			f64_arg0.BottomBracket9Slice:completeAnimation()
			f64_arg0.BottomBracket9Slice:setTopBottom( 0, 0, 73, 82 )
			f64_arg0.clipFinished( f64_arg0.BottomBracket9Slice )
			f64_arg0.Title:completeAnimation()
			f64_arg0.Title:setTopBottom( 0, 0, 76, 100 )
			f64_arg0.clipFinished( f64_arg0.Title )
			f64_arg0.List:completeAnimation()
			f64_arg0.List:setTopBottom( 0, 0, 115.5, 211.5 )
			f64_arg0.clipFinished( f64_arg0.List )
			f64_arg0.InventorySplitter:completeAnimation()
			f64_arg0.InventorySplitter:setTopBottom( 0, 0, 97.5, 147.5 )
			f64_arg0.clipFinished( f64_arg0.InventorySplitter )
		end
	},
	ExtraStorageVisible = {
		DefaultClip = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 2 )
			f65_arg0.BottomBracket9Slice:completeAnimation()
			f65_arg0.BottomBracket9Slice:setTopBottom( 0, 0, -13, -4 )
			f65_arg0.clipFinished( f65_arg0.BottomBracket9Slice )
			f65_arg0.Title:completeAnimation()
			f65_arg0.Title:setTopBottom( 0, 0, -10.5, 11.5 )
			f65_arg0.Title:setText( LocalizeToUpperString( "warzone/backpack" ) )
			f65_arg0.clipFinished( f65_arg0.Title )
		end
	}
}
CoD.StartMenu_InventoryList.__onClose = function ( f66_arg0 )
	f66_arg0.__on_close_removeOverrides()
	f66_arg0.List:close()
	f66_arg0.InventorySplitter:close()
end

