require( "ui/uieditor/widgets/startmenu/options/startmenuoptionsmainframe" )
require( "ui/uieditor/widgets/systemoverlays/systemoverlay_layout_foregroundmultilinetext" )
require( "ui/uieditor/widgets/systemoverlays/featureoverlay_button" )

CoD.systemOverlay_DeletePaintjobFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_DeletePaintjobFrame.__defaultWidth = 1920
CoD.systemOverlay_DeletePaintjobFrame.__defaultHeight = 290
CoD.systemOverlay_DeletePaintjobFrame.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.systemOverlay_DeletePaintjobFrame )
	self.id = "systemOverlay_DeletePaintjobFrame"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local WCPaintjobIconExtraCamRender = LUI.UIImage.new( 0, 0, 96.5, 610.5, 0.5, 0.5, -120, 108 )
	WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index = function ( f2_arg0 )
		local f2_local0 = f2_arg0:get()
		if f2_local0 ~= nil then
			WCPaintjobIconExtraCamRender:setupWCPaintjobIconExtraCamRender( GetPaintshopExtraCamParameters( f1_arg1, f2_local0 ) )
		end
	end
	
	WCPaintjobIconExtraCamRender:subscribeToGlobalModel( f1_arg1, "SelectedPaintjob", "paintjobSlot", WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index )
	WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index_FullPath = function ()
		local f3_local0 = DataSources.SelectedPaintjob.getModel( f1_arg1 )
		f3_local0 = f3_local0.paintjobSlot
		if f3_local0 then
			WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index( f3_local0 )
		end
	end
	
	self:addElement( WCPaintjobIconExtraCamRender )
	self.WCPaintjobIconExtraCamRender = WCPaintjobIconExtraCamRender
	
	local Frame = CoD.StartMenuOptionsMainFrame.new( f1_arg0, f1_arg1, 0, 0, 91, 616, 0.5, 0.5, -125, 113 )
	Frame:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	Frame:setAlpha( 0.04 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( f1_arg0, f1_arg1, 0.5, 0.5, -324, 421, 0, 0, 58.5, 88.5 )
	text:setRGB( ColorSet.T8__OFF__GRAY.r, ColorSet.T8__OFF__GRAY.g, ColorSet.T8__OFF__GRAY.b )
	text:setScale( LanguageOverrideNumber( "japanese", 0.85, 1, 1 ) )
	text:linkToElementModel( self, "description", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			text.text:setText( CoD.BaseUtility.LocalizeIfXHash( f4_local0 ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local title = LUI.UIText.new( 0.5, 0.5, -324, 948, 0, 0, 14, 59 )
	title:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	title:setTTF( "ttmussels_demibold" )
	title:setLetterSpacing( 6 )
	title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	title:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	title:linkToElementModel( self, "title", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			title:setText( LocalizeToUpperString( CoD.BaseUtility.LocalizeIfXHash( f5_local0 ) ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local categoryTypeImage = LUI.UIImage.new( 0, 0, 582, 606, 0, 0, 30, 54 )
	categoryTypeImage:setRGB( ColorSet.T8__BEIGE__HEADER.r, ColorSet.T8__BEIGE__HEADER.g, ColorSet.T8__BEIGE__HEADER.b )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( f6_local0 ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local f1_local6 = nil
	
	local options = LUI.UIList.new( f1_arg0, f1_arg1, 15, 0, nil, true, false, false, false )
	options:setLeftRight( 0, 0, 636, 1051 )
	options:setTopBottom( 1, 1, -132.5, -65.5 )
	options:setAutoScaleContent( true )
	options:setWidgetType( CoD.featureOverlay_Button )
	options:setHorizontalCount( 2 )
	options:setSpacing( 15 )
	options:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	options:linkToElementModel( self, "listDatasource", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			options:setDataSource( f7_local0 )
		end
	end )
	options:linkToElementModel( options, "disabled", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	options:appendEventHandler( "input_source_changed", function ( f9_arg0, f9_arg1 )
		f9_arg1.menu = f9_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f9_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local f1_local8 = options
	local f1_local9 = options.subscribeToModel
	local f1_local10 = Engine.GetModelForController( f1_arg1 )
	f1_local9( f1_local8, f1_local10.LastInput, function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( options, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) and IsMouseOrKeyboard( f12_arg2 ) then
			ProcessListAction( self, f12_arg0, f12_arg2, f12_arg1 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsDisabled( f13_arg0, f13_arg2 ) and IsMouseOrKeyboard( f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( options )
	self.options = options
	
	WCPaintjobIconExtraCamRender:linkToElementModel( self, "weaponIndex", true, WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index_FullPath )
	WCPaintjobIconExtraCamRender:linkToElementModel( self, "paintjobSlot", true, WCPaintjobIconExtraCamRender.__Paintjob_Slot_And_Index_FullPath )
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsMouseOrKeyboard( f1_arg1 )
			end
		}
	} )
	self:appendEventHandler( "input_source_changed", function ( f15_arg0, f15_arg1 )
		f15_arg1.menu = f15_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f15_arg1 )
	end )
	f1_local8 = self
	f1_local9 = self.subscribeToModel
	f1_local10 = Engine.GetModelForController( f1_arg1 )
	f1_local9( f1_local8, f1_local10.LastInput, function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	options.id = "options"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.systemOverlay_DeletePaintjobFrame.__resetProperties = function ( f17_arg0 )
	f17_arg0.options:completeAnimation()
	f17_arg0.options:setAlpha( 1 )
end

CoD.systemOverlay_DeletePaintjobFrame.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.options:completeAnimation()
			f18_arg0.options:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.options )
		end
	},
	PC = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.systemOverlay_DeletePaintjobFrame.__onClose = function ( f20_arg0 )
	f20_arg0.WCPaintjobIconExtraCamRender:close()
	f20_arg0.Frame:close()
	f20_arg0.text:close()
	f20_arg0.title:close()
	f20_arg0.categoryTypeImage:close()
	f20_arg0.options:close()
end

