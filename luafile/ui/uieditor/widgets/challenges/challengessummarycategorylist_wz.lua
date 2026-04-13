require( "ui/uieditor/menus/challenges/challenges" )
require( "ui/uieditor/menus/challenges/challengesdarkops" )
require( "ui/uieditor/widgets/challenges/challengessummarycategory" )
require( "ui/uieditor/widgets/challenges/challengessummarydarkops" )

CoD.ChallengesSummaryCategoryList_WZ = InheritFrom( LUI.UIElement )
CoD.ChallengesSummaryCategoryList_WZ.__defaultWidth = 1175
CoD.ChallengesSummaryCategoryList_WZ.__defaultHeight = 225
CoD.ChallengesSummaryCategoryList_WZ.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIHorizontalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 44, false )
	self:setAlignment( LUI.Alignment.Left )
	self:setClass( CoD.ChallengesSummaryCategoryList_WZ )
	self.id = "ChallengesSummaryCategoryList_WZ"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Career = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0, 0, 0, 363, 0.5, 0.5, -112.5, 112.5 )
	Career.SummaryCategory.Icon:setImage( RegisterImage( 0x6F9A89CB322C3C2 ) )
	Career.SummaryCategory.Name:setText( Engine[0xF9F1239CFD921FE]( 0x1BEB13BCC1D1E4E ) )
	Career:subscribeToGlobalModel( f1_arg1, "ChallengesWZCategoryStats", "career", function ( model )
		Career:setModel( model, f1_arg1 )
	end )
	Career:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f3_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Career, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if not IsElementInState( f4_arg0, "Disabled" ) then
			SetGlobalModelValue( "defaultChallengeTab", "career" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f4_arg2 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		if not IsElementInState( f5_arg0, "Disabled" ) then
			CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Career )
	self.Career = Career
	
	local Operations = CoD.ChallengesSummaryCategory.new( f1_arg0, f1_arg1, 0, 0, 407, 770, 0.5, 0.5, -112.5, 112.5 )
	Operations.SummaryCategory.Icon:setImage( RegisterImage( 0x32F3E55D1A844D6 ) )
	Operations.SummaryCategory.Name:setText( Engine[0xF9F1239CFD921FE]( 0x2177A3C9161B05A ) )
	Operations:subscribeToGlobalModel( f1_arg1, "ChallengesWZCategoryStats", "operations", function ( model )
		Operations:setModel( model, f1_arg1 )
	end )
	Operations:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f7_local0
	end )
	f1_arg0:AddButtonCallbackFunction( Operations, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not IsElementInState( f8_arg0, "Disabled" ) then
			SetGlobalModelValue( "defaultChallengeTab", "operations" )
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "Challenges", f8_arg2 )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not IsElementInState( f9_arg0, "Disabled" ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Operations )
	self.Operations = Operations
	
	local DarkOps = CoD.ChallengesSummaryDarkOps.new( f1_arg0, f1_arg1, 0, 0, 814, 1177, 0.5, 0.5, -112.5, 112.5 )
	DarkOps:mergeStateConditions( {
		{
			stateName = "Zombie",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	DarkOps.SummaryCategoryBlackOps.Icon:setImage( RegisterImage( 0x31B914F53740B80 ) )
	DarkOps:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f11_local0
	end )
	f1_arg0:AddButtonCallbackFunction( DarkOps, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsElementInState( f12_arg0, "Disabled" ) then
			PlaySoundAlias( "uin_toggle_generic" )
			OpenOverlay( self, "ChallengesDarkOps", f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsElementInState( f13_arg0, "Disabled" ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0xD0BB36CD318F55F, nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( DarkOps )
	self.DarkOps = DarkOps
	
	Career.id = "Career"
	Operations.id = "Operations"
	DarkOps.id = "DarkOps"
	self.__defaultFocus = Career
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ChallengesSummaryCategoryList_WZ.__onClose = function ( f14_arg0 )
	f14_arg0.Career:close()
	f14_arg0.Operations:close()
	f14_arg0.DarkOps:close()
end

