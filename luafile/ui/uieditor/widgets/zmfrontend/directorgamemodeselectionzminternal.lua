require( "x64:1bbde4283bb35f8" )
require( "ui/uieditor/widgets/director/directorinfopanelzm" )
require( "ui/uieditor/widgets/director/directorzmmapselectitem" )
require( "ui/uieditor/widgets/director/directorzmplaylistselectitem" )
require( "ui/uieditor/widgets/director/directorzmtutorialselectitem" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )
require( "ui/uieditor/widgets/zmfrontend/zmdifficultyselectbutton" )

CoD.DirectorGamemodeSelectionZMInternal = InheritFrom( LUI.UIElement )
CoD.DirectorGamemodeSelectionZMInternal.__defaultWidth = 1920
CoD.DirectorGamemodeSelectionZMInternal.__defaultHeight = 1080
CoD.DirectorGamemodeSelectionZMInternal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DirectorGamemodeSelectionZMInternal )
	self.id = "DirectorGamemodeSelectionZMInternal"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DirectorInfoPanelZM = CoD.DirectorInfoPanelZM.new( f1_arg0, f1_arg1, 1, 1, -626, -86, 0, 0, 188, 944 )
	DirectorInfoPanelZM:subscribeToGlobalModel( f1_arg1, "DirectorZMPlaylistInfo", nil, function ( model )
		DirectorInfoPanelZM:setModel( model, f1_arg1 )
	end )
	self:addElement( DirectorInfoPanelZM )
	self.DirectorInfoPanelZM = DirectorInfoPanelZM
	
	local Maps = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Maps:setLeftRight( 0, 0, 97, 1141 )
	Maps:setTopBottom( 0, 0, 282, 882 )
	Maps:setAlpha( 0 )
	Maps:setWidgetType( CoD.DirectorZMMapSelectItem )
	Maps:setHorizontalCount( 4 )
	Maps:setVerticalCount( 5 )
	Maps:setSpacing( 20 )
	Maps:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Maps:setVerticalCounter( CoD.verticalCounter )
	Maps:setDataSource( "DirectorPlaylistMapList" )
	Maps:appendEventHandler( "on_session_start", function ( f3_arg0, f3_arg1 )
		f3_arg1.menu = f3_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f3_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Maps:appendEventHandler( "on_session_end", function ( f4_arg0, f4_arg1 )
		f4_arg1.menu = f4_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f4_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	local Tutorial = Maps
	local Playlists = Maps.subscribeToModel
	local DottedDivider = Engine.GetGlobalModel()
	Playlists( Tutorial, DottedDivider["lobbyRoot.lobbyNav"], function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Tutorial = Maps
	Playlists = Maps.subscribeToModel
	DottedDivider = Engine.GetGlobalModel()
	Playlists( Tutorial, DottedDivider["lobbyRoot.gameClient.update"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Tutorial = Maps
	Playlists = Maps.subscribeToModel
	DottedDivider = Engine.GetGlobalModel()
	Playlists( Tutorial, DottedDivider["lobbyRoot.privateClient.update"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Maps:linkToElementModel( Maps, "locked", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Maps:linkToElementModel( Maps, "lockState", true, function ( model, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Maps:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f10_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f10_local0
	end )
	Maps:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Maps, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f12_arg0, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( f12_arg0, f12_arg2, "locked" ) then
			CoD.DirectorUtility.SetPlaylist( f12_arg2, f12_arg0 )
			PlaySoundSetSound( self, "action" )
			GoBack( self, f12_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f12_arg0, f12_arg2, "DirectorFindGame", f12_arg1 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f12_arg0, f12_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f12_arg0, f12_arg2, "DirectorFindGame", f12_arg1 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f13_arg0, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( f13_arg0, f13_arg2, "locked" ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f13_arg0, f13_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Maps:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Maps )
	end )
	self:addElement( Maps )
	self.Maps = Maps
	
	Playlists = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Playlists:setLeftRight( 0, 0, 96, 1252 )
	Playlists:setTopBottom( 0, 0, 188, 1232 )
	Playlists:setAlpha( 0 )
	Playlists:setWidgetType( CoD.DirectorZMPlaylistSelectItem )
	Playlists:setHorizontalCount( 3 )
	Playlists:setVerticalCount( 4 )
	Playlists:setSpacing( 20 )
	Playlists:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Playlists:setVerticalCounter( CoD.verticalCounter )
	Playlists:setDataSource( "DirectorPlaylistMapList" )
	Playlists:appendEventHandler( "on_session_start", function ( f15_arg0, f15_arg1 )
		f15_arg1.menu = f15_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f15_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Playlists:appendEventHandler( "on_session_end", function ( f16_arg0, f16_arg1 )
		f16_arg1.menu = f16_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f16_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	local DifficultyList = Engine.GetGlobalModel()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.lobbyNav"], function ( f17_arg0, f17_arg1 )
		CoD.Menu.UpdateButtonShownState( f17_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	DifficultyList = Engine.GetGlobalModel()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.gameClient.update"], function ( f18_arg0, f18_arg1 )
		CoD.Menu.UpdateButtonShownState( f18_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DottedDivider = Playlists
	Tutorial = Playlists.subscribeToModel
	DifficultyList = Engine.GetGlobalModel()
	Tutorial( DottedDivider, DifficultyList["lobbyRoot.privateClient.update"], function ( f19_arg0, f19_arg1 )
		CoD.Menu.UpdateButtonShownState( f19_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Playlists:linkToElementModel( Playlists, "locked", true, function ( model, f20_arg1 )
		CoD.Menu.UpdateButtonShownState( f20_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Playlists:linkToElementModel( Playlists, "lockState", true, function ( model, f21_arg1 )
		CoD.Menu.UpdateButtonShownState( f21_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Playlists:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f22_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f22_local0
	end )
	Playlists:registerEventHandler( "gain_focus", function ( element, event )
		local f23_local0 = nil
		if element.gainFocus then
			f23_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f23_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f23_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Playlists, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f24_arg0, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( f24_arg0, f24_arg2, "locked" ) then
			CoD.DirectorUtility.SetPlaylist( f24_arg2, f24_arg0 )
			PlaySoundSetSound( self, "action" )
			GoBack( self, f24_arg2 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f24_arg0, f24_arg2, "DirectorFindGame", f24_arg1 )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f24_arg0, f24_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.StoreUtility.OpenStoreToDLCPack( self, f24_arg0, f24_arg2, "DirectorFindGame", f24_arg1 )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f25_arg0, "purchasable", true ) and not CoD.ModelUtility.IsSelfModelValueTrue( f25_arg0, f25_arg2, "locked" ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x9B632F6362EA1BE] ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelValueEqualToEnum( f25_arg0, f25_arg2, "lockState", Enum[0xDACBB5C5F26BCD9][0x4BDEB566326AC98] ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Playlists:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Playlists )
	end )
	self:addElement( Playlists )
	self.Playlists = Playlists
	
	Tutorial = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	Tutorial:setLeftRight( 0, 0, 97, 1141 )
	Tutorial:setTopBottom( 0, 0, 188, 664 )
	Tutorial:setAlpha( 0 )
	Tutorial:setWidgetType( CoD.DirectorZMTutorialSelectItem )
	Tutorial:setHorizontalCount( 2 )
	Tutorial:setSpacing( 20 )
	Tutorial:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Tutorial:setVerticalCounter( CoD.verticalCounter )
	Tutorial:setDataSource( "DirectorPlaylistMapList" )
	Tutorial:appendEventHandler( "on_session_start", function ( f27_arg0, f27_arg1 )
		f27_arg1.menu = f27_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f27_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	Tutorial:appendEventHandler( "on_session_end", function ( f28_arg0, f28_arg1 )
		f28_arg1.menu = f28_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f28_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	local f1_local7 = Engine.GetGlobalModel()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.lobbyNav"], function ( f29_arg0, f29_arg1 )
		CoD.Menu.UpdateButtonShownState( f29_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	f1_local7 = Engine.GetGlobalModel()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.gameClient.update"], function ( f30_arg0, f30_arg1 )
		CoD.Menu.UpdateButtonShownState( f30_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	DifficultyList = Tutorial
	DottedDivider = Tutorial.subscribeToModel
	f1_local7 = Engine.GetGlobalModel()
	DottedDivider( DifficultyList, f1_local7["lobbyRoot.privateClient.update"], function ( f31_arg0, f31_arg1 )
		CoD.Menu.UpdateButtonShownState( f31_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	Tutorial:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f32_local0 = nil
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, element )
		return f32_local0
	end )
	Tutorial:registerEventHandler( "gain_focus", function ( element, event )
		local f33_local0 = nil
		if element.gainFocus then
			f33_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f33_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f33_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Tutorial, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f34_arg0, "purchasable", true ) then
			CoD.DirectorUtility.SetPlaylist( f34_arg2, f34_arg0 )
			PlaySoundSetSound( self, "action" )
			GoBack( self, f34_arg2 )
			return true
		elseif IsLobbyHostOfCurrentMenu() then
			OpenOverlay( self, "Store", f34_arg2 )
			return true
		else
			
		end
	end, function ( f35_arg0, f35_arg1, f35_arg2 )
		if IsLobbyHostOfCurrentMenu() and not IsElementPropertyValue( f35_arg0, "purchasable", true ) then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif IsLobbyHostOfCurrentMenu() then
			CoD.Menu.SetButtonLabel( f35_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	Tutorial:subscribeToGlobalModel( f1_arg1, "ZMLobbyExclusions", "ZMPlaylistTab", function ( model )
		CoD.ZombieUtility.UpdateFocusedPlaylistID( f1_arg1, Tutorial )
	end )
	self:addElement( Tutorial )
	self.Tutorial = Tutorial
	
	DottedDivider = LUI.UIImage.new( 0, 0, 615, 619, 0, 0, -261, 783 )
	DottedDivider:setAlpha( 0 )
	DottedDivider:setZRot( 90 )
	DottedDivider:setImage( RegisterImage( uie_ui_hud_tak5_repeat_linker ) )
	DottedDivider:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	DottedDivider:setShaderVector( 0, 0, 0, 0, 0 )
	DottedDivider:setupNineSliceShader( 4, 8 )
	self:addElement( DottedDivider )
	self.DottedDivider = DottedDivider
	
	DifficultyList = LUI.UIList.new( f1_arg0, f1_arg1, 20, 0, nil, false, false, false, false )
	DifficultyList:setLeftRight( 0, 0, 97, 1141 )
	DifficultyList:setTopBottom( 0, 0, 189, 241 )
	DifficultyList:setAlpha( 0 )
	DifficultyList:setWidgetType( CoD.ZMDifficultySelectButton )
	DifficultyList:setHorizontalCount( 4 )
	DifficultyList:setSpacing( 20 )
	DifficultyList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	DifficultyList:setDataSource( "ZMDifficultyList" )
	DifficultyList:registerEventHandler( "gain_focus", function ( element, event )
		local f37_local0 = nil
		if element.gainFocus then
			f37_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f37_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f37_local0
	end )
	f1_arg0:AddButtonCallbackFunction( DifficultyList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		CoD.ZombieUtility.SelectDifficulty( f38_arg0, f38_arg2 )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( f39_arg0, f39_arg1, f39_arg2 )
		CoD.Menu.SetButtonLabel( f39_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xAC3B80C833B60E1, nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( DifficultyList )
	self.DifficultyList = DifficultyList
	
	self:mergeStateConditions( {
		{
			stateName = "Featured",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.FeaturedInfo()
			end
		},
		{
			stateName = "Classic",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ClassicInfo()
			end
		},
		{
			stateName = "ZombieRush",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.ZombieRushInfo()
			end
		},
		{
			stateName = "TCM",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TCMInfo()
			end
		},
		{
			stateName = "Trials",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TrialsInfo()
			end
		},
		{
			stateName = "Tutorial",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.TutorialInfo()
			end
		}
	} )
	local f1_local8 = self
	f1_local7 = self.subscribeToModel
	local f1_local9 = Engine.GetGlobalModel()
	f1_local7( f1_local8, f1_local9["ZMLobbyExclusions.ZMPlaylistTab"], function ( f46_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f46_arg0:get(),
			modelName = "ZMLobbyExclusions.ZMPlaylistTab"
		} )
	end, false )
	self:registerEventHandler( "occlusion_change", function ( element, event )
		local f47_local0 = nil
		if element.OcclusionChange then
			f47_local0 = element:OcclusionChange( event )
		elseif element.super.OcclusionChange then
			f47_local0 = element.super:OcclusionChange( event )
		end
		if CoD.ZombieUtility.TutorialInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Tutorial, f1_arg1 )
		elseif CoD.ZombieUtility.FeaturedInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Playlists, f1_arg1 )
		else
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Maps, f1_arg1 )
		end
		if not f47_local0 then
			f47_local0 = element:dispatchEventToChildren( event )
		end
		return f47_local0
	end )
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "ZMLobbyExclusions.ZMPlaylistTab", function ( model )
		local f48_local0 = self
		if CoD.ZombieUtility.FeaturedInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Playlists, f1_arg1 )
		elseif CoD.ZombieUtility.TutorialInfo() then
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Tutorial, f1_arg1 )
		else
			CoD.FreeCursorUtility.GiveFocusToElementsDefaultFocus( f1_arg0, self.Maps, f1_arg1 )
		end
	end )
	Maps.id = "Maps"
	Playlists.id = "Playlists"
	Tutorial.id = "Tutorial"
	DifficultyList.id = "DifficultyList"
	self.__defaultFocus = Playlists
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DirectorGamemodeSelectionZMInternal.__resetProperties = function ( f49_arg0 )
	f49_arg0.Playlists:completeAnimation()
	f49_arg0.Maps:completeAnimation()
	f49_arg0.DifficultyList:completeAnimation()
	f49_arg0.DottedDivider:completeAnimation()
	f49_arg0.Tutorial:completeAnimation()
	f49_arg0.Playlists:setAlpha( 0 )
	f49_arg0.Maps:setAlpha( 0 )
	f49_arg0.DifficultyList:setAlpha( 0 )
	f49_arg0.DottedDivider:setAlpha( 0 )
	f49_arg0.Tutorial:setAlpha( 0 )
end

CoD.DirectorGamemodeSelectionZMInternal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f50_arg0, f50_arg1 )
			f50_arg0:__resetProperties()
			f50_arg0:setupElementClipCounter( 0 )
		end
	},
	Featured = {
		DefaultClip = function ( f51_arg0, f51_arg1 )
			f51_arg0:__resetProperties()
			f51_arg0:setupElementClipCounter( 1 )
			f51_arg0.Playlists:completeAnimation()
			f51_arg0.Playlists:setAlpha( 1 )
			f51_arg0.clipFinished( f51_arg0.Playlists )
		end
	},
	Classic = {
		DefaultClip = function ( f52_arg0, f52_arg1 )
			f52_arg0:__resetProperties()
			f52_arg0:setupElementClipCounter( 3 )
			f52_arg0.Maps:completeAnimation()
			f52_arg0.Maps:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.Maps )
			f52_arg0.DottedDivider:completeAnimation()
			f52_arg0.DottedDivider:setAlpha( 0.15 )
			f52_arg0.clipFinished( f52_arg0.DottedDivider )
			f52_arg0.DifficultyList:completeAnimation()
			f52_arg0.DifficultyList:setAlpha( 1 )
			f52_arg0.clipFinished( f52_arg0.DifficultyList )
		end
	},
	ZombieRush = {
		DefaultClip = function ( f53_arg0, f53_arg1 )
			f53_arg0:__resetProperties()
			f53_arg0:setupElementClipCounter( 1 )
			f53_arg0.Maps:completeAnimation()
			f53_arg0.Maps:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.Maps )
		end
	},
	TCM = {
		DefaultClip = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 1 )
			f54_arg0.Maps:completeAnimation()
			f54_arg0.Maps:setAlpha( 1 )
			f54_arg0.clipFinished( f54_arg0.Maps )
		end
	},
	Trials = {
		DefaultClip = function ( f55_arg0, f55_arg1 )
			f55_arg0:__resetProperties()
			f55_arg0:setupElementClipCounter( 1 )
			f55_arg0.Maps:completeAnimation()
			f55_arg0.Maps:setAlpha( 1 )
			f55_arg0.clipFinished( f55_arg0.Maps )
		end
	},
	Tutorial = {
		DefaultClip = function ( f56_arg0, f56_arg1 )
			f56_arg0:__resetProperties()
			f56_arg0:setupElementClipCounter( 2 )
			f56_arg0.Playlists:completeAnimation()
			f56_arg0.Playlists:setAlpha( 0 )
			f56_arg0.clipFinished( f56_arg0.Playlists )
			f56_arg0.Tutorial:completeAnimation()
			f56_arg0.Tutorial:setAlpha( 1 )
			f56_arg0.clipFinished( f56_arg0.Tutorial )
		end
	}
}
CoD.DirectorGamemodeSelectionZMInternal.__onClose = function ( f57_arg0 )
	f57_arg0.DirectorInfoPanelZM:close()
	f57_arg0.Maps:close()
	f57_arg0.Playlists:close()
	f57_arg0.Tutorial:close()
	f57_arg0.DifficultyList:close()
end

