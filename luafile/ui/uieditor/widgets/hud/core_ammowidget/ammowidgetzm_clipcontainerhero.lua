require( "ui/uieditor/widgets/hud/core_ammowidget/ammowidgetzm_clipcontainervalue" )

CoD.AmmoWidgetZM_ClipContainerHero = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_ClipContainerHero.__defaultWidth = 64
CoD.AmmoWidgetZM_ClipContainerHero.__defaultHeight = 61
CoD.AmmoWidgetZM_ClipContainerHero.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_ClipContainerHero )
	self.id = "AmmoWidgetZM_ClipContainerHero"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Clip = CoD.AmmoWidgetZM_ClipContainerValue.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	Clip:setRGB( 0.74, 0.74, 0.74 )
	Clip:setAlpha( 0 )
	Clip.ClipShadow:setText( "" )
	Clip.Clip:setText( "" )
	self:addElement( Clip )
	self.Clip = Clip
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.AmmoWidgetZM_ClipContainerHero.__resetProperties = function ( f2_arg0 )
	f2_arg0.Clip:completeAnimation()
	f2_arg0.Clip:setRGB( 0.74, 0.74, 0.74 )
	f2_arg0.Clip:setAlpha( 0 )
end

CoD.AmmoWidgetZM_ClipContainerHero.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			f3_arg0.Clip:completeAnimation()
			f3_arg0.Clip:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.Clip )
		end,
		Hero = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			local f4_local0 = function ( f5_arg0 )
				f4_arg0.Clip:beginAnimation( 500, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f4_arg0.Clip:setAlpha( 1 )
				f4_arg0.Clip:registerEventHandler( "interrupted_keyframe", f4_arg0.clipInterrupted )
				f4_arg0.Clip:registerEventHandler( "transition_complete_keyframe", f4_arg0.clipFinished )
			end
			
			f4_arg0.Clip:completeAnimation()
			f4_arg0.Clip:setAlpha( 0 )
			f4_local0( f4_arg0.Clip )
		end
	},
	Weapon = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 0 )
		end,
		DefaultState = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			local f7_local0 = function ( f8_arg0 )
				f7_arg0.Clip:beginAnimation( 500, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f7_arg0.Clip:setAlpha( 0 )
				f7_arg0.Clip:registerEventHandler( "interrupted_keyframe", f7_arg0.clipInterrupted )
				f7_arg0.Clip:registerEventHandler( "transition_complete_keyframe", f7_arg0.clipFinished )
			end
			
			f7_arg0.Clip:completeAnimation()
			f7_arg0.Clip:setAlpha( 1 )
			f7_local0( f7_arg0.Clip )
		end
	},
	Ability = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 1 )
			f9_arg0.Clip:completeAnimation()
			f9_arg0.Clip:setRGB( ColorSet.BadgeBorder.r, ColorSet.BadgeBorder.g, ColorSet.BadgeBorder.b )
			f9_arg0.clipFinished( f9_arg0.Clip )
		end
	}
}
CoD.AmmoWidgetZM_ClipContainerHero.__onClose = function ( f10_arg0 )
	f10_arg0.Clip:close()
end

