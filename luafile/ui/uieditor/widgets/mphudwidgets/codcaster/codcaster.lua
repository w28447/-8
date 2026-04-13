require( "ui/uieditor/menus/codcaster/codcasterquicksettingssidebar" )
require( "ui/uieditor/menus/codcaster/codcastersettingssidebar" )
require( "ui/uieditor/widgets/codcaster/codcaster_keyboard" )
require( "ui/uieditor/widgets/codcaster/codcasterannouncementfeed" )
require( "ui/uieditor/widgets/codcaster/codcasterheadernonteambased" )
require( "ui/uieditor/widgets/codcaster/codcasterloadoutprimary" )
require( "ui/uieditor/widgets/codcaster/codcasterloadoutsecondary" )
require( "ui/uieditor/widgets/codcaster/codcasterloadouttalents" )
require( "ui/uieditor/widgets/codcaster/codcasterminimapposition" )
require( "ui/uieditor/widgets/codcaster/codcasterobjectivestatus" )
require( "ui/uieditor/widgets/codcaster/codcasterplayerlist" )
require( "ui/uieditor/widgets/codcaster/codcasterportraitplayercard" )
require( "ui/uieditor/widgets/codcaster/codcasterportraitplayerlist" )
require( "ui/uieditor/widgets/codcasterteamscoreboard" )
require( "ui/uieditor/widgets/mphudwidgets/codcaster/codcasterbuttonbar" )
require( "ui/uieditor/widgets/mphudwidgets/codcaster/codcastermap" )
require( "ui/uieditor/widgets/onofftext" )

