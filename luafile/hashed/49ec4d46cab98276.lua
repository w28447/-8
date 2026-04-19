require( "ui/uieditor/widgets/aar_t8/rewards/aarrewardstab" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "x64:c7e896ee4bc3f8" )

CoD.AARRewardOverlay_WZ = InheritFrom( CoD.Menu )
LUI.createMenu.AARRewardOverlay_WZ = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "AARRewardOverlay_WZ", f1_arg0 )
	local f1_local1 = self
	SetControllerModelValue( f1_arg0, "AAR.activeTab", CoD.AARUtility.AARTabs.AAR_REWARDS )
	self:setClass( CoD.AARRewardOverlay_WZ )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local Blur = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Blur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	Blur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local BackgroundImage = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BackgroundImage:setAlpha( 0.85 )
	BackgroundImage:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local BGEnhancement = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	BGEnhancement:setRGB( 0, 0, 0 )
	BGEnhancement:setAlpha( 0.2 )
	self:addElement( BGEnhancement )
	self.BGEnhancement = BGEnhancement
	
	local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NoiseTiledBacking:setAlpha( 0 )
	NoiseTiledBacking:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseTiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseTiledBacking )
	self.NoiseTiledBacking = NoiseTiledBacking
	
	local TiledPlusGrid = LUI.UIImage.new( 0, 0, -135, 1920, 0, 0, 0, 1080 )
	TiledPlusGrid:setAlpha( 0.05 )
	TiledPlusGrid:setImage( RegisterImage( 0x6E37BAE22631294 ) )
	TiledPlusGrid:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	TiledPlusGrid:setShaderVector( 0, 0, 0, 0, 0 )
	TiledPlusGrid:setupNineSliceShader( 220, 220 )
	self:addElement( TiledPlusGrid )
	self.TiledPlusGrid = TiledPlusGrid
	
	local FooterContainerFrontendRight = CoD.FooterContainer_Frontend_Right.new( f1_local1, f1_arg0, 0, 1, 0, 0, 1, 1, -48, 0 )
	FooterContainerFrontendRight:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( FooterContainerFrontendRight )
	self.FooterContainerFrontendRight = FooterContainerFrontendRight
	
	local RewardsTab = CoD.AARRewardsTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -450, 450 )
	RewardsTab:mergeStateConditions( {
		{
			stateName = "ZM",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	RewardsTab.AarMpBacking.Blur:setAlpha( 0 )
	RewardsTab.AarMpBacking.Backer:setAlpha( 0 )
	RewardsTab.AarMpBacking.TiledBacking:setAlpha( 0 )
	self:addElement( RewardsTab )
	self.RewardsTab = RewardsTab
	
	local RewardsTitle = LUI.UIText.new( 0.5, 0.5, -960, 960, 0, 0, 26, 77 )
	RewardsTitle:setRGB( ColorSet.T8_FactionTier_InProgress.r, ColorSet.T8_FactionTier_InProgress.g, ColorSet.T8_FactionTier_InProgress.b )
	RewardsTitle:setText( LocalizeToUpperString( 0x3EC1D01B53129AE ) )
	RewardsTitle:setTTF( "ttmussels_regular" )
	RewardsTitle:setLetterSpacing( 14 )
	RewardsTitle:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	RewardsTitle:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	self:addElement( RewardsTitle )
	self.RewardsTitle = RewardsTitle
	
	local TrialInfoBannerWidget = CoD.TrialInfoBannerWidget.new( f1_local1, f1_arg0, 0, 0, 574.5, 1345.5, 0, 0, 927, 962 )
	TrialInfoBannerWidget:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsGameTrial() and AlwaysFalse()
			end
		},
		{
			stateName = "ShownLarge",
			condition = function ( menu, element, event )
				return IsGameTrial() and AlwaysTrue()
			end
		}
	} )
	TrialInfoBannerWidget.InfoText:setText( Engine[0xF9F1239CFD921FE]( 0xC0FFDDCA009994B ) )
	self:addElement( TrialInfoBannerWidget )
	self.TrialInfoBannerWidget = TrialInfoBannerWidget
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		CoD.AARUtility.InitRewardsPaging( f7_arg2 )
		GoBack( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/continue", nil, "ui_confirm" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x865DD2DB1EFE9F8], "ESCAPE", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsPC() then
			CoD.AARUtility.InitRewardsPaging( f9_arg2 )
			GoBack( self, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if IsPC() then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "ESCAPE" )
			return false
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsPC() then
			CoD.AARUtility.InitRewardsPaging( f11_arg2 )
			GoBack( self, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsPC() then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, nil )
			return true
		else
			return false
		end
	end, false )
	self.__on_menuOpened_self = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		local f13_local0 = self
		if IsPC() then
			CoD.PCUtility.SetupDismissTimerRewardsAAR( f13_local0, f13_arg1, f13_arg2 )
		end
	end
	
	f1_local1:addMenuOpenedCallback( self.__on_menuOpened_self )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SetControllerModelValue( f1_arg0, "AAR.activeTab", CoD.AARUtility.AARTabs.AAR_SUMMARY )
	end )
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	RewardsTab.id = "RewardsTab"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = RewardsTab
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
	
	local f1_local11 = self
	PlaySoundAlias( "uin_wz_aar_challenge_complete" )
	return self
end

CoD.AARRewardOverlay_WZ.__resetProperties = function ( f16_arg0 )
	f16_arg0.RewardsTitle:completeAnimation()
	f16_arg0.RewardsTab:completeAnimation()
	f16_arg0.RewardsTitle:setAlpha( 1 )
	f16_arg0.RewardsTab:setAlpha( 1 )
end

CoD.AARRewardOverlay_WZ.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 2 )
			local f17_local0 = function ( f18_arg0 )
				local f18_local0 = function ( f19_arg0 )
					f19_arg0:beginAnimation( 149, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f19_arg0:setAlpha( 1 )
					f19_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.RewardsTab:beginAnimation( 200 )
				f17_arg0.RewardsTab:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.RewardsTab:registerEventHandler( "transition_complete_keyframe", f18_local0 )
			end
			
			f17_arg0.RewardsTab:completeAnimation()
			f17_arg0.RewardsTab:setAlpha( 0 )
			f17_local0( f17_arg0.RewardsTab )
			local f17_local1 = function ( f20_arg0 )
				f17_arg0.RewardsTitle:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f17_arg0.RewardsTitle:setAlpha( 1 )
				f17_arg0.RewardsTitle:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.RewardsTitle:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.RewardsTitle:completeAnimation()
			f17_arg0.RewardsTitle:setAlpha( 0 )
			f17_local1( f17_arg0.RewardsTitle )
		end
	}
}
CoD.AARRewardOverlay_WZ.__onClose = function ( f21_arg0 )
	f21_arg0.__on_close_removeOverrides()
	f21_arg0.FooterContainerFrontendRight:close()
	f21_arg0.RewardsTab:close()
	f21_arg0.TrialInfoBannerWidget:close()
end

