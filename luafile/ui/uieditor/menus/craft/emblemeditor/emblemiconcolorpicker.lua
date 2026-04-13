require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorcolorcontrols" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorcolormixercontainer" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorcolorswatchcontainer" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorcolortypeheader" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorgradient" )
require( "ui/uieditor/widgets/craft/emblemeditor/colorpicker/emblemeditorgradientcolorswatch" )
require( "ui/uieditor/widgets/craft/emblemeditor/emblemdrawwidgetnew" )
require( "ui/uieditor/widgets/craft/paintshop/paintshopcolorlayerinfo" )
require( "ui/uieditor/widgets/pc/craft/craftactionheader" )

CoD.EmblemIconColorPicker = InheritFrom( CoD.Menu )
LUI.createMenu.EmblemIconColorPicker = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "EmblemIconColorPicker", f1_arg0 )
	local f1_local1 = self
	CoD.CraftUtility.InitializeColorPickerProperties( f1_arg0 )
	CoD.CraftUtility.InitializeColorContainerFromSelection( self, f1_arg0 )
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	self:setClass( CoD.EmblemIconColorPicker )
	self.soundSet = "SelectColor"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local ScreenBkgd = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0.75 )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local colorGradientContainer = CoD.EmblemEditorGradient.new( f1_local1, f1_arg0, 0.5, 0.5, -440, 440, 0, 0, 731, 971 )
	self:addElement( colorGradientContainer )
	self.colorGradientContainer = colorGradientContainer
	
	local colorSwatchContainer = CoD.EmblemEditorColorSwatchContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -480, 480, 0, 0, 731, 971 )
	colorSwatchContainer:subscribeToGlobalModel( f1_arg0, "EmblemSelectedLayerColor", nil, function ( model )
		colorSwatchContainer:setModel( model, f1_arg0 )
	end )
	self:addElement( colorSwatchContainer )
	self.colorSwatchContainer = colorSwatchContainer
	
	local colorGradientSwatchContainer = CoD.EmblemEditorGradientColorSwatch.new( f1_local1, f1_arg0, 0.5, 0.5, -510, 510, 0, 0, 731, 971 )
	colorGradientSwatchContainer:subscribeToGlobalModel( f1_arg0, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientSwatchContainer:setModel( model, f1_arg0 )
	end )
	self:addElement( colorGradientSwatchContainer )
	self.colorGradientSwatchContainer = colorGradientSwatchContainer
	
	local colorMixerContainer = CoD.EmblemEditorColorMixerContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -440, 440, 0, 0, 731, 971 )
	colorMixerContainer:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.CraftUtility.IsEmblemEditorPropertyEqualToEnum( f1_arg0, "colorMode", Enum.CustomizationColorMode[0xC6A5FECEA7EADAA] ) and CoD.CraftUtility.IsEmblemEditorPropertyEqualTo( f1_arg0, "isGradientMode", 0 )
			end
		}
	} )
	local EmblemEditorColorTypeHeader0 = colorMixerContainer
	local colorGradientMixerContainer = colorMixerContainer.subscribeToModel
	local emblemEditorColorControls = DataSources.EmblemProperties.getModel( f1_arg0 )
	colorGradientMixerContainer( EmblemEditorColorTypeHeader0, emblemEditorColorControls.colorMode, function ( f5_arg0 )
		f1_local1:updateElementState( colorMixerContainer, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f5_arg0:get(),
			modelName = "colorMode"
		} )
	end, false )
	EmblemEditorColorTypeHeader0 = colorMixerContainer
	colorGradientMixerContainer = colorMixerContainer.subscribeToModel
	emblemEditorColorControls = DataSources.EmblemProperties.getModel( f1_arg0 )
	colorGradientMixerContainer( EmblemEditorColorTypeHeader0, emblemEditorColorControls.isGradientMode, function ( f6_arg0 )
		f1_local1:updateElementState( colorMixerContainer, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f6_arg0:get(),
			modelName = "isGradientMode"
		} )
	end, false )
	colorMixerContainer:subscribeToGlobalModel( f1_arg0, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorMixerContainer:setModel( model, f1_arg0 )
	end )
	self:addElement( colorMixerContainer )
	self.colorMixerContainer = colorMixerContainer
	
	colorGradientMixerContainer = CoD.EmblemEditorColorMixerContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -440, 440, 0, 0, 731, 971 )
	colorGradientMixerContainer:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.CraftUtility.IsEmblemEditorPropertyEqualToEnum( f1_arg0, "colorMode", Enum.CustomizationColorMode[0xC6A5FECEA7EADAA] ) and CoD.CraftUtility.IsEmblemEditorPropertyEqualTo( f1_arg0, "isGradientMode", 1 )
			end
		}
	} )
	emblemEditorColorControls = colorGradientMixerContainer
	EmblemEditorColorTypeHeader0 = colorGradientMixerContainer.subscribeToModel
	local PaintshopColorLayerInfo = DataSources.EmblemProperties.getModel( f1_arg0 )
	EmblemEditorColorTypeHeader0( emblemEditorColorControls, PaintshopColorLayerInfo.colorMode, function ( f9_arg0 )
		f1_local1:updateElementState( colorGradientMixerContainer, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f9_arg0:get(),
			modelName = "colorMode"
		} )
	end, false )
	emblemEditorColorControls = colorGradientMixerContainer
	EmblemEditorColorTypeHeader0 = colorGradientMixerContainer.subscribeToModel
	PaintshopColorLayerInfo = DataSources.EmblemProperties.getModel( f1_arg0 )
	EmblemEditorColorTypeHeader0( emblemEditorColorControls, PaintshopColorLayerInfo.isGradientMode, function ( f10_arg0 )
		f1_local1:updateElementState( colorGradientMixerContainer, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f10_arg0:get(),
			modelName = "isGradientMode"
		} )
	end, false )
	colorGradientMixerContainer:subscribeToGlobalModel( f1_arg0, "EmblemSelectedLayerEdittingColor", nil, function ( model )
		colorGradientMixerContainer:setModel( model, f1_arg0 )
	end )
	self:addElement( colorGradientMixerContainer )
	self.colorGradientMixerContainer = colorGradientMixerContainer
	
	EmblemEditorColorTypeHeader0 = CoD.EmblemEditorColorTypeHeader.new( f1_local1, f1_arg0, 0.5, 0.5, -510, 510, 0, 0, 714.5, 759.5 )
	EmblemEditorColorTypeHeader0:mergeStateConditions( {
		{
			stateName = "Gradient",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isGradientMode" ) and CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 1 )
			end
		},
		{
			stateName = "Solid",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualToEnum( f1_arg0, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0xE692F9BF30BA124] ) and CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		},
		{
			stateName = "Mixer",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualToEnum( f1_arg0, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0xC6A5FECEA7EADAA] ) and CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		}
	} )
	PaintshopColorLayerInfo = EmblemEditorColorTypeHeader0
	emblemEditorColorControls = EmblemEditorColorTypeHeader0.subscribeToModel
	local emblemDrawWidget = Engine.GetModelForController( f1_arg0 )
	emblemEditorColorControls( PaintshopColorLayerInfo, emblemDrawWidget["Emblem.EmblemProperties.isGradientMode"], function ( f15_arg0 )
		f1_local1:updateElementState( EmblemEditorColorTypeHeader0, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f15_arg0:get(),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end, false )
	PaintshopColorLayerInfo = EmblemEditorColorTypeHeader0
	emblemEditorColorControls = EmblemEditorColorTypeHeader0.subscribeToModel
	emblemDrawWidget = Engine.GetModelForController( f1_arg0 )
	emblemEditorColorControls( PaintshopColorLayerInfo, emblemDrawWidget["Emblem.EmblemProperties.colorMode"], function ( f16_arg0 )
		f1_local1:updateElementState( EmblemEditorColorTypeHeader0, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f16_arg0:get(),
			modelName = "Emblem.EmblemProperties.colorMode"
		} )
	end, false )
	self:addElement( EmblemEditorColorTypeHeader0 )
	self.EmblemEditorColorTypeHeader0 = EmblemEditorColorTypeHeader0
	
	emblemEditorColorControls = CoD.EmblemEditorColorControls.new( f1_local1, f1_arg0, 0.5, 0.5, 348, 768, 0, 0, 168, 408 )
	emblemEditorColorControls:mergeStateConditions( {
		{
			stateName = "Gradient",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 0 )
			end
		},
		{
			stateName = "Solid",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 1 ) and not CoD.CraftUtility.IsSelectedColorEmpty( element, f1_arg0 )
			end
		},
		{
			stateName = "NoColor",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 1 ) and CoD.CraftUtility.IsSelectedColorEmpty( element, f1_arg0 )
			end
		}
	} )
	emblemDrawWidget = emblemEditorColorControls
	PaintshopColorLayerInfo = emblemEditorColorControls.subscribeToModel
	local MenuFrame = Engine.GetModelForController( f1_arg0 )
	PaintshopColorLayerInfo( emblemDrawWidget, MenuFrame["Emblem.EmblemProperties.isGradientMode"], function ( f20_arg0 )
		f1_local1:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f20_arg0:get(),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end, false )
	emblemDrawWidget = emblemEditorColorControls
	PaintshopColorLayerInfo = emblemEditorColorControls.subscribeToModel
	MenuFrame = Engine.GetModelForController( f1_arg0 )
	PaintshopColorLayerInfo( emblemDrawWidget, MenuFrame["Emblem.EmblemProperties.isColor0NoColor"], function ( f21_arg0 )
		f1_local1:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f21_arg0:get(),
			modelName = "Emblem.EmblemProperties.isColor0NoColor"
		} )
	end, false )
	emblemDrawWidget = emblemEditorColorControls
	PaintshopColorLayerInfo = emblemEditorColorControls.subscribeToModel
	MenuFrame = Engine.GetModelForController( f1_arg0 )
	PaintshopColorLayerInfo( emblemDrawWidget, MenuFrame["Emblem.EmblemProperties.isColor1NoColor"], function ( f22_arg0 )
		f1_local1:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f22_arg0:get(),
			modelName = "Emblem.EmblemProperties.isColor1NoColor"
		} )
	end, false )
	emblemDrawWidget = emblemEditorColorControls
	PaintshopColorLayerInfo = emblemEditorColorControls.subscribeToModel
	MenuFrame = Engine.GetModelForController( f1_arg0 )
	PaintshopColorLayerInfo( emblemDrawWidget, MenuFrame["Emblem.EmblemProperties.colorNum"], function ( f23_arg0 )
		f1_local1:updateElementState( emblemEditorColorControls, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f23_arg0:get(),
			modelName = "Emblem.EmblemProperties.colorNum"
		} )
	end, false )
	self:addElement( emblemEditorColorControls )
	self.emblemEditorColorControls = emblemEditorColorControls
	
	PaintshopColorLayerInfo = CoD.PaintshopColorLayerInfo.new( f1_local1, f1_arg0, 0.5, 0.5, -347.5, 347.5, 0, 0, 92, 160 )
	PaintshopColorLayerInfo:mergeStateConditions( {
		{
			stateName = "GradientColorInfo",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualTo( f1_arg0, "Emblem.EmblemProperties.isGradientMode", 1 )
			end
		}
	} )
	MenuFrame = PaintshopColorLayerInfo
	emblemDrawWidget = PaintshopColorLayerInfo.subscribeToModel
	local f1_local13 = Engine.GetModelForController( f1_arg0 )
	emblemDrawWidget( MenuFrame, f1_local13["Emblem.EmblemProperties.isGradientMode"], function ( f25_arg0 )
		f1_local1:updateElementState( PaintshopColorLayerInfo, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f25_arg0:get(),
			modelName = "Emblem.EmblemProperties.isGradientMode"
		} )
	end, false )
	self:addElement( PaintshopColorLayerInfo )
	self.PaintshopColorLayerInfo = PaintshopColorLayerInfo
	
	emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( f1_local1, f1_arg0, 0.5, 0.5, -270, 270, 0, 0, 168, 708 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	MenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	MenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xE37FEB35F970A4C ) )
	MenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f26_local0 = model:get()
		if f26_local0 ~= nil then
			MenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f26_local0 ) )
		end
	end )
	MenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f27_local0 = nil
		if element.menuLoaded then
			f27_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f27_local0 = element.super:menuLoaded( event )
		end
		ShowHeaderIconOnly( f1_local1 )
		if not f27_local0 then
			f27_local0 = element:dispatchEventToChildren( event )
		end
		return f27_local0
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	f1_local13 = nil
	
	local actionsListPC = LUI.UIList.new( f1_local1, f1_arg0, 0, 0, nil, false, false, false, false )
	actionsListPC:setLeftRight( 0.5, 0.5, 390, 765 )
	actionsListPC:setTopBottom( 0, 0, 150, 700 )
	actionsListPC:setAlpha( 0 )
	actionsListPC:setWidgetType( CoD.CraftActionHeader )
	actionsListPC:setVerticalCount( 10 )
	actionsListPC:setSpacing( 0 )
	actionsListPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	actionsListPC:setDataSource( "CraftColorActionsPC" )
	actionsListPC:subscribeToGlobalModel( f1_arg0, "PerController", "Emblem.EmblemProperties.isGradientMode", function ( model )
		UpdateDataSource( self, actionsListPC, f1_arg0 )
	end )
	self:addElement( actionsListPC )
	self.actionsListPC = actionsListPC
	
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				local f29_local0
				if not IsGamepad( f1_arg0 ) then
					f29_local0 = IsPC()
				else
					f29_local0 = false
				end
				return f29_local0
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f30_arg0, f30_arg1 )
		f30_arg1.menu = f30_arg1.menu or f1_local1
		f1_local1:updateElementState( self, f30_arg1 )
	end )
	local f1_local15 = self
	local f1_local16 = self.subscribeToModel
	local f1_local17 = Engine.GetModelForController( f1_arg0 )
	f1_local16( f1_local15, f1_local17.LastInput, function ( f31_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f31_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetModelForController( f1_arg0 )
	f1_local16( f1_local15, f1_local17["Emblem.EmblemProperties.isGradientMode"], function ( f32_arg0, f32_arg1 )
		CoD.Menu.UpdateButtonShownState( f32_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f32_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f32_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA] )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetModelForController( f1_arg0 )
	f1_local16( f1_local15, f1_local17["Emblem.EmblemProperties.colorMode"], function ( f33_arg0, f33_arg1 )
		CoD.Menu.UpdateButtonShownState( f33_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f33_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A] )
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if CoD.ModelUtility.IsModelValueEqualTo( f34_arg2, "Emblem.EmblemProperties.isGradientMode", 0 ) and IsPC() then
			GoBack( self, f34_arg2 )
			ClearMenuSavedState( f34_arg1 )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f34_arg2, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			CoD.CraftUtility.EmblemEditor_RevertLayerChanges( self, f34_arg2 )
			GoBack( self, f34_arg2 )
			ClearMenuSavedState( f34_arg1 )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f34_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) and CoD.ModelUtility.IsModelValueEqualToEnum( f34_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			GoBack( self, f34_arg2 )
			ClearMenuSavedState( f34_arg1 )
			CoD.CraftUtility.EmblemGradient_BackFromGradientPicker( self, f34_arg0, f34_arg2 )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f34_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) and not CoD.ModelUtility.IsModelValueEqualToEnum( f34_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			CoD.CraftUtility.EmblemGradient_BackFromColorPicker( self, f34_arg0, f34_arg1, f34_arg2 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		if CoD.ModelUtility.IsModelValueEqualTo( f35_arg2, "Emblem.EmblemProperties.isGradientMode", 0 ) and IsPC() then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f35_arg2, "Emblem.EmblemProperties.isGradientMode", 0 ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f35_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) and CoD.ModelUtility.IsModelValueEqualToEnum( f35_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueEqualTo( f35_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) and not CoD.ModelUtility.IsModelValueEqualToEnum( f35_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x493152B20AE4F58], nil, function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
		CoD.CraftUtility.EmblemChooseColor_UpdateOpacityByStep( self, f36_arg0, -0.01, f36_arg2, f36_arg1 )
		return true
	end, function ( f37_arg0, f37_arg1, f37_arg2 )
		CoD.Menu.SetButtonLabel( f37_arg1, Enum.LUIButton[0x493152B20AE4F58], 0x0, nil, nil )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x49A252B20B48936], nil, function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		CoD.CraftUtility.EmblemChooseColor_UpdateOpacityByStep( self, f38_arg0, 0.01, f38_arg2, f38_arg1 )
		return true
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x49A252B20B48936], 0x0, nil, nil )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], "E", function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		if not CoD.ModelUtility.IsModelValueEqualToEnum( f40_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			CoD.CraftUtility.EmblemChooseColor_ToggleColorMode( self, f40_arg0, f40_arg2, f40_arg1 )
			PlaySoundSetSound( self, "toggle_color_picker" )
			return true
		else
			
		end
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		if not CoD.ModelUtility.IsModelValueEqualToEnum( f41_arg2, "Emblem.EmblemProperties.colorMode", Enum.CustomizationColorMode[0x8F7F4A0A6A3678B] ) then
			CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, "E" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "G", function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		CoD.CraftUtility.EmblemChooseColor_ToggleGradientMode( self, f42_arg0, f42_arg2, f42_arg1 )
		return true
	end, function ( f43_arg0, f43_arg1, f43_arg2 )
		CoD.Menu.SetButtonLabel( f43_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, nil, "G" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xD2F467A6C6DA1AC], nil, function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		if CoD.ModelUtility.IsModelValueEqualTo( f44_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.CraftUtility.EmblemGradient_UpdateAngleByStep( self, f44_arg0, -1, f44_arg2 )
			return true
		else
			
		end
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		if CoD.ModelUtility.IsModelValueEqualTo( f45_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x820DDD869ABBFAA], nil, function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
		if CoD.ModelUtility.IsModelValueEqualTo( f46_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.CraftUtility.EmblemGradient_UpdateAngleByStep( self, f46_arg0, 1, f46_arg2 )
			return true
		else
			
		end
	end, function ( f47_arg0, f47_arg1, f47_arg2 )
		if CoD.ModelUtility.IsModelValueEqualTo( f47_arg2, "Emblem.EmblemProperties.isGradientMode", 1 ) then
			CoD.Menu.SetButtonLabel( f47_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	colorGradientContainer.id = "colorGradientContainer"
	colorSwatchContainer.id = "colorSwatchContainer"
	colorGradientSwatchContainer.id = "colorGradientSwatchContainer"
	colorMixerContainer.id = "colorMixerContainer"
	colorGradientMixerContainer.id = "colorGradientMixerContainer"
	if CoD.isPC then
		emblemDrawWidget.id = "emblemDrawWidget"
	end
	MenuFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		MenuFrame.id = "MenuFrame"
	end
	actionsListPC.id = "actionsListPC"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = colorGradientSwatchContainer
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.EmblemIconColorPicker.__resetProperties = function ( f48_arg0 )
	f48_arg0.actionsListPC:completeAnimation()
	f48_arg0.emblemEditorColorControls:completeAnimation()
	f48_arg0.actionsListPC:setAlpha( 0 )
	f48_arg0.emblemEditorColorControls:setAlpha( 1 )
end

CoD.EmblemIconColorPicker.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f49_arg0, f49_arg1 )
			f49_arg0:__resetProperties()
			f49_arg0:setupElementClipCounter( 0 )
		end
	},
	PC = {
		DefaultClip = function ( f50_arg0, f50_arg1 )
			f50_arg0:__resetProperties()
			f50_arg0:setupElementClipCounter( 2 )
			f50_arg0.emblemEditorColorControls:completeAnimation()
			f50_arg0.emblemEditorColorControls:setAlpha( 0 )
			f50_arg0.clipFinished( f50_arg0.emblemEditorColorControls )
			f50_arg0.actionsListPC:completeAnimation()
			f50_arg0.actionsListPC:setAlpha( 1 )
			f50_arg0.clipFinished( f50_arg0.actionsListPC )
		end
	}
}
CoD.EmblemIconColorPicker.__onClose = function ( f51_arg0 )
	f51_arg0.colorGradientContainer:close()
	f51_arg0.colorSwatchContainer:close()
	f51_arg0.colorGradientSwatchContainer:close()
	f51_arg0.colorMixerContainer:close()
	f51_arg0.colorGradientMixerContainer:close()
	f51_arg0.EmblemEditorColorTypeHeader0:close()
	f51_arg0.emblemEditorColorControls:close()
	f51_arg0.PaintshopColorLayerInfo:close()
	f51_arg0.emblemDrawWidget:close()
	f51_arg0.MenuFrame:close()
	f51_arg0.actionsListPC:close()
end

