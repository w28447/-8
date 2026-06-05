CoD.AmmoWidgetMP_Ability_Flare = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_Ability_Flare.__defaultWidth = 1746
CoD.AmmoWidgetMP_Ability_Flare.__defaultHeight = 1074
CoD.AmmoWidgetMP_Ability_Flare.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetMP_Ability_Flare )
	self.id = "AmmoWidgetMP_Ability_Flare"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local flare12 = LUI.UIImage.new( 0, 0, 0, 1746, 0, 0, 0, 1074 )
	flare12:setImage( RegisterImage( "uie_hud_common_core_ammo_flare1" ) )
	flare12:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated_add" ) )
	flare12:setShaderVector( 0, 24, 0, 0, 0 )
	flare12:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( flare12 )
	self.flare12 = flare12
	
	self:mergeStateConditions( {
		{
			stateName = "Full",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueEqualToEitherValue( self, f1_arg1, "state", Enum[0xF0447219F15F7F3][0x194F4FEC53470DF], Enum[0xF0447219F15F7F3][0x1CF78BFE5F942F1] )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetMP_Ability_Flare.__resetProperties = function ( f4_arg0 )
	f4_arg0.flare12:completeAnimation()
	f4_arg0.flare12:setAlpha( 1 )
	f4_arg0.flare12:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated_add" ) )
	f4_arg0.flare12:setShaderVector( 0, 24, 0, 0, 0 )
	f4_arg0.flare12:setShaderVector( 1, 0, 0, 0, 0 )
end

CoD.AmmoWidgetMP_Ability_Flare.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.flare12:completeAnimation()
			f5_arg0.flare12:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.flare12 )
			f5_arg0.nextClip = "DefaultClip"
		end,
		Full = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			local f6_local0 = function ( f7_arg0 )
				local f7_local0 = function ( f8_arg0 )
					f8_arg0:beginAnimation( 9 )
					f8_arg0:setAlpha( 0 )
					f8_arg0:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
				end
				
				f6_arg0.flare12:beginAnimation( 990 )
				f6_arg0.flare12:setShaderVector( 1, 23.76, 0, 0, 0 )
				f6_arg0.flare12:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.flare12:registerEventHandler( "transition_complete_keyframe", f7_local0 )
			end
			
			f6_arg0.flare12:completeAnimation()
			f6_arg0.flare12:setAlpha( 1 )
			f6_arg0.flare12:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated_add" ) )
			f6_arg0.flare12:setShaderVector( 0, 24, 0, 0, 0 )
			f6_arg0.flare12:setShaderVector( 1, 0, 0, 0, 0 )
			f6_local0( f6_arg0.flare12 )
		end
	},
	Full = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.flare12:completeAnimation()
			f9_arg0.flare12:setAlpha( 0 )
			f9_arg0.flare12:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated_add" ) )
			f9_arg0.flare12:setShaderVector( 0, 24, 0, 0, 0 )
			f9_arg0.flare12:setShaderVector( 1, 0, 0, 0, 0 )
			f9_arg0.clipFinished( f9_arg0.flare12 )
		end
	}
}
