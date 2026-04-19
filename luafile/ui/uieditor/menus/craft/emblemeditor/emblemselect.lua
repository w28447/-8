require( "ui/uieditor/widgets/backgroundframes/genericmenuframe" )
require( "ui/uieditor/widgets/common/commonidentitywidgetstreamlinedsafeareacontainer" )
require( "i/uieditor/widgets/craft/emblemeditor/emblemselectsafeareacontainer" )
require( "ui/uieditor/widgets/playercard/selfidentitybadge" )

CoD.EmblemSelect = InheritFrom( CoD.Menu )
LUI.createMenu.EmblemSelect = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelect", f1_arg0 )
	local f1_local1 = self
	CoD.BaseUtility.SetPropertiesFromUserData( self, f1_arg1 )
	CoD.CraftUtility.ClearEmblemColorList()
	self:setClass( CoD.EmblemSelect )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local backing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	backing:setRGB( 0, 0, 0 )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	backing:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( backing )
	self.backing = backing
	
	local BackgroundImage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BackgroundImage:setAlpha( 0.85 )
	BackgroundImage:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local MenuFrame = CoD.GenericMenuFrame.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	MenuFrame.CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x4335B0D906D9B56 ) )
	MenuFrame:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			MenuFrame.CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ListFrame = LUI.UIFrame.new( f1_local1, f1_arg0, 0, 0, false )
	ListFrame:setLeftRight( 0.5, 0.5, -960, 960 )
	ListFrame:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( ListFrame )
	self.ListFrame = ListFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, f1_arg0, 0.5, 0.5, 573, 904, 0, 0, 0, 65 )
	SelfIdentityBadge:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsEmblemEditor( f1_arg0 )
			end
		}
	} )
	SelfIdentityBadge:subscribeToGlobalModel( f1_arg0, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, f1_arg0 )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local EmblemSelectSafeAreaContainer = CoD.EmblemSelectSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	self:addElement( EmblemSelectSafeAreaContainer )
	self.EmblemSelectSafeAreaContainer = EmblemSelectSafeAreaContainer
	
	local CommonIdentityWidgetStreamlinedSafeAreaContainer = CoD.CommonIdentityWidgetStreamlinedSafeAreaContainer.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	CommonIdentityWidgetStreamlinedSafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( CommonIdentityWidgetStreamlinedSafeAreaContainer )
	self.CommonIdentityWidgetStreamlinedSafeAreaContainer = CommonIdentityWidgetStreamlinedSafeAreaContainer
	
	ListFrame:linkToElementModel( EmblemSelectSafeAreaContainer.CommonTabBar.Tabs.grid, "frameWidget", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			ListFrame:changeFrameWidget( f6_local0 )
		end
	end )
	self:registerEventHandler( "occlusion_change", function ( element, event )
		local f7_local0 = nil
		if element.OcclusionChange then
			f7_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f7_local0 = element.super:OcclusionChange( event )
		end
		CoD.CraftUtility.SetSlotCustomizationType( f1_arg0, Enum.CustomizationType[0x979B4C08E9D67B2] )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if MenuPropertyIsTrue( f8_arg1, "_selectGroupEmblem" ) then
			CoD.CraftUtility.ClearEmblem()
			GoBack( self, f8_arg2 )
			UploadStats( self, f8_arg2 )
			return true
		else
			GoBack( self, f8_arg2 )
			UploadStats( self, f8_arg2 )
			return true
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x22361E23588705A], nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton[0x22361E23588705A], 0x0, nil, nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CoD.CraftUtility.EmblemSelect_Back( self, element, f1_arg0 )
		SendClientScriptMenuChangeNotify( f1_arg0, f1_local1, false )
	end )
	self.__on_menuOpened_self = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		local f13_local0 = self
		SendClientScriptMenuChangeNotify( f13_arg1, f13_arg2, true )
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	MenuFrame:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		MenuFrame.id = "MenuFrame"
	end
	ListFrame.id = "ListFrame"
	SelfIdentityBadge.id = "SelfIdentityBadge"
	EmblemSelectSafeAreaContainer.id = "EmblemSelectSafeAreaContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = ListFrame
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	self.__on_close_removeOverrides = function ()
		f1_local1:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local9 = self
	SizeToSafeArea( EmblemSelectSafeAreaContainer, f1_arg0 )
	return self
end

CoD.EmblemSelect.__resetProperties = function ( f15_arg0 )
	f15_arg0.ListFrame:completeAnimation()
	f15_arg0.ListFrame:setAlpha( 1 )
end

CoD.EmblemSelect.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			local f16_local0 = function ( f17_arg0 )
				local f17_local0 = function ( f18_arg0 )
					f18_arg0:beginAnimation( 150 )
					f18_arg0:setAlpha( 1 )
					f18_arg0:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
				end
				
				f16_arg0.ListFrame:beginAnimation( 150 )
				f16_arg0.ListFrame:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.ListFrame:registerEventHandler( "transition_complete_keyframe", f17_local0 )
			end
			
			f16_arg0.ListFrame:completeAnimation()
			f16_arg0.ListFrame:setAlpha( 0 )
			f16_local0( f16_arg0.ListFrame )
		end
	}
}
CoD.EmblemSelect.__onClose = function ( f19_arg0 )
	f19_arg0.__on_close_removeOverrides()
	f19_arg0.ListFrame:close()
	f19_arg0.MenuFrame:close()
	f19_arg0.SelfIdentityBadge:close()
	f19_arg0.EmblemSelectSafeAreaContainer:close()
	f19_arg0.CommonIdentityWidgetStreamlinedSafeAreaContainer:close()
end

