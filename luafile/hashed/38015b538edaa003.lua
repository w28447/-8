require( "ui/uieditor/widgets/clans/clanoptionswidget" )

CoD.ClanOptions = InheritFrom( CoD.Menu )
LUI.createMenu.ClanOptions = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "ClanOptions", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	self:setClass( CoD.ClanOptions )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local BlackfadeBlur = LUI.UIImage.new( 0, 1.13, -5, 5, 0, 1, -5, 5 )
	BlackfadeBlur:setRGB( 0, 0, 0 )
	BlackfadeBlur:setAlpha( 0.6 )
	self:addElement( BlackfadeBlur )
	self.BlackfadeBlur = BlackfadeBlur
	
	local ClanOptionsWidget = CoD.ClanOptionsWidget.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	ClanOptionsWidget.CurrentClassName:setText( LocalizeToUpperString( 0x2FA47140D97F89D ) )
	ClanOptionsWidget:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( ClanOptionsWidget )
	self.ClanOptionsWidget = ClanOptionsWidget
	
	self.ClanOptionsWidget:linkToElementModel( self, "hintText", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ClanOptionsWidget.ClassOptionDesc:setText( Engine[0xF9F1239CFD921FE]( f3_local0 ) )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f4_local0 = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", element, f1_arg0, event )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ui_contextual_1", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		GoBack( self, f5_arg2 )
		ClearMenuSavedState( f5_arg1 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, "ui_contextual_1" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "goBack", function ( element, controller )
		if CoD.ModelUtility.IsControllerModelValueNonEmptyString( controller, "RenameClassText" ) then
			CoD.CACUtility.RenameCustomClass( self, element, controller )
		end
	end )
	ClanOptionsWidget.id = "ClanOptionsWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.ClanOptions.__onClose = function ( f8_arg0 )
	f8_arg0.ClanOptionsWidget:close()
end

