CoD.AmmoWidget_EquipmentEmpty = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_EquipmentEmpty.__defaultWidth = 64
CoD.AmmoWidget_EquipmentEmpty.__defaultHeight = 59
CoD.AmmoWidget_EquipmentEmpty.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitControllerModelIfNotSet( f1_arg1, "hudItems.hawkActive", 0 )
	self:setClass( CoD.AmmoWidget_EquipmentEmpty )
	self.id = "AmmoWidget_EquipmentEmpty"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ImgIcon = LUI.UIImage.new( 0.5, 0.5, -40, 40, 0.5, 0.5, -40, 40 )
	ImgIcon:setRGB( 1, 0, 0 )
	ImgIcon:setAlpha( 0 )
	ImgIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImgIcon:linkToElementModel( self, "image", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ImgIcon:setImage( RegisterImage( f2_local0 ) )
		end
	end )
	self:addElement( ImgIcon )
	self.ImgIcon = ImgIcon
	
	local ImgIconGrow = LUI.UIImage.new( 0.5, 0.5, -40, 40, 0.5, 0.5, -41, 39 )
	ImgIconGrow:setRGB( 1, 0, 0 )
	ImgIconGrow:setAlpha( 0 )
	ImgIconGrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImgIconGrow:linkToElementModel( self, "image", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			ImgIconGrow:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	self:addElement( ImgIconGrow )
	self.ImgIconGrow = ImgIconGrow
	
	local Inactive = LUI.UIImage.new( 0.5, 0.5, -26, 26, 0.5, 0.5, -28, 24 )
	Inactive:setRGB( 0.88, 0.07, 0.07 )
	Inactive:setAlpha( 0 )
	Inactive:setScale( 1.4, 1.4 )
	Inactive:setImage( RegisterImage( "uie_ui_hud_core_equipment_widget_unavailable" ) )
	Inactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	Inactive:setShaderVector( 0, 45.84, 4, 0, 0 )
	Inactive:setShaderVector( 1, 100, 100, 0, 0 )
	Inactive:setShaderVector( 2, 0.2, 0.2, 0, 0 )
	self:addElement( Inactive )
	self.Inactive = Inactive
	
	self:mergeStateConditions( {
		{
			stateName = "IconHidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsModelValueGreaterThan( f1_arg1, "hudItems.hawkActive", 0 )
			end
		}
	} )
	local f1_local4 = self
	local f1_local5 = self.subscribeToModel
	local f1_local6 = Engine.GetModelForController( f1_arg1 )
	f1_local5( f1_local4, f1_local6["hudItems.hawkActive"], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "hudItems.hawkActive"
		} )
	end, false )
	self:linkToElementModel( self, "pulseEmpty", true, function ( model )
		local f7_local0 = self
		PlayClip( self, "Empty", f1_arg1 )
	end )
	self:subscribeToGlobalModel( f1_arg1, "PerController", "HUDItems.pulseNoTactical", function ( model )
		local f8_local0 = self
		if IsSelfPropertyValue( self, "show_empty_health_flash", true ) then
			PlayClip( self, "Empty", f1_arg1 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidget_EquipmentEmpty.__resetProperties = function ( f9_arg0 )
	f9_arg0.ImgIconGrow:completeAnimation()
	f9_arg0.ImgIcon:completeAnimation()
	f9_arg0.Inactive:completeAnimation()
	f9_arg0.ImgIconGrow:setLeftRight( 0.5, 0.5, -40, 40 )
	f9_arg0.ImgIconGrow:setTopBottom( 0.5, 0.5, -41, 39 )
	f9_arg0.ImgIconGrow:setAlpha( 0 )
	f9_arg0.ImgIconGrow:setScale( 1, 1 )
	f9_arg0.ImgIcon:setLeftRight( 0.5, 0.5, -40, 40 )
	f9_arg0.ImgIcon:setTopBottom( 0.5, 0.5, -40, 40 )
	f9_arg0.ImgIcon:setAlpha( 0 )
	f9_arg0.Inactive:setAlpha( 0 )
end

CoD.AmmoWidget_EquipmentEmpty.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 3 )
			f10_arg0.ImgIcon:completeAnimation()
			f10_arg0.ImgIcon:setLeftRight( 0.5, 0.5, -20, 19 )
			f10_arg0.ImgIcon:setTopBottom( 0.5, 0.5, -20, 19 )
			f10_arg0.ImgIcon:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.ImgIcon )
			f10_arg0.ImgIconGrow:completeAnimation()
			f10_arg0.ImgIconGrow:setLeftRight( 0.5, 0.5, -20, 19 )
			f10_arg0.ImgIconGrow:setTopBottom( 0.5, 0.5, -20, 19 )
			f10_arg0.ImgIconGrow:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.ImgIconGrow )
			f10_arg0.Inactive:completeAnimation()
			f10_arg0.Inactive:setAlpha( 0 )
			f10_arg0.clipFinished( f10_arg0.Inactive )
		end,
		Empty = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 3 )
			local f11_local0 = function ( f12_arg0 )
				f11_arg0.ImgIcon:beginAnimation( 350 )
				f11_arg0.ImgIcon:setAlpha( 0 )
				f11_arg0.ImgIcon:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.ImgIcon:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
			end
			
			f11_arg0.ImgIcon:completeAnimation()
			f11_arg0.ImgIcon:setAlpha( 0.5 )
			f11_local0( f11_arg0.ImgIcon )
			local f11_local1 = function ( f13_arg0 )
				f11_arg0.ImgIconGrow:beginAnimation( 350 )
				f11_arg0.ImgIconGrow:setAlpha( 0 )
				f11_arg0.ImgIconGrow:setScale( 1.5, 1.5 )
				f11_arg0.ImgIconGrow:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.ImgIconGrow:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
			end
			
			f11_arg0.ImgIconGrow:completeAnimation()
			f11_arg0.ImgIconGrow:setAlpha( 0.25 )
			f11_arg0.ImgIconGrow:setScale( 1, 1 )
			f11_local1( f11_arg0.ImgIconGrow )
			local f11_local2 = function ( f14_arg0 )
				local f14_local0 = function ( f15_arg0 )
					local f15_local0 = function ( f16_arg0 )
						local f16_local0 = function ( f17_arg0 )
							local f17_local0 = function ( f18_arg0 )
								local f18_local0 = function ( f19_arg0 )
									local f19_local0 = function ( f20_arg0 )
										local f20_local0 = function ( f21_arg0 )
											local f21_local0 = function ( f22_arg0 )
												local f22_local0 = function ( f23_arg0 )
													f23_arg0:beginAnimation( 210 )
													f23_arg0:setAlpha( 0 )
													f23_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
												end
												
												f22_arg0:beginAnimation( 10 )
												f22_arg0:setAlpha( 0.76 )
												f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
											end
											
											f21_arg0:beginAnimation( 19 )
											f21_arg0:setAlpha( 0.5 )
											f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
										end
										
										f20_arg0:beginAnimation( 9 )
										f20_arg0:setAlpha( 0.51 )
										f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
									end
									
									f19_arg0:beginAnimation( 30 )
									f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
								end
								
								f18_arg0:beginAnimation( 10 )
								f18_arg0:setAlpha( 0.75 )
								f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
							end
							
							f17_arg0:beginAnimation( 20 )
							f17_arg0:setAlpha( 0.11 )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
						
						f16_arg0:beginAnimation( 10 )
						f16_arg0:setAlpha( 0 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
					
					f15_arg0:beginAnimation( 20 )
					f15_arg0:setAlpha( 0.71 )
					f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
				end
				
				f11_arg0.Inactive:beginAnimation( 10 )
				f11_arg0.Inactive:setAlpha( 0.75 )
				f11_arg0.Inactive:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.Inactive:registerEventHandler( "transition_complete_keyframe", f14_local0 )
			end
			
			f11_arg0.Inactive:completeAnimation()
			f11_arg0.Inactive:setAlpha( 0 )
			f11_local2( f11_arg0.Inactive )
		end
	},
	IconHidden = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 3 )
			f24_arg0.ImgIcon:completeAnimation()
			f24_arg0.ImgIcon:setLeftRight( 0.5, 0.5, -20, 19 )
			f24_arg0.ImgIcon:setTopBottom( 0.5, 0.5, -20, 19 )
			f24_arg0.ImgIcon:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.ImgIcon )
			f24_arg0.ImgIconGrow:completeAnimation()
			f24_arg0.ImgIconGrow:setLeftRight( 0.5, 0.5, -20, 19 )
			f24_arg0.ImgIconGrow:setTopBottom( 0.5, 0.5, -20, 19 )
			f24_arg0.ImgIconGrow:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.ImgIconGrow )
			f24_arg0.Inactive:completeAnimation()
			f24_arg0.Inactive:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.Inactive )
		end,
		Empty = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties()
			f25_arg0:setupElementClipCounter( 3 )
			f25_arg0.ImgIcon:completeAnimation()
			f25_arg0.ImgIcon:setAlpha( 0 )
			f25_arg0.clipFinished( f25_arg0.ImgIcon )
			f25_arg0.ImgIconGrow:completeAnimation()
			f25_arg0.ImgIconGrow:setAlpha( 0 )
			f25_arg0.ImgIconGrow:setScale( 1, 1 )
			f25_arg0.clipFinished( f25_arg0.ImgIconGrow )
			local f25_local0 = function ( f26_arg0 )
				local f26_local0 = function ( f27_arg0 )
					local f27_local0 = function ( f28_arg0 )
						local f28_local0 = function ( f29_arg0 )
							local f29_local0 = function ( f30_arg0 )
								local f30_local0 = function ( f31_arg0 )
									local f31_local0 = function ( f32_arg0 )
										local f32_local0 = function ( f33_arg0 )
											local f33_local0 = function ( f34_arg0 )
												local f34_local0 = function ( f35_arg0 )
													f35_arg0:beginAnimation( 210 )
													f35_arg0:setAlpha( 0 )
													f35_arg0:registerEventHandler( "transition_complete_keyframe", f25_arg0.clipFinished )
												end
												
												f34_arg0:beginAnimation( 10 )
												f34_arg0:setAlpha( 0.76 )
												f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
											end
											
											f33_arg0:beginAnimation( 19 )
											f33_arg0:setAlpha( 0.5 )
											f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
										end
										
										f32_arg0:beginAnimation( 9 )
										f32_arg0:setAlpha( 0.51 )
										f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
									end
									
									f31_arg0:beginAnimation( 30 )
									f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
								end
								
								f30_arg0:beginAnimation( 10 )
								f30_arg0:setAlpha( 0.75 )
								f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
							end
							
							f29_arg0:beginAnimation( 20 )
							f29_arg0:setAlpha( 0.11 )
							f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
						end
						
						f28_arg0:beginAnimation( 10 )
						f28_arg0:setAlpha( 0 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
					
					f27_arg0:beginAnimation( 20 )
					f27_arg0:setAlpha( 0.71 )
					f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
				end
				
				f25_arg0.Inactive:beginAnimation( 10 )
				f25_arg0.Inactive:setAlpha( 0.75 )
				f25_arg0.Inactive:registerEventHandler( "interrupted_keyframe", f25_arg0.clipInterrupted )
				f25_arg0.Inactive:registerEventHandler( "transition_complete_keyframe", f26_local0 )
			end
			
			f25_arg0.Inactive:completeAnimation()
			f25_arg0.Inactive:setAlpha( 0 )
			f25_local0( f25_arg0.Inactive )
		end
	},
	Invisible = {
		DefaultClip = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.AmmoWidget_EquipmentEmpty.__onClose = function ( f37_arg0 )
	f37_arg0.ImgIcon:close()
	f37_arg0.ImgIconGrow:close()
end

