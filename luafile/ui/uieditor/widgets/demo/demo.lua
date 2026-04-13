require( "ui/uieditor/widgets/demo/demoplaybackcontrols" )
require( "ui/uieditor/widgets/demo/democontextpanel" )
require( "ui/uieditor/widgets/demo/demoicons" )
require( "x64:8a2bfd7fd77a149" )

CoD.Demo = InheritFrom( LUI.UIElement )
CoD.Demo.__defaultWidth = 1920
CoD.Demo.__defaultHeight = 1080
CoD.Demo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Demo )
	self.id = "Demo"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local emptyFocusableNoCursorUpdate = nil
	
	emptyFocusableNoCursorUpdate = CoD.emptyFocusableNoCursorUpdate.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	emptyFocusableNoCursorUpdate:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsGamepadOrKeyboardNavigation( f1_arg1 ) and AlwaysFalse()
			end
		}
	} )
	emptyFocusableNoCursorUpdate:appendEventHandler( "input_source_changed", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		f1_arg0:updateElementState( emptyFocusableNoCursorUpdate, f3_arg1 )
	end )
	local f1_local2 = emptyFocusableNoCursorUpdate
	local f1_local3 = emptyFocusableNoCursorUpdate.subscribeToModel
	local DemoContextPanelPC = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, DemoContextPanelPC.LastInput, function ( f4_arg0 )
		f1_arg0:updateElementState( emptyFocusableNoCursorUpdate, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	self:addElement( emptyFocusableNoCursorUpdate )
	self.emptyFocusableNoCursorUpdate = emptyFocusableNoCursorUpdate
	
	f1_local3 = nil
	f1_local3 = LUI.UIElement.createFake()
	self.emptyFocusable = f1_local3
	f1_local2 = nil
	self.DemoContextPanel = LUI.UIElement.createFake()
	DemoContextPanelPC = nil
	
	DemoContextPanelPC = CoD.DemoContextPanel.new( f1_arg0, f1_arg1, 0.5, 0.5, -920, -620, 1, 1, -322, -262 )
	self:addElement( DemoContextPanelPC )
	self.DemoContextPanelPC = DemoContextPanelPC
	
	local DemoIcons = CoD.DemoIcons.new( f1_arg0, f1_arg1, 0, 0, 516.5, 1373.5, 0, 0, 1022, 1222 )
	DemoIcons:setAlpha( 0 )
	self:addElement( DemoIcons )
	self.DemoIcons = DemoIcons
	
	local f1_local6 = nil
	f1_local6 = LUI.UIElement.createFake()
	self.DemoPlaybackControls = f1_local6
	local DemoPlaybackControlsPC = nil
	
	DemoPlaybackControlsPC = CoD.DemoPlaybackControls.new( f1_arg0, f1_arg1, 0.5, 0.5, -375, 375, 1, 1, -332, -196 )
	self:addElement( DemoPlaybackControlsPC )
	self.DemoPlaybackControlsPC = DemoPlaybackControlsPC
	
	self:mergeStateConditions( {
		{
			stateName = "HideControls",
			condition = function ( menu, element, event )
				local f5_local0
				if not CoD.ModelUtility.IsGlobalModelValueTrue( "demo.drawDemoControls" ) then
					f5_local0 = not IsDemoContextHighlightReelMode()
				else
					f5_local0 = false
				end
				return f5_local0
			end
		},
		{
			stateName = "InactiveControls",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueTrue( "demo.drawDemoControls" ) and CoD.ModelUtility.IsGlobalModelValueTrue( "demo.showChooseModeSidebar" )
			end
		},
		{
			stateName = "ClipPreview",
			condition = function ( menu, element, event )
				return IsDemoClipPreviewRunning() and not IsDemoContextHighlightReelMode()
			end
		},
		{
			stateName = "LightmanColorPicker",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalModelValueTrue( "demo.drawDemoControls" ) and IsInLightmanColorPicker( f1_arg1 )
			end
		},
		{
			stateName = "HighlightReel",
			condition = function ( menu, element, event )
				return IsDemoContextHighlightReelMode()
			end
		}
	} )
	local f1_local8 = self
	local f1_local9 = self.subscribeToModel
	local f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.drawDemoControls"], function ( f10_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "demo.drawDemoControls"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.contextMode"], function ( f11_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "demo.contextMode"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.showChooseModeSidebar"], function ( f12_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "demo.showChooseModeSidebar"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.clipState"], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "demo.clipState"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.showLightmanColorPicker"], function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "demo.showLightmanColorPicker"
		} )
	end, false )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["demo.editingLightmanMarker"], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "demo.editingLightmanMarker"
		} )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f16_arg0, f16_arg1 )
		f16_arg1.menu = f16_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
	end )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetModelForController( f1_arg1 )
	f1_local9( f1_local8, f1_local10.LastInput, function ( f17_arg0, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xC083113BC81F23F] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x6CE8023188D673F] )
	end, false )
	self:registerEventHandler( "input_source_changed", function ( element, event )
		local f18_local0 = nil
		if IsMouseOrKeyboard( f1_arg1 ) and IsElementPropertyValue( element, "demoShowMouse", true ) and not CoD.PCUtility.IsCurrentHudOccluded( f1_arg0, f1_arg1 ) then
			EnableMouseLockInputBinding( f1_arg0, f1_arg1, true, true )
		end
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsMouseOrKeyboard( f19_arg2 ) and not CoD.BaseUtility.IsButtonHoldFinished( f19_arg3 ) then
			CoD.DemoUtility.CrossButtonAction( self, f19_arg0, f19_arg2, f19_arg1 )
			return true
		elseif not IsMouseOrKeyboard( f19_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f19_arg3 ) then
			CoD.DemoUtility.CrossButtonHoldAction( self, f19_arg0, f19_arg2, f19_arg1 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsMouseOrKeyboard( f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return false
		elseif not IsMouseOrKeyboard( f20_arg2 ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		if not IsMouseOrKeyboard( f21_arg2 ) and not CoD.BaseUtility.IsButtonHoldFinished( f21_arg3 ) then
			CoD.DemoUtility.SquareButtonAction( self, f21_arg0, f21_arg2, f21_arg1 )
			return true
		elseif not IsMouseOrKeyboard( f21_arg2 ) and CoD.BaseUtility.IsButtonHoldFinished( f21_arg3 ) then
			CoD.DemoUtility.SquareButtonHoldAction( self, f21_arg0, f21_arg2, f21_arg1 )
			return true
		else
			
		end
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		if not IsMouseOrKeyboard( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return false
		elseif not IsMouseOrKeyboard( f22_arg2 ) then
			CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, Enum[0xBEBDBAEEB3ECCCA][0x71B04FAC5BE0E35] | 400 << Enum[0xBEBDBAEEB3ECCCA][0x76ADD225D738C93], nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], nil, function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		if not IsMouseOrKeyboard( f23_arg2 ) then
			CoD.DemoUtility.TriangleButtonAction( self, f23_arg0, f23_arg2, f23_arg1 )
			return true
		else
			
		end
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		if not IsMouseOrKeyboard( f24_arg2 ) then
			CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if not IsMouseOrKeyboard( f25_arg2 ) then
			CoD.DemoUtility.CircleButtonAction( self, f25_arg0, f25_arg2, f25_arg1 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if not IsMouseOrKeyboard( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x493152B20AE4F58], "C", function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		CoD.DemoUtility.LeftBumperAction( self, f27_arg0, f27_arg2, f27_arg1 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton[0x493152B20AE4F58], 0x0, nil, "C" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x49A252B20B48936], "SPACE", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		CoD.DemoUtility.RightBumperAction( self, f29_arg0, f29_arg2, f29_arg1 )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton[0x49A252B20B48936], 0x0, nil, "SPACE" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x6CE8023188D673F], nil, function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if not IsMouseOrKeyboard( f31_arg2 ) then
			CoD.DemoUtility.LeftStickAction( self, f31_arg0, f31_arg2, f31_arg1 )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if not IsMouseOrKeyboard( f32_arg2 ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton[0x6CE8023188D673F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x29E5695FF1401AD], "F", function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		CoD.DemoUtility.RightStickAction( self, f33_arg0, f33_arg2, f33_arg1 )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, "F" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF], "1", function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		CoD.DemoUtility.DPadLeftAction( self, f35_arg0, f35_arg2, f35_arg1 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton[0x57783F8DA4AAEF], 0x0, nil, "1" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x571F08AD84807E0], "2", function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		CoD.DemoUtility.DPadRightAction( self, f37_arg0, f37_arg2, f37_arg1 )
		return true
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, "2" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], "3", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		CoD.DemoUtility.DPadUpAction( self, f39_arg0, f39_arg2, f39_arg1 )
		return true
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], 0x0, nil, "3" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A], "4", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		CoD.DemoUtility.DPadDownAction( self, f41_arg0, f41_arg2, f41_arg1 )
		return true
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton[0xD4C15FE32148D3A], 0x0, nil, "4" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE2", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		CoD.DemoUtility.DemoToggleDemoHud( self, f43_arg0, f43_arg2, "", f43_arg1 )
		return true
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE2" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "R", function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		CoD.DemoUtility.CrossButtonAction( self, f45_arg0, f45_arg2, f45_arg1 )
		return true
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "R" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "V", function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		CoD.DemoUtility.CrossButtonHoldAction( self, f47_arg0, f47_arg2, f47_arg1 )
		return true
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "V" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "G", function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		CoD.DemoUtility.SquareButtonAction( self, f49_arg0, f49_arg2, f49_arg1 )
		return true
	end, function ( f50_arg0, f50_arg1, f50_arg2 )
		CoD.Menu.SetButtonLabel( f50_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "G" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "X", function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		CoD.DemoUtility.TriangleButtonAction( self, f51_arg0, f51_arg2, f51_arg1 )
		return true
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "X" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "Q", function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		CoD.DemoUtility.UpdateDemoTimeScaleDelta( self, self.DemoPlaybackControlsPC, f53_arg2, "-0.2", f53_arg1 )
		return true
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "Q" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "E", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		CoD.DemoUtility.UpdateDemoTimeScaleDelta( self, self.DemoPlaybackControlsPC, f55_arg2, "1.0", f55_arg1 )
		return true
	end, function ( f56_arg0, f56_arg1, f56_arg2 )
		CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "E" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "LSHIFT", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		CoD.DemoUtility.CircleButtonAction( self, f57_arg0, f57_arg2, f57_arg1 )
		return true
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "LSHIFT" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f59_arg2, f59_arg3, f59_arg4 )
		if IsMouseOrKeyboard( controller ) and IsElementPropertyValue( element, "demoShowMouse", true ) and not CoD.PCUtility.IsCurrentHudOccluded( f1_arg0, controller ) then
			EnableMouseLockInputBinding( f1_arg0, controller, true, true )
		elseif IsMouseOrKeyboard( controller ) and IsElementPropertyValue( element, "demoShowMouse", false ) and not CoD.PCUtility.IsCurrentHudOccluded( f1_arg0, controller ) then
			EnableMouseLockInputBinding( f1_arg0, controller, false, true )
			SetFocusToElement( self, "emptyFocusableNoCursorUpdate", controller )
		elseif IsMouseOrKeyboard( controller ) and CoD.PCUtility.IsCurrentHudOccluded( f1_arg0, controller ) then
			EnableMouseLockInputBinding( f1_arg0, controller, false, true )
		end
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "LeftTrigger.amount", function ( model )
		local f60_local0 = self
		if not IsMouseOrKeyboard( f1_arg1 ) then
			CoD.DemoUtility.LeftTriggerAction( self, f60_local0, f1_arg1, f1_arg0 )
		end
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "RightTrigger.amount", function ( model )
		local f61_local0 = self
		if not IsMouseOrKeyboard( f1_arg1 ) then
			CoD.DemoUtility.RightTriggerAction( self, f61_local0, f1_arg1, f1_arg0 )
		end
	end )
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "demo.showChooseModeSidebar", function ( model )
		local f62_local0 = self
		if not CoD.ModelUtility.IsGlobalModelValueTrue( "demo.showChooseModeSidebar" ) and IsMouseOrKeyboard( f1_arg1 ) then
			SetFocusToElement( self, "emptyFocusableNoCursorUpdate", f1_arg1 )
		end
	end )
	if CoD.isPC then
		emptyFocusableNoCursorUpdate.id = "emptyFocusableNoCursorUpdate"
	end
	f1_local3.id = "emptyFocusable"
	if CoD.isPC then
		DemoContextPanelPC.id = "DemoContextPanelPC"
	end
	f1_local6.id = "DemoPlaybackControls"
	if CoD.isPC then
		DemoPlaybackControlsPC.id = "DemoPlaybackControlsPC"
	end
	self.__defaultFocus = f1_local3
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local9 = self
	if IsPC() then
		SetElementProperty( f1_local9, "demoShowMouse", true )
		SetMenuProperty( f1_arg0, "m_inputDisabled", false )
		CoD.DemoUtility.InitPlayerPauseModel()
		CoD.DemoUtility.SubscribeDemoToScoreboardVisibility( self, self.emptyFocusableNoCursorUpdate, f1_arg0, f1_arg1 )
		DelaySetFocusToElement( self, "emptyFocusableNoCursorUpdate", f1_arg1, 150 )
	end
	return self
