require( "ui/uieditor/widgets/hud/deadspectate/deadspectate_spectatingmodebuttonprompt" )

CoD.DeadSpectate_SpectatingMode = InheritFrom( LUI.UIElement )
CoD.DeadSpectate_SpectatingMode.__defaultWidth = 300
CoD.DeadSpectate_SpectatingMode.__defaultHeight = 37
CoD.DeadSpectate_SpectatingMode.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DeadSpectate_SpectatingMode )
	self.id = "DeadSpectate_SpectatingMode"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local switchPrompt0 = LUI.UIText.new( 0.5, 0.5, -64.5, 124.5, 0.5, 0.5, -12.5, 12.5 )
	switchPrompt0:setText( LocalizeToUpperString( "mpui/first_person_view" ) )
	switchPrompt0:setTTF( "ttmussels_regular" )
	switchPrompt0:setMaterial( LUI.UIImage.GetCachedMaterial( 0xAE166D9BA8C6907 ) )
	switchPrompt0:setShaderVector( 0, 0, 0, 0, 0 )
	switchPrompt0:setShaderVector( 1, 0, 0, 0, 0 )
	switchPrompt0:setShaderVector( 2, 1, 0, 0, 0 )
	switchPrompt0:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	switchPrompt0:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( switchPrompt0 )
	self.switchPrompt0 = switchPrompt0
	
	local button = CoD.DeadSpectate_SpectatingModeButtonPrompt.new( f1_arg0, f1_arg1, 0.5, 0.5, -108.5, -71.5, 0.5, 0.5, -18.5, 18.5 )
	button:setScale( 0.7, 0.7 )
	self:addElement( button )
	self.button = button
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not CoD.HUDUtility.AllowThirdPersonSpectating( f1_arg1 )
			end
		},
		{
			stateName = "Prop",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "prop" ) and not IsAttackingTeam( f1_arg1 )
			end
		},
		{
			stateName = "FirstPerson",
			condition = function ( menu, element, event )
				local f4_local0 = IsActiveLocalClientsCountEqualTo( 1 )
				if f4_local0 then
					f4_local0 = IsGametypeSettingsValue( "disableThirdPersonSpectating", 0 )
					if f4_local0 then
						f4_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x79E684E90DF4625] )
						if f4_local0 then
							f4_local0 = not IsSplitscreenAndInGame( f1_arg1 )
						end
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "ThirdPerson",
			condition = function ( menu, element, event )
				local f5_local0 = IsActiveLocalClientsCountEqualTo( 1 )
				if f5_local0 then
					f5_local0 = IsGametypeSettingsValue( "disableThirdPersonSpectating", 0 )
					if f5_local0 then
						f5_local0 = not IsSplitscreenAndInGame( f1_arg1 )
					end
				end
				return f5_local0
			end
		}
	} )
	local f1_local3 = self
	local f1_local4 = self.subscribeToModel
	local f1_local5 = Engine.GetGlobalModel()
	f1_local4( f1_local3, f1_local5["hudItems.war.attackingTeam"], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "hudItems.war.attackingTeam"
		} )
	end, false )
	f1_local3 = self
	f1_local4 = self.subscribeToModel
	f1_local5 = DataSources.CodCaster.getModel( f1_arg1 )
	f1_local4( f1_local3, f1_local5.profileSettingsUpdated, function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "profileSettingsUpdated"
		} )
	end, false )
	f1_local3 = self
	f1_local4 = self.subscribeToModel
	f1_local5 = Engine.GetModelForController( f1_arg1 )
	f1_local4( f1_local3, f1_local5["UIVisibilityBit." .. Enum.UIVisibilityBit[0x79E684E90DF4625]], function ( f8_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f8_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x79E684E90DF4625]
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DeadSpectate_SpectatingMode.__resetProperties = function ( f9_arg0 )
	f9_arg0.switchPrompt0:completeAnimation()
	f9_arg0.button:completeAnimation()
	f9_arg0.switchPrompt0:setAlpha( 1 )
	f9_arg0.switchPrompt0:setText( LocalizeToUpperString( "mpui/first_person_view" ) )
	f9_arg0.button:setAlpha( 1 )
end

CoD.DeadSpectate_SpectatingMode.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 0 )
		end
	},
	Hidden = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 2 )
			f11_arg0.switchPrompt0:completeAnimation()
			f11_arg0.switchPrompt0:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.switchPrompt0 )
			f11_arg0.button:completeAnimation()
			f11_arg0.button:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.button )
		end
	},
	Prop = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 2 )
			f12_arg0.switchPrompt0:completeAnimation()
			f12_arg0.switchPrompt0:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.switchPrompt0 )
			f12_arg0.button:completeAnimation()
			f12_arg0.button:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.button )
		end
	},
	FirstPerson = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 0 )
		end
	},
	ThirdPerson = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			f14_arg0.switchPrompt0:completeAnimation()
			f14_arg0.switchPrompt0:setText( LocalizeToUpperString( "mpui/third_person_view" ) )
			f14_arg0.clipFinished( f14_arg0.switchPrompt0 )
		end
	}
}
CoD.DeadSpectate_SpectatingMode.__onClose = function ( f15_arg0 )
	f15_arg0.button:close()
end

