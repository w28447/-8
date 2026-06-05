require( "ui/uieditor/widgets/lobby/common/list1buttonlarge_ph" )
require( "ui/uieditor/widgets/notifications/xp/doublexpiconsleftaligned" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrush" )
require( "ui/uieditor/widgets/scoreboard/zm/scoreboardzm" )
require( "ui/uieditor/widgets/utilities/progressbar_rank" )
require( "x64:3a06c735b413259" )
require( "x64:5526ba46c282c68" )
require( "x64:62d19097b6da0d8" )
require( "x64:b710bc406e458bd" )

CoD.StartMenu_GameOptions_ZM = InheritFrom( LUI.UIElement )
CoD.StartMenu_GameOptions_ZM.__defaultWidth = 1920
CoD.StartMenu_GameOptions_ZM.__defaultHeight = 1080
CoD.StartMenu_GameOptions_ZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.StartMenu_GameOptions_ZM )
	self.id = "StartMenu_GameOptions_ZM"
	self.soundSet = "ChooseDecal"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	local f1_local1 = nil
	f1_local1 = LUI.UIElement.createFake()
	self.buttonList = f1_local1
	local f1_local2 = nil
	
	local PCbuttonList = LUI.UIList.new( f1_arg0, f1_arg1, 27, 0, nil, true, false, false, false )
	PCbuttonList:setLeftRight( 0.5, 0.5, -874, -564 )
	PCbuttonList:setTopBottom( 0.5, 0.5, -569, -161 )
	PCbuttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	PCbuttonList:setVerticalCount( 5 )
	PCbuttonList:setSpacing( 27 )
	PCbuttonList:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	PCbuttonList:setDataSource( "StartMenuGameOptions" )
	PCbuttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCbuttonList, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( PCbuttonList )
	self.PCbuttonList = PCbuttonList
	
	local rankProgress = CoD.ProgressBar_Rank.new( f1_arg0, f1_arg1, 0.5, 0.5, -857, 857, 1, 1, -157.5, -58.5 )
	self:addElement( rankProgress )
	self.rankProgress = rankProgress
	
	local TrialsRulesBackground = CoD.InGameTrialsRulesBackgroundTall.new( f1_arg0, f1_arg1, 0.5, 0.5, -538, 650, 0, 0, 93, 898 )
	TrialsRulesBackground:setAlpha( 0 )
	TrialsRulesBackground:setScale( 0.95, 0.95 )
	self:addElement( TrialsRulesBackground )
	self.TrialsRulesBackground = TrialsRulesBackground
	
	local RoundDescriptionGrid = LUI.GridLayout.new( f1_arg0, f1_arg1, false, 0, 0, 7, 0, nil, nil, false, false, false, false )
	RoundDescriptionGrid:setLeftRight( 0.5, 0.5, -530, 654 )
	RoundDescriptionGrid:setTopBottom( 0, 0, 190, 853 )
	RoundDescriptionGrid:setAlpha( 0 )
	RoundDescriptionGrid:setScale( 0.95, 0.95 )
	RoundDescriptionGrid:setWidgetType( CoD.ZMAARTrialTabRoundStatTall )
	RoundDescriptionGrid:setHorizontalCount( 3 )
	RoundDescriptionGrid:setVerticalCount( 10 )
	RoundDescriptionGrid:setSpacing( 7 )
	RoundDescriptionGrid:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	RoundDescriptionGrid:setDataSource( "ZmAarTrialRoundGrid" )
	self:addElement( RoundDescriptionGrid )
	self.RoundDescriptionGrid = RoundDescriptionGrid
	
	local Scoreboard = CoD.ScoreboardZM.new( f1_arg0, f1_arg1, 0.5, 0.5, -444, 444, 0.5, 0.5, -373, 27 )
	self:addElement( Scoreboard )
	self.Scoreboard = Scoreboard
	
	local ScoreboardRush = CoD.ScoreboardRush.new( f1_arg0, f1_arg1, 0.5, 0.5, -465, 465, 0.5, 0.5, -433.5, 69.5 )
	ScoreboardRush:setAlpha( 0 )
	self:addElement( ScoreboardRush )
	self.ScoreboardRush = ScoreboardRush
	
	local PCKoreaContentDescriptorsContainer = nil
	
	PCKoreaContentDescriptorsContainer = CoD.PC_Korea_ContentDescriptors_Container.new( f1_arg0, f1_arg1, 0.5, 0.5, 750, 939, 0, 0, 46, 382 )
	self:addElement( PCKoreaContentDescriptorsContainer )
	self.PCKoreaContentDescriptorsContainer = PCKoreaContentDescriptorsContainer
	
	local TcmRules = CoD.Tcm_Pause_Rules.new( f1_arg0, f1_arg1, 0.5, 0.5, -501.5, 503.5, 0.5, 0.5, 29.5, 391.5 )
	self:addElement( TcmRules )
	self.TcmRules = TcmRules
	
	local DoubleXPIconsLeftAligned = CoD.DoubleXPIconsLeftAligned.new( f1_arg0, f1_arg1, 0.5, 0.5, -874, -658, 1, 1, -229.5, -157.5 )
	self:addElement( DoubleXPIconsLeftAligned )
	self.DoubleXPIconsLeftAligned = DoubleXPIconsLeftAligned
	
	self:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "Trials_PauseMenu",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" )
			end
		},
		{
			stateName = "Rush_PauseMenu",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" )
			end
		}
	} )
	local f1_local12 = self
	local f1_local13 = self.subscribeToModel
	local f1_local14 = Engine.GetGlobalModel()
	f1_local13( f1_local12, f1_local14["lobbyRoot.lobbyNav"], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller, f9_arg2, f9_arg3, f9_arg4 )
		if not IsCurrentMenu( f1_arg0, "StartMenu_Main" ) then
			HideWidget( self.buttonList )
			HideWidget( self.rankProgress )
			HideWidget( self.PCKoreaContentDescriptorsContainer )
		end
	end )
	f1_local1.id = "buttonList"
	PCbuttonList.id = "PCbuttonList"
	RoundDescriptionGrid.id = "RoundDescriptionGrid"
	Scoreboard.id = "Scoreboard"
	ScoreboardRush.id = "ScoreboardRush"
	TcmRules.id = "TcmRules"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local13 = self
	if IsPC() and not IsCurrentMenu( f1_arg0, "StartMenu_Main" ) and CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" ) then
		ReplaceElementWithFake( self, "rankProgress" )
	end
	return self
