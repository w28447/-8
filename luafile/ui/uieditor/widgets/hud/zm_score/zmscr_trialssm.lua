require( "ui/uieditor/widgets/hud/zm_fx/zmfx_spark2ext" )

CoD.ZMScr_TrialsSm = InheritFrom( LUI.UIElement )
CoD.ZMScr_TrialsSm.__defaultWidth = 86
CoD.ZMScr_TrialsSm.__defaultHeight = 42
CoD.ZMScr_TrialsSm.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScr_TrialsSm )
	self.id = "ZMScr_TrialsSm"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local CheckBox2 = LUI.UIImage.new( 0, 0, 3, 33, 0, 0, 4, 34 )
	CheckBox2:setImage( RegisterImage( 0x3A6C1FB3B354832 ) )
	self:addElement( CheckBox2 )
	self.CheckBox2 = CheckBox2
	
	local white = LUI.UIImage.new( 0, 0, 2, 38, 0, 0, 0, 36 )
	white:setAlpha( 0 )
	white:setImage( RegisterImage( 0xC7BD74A16D7054B ) )
	self:addElement( white )
	self.white = white
	
	local yellow = LUI.UIImage.new( 0, 0, 2, 38, 0, 0, 0, 36 )
	yellow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	yellow:setAlpha( 0 )
	yellow:setImage( RegisterImage( 0x1E5C0EED08D22D ) )
	yellow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	yellow:setShaderVector( 0, 1, 0, 0, 0 )
	yellow:setShaderVector( 1, 0, 0, 0, 0 )
	yellow:setShaderVector( 2, 1, 0, 0, 0 )
	yellow:setShaderVector( 3, 0, 0, 0, 0 )
	yellow:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( yellow )
	self.yellow = yellow
	
	local glow = LUI.UIImage.new( 0, 0, 2, 38, 0, 0, 0, 36 )
	glow:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	glow:setAlpha( 0 )
	glow:setImage( RegisterImage( 0x1E5C0EED08D22D ) )
	self:addElement( glow )
	self.glow = glow
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( f1_arg0, f1_arg1, 0, 0, 12.5, 63.5, 0, 0, -63, 14 )
	ZmFxSpark2Ext0:setAlpha( 0 )
	ZmFxSpark2Ext0:setZRot( 9 )
	ZmFxSpark2Ext0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local Counter = LUI.UIText.new( 0, 0, 0, 86, 0, 0, 10.5, 31.5 )
	Counter:setText( "" )
	Counter:setTTF( "skorzhen" )
	Counter:setLetterSpacing( 0.5 )
	Counter:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Counter:linkToElementModel( self, "clientNum", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Counter:setRGB( ZombieClientScoreboardColor( f2_local0 ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Counter, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Counter )
	self.Counter = Counter
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMScr_TrialsSm.__resetProperties = function ( f4_arg0 )
	f4_arg0.Counter:completeAnimation()
	f4_arg0.CheckBox2:completeAnimation()
	f4_arg0.ZmFxSpark2Ext0:completeAnimation()
	f4_arg0.white:completeAnimation()
	f4_arg0.glow:completeAnimation()
	f4_arg0.Counter:setAlpha( 1 )
	f4_arg0.CheckBox2:setAlpha( 1 )
	f4_arg0.CheckBox2:setImage( RegisterImage( 0x3A6C1FB3B354832 ) )
	f4_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, 12.5, 63.5 )
	f4_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -63, 14 )
	f4_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
	f4_arg0.white:setAlpha( 0 )
	f4_arg0.glow:setLeftRight( 0, 0, 2, 38 )
	f4_arg0.glow:setAlpha( 0 )
end

