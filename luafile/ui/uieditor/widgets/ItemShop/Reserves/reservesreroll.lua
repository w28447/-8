require( "x64:dd513db11e2bfb6" )
require( "ui/uieditor/menus/itemshop/purchasebribestack" )
require( "ui/uieditor/menus/itemshop/purchasecodpoints" )
require( "ui/uieditor/menus/itemshop/purchasereservesitem" )
require( "x64:e6df4068375d284" )
require( "ui/uieditor/widgets/itemshop/reserves/reservesrerollitemdetails" )

CoD.ReservesReroll = InheritFrom( LUI.UIElement )
CoD.ReservesReroll.__defaultWidth = 250
CoD.ReservesReroll.__defaultHeight = 271
CoD.ReservesReroll.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ReservesReroll )
	self.id = "ReservesReroll"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Background = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Background:setRGB( 0.09, 0.09, 0.09 )
	Background:setAlpha( 0.9 )
	self:addElement( Background )
	self.Background = Background
	
	local Container = LUI.UIImage.new( 0, 1, 14, -14, 0, 0, 27, 147 )
	Container:setRGB( 0.23, 0.23, 0.23 )
	Container:setAlpha( 0.25 )
	self:addElement( Container )
	self.Container = Container
	
	local TiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TiledBacking:setAlpha( 0.25 )
	TiledBacking:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	TiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	TiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	TiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( TiledBacking )
	self.TiledBacking = TiledBacking
	
	local Bar = LUI.UIImage.new( 0, 1, 14, -14, 0, 0, 162, 190 )
	Bar:setRGB( 0.25, 0.24, 0.22 )
	Bar:setAlpha( 0.88 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local TiledBacking2 = LUI.UIImage.new( 0, 1, 14, -14, 0, 0, 162, 190 )
	TiledBacking2:setAlpha( 0.5 )
	TiledBacking2:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	TiledBacking2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	TiledBacking2:setShaderVector( 0, 0, 0, 0, 0 )
	TiledBacking2:setupNineSliceShader( 196, 88 )
	self:addElement( TiledBacking2 )
	self.TiledBacking2 = TiledBacking2
	
	local LayoutTopBar = LUI.UIImage.new( 0, 1, -1, 1, 0, 0, -1, 27 )
	LayoutTopBar:setImage( RegisterImage( 0x87C348C36FF085C ) )
	self:addElement( LayoutTopBar )
	self.LayoutTopBar = LayoutTopBar
	
	local LayoutTopBar2 = LUI.UIImage.new( 0, 1, -1, 1, 1, 1, -27, 1 )
	LayoutTopBar2:setZRot( 180 )
	LayoutTopBar2:setImage( RegisterImage( 0x87C348C36FF085C ) )
	self:addElement( LayoutTopBar2 )
	self.LayoutTopBar2 = LayoutTopBar2
	
	local CommonStripes01Tiled = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, -1, 15 )
	CommonStripes01Tiled:setAlpha( 0.25 )
	CommonStripes01Tiled:setImage( RegisterImage( 0x649895CFFA4963D ) )
	CommonStripes01Tiled:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	CommonStripes01Tiled:setShaderVector( 0, 0, 0, 0, 0 )
	CommonStripes01Tiled:setupNineSliceShader( 64, 16 )
	self:addElement( CommonStripes01Tiled )
	self.CommonStripes01Tiled = CommonStripes01Tiled
	
	local LayoutElementTL2 = LUI.UIImage.new( 1, 1, -40, -24, 0, 0, 168, 184 )
	LayoutElementTL2:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	LayoutElementTL2:setImage( RegisterImage( 0x34B575F15CDD376 ) )
	LayoutElementTL2:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	LayoutElementTL2:setShaderVector( 0, 3, 0, 0, 0 )
	self:addElement( LayoutElementTL2 )
	self.LayoutElementTL2 = LayoutElementTL2
	
	local LayoutElementTL = LUI.UIImage.new( 0, 0, 24, 40, 0, 0, 168, 184 )
	LayoutElementTL:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	LayoutElementTL:setZRot( 90 )
	LayoutElementTL:setImage( RegisterImage( 0x34B575F15CDD376 ) )
	LayoutElementTL:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	LayoutElementTL:setShaderVector( 0, 3, 0, 0, 0 )
	self:addElement( LayoutElementTL )
	self.LayoutElementTL = LayoutElementTL
	
	local RerollButton = CoD.DirectorGenericButton.new( f1_arg0, f1_arg1, 0, 1, 13, -13, 1, 1, -71, -11 )
	RerollButton:linkToElementModel( self, nil, false, function ( model )
		RerollButton:setModel( model, f1_arg1 )
	end )
	RerollButton.DirectorSelectButtonMiniInternal.MiddleText.__MiddleText_StringReference = function ( f3_arg0 )
		local f3_local0 = f3_arg0:get()
		if f3_local0 ~= nil then
			RerollButton.DirectorSelectButtonMiniInternal.MiddleText:setText( ToUpper( CoD.BlackMarketUtility.GetRerollButtonString( f1_arg1, self:getModel(), f3_local0 ) ) )
		end
	end
	
	RerollButton:linkToElementModel( self, "price", true, RerollButton.DirectorSelectButtonMiniInternal.MiddleText.__MiddleText_StringReference )
	RerollButton.DirectorSelectButtonMiniInternal.MiddleText.__MiddleText_StringReference_FullPath = function ()
		local f4_local0 = self:getModel()
		if f4_local0 then
			f4_local0 = self:getModel()
			f4_local0 = f4_local0.price
		end
		if f4_local0 then
			RerollButton.DirectorSelectButtonMiniInternal.MiddleText.__MiddleText_StringReference( f4_local0 )
		end
	end
	
	RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus.__MiddleTextFocus_String = function ( f5_arg0 )
		local f5_local0 = f5_arg0:get()
		if f5_local0 ~= nil then
			RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus:setText( ToUpper( CoD.BlackMarketUtility.GetRerollButtonString( f1_arg1, self:getModel(), f5_local0 ) ) )
		end
	end
	
	RerollButton:linkToElementModel( self, "price", true, RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus.__MiddleTextFocus_String )
	RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus.__MiddleTextFocus_String_FullPath = function ()
		local f6_local0 = self:getModel()
		if f6_local0 then
			f6_local0 = self:getModel()
			f6_local0 = f6_local0.price
		end
		if f6_local0 then
			RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus.__MiddleTextFocus_String( f6_local0 )
		end
	end
	
	local DotPatternTop = RerollButton
	local ItemName = RerollButton.subscribeToModel
	local DotPatternBtm = Engine.GetModelForController( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm.reservesRevealComplete, function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = Engine.GetModelForController( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm["LootStreamProgress.allRngUnlocked"], function ( f8_arg0, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = Engine.GetModelForController( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm["LootRNGResult.streamId"], function ( f9_arg0, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = DataSources.ReservesItemCounts.getModel( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm.lootCaseCount, function ( f10_arg0, f10_arg1 )
		CoD.Menu.UpdateButtonShownState( f10_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RerollButton:linkToElementModel( RerollButton, "isBundleCrate", true, function ( model, f11_arg1 )
		CoD.Menu.UpdateButtonShownState( f11_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = DataSources.ReservesItemCounts.getModel( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm.lootBundleCrateCount, function ( f12_arg0, f12_arg1 )
		CoD.Menu.UpdateButtonShownState( f12_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RerollButton:linkToElementModel( RerollButton, "name", true, function ( model, f13_arg1 )
		CoD.Menu.UpdateButtonShownState( f13_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = Engine.GetModelForController( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm["LootStreamProgress.codPoints"], function ( f14_arg0, f14_arg1 )
		CoD.Menu.UpdateButtonShownState( f14_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DotPatternTop = RerollButton
	ItemName = RerollButton.subscribeToModel
	DotPatternBtm = DataSources.ReservesItemCounts.getModel( f1_arg1 )
	ItemName( DotPatternTop, DotPatternBtm.lootBribeCount, function ( f15_arg0, f15_arg1 )
		CoD.Menu.UpdateButtonShownState( f15_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	RerollButton:registerEventHandler( "gain_focus", function ( element, event )
		local f16_local0 = nil
		if element.gainFocus then
			f16_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f16_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f16_local0
	end )
	f1_arg0:AddButtonCallbackFunction( RerollButton, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		if CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsControllerModelValueTrue( f17_arg2, "LootStreamProgress.allRngUnlocked" ) then
			CoD.BlackMarketUtility.OpenAllReservesOwnedDialog( f17_arg1, f17_arg2 )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f17_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.CASE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f17_arg2, "ReservesItemCounts", "lootCaseCount", 0 ) then
			OpenOverlay( self, "OpenBribeConfirmation", f17_arg2, {
				_properties = {
					_isReservesRevealMenu = true,
					_bribeType = LuaEnum.BRIBE_TYPES.CASE
				}
			} )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f17_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and CoD.ModelUtility.IsSelfModelValueTrue( self, f17_arg2, "isBundleCrate" ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f17_arg2, "ReservesItemCounts", "lootBundleCrateCount", 0 ) then
			OpenOverlay( self, "OpenBribeConfirmation", f17_arg2, {
				_properties = {
					_isReservesRevealMenu = true,
					_bribeType = LuaEnum.BRIBE_TYPES.CRATE
				}
			} )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsSelfModelValueEqualToHashString( f17_arg2, f17_arg1, "name", 0x717FF140F30014C ) and CoD.ModelUtility.IsModelValueEqualToEnum( f17_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) then
			OpenOverlay( self, "PurchaseBribeStack", f17_arg2, {
				_model = f17_arg1:getModel(),
				_properties = {
					_isReservesRevealMenu = true
				}
			} )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f17_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and CanPurchaseItem( f17_arg2, self ) and not CoD.ModelUtility.IsSelfModelValueEqualToHashString( f17_arg2, f17_arg1, "name", 0x717FF140F30014C ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f17_arg2, "isBundleCrate" ) then
			OpenPopup( self, "PurchaseReservesItem", f17_arg2, {
				_model = f17_arg1:getModel(),
				_properties = {
					_isReservesRevealMenu = true
				}
			} )
			PlaySoundAlias( "uin_toggle_generic" )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f17_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and not CoD.ModelUtility.IsSelfModelValueEqualToHashString( f17_arg2, f17_arg1, "name", 0x717FF140F30014C ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f17_arg2, "isBundleCrate" ) then
			OpenPopup( self, "PurchaseCodPoints", f17_arg2, self:getModel() )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.BlackMarketUtility.IsBribeStream( f17_arg2 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f17_arg2, "ReservesItemCounts", "lootBribeCount", 0 ) and not CoD.BlackMarketUtility.IsBribeStackStream( f17_arg2 ) and not CoD.BlackMarketUtility.IsBribeMenuStream( f17_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f17_arg2, "isBundleCrate" ) then
			OpenOverlay( self, "OpenBribeConfirmation", f17_arg2, {
				_properties = {
					_isReservesRevealMenu = true,
					_bribeType = LuaEnum.BRIBE_TYPES.BRIBE
				}
			} )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f17_arg2, "reservesRevealComplete" ) and CoD.BlackMarketUtility.IsBribeMenuStream( f17_arg2 ) and IsBooleanDvarSet( "loot_weaponBribeMultiPurchaseActive" ) then
			PlaySoundAlias( "uin_toggle_generic" )
			CoD.BlackMarketUtility.GoBackAndOpenBribeMenu( f17_arg2, f17_arg1 )
			return true
		else
			
		end
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		if CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsControllerModelValueTrue( f18_arg2, "LootStreamProgress.allRngUnlocked" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f18_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.CASE ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f18_arg2, "ReservesItemCounts", "lootCaseCount", 0 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f18_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and CoD.ModelUtility.IsSelfModelValueTrue( self, f18_arg2, "isBundleCrate" ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f18_arg2, "ReservesItemCounts", "lootBundleCrateCount", 0 ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsSelfModelValueEqualToHashString( f18_arg2, f18_arg1, "name", 0x717FF140F30014C ) and CoD.ModelUtility.IsModelValueEqualToEnum( f18_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xC2B10DCD9D6E876, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f18_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and CanPurchaseItem( f18_arg2, self ) and not CoD.ModelUtility.IsSelfModelValueEqualToHashString( f18_arg2, f18_arg1, "name", 0x717FF140F30014C ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f18_arg2, "isBundleCrate" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.ModelUtility.IsModelValueEqualToEnum( f18_arg2, "LootRNGResult.streamId", CoD.BlackMarketUtility.CrateStreams.THREE_PACK ) and not CoD.ModelUtility.IsSelfModelValueEqualToHashString( f18_arg2, f18_arg1, "name", 0x717FF140F30014C ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f18_arg2, "isBundleCrate" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.BlackMarketUtility.IsBribeStream( f18_arg2 ) and CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThan( f18_arg2, "ReservesItemCounts", "lootBribeCount", 0 ) and not CoD.BlackMarketUtility.IsBribeStackStream( f18_arg2 ) and not CoD.BlackMarketUtility.IsBribeMenuStream( f18_arg2 ) and not CoD.ModelUtility.IsSelfModelValueTrue( self, f18_arg2, "isBundleCrate" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x4E98D63EA5A0BD3, nil, nil )
			return true
		elseif CoD.ModelUtility.IsModelValueTrue( f18_arg2, "reservesRevealComplete" ) and CoD.BlackMarketUtility.IsBribeMenuStream( f18_arg2 ) and IsBooleanDvarSet( "loot_weaponBribeMultiPurchaseActive" ) then
			CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xC2B10DCD9D6E876, nil, nil )
			return true
		else
			return false
		end
	end, false )
	RerollButton:subscribeToGlobalModel( f1_arg1, "PerController", "reservesRevealComplete", function ( model )
		local f19_local0 = RerollButton
		UpdateAllMenuButtonPrompts( f1_arg0, f1_arg1 )
	end )
	self:addElement( RerollButton )
	self.RerollButton = RerollButton
	
	ItemName = CoD.ReservesRerollItemDetails.new( f1_arg0, f1_arg1, 0.5, 0.5, -125, 125, 0, 0, 10, 190 )
	ItemName:linkToElementModel( self, nil, false, function ( model )
		ItemName:setModel( model, f1_arg1 )
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	DotPatternTop = LUI.UIImage.new( 0, 1, 13, -13, 0, 0, 22, 26 )
	DotPatternTop:setImage( RegisterImage( "uie_ui_menu_social_emblem_dotline_tiled" ) )
	DotPatternTop:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DotPatternTop:setShaderVector( 0, 0, 0, 0, 0 )
	DotPatternTop:setupNineSliceShader( 16, 4 )
	self:addElement( DotPatternTop )
	self.DotPatternTop = DotPatternTop
	
	DotPatternBtm = LUI.UIImage.new( 0, 1, 13, -13, 0, 0, 148, 152 )
	DotPatternBtm:setImage( RegisterImage( "uie_ui_menu_social_emblem_dotline_tiled" ) )
	DotPatternBtm:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DotPatternBtm:setShaderVector( 0, 0, 0, 0, 0 )
	DotPatternBtm:setupNineSliceShader( 16, 4 )
	self:addElement( DotPatternBtm )
	self.DotPatternBtm = DotPatternBtm
	
	local f1_local15 = RerollButton
	local f1_local16 = RerollButton.subscribeToModel
	local f1_local17 = Engine.GetModelForController( f1_arg1 )
	f1_local16( f1_local15, f1_local17["LootRNGResult.streamId"], RerollButton.DirectorSelectButtonMiniInternal.MiddleText.__MiddleText_StringReference_FullPath )
	f1_local15 = RerollButton
	f1_local16 = RerollButton.subscribeToModel
	f1_local17 = Engine.GetModelForController( f1_arg1 )
	f1_local16( f1_local15, f1_local17["LootRNGResult.streamId"], RerollButton.DirectorSelectButtonMiniInternal.MiddleTextFocus.__MiddleTextFocus_String_FullPath )
	self:mergeStateConditions( {
		{
			stateName = "AllowReroll",
			condition = function ( menu, element, event )
				return CoD.BlackMarketUtility.ShowReservesReRollButton( f1_arg1, menu )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelNil( element, f1_arg1 )
			end
		}
	} )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = DataSources.ReservesItemCounts.getModel( f1_arg1 )
	f1_local16( f1_local15, f1_local17.lootCaseCount, function ( f23_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "lootCaseCount"
		} )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = DataSources.ReservesItemCounts.getModel( f1_arg1 )
	f1_local16( f1_local15, f1_local17.lootBribeCount, function ( f24_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "lootBribeCount"
		} )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetModelForController( f1_arg1 )
	f1_local16( f1_local15, f1_local17["LootRNGResult.streamId"], function ( f25_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f25_arg0:get(),
			modelName = "LootRNGResult.streamId"
		} )
	end, false )
	self:linkToElementModel( self, nil, false, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model and model:get(),
			modelName = nil
		} )
	end )
	RerollButton.id = "RerollButton"
	self.__defaultFocus = RerollButton
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ReservesReroll.__resetProperties = function ( f27_arg0 )
	f27_arg0.RerollButton:completeAnimation()
	f27_arg0.DotPatternBtm:completeAnimation()
	f27_arg0.DotPatternTop:completeAnimation()
	f27_arg0.ItemName:completeAnimation()
	f27_arg0.LayoutElementTL:completeAnimation()
	f27_arg0.LayoutElementTL2:completeAnimation()
	f27_arg0.CommonStripes01Tiled:completeAnimation()
	f27_arg0.LayoutTopBar2:completeAnimation()
	f27_arg0.LayoutTopBar:completeAnimation()
	f27_arg0.TiledBacking2:completeAnimation()
	f27_arg0.Bar:completeAnimation()
	f27_arg0.TiledBacking:completeAnimation()
	f27_arg0.Container:completeAnimation()
	f27_arg0.Background:completeAnimation()
	f27_arg0.RerollButton:setAlpha( 1 )
	f27_arg0.DotPatternBtm:setAlpha( 1 )
	f27_arg0.DotPatternTop:setAlpha( 1 )
	f27_arg0.ItemName:setAlpha( 1 )
	f27_arg0.LayoutElementTL:setAlpha( 1 )
	f27_arg0.LayoutElementTL2:setAlpha( 1 )
	f27_arg0.CommonStripes01Tiled:setAlpha( 0.25 )
	f27_arg0.LayoutTopBar2:setAlpha( 1 )
	f27_arg0.LayoutTopBar:setAlpha( 1 )
	f27_arg0.TiledBacking2:setAlpha( 0.5 )
	f27_arg0.Bar:setAlpha( 0.88 )
	f27_arg0.TiledBacking:setAlpha( 0.25 )
	f27_arg0.Container:setAlpha( 0.25 )
	f27_arg0.Background:setAlpha( 0.9 )
end

CoD.ReservesReroll.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 1 )
			f28_arg0.RerollButton:completeAnimation()
			f28_arg0.RerollButton:setAlpha( 0 )
			f28_arg0.clipFinished( f28_arg0.RerollButton )
		end
	},
	AllowReroll = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f30_arg0, f30_arg1 )
			f30_arg0:__resetProperties()
			f30_arg0:setupElementClipCounter( 14 )
			f30_arg0.Background:completeAnimation()
			f30_arg0.Background:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.Background )
			f30_arg0.Container:completeAnimation()
			f30_arg0.Container:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.Container )
			f30_arg0.TiledBacking:completeAnimation()
			f30_arg0.TiledBacking:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.TiledBacking )
			f30_arg0.Bar:completeAnimation()
			f30_arg0.Bar:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.Bar )
			f30_arg0.TiledBacking2:completeAnimation()
			f30_arg0.TiledBacking2:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.TiledBacking2 )
			f30_arg0.LayoutTopBar:completeAnimation()
			f30_arg0.LayoutTopBar:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.LayoutTopBar )
			f30_arg0.LayoutTopBar2:completeAnimation()
			f30_arg0.LayoutTopBar2:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.LayoutTopBar2 )
			f30_arg0.CommonStripes01Tiled:completeAnimation()
			f30_arg0.CommonStripes01Tiled:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.CommonStripes01Tiled )
			f30_arg0.LayoutElementTL2:completeAnimation()
			f30_arg0.LayoutElementTL2:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.LayoutElementTL2 )
			f30_arg0.LayoutElementTL:completeAnimation()
			f30_arg0.LayoutElementTL:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.LayoutElementTL )
			f30_arg0.RerollButton:completeAnimation()
			f30_arg0.RerollButton:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.RerollButton )
			f30_arg0.ItemName:completeAnimation()
			f30_arg0.ItemName:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.ItemName )
			f30_arg0.DotPatternTop:completeAnimation()
			f30_arg0.DotPatternTop:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.DotPatternTop )
			f30_arg0.DotPatternBtm:completeAnimation()
			f30_arg0.DotPatternBtm:setAlpha( 0 )
			f30_arg0.clipFinished( f30_arg0.DotPatternBtm )
		end
	}
}
CoD.ReservesReroll.__onClose = function ( f31_arg0 )
	f31_arg0.RerollButton:close()
	f31_arg0.ItemName:close()
end