CoD.CodCaster = InheritFrom( LUI.UIElement )
CoD.CodCaster.__defaultWidth = 1920
CoD.CodCaster.__defaultHeight = 1080
CoD.CodCaster.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	SetProperty( self, "m_focusable", true )
	SetProperty( self, "m_disableNavigation", true )
	self:setClass( CoD.CodCaster )
	self.id = "CodCaster"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local OverheadMap = CoD.CodCasterMap.new( f1_arg0, f1_arg1, 0.5, 0.5, -750, 750, 0.51, 0.51, -377, 467 )
	OverheadMap:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f2_local0 = CoD.ModelUtility.IsModelValueTrue( f1_arg1, "CodCaster.showFullScreenMap" )
				if f2_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) then
						f2_local0 = not CoD.CodCasterUtility.CodCasterIsInAerialCam( f1_arg1 )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		}
	} )
	local CodCasterHeaderNonTeamBased = OverheadMap
	local waitingForPlayers = OverheadMap.subscribeToModel
	local CodCasterPortraitPlayerCard = Engine.GetModelForController( f1_arg1 )
	waitingForPlayers( CodCasterHeaderNonTeamBased, CodCasterPortraitPlayerCard["CodCaster.showFullScreenMap"], function ( f3_arg0 )
		f1_arg0:updateElementState( OverheadMap, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "CodCaster.showFullScreenMap"
		} )
	end, false )
	CodCasterHeaderNonTeamBased = OverheadMap
	waitingForPlayers = OverheadMap.subscribeToModel
	CodCasterPortraitPlayerCard = Engine.GetModelForController( f1_arg1 )
	waitingForPlayers( CodCasterHeaderNonTeamBased, CodCasterPortraitPlayerCard["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f4_arg0 )
		f1_arg0:updateElementState( OverheadMap, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterHeaderNonTeamBased = OverheadMap
	waitingForPlayers = OverheadMap.subscribeToModel
	CodCasterPortraitPlayerCard = Engine.GetModelForController( f1_arg1 )
	waitingForPlayers( CodCasterHeaderNonTeamBased, CodCasterPortraitPlayerCard["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]], function ( f5_arg0 )
		f1_arg0:updateElementState( OverheadMap, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]
		} )
	end, false )
	self:addElement( OverheadMap )
	self.OverheadMap = OverheadMap
	
	waitingForPlayers = CoD.onOffText.new( f1_arg0, f1_arg1, 0.5, 0.5, -373, 377, 0, 0, 547, 393 )
	waitingForPlayers:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToEnum( f1_arg1, "DeadSpectate", "playerTeam", Enum.team_t[0xE4DDAC9C5C45556] )
			end
		}
	} )
	CodCasterPortraitPlayerCard = waitingForPlayers
	CodCasterHeaderNonTeamBased = waitingForPlayers.subscribeToModel
	local CodCasterPortraitPlayerList = DataSources.DeadSpectate.getModel( f1_arg1 )
	CodCasterHeaderNonTeamBased( CodCasterPortraitPlayerCard, CodCasterPortraitPlayerList.playerTeam, function ( f7_arg0 )
		f1_arg0:updateElementState( waitingForPlayers, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "playerTeam"
		} )
	end, false )
	waitingForPlayers.TextBox:setText( Engine[0xF9F1239CFD921FE]( 0xE26CA69C50088EB ) )
	waitingForPlayers.TextBox:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( waitingForPlayers )
	self.waitingForPlayers = waitingForPlayers
	
	CodCasterHeaderNonTeamBased = CoD.CodCasterHeaderNonTeamBased.new( f1_arg0, f1_arg1, 0.5, 0.5, -262, 262, 0, 0, 16, 164 )
	CodCasterHeaderNonTeamBased:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
					f8_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
					if f8_local0 then
						f8_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_teamscore", 1 )
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	CodCasterPortraitPlayerList = CodCasterHeaderNonTeamBased
	CodCasterPortraitPlayerCard = CodCasterHeaderNonTeamBased.subscribeToModel
	local CodCasterAnnouncementFeed = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerCard( CodCasterPortraitPlayerList, CodCasterAnnouncementFeed["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f9_arg0 )
		f1_arg0:updateElementState( CodCasterHeaderNonTeamBased, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterPortraitPlayerList = CodCasterHeaderNonTeamBased
	CodCasterPortraitPlayerCard = CodCasterHeaderNonTeamBased.subscribeToModel
	CodCasterAnnouncementFeed = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerCard( CodCasterPortraitPlayerList, CodCasterAnnouncementFeed.forceScoreboard, function ( f10_arg0 )
		f1_arg0:updateElementState( CodCasterHeaderNonTeamBased, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterPortraitPlayerList = CodCasterHeaderNonTeamBased
	CodCasterPortraitPlayerCard = CodCasterHeaderNonTeamBased.subscribeToModel
	CodCasterAnnouncementFeed = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerCard( CodCasterPortraitPlayerList, CodCasterAnnouncementFeed["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f11_arg0 )
		f1_arg0:updateElementState( CodCasterHeaderNonTeamBased, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterPortraitPlayerList = CodCasterHeaderNonTeamBased
	CodCasterPortraitPlayerCard = CodCasterHeaderNonTeamBased.subscribeToModel
	CodCasterAnnouncementFeed = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterPortraitPlayerCard( CodCasterPortraitPlayerList, CodCasterAnnouncementFeed.profileSettingsUpdated, function ( f12_arg0 )
		f1_arg0:updateElementState( CodCasterHeaderNonTeamBased, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f12_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	CodCasterHeaderNonTeamBased:setAlpha( 0 )
	self:addElement( CodCasterHeaderNonTeamBased )
	self.CodCasterHeaderNonTeamBased = CodCasterHeaderNonTeamBased
	
	CodCasterPortraitPlayerCard = CoD.CodCasterPortraitPlayerCard.new( f1_arg0, f1_arg1, -0, 1, 0, 0, 1, 1, -124, -24 )
	CodCasterPortraitPlayerCard:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f13_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) then
					f13_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playercard", 1 )
					if f13_local0 then
						if not ScoreboardVisible( f1_arg1 ) then
							f13_local0 = not CoD.CodCasterUtility.CodCasterIsInAerialCam( f1_arg1 )
						else
							f13_local0 = false
						end
					end
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerCard
	CodCasterPortraitPlayerList = CodCasterPortraitPlayerCard.subscribeToModel
	local CodCasterPortraitTeamScoreBoard = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerList( CodCasterAnnouncementFeed, CodCasterPortraitTeamScoreBoard["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f14_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerCard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerCard
	CodCasterPortraitPlayerList = CodCasterPortraitPlayerCard.subscribeToModel
	CodCasterPortraitTeamScoreBoard = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterPortraitPlayerList( CodCasterAnnouncementFeed, CodCasterPortraitTeamScoreBoard.profileSettingsUpdated, function ( f15_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerCard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerCard
	CodCasterPortraitPlayerList = CodCasterPortraitPlayerCard.subscribeToModel
	CodCasterPortraitTeamScoreBoard = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerList( CodCasterAnnouncementFeed, CodCasterPortraitTeamScoreBoard.forceScoreboard, function ( f16_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerCard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerCard
	CodCasterPortraitPlayerList = CodCasterPortraitPlayerCard.subscribeToModel
	CodCasterPortraitTeamScoreBoard = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerList( CodCasterAnnouncementFeed, CodCasterPortraitTeamScoreBoard["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f17_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerCard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f17_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerCard
	CodCasterPortraitPlayerList = CodCasterPortraitPlayerCard.subscribeToModel
	CodCasterPortraitTeamScoreBoard = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitPlayerList( CodCasterAnnouncementFeed, CodCasterPortraitTeamScoreBoard["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]], function ( f18_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerCard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f18_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]
		} )
	end, false )
	CodCasterPortraitPlayerCard:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerIndex", function ( model )
		local f19_local0 = model:get()
		if f19_local0 ~= nil then
			CodCasterPortraitPlayerCard.CodCasterPlayerCardName:setText( GetClientNameAndClanTag( f1_arg1, f19_local0 ) )
		end
	end )
	CodCasterPortraitPlayerCard:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerIndex", function ( model )
		local f20_local0 = CodCasterPortraitPlayerCard
		PlayClipOnElement( self, {
			elementName = "CodCasterPortraitPlayerCard",
			clipName = "ShineOverlay"
		}, f1_arg1 )
	end )
	self:addElement( CodCasterPortraitPlayerCard )
	self.CodCasterPortraitPlayerCard = CodCasterPortraitPlayerCard
	
	CodCasterPortraitPlayerList = CoD.CodCasterPortraitPlayerList.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 0, 0, 28, 173 )
	CodCasterPortraitPlayerList:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f21_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
				if f21_local0 then
					if not ScoreboardVisible( f1_arg1 ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) then
						f21_local0 = CoD.CodCasterUtility.CodCasterShowPortraitList( f1_arg1 )
					else
						f21_local0 = false
					end
				end
				return f21_local0
			end
		}
	} )
	CodCasterPortraitTeamScoreBoard = CodCasterPortraitPlayerList
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerList.subscribeToModel
	local CodCasterObjectiveStatus = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterAnnouncementFeed( CodCasterPortraitTeamScoreBoard, CodCasterObjectiveStatus.profileSettingsUpdated, function ( f22_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f22_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	CodCasterPortraitTeamScoreBoard = CodCasterPortraitPlayerList
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerList.subscribeToModel
	CodCasterObjectiveStatus = Engine.GetModelForController( f1_arg1 )
	CodCasterAnnouncementFeed( CodCasterPortraitTeamScoreBoard, CodCasterObjectiveStatus.forceScoreboard, function ( f23_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f23_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterPortraitTeamScoreBoard = CodCasterPortraitPlayerList
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerList.subscribeToModel
	CodCasterObjectiveStatus = Engine.GetModelForController( f1_arg1 )
	CodCasterAnnouncementFeed( CodCasterPortraitTeamScoreBoard, CodCasterObjectiveStatus["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f24_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f24_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterPortraitTeamScoreBoard = CodCasterPortraitPlayerList
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerList.subscribeToModel
	CodCasterObjectiveStatus = Engine.GetModelForController( f1_arg1 )
	CodCasterAnnouncementFeed( CodCasterPortraitTeamScoreBoard, CodCasterObjectiveStatus["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f25_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f25_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterPortraitTeamScoreBoard = CodCasterPortraitPlayerList
	CodCasterAnnouncementFeed = CodCasterPortraitPlayerList.subscribeToModel
	CodCasterObjectiveStatus = Engine.GetModelForController( f1_arg1 )
	CodCasterAnnouncementFeed( CodCasterPortraitTeamScoreBoard, CodCasterObjectiveStatus["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3DA38CAFF843C18]], function ( f26_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f26_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3DA38CAFF843C18]
		} )
	end, false )
	self:addElement( CodCasterPortraitPlayerList )
	self.CodCasterPortraitPlayerList = CodCasterPortraitPlayerList
	
	CodCasterAnnouncementFeed = CoD.CodCasterAnnouncementFeed.new( f1_arg0, f1_arg1, 0.5, 0.5, -197, 197, 0, 0, 154, 178 )
	CodCasterAnnouncementFeed:mergeStateConditions( {
		{
			stateName = "HiddenDueToScoreboard",
			condition = function ( menu, element, event )
				return ScoreboardVisible( f1_arg1 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] )
			end
		}
	} )
	CodCasterObjectiveStatus = CodCasterAnnouncementFeed
	CodCasterPortraitTeamScoreBoard = CodCasterAnnouncementFeed.subscribeToModel
	local CodCasterPlayerList = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterPortraitTeamScoreBoard( CodCasterObjectiveStatus, CodCasterPlayerList.profileSettingsUpdated, function ( f29_arg0 )
		f1_arg0:updateElementState( CodCasterAnnouncementFeed, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f29_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	CodCasterObjectiveStatus = CodCasterAnnouncementFeed
	CodCasterPortraitTeamScoreBoard = CodCasterAnnouncementFeed.subscribeToModel
	CodCasterPlayerList = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitTeamScoreBoard( CodCasterObjectiveStatus, CodCasterPlayerList.forceScoreboard, function ( f30_arg0 )
		f1_arg0:updateElementState( CodCasterAnnouncementFeed, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f30_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterObjectiveStatus = CodCasterAnnouncementFeed
	CodCasterPortraitTeamScoreBoard = CodCasterAnnouncementFeed.subscribeToModel
	CodCasterPlayerList = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitTeamScoreBoard( CodCasterObjectiveStatus, CodCasterPlayerList["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f31_arg0 )
		f1_arg0:updateElementState( CodCasterAnnouncementFeed, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f31_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterObjectiveStatus = CodCasterAnnouncementFeed
	CodCasterPortraitTeamScoreBoard = CodCasterAnnouncementFeed.subscribeToModel
	CodCasterPlayerList = Engine.GetModelForController( f1_arg1 )
	CodCasterPortraitTeamScoreBoard( CodCasterObjectiveStatus, CodCasterPlayerList["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f32_arg0 )
		f1_arg0:updateElementState( CodCasterAnnouncementFeed, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f32_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	self:addElement( CodCasterAnnouncementFeed )
	self.CodCasterAnnouncementFeed = CodCasterAnnouncementFeed
	
	CodCasterPortraitTeamScoreBoard = CoD.CodCasterTeamScoreboard.new( f1_arg0, f1_arg1, 0.5, 0.5, -260, 260, 0, 0, 30, 146 )
	CodCasterPortraitTeamScoreBoard:mergeStateConditions( {
		{
			stateName = "teamLeftwatch",
			condition = function ( menu, element, event )
				local f33_local0 = CoD.CodCasterUtility.CurrentSpectatedTeamEqualTo( f1_arg1, 1 )
				if f33_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
						f33_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
						if f33_local0 then
							f33_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_teamscore", 1 )
						end
					else
						f33_local0 = false
					end
				end
				return f33_local0
			end
		},
		{
			stateName = "teamRigthwatch",
			condition = function ( menu, element, event )
				local f34_local0 = CoD.CodCasterUtility.CurrentSpectatedTeamEqualTo( f1_arg1, 2 )
				if f34_local0 then
					if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
						f34_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
						if f34_local0 then
							f34_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_teamscore", 1 )
						end
					else
						f34_local0 = false
					end
				end
				return f34_local0
			end
		}
	} )
	CodCasterPlayerList = CodCasterPortraitTeamScoreBoard
	CodCasterObjectiveStatus = CodCasterPortraitTeamScoreBoard.subscribeToModel
	local CodCasterLoadoutTalents = Engine.GetModelForController( f1_arg1 )
	CodCasterObjectiveStatus( CodCasterPlayerList, CodCasterLoadoutTalents["deadSpectator.playerTeam"], function ( f35_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitTeamScoreBoard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f35_arg0:get(),
			modelName = "deadSpectator.playerTeam"
		} )
	end, false )
	CodCasterPlayerList = CodCasterPortraitTeamScoreBoard
	CodCasterObjectiveStatus = CodCasterPortraitTeamScoreBoard.subscribeToModel
	CodCasterLoadoutTalents = Engine.GetModelForController( f1_arg1 )
	CodCasterObjectiveStatus( CodCasterPlayerList, CodCasterLoadoutTalents["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f36_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitTeamScoreBoard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f36_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterPlayerList = CodCasterPortraitTeamScoreBoard
	CodCasterObjectiveStatus = CodCasterPortraitTeamScoreBoard.subscribeToModel
	CodCasterLoadoutTalents = Engine.GetModelForController( f1_arg1 )
	CodCasterObjectiveStatus( CodCasterPlayerList, CodCasterLoadoutTalents.forceScoreboard, function ( f37_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitTeamScoreBoard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f37_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterPlayerList = CodCasterPortraitTeamScoreBoard
	CodCasterObjectiveStatus = CodCasterPortraitTeamScoreBoard.subscribeToModel
	CodCasterLoadoutTalents = Engine.GetModelForController( f1_arg1 )
	CodCasterObjectiveStatus( CodCasterPlayerList, CodCasterLoadoutTalents["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f38_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitTeamScoreBoard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f38_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterPlayerList = CodCasterPortraitTeamScoreBoard
	CodCasterObjectiveStatus = CodCasterPortraitTeamScoreBoard.subscribeToModel
	CodCasterLoadoutTalents = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterObjectiveStatus( CodCasterPlayerList, CodCasterLoadoutTalents.profileSettingsUpdated, function ( f39_arg0 )
		f1_arg0:updateElementState( CodCasterPortraitTeamScoreBoard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f39_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	self:addElement( CodCasterPortraitTeamScoreBoard )
	self.CodCasterPortraitTeamScoreBoard = CodCasterPortraitTeamScoreBoard
	
	CodCasterObjectiveStatus = CoD.CodCasterObjectiveStatus.new( f1_arg0, f1_arg1, 0.5, 0.5, -260, 260, 0, 0, 104, 168 )
	CodCasterObjectiveStatus:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f40_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
					f40_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
					if f40_local0 then
						f40_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_teamscore", 1 )
						if f40_local0 then
							f40_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_ds_objective_status", 1 )
						end
					end
				else
					f40_local0 = false
				end
				return f40_local0
			end
		}
	} )
	CodCasterLoadoutTalents = CodCasterObjectiveStatus
	CodCasterPlayerList = CodCasterObjectiveStatus.subscribeToModel
	local CodCasterLoadoutPrimary = Engine.GetModelForController( f1_arg1 )
	CodCasterPlayerList( CodCasterLoadoutTalents, CodCasterLoadoutPrimary["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f41_arg0 )
		f1_arg0:updateElementState( CodCasterObjectiveStatus, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f41_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterLoadoutTalents = CodCasterObjectiveStatus
	CodCasterPlayerList = CodCasterObjectiveStatus.subscribeToModel
	CodCasterLoadoutPrimary = Engine.GetModelForController( f1_arg1 )
	CodCasterPlayerList( CodCasterLoadoutTalents, CodCasterLoadoutPrimary.forceScoreboard, function ( f42_arg0 )
		f1_arg0:updateElementState( CodCasterObjectiveStatus, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f42_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterLoadoutTalents = CodCasterObjectiveStatus
	CodCasterPlayerList = CodCasterObjectiveStatus.subscribeToModel
	CodCasterLoadoutPrimary = Engine.GetModelForController( f1_arg1 )
	CodCasterPlayerList( CodCasterLoadoutTalents, CodCasterLoadoutPrimary["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f43_arg0 )
		f1_arg0:updateElementState( CodCasterObjectiveStatus, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f43_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterLoadoutTalents = CodCasterObjectiveStatus
	CodCasterPlayerList = CodCasterObjectiveStatus.subscribeToModel
	CodCasterLoadoutPrimary = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterPlayerList( CodCasterLoadoutTalents, CodCasterLoadoutPrimary.profileSettingsUpdated, function ( f44_arg0 )
		f1_arg0:updateElementState( CodCasterObjectiveStatus, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f44_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	self:addElement( CodCasterObjectiveStatus )
	self.CodCasterObjectiveStatus = CodCasterObjectiveStatus
	
	CodCasterPlayerList = CoD.CodCasterPlayerList.new( f1_arg0, f1_arg1, 0.98, 0.98, -411, -3, 0, 0, 245, 971 )
	CodCasterPlayerList:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f45_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
					f45_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
					if f45_local0 then
						f45_local0 = CoD.CodCasterUtility.CodCasterShowPlayerList( self, f1_arg1 )
						if f45_local0 then
							f45_local0 = IsTeamBasedGame( f1_arg1 )
							if f45_local0 then
								f45_local0 = not CoD.ModelUtility.IsModelValueTrue( f1_arg1, "CodCaster.showKeyboard" )
							end
						end
					end
				else
					f45_local0 = false
				end
				return f45_local0
			end
		},
		{
			stateName = "NonTeamBased",
			condition = function ( menu, element, event )
				local f46_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not ScoreboardVisible( f1_arg1 ) then
					f46_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_playerlist", 1 )
					if f46_local0 then
						f46_local0 = CoD.CodCasterUtility.CodCasterShowPlayerList( self, f1_arg1 )
						if f46_local0 then
							if not IsTeamBasedGame( f1_arg1 ) then
								f46_local0 = not CoD.ModelUtility.IsModelValueTrue( f1_arg1, "CodCaster.showKeyboard" )
							else
								f46_local0 = false
							end
						end
					end
				else
					f46_local0 = false
				end
				return f46_local0
			end
		}
	} )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	local CodCasterLoadoutSecondary = Engine.GetModelForController( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f47_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f47_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = Engine.GetModelForController( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary.forceScoreboard, function ( f48_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f48_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = Engine.GetModelForController( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f49_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f49_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = DataSources.CodCaster.getModel( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary.profileSettingsUpdated, function ( f50_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f50_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = Engine.GetModelForController( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary["UIVisibilityBit." .. Enum.UIVisibilityBit[0x3DA38CAFF843C18]], function ( f51_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f51_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x3DA38CAFF843C18]
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = Engine.GetGlobalModel()
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary["MapVote.mapVoteMapPreviousGametype"], function ( f52_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f52_arg0:get(),
			modelName = "MapVote.mapVoteMapPreviousGametype"
		} )
	end, false )
	CodCasterLoadoutPrimary = CodCasterPlayerList
	CodCasterLoadoutTalents = CodCasterPlayerList.subscribeToModel
	CodCasterLoadoutSecondary = Engine.GetModelForController( f1_arg1 )
	CodCasterLoadoutTalents( CodCasterLoadoutPrimary, CodCasterLoadoutSecondary["CodCaster.showKeyboard"], function ( f53_arg0 )
		f1_arg0:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f53_arg0:get(),
			modelName = "CodCaster.showKeyboard"
		} )
	end, false )
	self:addElement( CodCasterPlayerList )
	self.CodCasterPlayerList = CodCasterPlayerList
	
	CodCasterLoadoutTalents = CoD.CodCasterLoadoutTalents.new( f1_arg0, f1_arg1, 0, 0, 321, 1121, 1, 1, -98, -23 )
	CodCasterLoadoutTalents:setAlpha( 0 )
	self:addElement( CodCasterLoadoutTalents )
	self.CodCasterLoadoutTalents = CodCasterLoadoutTalents
	
	CodCasterLoadoutPrimary = CoD.CodCasterLoadoutPrimary.new( f1_arg0, f1_arg1, 1, 1, -821, -320, 1, 1, -99, -24 )
	CodCasterLoadoutPrimary:setAlpha( 0 )
	self:addElement( CodCasterLoadoutPrimary )
	self.CodCasterLoadoutPrimary = CodCasterLoadoutPrimary
	
	CodCasterLoadoutSecondary = CoD.CodCasterLoadoutSecondary.new( f1_arg0, f1_arg1, 1, 1, -705, -204, 1, 1, -176, -101 )
	CodCasterLoadoutSecondary:setAlpha( 0 )
	self:addElement( CodCasterLoadoutSecondary )
	self.CodCasterLoadoutSecondary = CodCasterLoadoutSecondary
	
	local CodCasterButtonBar = CoD.CodCasterButtonBar.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 1, 1, -107, -71 )
	self:addElement( CodCasterButtonBar )
	self.CodCasterButtonBar = CodCasterButtonBar
	
	local CodCasterKeyboard = CoD.CodCaster_Keyboard.new( f1_arg0, f1_arg1, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	CodCasterKeyboard:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueTrue( f1_arg1, "CodCaster.showKeyboard" ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] )
			end
		}
	} )
	local f1_local15 = CodCasterKeyboard
	local CodCasterMiniMapPosition = CodCasterKeyboard.subscribeToModel
	local f1_local17 = Engine.GetModelForController( f1_arg1 )
	CodCasterMiniMapPosition( f1_local15, f1_local17["CodCaster.showKeyboard"], function ( f55_arg0 )
		f1_arg0:updateElementState( CodCasterKeyboard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f55_arg0:get(),
			modelName = "CodCaster.showKeyboard"
		} )
	end, false )
	f1_local15 = CodCasterKeyboard
	CodCasterMiniMapPosition = CodCasterKeyboard.subscribeToModel
	f1_local17 = Engine.GetModelForController( f1_arg1 )
	CodCasterMiniMapPosition( f1_local15, f1_local17["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f56_arg0 )
		f1_arg0:updateElementState( CodCasterKeyboard, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f56_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	self:addElement( CodCasterKeyboard )
	self.CodCasterKeyboard = CodCasterKeyboard
	
	CodCasterMiniMapPosition = CoD.CodCasterMiniMapPosition.new( f1_arg0, f1_arg1, 0, 0, 0, 1920, 0, 0, 224, 624 )
	self:addElement( CodCasterMiniMapPosition )
	self.CodCasterMiniMapPosition = CodCasterMiniMapPosition
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f57_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] )
				if not f57_local0 then
					f57_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] )
					if not f57_local0 then
						f57_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] )
						if not f57_local0 then
							f57_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x4828BED794DA0A5] )
						end
					end
				end
				return f57_local0
			end
		},
		{
			stateName = "HiddenCopy",
			condition = function ( menu, element, event )
				return ShouldHideCodCasterHud( f1_arg1 )
			end
		},
		{
			stateName = "VisibleLoadoutAndNotTeamBased",
			condition = function ( menu, element, event )
				local f59_local0
				if not IsGametypeTeambased() and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f1_arg1 ) and not ScoreboardVisible( f1_arg1 ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x4828BED794DA0A5] ) and not CoD.HUDUtility.IsGameTypeEqualToString( "gun" ) then
					f59_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_loadout", 1 )
					if f59_local0 then
						f59_local0 = not CoD.HUDUtility.IsGameTypeEqualToString( "oic" )
					end
				else
					f59_local0 = false
				end
				return f59_local0
			end
		},
		{
			stateName = "VisibleLoadout",
			condition = function ( menu, element, event )
				local f60_local0
				if not CoD.CodCasterUtility.CodCasterIsInAerialCam( f1_arg1 ) and not ScoreboardVisible( f1_arg1 ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x6668F0686232679] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x4828BED794DA0A5] ) then
					f60_local0 = IsCodCasterProfileValueEqualTo( f1_arg1, "shoutcaster_qs_loadout", 1 )
					if f60_local0 then
						if not CoD.HUDUtility.IsGameTypeEqualToString( "gun" ) then
							f60_local0 = not CoD.HUDUtility.IsGameTypeEqualToString( "oic" )
						else
							f60_local0 = false
						end
					end
				else
					f60_local0 = false
				end
				return f60_local0
			end
		},
		{
			stateName = "NotTeamBased",
			condition = function ( menu, element, event )
				return not IsGametypeTeambased()
			end
		}
	} )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	local f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]], function ( f62_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f62_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f63_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f63_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f64_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f64_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x4828BED794DA0A5]], function ( f65_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f65_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x4828BED794DA0A5]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetGlobalModel()
	f1_local15( f1_local17, f1_local18["scoreboard.team1.count"], function ( f66_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f66_arg0:get(),
			modelName = "scoreboard.team1.count"
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetGlobalModel()
	f1_local15( f1_local17, f1_local18["scoreboard.team2.count"], function ( f67_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f67_arg0:get(),
			modelName = "scoreboard.team2.count"
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]], function ( f68_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f68_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18.forceScoreboard, function ( f69_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f69_arg0:get(),
			modelName = "forceScoreboard"
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f70_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f70_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = DataSources.CodCaster.getModel( f1_arg1 )
	f1_local15( f1_local17, f1_local18.profileSettingsUpdated, function ( f71_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f71_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]], function ( f72_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f72_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x6668F0686232679]
		} )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["CodCaster.showFullScreenMap"], function ( f73_arg0, f73_arg1 )
		CoD.Menu.UpdateButtonShownState( f73_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f73_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["CodCaster.showSettingsSideBar"], function ( f74_arg0, f74_arg1 )
		CoD.Menu.UpdateButtonShownState( f74_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0xA69E34E231CE8B6]], function ( f75_arg0, f75_arg1 )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x571F08AD84807E0] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f75_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0x7EAF988DDEB83EA]], function ( f76_arg0, f76_arg1 )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09] )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x571F08AD84807E0] )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f76_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = DataSources.CodCaster.getModel( f1_arg1 )
	f1_local15( f1_local17, f1_local18.profileSettingsUpdated, function ( f77_arg0, f77_arg1 )
		CoD.Menu.UpdateButtonShownState( f77_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f77_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	self:appendEventHandler( "input_source_changed", function ( f78_arg0, f78_arg1 )
		f78_arg1.menu = f78_arg1.menu or f1_arg0
		CoD.Menu.UpdateButtonShownState( f78_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f78_arg0, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18.LastInput, function ( f79_arg0, f79_arg1 )
		CoD.Menu.UpdateButtonShownState( f79_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A] )
		CoD.Menu.UpdateButtonShownState( f79_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18.forceScoreboard, function ( f80_arg0, f80_arg1 )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x571F08AD84807E0] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f80_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f81_arg0, f81_arg1 )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x571F08AD84807E0] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f81_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetGlobalModel()
	f1_local15( f1_local17, f1_local18["scoreboard.team1.count"], function ( f82_arg0, f82_arg1 )
		CoD.Menu.UpdateButtonShownState( f82_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f82_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetGlobalModel()
	f1_local15( f1_local17, f1_local18["scoreboard.team2.count"], function ( f83_arg0, f83_arg1 )
		CoD.Menu.UpdateButtonShownState( f83_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F] )
		CoD.Menu.UpdateButtonShownState( f83_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A] )
	end, false )
	f1_local17 = self
	f1_local15 = self.subscribeToModel
	f1_local18 = Engine.GetModelForController( f1_arg1 )
	f1_local15( f1_local17, f1_local18["CodCaster.showKeyboard"], function ( f84_arg0, f84_arg1 )
		CoD.Menu.UpdateButtonShownState( f84_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
		if CoD.ScoreboardUtility.CanShowScoreboard( f85_arg2 ) and not CoD.ModelUtility.IsModelValueTrue( f85_arg2, "CodCaster.showFullScreenMap" ) and not CoD.ModelUtility.IsModelValueEqualTo( f85_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f85_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.ScoreboardUtility.ShowScoreboard( f85_arg2 )
			return true
		elseif CoD.ScoreboardUtility.CanHideScoreboard( f85_arg2 ) and not CoD.ModelUtility.IsModelValueTrue( f85_arg2, "CodCaster.showFullScreenMap" ) and not CoD.ModelUtility.IsModelValueEqualTo( f85_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f85_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.ScoreboardUtility.HideScoreboard( f85_arg1, f85_arg2 )
			return true
		else
			
		end
	end, function ( f86_arg0, f86_arg1, f86_arg2 )
		if CoD.ScoreboardUtility.CanShowScoreboard( f86_arg2 ) and not CoD.ModelUtility.IsModelValueTrue( f86_arg2, "CodCaster.showFullScreenMap" ) and not CoD.ModelUtility.IsModelValueEqualTo( f86_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f86_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f86_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, nil )
			return false
		elseif CoD.ScoreboardUtility.CanHideScoreboard( f86_arg2 ) and not CoD.ModelUtility.IsModelValueTrue( f86_arg2, "CodCaster.showFullScreenMap" ) and not CoD.ModelUtility.IsModelValueEqualTo( f86_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f86_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f86_arg1, Enum.LUIButton[0x93AB4C84F113EE1], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], "M", function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
		if not CoD.ModelUtility.IsModelValueTrue( f87_arg2, "CodCaster.showFullScreenMap" ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f87_arg2 ) and not IsVisibilityBitSet( f87_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			ToggleControllerModelValueBoolean( f87_arg2, "CodCaster.showFullScreenMap" )
			CoD.ScoreboardUtility.HideScoreboard( f87_arg1, f87_arg2 )
			return true
		elseif not CoD.CodCasterUtility.CodCasterIsInAerialCam( f87_arg2 ) and not IsVisibilityBitSet( f87_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			ToggleControllerModelValueBoolean( f87_arg2, "CodCaster.showFullScreenMap" )
			return true
		else
			
		end
	end, function ( f88_arg0, f88_arg1, f88_arg2 )
		if not CoD.ModelUtility.IsModelValueTrue( f88_arg2, "CodCaster.showFullScreenMap" ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f88_arg2 ) and not IsVisibilityBitSet( f88_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f88_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x0, nil, "M" )
			return false
		elseif not CoD.CodCasterUtility.CodCasterIsInAerialCam( f88_arg2 ) and not IsVisibilityBitSet( f88_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f88_arg1, Enum.LUIButton[0xE6DB407A2AF8B09], 0x0, nil, "M" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "T", function ( f89_arg0, f89_arg1, f89_arg2, f89_arg3 )
		if IsCodCasterProfileValueEqualTo( f89_arg2, "shoutcaster_ds_toolbar", 1 ) and IsGamepad( f89_arg2 ) then
			SetCodCasterProfileValue( self, f89_arg0, f89_arg2, "shoutcaster_ds_toolbar", "0" )
			return true
		elseif IsCodCasterProfileValueEqualTo( f89_arg2, "shoutcaster_ds_toolbar", 0 ) and CoD.CodCasterUtility.HasButtonFocus( self ) and IsGamepad( f89_arg2 ) then
			SetCodCasterProfileValue( self, f89_arg0, f89_arg2, "shoutcaster_ds_toolbar", "1" )
			return true
		else
			
		end
	end, function ( f90_arg0, f90_arg1, f90_arg2 )
		if IsCodCasterProfileValueEqualTo( f90_arg2, "shoutcaster_ds_toolbar", 1 ) and IsGamepad( f90_arg2 ) then
			CoD.Menu.SetButtonLabel( f90_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x0, nil, "T" )
			return false
		elseif IsCodCasterProfileValueEqualTo( f90_arg2, "shoutcaster_ds_toolbar", 0 ) and CoD.CodCasterUtility.HasButtonFocus( self ) and IsGamepad( f90_arg2 ) then
			CoD.Menu.SetButtonLabel( f90_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], 0x0, nil, "T" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ENTER", function ( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
		if CoD.CodCasterUtility.HasButtonFocus( self ) and not IsVisibilityBitSet( f91_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f91_arg2 ) and not GameEnded( f91_arg2 ) and not IsMouse( f91_arg2 ) then
			CoD.CodCasterUtility.SpectatePlayer( self, f91_arg2 )
			return true
		else
			
		end
	end, function ( f92_arg0, f92_arg1, f92_arg2 )
		if CoD.CodCasterUtility.HasButtonFocus( self ) and not IsVisibilityBitSet( f92_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f92_arg2 ) and not GameEnded( f92_arg2 ) and not IsMouse( f92_arg2 ) then
			CoD.Menu.SetButtonLabel( f92_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ENTER" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "T", function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3 )
		if IsCodCasterProfileValueEqualTo( f93_arg2, "shoutcaster_ds_toolbar", 1 ) then
			SetCodCasterProfileValue( self, f93_arg0, f93_arg2, "shoutcaster_ds_toolbar", "0" )
			return true
		elseif IsCodCasterProfileValueEqualTo( f93_arg2, "shoutcaster_ds_toolbar", 0 ) and CoD.CodCasterUtility.HasButtonFocus( self ) then
			SetCodCasterProfileValue( self, f93_arg0, f93_arg2, "shoutcaster_ds_toolbar", "1" )
			return true
		else
			
		end
	end, function ( f94_arg0, f94_arg1, f94_arg2 )
		if IsCodCasterProfileValueEqualTo( f94_arg2, "shoutcaster_ds_toolbar", 1 ) then
			CoD.Menu.SetButtonLabel( f94_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "T" )
			return false
		elseif IsCodCasterProfileValueEqualTo( f94_arg2, "shoutcaster_ds_toolbar", 0 ) and CoD.CodCasterUtility.HasButtonFocus( self ) then
			CoD.Menu.SetButtonLabel( f94_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "T" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], "R", function ( f95_arg0, f95_arg1, f95_arg2, f95_arg3 )
		if not IsRepeatButtonPress( f95_arg3 ) and not IsVisibilityBitSet( f95_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f95_arg2 ) and not GameEnded( f95_arg2 ) then
			ToggleControllerModelValueNumber( f95_arg2, "CodCaster.showQuickSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterQuickSettingsSideBar", f95_arg2, 300 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f96_arg0, f96_arg1, f96_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f96_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f96_arg2 ) and not GameEnded( f96_arg2 ) then
			CoD.Menu.SetButtonLabel( f96_arg1, Enum.LUIButton[0xD2F467A6C6DA1AC], 0x0, nil, "R" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x820DDD869ABBFAA], "Y", function ( f97_arg0, f97_arg1, f97_arg2, f97_arg3 )
		if not IsRepeatButtonPress( f97_arg3 ) and not IsVisibilityBitSet( f97_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f97_arg2 ) and not GameEnded( f97_arg2 ) then
			ToggleControllerModelValueNumber( f97_arg2, "CodCaster.showSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", f97_arg2, 300 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f98_arg0, f98_arg1, f98_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f98_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f98_arg2 ) and not GameEnded( f98_arg2 ) then
			CoD.Menu.SetButtonLabel( f98_arg1, Enum.LUIButton[0x820DDD869ABBFAA], 0x0, nil, "Y" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "F", function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f99_arg2, "shoutcaster_qs_xray" )
		return true
	end, function ( f100_arg0, f100_arg1, f100_arg2 )
		CoD.Menu.SetButtonLabel( f100_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "F" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "G", function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f101_arg2, "shoutcaster_qs_listen_in" )
		return true
	end, function ( f102_arg0, f102_arg1, f102_arg2 )
		CoD.Menu.SetButtonLabel( f102_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "G" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "H", function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f103_arg2, "shoutcaster_qs_loadout" )
		return true
	end, function ( f104_arg0, f104_arg1, f104_arg2 )
		CoD.Menu.SetButtonLabel( f104_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "H" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "J", function ( f105_arg0, f105_arg1, f105_arg2, f105_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f105_arg2, "shoutcaster_qs_playercard" )
		return true
	end, function ( f106_arg0, f106_arg1, f106_arg2 )
		CoD.Menu.SetButtonLabel( f106_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "J" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "K", function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f107_arg2, "shoutcaster_qs_playerhud" )
		return true
	end, function ( f108_arg0, f108_arg1, f108_arg2 )
		CoD.Menu.SetButtonLabel( f108_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "K" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "1", function ( f109_arg0, f109_arg1, f109_arg2, f109_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f109_arg2, "1" )
		return true
	end, function ( f110_arg0, f110_arg1, f110_arg2 )
		CoD.Menu.SetButtonLabel( f110_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "1" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "2", function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f111_arg2, "2" )
		return true
	end, function ( f112_arg0, f112_arg1, f112_arg2 )
		CoD.Menu.SetButtonLabel( f112_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "2" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "3", function ( f113_arg0, f113_arg1, f113_arg2, f113_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f113_arg2, "3" )
		return true
	end, function ( f114_arg0, f114_arg1, f114_arg2 )
		CoD.Menu.SetButtonLabel( f114_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "3" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "4", function ( f115_arg0, f115_arg1, f115_arg2, f115_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f115_arg2, "4" )
		return true
	end, function ( f116_arg0, f116_arg1, f116_arg2 )
		CoD.Menu.SetButtonLabel( f116_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "4" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "5", function ( f117_arg0, f117_arg1, f117_arg2, f117_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f117_arg2, "5" )
		return true
	end, function ( f118_arg0, f118_arg1, f118_arg2 )
		CoD.Menu.SetButtonLabel( f118_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "5" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "6", function ( f119_arg0, f119_arg1, f119_arg2, f119_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f119_arg2, "6" )
		return true
	end, function ( f120_arg0, f120_arg1, f120_arg2 )
		CoD.Menu.SetButtonLabel( f120_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "6" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "7", function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f121_arg2, "7" )
		return true
	end, function ( f122_arg0, f122_arg1, f122_arg2 )
		CoD.Menu.SetButtonLabel( f122_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "7" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "8", function ( f123_arg0, f123_arg1, f123_arg2, f123_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f123_arg2, "8" )
		return true
	end, function ( f124_arg0, f124_arg1, f124_arg2 )
		CoD.Menu.SetButtonLabel( f124_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "8" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "9", function ( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f125_arg2, "9" )
		return true
	end, function ( f126_arg0, f126_arg1, f126_arg2 )
		CoD.Menu.SetButtonLabel( f126_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "9" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "0", function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3 )
		CoD.CodCasterUtility.SpectatePlayerNumber( self, f127_arg2, "10" )
		return true
	end, function ( f128_arg0, f128_arg1, f128_arg2 )
		CoD.Menu.SetButtonLabel( f128_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "0" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x6CE8023188D673F], "LSHIFT", function ( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
		CoD.CodCasterUtility.ClearSelectedLoadoutElement( self, f129_arg1, f129_arg2 )
		return true
	end, function ( f130_arg0, f130_arg1, f130_arg2 )
		CoD.Menu.SetButtonLabel( f130_arg1, Enum.LUIButton[0x6CE8023188D673F], 0x0, nil, "LSHIFT" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x29E5695FF1401AD], nil, function ( f131_arg0, f131_arg1, f131_arg2, f131_arg3 )
		CoD.CodCasterUtility.ToggleCodCasterProfileValue( f131_arg2, "shoutcaster_qs_loadout" )
		return true
	end, function ( f132_arg0, f132_arg1, f132_arg2 )
		CoD.Menu.SetButtonLabel( f132_arg1, Enum.LUIButton[0x29E5695FF1401AD], 0x0, nil, nil )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x57783F8DA4AAEF], nil, function ( f133_arg0, f133_arg1, f133_arg2, f133_arg3 )
		if not IsRepeatButtonPress( f133_arg3 ) and not IsVisibilityBitSet( f133_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f133_arg2 ) and not GameEnded( f133_arg2 ) and IsDpadButton( f133_arg3 ) then
			CoD.CodCasterUtility.OnDpadLeft( self, f133_arg2 )
			return true
		elseif not IsRepeatButtonPress( f133_arg3 ) and not IsVisibilityBitSet( f133_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f133_arg2 ) and not GameEnded( f133_arg2 ) and not IsDpadButton( f133_arg3 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f133_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutLeft( self, f133_arg1, f133_arg2 )
			return true
		else
			
		end
	end, function ( f134_arg0, f134_arg1, f134_arg2 )
		local f134_local0 = nil
		if not IsRepeatButtonPress( f134_local0 ) and not IsVisibilityBitSet( f134_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f134_arg2 ) and not GameEnded( f134_arg2 ) and IsDpadButton( f134_local0 ) then
			CoD.Menu.SetButtonLabel( f134_arg1, Enum.LUIButton[0x57783F8DA4AAEF], 0x0, nil, nil )
			return false
		elseif not IsRepeatButtonPress( f134_local0 ) and not IsVisibilityBitSet( f134_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f134_arg2 ) and not GameEnded( f134_arg2 ) and not IsDpadButton( f134_local0 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f134_arg2 ) then
			CoD.Menu.SetButtonLabel( f134_arg1, Enum.LUIButton[0x57783F8DA4AAEF], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "LEFTARROW", function ( f135_arg0, f135_arg1, f135_arg2, f135_arg3 )
		if not IsRepeatButtonPress( f135_arg3 ) and not IsVisibilityBitSet( f135_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f135_arg2 ) and not GameEnded( f135_arg2 ) then
			CoD.CodCasterUtility.OnDpadLeft( self, f135_arg2 )
			return true
		else
			
		end
	end, function ( f136_arg0, f136_arg1, f136_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f136_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f136_arg2 ) and not GameEnded( f136_arg2 ) then
			CoD.Menu.SetButtonLabel( f136_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "LEFTARROW" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x571F08AD84807E0], nil, function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3 )
		if not IsRepeatButtonPress( f137_arg3 ) and not IsVisibilityBitSet( f137_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f137_arg2 ) and not GameEnded( f137_arg2 ) and IsDpadButton( f137_arg3 ) then
			CoD.CodCasterUtility.OnDpadRight( self, f137_arg2 )
			return true
		elseif not IsRepeatButtonPress( f137_arg3 ) and not IsVisibilityBitSet( f137_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f137_arg2 ) and not GameEnded( f137_arg2 ) and not IsDpadButton( f137_arg3 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f137_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutRight( self, f137_arg1, f137_arg2 )
			return true
		else
			
		end
	end, function ( f138_arg0, f138_arg1, f138_arg2 )
		local f138_local0 = nil
		if not IsRepeatButtonPress( f138_local0 ) and not IsVisibilityBitSet( f138_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f138_arg2 ) and not GameEnded( f138_arg2 ) and IsDpadButton( f138_local0 ) then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, nil )
			return false
		elseif not IsRepeatButtonPress( f138_local0 ) and not IsVisibilityBitSet( f138_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f138_arg2 ) and not GameEnded( f138_arg2 ) and not IsDpadButton( f138_local0 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f138_arg2 ) then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton[0x571F08AD84807E0], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "RIGHTARROW", function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3 )
		if not IsRepeatButtonPress( f139_arg3 ) and not IsVisibilityBitSet( f139_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f139_arg2 ) and not GameEnded( f139_arg2 ) then
			CoD.CodCasterUtility.OnDpadRight( self, f139_arg2 )
			return true
		else
			
		end
	end, function ( f140_arg0, f140_arg1, f140_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f140_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f140_arg2 ) and not GameEnded( f140_arg2 ) then
			CoD.Menu.SetButtonLabel( f140_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "RIGHTARROW" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], nil, function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3 )
		if not IsRepeatButtonPress( f141_arg3 ) and not IsVisibilityBitSet( f141_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f141_arg2 ) and not GameEnded( f141_arg2 ) and IsDpadButton( f141_arg3 ) and not ShouldHideCodCasterHud( f141_arg2 ) then
			ToggleControllerModelValueBoolean( f141_arg2, "codcaster.showPortraitList" )
			UpdateSelfElementState( f141_arg1, self.CodCasterPortraitPlayerList, f141_arg2 )
			return true
		elseif not IsRepeatButtonPress( f141_arg3 ) and not IsVisibilityBitSet( f141_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f141_arg2 ) and not GameEnded( f141_arg2 ) and not IsDpadButton( f141_arg3 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f141_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutUp( self, f141_arg1, f141_arg2 )
			return true
		else
			
		end
	end, function ( f142_arg0, f142_arg1, f142_arg2 )
		local f142_local0 = nil
		if not IsRepeatButtonPress( f142_local0 ) and not IsVisibilityBitSet( f142_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f142_arg2 ) and not GameEnded( f142_arg2 ) and IsDpadButton( f142_local0 ) and not ShouldHideCodCasterHud( f142_arg2 ) then
			CoD.Menu.SetButtonLabel( f142_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], 0x0, nil, nil )
			return false
		elseif not IsRepeatButtonPress( f142_local0 ) and not IsVisibilityBitSet( f142_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f142_arg2 ) and not GameEnded( f142_arg2 ) and not IsDpadButton( f142_local0 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f142_arg2 ) then
			CoD.Menu.SetButtonLabel( f142_arg1, Enum.LUIButton[0x4B11D2B20C75A7F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "UPARROW", function ( f143_arg0, f143_arg1, f143_arg2, f143_arg3 )
		if not IsRepeatButtonPress( f143_arg3 ) and not IsVisibilityBitSet( f143_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f143_arg2 ) and not GameEnded( f143_arg2 ) then
			ToggleControllerModelValueBoolean( f143_arg2, "codcaster.showPortraitList" )
			UpdateSelfElementState( f143_arg1, self.CodCasterPortraitPlayerList, f143_arg2 )
			return true
		else
			
		end
	end, function ( f144_arg0, f144_arg1, f144_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f144_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f144_arg2 ) and not GameEnded( f144_arg2 ) then
			CoD.Menu.SetButtonLabel( f144_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "UPARROW" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0xD4C15FE32148D3A], nil, function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3 )
		if not IsRepeatButtonPress( f145_arg3 ) and not IsVisibilityBitSet( f145_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f145_arg2 ) and not GameEnded( f145_arg2 ) and IsDpadButton( f145_arg3 ) and not ShouldHideCodCasterHud( f145_arg2 ) then
			ToggleControllerModelValueBoolean( f145_arg2, "codcaster.showPlayerList" )
			UpdateSelfElementState( f145_arg1, self.CodCasterPlayerList, f145_arg2 )
			return true
		elseif not IsRepeatButtonPress( f145_arg3 ) and not IsVisibilityBitSet( f145_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f145_arg2 ) and not GameEnded( f145_arg2 ) and not IsDpadButton( f145_arg3 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f145_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutDown( self, f145_arg1, f145_arg2 )
			return true
		else
			
		end
	end, function ( f146_arg0, f146_arg1, f146_arg2 )
		local f146_local0 = nil
		if not IsRepeatButtonPress( f146_local0 ) and not IsVisibilityBitSet( f146_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f146_arg2 ) and not GameEnded( f146_arg2 ) and IsDpadButton( f146_local0 ) and not ShouldHideCodCasterHud( f146_arg2 ) then
			CoD.Menu.SetButtonLabel( f146_arg1, Enum.LUIButton[0xD4C15FE32148D3A], 0x0, nil, nil )
			return false
		elseif not IsRepeatButtonPress( f146_local0 ) and not IsVisibilityBitSet( f146_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f146_arg2 ) and not GameEnded( f146_arg2 ) and not IsDpadButton( f146_local0 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f146_arg2 ) then
			CoD.Menu.SetButtonLabel( f146_arg1, Enum.LUIButton[0xD4C15FE32148D3A], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "DOWNARROW", function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3 )
		if not IsRepeatButtonPress( f147_arg3 ) and not IsVisibilityBitSet( f147_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f147_arg2 ) and not GameEnded( f147_arg2 ) then
			ToggleControllerModelValueBoolean( f147_arg2, "codcaster.showPlayerList" )
			UpdateSelfElementState( f147_arg1, self.CodCasterPlayerList, f147_arg2 )
			return true
		else
			
		end
	end, function ( f148_arg0, f148_arg1, f148_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f148_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f148_arg2 ) and not GameEnded( f148_arg2 ) then
			CoD.Menu.SetButtonLabel( f148_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "DOWNARROW" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "A", function ( f149_arg0, f149_arg1, f149_arg2, f149_arg3 )
		if not IsRepeatButtonPress( f149_arg3 ) and not IsVisibilityBitSet( f149_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f149_arg2 ) and not GameEnded( f149_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f149_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutLeft( self, f149_arg1, f149_arg2 )
			return true
		else
			
		end
	end, function ( f150_arg0, f150_arg1, f150_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f150_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f150_arg2 ) and not GameEnded( f150_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f150_arg2 ) then
			CoD.Menu.SetButtonLabel( f150_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "A" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "D", function ( f151_arg0, f151_arg1, f151_arg2, f151_arg3 )
		if not IsRepeatButtonPress( f151_arg3 ) and not IsVisibilityBitSet( f151_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f151_arg2 ) and not GameEnded( f151_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f151_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutRight( self, f151_arg1, f151_arg2 )
			return true
		else
			
		end
	end, function ( f152_arg0, f152_arg1, f152_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f152_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f152_arg2 ) and not GameEnded( f152_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f152_arg2 ) then
			CoD.Menu.SetButtonLabel( f152_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "D" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "W", function ( f153_arg0, f153_arg1, f153_arg2, f153_arg3 )
		if not IsRepeatButtonPress( f153_arg3 ) and not IsVisibilityBitSet( f153_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f153_arg2 ) and not GameEnded( f153_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f153_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutUp( self, f153_arg1, f153_arg2 )
			return true
		else
			
		end
	end, function ( f154_arg0, f154_arg1, f154_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f154_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f154_arg2 ) and not GameEnded( f154_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f154_arg2 ) then
			CoD.Menu.SetButtonLabel( f154_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "W" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "S", function ( f155_arg0, f155_arg1, f155_arg2, f155_arg3 )
		if not IsRepeatButtonPress( f155_arg3 ) and not IsVisibilityBitSet( f155_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f155_arg2 ) and not GameEnded( f155_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f155_arg2 ) then
			CoD.CodCasterUtility.NavigateLoadoutDown( self, f155_arg1, f155_arg2 )
			return true
		else
			
		end
	end, function ( f156_arg0, f156_arg1, f156_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f156_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) and not ScoreboardVisible( f156_arg2 ) and not GameEnded( f156_arg2 ) and not CoD.CodCasterUtility.CodCasterIsInAerialCam( f156_arg2 ) then
			CoD.Menu.SetButtonLabel( f156_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "S" )
			return false
		else
			return false
		end
	end, false )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "V", function ( f157_arg0, f157_arg1, f157_arg2, f157_arg3 )
		if not CoD.ModelUtility.IsModelValueTrue( f157_arg2, "CodCaster.showKeyboard" ) and not IsVisibilityBitSet( f157_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			ToggleControllerModelValueBoolean( f157_arg2, "CodCaster.showKeyboard" )
			CoD.ScoreboardUtility.HideScoreboard( f157_arg1, f157_arg2 )
			return true
		elseif not IsVisibilityBitSet( f157_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			ToggleControllerModelValueBoolean( f157_arg2, "CodCaster.showKeyboard" )
			return true
		else
			
		end
	end, function ( f158_arg0, f158_arg1, f158_arg2 )
		if not CoD.ModelUtility.IsModelValueTrue( f158_arg2, "CodCaster.showKeyboard" ) and not IsVisibilityBitSet( f158_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f158_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "V" )
			return false
		elseif not IsVisibilityBitSet( f158_arg2, Enum.UIVisibilityBit[0xA69E34E231CE8B6] ) then
			CoD.Menu.SetButtonLabel( f158_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "V" )
			return false
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f159_arg0, f159_arg1, f159_arg2, f159_arg3 )
		local f159_local0 = self
		UpdateSelfState( self, f159_arg1 )
	end
	
	f1_arg0:addMenuOpenedCallback( self.__on_menuOpened_self )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "deadSpectator.playerIndex", function ( model )
		local f160_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsTextWithDelay( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "playerAbilities.playerGadget2.name", function ( model )
		local f161_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsText( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "primaryWeapon.itemIndex", function ( model )
		local f162_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsText( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "secondaryWeapon.indexIndex", function ( model )
		local f163_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsText( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "primaryWeapon.attachmentCount", function ( model )
		local f164_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsText( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "secondaryWeapon.attachmentCount", function ( model )
		local f165_local0 = self
		CoD.CodCasterUtility.SetLoadoutElementsText( self, f1_arg0, f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "hudItems.safeAreaUpdated", function ( model )
		local f166_local0 = self
		if IsPC() then
			SizeToHudArea( f166_local0, f1_arg1 )
		end
	end )
	CodCasterPortraitPlayerList.id = "CodCasterPortraitPlayerList"
	CodCasterPlayerList.id = "CodCasterPlayerList"
	CodCasterLoadoutTalents.id = "CodCasterLoadoutTalents"
	CodCasterLoadoutPrimary.id = "CodCasterLoadoutPrimary"
	CodCasterLoadoutSecondary.id = "CodCasterLoadoutSecondary"
	CodCasterButtonBar:appendEventHandler( "menu_loaded", function ()
		CodCasterButtonBar:setModel( f1_arg0.buttonModel, f1_arg1 )
	end )
	if CoD.isPC then
		CodCasterButtonBar.id = "CodCasterButtonBar"
	end
	self.__on_close_removeOverrides = function ()
		f1_arg0:removeMenuOpenedCallback( self.__on_menuOpened_self )
	end
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local15 = self
	CoD.CodCasterUtility.PostLoadFunc( self, f1_arg1, f1_arg0 )
	return self
end

CoD.CodCaster.__resetProperties = function ( f169_arg0 )
	f169_arg0.CodCasterLoadoutTalents:completeAnimation()
	f169_arg0.CodCasterLoadoutPrimary:completeAnimation()
	f169_arg0.CodCasterButtonBar:completeAnimation()
	f169_arg0.OverheadMap:completeAnimation()
	f169_arg0.CodCasterPortraitPlayerList:completeAnimation()
	f169_arg0.CodCasterHeaderNonTeamBased:completeAnimation()
	f169_arg0.CodCasterPortraitTeamScoreBoard:completeAnimation()
	f169_arg0.CodCasterKeyboard:completeAnimation()
	f169_arg0.CodCasterAnnouncementFeed:completeAnimation()
	f169_arg0.CodCasterObjectiveStatus:completeAnimation()
	f169_arg0.CodCasterPlayerList:completeAnimation()
	f169_arg0.CodCasterLoadoutSecondary:completeAnimation()
	f169_arg0.CodCasterPortraitPlayerCard:completeAnimation()
	f169_arg0.CodCasterLoadoutTalents:setAlpha( 0 )
	f169_arg0.CodCasterLoadoutPrimary:setAlpha( 0 )
	f169_arg0.CodCasterButtonBar:setAlpha( 1 )
	f169_arg0.OverheadMap:setAlpha( 1 )
	f169_arg0.CodCasterPortraitPlayerList:setTopBottom( 0, 0, 28, 173 )
	f169_arg0.CodCasterPortraitPlayerList:setAlpha( 1 )
	f169_arg0.CodCasterHeaderNonTeamBased:setAlpha( 0 )
	f169_arg0.CodCasterPortraitTeamScoreBoard:setAlpha( 1 )
	f169_arg0.CodCasterKeyboard:setAlpha( 1 )
	f169_arg0.CodCasterAnnouncementFeed:setAlpha( 1 )
	f169_arg0.CodCasterObjectiveStatus:setAlpha( 1 )
	f169_arg0.CodCasterPlayerList:setAlpha( 1 )
	f169_arg0.CodCasterLoadoutSecondary:setAlpha( 0 )
	f169_arg0.CodCasterPortraitPlayerCard:setAlpha( 1 )
end

CoD.CodCaster.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f170_arg0, f170_arg1 )
			f170_arg0:__resetProperties()
			f170_arg0:setupElementClipCounter( 2 )
			f170_arg0.CodCasterLoadoutTalents:completeAnimation()
			f170_arg0.CodCasterLoadoutTalents:setAlpha( 0 )
			f170_arg0.clipFinished( f170_arg0.CodCasterLoadoutTalents )
			f170_arg0.CodCasterLoadoutPrimary:completeAnimation()
			f170_arg0.CodCasterLoadoutPrimary:setAlpha( 0 )
			f170_arg0.clipFinished( f170_arg0.CodCasterLoadoutPrimary )
		end
	},
	Hidden = {
		DefaultClip = function ( f171_arg0, f171_arg1 )
			f171_arg0:__resetProperties()
			f171_arg0:setupElementClipCounter( 6 )
			f171_arg0.OverheadMap:completeAnimation()
			f171_arg0.OverheadMap:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.OverheadMap )
			f171_arg0.CodCasterHeaderNonTeamBased:completeAnimation()
			f171_arg0.CodCasterHeaderNonTeamBased:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.CodCasterHeaderNonTeamBased )
			f171_arg0.CodCasterPortraitPlayerList:completeAnimation()
			f171_arg0.CodCasterPortraitPlayerList:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.CodCasterPortraitPlayerList )
			f171_arg0.CodCasterPortraitTeamScoreBoard:completeAnimation()
			f171_arg0.CodCasterPortraitTeamScoreBoard:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.CodCasterPortraitTeamScoreBoard )
			f171_arg0.CodCasterButtonBar:completeAnimation()
			f171_arg0.CodCasterButtonBar:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.CodCasterButtonBar )
			f171_arg0.CodCasterKeyboard:completeAnimation()
			f171_arg0.CodCasterKeyboard:setAlpha( 0 )
			f171_arg0.clipFinished( f171_arg0.CodCasterKeyboard )
		end
	},
	HiddenCopy = {
		DefaultClip = function ( f172_arg0, f172_arg1 )
			f172_arg0:__resetProperties()
			f172_arg0:setupElementClipCounter( 13 )
			f172_arg0.OverheadMap:completeAnimation()
			f172_arg0.OverheadMap:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.OverheadMap )
			f172_arg0.CodCasterHeaderNonTeamBased:completeAnimation()
			f172_arg0.CodCasterHeaderNonTeamBased:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterHeaderNonTeamBased )
			f172_arg0.CodCasterPortraitPlayerCard:completeAnimation()
			f172_arg0.CodCasterPortraitPlayerCard:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterPortraitPlayerCard )
			f172_arg0.CodCasterPortraitPlayerList:completeAnimation()
			f172_arg0.CodCasterPortraitPlayerList:setTopBottom( 0, 0, 29, 174 )
			f172_arg0.CodCasterPortraitPlayerList:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterPortraitPlayerList )
			f172_arg0.CodCasterAnnouncementFeed:completeAnimation()
			f172_arg0.CodCasterAnnouncementFeed:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterAnnouncementFeed )
			f172_arg0.CodCasterPortraitTeamScoreBoard:completeAnimation()
			f172_arg0.CodCasterPortraitTeamScoreBoard:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterPortraitTeamScoreBoard )
			f172_arg0.CodCasterObjectiveStatus:completeAnimation()
			f172_arg0.CodCasterObjectiveStatus:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterObjectiveStatus )
			f172_arg0.CodCasterPlayerList:completeAnimation()
			f172_arg0.CodCasterPlayerList:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterPlayerList )
			f172_arg0.CodCasterLoadoutTalents:completeAnimation()
			f172_arg0.CodCasterLoadoutTalents:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterLoadoutTalents )
			f172_arg0.CodCasterLoadoutPrimary:completeAnimation()
			f172_arg0.CodCasterLoadoutPrimary:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterLoadoutPrimary )
			f172_arg0.CodCasterLoadoutSecondary:completeAnimation()
			f172_arg0.CodCasterLoadoutSecondary:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterLoadoutSecondary )
			f172_arg0.CodCasterButtonBar:completeAnimation()
			f172_arg0.CodCasterButtonBar:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterButtonBar )
			f172_arg0.CodCasterKeyboard:completeAnimation()
			f172_arg0.CodCasterKeyboard:setAlpha( 0 )
			f172_arg0.clipFinished( f172_arg0.CodCasterKeyboard )
		end
	},
	VisibleLoadoutAndNotTeamBased = {
		DefaultClip = function ( f173_arg0, f173_arg1 )
			f173_arg0:__resetProperties()
			f173_arg0:setupElementClipCounter( 8 )
			f173_arg0.CodCasterHeaderNonTeamBased:completeAnimation()
			f173_arg0.CodCasterHeaderNonTeamBased:setAlpha( 1 )
			f173_arg0.clipFinished( f173_arg0.CodCasterHeaderNonTeamBased )
			f173_arg0.CodCasterPortraitPlayerList:completeAnimation()
			f173_arg0.CodCasterPortraitPlayerList:setAlpha( 0 )
			f173_arg0.clipFinished( f173_arg0.CodCasterPortraitPlayerList )
			f173_arg0.CodCasterAnnouncementFeed:completeAnimation()
			f173_arg0.CodCasterAnnouncementFeed:setAlpha( 0 )
			f173_arg0.clipFinished( f173_arg0.CodCasterAnnouncementFeed )
			f173_arg0.CodCasterPortraitTeamScoreBoard:completeAnimation()
			f173_arg0.CodCasterPortraitTeamScoreBoard:setAlpha( 0 )
			f173_arg0.clipFinished( f173_arg0.CodCasterPortraitTeamScoreBoard )
			f173_arg0.CodCasterObjectiveStatus:completeAnimation()
			f173_arg0.CodCasterObjectiveStatus:setAlpha( 0 )
			f173_arg0.clipFinished( f173_arg0.CodCasterObjectiveStatus )
			f173_arg0.CodCasterLoadoutTalents:completeAnimation()
			f173_arg0.CodCasterLoadoutTalents:setAlpha( 1 )
			f173_arg0.clipFinished( f173_arg0.CodCasterLoadoutTalents )
			f173_arg0.CodCasterLoadoutPrimary:completeAnimation()
			f173_arg0.CodCasterLoadoutPrimary:setAlpha( 1 )
			f173_arg0.clipFinished( f173_arg0.CodCasterLoadoutPrimary )
			f173_arg0.CodCasterLoadoutSecondary:completeAnimation()
			f173_arg0.CodCasterLoadoutSecondary:setAlpha( 1 )
			f173_arg0.clipFinished( f173_arg0.CodCasterLoadoutSecondary )
		end
	},
	VisibleLoadout = {
		DefaultClip = function ( f174_arg0, f174_arg1 )
			f174_arg0:__resetProperties()
			f174_arg0:setupElementClipCounter( 3 )
			f174_arg0.CodCasterLoadoutTalents:completeAnimation()
			f174_arg0.CodCasterLoadoutTalents:setAlpha( 1 )
			f174_arg0.clipFinished( f174_arg0.CodCasterLoadoutTalents )
			f174_arg0.CodCasterLoadoutPrimary:completeAnimation()
			f174_arg0.CodCasterLoadoutPrimary:setAlpha( 1 )
			f174_arg0.clipFinished( f174_arg0.CodCasterLoadoutPrimary )
			f174_arg0.CodCasterLoadoutSecondary:completeAnimation()
			f174_arg0.CodCasterLoadoutSecondary:setAlpha( 1 )
			f174_arg0.clipFinished( f174_arg0.CodCasterLoadoutSecondary )
		end
	},
	NotTeamBased = {
		DefaultClip = function ( f175_arg0, f175_arg1 )
			f175_arg0:__resetProperties()
			f175_arg0:setupElementClipCounter( 5 )
			f175_arg0.CodCasterHeaderNonTeamBased:completeAnimation()
			f175_arg0.CodCasterHeaderNonTeamBased:setAlpha( 1 )
			f175_arg0.clipFinished( f175_arg0.CodCasterHeaderNonTeamBased )
			f175_arg0.CodCasterPortraitPlayerList:completeAnimation()
			f175_arg0.CodCasterPortraitPlayerList:setAlpha( 0 )
			f175_arg0.clipFinished( f175_arg0.CodCasterPortraitPlayerList )
			f175_arg0.CodCasterAnnouncementFeed:completeAnimation()
			f175_arg0.CodCasterAnnouncementFeed:setAlpha( 0 )
			f175_arg0.clipFinished( f175_arg0.CodCasterAnnouncementFeed )
			f175_arg0.CodCasterPortraitTeamScoreBoard:completeAnimation()
			f175_arg0.CodCasterPortraitTeamScoreBoard:setAlpha( 0 )
			f175_arg0.clipFinished( f175_arg0.CodCasterPortraitTeamScoreBoard )
			f175_arg0.CodCasterObjectiveStatus:completeAnimation()
			f175_arg0.CodCasterObjectiveStatus:setAlpha( 0 )
			f175_arg0.clipFinished( f175_arg0.CodCasterObjectiveStatus )
		end
	}
}
CoD.CodCaster.__onClose = function ( f176_arg0 )
	f176_arg0.__on_close_removeOverrides()
	f176_arg0.OverheadMap:close()
	f176_arg0.waitingForPlayers:close()
	f176_arg0.CodCasterHeaderNonTeamBased:close()
	f176_arg0.CodCasterPortraitPlayerCard:close()
	f176_arg0.CodCasterPortraitPlayerList:close()
	f176_arg0.CodCasterAnnouncementFeed:close()
	f176_arg0.CodCasterPortraitTeamScoreBoard:close()
	f176_arg0.CodCasterObjectiveStatus:close()
	f176_arg0.CodCasterPlayerList:close()
	f176_arg0.CodCasterLoadoutTalents:close()
	f176_arg0.CodCasterLoadoutPrimary:close()
	f176_arg0.CodCasterLoadoutSecondary:close()
	f176_arg0.CodCasterButtonBar:close()
	f176_arg0.CodCasterKeyboard:close()
	f176_arg0.CodCasterMiniMapPosition:close()
end

