require( "ui/uieditor/widgets/blackmarket/bm_iteminfopanel" )
require( "x64:7b5952c3bc0ee42" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.WeaponDeathFxSelectInternal = InheritFrom( LUI.UIElement )
CoD.WeaponDeathFxSelectInternal.__defaultWidth = 1920
CoD.WeaponDeathFxSelectInternal.__defaultHeight = 1080
CoD.WeaponDeathFxSelectInternal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	if not IsCurrentMenu( f1_arg0, "WeaponTabbedAccessoriesSelect" ) then
		CoD.WeaponOptionsUtility.DeathFxCharacterUpdate( f1_arg0, f1_arg1 )
	elseif IsCurrentMenu( f1_arg0, "WeaponTabbedAccessoriesSelect" ) then
		SendCustomClientScriptMenuChangeNotify( f1_arg1, "WeaponDeathFxSelect", true )
		CoD.WeaponOptionsUtility.DeathFxCharacterUpdate( f1_arg0, f1_arg1 )
	end
	self:setClass( CoD.WeaponDeathFxSelectInternal )
	self.id = "WeaponDeathFxSelectInternal"
	self.soundSet = "CAC_WeaponPersonalization"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DeathFxListBg = LUI.UIImage.new( 0, 0, 73, 921, 0, 0, 81, 926 )
	DeathFxListBg:setScale( 0.77, 0.77 )
	DeathFxListBg:setImage( RegisterImage( 0xCE384B31419E220 ) )
	DeathFxListBg:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DeathFxListBg:setShaderVector( 0, 0, 0, 0, 0 )
	DeathFxListBg:setupNineSliceShader( 212, 212 )
	self:addElement( DeathFxListBg )
	self.DeathFxListBg = DeathFxListBg
	
	local DeathFxList = LUI.UIList.new( f1_arg0, f1_arg1, 11, 0, nil, true, false, false, false )
	DeathFxList:setLeftRight( 0, 0, 173, 814 )
	DeathFxList:setTopBottom( 0, 0, 178, 819 )
	DeathFxList:setWidgetType( CoD.LootWeaponOptionButton )
	DeathFxList:setHorizontalCount( 4 )
	DeathFxList:setVerticalCount( 4 )
	DeathFxList:setSpacing( 11 )
	DeathFxList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	DeathFxList:setVerticalCounter( CoD.verticalCounter )
	DeathFxList:setDataSource( "WeaponDeathFxList" )
	DeathFxList:linkToElementModel( DeathFxList, "available", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	DeathFxList:appendEventHandler( "input_source_changed", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end )
	local XCamMouseControl = DeathFxList
	local ItemInfoPanel = DeathFxList.subscribeToModel
	local f1_local5 = Engine.GetModelForController( f1_arg1 )
	ItemInfoPanel( XCamMouseControl, f1_local5.LastInput, function ( f4_arg0, f4_arg1 )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f4_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
	end, false )
	DeathFxList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f5_local0 = nil
		CoD.BreadcrumbUtility.SetWeaponDeathFxOld( f1_arg0, element, f1_arg1 )
		return f5_local0
	end )
	DeathFxList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xA86619565BE54DB] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4D2505E19049444] )
		return f6_local0
	end )
	f1_arg0:AddButtonCallbackFunction( DeathFxList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f7_arg0, f7_arg2, "available" ) and not IsElementModelConditionFn( f7_arg1, self, f7_arg0, f7_arg2, "isEquippedFn" ) and not IsPC() then
			CoD.WeaponOptionsUtility.EquipDeathFx( f7_arg1, f7_arg0, f7_arg2, false )
			UpdateButtonPromptState( f7_arg1, f7_arg0, f7_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			SaveLoadout( self, f7_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueTrue( f7_arg0, f7_arg2, "available" ) and not IsElementModelConditionFn( f7_arg1, self, f7_arg0, f7_arg2, "isEquippedFn" ) then
			CoD.WeaponOptionsUtility.EquipDeathFx( f7_arg1, f7_arg0, f7_arg2, false )
			UpdateButtonPromptState( f7_arg1, f7_arg0, f7_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			CoD.WeaponOptionsUtility.PreviewDeathFx( f7_arg1, f7_arg0, f7_arg2 )
			SaveLoadout( self, f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if CoD.ModelUtility.IsSelfModelValueTrue( f8_arg0, f8_arg2, "available" ) and not IsElementModelConditionFn( f8_arg1, self, f8_arg0, f8_arg2, "isEquippedFn" ) and not IsPC() then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueTrue( f8_arg0, f8_arg2, "available" ) and not IsElementModelConditionFn( f8_arg1, self, f8_arg0, f8_arg2, "isEquippedFn" ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( DeathFxList, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsGamepad( f9_arg2 ) then
			CoD.WeaponOptionsUtility.PreviewDeathFx( f9_arg1, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsGamepad( f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x52FB29ED3A3CA79, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( DeathFxList, f1_arg1, Enum.LUIButton[0xA86619565BE54DB], "ui_contextual_1", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsMouseOrKeyboard( f11_arg2 ) then
			CoD.WeaponOptionsUtility.PreviewDeathFx( f11_arg1, f11_arg0, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsMouseOrKeyboard( f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0xA86619565BE54DB], 0x52FB29ED3A3CA79, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_contextual_1" )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( DeathFxList, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsElementModelConditionFn( f13_arg1, self, f13_arg0, f13_arg2, "isEquippedFn" ) and IsGamepad( f13_arg2 ) then
			CoD.WeaponOptionsUtility.ClearDeathFx( f13_arg1, f13_arg2 )
			UpdateButtonPromptState( f13_arg1, f13_arg0, f13_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsElementModelConditionFn( f14_arg1, self, f14_arg0, f14_arg2, "isEquippedFn" ) and IsGamepad( f14_arg2 ) then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x679ACA6FFC6C8F3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( DeathFxList, f1_arg1, Enum.LUIButton[0x4D2505E19049444], "ui_remove", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsElementModelConditionFn( f15_arg1, self, f15_arg0, f15_arg2, "isEquippedFn" ) and IsMouseOrKeyboard( f15_arg2 ) then
			CoD.WeaponOptionsUtility.ClearDeathFx( f15_arg1, f15_arg2 )
			UpdateButtonPromptState( f15_arg1, f15_arg0, f15_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if IsElementModelConditionFn( f16_arg1, self, f16_arg0, f16_arg2, "isEquippedFn" ) and IsMouseOrKeyboard( f16_arg2 ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x4D2505E19049444], 0x679ACA6FFC6C8F3, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], "ui_remove" )
			return true
		else
			return false
		end
	end, false )
	DeathFxList:AddContextualMenuAction( f1_arg0, f1_arg1, 0x52FB29ED3A3CA79, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		return function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
			CoD.WeaponOptionsUtility.PreviewDeathFx( f18_arg1, f18_arg0, f18_arg2 )
		end
		
	end )
	DeathFxList:AddContextualMenuAction( f1_arg0, f1_arg1, 0x679ACA6FFC6C8F3, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsElementModelConditionFn( f19_arg1, self, f19_arg0, f19_arg2, "isEquippedFn" ) then
			return function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
				CoD.WeaponOptionsUtility.ClearDeathFx( f20_arg1, f20_arg2 )
				UpdateButtonPromptState( f20_arg1, f20_arg0, f20_arg2, Enum.LUIButton[0xC083113BC81F23F] )
			end
			
		else
			
		end
	end )
	self:addElement( DeathFxList )
	self.DeathFxList = DeathFxList
	
	ItemInfoPanel = CoD.BM_ItemInfoPanel.new( f1_arg0, f1_arg1, 1, 1, -732, -192, 0, 0, 695, 845 )
	self:addElement( ItemInfoPanel )
	self.ItemInfoPanel = ItemInfoPanel
	
	XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_arg0, f1_arg1, 0.32, 0.68, 500, 500, 0, 0, 165, 665 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	ItemInfoPanel:linkToElementModel( DeathFxList, nil, false, function ( model )
		ItemInfoPanel:setModel( model, f1_arg1 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		if not IsCurrentMenu( f1_arg0, "WeaponTabbedAccessoriesSelect" ) then
			CoD.WeaponOptionsUtility.StopDeathFxPreview( f1_arg0, f1_arg1 )
		elseif IsCurrentMenu( f1_arg0, "WeaponTabbedAccessoriesSelect" ) then
			CoD.WeaponOptionsUtility.StopDeathFxPreview( f1_arg0, f1_arg1 )
			SendCustomClientScriptMenuChangeNotify( f1_arg1, "WeaponDeathFxSelect", false )
		end
	end )
	DeathFxList.id = "DeathFxList"
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	self.__defaultFocus = DeathFxList
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local5 = self
	f1_local5 = DeathFxList
	if IsPC() then
		CoD.PCWidgetUtility.SetupContextualMenu( f1_local5, f1_arg1, "name", "", "" )
	end
	return self
end

CoD.WeaponDeathFxSelectInternal.__onClose = function ( f23_arg0 )
	f23_arg0.ItemInfoPanel:close()
	f23_arg0.DeathFxList:close()
	f23_arg0.XCamMouseControl:close()
end

