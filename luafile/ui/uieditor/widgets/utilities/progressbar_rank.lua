require( "ui/uieditor/widgets/common/commonwipemeterwithglow" )
require( "x64:1f06e98239ff754" )
require( "ui/uieditor/widgets/zmfrontend/laboratory/zm_laboratorydescriptiondividersecondary" )

CoD.ProgressBar_Rank = InheritFrom( LUI.UIElement )
CoD.ProgressBar_Rank.__defaultWidth = 1725
CoD.ProgressBar_Rank.__defaultHeight = 97
CoD.ProgressBar_Rank.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ProgressBar_Rank )
	self.id = "ProgressBar_Rank"
	self.soundSet = "ChooseDecal"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local LevelMeterDarkTint = LUI.UIImage.new( 0, 0, 181.5, 1548.5, 0.5, 0.5, -4.5, 11.5 )
	LevelMeterDarkTint:setRGB( 0, 0, 0 )
	LevelMeterDarkTint:setAlpha( 0.1 )
	self:addElement( LevelMeterDarkTint )
	self.LevelMeterDarkTint = LevelMeterDarkTint
	
	local StoneTiledBacking = LUI.UIImage.new( 0, 0, 178.5, 1548.5, 0.5, 0.5, -4.5, 11.5 )
	StoneTiledBacking:setAlpha( 0.4 )
	StoneTiledBacking:setImage( RegisterImage( "uie_ui_zm_laboratory_buttonbgtile" ) )
	StoneTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	StoneTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	StoneTiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( StoneTiledBacking )
	self.StoneTiledBacking = StoneTiledBacking
	
	local curRank = LUI.UIText.new( 0, 0, 106, 151, 0.5, 0.5, -11.5, 24.5 )
	curRank:setTTF( "skorzhen" )
	curRank:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	curRank:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "currentRank", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			curRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, f2_local0 ) )
		end
	end )
	curRank:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "currentRank", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			curRank:setText( f3_local0 )
		end
	end )
	self:addElement( curRank )
	self.curRank = curRank
	
	local curRankImg = LUI.UIImage.new( 0, 0, -12, 84, 0.5, 0.5, -42.5, 41.5 )
	curRankImg:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "currentRankIcon", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			curRankImg:setImage( RegisterImage( f4_local0 ) )
		end
	end )
	self:addElement( curRankImg )
	self.curRankImg = curRankImg
	
	local EarnedXP = CoD.CommonWipeMeterWithGlow.new( f1_arg0, f1_arg1, 0, 0, 181, 1548, 0.5, 0.5, -16.5, 22.5 )
	EarnedXP.Meter:setRGB( 1, 0.73, 0 )
	EarnedXP.Meter:setImage( RegisterImage( "uie_ui_menu_aar_levelup_bar" ) )
	EarnedXP.MeterAdd:setAlpha( 0.3 )
	EarnedXP.MeterAdd:setImage( RegisterImage( "uie_ui_menu_aar_levelup_bar" ) )
	EarnedXP.MeterGlow:setRGB( 0.39, 0.18, 0 )
	EarnedXP.MeterGlow:setImage( RegisterImage( "uie_ui_menu_aar_levelup_bar_glow" ) )
	EarnedXP:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "progress", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			EarnedXP.Meter:setShaderVector( 0, CoD.GetVectorComponentFromString( f5_local0, 1 ), CoD.GetVectorComponentFromString( f5_local0, 2 ), CoD.GetVectorComponentFromString( f5_local0, 3 ), CoD.GetVectorComponentFromString( f5_local0, 4 ) )
		end
	end )
	EarnedXP:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "progress", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			EarnedXP.MeterAdd:setShaderVector( 0, CoD.GetVectorComponentFromString( f6_local0, 1 ), CoD.GetVectorComponentFromString( f6_local0, 2 ), CoD.GetVectorComponentFromString( f6_local0, 3 ), CoD.GetVectorComponentFromString( f6_local0, 4 ) )
		end
	end )
	EarnedXP:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "progress", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			EarnedXP.MeterGlow:setShaderVector( 0, CoD.GetVectorComponentFromString( f7_local0, 1 ), CoD.GetVectorComponentFromString( f7_local0, 2 ), CoD.GetVectorComponentFromString( f7_local0, 3 ), CoD.GetVectorComponentFromString( f7_local0, 4 ) )
		end
	end )
	self:addElement( EarnedXP )
	self.EarnedXP = EarnedXP
	
	local nextRank = LUI.UIText.new( 1, 1, -147, -102, 0.5, 0.5, -11.5, 24.5 )
	nextRank:setTTF( "ttmussels_demibold" )
	nextRank:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	nextRank:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "nextRank", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			nextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, f8_local0 ) )
		end
	end )
	nextRank:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "nextRank", function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			nextRank:setText( f9_local0 )
		end
	end )
	self:addElement( nextRank )
	self.nextRank = nextRank
	
	local nextRankImage = LUI.UIImage.new( 1, 1, -84, 12, 0.5, 0.5, -42.5, 41.5 )
	nextRankImage:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "nextRankIcon", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			nextRankImage:setImage( RegisterImage( f10_local0 ) )
		end
	end )
	self:addElement( nextRankImage )
	self.nextRankImage = nextRankImage
	
	local nextRankDescInfo = CoD.ProgressBar_RankInfo.new( f1_arg0, f1_arg1, 0, 0, 1222, 1548, 0, 0, 6, 36 )
	self:addElement( nextRankDescInfo )
	self.nextRankDescInfo = nextRankDescInfo
	
	local maxRankTextBox = LUI.UIText.new( 1, 1, -156, -40, 1, 1, -62, -26 )
	maxRankTextBox:setAlpha( 0 )
	maxRankTextBox:setText( Engine[0xF9F1239CFD921FE]( "mpui/max_caps" ) )
	maxRankTextBox:setTTF( "skorzhen" )
	maxRankTextBox:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	maxRankTextBox:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( maxRankTextBox )
	self.maxRankTextBox = maxRankTextBox
	
	local BotOrnament = CoD.zm_LaboratoryDescriptionDividerSecondary.new( f1_arg0, f1_arg1, 0, 0, 178.5, 1548.5, 0, 0, 54, 80 )
	self:addElement( BotOrnament )
	self.BotOrnament = BotOrnament
	
	local TopOrnament = CoD.zm_LaboratoryDescriptionDividerSecondary.new( f1_arg0, f1_arg1, 0, 0, 178.5, 1548.5, 0, 0, 23, 49 )
	self:addElement( TopOrnament )
	self.TopOrnament = TopOrnament
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		},
		{
			stateName = "MaxLevelCP",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThanOrEqualTo( f1_arg1, "XPProgressionBar.nextRank", CoD.RankUtility.GetRankCap() + 1 ) and IsCampaign()
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsMaxPrestigeLevel( f1_arg1 ) then
					f13_local0 = CoD.ModelUtility.IsModelValueGreaterThanOrEqualTo( f1_arg1, "XPProgressionBar.nextRank", CoD.RankUtility.GetRankCap() + 1 )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "MaxParagonLevel",
			condition = function ( menu, element, event )
				local f14_local0 = IsInParagonCapableGameMode()
				if f14_local0 then
					f14_local0 = IsMaxPrestigeLevel( f1_arg1 )
					if f14_local0 then
						f14_local0 = CoD.ModelUtility.IsModelValueGreaterThanOrEqualTo( f1_arg1, "XPProgressionBar.nextRank", CoD.RankUtility.GetParagonRankCap() + 1 )
					end
				end
				return f14_local0
			end
		}
	} )
	local f1_local12 = self
	local f1_local13 = self.subscribeToModel
	local f1_local14 = Engine.GetGlobalModel()
	f1_local13( f1_local12, f1_local14["lobbyRoot.lobbyNav"], function ( f15_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f15_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	f1_local12 = self
	f1_local13 = self.subscribeToModel
	f1_local14 = Engine.GetModelForController( f1_arg1 )
	f1_local13( f1_local12, f1_local14["XPProgressionBar.nextRank"], function ( f16_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f16_arg0:get(),
			modelName = "XPProgressionBar.nextRank"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ProgressBar_Rank.__resetProperties = function ( f17_arg0 )
	f17_arg0.nextRankImage:completeAnimation()
	f17_arg0.nextRank:completeAnimation()
	f17_arg0.curRankImg:completeAnimation()
	f17_arg0.curRank:completeAnimation()
	f17_arg0.nextRankDescInfo:completeAnimation()
	f17_arg0.TopOrnament:completeAnimation()
	f17_arg0.BotOrnament:completeAnimation()
	f17_arg0.LevelMeterDarkTint:completeAnimation()
	f17_arg0.StoneTiledBacking:completeAnimation()
	f17_arg0.EarnedXP:completeAnimation()
	f17_arg0.maxRankTextBox:completeAnimation()
	f17_arg0.nextRankImage:setAlpha( 1 )
	f17_arg0.nextRank:setAlpha( 1 )
	f17_arg0.curRankImg:setAlpha( 1 )
	f17_arg0.curRank:setAlpha( 1 )
	f17_arg0.nextRankDescInfo:setAlpha( 1 )
	f17_arg0.TopOrnament:setAlpha( 1 )
	f17_arg0.BotOrnament:setAlpha( 1 )
	f17_arg0.LevelMeterDarkTint:setAlpha( 0.1 )
	f17_arg0.StoneTiledBacking:setAlpha( 0.4 )
	f17_arg0.EarnedXP:setAlpha( 1 )
	f17_arg0.maxRankTextBox:setAlpha( 0 )
end

CoD.ProgressBar_Rank.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 10 )
			f19_arg0.LevelMeterDarkTint:completeAnimation()
			f19_arg0.LevelMeterDarkTint:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.LevelMeterDarkTint )
			f19_arg0.StoneTiledBacking:completeAnimation()
			f19_arg0.StoneTiledBacking:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.StoneTiledBacking )
			f19_arg0.curRank:completeAnimation()
			f19_arg0.curRank:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.curRank )
			f19_arg0.curRankImg:completeAnimation()
			f19_arg0.curRankImg:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.curRankImg )
			f19_arg0.EarnedXP:completeAnimation()
			f19_arg0.EarnedXP:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.EarnedXP )
			f19_arg0.nextRank:completeAnimation()
			f19_arg0.nextRank:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.nextRank )
			f19_arg0.nextRankImage:completeAnimation()
			f19_arg0.nextRankImage:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.nextRankImage )
			f19_arg0.nextRankDescInfo:completeAnimation()
			f19_arg0.nextRankDescInfo:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.nextRankDescInfo )
			f19_arg0.BotOrnament:completeAnimation()
			f19_arg0.BotOrnament:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.BotOrnament )
			f19_arg0.TopOrnament:completeAnimation()
			f19_arg0.TopOrnament:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.TopOrnament )
		end
	},
	MaxLevelCP = {
		DefaultClip = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 3 )
			f20_arg0.nextRank:completeAnimation()
			f20_arg0.nextRank:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.nextRank )
			f20_arg0.nextRankImage:completeAnimation()
			f20_arg0.nextRankImage:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.nextRankImage )
			f20_arg0.nextRankDescInfo:completeAnimation()
			f20_arg0.nextRankDescInfo:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.nextRankDescInfo )
		end
	},
	MaxLevel = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 4 )
			f21_arg0.nextRank:completeAnimation()
			f21_arg0.nextRank:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.nextRank )
			f21_arg0.nextRankImage:completeAnimation()
			f21_arg0.nextRankImage:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.nextRankImage )
			f21_arg0.nextRankDescInfo:completeAnimation()
			f21_arg0.nextRankDescInfo:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.nextRankDescInfo )
			f21_arg0.maxRankTextBox:completeAnimation()
			f21_arg0.maxRankTextBox:setAlpha( 1 )
			f21_arg0.clipFinished( f21_arg0.maxRankTextBox )
		end
	},
	MaxParagonLevel = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 10 )
			f22_arg0.LevelMeterDarkTint:completeAnimation()
			f22_arg0.LevelMeterDarkTint:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.LevelMeterDarkTint )
			f22_arg0.StoneTiledBacking:completeAnimation()
			f22_arg0.StoneTiledBacking:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.StoneTiledBacking )
			f22_arg0.curRank:completeAnimation()
			f22_arg0.curRank:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.curRank )
			f22_arg0.curRankImg:completeAnimation()
			f22_arg0.curRankImg:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.curRankImg )
			f22_arg0.EarnedXP:completeAnimation()
			f22_arg0.EarnedXP:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.EarnedXP )
			f22_arg0.nextRank:completeAnimation()
			f22_arg0.nextRank:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.nextRank )
			f22_arg0.nextRankImage:completeAnimation()
			f22_arg0.nextRankImage:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.nextRankImage )
			f22_arg0.nextRankDescInfo:completeAnimation()
			f22_arg0.nextRankDescInfo:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.nextRankDescInfo )
			f22_arg0.BotOrnament:completeAnimation()
			f22_arg0.BotOrnament:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.BotOrnament )
			f22_arg0.TopOrnament:completeAnimation()
			f22_arg0.TopOrnament:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.TopOrnament )
		end
	}
}
CoD.ProgressBar_Rank.__onClose = function ( f23_arg0 )
	f23_arg0.curRank:close()
	f23_arg0.curRankImg:close()
	f23_arg0.EarnedXP:close()
	f23_arg0.nextRank:close()
	f23_arg0.nextRankImage:close()
	f23_arg0.nextRankDescInfo:close()
	f23_arg0.BotOrnament:close()
	f23_arg0.TopOrnament:close()
end

