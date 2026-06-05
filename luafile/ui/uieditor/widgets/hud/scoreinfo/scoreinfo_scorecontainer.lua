require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_scorecontainer_internal" )

CoD.ScoreInfo_ScoreContainer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_ScoreContainer.__defaultWidth = 80
CoD.ScoreInfo_ScoreContainer.__defaultHeight = 166
CoD.ScoreInfo_ScoreContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_ScoreContainer )
	self.id = "ScoreInfo_ScoreContainer"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	
	local ScoreContainerInternal = CoD.ScoreInfo_ScoreContainer_Internal.new( f1_arg0, f1_arg1, 0, 0, 0, 80, 0, 0, 0, 166 )
	ScoreContainerInternal.ScoreBar.Container2:setAlpha( 0 )
	LUI.OverrideFunction_CallOriginalFirst( ScoreContainerInternal, "setHeight", function ( element, controller )
		ScaleToElementHeight( self, element, 0 )
	end )
	self:addElement( ScoreContainerInternal )
	self.ScoreContainerInternal = ScoreContainerInternal
	
	ScoreContainerInternal.id = "ScoreContainerInternal"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_ScoreContainer.__onClose = function ( f3_arg0 )
	f3_arg0.ScoreContainerInternal:close()
end

