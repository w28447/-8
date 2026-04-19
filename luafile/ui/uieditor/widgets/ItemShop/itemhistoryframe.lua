require( "ui/uieditor/menus/itemshop/itemshopdetails" )
require( "ui/uieditor/widgets/common/commoncornerbrackets01" )
require( "ui/uieditor/widgets/itemshop/bmtallitemcontainer" )
require( "ui/uieditor/widgets/pc/pc_gridhorizontalscrollbar" )
require( "ui/uieditor/widgets/scrollbars/horizontalcounter" )
require( "ui/uieditor/widgets/store/storecategorybutton" )

CoD.ItemHistoryFrame = InheritFrom( LUI.UIElement )
CoD.ItemHistoryFrame.__defaultWidth = 1920
CoD.ItemHistoryFrame.__defaultHeight = 1080
CoD.ItemHistoryFrame.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.FTUEUtility.ShowFTUESequenceIfNotSeen( self, f1_arg1, "BlackMarketInventoryIntroduction" )
	self:setClass( CoD.ItemHistoryFrame )
	self.id = "ItemHistoryFrame"
	self.soundSet = "ItemShop"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local NoiseBackingLeft = LUI.UIImage.new( 0.5, 0.5, -856, -492, 0.5, 0.5, -355, 405 )
	NoiseBackingLeft:setAlpha( 0.4 )
	NoiseBackingLeft:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseBackingLeft:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	NoiseBackingLeft:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseBackingLeft:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseBackingLeft )
	self.NoiseBackingLeft = NoiseBackingLeft
	
	local NoiseBackingRight = LUI.UIImage.new( 0.5, 0.5, -470, 854, 0.5, 0.5, -356, 404 )
	NoiseBackingRight:setAlpha( 0.4 )
	NoiseBackingRight:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseBackingRight:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	NoiseBackingRight:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseBackingRight:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseBackingRight )
	self.NoiseBackingRight = NoiseBackingRight
	
	local HistoryList = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	HistoryList:setLeftRight( 0.5, 0.5, -448, 832 )
	HistoryList:setTopBottom( 0.5, 0.5, -311, 199 )
	HistoryList:setWidgetType( CoD.BMTallItemContainer )
	HistoryList:setHorizontalCount( 5 )
	HistoryList:setSpacing( 20 )
	HistoryList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	HistoryList:setHorizontalScrollbar( CoD.PC_GridHorizontalScrollbar )
	HistoryList:setHorizontalCounter( CoD.horizontalCounter )
	HistoryList:setDataSource( "ItemHistoryList" )
	HistoryList:linkToElementModel( HistoryList, "lootType", true, function ( model, f2_arg1 )
		CoD.Menu.UpdateButtonShownState( f2_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	HistoryList:registerEventHandler( "gain_list_focus", function ( element, event )
		local f3_local0 = nil
		PlaySoundSetSound( self, "gain_focus" )
		return f3_local0
	end )
	HistoryList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f4_local0
	end )
	f1_arg0:AddButtonCallbackFunction( HistoryList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if CoD.ModelUtility.IsSelfModelValueEqualToEnum( f5_arg0, f5_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) then
			CoD.BlackMarketUtility.PlayItemShopSelectSound( f5_arg0, f5_arg2 )
			CoD.ContractUtility.OpenContractDetails( self, f5_arg0, f5_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f5_arg0, f5_arg2, "lootType", LuaEnum.LOOT_TYPE.ITEMSHOP ) then
			CoD.BlackMarketUtility.PlayItemShopSelectSound( f5_arg0, f5_arg2 )
			OpenOverlay( self, "ItemShopDetails", f5_arg2, {
				_model = f5_arg0:getModel()
			} )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if CoD.ModelUtility.IsSelfModelValueEqualToEnum( f6_arg0, f6_arg2, "lootType", LuaEnum.LOOT_TYPE.CONTRACT ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x9C695BAD15F589A, nil, nil )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f6_arg0, f6_arg2, "lootType", LuaEnum.LOOT_TYPE.ITEMSHOP ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x9C695BAD15F589A, nil, nil )
			return true
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( HistoryList, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], 0x0, nil, nil )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( HistoryList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELUP", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		CoD.GridAndListUtility.ScrollLeft( self.HistoryList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.HistoryList )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELUP" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( HistoryList, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MWHEELDOWN", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		CoD.GridAndListUtility.ScrollRight( self.HistoryList )
		CoD.GridAndListUtility.ValidateActiveItemVisibility( self.HistoryList )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MWHEELDOWN" )
		return false
	end, false )
	self:addElement( HistoryList )
	self.HistoryList = HistoryList
	
	local CategoryList = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	CategoryList:setLeftRight( 0.5, 0.5, -836, -512 )
	CategoryList:setTopBottom( 0.5, 0.5, -311, -31 )
	CategoryList:setWidgetType( CoD.StoreCategoryButton )
	CategoryList:setVerticalCount( 3 )
	CategoryList:setSpacing( 20 )
	CategoryList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	CategoryList:setDataSource( "ItemHistoryCategoryList" )
	CategoryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		local f13_local1 = SetMenuProperty
		local f13_local2 = f1_arg0
		local f13_local3 = "category"
		local f13_local4 = element:getModel()
		f13_local1( f13_local2, f13_local3, f13_local4.category:get() )
		CoD.GridAndListUtility.UpdateDataSource( self.HistoryList, true, true, true )
		CoD.GridAndListUtility.SetFocusToFirstSelectableItem( self.HistoryList )
		return f13_local0
	end )
	CategoryList:registerEventHandler( "gain_list_focus", function ( element, event )
		return nil
	end )
	self:addElement( CategoryList )
	self.CategoryList = CategoryList
	
	local FramingCornerBrackets = CoD.CommonCornerBrackets01.new( f1_arg0, f1_arg1, 0.5, 0.5, -880, 880, 0.5, 0.5, -381, 429 )
	FramingCornerBrackets:setAlpha( 0.1 )
	self:addElement( FramingCornerBrackets )
	self.FramingCornerBrackets = FramingCornerBrackets
	
	local DottedLineTop = LUI.UIImage.new( 0.5, 0.5, -856, 854, 0.5, 0.5, -364, -360 )
	DottedLineTop:setAlpha( 0.35 )
	DottedLineTop:setImage( RegisterImage( "uie_ui_menu_social_emblem_dotline_tiled" ) )
	DottedLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DottedLineTop:setShaderVector( 0, 0, 0, 0, 0 )
	DottedLineTop:setupNineSliceShader( 16, 4 )
	self:addElement( DottedLineTop )
	self.DottedLineTop = DottedLineTop
	
	local DottedLineBot = LUI.UIImage.new( 0.5, 0.5, -856, 854, 0.5, 0.5, 408, 412 )
	DottedLineBot:setAlpha( 0.35 )
	DottedLineBot:setImage( RegisterImage( "uie_ui_menu_social_emblem_dotline_tiled" ) )
	DottedLineBot:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DottedLineBot:setShaderVector( 0, 0, 0, 0, 0 )
	DottedLineBot:setupNineSliceShader( 16, 4 )
	self:addElement( DottedLineBot )
	self.DottedLineBot = DottedLineBot
	
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearMenuSavedState( f1_arg0 )
	end )
	HistoryList.id = "HistoryList"
	CategoryList.id = "CategoryList"
	self.__defaultFocus = CategoryList
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local8 = self
	SetMenuProperty( f1_arg0, "category", "specialOrders" )
	CoD.BlackMarketUtility.ChangeSupplyChainCameraBySelection( f1_arg0, f1_arg1, f1_local8 )
	CoD.GridAndListUtility.SetHorizontalCounterPadding( self.HistoryList, 45 )
	f1_local8 = HistoryList
	if not IsPC() then
		CoD.GridAndListUtility.RemoveHorizontalScrollbar( f1_arg0, f1_local8 )
	elseif IsPC() then
		CoD.GridAndListUtility.RemoveHorizontalCounter( f1_arg0, f1_local8 )
	end
	return self
end

CoD.ItemHistoryFrame.__onClose = function ( f16_arg0 )
	f16_arg0.HistoryList:close()
	f16_arg0.CategoryList:close()
	f16_arg0.FramingCornerBrackets:close()
end

