require( "x64:c2532db44a9b006" )
require( "x64:cac6bab78ef7b" )
require( "x64:e9c537d31e40b78" )
require( "x64:34928bbeeb66807" )

CoD.ZmNotifbasic = InheritFrom( LUI.UIElement )
CoD.ZmNotifbasic.__defaultWidth = 600
CoD.ZmNotifbasic.__defaultHeight = 600
CoD.ZmNotifbasic.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmNotifbasic )
	self.id = "ZmNotifbasic"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local backlines02 = CoD.ZmNorif_backLines02rotation.new( f1_arg0, f1_arg1, 0, 0, 0, 600, 0, 0, 0, 600 )
	backlines02:setAlpha( 0 )
	backlines02:setScale( 0.9, 0.9 )
	self:addElement( backlines02 )
	self.backlines02 = backlines02
	
	local backlines01 = CoD.ZmNorif_backLines01rotation.new( f1_arg0, f1_arg1, 0, 0, 0, 600, 0, 0, 0, 600 )
	backlines01:setAlpha( 0 )
	backlines01:setScale( 0.9, 0.9 )
	self:addElement( backlines01 )
	self.backlines01 = backlines01
	
	local container = LUI.UIImage.new( 0, 0, 0, 600, 0, 0, 0, 600 )
	container:setAlpha( 0 )
	container:setScale( 0.9, 0.9 )
	container:setImage( RegisterImage( "uie_zm_hud_notification_container" ) )
	self:addElement( container )
	self.container = container
	
	local frontlines02 = CoD.ZmNotif_frontLines02rotation.new( f1_arg0, f1_arg1, 0, 0, 0, 600, 0, 0, 0, 600 )
	frontlines02:setAlpha( 0 )
	frontlines02:setScale( 0.9, 0.9 )
	self:addElement( frontlines02 )
	self.frontlines02 = frontlines02
	
	local innerglow = LUI.UIImage.new( 0, 0, 2.5, 597.5, 0, 0, 2.5, 597.5 )
	innerglow:setAlpha( 0 )
	innerglow:setImage( RegisterImage( "uie_zm_hud_notification_innerglow" ) )
	innerglow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( innerglow )
	self.innerglow = innerglow
	
	local frontlines01 = CoD.ZmNorif_frontLines01rotation.new( f1_arg0, f1_arg1, 0, 0, 0, 600, 0, 0, 0, 600 )
	frontlines01:setAlpha( 0 )
	frontlines01:setScale( 0.9, 0.9 )
	self:addElement( frontlines01 )
	self.frontlines01 = frontlines01
	
	local firework = LUI.UIImage.new( 0, 0, 0, 600, 0, 0, 0, 600 )
	firework:setAlpha( 0 )
	firework:setImage( RegisterImage( "uie_zm_hud_notification_firework" ) )
	self:addElement( firework )
	self.firework = firework
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" ) and not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.gameState", 0 )
			end
		}
	} )
	local f1_local8 = self
	local f1_local9 = self.subscribeToModel
	local f1_local10 = Engine.GetGlobalModel()
	f1_local9( f1_local8, f1_local10["ZMHudGlobal.trials.gameState"], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "ZMHudGlobal.trials.gameState"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmNotifbasic.__resetProperties = function ( f4_arg0 )
	f4_arg0.firework:completeAnimation()
	f4_arg0.container:completeAnimation()
	f4_arg0.backlines01:completeAnimation()
	f4_arg0.backlines02:completeAnimation()
	f4_arg0.innerglow:completeAnimation()
	f4_arg0.frontlines02:completeAnimation()
	f4_arg0.frontlines01:completeAnimation()
	f4_arg0.firework:setAlpha( 0 )
	f4_arg0.firework:setZRot( 0 )
	f4_arg0.container:setAlpha( 0 )
	f4_arg0.container:setScale( 0.9, 0.9 )
	f4_arg0.backlines01:setAlpha( 0 )
	f4_arg0.backlines01:setScale( 0.9, 0.9 )
	f4_arg0.backlines02:setAlpha( 0 )
	f4_arg0.backlines02:setScale( 0.9, 0.9 )
	f4_arg0.innerglow:setAlpha( 0 )
	f4_arg0.frontlines02:setAlpha( 0 )
	f4_arg0.frontlines02:setScale( 0.9, 0.9 )
	f4_arg0.frontlines01:setAlpha( 0 )
	f4_arg0.frontlines01:setScale( 0.9, 0.9 )
end

CoD.ZmNotifbasic.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 0 )
		end,
		TextandImageBasic = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 7 )
			local f6_local0 = function ( f7_arg0 )
				local f7_local0 = function ( f8_arg0 )
					local f8_local0 = function ( f9_arg0 )
						f9_arg0:beginAnimation( 99 )
						f9_arg0:setAlpha( 0 )
						f9_arg0:setScale( 0.9, 0.9 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", function ( element, event )
							element:playClip( "DefaultClip" )
							f6_arg0.clipFinished( element, event )
						end )
					end
					
					f8_arg0:beginAnimation( 3600 )
					f8_arg0:setScale( 1, 1 )
					f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
				end
				
				f7_arg0:playClip( "DefaultClip" )
				f7_arg0:beginAnimation( 360, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f7_arg0:setAlpha( 0.6 )
				f7_arg0:setScale( 0.95, 0.95 )
				f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
			end
			
			f6_arg0.backlines02:beginAnimation( 140 )
			f6_arg0.backlines02:setAlpha( 0 )
			f6_arg0.backlines02:setScale( 0.9, 0.9 )
			f6_arg0.backlines02:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
			f6_arg0.backlines02:registerEventHandler( "transition_complete_keyframe", f6_local0 )
			local f6_local1 = function ( f11_arg0 )
				local f11_local0 = function ( f12_arg0 )
					local f12_local0 = function ( f13_arg0 )
						f13_arg0:beginAnimation( 99 )
						f13_arg0:setAlpha( 0 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", function ( element, event )
							element:playClip( "DefaultClip" )
							f6_arg0.clipFinished( element, event )
						end )
					end
					
					f12_arg0:beginAnimation( 3600 )
					f12_arg0:setScale( 1.1, 1.1 )
					f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
				end
				
				f11_arg0:playClip( "DefaultClip" )
				f11_arg0:beginAnimation( 360, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f11_arg0:setAlpha( 0.6 )
				f11_arg0:setScale( 1, 1 )
				f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
			end
			
			f6_arg0.backlines01:beginAnimation( 140 )
			f6_arg0.backlines01:setAlpha( 0 )
			f6_arg0.backlines01:setScale( 0.9, 0.9 )
			f6_arg0.backlines01:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
			f6_arg0.backlines01:registerEventHandler( "transition_complete_keyframe", f6_local1 )
			local f6_local2 = function ( f15_arg0 )
				local f15_local0 = function ( f16_arg0 )
					local f16_local0 = function ( f17_arg0 )
						f17_arg0:beginAnimation( 99 )
						f17_arg0:setAlpha( 0 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
					end
					
					f16_arg0:beginAnimation( 3800 )
					f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				end
				
				f6_arg0.container:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f6_arg0.container:setAlpha( 1 )
				f6_arg0.container:setScale( 1, 1 )
				f6_arg0.container:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.container:registerEventHandler( "transition_complete_keyframe", f15_local0 )
			end
			
			f6_arg0.container:completeAnimation()
			f6_arg0.container:setAlpha( 0 )
			f6_arg0.container:setScale( 0.9, 0.9 )
			f6_local2( f6_arg0.container )
			local f6_local3 = function ( f18_arg0 )
				local f18_local0 = function ( f19_arg0 )
					local f19_local0 = function ( f20_arg0 )
						f20_arg0:beginAnimation( 99 )
						f20_arg0:setAlpha( 0 )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", function ( element, event )
							element:playClip( "DefaultClip" )
							f6_arg0.clipFinished( element, event )
						end )
					end
					
					f19_arg0:beginAnimation( 3600 )
					f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
				end
				
				f18_arg0:playClip( "DefaultClip" )
				f18_arg0:beginAnimation( 199, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f18_arg0:setAlpha( 1 )
				f18_arg0:setScale( 1, 1 )
				f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
			end
			
			f6_arg0.frontlines02:beginAnimation( 300 )
			f6_arg0.frontlines02:setAlpha( 0 )
			f6_arg0.frontlines02:setScale( 0.9, 0.9 )
			f6_arg0.frontlines02:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
			f6_arg0.frontlines02:registerEventHandler( "transition_complete_keyframe", f6_local3 )
			local f6_local4 = function ( f22_arg0 )
				local f22_local0 = function ( f23_arg0 )
					local f23_local0 = function ( f24_arg0 )
						f24_arg0:beginAnimation( 99 )
						f24_arg0:setAlpha( 0 )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
					end
					
					f23_arg0:beginAnimation( 3600 )
					f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
				end
				
				f22_arg0:beginAnimation( 360 )
				f22_arg0:setAlpha( 1 )
				f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
			end
			
			f6_arg0.innerglow:beginAnimation( 140 )
			f6_arg0.innerglow:setAlpha( 0 )
			f6_arg0.innerglow:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
			f6_arg0.innerglow:registerEventHandler( "transition_complete_keyframe", f6_local4 )
			local f6_local5 = function ( f25_arg0 )
				local f25_local0 = function ( f26_arg0 )
					local f26_local0 = function ( f27_arg0 )
						f27_arg0:beginAnimation( 99 )
						f27_arg0:setAlpha( 0 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", function ( element, event )
							element:playClip( "DefaultClip" )
							f6_arg0.clipFinished( element, event )
						end )
					end
					
					f26_arg0:beginAnimation( 3600 )
					f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
				end
				
				f25_arg0:playClip( "DefaultClip" )
				f25_arg0:beginAnimation( 199, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f25_arg0:setAlpha( 1 )
				f25_arg0:setScale( 1, 1 )
				f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
			end
			
			f6_arg0.frontlines01:beginAnimation( 300 )
			f6_arg0.frontlines01:setAlpha( 0 )
			f6_arg0.frontlines01:setScale( 0.9, 0.9 )
			f6_arg0.frontlines01:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
			f6_arg0.frontlines01:registerEventHandler( "transition_complete_keyframe", f6_local5 )
			local f6_local6 = function ( f29_arg0 )
				local f29_local0 = function ( f30_arg0 )
					local f30_local0 = function ( f31_arg0 )
						f31_arg0:beginAnimation( 99 )
						f31_arg0:setAlpha( 0 )
						f31_arg0:setZRot( -360 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
					end
					
					f30_arg0:beginAnimation( 700 )
					f30_arg0:setZRot( -320 )
					f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
				end
				
				f6_arg0.firework:beginAnimation( 100 )
				f6_arg0.firework:setAlpha( 1 )
				f6_arg0.firework:setZRot( -40 )
				f6_arg0.firework:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.firework:registerEventHandler( "transition_complete_keyframe", f29_local0 )
			end
			
			f6_arg0.firework:completeAnimation()
			f6_arg0.firework:setAlpha( 0 )
			f6_arg0.firework:setZRot( 0 )
			f6_local6( f6_arg0.firework )
		end
	},
	Hidden = {
		DefaultClip = function ( f32_arg0, f32_arg1 )
			f32_arg0:__resetProperties()
			f32_arg0:setupElementClipCounter( 0 )
		end
	}
}
CoD.ZmNotifbasic.__onClose = function ( f33_arg0 )
	f33_arg0.backlines02:close()
	f33_arg0.backlines01:close()
	f33_arg0.frontlines02:close()
	f33_arg0.frontlines01:close()
end

