CoD.AmmoWidgetMP_EquipmentLethal_Flash = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_EquipmentLethal_Flash.__defaultWidth = 68
CoD.AmmoWidgetMP_EquipmentLethal_Flash.__defaultHeight = 59
CoD.AmmoWidgetMP_EquipmentLethal_Flash.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetMP_EquipmentLethal_Flash )
	self.id = "AmmoWidgetMP_EquipmentLethal_Flash"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Line = LUI.UIImage.new( 0, 0, 1.5, 105.5, 0, 0, 47, 44 )
	Line:setAlpha( 0 )
	self:addElement( Line )
	self.Line = Line
	
	local Backing = LUI.UIImage.new( 0, 0, -16.5, 82.5, 0, 0, -14, 71 )
	Backing:setRGB( ColorSet.T8__BIEGE.r, ColorSet.T8__BIEGE.g, ColorSet.T8__BIEGE.b )
	Backing:setAlpha( 0 )
	Backing:setZRot( 180 )
	Backing:setImage( RegisterImage( 0x16FB6BFD381E066 ) )
	Backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local scanline = LUI.UIImage.new( 0, 0, 12, 104, 0, 0, 20, 48 )
	scanline:setRGB( ColorSet.T8__OCHRE.r, ColorSet.T8__OCHRE.g, ColorSet.T8__OCHRE.b )
	scanline:setAlpha( 0 )
	scanline:setImage( RegisterImage( "uie_hud_common_core_ammo_scanline" ) )
	scanline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( scanline )
	self.scanline = scanline
	
	local BackingMask = LUI.UIImage.new( 0, 0, -6, 114, 0, 0, -12, 59 )
	BackingMask:setAlpha( 0 )
	BackingMask:setZRot( 180 )
	BackingMask:setImage( RegisterImage( 0x1FCB877898B072F ) )
	self:addElement( BackingMask )
	self.BackingMask = BackingMask
	
	local black2 = LUI.UIImage.new( 0, 0, -29, 97, 0, 0, 52, 94 )
	black2:setRGB( 0, 0, 0 )
	self:addElement( black2 )
	self.black2 = black2
	
	local black = LUI.UIImage.new( 0.5, 0.5, -63, 63, 0, 0, -31, 0 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local black4 = LUI.UIImage.new( 0, 0, -29, 0, 0, 0, 0, 66 )
	black4:setRGB( 0, 0, 0 )
	self:addElement( black4 )
	self.black4 = black4
	
	local black3 = LUI.UIImage.new( 0, 0, 68, 97, 0, 0, 0, 66 )
	black3:setRGB( 0, 0, 0 )
	self:addElement( black3 )
	self.black3 = black3
	
	self:mergeStateConditions( {
		{
			stateName = "Full",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueGreaterThanOrEqualTo( self, f1_arg1, "powerRatio", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "powerRatio", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "powerRatio"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetMP_EquipmentLethal_Flash.__resetProperties = function ( f4_arg0 )
	f4_arg0.Line:completeAnimation()
	f4_arg0.Backing:completeAnimation()
	f4_arg0.scanline:completeAnimation()
	f4_arg0.Line:setLeftRight( 0, 0, 1.5, 105.5 )
	f4_arg0.Line:setTopBottom( 0, 0, 47, 44 )
	f4_arg0.Line:setAlpha( 0 )
	f4_arg0.Backing:setLeftRight( 0, 0, -16.5, 82.5 )
	f4_arg0.Backing:setTopBottom( 0, 0, -14, 71 )
	f4_arg0.Backing:setAlpha( 0 )
	f4_arg0.scanline:setLeftRight( 0, 0, 12, 104 )
	f4_arg0.scanline:setTopBottom( 0, 0, 20, 48 )
	f4_arg0.scanline:setAlpha( 0 )
end

CoD.AmmoWidgetMP_EquipmentLethal_Flash.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 3 )
			f5_arg0.Line:completeAnimation()
			f5_arg0.Line:setLeftRight( 0, 0, 1.5, 105.5 )
			f5_arg0.Line:setTopBottom( 0, 0, 47, 44 )
			f5_arg0.Line:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.Line )
			local f5_local0 = function ( f6_arg0 )
				local f6_local0 = function ( f7_arg0 )
					local f7_local0 = function ( f8_arg0 )
						f8_arg0:beginAnimation( 720 )
						f8_arg0:setAlpha( 0 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
					end
					
					f7_arg0:beginAnimation( 40 )
					f7_arg0:setAlpha( 0.62 )
					f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
				end
				
				f5_arg0.Backing:beginAnimation( 710 )
				f5_arg0.Backing:setTopBottom( 0, 0, -14, 78 )
				f5_arg0.Backing:setAlpha( 0.59 )
				f5_arg0.Backing:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.Backing:registerEventHandler( "transition_complete_keyframe", f6_local0 )
			end
			
			f5_arg0.Backing:completeAnimation()
			f5_arg0.Backing:setLeftRight( 0, 0, -16.5, 84.5 )
			f5_arg0.Backing:setTopBottom( 0, 0, -14, 71 )
			f5_arg0.Backing:setAlpha( 0 )
			f5_local0( f5_arg0.Backing )
			local f5_local1 = function ( f9_arg0 )
				f5_arg0.scanline:beginAnimation( 1470 )
				f5_arg0.scanline:setTopBottom( 0, 0, -12, 12 )
				f5_arg0.scanline:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.scanline:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
			end
			
			f5_arg0.scanline:completeAnimation()
			f5_arg0.scanline:setLeftRight( 0, 0, -3, 97 )
			f5_arg0.scanline:setTopBottom( 0, 0, 47, 71 )
			f5_arg0.scanline:setAlpha( 1 )
			f5_local1( f5_arg0.scanline )
			f5_arg0.nextClip = "DefaultClip"
		end,
		Full = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.Backing:completeAnimation()
			f10_arg0.Backing:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.Backing )
		end
	},
	Full = {
		DefaultClip = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			f11_arg0.Backing:completeAnimation()
			f11_arg0.Backing:setAlpha( 0 )
			f11_arg0.clipFinished( f11_arg0.Backing )
		end
	}
}
