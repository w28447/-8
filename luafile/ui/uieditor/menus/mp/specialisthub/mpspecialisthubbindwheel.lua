require( "ui/uieditor/widgets/mp/specialisthub/mpspecialisthubbindwheel_safeareacontainer" )
require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsbackground" )

CoD.MPSpecialistHUBBindWheel = InheritFrom( CoD.Menu )
LUI.createMenu.MPSpecialistHUBBindWheel = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "MPSpecialistHUBBindWheel", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	CoD.HUDUtility.SetupQuickSprayModels( f1_arg0, f1_local1 )
	SetProperty( self, "disableKeyboardNavigation", true )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "MPSpecialistHUBBindWheel.NoBackground", false )
	SetCharacterModeToCurrentSessionMode( self, self, f1_arg0 )
	local Blur = SetMenuProperty
	local Background = f1_local1
	local framewidget = "_model"
	local MPSpecialistHUBBindWheelSafeAreaContainer = Engine.GetModelForController( f1_arg0 )
	Blur( Background, framewidget, MPSpecialistHUBBindWheelSafeAreaContainer:create( "MPSpecialistHUBBindWheel" ) )
	CoD.BaseUtility.InitControllerModel( f1_arg0, "MPSpecialistHUBBindWheel.CanSelectWedge", false )
	self:setClass( CoD.MPSpecialistHUBBindWheel )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	Blur = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Blur:setRGB( 0.08, 0.08, 0.08 )
	Blur:setAlpha( 0 )
	Blur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	Blur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	Background = CoD.StartMenuOptionsBackground.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	framewidget = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
	framewidget:setLeftRight( 0.5, 0.5, -960, 960 )
	framewidget:setTopBottom( 0.5, 0.5, -540, 540 )
	LUI.OverrideFunction_CallOriginalFirst( framewidget, "createFrameWidget", function ( element, controller )
		UpdateAllMenuButtonPrompts( f1_local1, f1_arg0 )
	end )
	self:addElement( framewidget )
	self.framewidget = framewidget
	
	MPSpecialistHUBBindWheelSafeAreaContainer = CoD.MPSpecialistHUBBindWheel_SafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	MPSpecialistHUBBindWheelSafeAreaContainer.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x87EAA7A4C9006D2 ) )
	MPSpecialistHUBBindWheelSafeAreaContainer:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			MPSpecialistHUBBindWheelSafeAreaContainer.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f3_local0 ) )
		end
	end )
	self.__on_menuOpened_MPSpecialistHUBBindWheelSafeAreaContainer = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		local f4_local0 = MPSpecialistHUBBindWheelSafeAreaContainer
		if not IsPC() then
			SizeToSafeArea( f4_local0, f4_arg1 )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_MPSpecialistHUBBindWheelSafeAreaContainer )
	self:addElement( MPSpecialistHUBBindWheelSafeAreaContainer )
	self.MPSpecialistHUBBindWheelSafeAreaContainer = MPSpecialistHUBBindWheelSafeAreaContainer
	
	framewidget:linkToElementModel( MPSpecialistHUBBindWheelSafeAreaContainer.CommonTabBarLeftAlign.Tabs.grid, "tabWidget", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			framewidget:changeFrameWidget( f5_local0 )
		end
	end )
	local f1_local6 = self
	local f1_local7 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg0 )
	f1_local7( f1_local6, f1_local8["MPSpecialistHUBBindWheel.CanSelectWedge"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	self:registerEventHandler( "occlusion_change", function ( element, event )
		local f7_local0 = nil
		if element.OcclusionChange then
			f7_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f7_local0 = element.super:OcclusionChange( event )
		end
		if IsEventPropertyEqualTo( event, "occluded", true ) then
			MenuUnhideFreeCursor( f1_local1, f1_arg0 )
		else
			MenuHidesFreeCursor( f1_local1, f1_arg0 )
		end
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		PlaySoundAlias( "uin_list_close_generic" )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsDesiredFrameWidget( f10_arg2, self.framewidget, "MPSpecialistHUBBindWheelInternal" ) and CoD.ModelUtility.IsControllerModelValueTrue( f10_arg2, "MPSpecialistHUBBindWheel.CanSelectWedge" ) then
			CoD.PlayerRoleUtility.OpenGestureTagMenu( f10_arg1, f10_arg2 )
			PlaySoundAlias( "uin_radial_confirm" )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if IsDesiredFrameWidget( f11_arg2, self.framewidget, "MPSpecialistHUBBindWheelInternal" ) and CoD.ModelUtility.IsControllerModelValueTrue( f11_arg2, "MPSpecialistHUBBindWheel.CanSelectWedge" ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x571F08AD84807E0], nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if MenuPropertyIsTrue( f12_arg1, "_allowsQuickSelect" ) and IsDpadButton( f12_arg3 ) and IsDesiredFrameWidget( f12_arg2, self.framewidget, "MPSpecialistHUBBindWheelInternal" ) then
			CoD.PlayerRoleUtility.OpenQuickSlotGestureTagMenu( f12_arg1, f12_arg2 )
			PlaySoundAlias( "uin_radial_confirm" )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if MenuPropertyIsTrue( f13_arg1, "_allowsQuickSelect" ) and IsDpadButton( nil ) and IsDesiredFrameWidget( f13_arg2, self.framewidget, "MPSpecialistHUBBindWheelInternal" ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SaveLoadoutGeneric( f1_arg0 )
		ClearMenuSavedState( f1_local1 )
	end )
	framewidget.id = "framewidget"
	MPSpecialistHUBBindWheelSafeAreaContainer.id = "MPSpecialistHUBBindWheelSafeAreaContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = framewidget
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_MPSpecialistHUBBindWheelSafeAreaContainer )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.MPSpecialistHUBBindWheel.__onClose = function ( f16_arg0 )
	f16_arg0.__on_close_removeOverrides()
	f16_arg0.framewidget:close()
	f16_arg0.Background:close()
	f16_arg0.MPSpecialistHUBBindWheelSafeAreaContainer:close()
end

