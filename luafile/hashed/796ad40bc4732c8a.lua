require( "ui/uieditor/widgets/backgroundframes/genericmenuframeidentity" )
require( "ui/uieditor/widgets/startmenu/startmenu_currencycounts" )
require( "ui/uieditor/widgets/store/store_nonfeaturedframe" )

CoD.Store_DLC = InheritFrom( CoD.Menu )
LUI.createMenu.Store_DLC = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "Store_DLC", f1_arg0 )
	local f1_local1 = self
	CoD.StoreUtility.InitSingleCategoryStoreMenu( self, f1_arg0, "mappacks" )
	self:setClass( CoD.Store_DLC )
	self.soundSet = "ChooseDecal"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new( 0.5, 0.5, -957, 963, 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( 0xEF427A6CB5D6885 ) )
	self:addElement( Background )
	self.Background = Background
	
	local editorBackground = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	editorBackground:setRGB( 0, 0, 0 )
	editorBackground:setAlpha( 0.75 )
	self:addElement( editorBackground )
	self.editorBackground = editorBackground
	
	local frame = CoD.GenericMenuFrameIdentity.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	frame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0xBB7AA7A26F39DFA ) )
	frame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			frame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( frame )
	self.frame = frame
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f1_local1, f1_arg0, 1, 1, -918, -608, 0, 0, 37.5, 117.5 )
	StartMenuCurrencyCounts.vialCount:setText( SetValueIfNumberEqualTo( -1, "-", 0 ) )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	local StoreNonFeaturedFrame = CoD.Store_NonFeaturedFrame.new( f1_local1, f1_arg0, 0, 0, 474, 1866, 0, 0, 160, 840 )
	self:addElement( StoreNonFeaturedFrame )
	self.StoreNonFeaturedFrame = StoreNonFeaturedFrame
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		if element.menuLoaded then
			f3_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f3_local0 = element.super:menuLoaded( event )
		end
		ShowPsStoreIcon( f1_arg0, Enum[0x784DC8CE13E1E13][0xF4B7EC4DCAA8AC4] )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		ClearMenuSavedState( f4_arg1 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0xA4032FB2AAB69F2, nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0xC083113BC81F23F], nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not IsPC() then
			RedeemCode( self, f6_arg0, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if not IsPC() then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton[0xC083113BC81F23F], 0xAC7CDF7FDA3D9D3, nil, nil )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		HidePsStoreIcon( f1_arg0 )
		ClearSelectedStoreCategory( f1_arg0 )
		SetControllerModelValue( f1_arg0, "StoreRoot.isCategoryListInFocus", 0 )
	end )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "StoreRoot.ready", function ( model )
		local f9_local0 = self
		if CoD.ModelUtility.IsParamModelEqualTo( model, 1 ) then
			SetFocusToElement( self, "StoreNonFeaturedFrame", f1_arg0 )
		end
	end )
	frame:setModel( self.buttonModel, f1_arg0 )
	frame.id = "frame"
	StoreNonFeaturedFrame.id = "StoreNonFeaturedFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = StoreNonFeaturedFrame
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	return self
end

CoD.Store_DLC.__onClose = function ( f10_arg0 )
	f10_arg0.frame:close()
	f10_arg0.StartMenuCurrencyCounts:close()
	f10_arg0.StoreNonFeaturedFrame:close()
end

