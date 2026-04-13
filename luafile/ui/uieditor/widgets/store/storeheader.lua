require( "ui/uieditor/widgets/common/commonheader" )
require( "ui/uieditor/widgets/director/directorpartylist" )
require( "ui/uieditor/widgets/startmenu/startmenu_currencycounts" )

CoD.StoreHeader = InheritFrom( LUI.UIElement )
CoD.StoreHeader.__defaultWidth = 1920
CoD.StoreHeader.__defaultHeight = 100
CoD.StoreHeader.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StoreHeader )
	self.id = "StoreHeader"
	self.soundSet = "none"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CommonHeader = CoD.CommonHeader.new( f1_arg0, f1_arg1, 0, 0, 0, 1920, 0, 0, 0, 67 )
	CommonHeader.BGSceneBlur:setAlpha( 0 )
	CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x191CDDA584B4408 ) )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader:subscribeToGlobalModel( f1_arg1, "LobbyRoot", "lobbyTitle", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f2_local0 ) )
		end
	end )
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	local PartyList = CoD.DirectorPartyList.new( f1_arg0, f1_arg1, 1, 1, -530, -122, 0, 0, 48, 128 )
	self:addElement( PartyList )
	self.PartyList = PartyList
	
	local StartMenuCurrencyCounts = CoD.StartMenu_CurrencyCounts.new( f1_arg0, f1_arg1, 0.5, 0.5, -153, 157, 0, 0, 59.5, 139.5 )
	StartMenuCurrencyCounts:setAlpha( 0 )
	StartMenuCurrencyCounts.vialCount:setText( SetValueIfNumberEqualTo( -1, "-", 0 ) )
	self:addElement( StartMenuCurrencyCounts )
	self.StartMenuCurrencyCounts = StartMenuCurrencyCounts
	
	PartyList.id = "PartyList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.StoreHeader.__onClose = function ( f3_arg0 )
	f3_arg0.CommonHeader:close()
	f3_arg0.PartyList:close()
	f3_arg0.StartMenuCurrencyCounts:close()
end