end

CoD.Demo.__resetProperties = function ( f63_arg0 )
	f63_arg0.DemoPlaybackControls:completeAnimation()
	f63_arg0.DemoContextPanel:completeAnimation()
	f63_arg0.DemoContextPanelPC:completeAnimation()
	f63_arg0.DemoPlaybackControlsPC:completeAnimation()
	f63_arg0.DemoPlaybackControls:setAlpha( 1 )
	f63_arg0.DemoContextPanel:setAlpha( 1 )
	f63_arg0.DemoContextPanelPC:setAlpha( 1 )
	f63_arg0.DemoPlaybackControlsPC:setAlpha( 1 )
end

CoD.Demo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f64_arg0, f64_arg1 )
			f64_arg0:__resetProperties()
			f64_arg0:setupElementClipCounter( 0 )
			f64_arg0.DemoContextPanel:completeAnimation()
			f64_arg0.DemoContextPanel:setAlpha( 1 )
			f64_arg0.clipFinished( f64_arg0.DemoContextPanel )
			f64_arg0.DemoPlaybackControls:completeAnimation()
			f64_arg0.DemoPlaybackControls:setAlpha( 1 )
			f64_arg0.clipFinished( f64_arg0.DemoPlaybackControls )
		end
	},
	HideControls = {
		DefaultClip = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 2 )
			f65_arg0.DemoContextPanel:completeAnimation()
			f65_arg0.DemoContextPanel:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.DemoContextPanel )
			f65_arg0.DemoContextPanelPC:completeAnimation()
			f65_arg0.DemoContextPanelPC:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.DemoContextPanelPC )
			f65_arg0.DemoPlaybackControls:completeAnimation()
			f65_arg0.DemoPlaybackControls:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.DemoPlaybackControls )
			f65_arg0.DemoPlaybackControlsPC:completeAnimation()
			f65_arg0.DemoPlaybackControlsPC:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.DemoPlaybackControlsPC )
		end
	},
	InactiveControls = {
		DefaultClip = function ( f66_arg0, f66_arg1 )
			f66_arg0:__resetProperties()
			f66_arg0:setupElementClipCounter( 2 )
			f66_arg0.DemoContextPanel:completeAnimation()
			f66_arg0.DemoContextPanel:setAlpha( 0.3 )
			f66_arg0.clipFinished( f66_arg0.DemoContextPanel )
			f66_arg0.DemoContextPanelPC:completeAnimation()
			f66_arg0.DemoContextPanelPC:setAlpha( 0.4 )
			f66_arg0.clipFinished( f66_arg0.DemoContextPanelPC )
			f66_arg0.DemoPlaybackControls:completeAnimation()
			f66_arg0.DemoPlaybackControls:setAlpha( 0.4 )
			f66_arg0.clipFinished( f66_arg0.DemoPlaybackControls )
			f66_arg0.DemoPlaybackControlsPC:completeAnimation()
			f66_arg0.DemoPlaybackControlsPC:setAlpha( 0.4 )
			f66_arg0.clipFinished( f66_arg0.DemoPlaybackControlsPC )
		end
	},
	ClipPreview = {
		DefaultClip = function ( f67_arg0, f67_arg1 )
			f67_arg0:__resetProperties()
			f67_arg0:setupElementClipCounter( 1 )
			f67_arg0.DemoContextPanel:completeAnimation()
			f67_arg0.DemoContextPanel:setAlpha( 1 )
			f67_arg0.clipFinished( f67_arg0.DemoContextPanel )
			f67_arg0.DemoPlaybackControls:completeAnimation()
			f67_arg0.DemoPlaybackControls:setAlpha( 0 )
			f67_arg0.clipFinished( f67_arg0.DemoPlaybackControls )
			f67_arg0.DemoPlaybackControlsPC:completeAnimation()
			f67_arg0.DemoPlaybackControlsPC:setAlpha( 0 )
			f67_arg0.clipFinished( f67_arg0.DemoPlaybackControlsPC )
		end
	},
	LightmanColorPicker = {
		DefaultClip = function ( f68_arg0, f68_arg1 )
			f68_arg0:__resetProperties()
			f68_arg0:setupElementClipCounter( 1 )
			f68_arg0.DemoContextPanel:completeAnimation()
			f68_arg0.DemoContextPanel:setAlpha( 1 )
			f68_arg0.clipFinished( f68_arg0.DemoContextPanel )
			f68_arg0.DemoPlaybackControls:completeAnimation()
			f68_arg0.DemoPlaybackControls:setAlpha( 0.4 )
			f68_arg0.clipFinished( f68_arg0.DemoPlaybackControls )
			f68_arg0.DemoPlaybackControlsPC:completeAnimation()
			f68_arg0.DemoPlaybackControlsPC:setAlpha( 0.4 )
			f68_arg0.clipFinished( f68_arg0.DemoPlaybackControlsPC )
		end
	},
	HighlightReel = {
		DefaultClip = function ( f69_arg0, f69_arg1 )
			f69_arg0:__resetProperties()
			f69_arg0:setupElementClipCounter( 2 )
			f69_arg0.DemoContextPanel:completeAnimation()
			f69_arg0.DemoContextPanel:setAlpha( 0 )
			f69_arg0.clipFinished( f69_arg0.DemoContextPanel )
			f69_arg0.DemoContextPanelPC:completeAnimation()
			f69_arg0.DemoContextPanelPC:setAlpha( 0 )
			f69_arg0.clipFinished( f69_arg0.DemoContextPanelPC )
			f69_arg0.DemoPlaybackControls:completeAnimation()
			f69_arg0.DemoPlaybackControls:setAlpha( 0 )
			f69_arg0.clipFinished( f69_arg0.DemoPlaybackControls )
			f69_arg0.DemoPlaybackControlsPC:completeAnimation()
			f69_arg0.DemoPlaybackControlsPC:setAlpha( 0 )
			f69_arg0.clipFinished( f69_arg0.DemoPlaybackControlsPC )
		end
	}
}
CoD.Demo.__onClose = function ( f70_arg0 )
	f70_arg0.emptyFocusableNoCursorUpdate:close()
	f70_arg0.emptyFocusable:close()
	f70_arg0.DemoContextPanel:close()
	f70_arg0.DemoContextPanelPC:close()
	f70_arg0.DemoIcons:close()
	f70_arg0.DemoPlaybackControls:close()
	f70_arg0.DemoPlaybackControlsPC:close()
end

