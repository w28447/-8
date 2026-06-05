CoD.ZMPerkVaporModifierFrame = InheritFrom( LUI.UIElement )
CoD.ZMPerkVaporModifierFrame.__defaultWidth = 72
CoD.ZMPerkVaporModifierFrame.__defaultHeight = 72
CoD.ZMPerkVaporModifierFrame.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMPerkVaporModifierFrame )
	self.id = "ZMPerkVaporModifierFrame"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Frame = LUI.UIImage.new( 0, 0, 0, 72, 0, 0, 0, 72 )
	Frame:setImage( RegisterImage( 0xBE87F41005A7725 ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Frame2 = LUI.UIImage.new( 0, 0, 0, 72, 0, 0, 0, 72 )
	Frame2:setAlpha( 0.75 )
	Frame2:setImage( RegisterImage( 0xBE87F41005A7725 ) )
	Frame2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Frame2 )
	self.Frame2 = Frame2
	
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "isLastAltar" ) and not CoD.ModelUtility.IsSelfModelValueNilOrZero( element, f1_arg1, "modifierActive" )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "isLastAltar" )
			end
		}
	} )
	self:linkToElementModel( self, "isLastAltar", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "isLastAltar"
		} )
	end )
	self:linkToElementModel( self, "modifierActive", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "modifierActive"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMPerkVaporModifierFrame.__resetProperties = function ( f6_arg0 )
	f6_arg0.Frame:completeAnimation()
	f6_arg0.Frame2:completeAnimation()
	f6_arg0.Frame:setAlpha( 1 )
	f6_arg0.Frame2:setAlpha( 0.75 )
end

CoD.ZMPerkVaporModifierFrame.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 2 )
			f7_arg0.Frame:completeAnimation()
			f7_arg0.Frame:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Frame )
			f7_arg0.Frame2:completeAnimation()
			f7_arg0.Frame2:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Frame2 )
		end
	},
	Active = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 2 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 1000 )
					f10_arg0:setAlpha( 1 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.Frame:beginAnimation( 4000 )
				f8_arg0.Frame:setAlpha( 0.25 )
				f8_arg0.Frame:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.Frame:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.Frame:completeAnimation()
			f8_arg0.Frame:setAlpha( 1 )
			f8_local0( f8_arg0.Frame )
			local f8_local1 = function ( f11_arg0 )
				local f11_local0 = function ( f12_arg0 )
					f12_arg0:beginAnimation( 1000 )
					f12_arg0:setAlpha( 0.75 )
					f12_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.Frame2:beginAnimation( 4000 )
				f8_arg0.Frame2:setAlpha( 0.25 )
				f8_arg0.Frame2:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.Frame2:registerEventHandler( "transition_complete_keyframe", f11_local0 )
			end
			
			f8_arg0.Frame2:completeAnimation()
			f8_arg0.Frame2:setAlpha( 0.75 )
			f8_local1( f8_arg0.Frame2 )
			f8_arg0.nextClip = "DefaultClip"
		end
	},
	Inactive = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 2 )
			f13_arg0.Frame:completeAnimation()
			f13_arg0.Frame:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Frame )
			f13_arg0.Frame2:completeAnimation()
			f13_arg0.Frame2:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.Frame2 )
		end
	}
}
