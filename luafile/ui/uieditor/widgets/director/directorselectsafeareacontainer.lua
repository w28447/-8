require( "ui/uieditor/widgets/director/directorfeaturedcarousel" )
require( "ui/uieditor/widgets/director/directorpartylist" )
require( "x64:a71173105d85c16" )

CoD.DirectorSelectSafeAreaContainer = InheritFrom( LUI.UIElement )
CoD.DirectorSelectSafeAreaContainer.__defaultWidth = 1920
CoD.DirectorSelectSafeAreaContainer.__defaultHeight = 1080
CoD.DirectorSelectSafeAreaContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	DataSourceHelperGetModel( f1_arg1, "LiveEventViewer" )
	self:setClass( CoD.DirectorSelectSafeAreaContainer )
	self.id = "DirectorSelectSafeAreaContainer"
	self.soundSet = "FrontendMain"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local CRMFeatureList = CoD.DirectorFeaturedCarousel.new( f1_arg0, f1_arg1, 0, 0, 26, 466, 0, 0, 26, 168 )
	CRMFeatureList:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return CoD.DirectorUtility.ShouldHideCRMFeatureList( element, f1_arg1 )
			end
		}
	} )
	local f1_local2 = CRMFeatureList
	local PartyList = CRMFeatureList.subscribeToModel
	local TrialPrompt = Engine.GetGlobalModel()
	PartyList( f1_local2, TrialPrompt["lobbyRoot.lobbyNav"], function ( f3_arg0 )
		f1_arg0:updateElementState( CRMFeatureList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local2 = CRMFeatureList
	PartyList = CRMFeatureList.subscribeToModel
	TrialPrompt = Engine.GetGlobalModel()
	PartyList( f1_local2, TrialPrompt["liveEventViewer.stream"], function ( f4_arg0 )
		f1_arg0:updateElementState( CRMFeatureList, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "liveEventViewer.stream"
		} )
	end, false )
	f1_local2 = CRMFeatureList
	PartyList = CRMFeatureList.subscribeToModel
	TrialPrompt = Engine.GetGlobalModel()
	PartyList( f1_local2, TrialPrompt["lobbyRoot.lobbyNav"], function ( f5_arg0, f5_arg1 )
		CoD.Menu.UpdateButtonShownState( f5_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	f1_local2 = CRMFeatureList
	PartyList = CRMFeatureList.subscribeToModel
	TrialPrompt = Engine.GetGlobalModel()
	PartyList( f1_local2, TrialPrompt["lobbyRoot.gameClient.update"], function ( f6_arg0, f6_arg1 )
		CoD.Menu.UpdateButtonShownState( f6_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	f1_local2 = CRMFeatureList
	PartyList = CRMFeatureList.subscribeToModel
	TrialPrompt = Engine.GetGlobalModel()
	PartyList( f1_local2, TrialPrompt["lobbyRoot.privateClient.update"], function ( f7_arg0, f7_arg1 )
		CoD.Menu.UpdateButtonShownState( f7_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end, false )
	CRMFeatureList:linkToElementModel( CRMFeatureList, "showForAllClients", true, function ( model, f8_arg1 )
		CoD.Menu.UpdateButtonShownState( f8_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	CRMFeatureList:linkToElementModel( CRMFeatureList, "actionString", true, function ( model, f9_arg1 )
		CoD.Menu.UpdateButtonShownState( f9_arg1, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
	end )
	CRMFeatureList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f10_local0
	end )
	f1_arg0:AddButtonCallbackFunction( CRMFeatureList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) and IsPC() then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f11_arg0, f11_arg2, "actionString", "registration" ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f11_arg0, f11_arg2, "actionString", "store" ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f11_arg0, f11_arg2, "actionString", "motd" ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.ModelUtility.IsSelfModelPathValueEqualTo( f11_arg0, f11_arg2, "actionString", "vod" ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f11_arg0, f11_arg2, "actionString", "liveevent" ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f11_arg0, f11_arg2 ) then
			ProcessListAction( self, f11_arg0, f11_arg2, f11_arg1 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) and IsPC() then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, "ui_confirm" )
			return false
		elseif CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f12_arg0, f12_arg2, "actionString", "registration" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x977A022B8323362, nil, "ui_confirm" )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f12_arg0, f12_arg2, "actionString", "store" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x191CDDA584B4408, nil, "ui_confirm" )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f12_arg0, f12_arg2, "actionString", "motd" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x2DEBC821FE9A08B, nil, "ui_confirm" )
			return true
		elseif CoD.ModelUtility.IsSelfModelPathValueEqualTo( f12_arg0, f12_arg2, "actionString", "vod" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) and CoD.ModelUtility.IsSelfModelPathValueEqualTo( f12_arg0, f12_arg2, "actionString", "liveevent" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x2A5ABE3F6C75E74, nil, "ui_confirm" )
			return true
		elseif CoD.DirectorUtility.ShowForAllClients( f12_arg0, f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CRMFeatureList )
	self.CRMFeatureList = CRMFeatureList
	
	PartyList = CoD.DirectorPartyList.new( f1_arg0, f1_arg1, 1, 1, -436, -28, 0, 0, 28, 106 )
	self:addElement( PartyList )
	self.PartyList = PartyList
	
	f1_local2 = nil
	self.FooterButtonAddControllerHelpContainer = LUI.UIElement.createFake()
	
	TrialPrompt = CoD.MainMenuTrialPrompt.new( f1_arg0, f1_arg1, 0.5, 0.5, -200, 200, 0, 0, 28, 92 )
	self:addElement( TrialPrompt )
	self.TrialPrompt = TrialPrompt
	
	self:mergeStateConditions( {
		{
			stateName = "OnlineTrial",
			condition = function ( menu, element, event )
				return IsGameTrial()
			end
		}
	} )
	CRMFeatureList.id = "CRMFeatureList"
	PartyList.id = "PartyList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local5 = self
	CoD.BaseUtility.SetUpPassCustomFunctionToChild( self, self.CRMFeatureList, f1_arg1, f1_arg0, "_activateFeaturedWidget" )
	return self
end

CoD.DirectorSelectSafeAreaContainer.__resetProperties = function ( f14_arg0 )
	f14_arg0.TrialPrompt:completeAnimation()
	f14_arg0.TrialPrompt:setAlpha( 1 )
end

CoD.DirectorSelectSafeAreaContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.TrialPrompt:completeAnimation()
			f15_arg0.TrialPrompt:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.TrialPrompt )
		end
	},
	OnlineTrial = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			local f16_local0 = function ( f17_arg0 )
				f16_arg0.TrialPrompt:beginAnimation( 200, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
				f16_arg0.TrialPrompt:setAlpha( 1 )
				f16_arg0.TrialPrompt:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.TrialPrompt:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
			end
			
			f16_arg0.TrialPrompt:completeAnimation()
			f16_arg0.TrialPrompt:setAlpha( 0 )
			f16_local0( f16_arg0.TrialPrompt )
		end
	}
}
CoD.DirectorSelectSafeAreaContainer.__onClose = function ( f18_arg0 )
	f18_arg0.CRMFeatureList:close()
	f18_arg0.PartyList:close()
	f18_arg0.FooterButtonAddControllerHelpContainer:close()
	f18_arg0.TrialPrompt:close()
end

