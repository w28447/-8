require( "ui/uieditor/widgets/mphudwidgets/waypointhardpoint_coloricon" )
require( "ui/uieditor/widgets/mphudwidgets/waypointhardpoint_colorpattern" )

CoD.ScoreInfoHardpointObjective = InheritFrom( LUI.UIElement )
CoD.ScoreInfoHardpointObjective.__defaultWidth = 24
CoD.ScoreInfoHardpointObjective.__defaultHeight = 24
CoD.ScoreInfoHardpointObjective.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfoHardpointObjective )
	self.id = "ScoreInfoHardpointObjective"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local HardpointIcon = CoD.WaypointHardpoint_ColorIcon.new( f1_arg0, f1_arg1, 0, 0, 0, 24, 0, 0, 0, 24 )
	HardpointIcon:mergeStateConditions( {
		{
			stateName = "Contested",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsScoreInfoObjectiveContested( self, f1_arg1 )
			end
		}
	} )
	HardpointIcon:linkToElementModel( HardpointIcon, "clientUseMask", true, function ( model )
		f1_arg0:updateElementState( HardpointIcon, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "clientUseMask"
		} )
	end )
	HardpointIcon:linkToElementModel( self, nil, false, function ( model )
		HardpointIcon:setModel( model, f1_arg1 )
	end )
	self:addElement( HardpointIcon )
	self.HardpointIcon = HardpointIcon
	
	local WaypointPatternColor = CoD.WaypointHardpoint_ColorPattern.new( f1_arg0, f1_arg1, 0.5, 0.5, -12, 12, 0.5, 0.5, -12, 12 )
	WaypointPatternColor:mergeStateConditions( {
		{
			stateName = "Contested",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsScoreInfoObjectiveContested( self, f1_arg1 )
			end
		}
	} )
	WaypointPatternColor:linkToElementModel( WaypointPatternColor, "clientUseMask", true, function ( model )
		f1_arg0:updateElementState( WaypointPatternColor, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "clientUseMask"
		} )
	end )
	WaypointPatternColor:linkToElementModel( self, nil, false, function ( model )
		WaypointPatternColor:setModel( model, f1_arg1 )
	end )
	self:addElement( WaypointPatternColor )
	self.WaypointPatternColor = WaypointPatternColor
	
	self:mergeStateConditions( {
		{
			stateName = "visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfoHardpointObjective.__resetProperties = function ( f9_arg0 )
	f9_arg0.WaypointPatternColor:completeAnimation()
	f9_arg0.HardpointIcon:completeAnimation()
	f9_arg0.WaypointPatternColor:setAlpha( 1 )
	f9_arg0.HardpointIcon:setAlpha( 1 )
end

CoD.ScoreInfoHardpointObjective.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 2 )
			f10_arg0.HardpointIcon:completeAnimation()
			f10_arg0.HardpointIcon:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.HardpointIcon )
			f10_arg0.WaypointPatternColor:completeAnimation()
			f10_arg0.WaypointPatternColor:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.WaypointPatternColor )
		end
	},
	visible = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.ScoreInfoHardpointObjective.__onClose = function ( f12_arg0 )
	f12_arg0.HardpointIcon:close()
	f12_arg0.WaypointPatternColor:close()
end

