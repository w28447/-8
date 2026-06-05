CoD.WaypointHardpoint_ColorPattern = InheritFrom( LUI.UIElement )
CoD.WaypointHardpoint_ColorPattern.__defaultWidth = 76
CoD.WaypointHardpoint_ColorPattern.__defaultHeight = 76
CoD.WaypointHardpoint_ColorPattern.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.WaypointHardpoint_ColorPattern )
	self.id = "WaypointHardpoint_ColorPattern"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PlayerTeamColor = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -38, 38 )
	PlayerTeamColor:setAlpha( 0.92 )
	PlayerTeamColor:setImage( RegisterImage( "uie_ui_hud_core_waypoint_led" ) )
	PlayerTeamColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	PlayerTeamColor:setShaderVector( 0, 0.5, 1, 0, 0 )
	PlayerTeamColor:setShaderVector( 1, 0, 0, 0, 0 )
	PlayerTeamColor:setShaderVector( 2, 0, 1, 0, 0 )
	PlayerTeamColor:setShaderVector( 3, 0, 0, 0, 0 )
	PlayerTeamColor:setShaderVector( 4, 0, 0, 0, 0 )
	PlayerTeamColor:subscribeToGlobalModel( f1_arg1, "Factions", "playerFactionFlagColor", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			PlayerTeamColor:setRGB( f2_local0 )
		end
	end )
	self:addElement( PlayerTeamColor )
	self.PlayerTeamColor = PlayerTeamColor
	
	local ObjectiveColor = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -38, 38 )
	ObjectiveColor:setAlpha( 0.92 )
	ObjectiveColor:setImage( RegisterImage( "uie_ui_hud_core_waypoint_led" ) )
	ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	ObjectiveColor:setShaderVector( 0, 0, 1, 0, 0 )
	ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
	ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
	ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
	ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
	ObjectiveColor:linkToElementModel( self, "color", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ObjectiveColor:setRGB( CoD.WaypointUtility.ConvertToBaseColor( f3_local0 ) )
		end
	end )
	self:addElement( ObjectiveColor )
	self.ObjectiveColor = ObjectiveColor
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.WaypointHardpoint_ColorPattern.__resetProperties = function ( f4_arg0 )
	f4_arg0.PlayerTeamColor:completeAnimation()
	f4_arg0.ObjectiveColor:completeAnimation()
	f4_arg0.PlayerTeamColor:setAlpha( 0.92 )
	f4_arg0.ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	f4_arg0.ObjectiveColor:setShaderVector( 0, 0, 1, 0, 0 )
	f4_arg0.ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
	f4_arg0.ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
	f4_arg0.ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
	f4_arg0.ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
end

CoD.WaypointHardpoint_ColorPattern.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.PlayerTeamColor:completeAnimation()
			f5_arg0.PlayerTeamColor:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.PlayerTeamColor )
		end
	},
	Contested = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.ObjectiveColor:completeAnimation()
			f6_arg0.ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
			f6_arg0.ObjectiveColor:setShaderVector( 0, 0, 0.5, 0, 0 )
			f6_arg0.ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
			f6_arg0.ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
			f6_arg0.ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
			f6_arg0.ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
			f6_arg0.clipFinished( f6_arg0.ObjectiveColor )
		end
	}
}
CoD.WaypointHardpoint_ColorPattern.__onClose = function ( f7_arg0 )
	f7_arg0.PlayerTeamColor:close()
	f7_arg0.ObjectiveColor:close()
end