CoD.ZMScr_TrialsSm.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 2 )
			f5_arg0.CheckBox2:completeAnimation()
			f5_arg0.CheckBox2:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.CheckBox2 )
			f5_arg0.Counter:completeAnimation()
			f5_arg0.Counter:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.Counter )
		end
	},
	HideForRoundSplash = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 2 )
			f6_arg0.CheckBox2:completeAnimation()
			f6_arg0.CheckBox2:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.CheckBox2 )
			f6_arg0.Counter:completeAnimation()
			f6_arg0.Counter:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.Counter )
		end
	},
	Counter = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 2 )
			f7_arg0.CheckBox2:completeAnimation()
			f7_arg0.CheckBox2:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.CheckBox2 )
			f7_arg0.Counter:completeAnimation()
			f7_arg0.Counter:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.Counter )
		end,
		Checked = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 4 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 550 )
					f10_arg0:setAlpha( 1 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.white:beginAnimation( 900 )
				f8_arg0.white:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.white:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.white:completeAnimation()
			f8_arg0.white:setAlpha( 0 )
			f8_local0( f8_arg0.white )
			local f8_local1 = function ( f11_arg0 )
				local f11_local0 = function ( f12_arg0 )
					local f12_local0 = function ( f13_arg0 )
						local f13_local0 = function ( f14_arg0 )
							f14_arg0:beginAnimation( 380 )
							f14_arg0:setAlpha( 0 )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
						end
						
						f13_arg0:beginAnimation( 239 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
					
					f12_arg0:beginAnimation( 180 )
					f12_arg0:setAlpha( 1 )
					f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
				end
				
				f8_arg0.glow:beginAnimation( 620 )
				f8_arg0.glow:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.glow:registerEventHandler( "transition_complete_keyframe", f11_local0 )
			end
			
			f8_arg0.glow:completeAnimation()
			f8_arg0.glow:setLeftRight( 0, 0, 2, 38 )
			f8_arg0.glow:setAlpha( 0 )
			f8_local1( f8_arg0.glow )
			local f8_local2 = function ( f15_arg0 )
				local f15_local0 = function ( f16_arg0 )
					local f16_local0 = function ( f17_arg0 )
						local f17_local0 = function ( f18_arg0 )
							f18_arg0:beginAnimation( 350 )
							f18_arg0:setAlpha( 0 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
						end
						
						f17_arg0:beginAnimation( 560 )
						f17_arg0:setLeftRight( 0, 0, 12.5, 63.5 )
						f17_arg0:setTopBottom( 0, 0, -64, 13 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
					
					f16_arg0:beginAnimation( 260 )
					f16_arg0:setLeftRight( 0, 0, -5.5, 45.5 )
					f16_arg0:setTopBottom( 0, 0, -44, 33 )
					f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				end
				
				f8_arg0.ZmFxSpark2Ext0:beginAnimation( 280 )
				f8_arg0.ZmFxSpark2Ext0:setAlpha( 1 )
				f8_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
			end
			
			f8_arg0.ZmFxSpark2Ext0:completeAnimation()
			f8_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -13, 38 )
			f8_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -56, 21 )
			f8_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f8_local2( f8_arg0.ZmFxSpark2Ext0 )
			f8_arg0.Counter:completeAnimation()
			f8_arg0.Counter:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Counter )
		end
	},
	Checked = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 3 )
			f19_arg0.CheckBox2:completeAnimation()
			f19_arg0.CheckBox2:setImage( RegisterImage( 0x3A6C1FB3B354832 ) )
			f19_arg0.clipFinished( f19_arg0.CheckBox2 )
			f19_arg0.white:completeAnimation()
			f19_arg0.white:setAlpha( 1 )
			f19_arg0.clipFinished( f19_arg0.white )
			f19_arg0.Counter:completeAnimation()
			f19_arg0.Counter:setAlpha( 0 )
			f19_arg0.clipFinished( f19_arg0.Counter )
		end
	},
	Unchecked = {
		DefaultClip = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 2 )
			f20_arg0.glow:completeAnimation()
			f20_arg0.glow:setLeftRight( 0, 0, 2, 38 )
			f20_arg0.clipFinished( f20_arg0.glow )
			f20_arg0.Counter:completeAnimation()
			f20_arg0.Counter:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Counter )
		end,
		Checked = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 4 )
			local f21_local0 = function ( f22_arg0 )
				local f22_local0 = function ( f23_arg0 )
					f23_arg0:beginAnimation( 550 )
					f23_arg0:setAlpha( 1 )
					f23_arg0:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
				end
				
				f21_arg0.white:beginAnimation( 900 )
				f21_arg0.white:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.white:registerEventHandler( "transition_complete_keyframe", f22_local0 )
			end
			
			f21_arg0.white:completeAnimation()
			f21_arg0.white:setAlpha( 0 )
			f21_local0( f21_arg0.white )
			local f21_local1 = function ( f24_arg0 )
				local f24_local0 = function ( f25_arg0 )
					local f25_local0 = function ( f26_arg0 )
						local f26_local0 = function ( f27_arg0 )
							f27_arg0:beginAnimation( 380 )
							f27_arg0:setAlpha( 0 )
							f27_arg0:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
						end
						
						f26_arg0:beginAnimation( 239 )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
					end
					
					f25_arg0:beginAnimation( 180 )
					f25_arg0:setAlpha( 1 )
					f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
				end
				
				f21_arg0.glow:beginAnimation( 620 )
				f21_arg0.glow:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.glow:registerEventHandler( "transition_complete_keyframe", f24_local0 )
			end
			
			f21_arg0.glow:completeAnimation()
			f21_arg0.glow:setLeftRight( 0, 0, 2, 38 )
			f21_arg0.glow:setAlpha( 0 )
			f21_local1( f21_arg0.glow )
			local f21_local2 = function ( f28_arg0 )
				local f28_local0 = function ( f29_arg0 )
					local f29_local0 = function ( f30_arg0 )
						local f30_local0 = function ( f31_arg0 )
							f31_arg0:beginAnimation( 350 )
							f31_arg0:setAlpha( 0 )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f21_arg0.clipFinished )
						end
						
						f30_arg0:beginAnimation( 560 )
						f30_arg0:setLeftRight( 0, 0, 12.5, 63.5 )
						f30_arg0:setTopBottom( 0, 0, -64, 13 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
					
					f29_arg0:beginAnimation( 260 )
					f29_arg0:setLeftRight( 0, 0, -5.5, 45.5 )
					f29_arg0:setTopBottom( 0, 0, -44, 33 )
					f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
				end
				
				f21_arg0.ZmFxSpark2Ext0:beginAnimation( 280 )
				f21_arg0.ZmFxSpark2Ext0:setAlpha( 1 )
				f21_arg0.ZmFxSpark2Ext0:registerEventHandler( "interrupted_keyframe", f21_arg0.clipInterrupted )
				f21_arg0.ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
			end
			
			f21_arg0.ZmFxSpark2Ext0:completeAnimation()
			f21_arg0.ZmFxSpark2Ext0:setLeftRight( 0, 0, -13, 38 )
			f21_arg0.ZmFxSpark2Ext0:setTopBottom( 0, 0, -56, 21 )
			f21_arg0.ZmFxSpark2Ext0:setAlpha( 0 )
			f21_local2( f21_arg0.ZmFxSpark2Ext0 )
			f21_arg0.Counter:completeAnimation()
			f21_arg0.Counter:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.Counter )
		end
	}
}
CoD.ZMScr_TrialsSm.__onClose = function ( f32_arg0 )
	f32_arg0.ZmFxSpark2Ext0:close()
	f32_arg0.Counter:close()
end

