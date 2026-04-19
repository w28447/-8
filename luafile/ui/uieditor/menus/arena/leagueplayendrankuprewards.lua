require( "ui/uieditor/widgets/arena/arenaleagueplaybg" )
require( "ui/uieditor/widgets/common/commonheader" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "ui/uieditor/widgets/header/header_container_frontend" )
require( "ui/uieditor/widgets/pc/pc_motd_buttons" )

CoD.LeaguePlayEndRankUpRewards = InheritFrom( CoD.Menu )
LUI.createMenu.LeaguePlayEndRankUpRewards = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "LeaguePlayEndRankUpRewards", f1_arg0 )
	local f1_local1 = self
	CoD.ArenaLeaguePlayUtility.SetupLeaguePlayRankReward( f1_arg0 )
	self:setClass( CoD.LeaguePlayEndRankUpRewards )
	self.soundSet = "none"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local BlurBg = LUI.UIImage.new( -0.5, 1.5, 0, 0, 0.5, 1.5, -540, -540 )
	BlurBg:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	BlurBg:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BlurBg )
	self.BlurBg = BlurBg
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.8 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local arenaLeaguePlayBg = CoD.arenaLeaguePlayBg.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 1080 )
	self:addElement( arenaLeaguePlayBg )
	self.arenaLeaguePlayBg = arenaLeaguePlayBg
	
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
	
	local MainCornerL = LUI.UIImage.new( 0.5, 0.5, -784, -754, 0, 0, 146, 176 )
	MainCornerL:setAlpha( 0.04 )
	MainCornerL:setYRot( 180 )
	MainCornerL:setImage( RegisterImage( 0xBCB7451C0F2DE33 ) )
	self:addElement( MainCornerL )
	self.MainCornerL = MainCornerL
	
	local MainCornerR = LUI.UIImage.new( 0.5, 0.5, 756, 786, 0, 0, 145, 175 )
	MainCornerR:setAlpha( 0.04 )
	MainCornerR:setImage( RegisterImage( 0xBCB7451C0F2DE33 ) )
	self:addElement( MainCornerR )
	self.MainCornerR = MainCornerR
	
	local CommonHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 67 )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader.subtitle.subtitle:setText( "" )
	CommonHeader:subscribeToGlobalModel( f1_arg0, "Arena", "arenaTitle", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( f3_local0 ) )
		end
	end )
	CommonHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		if element.menuLoaded then
			f4_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f4_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	local BackingGrayMediumLeft = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	BackingGrayMediumLeft:registerEventHandler( "menu_loaded", function ( element, event )
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
	self:addElement( BackingGrayMediumLeft )
	self.BackingGrayMediumLeft = BackingGrayMediumLeft
	
	local PCButton = nil
	
	PCButton = CoD.PC_MOTD_Buttons.new( f1_local1, f1_arg0, 0.5, 0.5, 650, 890, 0.8, 0.8, 27, 107 )
	PCButton.OptionText:setText( LocalizeToUpperString( "menu/continue" ) )
	PCButton:linkToElementModel( self, "image", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			PCButton.Icon:setImage( RegisterImage( f6_local0 ) )
		end
	end )
	PCButton:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( PCButton, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
		return false
	end, false )
	self:addElement( PCButton )
	self.PCButton = PCButton
	
	local Reward = LUI.UIImage.new( 0, 0, 772.5, 1147.5, 0, 0, 467, 562 )
	Reward:subscribeToGlobalModel( f1_arg0, "LeaguePlayRankUpRewards", "rewardImage", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			Reward:setImage( RegisterImage( f10_local0 ) )
		end
	end )
	self:addElement( Reward )
	self.Reward = Reward
	
	local RewardTitle = LUI.UIText.new( 0, 0, 539.5, 1380.5, 0, 0, 333, 423 )
	RewardTitle:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	RewardTitle:setText( Engine[0xF9F1239CFD921FE]( 0xCCEBF58C8F36DFF ) )
	RewardTitle:setTTF( "ttmussels_demibold" )
	RewardTitle:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	RewardTitle:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( RewardTitle )
	self.RewardTitle = RewardTitle
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/continue", nil, "ui_confirm" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		if IsPC() then
			GoBack( self, f13_arg2 )
			return true
		else
			
		end
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		if IsPC() then
			CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, "ESCAPE" )
			return true
		else
			return false
		end
	end, false )
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	if CoD.isPC then
		PCButton.id = "PCButton"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	local f1_local13 = self
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	f1_local13 = Reward
	return self
end

CoD.LeaguePlayEndRankUpRewards.__resetProperties = function ( f15_arg0 )
	f15_arg0.Reward:completeAnimation()
	f15_arg0.RewardTitle:completeAnimation()
	f15_arg0.Reward:setAlpha( 1 )
	f15_arg0.RewardTitle:setAlpha( 1 )
end

CoD.LeaguePlayEndRankUpRewards.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 2 )
			local f16_local0 = function ( f17_arg0 )
				f16_arg0.Reward:beginAnimation( 510 )
				f16_arg0.Reward:setAlpha( 1 )
				f16_arg0.Reward:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.Reward:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.Reward:completeAnimation()
			f16_arg0.Reward:setAlpha( 0 )
			f16_local0( f16_arg0.Reward )
			local f16_local1 = function ( f18_arg0 )
				f16_arg0.RewardTitle:beginAnimation( 500 )
				f16_arg0.RewardTitle:setAlpha( 1 )
				f16_arg0.RewardTitle:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.RewardTitle:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.RewardTitle:completeAnimation()
			f16_arg0.RewardTitle:setAlpha( 0 )
			f16_local1( f16_arg0.RewardTitle )
		end
	}
}
CoD.LeaguePlayEndRankUpRewards.__onClose = function ( f19_arg0 )
	f19_arg0.arenaLeaguePlayBg:close()
	f19_arg0.FooterContainerFrontendRight:close()
	f19_arg0.CommonHeader:close()
	f19_arg0.BackingGrayMediumLeft:close()
	f19_arg0.PCButton:close()
	f19_arg0.Reward:close()
end

