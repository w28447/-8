require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubpreviewmoment" )
require( "ui/uieditor/menus/mp/specialisthub/mpspecialisthubweapons" )
require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlinedsafeareacontainer" )
require( "ui/uieditor/widgets/mp/specialisthub/hubstatsbutton" )
require( "ui/uieditor/widgets/mp/specialisthub/hubtoptab" )
require( "ui/uieditor/widgets/mp/specialisthub/hubweaponsbutton" )
require( "ui/uieditor/widgets/specialist/specialistpersonalizationbuttonoption" )
require( "ui/uieditor/widgets/bumperbuttonwithkeymouse" )
require( "ui/uieditor/widgets/emptyfocusable" )
require( "ui/uieditor/widgets/pc/utility/xcammousecontrol" )

CoD.MPSpecialistHUBInspect = InheritFrom( CoD.Menu )
LUI.createMenu.MPSpecialistHUBInspect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "MPSpecialistHUBInspect", f1_arg0 )
	local f1_local1 = self
	CoD.PlayerRoleUtility[0x2B307D12327547E]( f1_arg0 )
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, true )
	CoD.BaseUtility.CreateControllerModel( f1_arg0, "PositionLoadoutList.SelectedCharacterIndex" )
	self:setClass( CoD.MPSpecialistHUBInspect )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	local XCamMouseControl = nil
	
	XCamMouseControl = CoD.XCamMouseControl.new( f1_local1, f1_arg0, 0.5, 0.5, -375, 375, 0.5, 0.5, -465, 235 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local BackingFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	BackingFrame.CommonHeader.BGSceneBlur:setAlpha( 1 )
	BackingFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x46EFDF3FB2763B5 ) )
	BackingFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			BackingFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( BackingFrame )
	self.BackingFrame = BackingFrame
	
	local RightArrow = nil
	
	RightArrow = CoD.BumperButtonWithKeyMouse.new( f1_local1, f1_arg0, 0.5, 0.5, 196.5, 263.5, 0.5, 0.5, -531, -486 )
	RightArrow:mergeStateConditions( {
		{
			stateName = "Gamepad",
			condition = function ( menu, element, event )
				return IsGamepad( f1_arg0 ) and AlwaysFalse()
			end
		}
	} )
	RightArrow:appendEventHandler( "input_source_changed", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_local1
		f1_local1:updateElementState( RightArrow, f4_arg1 )
	end )
	local MouseWheelFocusable = RightArrow
	local LeftArrow = RightArrow.subscribeToModel
	local SpecialistName = Engine.GetModelForController( f1_arg0 )
	LeftArrow( MouseWheelFocusable, SpecialistName.LastInput, function ( f5_arg0 )
		f1_local1:updateElementState( RightArrow, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f5_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	RightArrow.KeyMouseImage:setImage( RegisterImage( 0x5E74D00B45D12B6 ) )
	RightArrow.ControllerImage:setImage( RegisterImage( 0x5E74D00B45D12B6 ) )
	RightArrow:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( RightArrow, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		CoD.GridAndListUtility.NavigateGridItemInChild( self.SpecialListTab, f7_arg2, "positions", true )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( RightArrow )
	self.RightArrow = RightArrow
	
	LeftArrow = nil
	
	LeftArrow = CoD.BumperButtonWithKeyMouse.new( f1_local1, f1_arg0, 0.5, 0.5, -263.5, -196.5, 0.5, 0.5, -531, -486 )
	LeftArrow:mergeStateConditions( {
		{
			stateName = "Gamepad",
			condition = function ( menu, element, event )
				return IsGamepad( f1_arg0 ) and AlwaysFalse()
			end
		}
	} )
	LeftArrow:appendEventHandler( "input_source_changed", function ( f10_arg0, f10_arg1 )
		f10_arg1.menu = f10_arg1.menu or f1_local1
		f1_local1:updateElementState( LeftArrow, f10_arg1 )
	end )
	SpecialistName = LeftArrow
	MouseWheelFocusable = LeftArrow.subscribeToModel
	local JobTitle = Engine.GetModelForController( f1_arg0 )
	MouseWheelFocusable( SpecialistName, JobTitle.LastInput, function ( f11_arg0 )
		f1_local1:updateElementState( LeftArrow, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f11_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	LeftArrow:setZRot( 180 )
	LeftArrow.KeyMouseImage:setImage( RegisterImage( 0x5E74D00B45D12B6 ) )
	LeftArrow.ControllerImage:setImage( RegisterImage( 0x5E74D00B45D12B6 ) )
	LeftArrow:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f12_local0
	end )
	f1_local1:AddButtonCallbackFunction( LeftArrow, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		CoD.GridAndListUtility.NavigateGridItemInChild( self.SpecialListTab, f13_arg2, "positions", false )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( LeftArrow )
	self.LeftArrow = LeftArrow
	
	MouseWheelFocusable = nil
	
	MouseWheelFocusable = CoD.emptyFocusable.new( f1_local1, f1_arg0, 0.5, 0.5, -212, 212, 0, 0, 21, 51 )
	MouseWheelFocusable:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f15_local0
	end )
	f1_local1:AddButtonCallbackFunction( MouseWheelFocusable, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		CoD.GridAndListUtility.NavigateGridItemInChild( self.SpecialListTab, f16_arg2, "positions", false )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( MouseWheelFocusable, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		CoD.GridAndListUtility.NavigateGridItemInChild( self.SpecialListTab, f18_arg2, "positions", true )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
		return false
	end, false )
	self:addElement( MouseWheelFocusable )
	self.MouseWheelFocusable = MouseWheelFocusable
	
	SpecialistName = LUI.UIText.new( 0.5, 0.5, -191, 191, 0, 0, 801, 891 )
	SpecialistName:setRGB( 0.92, 0.89, 0.72 )
	SpecialistName:setAlpha( 0.7 )
	SpecialistName:setZoom( 3 )
	SpecialistName:setTTF( "ttmussels_regular" )
	SpecialistName:setLetterSpacing( 10 )
	SpecialistName:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( SpecialistName )
	self.SpecialistName = SpecialistName
	
	JobTitle = LUI.UIText.new( 0.5, 0.5, -171, 171, 0, 0, 781, 801 )
	JobTitle:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	JobTitle:setZoom( 3 )
	JobTitle:setTTF( "ttmussels_regular" )
	JobTitle:setLetterSpacing( 10 )
	JobTitle:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( JobTitle )
	self.JobTitle = JobTitle
	
	local HubStatsButton = CoD.HubStatsButton.new( f1_local1, f1_arg0, 0.5, 0.5, 420, 813, 0, 0, 638.5, 815.5 )
	self:addElement( HubStatsButton )
	self.HubStatsButton = HubStatsButton
	
	local HubWeaponsButton = CoD.HubWeaponsButton.new( f1_local1, f1_arg0, 0.5, 0.5, 420, 813, 0, 0, 222.5, 601.5 )
	HubWeaponsButton:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f20_local0
	end )
	f1_local1:AddButtonCallbackFunction( HubWeaponsButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		PlaySoundAlias( "uin_main_edit" )
		OpenOverlay( self, "MPSpecialistHUBWeapons", f21_arg2, {
			_model = f21_arg0:getModel()
		} )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
		return true
	end, false )
	self:addElement( HubWeaponsButton )
	self.HubWeaponsButton = HubWeaponsButton
	
	local options = LUI.UIList.new( f1_local1, f1_arg0, 13, 0, nil, false, false, false, false )
	options:setLeftRight( 0.5, 0.5, -813, -420 )
	options:setTopBottom( 0, 0, 222.5, 537.5 )
	options:setWidgetType( CoD.SpecialistPersonalizationButtonOption )
	options:setVerticalCount( 4 )
	options:setSpacing( 13 )
	options:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	options:setDataSource( "MPSpecialistHUBOptions" )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f23_local0
	end )
	f1_local1:AddButtonCallbackFunction( options, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		PlaySoundAlias( "uin_toggle_generic" )
		ProcessListAction( self, f24_arg0, f24_arg2, f24_arg1 )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
		return true
	end, false )
	options:subscribeToGlobalModel( f1_arg0, "PerController", "PositionLoadoutList.SelectedCharacterIndex", function ( model )
		local f26_local0 = options
		UpdateElementDataSource( self, "options" )
	end )
	self:addElement( options )
	self.options = options
	
	local SpecialListTab = CoD.HubTopTab.new( f1_local1, f1_arg0, 0, 0, 660, 1260, 0, 0, 17, 53 )
	self:addElement( SpecialListTab )
	self.SpecialListTab = SpecialListTab
	
	local CommonIdentityWidgetStreamlinedSafeAreaContainer = CoD.CommonIdentityWidgetStreamlinedSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 1, 1921, 0, 0, 0, 1080 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f27_local0 = nil
		if element.menuLoaded then
			f27_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f27_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f27_local0 then
			f27_local0 = element:dispatchEventToChildren( event )
		end
		return f27_local0
	end )
	self:addElement( CommonIdentityWidgetStreamlinedSafeAreaContainer )
	self.CommonIdentityWidgetStreamlinedSafeAreaContainer = CommonIdentityWidgetStreamlinedSafeAreaContainer
	
	SpecialistName:linkToElementModel( SpecialListTab.positions, "name", true, function ( model )
		local f28_local0 = model:get()
		if f28_local0 ~= nil then
			SpecialistName:setText( LocalizeToUpperString( f28_local0 ) )
		end
	end )
	JobTitle:linkToElementModel( SpecialListTab.positions, "jobTitle", true, function ( model )
		local f29_local0 = model:get()
		if f29_local0 ~= nil then
			JobTitle:setText( LocalizeToUpperString( f29_local0 ) )
		end
	end )
	HubStatsButton:linkToElementModel( SpecialListTab.positions, nil, false, function ( model )
		HubStatsButton:setModel( model, f1_arg0 )
	end )
	HubWeaponsButton:linkToElementModel( SpecialListTab.positions, nil, false, function ( model )
		HubWeaponsButton:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
		GoBack( self, f32_arg2 )
		return true
	end, function ( f33_arg0, f33_arg1, f33_arg2 )
		CoD.Menu.SetButtonLabel( f33_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "ui_contextual_2", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		PlaySoundAlias( "uin_main_edit" )
		OpenOverlay( self, "MPSpecialistHUBPreviewMoment", f34_arg2 )
		return true
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x52FB29ED3A3CA79, nil, "ui_contextual_2" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
		UploadStats( self, f1_arg0 )
		SaveLoadoutGeneric( f1_arg0 )
	end )
	if CoD.isPC then
		XCamMouseControl.id = "XCamMouseControl"
	end
	BackingFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		BackingFrame.id = "BackingFrame"
	end
	if CoD.isPC then
		RightArrow.id = "RightArrow"
	end
	if CoD.isPC then
		LeftArrow.id = "LeftArrow"
	end
	if CoD.isPC then
		MouseWheelFocusable.id = "MouseWheelFocusable"
	end
	HubStatsButton.id = "HubStatsButton"
	HubWeaponsButton.id = "HubWeaponsButton"
	options.id = "options"
	SpecialListTab.id = "SpecialListTab"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = options
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local14 = self
	CoD.FreeCursorUtility.RetriggerCursorPosition( f1_local1, f1_arg0 )
	CoD.PlayerRoleUtility.UpdateUsingController( f1_arg0 )
	DisableKeyboardNavigationByElement( RightArrow )
	DisableKeyboardNavigationByElement( LeftArrow )
	f1_local14 = MouseWheelFocusable
	SetElementProperty( f1_local14, "_yieldFocus", nil )
	DisableKeyboardNavigationByElement( f1_local14 )
	SizeToSafeArea( SpecialListTab, f1_arg0 )
	return self
end

CoD.MPSpecialistHUBInspect.__resetProperties = function ( f37_arg0 )
	f37_arg0.HubWeaponsButton:completeAnimation()
	f37_arg0.HubStatsButton:completeAnimation()
	f37_arg0.options:completeAnimation()
	f37_arg0.HubWeaponsButton:setAlpha( 1 )
	f37_arg0.HubStatsButton:setAlpha( 1 )
	f37_arg0.options:setAlpha( 1 )
end

CoD.MPSpecialistHUBInspect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f38_arg0, f38_arg1 )
			f38_arg0:__resetProperties()
			f38_arg0:setupElementClipCounter( 3 )
			local f38_local0 = function ( f39_arg0 )
				local f39_local0 = function ( f40_arg0 )
					f40_arg0:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f40_arg0:setAlpha( 1 )
					f40_arg0:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
				end
				
				f38_arg0.HubStatsButton:beginAnimation( 350 )
				f38_arg0.HubStatsButton:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.HubStatsButton:registerEventHandler( "transition_complete_keyframe", f39_local0 )
			end
			
			f38_arg0.HubStatsButton:completeAnimation()
			f38_arg0.HubStatsButton:setAlpha( 0 )
			f38_local0( f38_arg0.HubStatsButton )
			local f38_local1 = function ( f41_arg0 )
				local f41_local0 = function ( f42_arg0 )
					f42_arg0:beginAnimation( 149 )
					f42_arg0:setAlpha( 1 )
					f42_arg0:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
				end
				
				f38_arg0.HubWeaponsButton:beginAnimation( 200 )
				f38_arg0.HubWeaponsButton:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.HubWeaponsButton:registerEventHandler( "transition_complete_keyframe", f41_local0 )
			end
			
			f38_arg0.HubWeaponsButton:completeAnimation()
			f38_arg0.HubWeaponsButton:setAlpha( 0 )
			f38_local1( f38_arg0.HubWeaponsButton )
			local f38_local2 = function ( f43_arg0 )
				local f43_local0 = function ( f44_arg0 )
					f44_arg0:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x5193EA7825DC097] )
					f44_arg0:setAlpha( 1 )
					f44_arg0:registerEventHandler( "transition_complete_keyframe", f38_arg0.clipFinished )
				end
				
				f38_arg0.options:beginAnimation( 50 )
				f38_arg0.options:registerEventHandler( "interrupted_keyframe", f38_arg0.clipInterrupted )
				f38_arg0.options:registerEventHandler( "transition_complete_keyframe", f43_local0 )
			end
			
			f38_arg0.options:completeAnimation()
			f38_arg0.options:setAlpha( 0 )
			f38_local2( f38_arg0.options )
		end
	}
}
CoD.MPSpecialistHUBInspect.__onClose = function ( f45_arg0 )
	f45_arg0.SpecialistName:close()
	f45_arg0.JobTitle:close()
	f45_arg0.HubStatsButton:close()
	f45_arg0.HubWeaponsButton:close()
	f45_arg0.XCamMouseControl:close()
	f45_arg0.BackingFrame:close()
	f45_arg0.RightArrow:close()
	f45_arg0.LeftArrow:close()
	f45_arg0.MouseWheelFocusable:close()
	f45_arg0.options:close()
	f45_arg0.SpecialListTab:close()
	f45_arg0.CommonIdentityWidgetStreamlinedSafeAreaContainer:close()
end

