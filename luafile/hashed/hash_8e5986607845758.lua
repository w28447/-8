CoD.ProgressBar_RankInfo = InheritFrom( LUI.UIElement )
CoD.ProgressBar_RankInfo.__defaultWidth = 326
CoD.ProgressBar_RankInfo.__defaultHeight = 30
CoD.ProgressBar_RankInfo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ProgressBar_RankInfo )
	self.id = "ProgressBar_RankInfo"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local nextRankDesc = LUI.UIText.new( 1, 1, -112, 0, 0, 0, 2.5, 27.5 )
	nextRankDesc:setRGB( ColorSet.T8__SILVER.r, ColorSet.T8__SILVER.g, ColorSet.T8__SILVER.b )
	nextRankDesc:setTTF( "skorzhen" )
	nextRankDesc:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	nextRankDesc:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	nextRankDesc:subscribeToGlobalModel( f1_arg1, "XPProgressionBar", "xpToNextRank", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			nextRankDesc:setText( LocalizeIntoString( "mpui/n_xp", f2_local0 ) )
		end
	end )
	self:addElement( nextRankDesc )
	self.nextRankDesc = nextRankDesc
	
	local nextRankDesc0 = LUI.UIText.new( 1, 1, -326, -132, 0, 0, 2.5, 27.5 )
	nextRankDesc0:setRGB( ColorSet.T8__SILVER.r, ColorSet.T8__SILVER.g, ColorSet.T8__SILVER.b )
	nextRankDesc0:setText( Engine[0xF9F1239CFD921FE]( "menu/next_level" ) )
	nextRankDesc0:setTTF( "skorzhen" )
	nextRankDesc0:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	self:addElement( nextRankDesc0 )
	self.nextRankDesc0 = nextRankDesc0
	
	local nextRankDesc00 = LUI.UIText.new( 1, 1, -317, -123, 0, 0, 2.5, 27.5 )
	nextRankDesc00:setRGB( ColorSet.T8__SILVER.r, ColorSet.T8__SILVER.g, ColorSet.T8__SILVER.b )
	nextRankDesc00:setText( CoD.BaseUtility.AlreadyLocalized( ":" ) )
	nextRankDesc00:setTTF( "dinnext_regular" )
	nextRankDesc00:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	self:addElement( nextRankDesc00 )
	self.nextRankDesc00 = nextRankDesc00
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueEqualToEitherValue( f1_arg1, "XPProgressionBar.xpToNextRank", 0, nil )
			end
		},
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["XPProgressionBar.xpToNextRank"], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "XPProgressionBar.xpToNextRank"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	f1_local5 = self
	if IsCurrentLanguageArabic() and not CoD.ModelUtility.IsModelValueEqualToEitherValue( f1_arg1, "XPProgressionBar.xpToNextRank", 0, nil ) then
		SetState( self, "Arabic", f1_arg1 )
	end
	return self
end

CoD.ProgressBar_RankInfo.__resetProperties = function ( f6_arg0 )
	f6_arg0.nextRankDesc00:completeAnimation()
	f6_arg0.nextRankDesc0:completeAnimation()
	f6_arg0.nextRankDesc:completeAnimation()
	f6_arg0.nextRankDesc00:setLeftRight( 1, 1, -317, -123 )
	f6_arg0.nextRankDesc00:setAlpha( 1 )
	f6_arg0.nextRankDesc00:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	f6_arg0.nextRankDesc0:setLeftRight( 1, 1, -326, -132 )
	f6_arg0.nextRankDesc0:setAlpha( 1 )
	f6_arg0.nextRankDesc0:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	f6_arg0.nextRankDesc:setLeftRight( 1, 1, -112, 0 )
	f6_arg0.nextRankDesc:setAlpha( 1 )
	f6_arg0.nextRankDesc:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
end

CoD.ProgressBar_RankInfo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 3 )
			f8_arg0.nextRankDesc:completeAnimation()
			f8_arg0.nextRankDesc:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.nextRankDesc )
			f8_arg0.nextRankDesc0:completeAnimation()
			f8_arg0.nextRankDesc0:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.nextRankDesc0 )
			f8_arg0.nextRankDesc00:completeAnimation()
			f8_arg0.nextRankDesc00:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.nextRankDesc00 )
		end
	},
	Arabic = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 3 )
			f9_arg0.nextRankDesc:completeAnimation()
			f9_arg0.nextRankDesc:setLeftRight( 1, 1, -326, -214 )
			f9_arg0.nextRankDesc:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
			f9_arg0.clipFinished( f9_arg0.nextRankDesc )
			f9_arg0.nextRankDesc0:completeAnimation()
			f9_arg0.nextRankDesc0:setLeftRight( 1, 1, -194, 0 )
			f9_arg0.nextRankDesc0:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
			f9_arg0.clipFinished( f9_arg0.nextRankDesc0 )
			f9_arg0.nextRankDesc00:completeAnimation()
			f9_arg0.nextRankDesc00:setLeftRight( 1, 1, -201, -7 )
			f9_arg0.nextRankDesc00:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
			f9_arg0.clipFinished( f9_arg0.nextRankDesc00 )
		end
	}
}
CoD.ProgressBar_RankInfo.__onClose = function ( f10_arg0 )
	f10_arg0.nextRankDesc:close()
end

