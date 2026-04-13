require( "ui/uieditor/widgets/director/directorfindgameplaylistinfomp" )
require( "ui/uieditor/widgets/director/directorheadertabsafearea" )
require( "ui/uieditor/widgets/director/directorplaylistoption" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "ui/uieditor/widgets/header/header_container_frontend" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )
require( "ui/uieditor/widgets/store/upsellbanner" )

CoD.DirectorFindGame = InheritFrom( CoD.Menu )
LUI.createMenu.DirectorFindGame = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "DirectorFindGame", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.DirectorUtility.SetupDirectorFiltersCards( f1_local1, f1_arg0, self )
	self:setClass( CoD.DirectorFindGame )
	self.soundSet = "default"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local TEMPBlackBGOverlay = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TEMPBlackBGOverlay:setRGB( 0, 0, 0 )
	TEMPBlackBGOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	TEMPBlackBGOverlay:setShaderVector( 0, 0.01, 0.5, 0, 0 )
	self:addElement( TEMPBlackBGOverlay )
	self.TEMPBlackBGOverlay = TEMPBlackBGOverlay
	
	local OptionsList = LUI.UIList.new( f1_local1, f1_arg0, 20, 0, nil, false, false, false, false )
	OptionsList:setLeftRight( 0.5, 0.5, -864, 292 )
	OptionsList:setTopBottom( 0.5, 0.5, -522, 522 )
	OptionsList:setWidgetType( CoD.DirectorPlaylistOption )
	OptionsList:setHorizontalCount( 3 )
	OptionsList:setVerticalCount( 4 )
	OptionsList:setSpacing( 20 )
	OptionsList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	OptionsList:setVerticalCounter( CoD.verticalCounter )
	OptionsList:linkToElementModel( OptionsList, "locked", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	OptionsList:linkToElementModel( OptionsList, "lockState", true, function ( model, f3_arg1 )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f3_arg1, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
	end )
	OptionsList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0xC083113BC81F23F] )
		return f4_local0
	end )
	f1_local1:AddButtonCallbackFunction( OptionsList, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f5_arg0, f5_arg2, "locked" ) then
			ProcessListAction( self, f5_arg0, f5_arg2, f5_arg1 )
			GoBack( self, f5_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f5_arg0, f5_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			OpenSystemOverlay( self, f5_arg1, f5_arg2, "DownloadDLC", {
				_model = f5_arg0:getModel()
			} )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f5_arg0, f5_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			OpenSystemOverlay( self, f5_arg1, f5_arg2, "SeasonPassUpsell", {
				_model = f5_arg0:getModel(),
				_description = 0x75EE3FCE54AF260
			} )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if not CoD.ModelUtility.IsSelfModelValueTrue( f6_arg0, f6_arg2, "locked" ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f6_arg0, f6_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f6_arg0, f6_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( OptionsList, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], "ui_contextual_1", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if CoD.ModelUtility.IsSelfModelValueEqualToEnum( f7_arg0, f7_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f7_arg0, f7_arg2, "DirectorFindGame", f7_arg1 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f7_arg0, f7_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f7_arg0, f7_arg2, "DirectorFindGame", f7_arg1 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if CoD.ModelUtility.IsSelfModelValueEqualToEnum( f8_arg0, f8_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, nil, "ui_contextual_1" )
			return false
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f8_arg0, f8_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0xC083113BC81F23F], 0x0, nil, "ui_contextual_1" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( OptionsList )
	self.OptionsList = OptionsList
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f9_local0 = nil
		if element.menuLoaded then
			f9_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f9_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
		local f10_local0 = nil
		if element.menuLoaded then
			f10_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f10_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local SelectedPlaylistInfo = CoD.DirectorFindGamePlaylistInfoMP.new( f1_local1, f1_arg0, 0.5, 0.5, 324, 864, 0.5, 0.5, -255, 257 )
	self:addElement( SelectedPlaylistInfo )
	self.SelectedPlaylistInfo = SelectedPlaylistInfo
	
	local DirectorHeaderTabSafeArea = CoD.DirectorHeaderTabSafeArea.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	DirectorHeaderTabSafeArea.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x38A4FBEBCE1E6BE ) )
	DirectorHeaderTabSafeArea.Tabs.customClasssList:setDataSource( "DirectorFilters" )
	DirectorHeaderTabSafeArea:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f11_local0 = model:get()
		if f11_local0 ~= nil then
			DirectorHeaderTabSafeArea.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f11_local0 ) )
		end
	end )
	DirectorHeaderTabSafeArea:registerEventHandler( "menu_loaded", function ( element, event )
		local f12_local0 = nil
		if element.menuLoaded then
			f12_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f12_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	self:addElement( DirectorHeaderTabSafeArea )
	self.DirectorHeaderTabSafeArea = DirectorHeaderTabSafeArea
	
	local UpsellBanner = CoD.UpsellBanner.new( f1_local1, f1_arg0, 0, 0, 1284, 1824, 0, 0, 823.5, 973.5 )
	self:addElement( UpsellBanner )
	self.UpsellBanner = UpsellBanner
	
	OptionsList:linkToElementModel( DirectorHeaderTabSafeArea.Tabs.customClasssList, "dataSource", true, function ( model )
		local f13_local0 = model:get()
		if f13_local0 ~= nil then
			OptionsList:setDataSource( f13_local0 )
		end
	end )
	SelectedPlaylistInfo:linkToElementModel( OptionsList, nil, false, function ( model )
		SelectedPlaylistInfo:setModel( model, f1_arg0 )
	end )
	UpsellBanner:linkToElementModel( OptionsList, nil, false, function ( model )
		UpsellBanner:setModel( model, f1_arg0 )
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		GoBack( self, f16_arg2 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x70A9FDC87CD3D48, nil, nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearMenuSavedState( f1_local1 )
	end )
	OptionsList.id = "OptionsList"
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	DirectorHeaderTabSafeArea.id = "DirectorHeaderTabSafeArea"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = OptionsList
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local9 = self
	CoD.BaseUtility.SetModelFromPropertyModel( f1_arg0, self, self )
	CoD.DoubleXPUtility.SetupPromotionalXPTimer( f1_arg0, f1_local1 )
	return self
end

CoD.DirectorFindGame.__onClose = function ( f19_arg0 )
	f19_arg0.SelectedPlaylistInfo:close()
	f19_arg0.UpsellBanner:close()
	f19_arg0.OptionsList:close()
	f19_arg0.FooterContainerFrontendRight:close()
	f19_arg0.BackingGrayMediumLeft:close()
	f19_arg0.DirectorHeaderTabSafeArea:close()
end

