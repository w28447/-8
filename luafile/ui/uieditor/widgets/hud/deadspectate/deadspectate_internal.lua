require( "ui/uieditor/widgets/callingcards/callingcards_framewidget" )
require( "x64:64a1ae5817d901a" )
require( "ui/uieditor/widgets/endgameflow/top3playerscoreblurbox" )
require( "x64:235e5809ec3dd5d" )
require( "x64:a58d363c8bf7eab" )
require( "ui/uieditor/widgets/lobby/common/fe_buttonpanel" )
require( "ui/uieditor/widgets/lobby/common/fe_buttonpanelshadercontainer" )
require( "ui/uieditor/widgets/lobby/common/fe_panelnoblur" )
require( "ui/uieditor/widgets/onofftext" )
require( "x64:1ca96e8d4d6aafc" )

CoD.DeadSpectate_Internal = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_Internal.__defaultWidth = 450
CoD.DeadSpectate_Internal.__defaultHeight = 90
CoD.DeadSpectate_Internal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DeadSpectate_Internal )
	self.id = "DeadSpectate_Internal"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f1_arg0, f1_arg1, 0, 0, 26, 425, 0, 0, 11, 79 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local Top3PlayerScoreBlurBox0 = CoD.Top3PlayerScoreBlurBox.new( f1_arg0, f1_arg1, 0, 0, 25.5, 424.5, 0, 0, 11, 79 )
	Top3PlayerScoreBlurBox0:setAlpha( 0 )
	Top3PlayerScoreBlurBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Top3PlayerScoreBlurBox0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox0 )
	self.Top3PlayerScoreBlurBox0 = Top3PlayerScoreBlurBox0
	
	local VSpanel = CoD.FE_ButtonPanel.new( f1_arg0, f1_arg1, 0, 0, 26, 425, 0, 0, 11, 79 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( f1_arg0, f1_arg1, 0.5, 0.5, -118, 200, 0.5, 0.5, -41, 41 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, f1_arg1 )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local LeftPanelLnT0 = CoD.KillcamWidgetFctnLine.new( f1_arg0, f1_arg1, 0.5, 0.5, -205, 206, 0.5, 0.5, -45, -33 )
	LeftPanelLnT0:setRGB( 0, 0, 0 )
	LeftPanelLnT0:setAlpha( 0.2 )
	self:addElement( LeftPanelLnT0 )
	self.LeftPanelLnT0 = LeftPanelLnT0
	
	local LeftPanelLnT00 = CoD.KillcamWidgetFctnLine.new( f1_arg0, f1_arg1, 0.5, 0.5, -204.5, 206.5, 0.5, 0.5, 34, 46 )
	LeftPanelLnT00:setRGB( 0, 0, 0 )
	LeftPanelLnT00:setAlpha( 0.2 )
	LeftPanelLnT00:setXRot( 180 )
	self:addElement( LeftPanelLnT00 )
	self.LeftPanelLnT00 = LeftPanelLnT00
	
	local Panel = CoD.FE_PanelNoBlur.new( f1_arg0, f1_arg1, 0.5, 0.5, -118, 200, 0.5, 0.5, -15, 15 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local playerName = CoD.onOffText.new( f1_arg0, f1_arg1, 0.5, 0.5, -334, 416, 0.5, 0.5, -18.5, 18.5 )
	playerName:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f1_arg1, "DeadSpectate", "followingObjective" )
			end
		}
	} )
	local spectatingBar = playerName
	local objectiveCameraText = playerName.subscribeToModel
	local spectatingMode = DataSources.DeadSpectate.getModel( f1_arg1 )
	objectiveCameraText( spectatingBar, spectatingMode.followingObjective, function ( f4_arg0 )
		f1_arg0:updateElementState( playerName, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "followingObjective"
		} )
	end, false )
	playerName:setAlpha( 0 )
	playerName.TextBox:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	playerName:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerIndex", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			playerName.TextBox:setText( CoD.SocialUtility.CleanGamerTag( GetClientNameAndClanTag( f1_arg1, f5_local0 ) ) )
		end
	end )
	self:addElement( playerName )
	self.playerName = playerName
	
	objectiveCameraText = CoD.onOffText.new( f1_arg0, f1_arg1, 0.5, 0.5, -334, 416, 0.5, 0.5, -18.5, 18.5 )
	objectiveCameraText:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f1_arg1, "DeadSpectate", "followingObjective" )
			end
		}
	} )
	spectatingMode = objectiveCameraText
	spectatingBar = objectiveCameraText.subscribeToModel
	local DeadSpectateSpectatingBarPC = DataSources.DeadSpectate.getModel( f1_arg1 )
	spectatingBar( spectatingMode, DeadSpectateSpectatingBarPC.followingObjective, function ( f7_arg0 )
		f1_arg0:updateElementState( objectiveCameraText, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "followingObjective"
		} )
	end, false )
	objectiveCameraText.TextBox:setText( Engine[0xF9F1239CFD921FE]( 0xCEAE24F2BF7166C ) )
	objectiveCameraText.TextBox:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( objectiveCameraText )
	self.objectiveCameraText = objectiveCameraText
	
	spectatingBar = CoD.DeadSpectate_SpectatingBar.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 0, -35, 3 )
	self:addElement( spectatingBar )
	self.spectatingBar = spectatingBar
	
	spectatingMode = CoD.DeadSpectate_SpectatingMode.new( f1_arg0, f1_arg1, 0.5, 0.5, -225, 225, 0.5, 0.5, 41, 79 )
	self:addElement( spectatingMode )
	self.spectatingMode = spectatingMode
	
	DeadSpectateSpectatingBarPC = nil
	
	DeadSpectateSpectatingBarPC = CoD.DeadSpectate_SpectatingBarPC.new( f1_arg0, f1_arg1, 0.5, 0.5, -124, 124, 0.5, 0.5, -83, -45 )
	self:addElement( DeadSpectateSpectatingBarPC )
	self.DeadSpectateSpectatingBarPC = DeadSpectateSpectatingBarPC
	
	local ClanName = LUI.UIText.new( 0, 0, 116, 416, 0, 0, 36, 54 )
	ClanName:setRGB( 0.92, 0.92, 0.92 )
	ClanName:setTTF( "notosans_regular" )
	ClanName:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ClanName:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	ClanName:setBackingType( 2 )
	ClanName:setBackingColor( 0, 0, 0 )
	ClanName:setBackingAlpha( 0.9 )
	ClanName:setBackingXPadding( 5 )
	ClanName:setBackingYPadding( 2 )
	ClanName:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerIndex", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			ClanName:setText( CoD.SocialUtility.CleanGamerTag( GetClientClantag( f1_arg1, f8_local0 ) ) )
		end
	end )
	self:addElement( ClanName )
	self.ClanName = ClanName
	
	local PlayerName = LUI.UIText.new( 0.5, 0.5, -109, 191, 0.5, 0.5, -35, -13 )
	PlayerName:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	PlayerName:setTTF( "notosans_regular" )
	PlayerName:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	PlayerName:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	PlayerName:setBackingType( 2 )
	PlayerName:setBackingColor( 0, 0, 0 )
	PlayerName:setBackingAlpha( 0.9 )
	PlayerName:setBackingXPadding( 5 )
	PlayerName:setBackingYPadding( 2 )
	PlayerName:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerIndex", function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			PlayerName:setText( GetClientName( f1_arg1, f9_local0 ) )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local AttackerEmblem = LUI.UIImage.new( 0.5, 0.5, -199.5, -117.5, 0.5, 0.5, -41, 41 )
	AttackerEmblem:subscribeToGlobalModel( f1_arg1, "DeadSpectate", "playerXuid", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			AttackerEmblem:setupPlayerEmblemByXUID( f10_local0 )
		end
	end )
	self:addElement( AttackerEmblem )
	self.AttackerEmblem = AttackerEmblem
	
	CallingCardsFrameWidget.id = "CallingCardsFrameWidget"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DeadSpectate_Internal.__onClose = function ( f11_arg0 )
	f11_arg0.LeftPanel:close()
	f11_arg0.Top3PlayerScoreBlurBox0:close()
	f11_arg0.VSpanel:close()
	f11_arg0.CallingCardsFrameWidget:close()
	f11_arg0.LeftPanelLnT0:close()
	f11_arg0.LeftPanelLnT00:close()
	f11_arg0.Panel:close()
	f11_arg0.playerName:close()
	f11_arg0.objectiveCameraText:close()
	f11_arg0.spectatingBar:close()
	f11_arg0.spectatingMode:close()
	f11_arg0.DeadSpectateSpectatingBarPC:close()
	f11_arg0.ClanName:close()
	f11_arg0.PlayerName:close()
	f11_arg0.AttackerEmblem:close()
end

