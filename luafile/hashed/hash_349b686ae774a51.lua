require( "ui/uieditor/widgets/zmfrontend/zmaartrialtabroundstatdescriptiontall" )

CoD.ZMAARTrialTabRoundStatTall = InheritFrom( LUI.UIElement )
CoD.ZMAARTrialTabRoundStatTall.__defaultWidth = 390
CoD.ZMAARTrialTabRoundStatTall.__defaultHeight = 60
CoD.ZMAARTrialTabRoundStatTall.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMAARTrialTabRoundStatTall )
	self.id = "ZMAARTrialTabRoundStatTall"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local FocusedBg = LUI.UIImage.new( 0, 0, -2, 390, 0, 1, 0, 0 )
	FocusedBg:setImage( RegisterImage( "uie_blood_paint" ) )
	self:addElement( FocusedBg )
	self.FocusedBg = FocusedBg
	
	local Num = LUI.UIText.new( 0, 0, 6, 33, 0, 0, 5, 25 )
	Num:setAlpha( 0.5 )
	Num:setTTF( "skorzhen" )
	Num:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Num:linkToElementModel( self, "numText", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Num:setText( f2_local0 )
		end
	end )
	self:addElement( Num )
	self.Num = Num
	
	local Title = LUI.UIText.new( 0, 0, 33, 348, 0, 0, 5, 25 )
	Title:setRGB( 0.92, 0.92, 0.92 )
	Title:setTTF( "skorzhen" )
	Title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Title:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	Title:linkToElementModel( self, "titleText", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			Title:setText( f3_local0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local TitleUnknown = LUI.UIText.new( 0, 0, 67, 390, 0, 0, 5, 25 )
	TitleUnknown:setRGB( 0.92, 0.92, 0.92 )
	TitleUnknown:setText( Engine[0xF9F1239CFD921FE]( 0x521943FA0D36D36 ) )
	TitleUnknown:setTTF( "skorzhen" )
	TitleUnknown:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( TitleUnknown )
	self.TitleUnknown = TitleUnknown
	
	local Line = LUI.UIImage.new( 0, 0, 0, 348, 0, 0, 2, 22 )
	Line:setImage( RegisterImage( "uie_strike_line" ) )
	self:addElement( Line )
	self.Line = Line
	
	local Description = CoD.ZMAARTrialTabRoundStatDescriptionTall.new( f1_arg0, f1_arg1, 0, 0, 33, 370, 0, 0, 26, 44 )
	Description:setAlpha( 0.3 )
	Description:linkToElementModel( self, "descText", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			Description.Desc:setText( f4_local0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueGreaterThanSelfModelValue( element, f1_arg1, "ZMHudGlobal", "trials.roundNumber", "trialIndex" )
			end
		},
		{
			stateName = "Focused",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueEqualToSelfModelValue( element, f1_arg1, "ZMHudGlobal", "trials.roundNumber", "trialIndex" )
			end
		},
		{
			stateName = "PreviouslyCompleted",
			condition = function ( menu, element, event )
				return CoD.ZombieUtility.IsSelfModelValueLessThanOrEqualToTrialStatVal( element, f1_arg1, "trialIndex", "highest_round_reached" )
			end
		},
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsGlobalDataSourceModelValueLessThanSelfModelValue( element, f1_arg1, "ZMHudGlobal", "trials.roundNumber", "trialIndex" )
			end
		}
	} )
	local f1_local7 = self
	local f1_local8 = self.subscribeToModel
	local f1_local9 = DataSources.ZMHudGlobal.getModel( f1_arg1 )
	f1_local8( f1_local7, f1_local9["trials.roundNumber"], function ( f9_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "trials.roundNumber"
		} )
	end, false )
	self:linkToElementModel( self, "trialIndex", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "trialIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMAARTrialTabRoundStatTall.__resetProperties = function ( f11_arg0 )
	f11_arg0.FocusedBg:completeAnimation()
	f11_arg0.Line:completeAnimation()
	f11_arg0.Title:completeAnimation()
	f11_arg0.TitleUnknown:completeAnimation()
	f11_arg0.Description:completeAnimation()
	f11_arg0.FocusedBg:setAlpha( 1 )
	f11_arg0.Line:setAlpha( 1 )
	f11_arg0.Title:setAlpha( 1 )
	f11_arg0.Title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	f11_arg0.TitleUnknown:setLeftRight( 0, 0, 67, 390 )
	f11_arg0.TitleUnknown:setRGB( 0.92, 0.92, 0.92 )
	f11_arg0.TitleUnknown:setAlpha( 1 )
	f11_arg0.TitleUnknown:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	f11_arg0.Description:setAlpha( 0.3 )
end

CoD.ZMAARTrialTabRoundStatTall.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 5 )
			f12_arg0.FocusedBg:completeAnimation()
			f12_arg0.FocusedBg:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.FocusedBg )
			f12_arg0.Title:completeAnimation()
			f12_arg0.Title:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Title )
			f12_arg0.TitleUnknown:completeAnimation()
			f12_arg0.TitleUnknown:setAlpha( 1 )
			f12_arg0.clipFinished( f12_arg0.TitleUnknown )
			f12_arg0.Line:completeAnimation()
			f12_arg0.Line:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Line )
			f12_arg0.Description:completeAnimation()
			f12_arg0.Description:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Description )
		end
	},
	Complete = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 2 )
			f13_arg0.FocusedBg:completeAnimation()
			f13_arg0.FocusedBg:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.FocusedBg )
			f13_arg0.TitleUnknown:completeAnimation()
			f13_arg0.TitleUnknown:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.TitleUnknown )
		end
	},
	Focused = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 3 )
			f14_arg0.FocusedBg:completeAnimation()
			f14_arg0.FocusedBg:setAlpha( 1 )
			f14_arg0.clipFinished( f14_arg0.FocusedBg )
			f14_arg0.TitleUnknown:completeAnimation()
			f14_arg0.TitleUnknown:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.TitleUnknown )
			f14_arg0.Line:completeAnimation()
			f14_arg0.Line:setAlpha( 0 )
			f14_arg0.clipFinished( f14_arg0.Line )
		end
	},
	PreviouslyCompleted = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 4 )
			f15_arg0.FocusedBg:completeAnimation()
			f15_arg0.FocusedBg:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.FocusedBg )
			f15_arg0.Title:completeAnimation()
			f15_arg0.Title:setAlpha( 0.6 )
			f15_arg0.clipFinished( f15_arg0.Title )
			f15_arg0.TitleUnknown:completeAnimation()
			f15_arg0.TitleUnknown:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.TitleUnknown )
			f15_arg0.Line:completeAnimation()
			f15_arg0.Line:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.Line )
		end
	},
	Incomplete = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 5 )
			f16_arg0.FocusedBg:completeAnimation()
			f16_arg0.FocusedBg:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.FocusedBg )
			f16_arg0.Title:completeAnimation()
			f16_arg0.Title:setAlpha( 0 )
			f16_arg0.Title:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
			f16_arg0.clipFinished( f16_arg0.Title )
			f16_arg0.TitleUnknown:completeAnimation()
			f16_arg0.TitleUnknown:setLeftRight( 0, 0, 24.5, 334.5 )
			f16_arg0.TitleUnknown:setRGB( ColorSet.Title.r, ColorSet.Title.g, ColorSet.Title.b )
			f16_arg0.TitleUnknown:setAlpha( 0.6 )
			f16_arg0.TitleUnknown:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
			f16_arg0.clipFinished( f16_arg0.TitleUnknown )
			f16_arg0.Line:completeAnimation()
			f16_arg0.Line:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.Line )
			f16_arg0.Description:completeAnimation()
			f16_arg0.Description:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.Description )
		end
	}
}
CoD.ZMAARTrialTabRoundStatTall.__onClose = function ( f17_arg0 )
	f17_arg0.Num:close()
	f17_arg0.Title:close()
	f17_arg0.Description:close()
end

