CoD.WaypointHardpoint_Timer = InheritFrom( LUI.UIElement )
CoD.WaypointHardpoint_Timer.__defaultWidth = 114
CoD.WaypointHardpoint_Timer.__defaultHeight = 26
CoD.WaypointHardpoint_Timer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.WaypointHardpoint_Timer )
	self.id = "WaypointHardpoint_Timer"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local TimerText = LUI.UIText.new( 0, 0, 0, 114, 0, 0, 0, 26 )
	TimerText:setTTF( "0arame_mono_stencil" )
	TimerText:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	TimerText:setShaderVector( 0, 0, 0, 0, 0 )
	TimerText:setShaderVector( 1, 0, 0, 0, 0 )
	TimerText:setShaderVector( 2, 1, 1, 1, 0 )
	TimerText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	TimerText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	TimerText:subscribeToGlobalModel( f1_arg1, "BombTimer", "bomb0.timeRemainingMilliSec", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			TimerText:setText( MillisecondsAsMinAndSeconds( f2_local0 ) )
		end
	end )
	self:addElement( TimerText )
	self.TimerText = TimerText
	
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return not IsGametypeSettingsValue( "autoDestroyTime", 0 )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.WaypointHardpoint_Timer.__resetProperties = function ( f4_arg0 )
	f4_arg0.TimerText:completeAnimation()
	f4_arg0.TimerText:setAlpha( 1 )
end

CoD.WaypointHardpoint_Timer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.TimerText:completeAnimation()
			f5_arg0.TimerText:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.TimerText )
		end
	},
	Active = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.WaypointHardpoint_Timer.__onClose = function ( f7_arg0 )
	f7_arg0.TimerText:close()
end

