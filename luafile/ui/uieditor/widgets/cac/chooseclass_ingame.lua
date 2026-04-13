require( "ui/uieditor/widgets/cac/attachmentloadoutclasslistitem" )
require( "ui/uieditor/widgets/cac/customclasslistbutton" )
require( "ui/uieditor/widgets/cac/loadoutclassitem" )
require( "ui/uieditor/widgets/cac/loadoutclassitemequipment" )
require( "ui/uieditor/widgets/cac/loadoutclassitemsecondary" )

CoD.ChooseClass_InGame = InheritFrom( LUI.UIElement )
CoD.ChooseClass_InGame.__defaultWidth = 1920
CoD.ChooseClass_InGame.__defaultHeight = 1080
CoD.ChooseClass_InGame.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.SetInGameMenuSessionMode( f1_arg0 )
	self:setClass( CoD.ChooseClass_InGame )
	self.id = "ChooseClass_InGame"
	self.soundSet = "Loadout"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local primary = CoD.LoadoutClassItem.new( f1_arg0, f1_arg1, 0.5, 0.5, -633, -277, 0, 0, 305, 509 )
	primary:setZoom( 90 )
	self:addElement( primary )
	self.primary = primary
	
	local secondary = CoD.LoadoutClassItemSecondary.new( f1_arg0, f1_arg1, 0.5, 0.5, 7, 381, 0, 0, 305, 615 )
	secondary:setZoom( 90 )
	self:addElement( secondary )
	self.secondary = secondary
	
	local killstreak = CoD.LoadoutClassItemEquipment.new( f1_arg0, f1_arg1, 0.5, 0.5, 391, 604, 0, 0, 305, 475 )
	killstreak:setZoom( 90 )
	self:addElement( killstreak )
	self.killstreak = killstreak
	
	local customClasssList = LUI.UIList.new( f1_arg0, f1_arg1, 5, 0, nil, false, false, false, false )
	customClasssList:setLeftRight( 0.5, 0.5, -763, -593 )
	customClasssList:setTopBottom( 0, 0, 318, 513 )
	customClasssList:setZoom( 90 )
	customClasssList:setWidgetType( CoD.CustomClassListButton )
	customClasssList:setVerticalCount( 5 )
	customClasssList:setSpacing( 5 )
	customClasssList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	customClasssList:setDataSource( "ChooseClass_InGame" )
	customClasssList:linkToElementModel( customClasssList, "disabled", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	customClasssList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		SetMenuCustomClassData( f1_arg0, element, f1_arg1 )
		return f3_local0
	end )
	customClasssList:registerEventHandler( "lose_list_focus", function ( element, event )
		local f4_local0 = nil
		CoD.CACUtility.SetActiveListItemToSelectedClass( f1_arg1, f1_arg0, element )
		return f4_local0
	end )
	customClasssList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f5_local0
	end )
	f1_arg0:AddButtonCallbackFunction( customClasssList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if IsPerControllerTablePropertyValue( f6_arg2, "isInMobileArmory", true ) then
			ChangeClass( f6_arg1, self, f6_arg0, f6_arg2 )
			LockInput( self, f6_arg2, false )
			Close( self, f6_arg2 )
			SetPerControllerTableProperty( f6_arg2, "isInMobileArmory", false )
			return true
		elseif IsCurrentMenu( f6_arg1, "PositionDraft" ) then
			ChangeClass( f6_arg1, self, f6_arg0, f6_arg2 )
			SetMenuState( f6_arg1, "CharacterSelected", f6_arg2 )
			return true
		elseif not IsDisabled( f6_arg0, f6_arg2 ) then
			ChangeClass( f6_arg1, self, f6_arg0, f6_arg2 )
			CloseStartMenu( f6_arg1, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if IsPerControllerTablePropertyValue( f7_arg2, "isInMobileArmory", true ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], nil )
			return true
		elseif IsCurrentMenu( f7_arg1, "PositionDraft" ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], nil )
			return true
		elseif not IsDisabled( f7_arg0, f7_arg2 ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, Enum[0xBEBDBAEEB3ECCCA][0xB6372335C630AD3], nil )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_customClasssList = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		CoD.CACUtility.SetActiveListItemToSelectedClass( f8_arg1, f8_arg2, customClasssList )
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_customClasssList )
	self:addElement( customClasssList )
	self.customClasssList = customClasssList
	
	local customClassName = LUI.UIText.new( 0.5, 0.5, -633, -200, 0, 0, 214, 246 )
	customClassName:setZoom( 80 )
	customClassName:setTTF( "ttmussels_demibold" )
	customClassName:setLetterSpacing( 14 )
	customClassName:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	customClassName:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( customClassName )
	self.customClassName = customClassName
	
	local primaryAttachments = LUI.GridLayout.new( f1_arg0, f1_arg1, false, 0, 0, 10, 0, nil, nil, false, false, false, false )
	primaryAttachments:setLeftRight( 0.5, 0.5, -633, -43 )
	primaryAttachments:setTopBottom( 0, 0, 620, 700 )
	primaryAttachments:setZoom( 90 )
	primaryAttachments:setWidgetType( CoD.AttachmentLoadoutClassListItem )
	primaryAttachments:setHorizontalCount( 5 )
	primaryAttachments:setSpacing( 10 )
	primaryAttachments:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( primaryAttachments )
	self.primaryAttachments = primaryAttachments
	
	local secondaryAttachments = LUI.GridLayout.new( f1_arg0, f1_arg1, false, 0, 0, 10, 0, nil, nil, false, false, false, false )
	secondaryAttachments:setLeftRight( 0.5, 0.5, 7, 357 )
	secondaryAttachments:setTopBottom( 0, 0, 620, 700 )
	secondaryAttachments:setZoom( 90 )
	secondaryAttachments:setWidgetType( CoD.AttachmentLoadoutClassListItem )
	secondaryAttachments:setHorizontalCount( 3 )
	secondaryAttachments:setSpacing( 10 )
	secondaryAttachments:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( secondaryAttachments )
	self.secondaryAttachments = secondaryAttachments
	
	primary:linkToElementModel( customClasssList, "primary", false, function ( model )
		primary:setModel( model, f1_arg1 )
	end )
	secondary:linkToElementModel( customClasssList, "secondary", false, function ( model )
		secondary:setModel( model, f1_arg1 )
	end )
	customClassName:linkToElementModel( customClasssList, "customClassName", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			customClassName:setText( ConvertToUpperString( f11_local0 ) )
		end
	end )
	primaryAttachments:linkToElementModel( customClasssList, "primaryattachments", true, function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			primaryAttachments:setDataSource( f12_local0 )
		end
	end )
	secondaryAttachments:linkToElementModel( customClasssList, "secondaryattachments", true, function ( model )
		local f13_local0 = model:get()
		if f13_local0 ~= nil then
			secondaryAttachments:setDataSource( f13_local0 )
		end
	end )
	local f1_local8 = self
	local f1_local9 = self.subscribeToModel
	local f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["lobbyRoot.lobbyNav"], function ( f14_arg0, f14_arg1 )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x493152B20AE4F58] )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x49A252B20B48936] )
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if IsCurrentMenu( f15_arg1, "PositionDraft" ) then
			SetMenuState( f15_arg1, "CharacterSelected", f15_arg2 )
			return true
		else
			SendMenuResponse( self, "ChooseClass_InGame", "cancel", f15_arg2 )
			LockInput( self, f15_arg2, false )
			ClearMenuSavedState( f15_arg1 )
			PlaySoundSetSound( self, "menu_go_back" )
			Close( self, f15_arg2 )
			return true
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x493152B20AE4F58], nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if IsMultiplayer() and not IsCACCustomClassCountDefault( f17_arg2 ) then
			chooseClass_TabMPClassesListLeft( self, f17_arg2 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if IsMultiplayer() and not IsCACCustomClassCountDefault( f18_arg2 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x493152B20AE4F58], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x49A252B20B48936], nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsMultiplayer() and not IsCACCustomClassCountDefault( f19_arg2 ) then
			chooseClass_TabMPClassesListRight( self, f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if IsMultiplayer() and not IsCACCustomClassCountDefault( f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x49A252B20B48936], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	primary.id = "primary"
	secondary.id = "secondary"
	killstreak.id = "killstreak"
	customClasssList.id = "customClasssList"
	primaryAttachments.id = "primaryAttachments"
	secondaryAttachments.id = "secondaryAttachments"
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_customClasssList )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ChooseClass_InGame.__onClose = function ( f22_arg0 )
	f22_arg0.__on_close_removeOverrides()
	f22_arg0.primary:close()
	f22_arg0.secondary:close()
	f22_arg0.customClassName:close()
	f22_arg0.primaryAttachments:close()
	f22_arg0.secondaryAttachments:close()
	f22_arg0.killstreak:close()
	f22_arg0.customClasssList:close()
end

