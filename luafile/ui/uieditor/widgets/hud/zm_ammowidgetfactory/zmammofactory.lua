require( "ui/uieditor/widgets/hud/zm_ammowidgetfactory/zmammo_propfactory" )

CoD.ZmAmmoFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmoFactory.__defaultWidth = 645
CoD.ZmAmmoFactory.__defaultHeight = 370
CoD.ZmAmmoFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmoFactory )
	self.id = "ZmAmmoFactory"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ZmAmmoProp0 = CoD.ZmAmmo_PropFactory.new( f1_arg0, f1_arg1, 0, 0, 243, 593, 0, 0, 93, 309 )
	self:addElement( ZmAmmoProp0 )
	self.ZmAmmoProp0 = ZmAmmoProp0
	
	self:mergeStateConditions( {
		{
			stateName = "HudStart_NoReservePC",
			condition = function ( menu, element, event )
				return IsPC() and AlwaysFalse()
			end
		},
		{
			stateName = "HudStartPC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		},
		{
			stateName = "HudStart_NoReserve",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmoFactory.__resetProperties = function ( f6_arg0 )
	f6_arg0.ZmAmmoProp0:completeAnimation()
	f6_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 243, 593 )
	f6_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
	f6_arg0.ZmAmmoProp0:setRGB( 1, 1, 1 )
	f6_arg0.ZmAmmoProp0:setAlpha( 1 )
	f6_arg0.ZmAmmoProp0:setZoom( 0 )
end

CoD.ZmAmmoFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.ZmAmmoProp0:completeAnimation()
			f7_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f7_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f7_arg0.ZmAmmoProp0:setRGB( 0.65, 0.53, 0.43 )
			f7_arg0.ZmAmmoProp0:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.ZmAmmoProp0 )
		end,
		HudStart = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 1 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 640, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f10_arg0:setLeftRight( 0, 0, 247, 597 )
					f10_arg0:setTopBottom( 0, 0, 93, 309 )
					f10_arg0:setRGB( 1, 1, 1 )
					f10_arg0:setAlpha( 1 )
					f10_arg0:setZoom( 0 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.ZmAmmoProp0:beginAnimation( 80 )
				f8_arg0.ZmAmmoProp0:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.ZmAmmoProp0:completeAnimation()
			f8_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 295, 645 )
			f8_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 68, 284 )
			f8_arg0.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
			f8_arg0.ZmAmmoProp0:setAlpha( 0 )
			f8_arg0.ZmAmmoProp0:setZoom( -46 )
			f8_local0( f8_arg0.ZmAmmoProp0 )
		end,
		HudStart_NoReserve = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties()
			f11_arg0:setupElementClipCounter( 1 )
			local f11_local0 = function ( f12_arg0 )
				local f12_local0 = function ( f13_arg0 )
					f13_arg0:beginAnimation( 640, Enum[0xF50FFF429AB1890][0x6F6186B702830BC] )
					f13_arg0:setLeftRight( 0, 0, 247, 597 )
					f13_arg0:setTopBottom( 0, 0, 93, 309 )
					f13_arg0:setRGB( 1, 1, 1 )
					f13_arg0:setAlpha( 1 )
					f13_arg0:setZoom( 0 )
					f13_arg0:registerEventHandler( "transition_complete_keyframe", f11_arg0.clipFinished )
				end
				
				f11_arg0.ZmAmmoProp0:beginAnimation( 80 )
				f11_arg0.ZmAmmoProp0:registerEventHandler( "interrupted_keyframe", f11_arg0.clipInterrupted )
				f11_arg0.ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
			
			f11_arg0.ZmAmmoProp0:completeAnimation()
			f11_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 295, 645 )
			f11_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 68, 284 )
			f11_arg0.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
			f11_arg0.ZmAmmoProp0:setAlpha( 0 )
			f11_arg0.ZmAmmoProp0:setZoom( -46 )
			f11_local0( f11_arg0.ZmAmmoProp0 )
		end
	},
	HudStart_NoReservePC = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 1 )
			f14_arg0.ZmAmmoProp0:completeAnimation()
			f14_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f14_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f14_arg0.clipFinished( f14_arg0.ZmAmmoProp0 )
		end
	},
	HudStartPC = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.ZmAmmoProp0:completeAnimation()
			f15_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f15_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f15_arg0.clipFinished( f15_arg0.ZmAmmoProp0 )
		end
	},
	HudStart_NoReserve = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			f16_arg0.ZmAmmoProp0:completeAnimation()
			f16_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f16_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f16_arg0.clipFinished( f16_arg0.ZmAmmoProp0 )
		end,
		DefaultState = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 1 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.ZmAmmoProp0:beginAnimation( 780, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f17_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 295, 645 )
				f17_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 68, 284 )
				f17_arg0.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
				f17_arg0.ZmAmmoProp0:setAlpha( 0 )
				f17_arg0.ZmAmmoProp0:setZoom( -46 )
				f17_arg0.ZmAmmoProp0:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.ZmAmmoProp0:completeAnimation()
			f17_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f17_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f17_arg0.ZmAmmoProp0:setRGB( 1, 1, 1 )
			f17_arg0.ZmAmmoProp0:setAlpha( 1 )
			f17_arg0.ZmAmmoProp0:setZoom( 0 )
			f17_local0( f17_arg0.ZmAmmoProp0 )
		end
	},
	HudStart = {
		DefaultClip = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties()
			f19_arg0:setupElementClipCounter( 1 )
			f19_arg0.ZmAmmoProp0:completeAnimation()
			f19_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f19_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f19_arg0.clipFinished( f19_arg0.ZmAmmoProp0 )
		end,
		DefaultState = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 1 )
			local f20_local0 = function ( f21_arg0 )
				f20_arg0.ZmAmmoProp0:beginAnimation( 780, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f20_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 295, 645 )
				f20_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 68, 284 )
				f20_arg0.ZmAmmoProp0:setRGB( 0.28, 0.16, 0.05 )
				f20_arg0.ZmAmmoProp0:setAlpha( 0 )
				f20_arg0.ZmAmmoProp0:setZoom( -46 )
				f20_arg0.ZmAmmoProp0:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.ZmAmmoProp0:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.ZmAmmoProp0:completeAnimation()
			f20_arg0.ZmAmmoProp0:setLeftRight( 0, 0, 247, 597 )
			f20_arg0.ZmAmmoProp0:setTopBottom( 0, 0, 93, 309 )
			f20_arg0.ZmAmmoProp0:setRGB( 1, 1, 1 )
			f20_arg0.ZmAmmoProp0:setAlpha( 1 )
			f20_arg0.ZmAmmoProp0:setZoom( 0 )
			f20_local0( f20_arg0.ZmAmmoProp0 )
		end
	}
}
CoD.ZmAmmoFactory.__onClose = function ( f22_arg0 )
	f22_arg0.ZmAmmoProp0:close()
end

