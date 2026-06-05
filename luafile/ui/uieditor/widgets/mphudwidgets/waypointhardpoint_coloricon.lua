CoD.WaypointHardpoint_ColorIcon = InheritFrom( LUI.UIElement )
CoD.WaypointHardpoint_ColorIcon.__defaultWidth = 76
CoD.WaypointHardpoint_ColorIcon.__defaultHeight = 78
CoD.WaypointHardpoint_ColorIcon.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.WaypointHardpoint_ColorIcon )
	self.id = "WaypointHardpoint_ColorIcon"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PlayerTeamColor2 = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -36, 40 )
	PlayerTeamColor2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	PlayerTeamColor2:setShaderVector( 0, 0.5, 1, 0, 0 )
	PlayerTeamColor2:setShaderVector( 1, 0, 0, 0, 0 )
	PlayerTeamColor2:setShaderVector( 2, 0, 1, 0, 0 )
	PlayerTeamColor2:setShaderVector( 3, 0, 0, 0, 0 )
	PlayerTeamColor2:setShaderVector( 4, 0, 0, 0, 0 )
	PlayerTeamColor2:subscribeToGlobalModel( f1_arg1, "Factions", "playerFactionFlagColor", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			PlayerTeamColor2:setRGB( f2_local0 )
		end
	end )
	PlayerTeamColor2:linkToElementModel( self, "icon", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			PlayerTeamColor2:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f3_local0 ) ) )
		end
	end )
	self:addElement( PlayerTeamColor2 )
	self.PlayerTeamColor2 = PlayerTeamColor2
	
	local PlayerTeamColor = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -38, 38 )
	PlayerTeamColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	PlayerTeamColor:setShaderVector( 0, 0.5, 1, 0, 0 )
	PlayerTeamColor:setShaderVector( 1, 0, 0, 0, 0 )
	PlayerTeamColor:setShaderVector( 2, 0, 1, 0, 0 )
	PlayerTeamColor:setShaderVector( 3, 0, 0, 0, 0 )
	PlayerTeamColor:setShaderVector( 4, 0, 0, 0, 0 )
	PlayerTeamColor:subscribeToGlobalModel( f1_arg1, "Factions", "playerFactionFlagColor", function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			PlayerTeamColor:setRGB( f4_local0 )
		end
	end )
	PlayerTeamColor:linkToElementModel( self, "icon", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			PlayerTeamColor:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f5_local0 ) ) )
		end
	end )
	self:addElement( PlayerTeamColor )
	self.PlayerTeamColor = PlayerTeamColor
	
	local ObjectiveColor2 = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -36, 40 )
	ObjectiveColor2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	ObjectiveColor2:setShaderVector( 0, 0, 1, 0, 0 )
	ObjectiveColor2:setShaderVector( 1, 0, 0, 0, 0 )
	ObjectiveColor2:setShaderVector( 2, 0, 1, 0, 0 )
	ObjectiveColor2:setShaderVector( 3, 0, 0, 0, 0 )
	ObjectiveColor2:setShaderVector( 4, 0, 0, 0, 0 )
	ObjectiveColor2:linkToElementModel( self, "color", true, function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			ObjectiveColor2:setRGB( CoD.WaypointUtility.ConvertToBaseColor( f6_local0 ) )
		end
	end )
	ObjectiveColor2:linkToElementModel( self, "icon", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			ObjectiveColor2:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f7_local0 ) ) )
		end
	end )
	self:addElement( ObjectiveColor2 )
	self.ObjectiveColor2 = ObjectiveColor2
	
	local ObjectiveColor = LUI.UIImage.new( 0.5, 0.5, -38, 38, 0.5, 0.5, -38, 38 )
	ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	ObjectiveColor:setShaderVector( 0, 0, 1, 0, 0 )
	ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
	ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
	ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
	ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
	ObjectiveColor:linkToElementModel( self, "color", true, function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			ObjectiveColor:setRGB( CoD.WaypointUtility.ConvertToBaseColor( f8_local0 ) )
		end
	end )
	ObjectiveColor:linkToElementModel( self, "icon", true, function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			ObjectiveColor:setImage( RegisterImage( BlackTransparentIfNilOrEmpty( f9_local0 ) ) )
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

CoD.WaypointHardpoint_ColorIcon.__resetProperties = function ( f10_arg0 )
	f10_arg0.PlayerTeamColor:completeAnimation()
	f10_arg0.PlayerTeamColor2:completeAnimation()
	f10_arg0.ObjectiveColor:completeAnimation()
	f10_arg0.ObjectiveColor2:completeAnimation()
	f10_arg0.PlayerTeamColor:setAlpha( 1 )
	f10_arg0.PlayerTeamColor2:setAlpha( 1 )
	f10_arg0.ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	f10_arg0.ObjectiveColor:setShaderVector( 0, 0, 1, 0, 0 )
	f10_arg0.ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
	f10_arg0.ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
	f10_arg0.ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
	f10_arg0.ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
	f10_arg0.ObjectiveColor2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	f10_arg0.ObjectiveColor2:setShaderVector( 0, 0, 1, 0, 0 )
	f10_arg0.ObjectiveColor2:setShaderVector( 1, 0, 0, 0, 0 )
	f10_arg0.ObjectiveColor2:setShaderVector( 2, 0, 1, 0, 0 )
	f10_arg0.ObjectiveColor2:setShaderVector( 3, 0, 0, 0, 0 )
	f10_arg0.ObjectiveColor2:setShaderVector( 4, 0, 0, 0, 0 )
end

CoD.WaypointHardpoint_ColorIcon.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 2 )
			f11_arg0.PlayerTeamColor2:completeAnimation()
			f11_arg0.PlayerTeamColor2:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.PlayerTeamColor2 )
			f11_arg0.PlayerTeamColor:completeAnimation()
			f11_arg0.PlayerTeamColor:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.PlayerTeamColor )
		end
	},
	Contested = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 2 )
			f12_arg0.ObjectiveColor2:completeAnimation()
			f12_arg0.ObjectiveColor2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
			f12_arg0.ObjectiveColor2:setShaderVector( 0, 0, 0.5, 0, 0 )
			f12_arg0.ObjectiveColor2:setShaderVector( 1, 0, 0, 0, 0 )
			f12_arg0.ObjectiveColor2:setShaderVector( 2, 0, 1, 0, 0 )
			f12_arg0.ObjectiveColor2:setShaderVector( 3, 0, 0, 0, 0 )
			f12_arg0.ObjectiveColor2:setShaderVector( 4, 0, 0, 0, 0 )
			f12_arg0.clipFinished( f12_arg0.ObjectiveColor2 )
			f12_arg0.ObjectiveColor:completeAnimation()
			f12_arg0.ObjectiveColor:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
			f12_arg0.ObjectiveColor:setShaderVector( 0, 0, 0.5, 0, 0 )
			f12_arg0.ObjectiveColor:setShaderVector( 1, 0, 0, 0, 0 )
			f12_arg0.ObjectiveColor:setShaderVector( 2, 0, 1, 0, 0 )
			f12_arg0.ObjectiveColor:setShaderVector( 3, 0, 0, 0, 0 )
			f12_arg0.ObjectiveColor:setShaderVector( 4, 0, 0, 0, 0 )
			f12_arg0.clipFinished( f12_arg0.ObjectiveColor )
		end
	}
}
CoD.WaypointHardpoint_ColorIcon.__onClose = function ( f13_arg0 )
	f13_arg0.PlayerTeamColor2:close()
	f13_arg0.PlayerTeamColor:close()
	f13_arg0.ObjectiveColor2:close()
	f13_arg0.ObjectiveColor:close()
end

