require( "ui/uieditor/widgets/health/healthinfozm" )
require( "ui/uieditor/widgets/hud/cp_damagewidget/damagewidgetmp_panelcontainer" )
require( "x64:61911de5d586c0e" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_arcade_heart" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_arcade_multiplier" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_playerdeadmarker" )
require( "ui/uieditor/widgets/zmhudwidgets/rush/rush_playercard_position_indicator" )
require( "x64:1ef3663f11c21fa" )

CoD.ZMScrArcade_Listing = InheritFrom( LUI.UIElement )
CoD.ZMScrArcade_Listing.__defaultWidth = 196
CoD.ZMScrArcade_Listing.__defaultHeight = 88
CoD.ZMScrArcade_Listing.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScrArcade_Listing )
	self.id = "ZMScrArcade_Listing"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PlayercardBg2 = LUI.UIImage.new( 0, 0, 0, 285, 0, 0, 0, 103 )
	PlayercardBg2:setAlpha( 0 )
	PlayercardBg2:setYRot( 180 )
	PlayercardBg2:setImage( RegisterImage( 0x907FA1028168086 ) )
	PlayercardBg2:linkToElementModel( self, "playerIsDowned", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			PlayercardBg2:setRGB( CoD.ZombieUtility.GetPlayerDownColor( f2_local0 ) )
		end
	end )
	self:addElement( PlayercardBg2 )
	self.PlayercardBg2 = PlayercardBg2
	
	local PlayercardBg3 = LUI.UIImage.new( 0, 0, 0, 285, 0, 0, 0, 103 )
	PlayercardBg3:setAlpha( 0 )
	PlayercardBg3:setYRot( 180 )
	PlayercardBg3:setImage( RegisterImage( 0x6830AC5760FCD99 ) )
	PlayercardBg3:linkToElementModel( self, "playerIsDowned", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			PlayercardBg3:setRGB( CoD.ZombieUtility.GetPlayerDownColor( f3_local0 ) )
		end
	end )
	self:addElement( PlayercardBg3 )
	self.PlayercardBg3 = PlayercardBg3
	
	local teamPlayercard = LUI.UIImage.new( 0, 0, 0, 228, 0, 0, 0, 88 )
	teamPlayercard:setImage( RegisterImage( 0x57737C6CB8A7315 ) )
	teamPlayercard:linkToElementModel( self, "playerIsDowned", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			teamPlayercard:setRGB( CoD.ZombieUtility.GetPlayerDownColor( f4_local0 ) )
		end
	end )
	self:addElement( teamPlayercard )
	self.teamPlayercard = teamPlayercard
	
	local PlayercardBg = LUI.UIImage.new( 0, 0, 0, 352, 0, 0, -13, 101 )
	PlayercardBg:setAlpha( 0 )
	PlayercardBg:setImage( RegisterImage( 0x5BBCD252908044D ) )
	PlayercardBg:linkToElementModel( self, "playerIsDowned", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			PlayercardBg:setRGB( CoD.ZombieUtility.GetPlayerDownColor( f5_local0 ) )
		end
	end )
	self:addElement( PlayercardBg )
	self.PlayercardBg = PlayercardBg
	
	local Panel = CoD.DamageWidgetMP_PanelContainer.new( f1_arg0, f1_arg1, 0, 0, -0.5, 41.5, 0.5, 0.5, -19, 21 )
	Panel:setRGB( 0.61, 0.61, 0.61 )
	Panel:setAlpha( 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Glow = LUI.UIImage.new( 0.14, 1.14, 14, -8, 0, 0, 28, 80 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Glow:linkToElementModel( self, "clientNum", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			Glow:setRGB( ZombieClientScoreboardGlowColor( f6_local0 ) )
		end
	end )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ZombiesPortrait = CoD.ZombiesPortrait.new( f1_arg0, f1_arg1, 0, 0, 3, 83, 0, 0, 2.5, 82.5 )
	ZombiesPortrait:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_rft" ) )
	ZombiesPortrait:setShaderVector( 0, 34, 6, 0, 0 )
	ZombiesPortrait:setShaderVector( 1, 80, 80, 0, 0 )
	ZombiesPortrait:setShaderVector( 2, 0, 0.05, 0, 0 )
	ZombiesPortrait.Portrait:setShaderVector( 0, 0.4, 0, 0, 0 )
	ZombiesPortrait:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			ZombiesPortrait.Portrait:setImage( RegisterImage( f7_local0 ) )
		end
	end )
	self:addElement( ZombiesPortrait )
	self.ZombiesPortrait = ZombiesPortrait
	
	local bottle = LUI.UIImage.new( 0, 0, 0, 30, 1, 1, -30, 0 )
	bottle:linkToElementModel( self, "zombieInventoryIcon", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			bottle:setImage( RegisterImage( f8_local0 ) )
		end
	end )
	self:addElement( bottle )
	self.bottle = bottle
	
	local score = LUI.UIText.new( 0, 0, 84.5, 128.5, 0, 0, 40, 66 )
	score:setTTF( "skorzhen" )
	score:setLetterSpacing( 0.5 )
	score:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	score:linkToElementModel( self, "clientNum", true, function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			score:setRGB( ZombieClientScoreboardColor( f9_local0 ) )
		end
	end )
	score:linkToElementModel( self, "playerScore", true, function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			score:setText( CoD.TextUtility.FormatNumberWithDelimiters( f10_local0 ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( score, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( score )
	self.score = score
	
	local Multiplier = CoD.HUD_ZM_Arcade_Multiplier.new( f1_arg0, f1_arg1, 0, 0, 251, 378, 0, 0, 32, 56 )
	Multiplier:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Multiplier:linkToElementModel( Multiplier, "playerScoreShown", true, function ( model )
		f1_arg0:updateElementState( Multiplier, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "playerScoreShown"
		} )
	end )
	Multiplier:linkToElementModel( Multiplier, "multiplier_count", true, function ( model )
		f1_arg0:updateElementState( Multiplier, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "multiplier_count"
		} )
	end )
	Multiplier:linkToElementModel( self, nil, false, function ( model )
		Multiplier:setModel( model, f1_arg1 )
	end )
	Multiplier:linkToElementModel( self, "multiplier_count", true, function ( model )
		local f16_local0 = model:get()
		if f16_local0 ~= nil then
			Multiplier.Multiplier:setText( LocalizeIntoStringIfNotEmpty( "mp/multiplier_x", f16_local0 ) )
		end
	end )
	self:addElement( Multiplier )
	self.Multiplier = Multiplier
	
	local GamerTag = LUI.UIText.new( 0, 0, 85.5, 285.5, 0, 0, 19, 37 )
	GamerTag:setTTF( "notosans_bold" )
	GamerTag:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	GamerTag:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	GamerTag:linkToElementModel( self, "playerName", true, function ( model )
		local f17_local0 = model:get()
		if f17_local0 ~= nil then
			GamerTag:setText( f17_local0 )
		end
	end )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	local HealthValue = CoD.HealthInfoZM.new( f1_arg0, f1_arg1, 0, 0, 4, 242, 0, 0, 27, 193 )
	HealthValue:setScale( 0.75, 0.75 )
	HealthValue:linkToElementModel( self, "clientModel", true, function ( model )
		local f18_local0 = model:get()
		if f18_local0 ~= nil then
			HealthValue:setModel( f18_local0, f1_arg1 )
		end
	end )
	self:addElement( HealthValue )
	self.HealthValue = HealthValue
	
	local Image = LUI.UIImage.new( 0, 0, -11.5, 36.5, 0, 0, 38, 104 )
	Image:setAlpha( 0 )
	Image:setImage( RegisterImage( 0x8A8ED8D02B72886 ) )
	self:addElement( Image )
	self.Image = Image
	
	local HeartWidget = CoD.HUD_ZM_Arcade_Heart.new( f1_arg0, f1_arg1, 0, 0, -7.5, 34.5, 0, 0, 55, 97 )
	HeartWidget:setAlpha( 0 )
	HeartWidget:linkToElementModel( self, nil, false, function ( model )
		HeartWidget:setModel( model, f1_arg1 )
	end )
	self:addElement( HeartWidget )
	self.HeartWidget = HeartWidget
	
	local ReviveCount = LUI.UIText.new( 0, 0, -7.5, 32.5, 0, 0, 65.5, 86.5 )
	ReviveCount:setAlpha( 0 )
	ReviveCount:setTTF( "skorzhen" )
	ReviveCount:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ReviveCount:linkToElementModel( self, "self_revives", true, function ( model )
		local f20_local0 = model:get()
		if f20_local0 ~= nil then
			ReviveCount:setText( f20_local0 )
		end
	end )
	self:addElement( ReviveCount )
	self.ReviveCount = ReviveCount
	
	local PlayerDeadMarker = CoD.Hud_ZM_PlayerDeadMarker.new( f1_arg0, f1_arg1, 0, 0, -28, 114, 0, 0, -5.5, 93.5 )
	PlayerDeadMarker:linkToElementModel( self, "clientModel", true, function ( model )
		local f21_local0 = model:get()
		if f21_local0 ~= nil then
			PlayerDeadMarker:setModel( f21_local0, f1_arg1 )
		end
	end )
	self:addElement( PlayerDeadMarker )
	self.PlayerDeadMarker = PlayerDeadMarker
	
	local PositionText = CoD.Rush_playercard_position_indicator.new( f1_arg0, f1_arg1, 0, 0, -33, -18, 0, 0, 33, 75 )
	PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f1_arg1, 1 ) )
	self:addElement( PositionText )
	self.PositionText = PositionText
	
	local ZMExtraPerkVapors = LUI.UIList.new( f1_arg0, f1_arg1, -25, 0, nil, false, false, false, false )
	ZMExtraPerkVapors:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEnumEitherValue( element, f1_arg1, "state", CoD.ZMPerkUtility.PerkVaporStates.DEFAULT, CoD.ZMPerkUtility.PerkVaporStates.HIDDEN )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	ZMExtraPerkVapors:linkToElementModel( ZMExtraPerkVapors, "state", true, function ( model )
		f1_arg0:updateElementState( ZMExtraPerkVapors, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	ZMExtraPerkVapors:setLeftRight( 0, 0, 277, 707 )
	ZMExtraPerkVapors:setTopBottom( 0, 0, 48, 146 )
	ZMExtraPerkVapors:setScale( 1.09, 1.09 )
	ZMExtraPerkVapors:setWidgetType( CoD.ZMPerkVaporItem )
	ZMExtraPerkVapors:setHorizontalCount( 9 )
	ZMExtraPerkVapors:setSpacing( -25 )
	ZMExtraPerkVapors:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ZMExtraPerkVapors:setDataSource( "ExtraPerkVapors" )
	self:addElement( ZMExtraPerkVapors )
	self.ZMExtraPerkVapors = ZMExtraPerkVapors
	
	self:mergeStateConditions( {
		{
			stateName = "VisibleLarge",
			condition = function ( menu, element, event )
				local f25_local0
				if not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "playerScoreShown", 0 ) then
					f25_local0 = CoD.ZombieUtility.IsClientnumFromElementEqualToOurs( f1_arg1, self )
				else
					f25_local0 = false
				end
				return f25_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "playerScoreShown", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "playerScoreShown", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "playerScoreShown"
		} )
	end )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "zmhud.damage_point_shake", function ( model )
		if not CoD.ModelUtility.IsSelfModelValueNilOrZero( self, f1_arg1, "multiplier_count" ) and not CoD.ModelUtility.IsSelfModelValueTrue( self.PlayerDeadMarker, f1_arg1, "dead" ) then
			PlayClip( self, "Shake", f1_arg1 )
		end
	end )
	ZMExtraPerkVapors.id = "ZMExtraPerkVapors"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMScrArcade_Listing.__resetProperties = function ( f30_arg0 )
	f30_arg0.Panel:completeAnimation()
	f30_arg0.score:completeAnimation()
	f30_arg0.Glow:completeAnimation()
	f30_arg0.bottle:completeAnimation()
	f30_arg0.Multiplier:completeAnimation()
	f30_arg0.teamPlayercard:completeAnimation()
	f30_arg0.GamerTag:completeAnimation()
	f30_arg0.HealthValue:completeAnimation()
	f30_arg0.ReviveCount:completeAnimation()
	f30_arg0.PlayerDeadMarker:completeAnimation()
	f30_arg0.PositionText:completeAnimation()
	f30_arg0.ZombiesPortrait:completeAnimation()
	f30_arg0.ZMExtraPerkVapors:completeAnimation()
	f30_arg0.PlayercardBg:completeAnimation()
	f30_arg0.PlayercardBg2:completeAnimation()
	f30_arg0.Image:completeAnimation()
	f30_arg0.HeartWidget:completeAnimation()
	f30_arg0.Panel:setAlpha( 0 )
	f30_arg0.Panel:setScale( 1, 1 )
	f30_arg0.score:setLeftRight( 0, 0, 84.5, 128.5 )
	f30_arg0.score:setTopBottom( 0, 0, 40, 66 )
	f30_arg0.score:setAlpha( 1 )
	f30_arg0.score:setScale( 1, 1 )
	f30_arg0.Glow:setLeftRight( 0.14, 1.14, 14, -8 )
	f30_arg0.Glow:setTopBottom( 0, 0, 28, 80 )
	f30_arg0.Glow:setAlpha( 0 )
	f30_arg0.Glow:setScale( 1, 1 )
	f30_arg0.bottle:setAlpha( 1 )
	f30_arg0.bottle:setScale( 1, 1 )
	f30_arg0.Multiplier:setLeftRight( 0, 0, 251, 378 )
	f30_arg0.Multiplier:setTopBottom( 0, 0, 32, 56 )
	f30_arg0.Multiplier:setAlpha( 1 )
	f30_arg0.Multiplier:setScale( 1, 1 )
	f30_arg0.teamPlayercard:setAlpha( 1 )
	f30_arg0.GamerTag:setLeftRight( 0, 0, 85.5, 285.5 )
	f30_arg0.GamerTag:setTopBottom( 0, 0, 19, 37 )
	f30_arg0.GamerTag:setAlpha( 1 )
	f30_arg0.HealthValue:setLeftRight( 0, 0, 4, 242 )
	f30_arg0.HealthValue:setTopBottom( 0, 0, 27, 193 )
	f30_arg0.HealthValue:setAlpha( 1 )
	f30_arg0.ReviveCount:setLeftRight( 0, 0, -7.5, 32.5 )
	f30_arg0.ReviveCount:setTopBottom( 0, 0, 65.5, 86.5 )
	f30_arg0.ReviveCount:setAlpha( 0 )
	f30_arg0.PlayerDeadMarker:setLeftRight( 0, 0, -28, 114 )
	f30_arg0.PlayerDeadMarker:setTopBottom( 0, 0, -5.5, 93.5 )
	f30_arg0.PlayerDeadMarker:setAlpha( 1 )
	f30_arg0.PlayerDeadMarker:setScale( 1, 1 )
	f30_arg0.PositionText:setLeftRight( 0, 0, -33, -18 )
	f30_arg0.PositionText:setAlpha( 1 )
	f30_arg0.ZombiesPortrait:setLeftRight( 0, 0, 3, 83 )
	f30_arg0.ZombiesPortrait:setTopBottom( 0, 0, 2.5, 82.5 )
	f30_arg0.ZombiesPortrait:setAlpha( 1 )
	f30_arg0.ZMExtraPerkVapors:setAlpha( 1 )
	f30_arg0.PlayercardBg:setLeftRight( 0, 0, 0, 352 )
	f30_arg0.PlayercardBg:setTopBottom( 0, 0, -13, 101 )
	f30_arg0.PlayercardBg:setAlpha( 0 )
	f30_arg0.PlayercardBg:setYRot( 0 )
	f30_arg0.PlayercardBg:setImage( RegisterImage( 0x5BBCD252908044D ) )
	f30_arg0.PlayercardBg2:setLeftRight( 0, 0, 0, 285 )
	f30_arg0.PlayercardBg2:setTopBottom( 0, 0, 0, 103 )
	f30_arg0.PlayercardBg2:setAlpha( 0 )
	f30_arg0.PlayercardBg2:setImage( RegisterImage( 0x907FA1028168086 ) )
	f30_arg0.Image:setLeftRight( 0, 0, -11.5, 36.5 )
	f30_arg0.Image:setTopBottom( 0, 0, 38, 104 )
	f30_arg0.Image:setAlpha( 0 )
	f30_arg0.HeartWidget:setLeftRight( 0, 0, -7.5, 34.5 )
	f30_arg0.HeartWidget:setTopBottom( 0, 0, 55, 97 )
	f30_arg0.HeartWidget:setAlpha( 0 )
end

CoD.ZMScrArcade_Listing.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 13 )
			f31_arg0.teamPlayercard:completeAnimation()
			f31_arg0.teamPlayercard:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.teamPlayercard )
			f31_arg0.Panel:completeAnimation()
			f31_arg0.Panel:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.Panel )
			f31_arg0.Glow:completeAnimation()
			f31_arg0.Glow:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.Glow )
			f31_arg0.ZombiesPortrait:completeAnimation()
			f31_arg0.ZombiesPortrait:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.ZombiesPortrait )
			f31_arg0.bottle:completeAnimation()
			f31_arg0.bottle:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.bottle )
			f31_arg0.score:completeAnimation()
			f31_arg0.score:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.score )
			f31_arg0.Multiplier:completeAnimation()
			f31_arg0.Multiplier:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.Multiplier )
			f31_arg0.GamerTag:completeAnimation()
			f31_arg0.GamerTag:setTopBottom( 0, 0, -22, 2 )
			f31_arg0.GamerTag:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.GamerTag )
			f31_arg0.HealthValue:completeAnimation()
			f31_arg0.HealthValue:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.HealthValue )
			f31_arg0.ReviveCount:completeAnimation()
			f31_arg0.ReviveCount:setLeftRight( 0, 0, -5.5, 34.5 )
			f31_arg0.clipFinished( f31_arg0.ReviveCount )
			f31_arg0.PlayerDeadMarker:completeAnimation()
			f31_arg0.PlayerDeadMarker:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.PlayerDeadMarker )
			f31_arg0.PositionText:completeAnimation()
			f31_arg0.PositionText:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.PositionText )
			f31_arg0.ZMExtraPerkVapors:completeAnimation()
			f31_arg0.ZMExtraPerkVapors:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.ZMExtraPerkVapors )
		end,
		Visible = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 10 )
			local f32_local0 = function ( f33_arg0 )
				f32_arg0.teamPlayercard:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.teamPlayercard:setAlpha( 1 )
				f32_arg0.teamPlayercard:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.teamPlayercard:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.teamPlayercard:completeAnimation()
			f32_arg0.teamPlayercard:setAlpha( 0 )
			f32_local0( f32_arg0.teamPlayercard )
			f32_arg0.Panel:completeAnimation()
			f32_arg0.Panel:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.Panel )
			f32_arg0.Glow:completeAnimation()
			f32_arg0.Glow:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.Glow )
			local f32_local1 = function ( f34_arg0 )
				f32_arg0.bottle:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.bottle:setAlpha( 1 )
				f32_arg0.bottle:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.bottle:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.bottle:completeAnimation()
			f32_arg0.bottle:setAlpha( 0 )
			f32_local1( f32_arg0.bottle )
			local f32_local2 = function ( f35_arg0 )
				f32_arg0.score:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.score:setAlpha( 1 )
				f32_arg0.score:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.score:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.score:completeAnimation()
			f32_arg0.score:setAlpha( 0 )
			f32_local2( f32_arg0.score )
			local f32_local3 = function ( f36_arg0 )
				f32_arg0.Multiplier:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.Multiplier:setAlpha( 1 )
				f32_arg0.Multiplier:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.Multiplier:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.Multiplier:completeAnimation()
			f32_arg0.Multiplier:setAlpha( 0 )
			f32_local3( f32_arg0.Multiplier )
			local f32_local4 = function ( f37_arg0 )
				f32_arg0.GamerTag:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.GamerTag:setAlpha( 1 )
				f32_arg0.GamerTag:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.GamerTag:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.GamerTag:completeAnimation()
			f32_arg0.GamerTag:setLeftRight( 0, 0, 91.5, 291.5 )
			f32_arg0.GamerTag:setTopBottom( 0, 0, 16, 40 )
			f32_arg0.GamerTag:setAlpha( 0 )
			f32_local4( f32_arg0.GamerTag )
			f32_arg0.HealthValue:completeAnimation()
			f32_arg0.HealthValue:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.HealthValue )
			local f32_local5 = function ( f38_arg0 )
				f32_arg0.PositionText:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f32_arg0.PositionText:setAlpha( 1 )
				f32_arg0.PositionText:registerEventHandler( "interrupted_keyframe", f32_arg0.clipInterrupted )
				f32_arg0.PositionText:registerEventHandler( "transition_complete_keyframe", f32_arg0.clipFinished )
			end
			
			f32_arg0.PositionText:completeAnimation()
			f32_arg0.PositionText:setAlpha( 0 )
			f32_local5( f32_arg0.PositionText )
			f32_arg0.ZMExtraPerkVapors:completeAnimation()
			f32_arg0.ZMExtraPerkVapors:setAlpha( 0 )
			f32_arg0.clipFinished( f32_arg0.ZMExtraPerkVapors )
		end,
		VisibleLarge = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 17 )
			local f39_local0 = function ( f40_arg0 )
				f39_arg0.PlayercardBg2:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.PlayercardBg2:setAlpha( 1 )
				f39_arg0.PlayercardBg2:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.PlayercardBg2:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.PlayercardBg2:completeAnimation()
			f39_arg0.PlayercardBg2:setLeftRight( 0, 0, 0, 285 )
			f39_arg0.PlayercardBg2:setTopBottom( 0, 0, 0, 103 )
			f39_arg0.PlayercardBg2:setAlpha( 0 )
			f39_arg0.PlayercardBg2:setImage( RegisterImage( 0x6830AC5760FCD99 ) )
			f39_local0( f39_arg0.PlayercardBg2 )
			f39_arg0.teamPlayercard:completeAnimation()
			f39_arg0.teamPlayercard:setAlpha( 0 )
			f39_arg0.clipFinished( f39_arg0.teamPlayercard )
			local f39_local1 = function ( f41_arg0 )
				f39_arg0.PlayercardBg:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.PlayercardBg:setAlpha( 1 )
				f39_arg0.PlayercardBg:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.PlayercardBg:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.PlayercardBg:completeAnimation()
			f39_arg0.PlayercardBg:setLeftRight( 0, 0, 0, 290 )
			f39_arg0.PlayercardBg:setTopBottom( 0, 0, 0, 103 )
			f39_arg0.PlayercardBg:setAlpha( 0 )
			f39_arg0.PlayercardBg:setYRot( 180 )
			f39_arg0.PlayercardBg:setImage( RegisterImage( 0x62656BC725F9EEB ) )
			f39_local1( f39_arg0.PlayercardBg )
			f39_arg0.Panel:completeAnimation()
			f39_arg0.Panel:setAlpha( 0 )
			f39_arg0.Panel:setScale( 1.5, 1.5 )
			f39_arg0.clipFinished( f39_arg0.Panel )
			local f39_local2 = function ( f42_arg0 )
				f39_arg0.Glow:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.Glow:setAlpha( 0.05 )
				f39_arg0.Glow:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.Glow:completeAnimation()
			f39_arg0.Glow:setLeftRight( 0.43, 0.43, 3, 190 )
			f39_arg0.Glow:setTopBottom( 0, 0, 34, 85 )
			f39_arg0.Glow:setAlpha( 0 )
			f39_arg0.Glow:setScale( 1.5, 1 )
			f39_local2( f39_arg0.Glow )
			f39_arg0.ZombiesPortrait:completeAnimation()
			f39_arg0.ZombiesPortrait:setLeftRight( 0, 0, 1, 100 )
			f39_arg0.ZombiesPortrait:setTopBottom( 0, 0, 3.5, 101.5 )
			f39_arg0.clipFinished( f39_arg0.ZombiesPortrait )
			local f39_local3 = function ( f43_arg0 )
				f39_arg0.bottle:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.bottle:setAlpha( 1 )
				f39_arg0.bottle:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.bottle:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.bottle:completeAnimation()
			f39_arg0.bottle:setAlpha( 0 )
			f39_arg0.bottle:setScale( 1.5, 1.5 )
			f39_local3( f39_arg0.bottle )
			local f39_local4 = function ( f44_arg0 )
				f39_arg0.score:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.score:setAlpha( 1 )
				f39_arg0.score:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.score:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.score:completeAnimation()
			f39_arg0.score:setLeftRight( 0, 0, 104, 148 )
			f39_arg0.score:setTopBottom( 0, 0, 40, 72 )
			f39_arg0.score:setAlpha( 0 )
			f39_arg0.score:setScale( 1, 1 )
			f39_local4( f39_arg0.score )
			local f39_local5 = function ( f45_arg0 )
				f39_arg0.Multiplier:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.Multiplier:setAlpha( 1 )
				f39_arg0.Multiplier:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.Multiplier:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.Multiplier:completeAnimation()
			f39_arg0.Multiplier:setLeftRight( 0, 0, 298, 411 )
			f39_arg0.Multiplier:setTopBottom( 0, 0, 31, 81 )
			f39_arg0.Multiplier:setAlpha( 0 )
			f39_local5( f39_arg0.Multiplier )
			local f39_local6 = function ( f46_arg0 )
				f39_arg0.GamerTag:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.GamerTag:setAlpha( 1 )
				f39_arg0.GamerTag:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.GamerTag:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.GamerTag:completeAnimation()
			f39_arg0.GamerTag:setLeftRight( 0, 0, 106, 306 )
			f39_arg0.GamerTag:setTopBottom( 0, 0, 17, 38 )
			f39_arg0.GamerTag:setAlpha( 0 )
			f39_local6( f39_arg0.GamerTag )
			local f39_local7 = function ( f47_arg0 )
				f39_arg0.HealthValue:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.HealthValue:setAlpha( 1 )
				f39_arg0.HealthValue:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.HealthValue:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.HealthValue:completeAnimation()
			f39_arg0.HealthValue:setTopBottom( 0, 0, 30, 196 )
			f39_arg0.HealthValue:setAlpha( 0 )
			f39_local7( f39_arg0.HealthValue )
			local f39_local8 = function ( f48_arg0 )
				f39_arg0.Image:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.Image:setAlpha( 1 )
				f39_arg0.Image:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.Image:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.Image:completeAnimation()
			f39_arg0.Image:setLeftRight( 0, 0, -10.5, 37.5 )
			f39_arg0.Image:setTopBottom( 0, 0, 39, 105 )
			f39_arg0.Image:setAlpha( 0 )
			f39_local8( f39_arg0.Image )
			local f39_local9 = function ( f49_arg0 )
				f39_arg0.HeartWidget:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.HeartWidget:setAlpha( 1 )
				f39_arg0.HeartWidget:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.HeartWidget:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.HeartWidget:completeAnimation()
			f39_arg0.HeartWidget:setAlpha( 0 )
			f39_local9( f39_arg0.HeartWidget )
			local f39_local10 = function ( f50_arg0 )
				f39_arg0.ReviveCount:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.ReviveCount:setAlpha( 1 )
				f39_arg0.ReviveCount:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.ReviveCount:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.ReviveCount:completeAnimation()
			f39_arg0.ReviveCount:setTopBottom( 0, 0, 66.5, 87.5 )
			f39_arg0.ReviveCount:setAlpha( 0 )
			f39_local10( f39_arg0.ReviveCount )
			f39_arg0.PlayerDeadMarker:completeAnimation()
			f39_arg0.PlayerDeadMarker:setLeftRight( 0, 0, -10.5, 173.5 )
			f39_arg0.PlayerDeadMarker:setTopBottom( 0, 0, -4, 98 )
			f39_arg0.PlayerDeadMarker:setScale( 1.3, 1.3 )
			f39_arg0.clipFinished( f39_arg0.PlayerDeadMarker )
			local f39_local11 = function ( f51_arg0 )
				f39_arg0.PositionText:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.PositionText:setAlpha( 1 )
				f39_arg0.PositionText:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.PositionText:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.PositionText:completeAnimation()
			f39_arg0.PositionText:setAlpha( 0 )
			f39_local11( f39_arg0.PositionText )
			local f39_local12 = function ( f52_arg0 )
				f39_arg0.ZMExtraPerkVapors:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f39_arg0.ZMExtraPerkVapors:setAlpha( 1 )
				f39_arg0.ZMExtraPerkVapors:registerEventHandler( "interrupted_keyframe", f39_arg0.clipInterrupted )
				f39_arg0.ZMExtraPerkVapors:registerEventHandler( "transition_complete_keyframe", f39_arg0.clipFinished )
			end
			
			f39_arg0.ZMExtraPerkVapors:completeAnimation()
			f39_arg0.ZMExtraPerkVapors:setAlpha( 0 )
			f39_local12( f39_arg0.ZMExtraPerkVapors )
		end
	},
	VisibleLarge = {
		DefaultClip = function ( f53_arg0, f53_arg1 )
			f53_arg0:__resetProperties()
			f53_arg0:setupElementClipCounter( 17 )
			f53_arg0.PlayercardBg2:completeAnimation()
			f53_arg0.PlayercardBg2:setLeftRight( 0, 0, 0, 285 )
			f53_arg0.PlayercardBg2:setTopBottom( 0, 0, 0, 103 )
			f53_arg0.PlayercardBg2:setAlpha( 0 )
			f53_arg0.PlayercardBg2:setImage( RegisterImage( 0x6830AC5760FCD99 ) )
			f53_arg0.clipFinished( f53_arg0.PlayercardBg2 )
			f53_arg0.teamPlayercard:completeAnimation()
			f53_arg0.teamPlayercard:setAlpha( 0 )
			f53_arg0.clipFinished( f53_arg0.teamPlayercard )
			f53_arg0.PlayercardBg:completeAnimation()
			f53_arg0.PlayercardBg:setLeftRight( 0, 0, 0, 290 )
			f53_arg0.PlayercardBg:setTopBottom( 0, 0, 0, 103 )
			f53_arg0.PlayercardBg:setAlpha( 1 )
			f53_arg0.PlayercardBg:setYRot( 180 )
			f53_arg0.PlayercardBg:setImage( RegisterImage( 0xF9B1B03667EE62 ) )
			f53_arg0.clipFinished( f53_arg0.PlayercardBg )
			f53_arg0.Panel:completeAnimation()
			f53_arg0.Panel:setScale( 1.5, 1.5 )
			f53_arg0.clipFinished( f53_arg0.Panel )
			f53_arg0.Glow:completeAnimation()
			f53_arg0.Glow:setLeftRight( 0.43, 0.43, 0, 187 )
			f53_arg0.Glow:setTopBottom( 0, 0, 18.5, 69.5 )
			f53_arg0.Glow:setAlpha( 0 )
			f53_arg0.Glow:setScale( 1.5, 1 )
			f53_arg0.clipFinished( f53_arg0.Glow )
			f53_arg0.ZombiesPortrait:completeAnimation()
			f53_arg0.ZombiesPortrait:setLeftRight( 0, 0, 1, 101 )
			f53_arg0.ZombiesPortrait:setTopBottom( 0, 0, 1.5, 101.5 )
			f53_arg0.clipFinished( f53_arg0.ZombiesPortrait )
			f53_arg0.bottle:completeAnimation()
			f53_arg0.bottle:setScale( 1.5, 1.5 )
			f53_arg0.clipFinished( f53_arg0.bottle )
			f53_arg0.score:completeAnimation()
			f53_arg0.score:setLeftRight( 0, 0, 104, 148 )
			f53_arg0.score:setTopBottom( 0, 0, 27, 65 )
			f53_arg0.score:setScale( 1, 1 )
			f53_arg0.clipFinished( f53_arg0.score )
			f53_arg0.Multiplier:completeAnimation()
			f53_arg0.Multiplier:setLeftRight( 0, 0, 272, 385 )
			f53_arg0.Multiplier:setTopBottom( 0, 0, 31, 81 )
			f53_arg0.Multiplier:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.Multiplier )
			f53_arg0.GamerTag:completeAnimation()
			f53_arg0.GamerTag:setLeftRight( 0, 0, 106, 272 )
			f53_arg0.GamerTag:setTopBottom( 0, 0, 17, 38 )
			f53_arg0.GamerTag:setAlpha( 0 )
			f53_arg0.clipFinished( f53_arg0.GamerTag )
			f53_arg0.HealthValue:completeAnimation()
			f53_arg0.HealthValue:setTopBottom( 0, 0, 30, 196 )
			f53_arg0.clipFinished( f53_arg0.HealthValue )
			f53_arg0.Image:completeAnimation()
			f53_arg0.Image:setLeftRight( 0, 0, -10.5, 37.5 )
			f53_arg0.Image:setTopBottom( 0, 0, 39, 105 )
			f53_arg0.Image:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.Image )
			f53_arg0.HeartWidget:completeAnimation()
			f53_arg0.HeartWidget:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.HeartWidget )
			f53_arg0.ReviveCount:completeAnimation()
			f53_arg0.ReviveCount:setLeftRight( 0, 0, -6.5, 33.5 )
			f53_arg0.ReviveCount:setTopBottom( 0, 0, 68.5, 89.5 )
			f53_arg0.ReviveCount:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.ReviveCount )
			f53_arg0.PlayerDeadMarker:completeAnimation()
			f53_arg0.PlayerDeadMarker:setLeftRight( 0, 0, -10.5, 105.5 )
			f53_arg0.PlayerDeadMarker:setTopBottom( 0, 0, -4, 98 )
			f53_arg0.PlayerDeadMarker:setScale( 1.3, 1.3 )
			f53_arg0.clipFinished( f53_arg0.PlayerDeadMarker )
			f53_arg0.PositionText:completeAnimation()
			f53_arg0.PositionText:setLeftRight( 0, 0, -38, -23 )
			f53_arg0.PositionText:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.PositionText )
			f53_arg0.ZMExtraPerkVapors:completeAnimation()
			f53_arg0.ZMExtraPerkVapors:setAlpha( 1 )
			f53_arg0.clipFinished( f53_arg0.ZMExtraPerkVapors )
		end,
		Shake = function ( f54_arg0, f54_arg1 )
			f54_arg0:__resetProperties()
			f54_arg0:setupElementClipCounter( 16 )
			local f54_local0 = function ( f55_arg0 )
				local f55_local0 = function ( f56_arg0 )
					local f56_local0 = function ( f57_arg0 )
						f57_arg0:beginAnimation( 100 )
						f57_arg0:setLeftRight( 0, 0, 0, 285 )
						f57_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f56_arg0:beginAnimation( 90 )
					f56_arg0:setLeftRight( 0, 0, 2.63, 287.63 )
					f56_arg0:setTopBottom( 0, 0, 0, 103 )
					f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
				end
				
				f54_arg0.PlayercardBg2:beginAnimation( 80 )
				f54_arg0.PlayercardBg2:setLeftRight( 0, 0, 5, 290 )
				f54_arg0.PlayercardBg2:setTopBottom( 0, 0, -5, 98 )
				f54_arg0.PlayercardBg2:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.PlayercardBg2:registerEventHandler( "transition_complete_keyframe", f55_local0 )
			end
			
			f54_arg0.PlayercardBg2:completeAnimation()
			f54_arg0.PlayercardBg2:setLeftRight( 0, 0, 0, 285 )
			f54_arg0.PlayercardBg2:setTopBottom( 0, 0, 0, 103 )
			f54_arg0.PlayercardBg2:setAlpha( 0 )
			f54_arg0.PlayercardBg2:setImage( RegisterImage( 0x6830AC5760FCD99 ) )
			f54_local0( f54_arg0.PlayercardBg2 )
			f54_arg0.teamPlayercard:completeAnimation()
			f54_arg0.teamPlayercard:setAlpha( 0 )
			f54_arg0.clipFinished( f54_arg0.teamPlayercard )
			local f54_local1 = function ( f58_arg0 )
				local f58_local0 = function ( f59_arg0 )
					local f59_local0 = function ( f60_arg0 )
						f60_arg0:beginAnimation( 100 )
						f60_arg0:setLeftRight( 0, 0, 0, 290 )
						f60_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f59_arg0:beginAnimation( 90 )
					f59_arg0:setLeftRight( 0, 0, 2.63, 292.63 )
					f59_arg0:setTopBottom( 0, 0, 0, 103 )
					f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
				end
				
				f54_arg0.PlayercardBg:beginAnimation( 80 )
				f54_arg0.PlayercardBg:setLeftRight( 0, 0, 5, 295 )
				f54_arg0.PlayercardBg:setTopBottom( 0, 0, -5, 98 )
				f54_arg0.PlayercardBg:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.PlayercardBg:registerEventHandler( "transition_complete_keyframe", f58_local0 )
			end
			
			f54_arg0.PlayercardBg:completeAnimation()
			f54_arg0.PlayercardBg:setLeftRight( 0, 0, 0, 290 )
			f54_arg0.PlayercardBg:setTopBottom( 0, 0, 0, 103 )
			f54_arg0.PlayercardBg:setAlpha( 1 )
			f54_arg0.PlayercardBg:setYRot( 180 )
			f54_arg0.PlayercardBg:setImage( RegisterImage( 0xF9B1B03667EE62 ) )
			f54_local1( f54_arg0.PlayercardBg )
			f54_arg0.Panel:completeAnimation()
			f54_arg0.Panel:setScale( 1.5, 1.5 )
			f54_arg0.clipFinished( f54_arg0.Panel )
			f54_arg0.Glow:completeAnimation()
			f54_arg0.Glow:setLeftRight( 0.43, 0.43, 0, 187 )
			f54_arg0.Glow:setTopBottom( 0, 0, 18.5, 69.5 )
			f54_arg0.Glow:setAlpha( 0 )
			f54_arg0.Glow:setScale( 1.5, 1 )
			f54_arg0.clipFinished( f54_arg0.Glow )
			local f54_local2 = function ( f61_arg0 )
				local f61_local0 = function ( f62_arg0 )
					local f62_local0 = function ( f63_arg0 )
						f63_arg0:beginAnimation( 100 )
						f63_arg0:setLeftRight( 0, 0, 1, 101 )
						f63_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f62_arg0:beginAnimation( 90 )
					f62_arg0:setLeftRight( 0, 0, 3.5, 103.5 )
					f62_arg0:setTopBottom( 0, 0, 1.5, 101.5 )
					f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
				end
				
				f54_arg0.ZombiesPortrait:beginAnimation( 80 )
				f54_arg0.ZombiesPortrait:setLeftRight( 0, 0, 6, 106 )
				f54_arg0.ZombiesPortrait:setTopBottom( 0, 0, -3.5, 96.5 )
				f54_arg0.ZombiesPortrait:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.ZombiesPortrait:registerEventHandler( "transition_complete_keyframe", f61_local0 )
			end
			
			f54_arg0.ZombiesPortrait:completeAnimation()
			f54_arg0.ZombiesPortrait:setLeftRight( 0, 0, 1, 101 )
			f54_arg0.ZombiesPortrait:setTopBottom( 0, 0, 1.5, 101.5 )
			f54_local2( f54_arg0.ZombiesPortrait )
			f54_arg0.bottle:completeAnimation()
			f54_arg0.bottle:setScale( 1.5, 1.5 )
			f54_arg0.clipFinished( f54_arg0.bottle )
			local f54_local3 = function ( f64_arg0 )
				local f64_local0 = function ( f65_arg0 )
					local f65_local0 = function ( f66_arg0 )
						f66_arg0:beginAnimation( 100 )
						f66_arg0:setLeftRight( 0, 0, 104, 148 )
						f66_arg0:setTopBottom( 0, 0, 27, 65 )
						f66_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f65_arg0:beginAnimation( 90 )
					f65_arg0:setLeftRight( 0, 0, 106, 150 )
					f65_arg0:setTopBottom( 0, 0, 19, 57 )
					f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
				end
				
				f54_arg0.score:beginAnimation( 80 )
				f54_arg0.score:setLeftRight( 0, 0, 99, 143 )
				f54_arg0.score:setTopBottom( 0, 0, 22, 60 )
				f54_arg0.score:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.score:registerEventHandler( "transition_complete_keyframe", f64_local0 )
			end
			
			f54_arg0.score:completeAnimation()
			f54_arg0.score:setLeftRight( 0, 0, 104, 148 )
			f54_arg0.score:setTopBottom( 0, 0, 27, 65 )
			f54_arg0.score:setScale( 1, 1 )
			f54_local3( f54_arg0.score )
			f54_arg0.Multiplier:completeAnimation()
			f54_arg0.Multiplier:setLeftRight( 0, 0, 272, 385 )
			f54_arg0.Multiplier:setTopBottom( 0, 0, 31, 81 )
			f54_arg0.Multiplier:setAlpha( 1 )
			f54_arg0.clipFinished( f54_arg0.Multiplier )
			f54_arg0.GamerTag:completeAnimation()
			f54_arg0.GamerTag:setLeftRight( 0, 0, 106, 272 )
			f54_arg0.GamerTag:setTopBottom( 0, 0, 17, 38 )
			f54_arg0.GamerTag:setAlpha( 0 )
			f54_arg0.clipFinished( f54_arg0.GamerTag )
			local f54_local4 = function ( f67_arg0 )
				local f67_local0 = function ( f68_arg0 )
					local f68_local0 = function ( f69_arg0 )
						f69_arg0:beginAnimation( 100 )
						f69_arg0:setLeftRight( 0, 0, 4, 242 )
						f69_arg0:setTopBottom( 0, 0, 30, 196 )
						f69_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f68_arg0:beginAnimation( 90 )
					f68_arg0:setLeftRight( 0, 0, 5, 243 )
					f68_arg0:setTopBottom( 0, 0, 25, 191 )
					f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
				end
				
				f54_arg0.HealthValue:beginAnimation( 80 )
				f54_arg0.HealthValue:setLeftRight( 0, 0, 7, 245 )
				f54_arg0.HealthValue:setTopBottom( 0, 0, 27, 193 )
				f54_arg0.HealthValue:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.HealthValue:registerEventHandler( "transition_complete_keyframe", f67_local0 )
			end
			
			f54_arg0.HealthValue:completeAnimation()
			f54_arg0.HealthValue:setLeftRight( 0, 0, 4, 242 )
			f54_arg0.HealthValue:setTopBottom( 0, 0, 30, 196 )
			f54_local4( f54_arg0.HealthValue )
			local f54_local5 = function ( f70_arg0 )
				local f70_local0 = function ( f71_arg0 )
					local f71_local0 = function ( f72_arg0 )
						f72_arg0:beginAnimation( 100 )
						f72_arg0:setLeftRight( 0, 0, -10.5, 37.5 )
						f72_arg0:setTopBottom( 0, 0, 39, 105 )
						f72_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f71_arg0:beginAnimation( 90 )
					f71_arg0:setLeftRight( 0, 0, -11.5, 36.5 )
					f71_arg0:setTopBottom( 0, 0, 37, 103 )
					f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
				end
				
				f54_arg0.Image:beginAnimation( 80 )
				f54_arg0.Image:setLeftRight( 0, 0, -10.97, 37.03 )
				f54_arg0.Image:setTopBottom( 0, 0, 40, 106 )
				f54_arg0.Image:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.Image:registerEventHandler( "transition_complete_keyframe", f70_local0 )
			end
			
			f54_arg0.Image:completeAnimation()
			f54_arg0.Image:setLeftRight( 0, 0, -10.5, 37.5 )
			f54_arg0.Image:setTopBottom( 0, 0, 39, 105 )
			f54_arg0.Image:setAlpha( 1 )
			f54_local5( f54_arg0.Image )
			local f54_local6 = function ( f73_arg0 )
				local f73_local0 = function ( f74_arg0 )
					local f74_local0 = function ( f75_arg0 )
						f75_arg0:beginAnimation( 100 )
						f75_arg0:setLeftRight( 0, 0, -7.5, 34.5 )
						f75_arg0:setTopBottom( 0, 0, 55, 97 )
						f75_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f74_arg0:beginAnimation( 90 )
					f74_arg0:setLeftRight( 0, 0, -11.5, 30.5 )
					f74_arg0:setTopBottom( 0, 0, 52, 94 )
					f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
				end
				
				f54_arg0.HeartWidget:beginAnimation( 80 )
				f54_arg0.HeartWidget:setLeftRight( 0, 0, -8.5, 33.5 )
				f54_arg0.HeartWidget:setTopBottom( 0, 0, 58, 100 )
				f54_arg0.HeartWidget:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.HeartWidget:registerEventHandler( "transition_complete_keyframe", f73_local0 )
			end
			
			f54_arg0.HeartWidget:completeAnimation()
			f54_arg0.HeartWidget:setLeftRight( 0, 0, -7.5, 34.5 )
			f54_arg0.HeartWidget:setTopBottom( 0, 0, 55, 97 )
			f54_arg0.HeartWidget:setAlpha( 1 )
			f54_local6( f54_arg0.HeartWidget )
			local f54_local7 = function ( f76_arg0 )
				local f76_local0 = function ( f77_arg0 )
					local f77_local0 = function ( f78_arg0 )
						f78_arg0:beginAnimation( 100 )
						f78_arg0:setLeftRight( 0, 0, -6.5, 33.5 )
						f78_arg0:setTopBottom( 0, 0, 68.5, 89.5 )
						f78_arg0:registerEventHandler( "transition_complete_keyframe", f54_arg0.clipFinished )
					end
					
					f77_arg0:beginAnimation( 90 )
					f77_arg0:setTopBottom( 0, 0, 73.5, 94.5 )
					f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
				end
				
				f54_arg0.ReviveCount:beginAnimation( 80 )
				f54_arg0.ReviveCount:setLeftRight( 0, 0, -1.5, 38.5 )
				f54_arg0.ReviveCount:setTopBottom( 0, 0, 63.5, 84.5 )
				f54_arg0.ReviveCount:registerEventHandler( "interrupted_keyframe", f54_arg0.clipInterrupted )
				f54_arg0.ReviveCount:registerEventHandler( "transition_complete_keyframe", f76_local0 )
			end
			
			f54_arg0.ReviveCount:completeAnimation()
			f54_arg0.ReviveCount:setLeftRight( 0, 0, -6.5, 33.5 )
			f54_arg0.ReviveCount:setTopBottom( 0, 0, 68.5, 89.5 )
			f54_arg0.ReviveCount:setAlpha( 1 )
			f54_local7( f54_arg0.ReviveCount )
			f54_arg0.PlayerDeadMarker:completeAnimation()
			f54_arg0.PlayerDeadMarker:setLeftRight( 0, 0, -10.5, 105.5 )
			f54_arg0.PlayerDeadMarker:setTopBottom( 0, 0, -4, 98 )
			f54_arg0.PlayerDeadMarker:setScale( 1.3, 1.3 )
			f54_arg0.clipFinished( f54_arg0.PlayerDeadMarker )
			f54_arg0.PositionText:completeAnimation()
			f54_arg0.PositionText:setLeftRight( 0, 0, -38, -23 )
			f54_arg0.PositionText:setAlpha( 1 )
			f54_arg0.clipFinished( f54_arg0.PositionText )
		end
	},
	Visible = {
		DefaultClip = function ( f79_arg0, f79_arg1 )
			f79_arg0:__resetProperties()
			f79_arg0:setupElementClipCounter( 10 )
			f79_arg0.score:completeAnimation()
			f79_arg0.score:setLeftRight( 0, 0, 84.5, 128.5 )
			f79_arg0.score:setTopBottom( 0, 0, 40, 66 )
			f79_arg0.clipFinished( f79_arg0.score )
			f79_arg0.Multiplier:completeAnimation()
			f79_arg0.Multiplier:setLeftRight( 0, 0, 201, 328 )
			f79_arg0.Multiplier:setTopBottom( 0, 0, 25, 49 )
			f79_arg0.Multiplier:setScale( 0.75, 0.75 )
			f79_arg0.clipFinished( f79_arg0.Multiplier )
			f79_arg0.GamerTag:completeAnimation()
			f79_arg0.GamerTag:setLeftRight( 0, 0, 85.5, 215.5 )
			f79_arg0.GamerTag:setTopBottom( 0, 0, 19, 37 )
			f79_arg0.clipFinished( f79_arg0.GamerTag )
			f79_arg0.HealthValue:completeAnimation()
			f79_arg0.HealthValue:setAlpha( 0 )
			f79_arg0.clipFinished( f79_arg0.HealthValue )
			f79_arg0.Image:completeAnimation()
			f79_arg0.Image:setAlpha( 1 )
			f79_arg0.clipFinished( f79_arg0.Image )
			f79_arg0.HeartWidget:completeAnimation()
			f79_arg0.HeartWidget:setAlpha( 1 )
			f79_arg0.clipFinished( f79_arg0.HeartWidget )
			f79_arg0.ReviveCount:completeAnimation()
			f79_arg0.ReviveCount:setAlpha( 1 )
			f79_arg0.clipFinished( f79_arg0.ReviveCount )
			f79_arg0.PlayerDeadMarker:completeAnimation()
			f79_arg0.PlayerDeadMarker:setLeftRight( 0, 0, -25, 107 )
			f79_arg0.clipFinished( f79_arg0.PlayerDeadMarker )
			f79_arg0.PositionText:completeAnimation()
			f79_arg0.PositionText:setLeftRight( 0, 0, -38, -23 )
			f79_arg0.PositionText:setAlpha( 1 )
			f79_arg0.clipFinished( f79_arg0.PositionText )
			f79_arg0.ZMExtraPerkVapors:completeAnimation()
			f79_arg0.ZMExtraPerkVapors:setAlpha( 0 )
			f79_arg0.clipFinished( f79_arg0.ZMExtraPerkVapors )
		end
	}
}
CoD.ZMScrArcade_Listing.__onClose = function ( f80_arg0 )
	f80_arg0.PlayercardBg2:close()
	f80_arg0.PlayercardBg3:close()
	f80_arg0.teamPlayercard:close()
	f80_arg0.PlayercardBg:close()
	f80_arg0.Panel:close()
	f80_arg0.Glow:close()
	f80_arg0.ZombiesPortrait:close()
	f80_arg0.bottle:close()
	f80_arg0.score:close()
	f80_arg0.Multiplier:close()
	f80_arg0.GamerTag:close()
	f80_arg0.HealthValue:close()
	f80_arg0.HeartWidget:close()
	f80_arg0.ReviveCount:close()
	f80_arg0.PlayerDeadMarker:close()
	f80_arg0.PositionText:close()
	f80_arg0.ZMExtraPerkVapors:close()
end

