require( "ui/uieditor/widgets/customgames/customgames_optioncategorybutton" )
require( "ui/uieditor/widgets/codcaster/codcastersettingssidebarloadoutsettingscontainer" )

CoD.CodCasterSettingsSideBarDisplaySettings = InheritFrom( LUI.UIElement )
CoD.CodCasterSettingsSideBarDisplaySettings.__defaultWidth = 960
CoD.CodCasterSettingsSideBarDisplaySettings.__defaultHeight = 1080
CoD.CodCasterSettingsSideBarDisplaySettings.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CodCasterSettingsSideBarDisplaySettings )
	self.id = "CodCasterSettingsSideBarDisplaySettings"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local OptionsListPC = nil
	
	OptionsListPC = CoD.CodCasterSettingsSideBarLoadoutSettingsContainer.new( f1_arg0, f1_arg1, 0, 0, 260, 960, 0, 0, 11, 800 )
	OptionsListPC:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( OptionsListPC, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		CoD.CodCasterUtility.SetFocusToFirstSelectableItemInButtonList( self, self.OptionsListPC )
		SetControllerModelValue( f3_arg2, "customGamesEdit", false )
		SetFocusToElement( self, "OptionCategoryListPC", f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, "ESCAPE" )
		return true
	end, false )
	self:addElement( OptionsListPC )
	self.OptionsListPC = OptionsListPC
	
	local f1_local2 = nil
	
	local OptionCategoryListPC = LUI.UIList.new( f1_arg0, f1_arg1, 8, 0, nil, false, false, false, false )
	OptionCategoryListPC:setLeftRight( 0, 0, 0, 250 )
	OptionCategoryListPC:setTopBottom( 0, 0, 11, 593 )
	OptionCategoryListPC:setWidgetType( CoD.CustomGames_OptionCategoryButton )
	OptionCategoryListPC:setVerticalCount( 5 )
	OptionCategoryListPC:setSpacing( 8 )
	OptionCategoryListPC:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	OptionCategoryListPC:setDataSource( "CodCasterDisplaySettingsCategories" )
	OptionCategoryListPC:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f5_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local f1_local4 = OptionCategoryListPC
	local f1_local5 = OptionCategoryListPC.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6.LastInput, function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	OptionCategoryListPC:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_arg0:AddButtonCallbackFunction( OptionCategoryListPC, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsMouse( f8_arg2 ) then
			SetControllerModelValue( f8_arg2, "customGamesEdit", true )
			SetElementState( self, f8_arg0, f8_arg2, "Selected" )
			SetFocusToElement( self, "OptionsListPC", f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsMouse( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( OptionCategoryListPC )
	self.OptionCategoryListPC = OptionCategoryListPC
	
	f1_local5 = nil
	f1_local5 = LUI.UIElement.createFake()
	self.OptionsList = f1_local5
	f1_local4 = nil
	f1_local4 = LUI.UIElement.createFake()
	self.OptionCategoryList = f1_local4
	OptionsListPC:linkToElementModel( OptionCategoryListPC, "optionsListDatasource", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			OptionsListPC.ButtonList:setDataSource( f10_local0 )
		end
	end )
	f1_local5:linkToElementModel( f1_local4, "optionsListDatasource", true, function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			f1_local5.ButtonList:setDataSource( f11_local0 )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "EditSettings",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueTrue( f1_arg1, "customGamesEdit" ) and not IsPC()
			end
		},
		{
			stateName = "DefaultPC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	local f1_local7 = self
	f1_local6 = self.subscribeToModel
	local f1_local8 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local7, f1_local8.customGamesEdit, function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "customGamesEdit"
		} )
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "Y", function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		if not IsRepeatButtonPress( f15_arg3 ) then
			ToggleControllerModelValueNumber( f15_arg2, "CodCaster.showSettingsSideBar" )
			CoD.CodCasterUtility.SetFocusToFirstSelectableItemInButtonList( self, self.OptionsList )
			SetFocusToElement( self, "OptionCategoryList", f15_arg2 )
			CoD.GridAndListUtility.SetFocusToFirstSelectableItem( self.OptionCategoryList )
			MakeElementNotFocusable( self, "OptionsList", f15_arg2 )
			SaveShoutcasterSettings( self, f15_arg0, f15_arg2 )
			GoBack( self, f15_arg2 )
			SetLuiKeyCatcher( false )
			return true
		else
			
		end
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		if not IsRepeatButtonPress( nil ) then
			CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x70A9FDC87CD3D48, nil, "Y" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( f1_arg1, "customGamesEdit", false )
	end )
	self.__on_menuOpened_self = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		local f18_local0 = self
		if not IsPC() then
			DelaySetFocusToElement( self, "OptionCategoryList", f18_arg1, 5 )
		elseif IsPC() then
			DelaySetFocusToElement( self, "OptionCategoryListPC", f18_arg1, 5 )
		end
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_self )
	if CoD.isPC then
		OptionsListPC.id = "OptionsListPC"
	end
	OptionCategoryListPC.id = "OptionCategoryListPC"
	f1_local5.id = "OptionsList"
	f1_local4.id = "OptionCategoryList"
	self.__defaultFocus = f1_local4
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local6 = self
	SetElementCanBeNavigatedTo( OptionCategoryListPC, false )
	SetElementCanBeNavigatedTo( f1_local4, false )
	return self
end

CoD.CodCasterSettingsSideBarDisplaySettings.__resetProperties = function ( f20_arg0 )
	f20_arg0.OptionsList:completeAnimation()
	f20_arg0.OptionCategoryList:completeAnimation()
	f20_arg0.OptionsList:setAlpha( 1 )
	f20_arg0.OptionsList.OptionDesc.OptionTitle:setAlpha( 1 )
	f20_arg0.OptionsList.OptionDesc.OptionDesc:setAlpha( 1 )
	f20_arg0.OptionCategoryList:setAlpha( 1 )
end

CoD.CodCasterSettingsSideBarDisplaySettings.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 0 )
			f21_arg0.OptionsList:completeAnimation()
			f21_arg0.OptionsList.OptionDesc.OptionTitle:completeAnimation()
			f21_arg0.OptionsList.OptionDesc.OptionDesc:completeAnimation()
			f21_arg0.OptionsList:setAlpha( 0.12 )
			f21_arg0.OptionsList.OptionDesc.OptionTitle:setAlpha( 0 )
			f21_arg0.OptionsList.OptionDesc.OptionDesc:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.OptionsList )
		end
	},
	EditSettings = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 0 )
			f22_arg0.OptionCategoryList:completeAnimation()
			f22_arg0.OptionCategoryList:setAlpha( 0.12 )
			f22_arg0.clipFinished( f22_arg0.OptionCategoryList )
		end
	},
	DefaultPC = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.CodCasterSettingsSideBarDisplaySettings.__onClose = function ( f24_arg0 )
	f24_arg0.__on_close_removeOverrides()
	f24_arg0.OptionsListPC:close()
	f24_arg0.OptionsList:close()
	f24_arg0.OptionCategoryListPC:close()
	f24_arg0.OptionCategoryList:close()
end