end

CoD.StartMenu_GameOptions_ZM.__resetProperties = function ( f10_arg0 )
	f10_arg0.RoundDescriptionGrid:completeAnimation()
	f10_arg0.Scoreboard:completeAnimation()
	f10_arg0.rankProgress:completeAnimation()
	f10_arg0.TrialsRulesBackground:completeAnimation()
	f10_arg0.ScoreboardRush:completeAnimation()
	f10_arg0.RoundDescriptionGrid:setAlpha( 0 )
	f10_arg0.Scoreboard:setAlpha( 1 )
	f10_arg0.rankProgress:setLeftRight( 0.5, 0.5, -857, 857 )
	f10_arg0.rankProgress:setTopBottom( 1, 1, -157.5, -58.5 )
	f10_arg0.rankProgress:setAlpha( 1 )
	f10_arg0.TrialsRulesBackground:setAlpha( 0 )
	f10_arg0.ScoreboardRush:setAlpha( 0 )
end

CoD.StartMenu_GameOptions_ZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 3 )
			local f11_local0 = function ( f12_arg0 )
				local f12_local0 = function ( f13_arg0 )
					f13_arg0:beginAnimation( 150 )
					f13_arg0:setAlpha( 1 )
					f13_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
				end
				
				f11_arg0.rankProgress:beginAnimation( 150 )
				f11_arg0.rankProgress:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.rankProgress:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
			
			f11_arg0.rankProgress:completeAnimation()
			f11_arg0.rankProgress:setAlpha( 0 )
			f11_local0( f11_arg0.rankProgress )
			f11_arg0.RoundDescriptionGrid:completeAnimation()
			f11_arg0.RoundDescriptionGrid:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.RoundDescriptionGrid )
			local f11_local1 = function ( f14_arg0 )
				f11_arg0.Scoreboard:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f11_arg0.Scoreboard:setAlpha( 1 )
				f11_arg0.Scoreboard:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.Scoreboard:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
			end
			
			f11_arg0.Scoreboard:completeAnimation()
			f11_arg0.Scoreboard:setAlpha( 0 )
			f11_local1( f11_arg0.Scoreboard )
		end
	},
	CP_PauseMenu = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 2 )
			f15_arg0.rankProgress:completeAnimation()
			f15_arg0.rankProgress:setLeftRight( 0.5, 0.5, 18, 460 )
			f15_arg0.rankProgress:setTopBottom( 1, 1, 259, 358 )
			f15_arg0.clipFinished( f15_arg0.rankProgress )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.Scoreboard:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f15_arg0.Scoreboard:setAlpha( 1 )
				f15_arg0.Scoreboard:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.Scoreboard:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.Scoreboard:completeAnimation()
			f15_arg0.Scoreboard:setAlpha( 0 )
			f15_local0( f15_arg0.Scoreboard )
		end
	},
	Trials_PauseMenu = {
		DefaultClip = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 4 )
			local f17_local0 = function ( f18_arg0 )
				local f18_local0 = function ( f19_arg0 )
					f19_arg0:beginAnimation( 149 )
					f19_arg0:setAlpha( 1 )
					f19_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.rankProgress:beginAnimation( 300 )
				f17_arg0.rankProgress:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.rankProgress:registerEventHandler( "transition_complete_keyframe", f18_local0 )
			end
			
			f17_arg0.rankProgress:completeAnimation()
			f17_arg0.rankProgress:setAlpha( 0 )
			f17_local0( f17_arg0.rankProgress )
			local f17_local1 = function ( f20_arg0 )
				f17_arg0.TrialsRulesBackground:beginAnimation( 150 )
				f17_arg0.TrialsRulesBackground:setAlpha( 1 )
				f17_arg0.TrialsRulesBackground:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.TrialsRulesBackground:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.TrialsRulesBackground:completeAnimation()
			f17_arg0.TrialsRulesBackground:setAlpha( 0 )
			f17_local1( f17_arg0.TrialsRulesBackground )
			local f17_local2 = function ( f21_arg0 )
				local f21_local0 = function ( f22_arg0 )
					f22_arg0:beginAnimation( 150 )
					f22_arg0:setAlpha( 1 )
					f22_arg0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
				end
				
				f17_arg0.RoundDescriptionGrid:beginAnimation( 150 )
				f17_arg0.RoundDescriptionGrid:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.RoundDescriptionGrid:registerEventHandler( "transition_complete_keyframe", f21_local0 )
			end
			
			f17_arg0.RoundDescriptionGrid:completeAnimation()
			f17_arg0.RoundDescriptionGrid:setAlpha( 0 )
			f17_local2( f17_arg0.RoundDescriptionGrid )
			f17_arg0.Scoreboard:completeAnimation()
			f17_arg0.Scoreboard:setAlpha( 0 )
			f17_arg0.clipFinished( f17_arg0.Scoreboard )
		end
	},
	Rush_PauseMenu = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 3 )
			local f23_local0 = function ( f24_arg0 )
				local f24_local0 = function ( f25_arg0 )
					f25_arg0:beginAnimation( 150 )
					f25_arg0:setAlpha( 1 )
					f25_arg0:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
				end
				
				f23_arg0.rankProgress:beginAnimation( 150 )
				f23_arg0.rankProgress:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.rankProgress:registerEventHandler( "transition_complete_keyframe", f24_local0 )
			end
			
			f23_arg0.rankProgress:completeAnimation()
			f23_arg0.rankProgress:setAlpha( 0 )
			f23_local0( f23_arg0.rankProgress )
			f23_arg0.Scoreboard:completeAnimation()
			f23_arg0.Scoreboard:setAlpha( 0 )
			f23_arg0.clipFinished( f23_arg0.Scoreboard )
			local f23_local1 = function ( f26_arg0 )
				f23_arg0.ScoreboardRush:beginAnimation( 150, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f23_arg0.ScoreboardRush:setAlpha( 1 )
				f23_arg0.ScoreboardRush:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.ScoreboardRush:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.ScoreboardRush:completeAnimation()
			f23_arg0.ScoreboardRush:setAlpha( 0 )
			f23_local1( f23_arg0.ScoreboardRush )
		end
	}
}
CoD.StartMenu_GameOptions_ZM.__onClose = function ( f27_arg0 )
	f27_arg0.buttonList:close()
	f27_arg0.PCbuttonList:close()
	f27_arg0.rankProgress:close()
	f27_arg0.TrialsRulesBackground:close()
	f27_arg0.RoundDescriptionGrid:close()
	f27_arg0.Scoreboard:close()
	f27_arg0.ScoreboardRush:close()
	f27_arg0.PCKoreaContentDescriptorsContainer:close()
	f27_arg0.TcmRules:close()
	f27_arg0.DoubleXPIconsLeftAligned:close()
end

