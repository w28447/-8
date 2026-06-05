CoD.ZmNorif_backLines02rotation = InheritFrom( LUI.UIElement )
CoD.ZmNorif_backLines02rotation.__defaultWidth = 600
CoD.ZmNorif_backLines02rotation.__defaultHeight = 600
CoD.ZmNorif_backLines02rotation.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmNorif_backLines02rotation )
	self.id = "ZmNorif_backLines02rotation"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local backlines02 = LUI.UIImage.new( 0, 0, 0, 600, 0, 0, 0, 600 )
	backlines02:setScale( 0.9, 0.9 )
	backlines02:setImage( RegisterImage( 0x8E0327E27C65155 ) )
	self:addElement( backlines02 )
	self.backlines02 = backlines02
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f1_arg1, "ztrials" ) and not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.gameState", 0 )
			end
		}
	} )
	local f1_local2 = self
	local f1_local3 = self.subscribeToModel
	local f1_local4 = Engine.GetGlobalModel()
	f1_local3( f1_local2, f1_local4["ZMHudGlobal.trials.gameState"], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "ZMHudGlobal.trials.gameState"
		} )
	end, false )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmNorif_backLines02rotation.__resetProperties = function ( f4_arg0 )
	f4_arg0.backlines02:completeAnimation()
	f4_arg0.backlines02:setAlpha( 1 )
	f4_arg0.backlines02:setZRot( 0 )
	f4_arg0.backlines02:setScale( 0.9, 0.9 )
end

CoD.ZmNorif_backLines02rotation.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			local f5_local0 = function ( f6_arg0 )
				f5_arg0.backlines02:beginAnimation( 10000 )
				f5_arg0.backlines02:setZRot( -180 )
				f5_arg0.backlines02:registerEventHandler( "interrupted_keyframe", f5_arg0.clipInterrupted )
				f5_arg0.backlines02:registerEventHandler( "transition_complete_keyframe", f5_arg0.clipFinished )
			end
			
			f5_arg0.backlines02:completeAnimation()
			f5_arg0.backlines02:setAlpha( 1 )
			f5_arg0.backlines02:setZRot( 0 )
			f5_arg0.backlines02:setScale( 1, 1 )
			f5_local0( f5_arg0.backlines02 )
		end,
		TextandImageBasic = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			local f7_local0 = function ( f8_arg0 )
				local f8_local0 = function ( f9_arg0 )
					local f9_local0 = function ( f10_arg0 )
						local f10_local0 = function ( f11_arg0 )
							local f11_local0 = function ( f12_arg0 )
								f12_arg0:beginAnimation( 99 )
								f12_arg0:setAlpha( 0 )
								f12_arg0:setZRot( -60 )
								f12_arg0:setScale( 0.8, 0.8 )
								f12_arg0:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
							end
							
							f11_arg0:beginAnimation( 199 )
							f11_arg0:setZRot( -59 )
							f11_arg0:setScale( 0.87, 0.87 )
							f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
						end
						
						f10_arg0:beginAnimation( 3600 )
						f10_arg0:setZRot( -56 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
					
					f9_arg0:beginAnimation( 200 )
					f9_arg0:setZRot( -4 )
					f9_arg0:setScale( 1, 1 )
					f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
				end
				
				f7_arg0.backlines02:beginAnimation( 100 )
				f7_arg0.backlines02:setAlpha( 0.3 )
				f7_arg0.backlines02:setZRot( -1 )
				f7_arg0.backlines02:setScale( 0.93, 0.93 )
				f7_arg0.backlines02:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
				f7_arg0.backlines02:registerEventHandler( "transition_complete_keyframe", f8_local0 )
			end
			
			f7_arg0.backlines02:completeAnimation()
			f7_arg0.backlines02:setAlpha( 0 )
			f7_arg0.backlines02:setZRot( 0 )
			f7_arg0.backlines02:setScale( 0.9, 0.9 )
			f7_local0( f7_arg0.backlines02 )
		end
	},
	Hidden = {
		DefaultClip = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 0 )
		end
	}
}
