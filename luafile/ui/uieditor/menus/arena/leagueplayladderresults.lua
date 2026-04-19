require( "ui/uieditor/widgets/aar_t8/arena/aarladdertab" )
require( "ui/uieditor/widgets/common/commonheader" )
require( "ui/uieditor/widgets/footer/footercontainer_frontend_right" )
require( "ui/uieditor/widgets/header/header_container_frontend" )

CoD.LeaguePlayLadderResults = InheritFrom( CoD.Menu )
LUI.createMenu.LeaguePlayLadderResults = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "LeaguePlayLadderResults", f1_arg0 )
	local f1_local1 = self
	self:setClass( CoD.LeaguePlayLadderResults )
	self.soundSet = "FrontendMain"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local BlurBG = LUI.UIImage.new( -0.5, 1.5, 0, 0, 0.5, 1.5, -540, -540 )
	BlurBG:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	BlurBG:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( BlurBG )
	self.BlurBG = BlurBG
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Backing:setRGB( 0, 0, 0 )
	Backing:setAlpha( 0.9 )
	self:addElement( Backing )
	self.Backing = Backing
	
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
	
	local LadderResults = CoD.AARLadderTab.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -446, 454 )
	LadderResults:mergeStateConditions( {
		{
			stateName = "Arena",
			condition = function ( menu, element, event )
				return IsArenaMode()
			end
		}
	} )
	local GrayHeader = LadderResults
	local CommonHeader = LadderResults.subscribeToModel
	local f1_local8 = Engine.GetGlobalModel()
	CommonHeader( GrayHeader, f1_local8["lobbyRoot.lobbyNav"], function ( f4_arg0 )
		f1_local1:updateElementState( LadderResults, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f4_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LadderResults.AarMpBacking.Blur:setAlpha( 0 )
	LadderResults:subscribeToGlobalModel( f1_arg0, "AARLadderStats", nil, function ( model )
		LadderResults:setModel( model, f1_arg0 )
	end )
	self:addElement( LadderResults )
	self.LadderResults = LadderResults
	
	CommonHeader = CoD.CommonHeader.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 0, 0, 67 )
	CommonHeader.subtitle.StageTitle:setText( LocalizeToUpperString( 0x6FC3683B07036F8 ) )
	CommonHeader.subtitle.subtitle:setAlpha( 0 )
	CommonHeader:subscribeToGlobalModel( f1_arg0, "LobbyRoot", "lobbyTitle", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			CommonHeader.subtitle.subtitle:setText( Engine[0xF9F1239CFD921FE]( f6_local0 ) )
		end
	end )
	CommonHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		if element.menuLoaded then
			f7_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f7_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( CommonHeader )
	self.CommonHeader = CommonHeader
	
	GrayHeader = CoD.header_container_frontend.new( f1_local1, f1_arg0, 0, 0, 0, 1920, 0, 0, 0, 42 )
	GrayHeader:registerEventHandler( "menu_loaded", function ( element, event )
		local f8_local0 = nil
		if element.menuLoaded then
			f8_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f8_local0 = element.super:menuLoaded( event )
		end
		SizeToSafeArea( element, f1_arg0 )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( GrayHeader )
	self.GrayHeader = GrayHeader
	
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		CoD.AARUtility.CloseArenaLeaguePlayLadderOverlay( f9_arg1, f9_arg2 )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/continue", nil, "ui_confirm" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x805EFA15E9E7E5A], "ESCAPE", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsPC() then
			CoD.AARUtility.CloseArenaLeaguePlayLadderOverlay( f11_arg1, f11_arg2 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsPC() then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x805EFA15E9E7E5A], "menu/back", nil, "ESCAPE" )
			return true
		else
			return false
		end
	end, false )
	FooterContainerFrontendRight:setModel( self.buttonModel, f1_arg0 )
	if CoD.isPC then
		FooterContainerFrontendRight.id = "FooterContainerFrontendRight"
	end
	LadderResults.id = "LadderResults"
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	
	f1_local8 = self
	MenuHidesFreeCursor( f1_local1, f1_arg0 )
	return self
end

CoD.LeaguePlayLadderResults.__resetProperties = function ( f13_arg0 )
	f13_arg0.BlurBG:completeAnimation()
	f13_arg0.Backing:completeAnimation()
	f13_arg0.LadderResults:completeAnimation()
	f13_arg0.BlurBG:setAlpha( 1 )
	f13_arg0.Backing:setAlpha( 0.9 )
	f13_arg0.LadderResults:setAlpha( 1 )
end

CoD.LeaguePlayLadderResults.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 3 )
			local f14_local0 = function ( f15_arg0 )
				f14_arg0.BlurBG:beginAnimation( 100 )
				f14_arg0.BlurBG:setAlpha( 1 )
				f14_arg0.BlurBG:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.BlurBG:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
			end
			
			f14_arg0.BlurBG:completeAnimation()
			f14_arg0.BlurBG:setAlpha( 0 )
			f14_local0( f14_arg0.BlurBG )
			local f14_local1 = function ( f16_arg0 )
				f14_arg0.Backing:beginAnimation( 100 )
				f14_arg0.Backing:setAlpha( 0.9 )
				f14_arg0.Backing:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.Backing:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
			end
			
			f14_arg0.Backing:completeAnimation()
			f14_arg0.Backing:setAlpha( 0 )
			f14_local1( f14_arg0.Backing )
			local f14_local2 = function ( f17_arg0 )
				local f17_local0 = function ( f18_arg0 )
					f18_arg0:beginAnimation( 120, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f18_arg0:setAlpha( 1 )
					f18_arg0:registerEventHandler( "transition_complete_keyframe", f14_arg0.clipFinished )
				end
				
				f14_arg0.LadderResults:beginAnimation( 50 )
				f14_arg0.LadderResults:registerEventHandler( "interrupted_keyframe", f14_arg0.clipInterrupted )
				f14_arg0.LadderResults:registerEventHandler( "transition_complete_keyframe", f17_local0 )
			end
			
			f14_arg0.LadderResults:completeAnimation()
			f14_arg0.LadderResults:setAlpha( 0 )
			f14_local2( f14_arg0.LadderResults )
		end
	}
}
CoD.LeaguePlayLadderResults.__onClose = function ( f19_arg0 )
	f19_arg0.FooterContainerFrontendRight:close()
	f19_arg0.LadderResults:close()
	f19_arg0.CommonHeader:close()
	f19_arg0.GrayHeader:close()
end

