require( "ui/uieditor/widgets/hud/cp_damagewidget/damagewidgetmp_panelcontainer" )
require( "x64:d84c9d58592525a" )
require( "x64:db001ffcf53ef6c" )

CoD.ZMScr_ListingSm = InheritFrom( LUI.UIElement )
CoD.ZMScr_ListingSm.__defaultWidth = 196
CoD.ZMScr_ListingSm.__defaultHeight = 88
CoD.ZMScr_ListingSm.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZMScr_ListingSm )
	self.id = "ZMScr_ListingSm"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local AllyBGMainBlur = LUI.UIImage.new( 0, 0, 0, 196, 0, 0, 0, 88 )
	AllyBGMainBlur:setImage( RegisterImage( 0xA0DC137E93FBA11 ) )
	AllyBGMainBlur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	AllyBGMainBlur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( AllyBGMainBlur )
	self.AllyBGMainBlur = AllyBGMainBlur
	
	local AllyBGMain = LUI.UIImage.new( 0, 0, 0, 196, 0, 0, 0, 88 )
	AllyBGMain:setImage( RegisterImage( 0x5BBCD252908044D ) )
	self:addElement( AllyBGMain )
	self.AllyBGMain = AllyBGMain
	
	local Panel = CoD.DamageWidgetMP_PanelContainer.new( f1_arg0, f1_arg1, 0, 0, 9.5, 76.5, 0, 0, 10, 77 )
	Panel:setRGB( 0.61, 0.61, 0.61 )
	Panel:setAlpha( 0 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_rft" ) )
	Panel:setShaderVector( 0, 50, 10, 0, 0 )
	Panel:setShaderVector( 1, 100, 100, 0, 0 )
	Panel:setShaderVector( 2, 0.2, 0.04, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Glow = LUI.UIImage.new( 0.06, 0.76, 36, 14, 0, 0, 14, 69 )
	Glow:setAlpha( 0.2 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Glow:linkToElementModel( self, "clientNum", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Glow:setRGB( ZombieClientScoreboardGlowColor( f2_local0 ) )
		end
	end )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Image0 = LUI.UIImage.new( 0, 0, 0, 30, 1, 1, -30, 0 )
	Image0:linkToElementModel( self, "zombieInventoryIcon", true, function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			Image0:setImage( RegisterImage( f3_local0 ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Label3 = LUI.UIText.new( 0, 0, 88, 132, 0, 0, 30, 60 )
	Label3:setTTF( "skorzhen" )
	Label3:setLetterSpacing( 0.5 )
	Label3:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	Label3:linkToElementModel( self, "clientNum", true, function ( model )
		local f4_local0 = model:get()
		if f4_local0 ~= nil then
			Label3:setRGB( ZombieClientScoreboardColor( f4_local0 ) )
		end
	end )
	Label3:linkToElementModel( self, "playerScore", true, function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			Label3:setText( f5_local0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Label3, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	local FixedAspectRatioImage = CoD.ZMScr_Portrait.new( f1_arg0, f1_arg1, 0, 0, -2, 88, 0, 0, 10, 77 )
	FixedAspectRatioImage:setScale( 1.44, 1.44 )
	FixedAspectRatioImage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring_rft" ) )
	FixedAspectRatioImage:setShaderVector( 0, 34, 16, 0, 0 )
	FixedAspectRatioImage:setShaderVector( 1, 65, 100, 0, 0 )
	FixedAspectRatioImage:setShaderVector( 2, 0, 0.04, 0, 0 )
	FixedAspectRatioImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			FixedAspectRatioImage.FixedAspectRatioImage:setImage( RegisterImage( f7_local0 ) )
		end
	end )
	self:addElement( FixedAspectRatioImage )
	self.FixedAspectRatioImage = FixedAspectRatioImage
	
	local TrialsInfo = CoD.ZMScr_TrialsSm.new( f1_arg0, f1_arg1, 0, 0, -5, 81, 0, 0, 56, 98 )
	self:addElement( TrialsInfo )
	self.TrialsInfo = TrialsInfo
	
	self:mergeStateConditions( {
		{
			stateName = "VisibleLarge",
			condition = function ( menu, element, event )
				local f8_local0
				if not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "playerScoreShown", 0 ) then
					f8_local0 = AlwaysFalse()
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not CoD.ModelUtility.IsSelfModelValueEqualTo( element, f1_arg1, "playerScoreShown", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "playerScoreShown", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "playerScoreShown"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZMScr_ListingSm.__resetProperties = function ( f11_arg0 )
	f11_arg0.Panel:completeAnimation()
	f11_arg0.Label3:completeAnimation()
	f11_arg0.Glow:completeAnimation()
	f11_arg0.TrialsInfo:completeAnimation()
	f11_arg0.Image0:completeAnimation()
	f11_arg0.AllyBGMain:completeAnimation()
	f11_arg0.AllyBGMainBlur:completeAnimation()
	f11_arg0.Panel:setLeftRight( 0, 0, 9.5, 76.5 )
	f11_arg0.Panel:setAlpha( 0 )
	f11_arg0.Panel:setScale( 1, 1 )
	f11_arg0.Label3:setLeftRight( 0, 0, 88, 132 )
	f11_arg0.Label3:setTopBottom( 0, 0, 30, 60 )
	f11_arg0.Label3:setAlpha( 1 )
	f11_arg0.Label3:setScale( 1, 1 )
	f11_arg0.Glow:setLeftRight( 0.06, 0.76, 36, 14 )
	f11_arg0.Glow:setTopBottom( 0, 0, 14, 69 )
	f11_arg0.Glow:setAlpha( 0.2 )
	f11_arg0.Glow:setScale( 1, 1 )
	f11_arg0.TrialsInfo:setLeftRight( 0, 0, -5, 81 )
	f11_arg0.TrialsInfo:setTopBottom( 0, 0, 56, 98 )
	f11_arg0.TrialsInfo:setAlpha( 1 )
	f11_arg0.Image0:setAlpha( 1 )
	f11_arg0.Image0:setScale( 1, 1 )
	f11_arg0.AllyBGMain:setAlpha( 1 )
	f11_arg0.AllyBGMainBlur:setAlpha( 1 )
end

CoD.ZMScr_ListingSm.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 7 )
			f12_arg0.AllyBGMainBlur:completeAnimation()
			f12_arg0.AllyBGMainBlur:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.AllyBGMainBlur )
			f12_arg0.AllyBGMain:completeAnimation()
			f12_arg0.AllyBGMain:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.AllyBGMain )
			f12_arg0.Panel:completeAnimation()
			f12_arg0.Panel:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Panel )
			f12_arg0.Glow:completeAnimation()
			f12_arg0.Glow:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Glow )
			f12_arg0.Image0:completeAnimation()
			f12_arg0.Image0:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Image0 )
			f12_arg0.Label3:completeAnimation()
			f12_arg0.Label3:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.Label3 )
			f12_arg0.TrialsInfo:completeAnimation()
			f12_arg0.TrialsInfo:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.TrialsInfo )
		end,
		Visible = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 7 )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.AllyBGMainBlur:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.AllyBGMainBlur:setAlpha( 1 )
				f13_arg0.AllyBGMainBlur:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.AllyBGMainBlur:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.AllyBGMainBlur:completeAnimation()
			f13_arg0.AllyBGMainBlur:setAlpha( 0 )
			f13_local0( f13_arg0.AllyBGMainBlur )
			local f13_local1 = function ( f15_arg0 )
				f13_arg0.AllyBGMain:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.AllyBGMain:setAlpha( 1 )
				f13_arg0.AllyBGMain:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.AllyBGMain:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.AllyBGMain:completeAnimation()
			f13_arg0.AllyBGMain:setAlpha( 0 )
			f13_local1( f13_arg0.AllyBGMain )
			local f13_local2 = function ( f16_arg0 )
				f13_arg0.Panel:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.Panel:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.Panel:completeAnimation()
			f13_arg0.Panel:setAlpha( 0 )
			f13_local2( f13_arg0.Panel )
			local f13_local3 = function ( f17_arg0 )
				f13_arg0.Glow:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.Glow:setAlpha( 0.2 )
				f13_arg0.Glow:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.Glow:completeAnimation()
			f13_arg0.Glow:setAlpha( 0 )
			f13_local3( f13_arg0.Glow )
			local f13_local4 = function ( f18_arg0 )
				f13_arg0.Image0:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.Image0:setAlpha( 1 )
				f13_arg0.Image0:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.Image0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.Image0:completeAnimation()
			f13_arg0.Image0:setAlpha( 0 )
			f13_local4( f13_arg0.Image0 )
			local f13_local5 = function ( f19_arg0 )
				f13_arg0.Label3:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.Label3:setAlpha( 1 )
				f13_arg0.Label3:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.Label3:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.Label3:completeAnimation()
			f13_arg0.Label3:setAlpha( 0 )
			f13_local5( f13_arg0.Label3 )
			local f13_local6 = function ( f20_arg0 )
				f13_arg0.TrialsInfo:beginAnimation( 300, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.TrialsInfo:setAlpha( 1 )
				f13_arg0.TrialsInfo:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.TrialsInfo:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.TrialsInfo:completeAnimation()
			f13_arg0.TrialsInfo:setAlpha( 0 )
			f13_local6( f13_arg0.TrialsInfo )
		end
	},
	VisibleLarge = {
		DefaultClip = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 5 )
			f21_arg0.Panel:completeAnimation()
			f21_arg0.Panel:setLeftRight( 0, 0, 18.5, 85.5 )
			f21_arg0.Panel:setScale( 1.25, 1.25 )
			f21_arg0.clipFinished( f21_arg0.Panel )
			f21_arg0.Glow:completeAnimation()
			f21_arg0.Glow:setLeftRight( 0, 1, 74, 52 )
			f21_arg0.Glow:setTopBottom( 0, 0, 16, 68 )
			f21_arg0.Glow:setScale( 1.25, 1.25 )
			f21_arg0.clipFinished( f21_arg0.Glow )
			f21_arg0.Image0:completeAnimation()
			f21_arg0.Image0:setScale( 1.25, 1.25 )
			f21_arg0.clipFinished( f21_arg0.Image0 )
			f21_arg0.Label3:completeAnimation()
			f21_arg0.Label3:setLeftRight( 0, 0, 90, 134 )
			f21_arg0.Label3:setTopBottom( 0, 0, 23, 67 )
			f21_arg0.Label3:setScale( 1, 1 )
			f21_arg0.clipFinished( f21_arg0.Label3 )
			f21_arg0.TrialsInfo:completeAnimation()
			f21_arg0.TrialsInfo:setLeftRight( 0, 0, 153.5, 239.5 )
			f21_arg0.TrialsInfo:setTopBottom( 0, 0, -8.5, 33.5 )
			f21_arg0.clipFinished( f21_arg0.TrialsInfo )
		end,
		DefaultState = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 4 )
			local f22_local0 = function ( f23_arg0 )
				f22_arg0.AllyBGMain:beginAnimation( 200 )
				f22_arg0.AllyBGMain:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.AllyBGMain:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.AllyBGMain:completeAnimation()
			f22_arg0.AllyBGMain:setAlpha( 1 )
			f22_local0( f22_arg0.AllyBGMain )
			local f22_local1 = function ( f24_arg0 )
				f22_arg0.Panel:beginAnimation( 200 )
				f22_arg0.Panel:setAlpha( 0 )
				f22_arg0.Panel:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.Panel:completeAnimation()
			f22_arg0.Panel:setAlpha( 1 )
			f22_local1( f22_arg0.Panel )
			local f22_local2 = function ( f25_arg0 )
				f22_arg0.Glow:beginAnimation( 200 )
				f22_arg0.Glow:setAlpha( 0 )
				f22_arg0.Glow:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.Glow:completeAnimation()
			f22_arg0.Glow:setAlpha( 0.2 )
			f22_local2( f22_arg0.Glow )
			local f22_local3 = function ( f26_arg0 )
				f22_arg0.Label3:beginAnimation( 200 )
				f22_arg0.Label3:setAlpha( 0 )
				f22_arg0.Label3:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.Label3:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.Label3:completeAnimation()
			f22_arg0.Label3:setAlpha( 1 )
			f22_local3( f22_arg0.Label3 )
		end
	},
	Visible = {
		DefaultClip = function ( f27_arg0, f27_arg1 )
			f27_arg0:__resetProperties()
			f27_arg0:setupElementClipCounter( 0 )
		end,
		DefaultState = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 7 )
			local f28_local0 = function ( f29_arg0 )
				f28_arg0.AllyBGMainBlur:beginAnimation( 200 )
				f28_arg0.AllyBGMainBlur:setAlpha( 0 )
				f28_arg0.AllyBGMainBlur:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.AllyBGMainBlur:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.AllyBGMainBlur:completeAnimation()
			f28_arg0.AllyBGMainBlur:setAlpha( 1 )
			f28_local0( f28_arg0.AllyBGMainBlur )
			local f28_local1 = function ( f30_arg0 )
				f28_arg0.AllyBGMain:beginAnimation( 200 )
				f28_arg0.AllyBGMain:setAlpha( 0 )
				f28_arg0.AllyBGMain:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.AllyBGMain:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.AllyBGMain:completeAnimation()
			f28_arg0.AllyBGMain:setAlpha( 1 )
			f28_local1( f28_arg0.AllyBGMain )
			local f28_local2 = function ( f31_arg0 )
				f28_arg0.Panel:beginAnimation( 200 )
				f28_arg0.Panel:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.Panel:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.Panel:completeAnimation()
			f28_arg0.Panel:setAlpha( 0 )
			f28_local2( f28_arg0.Panel )
			local f28_local3 = function ( f32_arg0 )
				f28_arg0.Glow:beginAnimation( 200 )
				f28_arg0.Glow:setAlpha( 0 )
				f28_arg0.Glow:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.Glow:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.Glow:completeAnimation()
			f28_arg0.Glow:setAlpha( 0.2 )
			f28_local3( f28_arg0.Glow )
			local f28_local4 = function ( f33_arg0 )
				f28_arg0.Image0:beginAnimation( 200 )
				f28_arg0.Image0:setAlpha( 0 )
				f28_arg0.Image0:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.Image0:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.Image0:completeAnimation()
			f28_arg0.Image0:setAlpha( 1 )
			f28_local4( f28_arg0.Image0 )
			local f28_local5 = function ( f34_arg0 )
				f28_arg0.Label3:beginAnimation( 200 )
				f28_arg0.Label3:setAlpha( 0 )
				f28_arg0.Label3:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.Label3:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.Label3:completeAnimation()
			f28_arg0.Label3:setAlpha( 1 )
			f28_local5( f28_arg0.Label3 )
			local f28_local6 = function ( f35_arg0 )
				f28_arg0.TrialsInfo:beginAnimation( 200 )
				f28_arg0.TrialsInfo:setAlpha( 0 )
				f28_arg0.TrialsInfo:registerEventHandler( "interrupted_keyframe", f28_arg0.clipInterrupted )
				f28_arg0.TrialsInfo:registerEventHandler( "transition_complete_keyframe", f28_arg0.clipFinished )
			end
			
			f28_arg0.TrialsInfo:completeAnimation()
			f28_arg0.TrialsInfo:setAlpha( 1 )
			f28_local6( f28_arg0.TrialsInfo )
		end
	}
}
CoD.ZMScr_ListingSm.__onClose = function ( f36_arg0 )
	f36_arg0.Panel:close()
	f36_arg0.Glow:close()
	f36_arg0.Image0:close()
	f36_arg0.Label3:close()
	f36_arg0.FixedAspectRatioImage:close()
	f36_arg0.TrialsInfo:close()
end

