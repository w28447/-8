require( "x64:9e72f5e31108d41" )

CoD.ScoreInfo_RoundList = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_RoundList.__defaultWidth = 72
CoD.ScoreInfo_RoundList.__defaultHeight = 32
CoD.ScoreInfo_RoundList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_RoundList )
	self.id = "ScoreInfo_RoundList"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local RoundPips = LUI.UIList.new( f1_arg0, f1_arg1, -12, 0, nil, false, false, false, false )
	RoundPips:setLeftRight( 0, 0, 0, 72 )
	RoundPips:setTopBottom( 1, 1, -2, 30 )
	RoundPips:setWidgetType( CoD.WarScoreInfo_RoundPip )
	RoundPips:setSpacing( -12 )
	RoundPips:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	RoundPips:subscribeToGlobalModel( f1_arg1, "GameScore", "roundWinLimit", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			RoundPips:setHorizontalCount( f2_local0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( RoundPips, "setWidth", function ( element, controller )
		ScaleToElementWidth( self, element, 0 )
	end )
	self:addElement( RoundPips )
	self.RoundPips = RoundPips
	
	local RoundScoreText = LUI.UIText.new( 0.5, 0.5, -100, 100, 0, 0, 36, 55 )
	RoundScoreText:setAlpha( 0 )
	RoundScoreText:setText( "" )
	RoundScoreText:setTTF( "0arame_mono_stencil" )
	RoundScoreText:setLetterSpacing( 6 )
	RoundScoreText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	RoundScoreText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( RoundScoreText )
	self.RoundScoreText = RoundScoreText
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsGametypeSettingsValue( "roundWinLimit", 0 ) and not IsGametypeSettingsValue( "roundWinLimit", 1 ) then
					f4_local0 = CoD.GameTypeUtility.ShowRoundPips()
				else
					f4_local0 = false
				end
				return f4_local0
			end
		},
		{
			stateName = "VisibleSmall",
			condition = function ( menu, element, event )
				local f5_local0
				if not IsGametypeSettingsValue( "roundWinLimit", 0 ) and not IsGametypeSettingsValue( "roundWinLimit", 1 ) then
					f5_local0 = CoD.GameTypeUtility.ShowSmallRoundPips()
				else
					f5_local0 = false
				end
				return f5_local0
			end
		},
		{
			stateName = "VisibleNumbers",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGametypeSettingsValue( "roundWinLimit", 0 ) then
					f6_local0 = not IsGametypeSettingsValue( "roundWinLimit", 1 )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	RoundPips.id = "RoundPips"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_RoundList.__resetProperties = function ( f7_arg0 )
	f7_arg0.RoundPips:completeAnimation()
	f7_arg0.RoundScoreText:completeAnimation()
	f7_arg0.RoundPips:setAlpha( 1 )
	f7_arg0.RoundPips:setScale( 1, 1 )
	f7_arg0.RoundScoreText:setAlpha( 0 )
end

CoD.ScoreInfo_RoundList.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 2 )
			f8_arg0.RoundPips:completeAnimation()
			f8_arg0.RoundPips:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.RoundPips )
			f8_arg0.RoundScoreText:completeAnimation()
			f8_arg0.RoundScoreText:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.RoundScoreText )
		end
	},
	Visible = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 2 )
			f9_arg0.RoundPips:completeAnimation()
			f9_arg0.RoundPips:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.RoundPips )
			f9_arg0.RoundScoreText:completeAnimation()
			f9_arg0.RoundScoreText:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.RoundScoreText )
		end
	},
	VisibleSmall = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.RoundPips:completeAnimation()
			f10_arg0.RoundPips:setScale( 0.75, 0.75 )
			f10_arg0.clipFinished( f10_arg0.RoundPips )
		end
	},
	VisibleNumbers = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 2 )
			f11_arg0.RoundPips:completeAnimation()
			f11_arg0.RoundPips:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.RoundPips )
			f11_arg0.RoundScoreText:completeAnimation()
			f11_arg0.RoundScoreText:setAlpha( 1 )
			f11_arg0.clipFinished( f11_arg0.RoundScoreText )
		end
	}
}
CoD.ScoreInfo_RoundList.__onClose = function ( f12_arg0 )
	f12_arg0.RoundPips:close()
end

