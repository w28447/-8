require( "ui/uieditor/widgets/warzone/warzoneinventorymenuitem" )

CoD.StartMenu_AttachmentList = InheritFrom( LUI.UIElement )
CoD.StartMenu_AttachmentList.__defaultWidth = 652
CoD.StartMenu_AttachmentList.__defaultHeight = 124
CoD.StartMenu_AttachmentList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StartMenu_AttachmentList )
	self.id = "StartMenu_AttachmentList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local f1_local1 = nil
	f1_local1 = LUI.UIElement.createFake()
	self.WeaponAttachments = f1_local1
	local f1_local2 = nil
	
	local WeaponAttachmentsPC = LUI.UIList.new( f1_arg0, f1_arg1, 42, 0, nil, false, false, false, false )
	WeaponAttachmentsPC:setLeftRight( 0.5, 0.5, -174, 186 )
	WeaponAttachmentsPC:setTopBottom( 0, 0, 0, 222 )
	WeaponAttachmentsPC:setAlpha( 0 )
	WeaponAttachmentsPC:setWidgetType( CoD.WarzoneInventoryMenuItem )
	WeaponAttachmentsPC:setHorizontalCount( 3 )
	WeaponAttachmentsPC:setVerticalCount( 2 )
	WeaponAttachmentsPC:setSpacing( 42 )
	WeaponAttachmentsPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	WeaponAttachmentsPC:setDataSource( "WarzoneAttachments" )
	WeaponAttachmentsPC:appendEventHandler( "input_source_changed", function ( f2_arg0, f2_arg1 )
		f2_arg1.menu = f2_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f2_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	local HeaderImage = WeaponAttachmentsPC
	local Title = WeaponAttachmentsPC.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	Title( HeaderImage, f1_local6.LastInput, function ( f3_arg0, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	WeaponAttachmentsPC:linkToElementModel( WeaponAttachmentsPC, "id", true, function ( model, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	HeaderImage = WeaponAttachmentsPC
	Title = WeaponAttachmentsPC.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	Title( HeaderImage, f1_local6["hudItems.inventory.count"], function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	HeaderImage = WeaponAttachmentsPC
	Title = WeaponAttachmentsPC.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	Title( HeaderImage, f1_local6["hudItems.inventory.filledSlots"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	HeaderImage = WeaponAttachmentsPC
	Title = WeaponAttachmentsPC.subscribeToModel
	f1_local6 = Engine.GetModelForController( f1_arg1 )
	Title( HeaderImage, f1_local6["hudItems.inventory.shard0.stackCount"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	WeaponAttachmentsPC:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f8_local0
	end )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsGamepad( f9_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f9_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f9_arg0, f9_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f9_arg2 ) then
			CoD.WZUtility.SendInventoryDetachNotify( f9_arg2, f9_arg0 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsGamepad( f10_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f10_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f10_arg0, f10_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x6099347F51AF260, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0x6CE8023188D673F], "ui_confirm", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsMouseOrKeyboard( f11_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f11_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f11_arg0, f11_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f11_arg2 ) then
			CoD.WZUtility.SendInventoryDetachNotify( f11_arg2, f11_arg0 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsMouseOrKeyboard( f12_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f12_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x6CE8023188D673F], 0x6099347F51AF260, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsGamepad( f13_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f13_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.WZUtility.SendInventoryDropNotify( f13_arg2, f13_arg0 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsGamepad( f14_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f14_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f14_arg0, f14_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xFFD03BF8361AC75, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3] | Enum[0xBEBDBAEEB3ECCCA][0x2919C98A7A845F0] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "ui_remove", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsMouseOrKeyboard( f15_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f15_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f15_arg0, f15_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.WZUtility.SendInventoryDropNotify( f15_arg2, f15_arg0 )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if IsMouseOrKeyboard( f16_arg2 ) and not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f16_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f16_arg0, f16_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0xFFD03BF8361AC75, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "MOUSE1", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsMouseOrKeyboard( f17_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f17_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f17_arg0, f17_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f17_arg2 ) then
			CoD.WZUtility.SendInventoryDetachNotify( f17_arg2, f17_arg0 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if IsMouseOrKeyboard( f18_arg2 ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f18_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f18_arg0, f18_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f18_arg2 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x6099347F51AF260, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f19_arg0, f19_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f19_arg2 ) then
			CoD.WZUtility.SendInventoryDetachNotify( f19_arg2, f19_arg0 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f20_arg0, f20_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( WeaponAttachmentsPC, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "MOUSE2", function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f21_arg0, f21_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f21_arg2 ) and IsMouseOrKeyboard( f21_arg2 ) then
			CoD.WZUtility.SendInventoryDropNotify( f21_arg2, f21_arg0 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f22_arg0, f22_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and CoD.WZUtility.ScoreboardVisibilitySetAndPC( f22_arg2 ) and IsMouseOrKeyboard( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0x4D2505E19049444], 0xFFD03BF8361AC75, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "MOUSE2" )
			return true
		else
			return false
		end
	end, false )
	WeaponAttachmentsPC:AddContextualMenuAction( f1_arg0, f1_arg1, 0x6099347F51AF260, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f23_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f23_arg0, f23_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) and not CoD.WZUtility.InventoryFull( f23_arg2 ) then
			return function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
				CoD.WZUtility.SendInventoryDetachNotify( f24_arg2, f24_arg0 )
			end
			
		else
			
		end
	end )
	WeaponAttachmentsPC:AddContextualMenuAction( f1_arg0, f1_arg1, 0xFFD03BF8361AC75, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if not CoD.WZUtility.ScoreboardVisibilitySetAndPC( f25_arg2 ) and not CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "id", CoD.WZUtility.InventoryItem.INVENTORY_ITEM_NONE ) then
			return function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
				CoD.WZUtility.SendInventoryDropNotify( f26_arg2, f26_arg0 )
			end
			
		else
			
		end
	end )
	self:addElement( WeaponAttachmentsPC )
	self.WeaponAttachmentsPC = WeaponAttachmentsPC
	
	Title = LUI.UIText.new( 0, 0, 8, 108, 0, 0, -27.5, -3.5 )
	Title:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	Title:setAlpha( 0 )
	Title:setText( LocalizeToUpperString( 0x31E6136F9B444FB ) )
	Title:setTTF( "ttmussels_regular" )
	Title:setLetterSpacing( 4 )
	Title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( Title )
	self.Title = Title
	
	HeaderImage = LUI.UIImage.new( 1, 1, -80.5, -16.5, 0, 0, -47.5, 16.5 )
	HeaderImage:setAlpha( 0 )
	HeaderImage:setImage( RegisterImage( 0x7615068F50B3D66 ) )
	self:addElement( HeaderImage )
	self.HeaderImage = HeaderImage
	
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	f1_local1.id = "WeaponAttachments"
	WeaponAttachmentsPC.id = "WeaponAttachmentsPC"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local6 = self
	f1_local6 = f1_local1
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local6, f1_arg1, "name", "", "" )
	end
	f1_local6 = WeaponAttachmentsPC
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local6, f1_arg1, "name", "", "" )
	end
	return self
end

CoD.StartMenu_AttachmentList.__resetProperties = function ( f28_arg0 )
	f28_arg0.WeaponAttachments:completeAnimation()
	f28_arg0.WeaponAttachmentsPC:completeAnimation()
	f28_arg0.WeaponAttachments:setAlpha( 1 )
	f28_arg0.WeaponAttachmentsPC:setAlpha( 0 )
end

CoD.StartMenu_AttachmentList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 0 )
		end
	},
	PC = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 1 )
			f30_arg0.WeaponAttachments:completeAnimation()
			f30_arg0.WeaponAttachments:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.WeaponAttachments )
			f30_arg0.WeaponAttachmentsPC:completeAnimation()
			f30_arg0.WeaponAttachmentsPC:setAlpha( 1 )
			f30_arg0.clipFinished( f30_arg0.WeaponAttachmentsPC )
		end
	}
}
CoD.StartMenu_AttachmentList.__onClose = function ( f31_arg0 )
	f31_arg0.WeaponAttachments:close()
	f31_arg0.WeaponAttachmentsPC:close()
end

