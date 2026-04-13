require( "ui/uieditor/menus/challenges/challenges" )
require( "ui/uieditor/menus/challenges/challengesdarkops" )
require( "ui/uieditor/widgets/challenges/challengessummarycategory" )
require( "ui/uieditor/widgets/challenges/challengessummarydarkops" )

CoD.ChallengesSummaryCategoryList = InheritFrom( LUI.UIElement )
CoD.ChallengesSummaryCategoryList.__defaultWidth = 1175
CoD.ChallengesSummaryCategoryList.__defaultHeight = 225
CoD.ChallengesSummaryCategoryList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 44, false )
	self:setAlignment( LUI.Alignment.Left )
	self:setClass( CoD.ChallengesSummaryCategoryList )
	self.id = "ChallengesSummaryCategoryList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Operations = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0.5, 0.5, -587.5, -387.5, 0.5, 0.5, -112.5, 112.5 )
	Operations.SummaryCategory.Icon:setImage( RegisterImage( 0x51F7F3ABD082F92 ) )
	Operations:subscribeToGlobalModel( f1_arg1, "ChallengesMPCategoryStats", "operations", function ( model )
		Operations:setModel( model, f1_arg1 )
	end )
	Operations:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f3_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Operations, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if not IsElementInState( f4_arg0, "Locked" ) then
			SetGlobalModelValue( "defaultChallengeTab", "operations" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f4_arg2 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if not IsElementInState( f5_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Operations )
	self.Operations = Operations
	
	local Career = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0.5, 0.5, -343.5, -143.5, 0.5, 0.5, -112.5, 112.5 )
	Career.SummaryCategory.Icon:setImage( RegisterImage( 0xD5763EFD0940486 ) )
	Career.SummaryCategory.Name:setText( Engine[0xF9F1239CFD921FE]( 0x70C18F2AE62C195 ) )
	Career:subscribeToGlobalModel( f1_arg1, "ChallengesMPCategoryStats", "career", function ( model )
		Career:setModel( model, f1_arg1 )
	end )
	Career:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Career, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsElementInState( f8_arg0, "Locked" ) then
			SetGlobalModelValue( "defaultChallengeTab", "career" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsElementInState( f9_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Career )
	self.Career = Career
	
	local Scorestreaks = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0.5, 0.5, -99.5, 100.5, 0.5, 0.5, -112.5, 112.5 )
	Scorestreaks.SummaryCategory.Icon:setImage( RegisterImage( 0x9521B0D0B42F70D ) )
	Scorestreaks.SummaryCategory.Name:setText( Engine[0xF9F1239CFD921FE]( 0xCD2E0542DA537BE ) )
	Scorestreaks:subscribeToGlobalModel( f1_arg1, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		Scorestreaks:setModel( model, f1_arg1 )
	end )
	Scorestreaks:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Scorestreaks, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Locked" ) then
			SetGlobalModelValue( "defaultChallengeTab", "scorestreaks" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsElementInState( f13_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Scorestreaks )
	self.Scorestreaks = Scorestreaks
	
	local Prestige = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0.5, 0.5, 144.5, 344.5, 0.5, 0.5, -112.5, 112.5 )
	Prestige.SummaryCategory.Icon:setImage( RegisterImage( 0x95E1E9AE1EB3035 ) )
	Prestige.SummaryCategory.Name:setText( Engine[0xF9F1239CFD921FE]( 0xF45564D1E059F32 ) )
	Prestige:subscribeToGlobalModel( f1_arg1, "ChallengesMPCategoryStats", "prestige", function ( model )
		Prestige:setModel( model, f1_arg1 )
	end )
	Prestige:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f15_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Prestige, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not IsElementInState( f16_arg0, "Locked" ) then
			SetGlobalModelValue( "defaultChallengeTab", "prestige" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not IsElementInState( f17_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Prestige )
	self.Prestige = Prestige
	
	local DarkOps = CoD.ChallengesSummaryDarkOps.new( f1_arg0, f1_arg1, 0.5, 0.5, 388.5, 588.5, 0.5, 0.5, -112.5, 112.5 )
	DarkOps.SummaryCategoryBlackOps.Icon:setImage( RegisterImage( 0xD103F1BCE12EB6C ) )
	DarkOps:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f18_local0
	end )
	f1_arg0:AddButtonCallbackFunction( DarkOps, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if not IsElementInState( f19_arg0, "Locked" ) then
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "ChallengesDarkOps", f19_arg2 )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if not IsElementInState( f20_arg0, "Locked" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( DarkOps )
	self.DarkOps = DarkOps
	
	Operations.id = "Operations"
	Career.id = "Career"
	Scorestreaks.id = "Scorestreaks"
	Prestige.id = "Prestige"
	DarkOps.id = "DarkOps"
	self.__defaultFocus = Operations
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ChallengesSummaryCategoryList.__onClose = function ( f21_arg0 )
	f21_arg0.Operations:close()
	f21_arg0.Career:close()
	f21_arg0.Scorestreaks:close()
	f21_arg0.Prestige:close()
	f21_arg0.DarkOps:close()
end

