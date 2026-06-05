require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_ticketsystemlifelist" )

CoD.ScoreInfo_TicketSystemTeam = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TicketSystemTeam.__defaultWidth = 100
CoD.ScoreInfo_TicketSystemTeam.__defaultHeight = 56
CoD.ScoreInfo_TicketSystemTeam.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_TicketSystemTeam )
	self.id = "ScoreInfo_TicketSystemTeam"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Container2 = LUI.UIImage.new( 0, 0, 82.5, 99.5, 0, 0, -38, 26 )
	Container2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_container_light" ) )
	self:addElement( Container2 )
	self.Container2 = Container2
	
	local Container = LUI.UIImage.new( 0, 0, -20, -3, 0, 0, -38, 26 )
	Container:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_container_light" ) )
	self:addElement( Container )
	self.Container = Container
	
	local Diamond2 = LUI.UIImage.new( 0, 0, -23, -11, 0, 0, -13.5, -3.5 )
	Diamond2:setAlpha( 0 )
	Diamond2:setZRot( 180 )
	Diamond2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_diamond" ) )
	self:addElement( Diamond2 )
	self.Diamond2 = Diamond2
	
	local Diamond = LUI.UIImage.new( 0, 0, 90.5, 102.5, 0, 0, -13.5, -3.5 )
	Diamond:setAlpha( 0 )
	Diamond:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_diamond" ) )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	local TeamLivesIcon = LUI.UIImage.new( 0, 0, 2, 36, 0, 0, -23.5, 10.5 )
	TeamLivesIcon:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_person" ) )
	TeamLivesIcon:setMaterial( LUI.UIImage.GetCachedMaterial( 0x1CC85D0A86303B0 ) )
	TeamLivesIcon:setShaderVector( 0, 1.4, 0, 0, 0 )
	self:addElement( TeamLivesIcon )
	self.TeamLivesIcon = TeamLivesIcon
	
	local LifeList = CoD.ScoreInfo_TicketSystemLifeList.new( f1_arg0, f1_arg1, 0, 0, -3, 82, 0, 0, -22, 10 )
	LifeList:setAlpha( 0 )
	LifeList:linkToElementModel( self, nil, false, function ( model )
		LifeList:setModel( model, f1_arg1 )
	end )
	self:addElement( LifeList )
	self.LifeList = LifeList
	
	local TeamLivesCount2 = LUI.UIText.new( 0, 0, 37, 76, 0, 0, -17, 9 )
	TeamLivesCount2:setAlpha( 0.18 )
	TeamLivesCount2:setText( 88 )
	TeamLivesCount2:setTTF( "0arame_mono_stencil" )
	TeamLivesCount2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	TeamLivesCount2:setShaderVector( 0, 1, 0, 0, 0 )
	TeamLivesCount2:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLivesCount2:setShaderVector( 2, 1, 1, 1, 1 )
	TeamLivesCount2:setLetterSpacing( 1 )
	TeamLivesCount2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamLivesCount2:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TeamLivesCount2 )
	self.TeamLivesCount2 = TeamLivesCount2
	
	local TeamLivesCount = LUI.UIText.new( 0, 0, 39, 78, 0, 0, -19, 7 )
	TeamLivesCount:setText( 88 )
	TeamLivesCount:setTTF( "0arame_mono_stencil" )
	TeamLivesCount:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	TeamLivesCount:setShaderVector( 0, 0.68, 0, 0, 0 )
	TeamLivesCount:setShaderVector( 1, 0, 0, 0, 0 )
	TeamLivesCount:setShaderVector( 2, 1, 1, 1, 0.4 )
	TeamLivesCount:setLetterSpacing( 1 )
	TeamLivesCount:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	TeamLivesCount:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( TeamLivesCount )
	self.TeamLivesCount = TeamLivesCount
	
	local BarStripes2 = LUI.UIImage.new( 0, 0, -2, 82, 0, 0, 8.5, 24.5 )
	BarStripes2:setAlpha( 0 )
	BarStripes2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_bar" ) )
	BarStripes2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BarStripes2 )
	self.BarStripes2 = BarStripes2
	
	local RuleTop = LUI.UIImage.new( 0, 0, -3, 81, 0, 0, -29.5, -13.5 )
	RuleTop:setAlpha( 0 )
	RuleTop:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_rule" ) )
	self:addElement( RuleTop )
	self.RuleTop = RuleTop
	
	local RuleBottom = LUI.UIImage.new( 0, 0, -3, 81, 0, 0, -1.5, 14.5 )
	RuleBottom:setAlpha( 0 )
	RuleBottom:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_rule" ) )
	self:addElement( RuleBottom )
	self.RuleBottom = RuleBottom
	
	local PropLivesIcon = LUI.UIImage.new( 0, 0, -73.5, 147.5, 0, 0, -45, 33 )
	PropLivesIcon:setAlpha( 0 )
	PropLivesIcon:setImage( RegisterImage( "uie_ui_hud_prophunt_match_widget_prop" ) )
	self:addElement( PropLivesIcon )
	self.PropLivesIcon = PropLivesIcon
	
	self:mergeStateConditions( {
		{
			stateName = "Prop",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "prop" )
			end
		},
		{
			stateName = "LivesWarning",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" )
			end
		}
	} )
	self:linkToElementModel( self, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_TicketSystemTeam.__resetProperties = function ( f6_arg0 )
	f6_arg0.TeamLivesIcon:completeAnimation()
	f6_arg0.TeamLivesCount2:completeAnimation()
	f6_arg0.TeamLivesCount:completeAnimation()
	f6_arg0.LifeList:completeAnimation()
	f6_arg0.PropLivesIcon:completeAnimation()
	f6_arg0.TeamLivesIcon:setAlpha( 1 )
	f6_arg0.TeamLivesCount2:setLeftRight( 0, 0, 37, 76 )
	f6_arg0.TeamLivesCount2:setTopBottom( 0, 0, -17, 9 )
	f6_arg0.TeamLivesCount2:setAlpha( 0.18 )
	f6_arg0.TeamLivesCount:setLeftRight( 0, 0, 39, 78 )
	f6_arg0.TeamLivesCount:setTopBottom( 0, 0, -19, 7 )
	f6_arg0.TeamLivesCount:setAlpha( 1 )
	f6_arg0.LifeList:setAlpha( 0 )
	f6_arg0.PropLivesIcon:setLeftRight( 0, 0, -73.5, 147.5 )
	f6_arg0.PropLivesIcon:setAlpha( 0 )
end

CoD.ScoreInfo_TicketSystemTeam.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 0 )
		end,
		LivesWarning = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 4 )
			f8_arg0.TeamLivesIcon:completeAnimation()
			f8_arg0.TeamLivesIcon:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.TeamLivesIcon )
			local f8_local0 = function ( f9_arg0 )
				f8_arg0.LifeList:beginAnimation( 250 )
				f8_arg0.LifeList:setAlpha( 1 )
				f8_arg0.LifeList:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.LifeList:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.LifeList:completeAnimation()
			f8_arg0.LifeList:setAlpha( 0 )
			f8_local0( f8_arg0.LifeList )
			f8_arg0.TeamLivesCount2:completeAnimation()
			f8_arg0.TeamLivesCount2:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.TeamLivesCount2 )
			f8_arg0.TeamLivesCount:completeAnimation()
			f8_arg0.TeamLivesCount:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.TeamLivesCount )
		end
	},
	Prop = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 4 )
			f10_arg0.TeamLivesIcon:completeAnimation()
			f10_arg0.TeamLivesIcon:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.TeamLivesIcon )
			f10_arg0.TeamLivesCount2:completeAnimation()
			f10_arg0.TeamLivesCount2:setLeftRight( 0, 0, 26, 65 )
			f10_arg0.TeamLivesCount2:setTopBottom( 0, 0, -3, 23 )
			f10_arg0.TeamLivesCount2:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.TeamLivesCount2 )
			f10_arg0.TeamLivesCount:completeAnimation()
			f10_arg0.TeamLivesCount:setLeftRight( 0, 0, 26, 65 )
			f10_arg0.TeamLivesCount:setTopBottom( 0, 0, -3, 23 )
			f10_arg0.clipFinished( f10_arg0.TeamLivesCount )
			f10_arg0.PropLivesIcon:completeAnimation()
			f10_arg0.PropLivesIcon:setLeftRight( 0, 0, -80.5, 140.5 )
			f10_arg0.PropLivesIcon:setAlpha( 1 )
			f10_arg0.clipFinished( f10_arg0.PropLivesIcon )
		end
	},
	LivesWarning = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 4 )
			f11_arg0.TeamLivesIcon:completeAnimation()
			f11_arg0.TeamLivesIcon:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.TeamLivesIcon )
			f11_arg0.LifeList:completeAnimation()
			f11_arg0.LifeList:setAlpha( 1 )
			f11_arg0.clipFinished( f11_arg0.LifeList )
			f11_arg0.TeamLivesCount2:completeAnimation()
			f11_arg0.TeamLivesCount2:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.TeamLivesCount2 )
			f11_arg0.TeamLivesCount:completeAnimation()
			f11_arg0.TeamLivesCount:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.TeamLivesCount )
		end
	}
}
CoD.ScoreInfo_TicketSystemTeam.__onClose = function ( f12_arg0 )
	f12_arg0.LifeList:close()
end

