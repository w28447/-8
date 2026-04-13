require( "ui/uieditor/menus/fileshare/popups/fileshareoptions" )
require( "ui/uieditor/widgets/fileshare/fileshareselectoritemwide" )
require( "ui/uieditor/widgets/fileshare/filesharespinner" )
require( "ui/uieditor/widgets/fileshare/selectedfilminformation" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )

CoD.FileshareCategoryContentList = InheritFrom( LUI.UIElement )
CoD.FileshareCategoryContentList.__defaultWidth = 1552
CoD.FileshareCategoryContentList.__defaultHeight = 830
CoD.FileshareCategoryContentList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.CreateGlobalModel( "FileshareRoot.SelectedFileID" )
	self:setClass( CoD.FileshareCategoryContentList )
	self.id = "FileshareCategoryContentList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local contentList = LUI.UIList.new( f1_arg0, f1_arg1, 15, 0, nil, false, false, false, false )
	contentList:setLeftRight( 0, 0, 0, 1011 )
	contentList:setTopBottom( 0, 0, 0, 789 )
	contentList:setWidgetType( CoD.FileshareSelectorItemWide )
	contentList:setHorizontalCount( 3 )
	contentList:setVerticalCount( 4 )
	contentList:setSpacing( 15 )
	contentList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	contentList:setVerticalCounter( CoD.verticalCounter )
	contentList:setDataSource( "FilesharePublishedList" )
	contentList:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		if FileshareIsCommunityMode( element, f1_arg1 ) then
			
		else
			
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	contentList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		if not ListElementHasElements( self.contentList ) then
			SetLoseFocusToElement( self, "contentList", f1_arg1 )
		else
			CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
			CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x22361E23588705A] )
		end
		return f3_local0
	end )
	contentList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f4_local0 = nil
		if CoD.FileshareUtility.IsCategoryFilm( f1_arg1, element ) then
			FileshareSetSelectedItem( self, element, f1_arg1, "" )
			CoD.FileshareUtility.FileshareDownloadSummary( element, f1_arg1 )
			MediaManagerClearDisplay( self, element, f1_arg1 )
		elseif CoD.FileshareUtility.IsCategoryScreenshot( f1_arg1, element ) then
			FileshareSetSelectedItem( self, element, f1_arg1, "" )
			CoD.FileshareUtility.FileshareDownloadScreenshot( f1_arg1 )
			MediaManagerClearDisplay( self, element, f1_arg1 )
		elseif CoD.FileshareUtility.IsCategoryClip( f1_arg1, element ) then
			FileshareSetSelectedItem( self, element, f1_arg1, "" )
			MediaManagerClearDisplay( self, element, f1_arg1 )
		end
		return f4_local0
	end )
	contentList:registerEventHandler( "list_item_lose_focus", function ( element, event )
		return nil
	end )
	f1_arg0:AddButtonCallbackFunction( contentList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not IsDemoPlaying() then
			ProcessListAction( self, f6_arg0, f6_arg2, f6_arg1 )
			return true
		elseif IsDemoPlaying() then
			ProcessListAction( self, f6_arg0, f6_arg2, f6_arg1 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if not IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, nil )
			return true
		elseif IsDemoPlaying() then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x8ADA48E694BFE2C, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( contentList, f1_arg1, Enum.LUIButton[0x22361E23588705A], nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if FileshareCanShowOptionsMenu( f8_arg2 ) then
			PreserveThumbnails( f8_arg2, true )
			OpenPopup( self, "FileshareOptions", f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if FileshareCanShowOptionsMenu( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x22361E23588705A], 0x8E7772DFD9BBDEB, nil, nil )
			return true
		else
			return false
		end
	end, false )
	contentList:subscribeToGlobalModel( f1_arg1, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, contentList, f1_arg1 )
	end )
	contentList:subscribeToGlobalModel( f1_arg1, "FileshareRoot", "ready", function ( model )
		local f11_local0 = contentList
		if FileshareIsReady( f1_arg1 ) then
			UpdateDataSource( self, f11_local0, f1_arg1 )
		end
	end )
	self:addElement( contentList )
	self.contentList = contentList
	
	local SelectedFilmInformation = CoD.SelectedFilmInformation.new( f1_arg0, f1_arg1, 0, 0, 1027, 1552, 0, 0, 0, 806 )
	SelectedFilmInformation:subscribeToGlobalModel( f1_arg1, "FileshareRoot", "showFileDetails", function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			SelectedFilmInformation:setAlpha( f12_local0 )
		end
	end )
	self:addElement( SelectedFilmInformation )
	self.SelectedFilmInformation = SelectedFilmInformation
	
	local FileshareSpinner = CoD.FileshareSpinner.new( f1_arg0, f1_arg1, 0.5, 0.5, -48, 48, 0.5, 0.5, -48, 48 )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local EmptyText = LUI.UIText.new( 0.5, 0.5, -331, 331, 0.5, 0.5, -18.5, 18.5 )
	EmptyText:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	EmptyText:setText( Engine[0xF9F1239CFD921FE]( 0x9E740AD10EEAD80 ) )
	EmptyText:setTTF( "ttmussels_regular" )
	EmptyText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	EmptyText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( EmptyText )
	self.EmptyText = EmptyText
	
	SelectedFilmInformation:linkToElementModel( contentList, nil, false, function ( model )
		SelectedFilmInformation:setModel( model, f1_arg1 )
	end )
	self:mergeStateConditions( {
		{
			stateName = "Busy",
			condition = function ( menu, element, event )
				return not FileshareIsReady( f1_arg1 )
			end
		},
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				local f15_local0 = FileshareIsReady( f1_arg1 )
				if f15_local0 then
					if not CoD.ModelUtility.IsGlobalModelValueTrue( "fileshareRoot.dirty" ) then
						f15_local0 = not ListElementHasElements( self.contentList )
					else
						f15_local0 = false
					end
				end
				return f15_local0
			end
		}
	} )
	local f1_local5 = self
	local f1_local6 = self.subscribeToModel
	local f1_local7 = Engine.GetGlobalModel()
	f1_local6( f1_local5, f1_local7["fileshareRoot.ready"], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "fileshareRoot.ready"
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetGlobalModel()
	f1_local6( f1_local5, f1_local7["fileshareRoot.dirty"], function ( f17_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "fileshareRoot.dirty"
		} )
	end, false )
	self:appendEventHandler( "grid_updated", function ( f18_arg0, f18_arg1 )
		f18_arg1.menu = f18_arg1.menu or f1_arg0
		f1_arg0:updateElementState( self, f18_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "FileshareRoot", "itemsCount", function ( model )
		local f19_local0 = self
		ShowWidget( self.contentList )
		EnableNavigation( self, "contentList" )
	end )
	contentList.id = "contentList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.FileshareCategoryContentList.__resetProperties = function ( f20_arg0 )
	f20_arg0.contentList:completeAnimation()
	f20_arg0.FileshareSpinner:completeAnimation()
	f20_arg0.EmptyText:completeAnimation()
	f20_arg0.contentList:setAlpha( 1 )
	f20_arg0.FileshareSpinner:setAlpha( 1 )
	f20_arg0.EmptyText:setAlpha( 1 )
end

CoD.FileshareCategoryContentList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 3 )
			f21_arg0.contentList:completeAnimation()
			f21_arg0.contentList:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.contentList )
			f21_arg0.FileshareSpinner:completeAnimation()
			f21_arg0.FileshareSpinner:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.FileshareSpinner )
			f21_arg0.EmptyText:completeAnimation()
			f21_arg0.EmptyText:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.EmptyText )
		end
	},
	Busy = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 2 )
			f22_arg0.contentList:completeAnimation()
			f22_arg0.contentList:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.contentList )
			f22_arg0.EmptyText:completeAnimation()
			f22_arg0.EmptyText:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.EmptyText )
		end
	},
	Empty = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 3 )
			f23_arg0.contentList:completeAnimation()
			f23_arg0.contentList:setAlpha( 0 )
			f23_arg0.clipFinished( f23_arg0.contentList )
			f23_arg0.FileshareSpinner:completeAnimation()
			f23_arg0.FileshareSpinner:setAlpha( 0 )
			f23_arg0.clipFinished( f23_arg0.FileshareSpinner )
			f23_arg0.EmptyText:completeAnimation()
			f23_arg0.EmptyText:setAlpha( 1 )
			f23_arg0.clipFinished( f23_arg0.EmptyText )
		end
	}
}
CoD.FileshareCategoryContentList.__onClose = function ( f24_arg0 )
	f24_arg0.SelectedFilmInformation:close()
	f24_arg0.contentList:close()
	f24_arg0.FileshareSpinner:close()
end

