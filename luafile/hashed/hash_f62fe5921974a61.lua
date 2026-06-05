CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.__defaultWidth = 128
CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.__defaultHeight = 128
CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow )
	self.id = "ZmAmmo_BGBCarouselFactory_CooldownGlow"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ElixirGlowStroke = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirGlowStroke:setRGB( 0, 0.75, 1 )
	ElixirGlowStroke:setImage( RegisterImage( 0x5942CAFFDD6606F ) )
	ElixirGlowStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_angled_wipe_normal" ) )
	ElixirGlowStroke:setShaderVector( 0, 1, 0, 0, 0 )
	ElixirGlowStroke:setShaderVector( 1, -0.24, 0, 0, 0 )
	self:addElement( ElixirGlowStroke )
	self.ElixirGlowStroke = ElixirGlowStroke
	
	local ElixirGlowStrokeScale = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirGlowStrokeScale:setRGB( 0, 0.75, 1 )
	ElixirGlowStrokeScale:setImage( RegisterImage( 0x5942CAFFDD6606F ) )
	ElixirGlowStrokeScale:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_angled_wipe_add" ) )
	ElixirGlowStrokeScale:setShaderVector( 0, 1, 0, 0, 0 )
	ElixirGlowStrokeScale:setShaderVector( 1, 80, 0, 0, 0 )
	self:addElement( ElixirGlowStrokeScale )
	self.ElixirGlowStrokeScale = ElixirGlowStrokeScale
	
	local Base = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	Base:setRGB( 0.39, 0.93, 0.96 )
	Base:setAlpha( 0.75 )
	Base:setScale( 1.05, 1.05 )
	Base:setImage( RegisterImage( "uie_zm_hud_notification_aura" ) )
	Base:setMaterial( LUI.UIImage.GetCachedMaterial( 0x1CC85D0A86303B0 ) )
	Base:setShaderVector( 0, 1.2, 0, 0, 0 )
	self:addElement( Base )
	self.Base = Base
	
	self:mergeStateConditions( {
		{
			stateName = "Pulsing",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( self, f1_arg1, "global_cooldown", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "global_cooldown", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "global_cooldown"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.__resetProperties = function ( f4_arg0 )
	f4_arg0.ElixirGlowStroke:completeAnimation()
	f4_arg0.ElixirGlowStrokeScale:completeAnimation()
	f4_arg0.Base:completeAnimation()
	f4_arg0.ElixirGlowStroke:setAlpha( 1 )
	f4_arg0.ElixirGlowStrokeScale:setAlpha( 1 )
	f4_arg0.ElixirGlowStrokeScale:setScale( 1, 1 )
	f4_arg0.Base:setAlpha( 0.75 )
	f4_arg0.Base:setScale( 1.05, 1.05 )
end

CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 3 )
			f5_arg0.ElixirGlowStroke:completeAnimation()
			f5_arg0.ElixirGlowStroke:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.ElixirGlowStroke )
			f5_arg0.ElixirGlowStrokeScale:completeAnimation()
			f5_arg0.ElixirGlowStrokeScale:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.ElixirGlowStrokeScale )
			f5_arg0.Base:completeAnimation()
			f5_arg0.Base:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.Base )
		end,
		Pulsing = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 3 )
			local f6_local0 = function ( f7_arg0 )
				f6_arg0.ElixirGlowStroke:beginAnimation( 500 )
				f6_arg0.ElixirGlowStroke:setAlpha( 0.8 )
				f6_arg0.ElixirGlowStroke:registerEventHandler( "interrupted_keyframe", f6_arg0.clipInterrupted )
				f6_arg0.ElixirGlowStroke:registerEventHandler( "transition_complete_keyframe", f6_arg0.clipFinished )
			end
			
			f6_arg0.ElixirGlowStroke:completeAnimation()
			f6_arg0.ElixirGlowStroke:setAlpha( 0 )
			f6_local0( f6_arg0.ElixirGlowStroke )
			f6_arg0.ElixirGlowStrokeScale:completeAnimation()
			f6_arg0.ElixirGlowStrokeScale:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.ElixirGlowStrokeScale )
			f6_arg0.Base:completeAnimation()
			f6_arg0.Base:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.Base )
		end
	},
	Pulsing = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 3 )
			local f8_local0 = function ( f9_arg0 )
				local f9_local0 = function ( f10_arg0 )
					f10_arg0:beginAnimation( 1000 )
					f10_arg0:setAlpha( 0.8 )
					f10_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.ElixirGlowStroke:beginAnimation( 1000 )
				f8_arg0.ElixirGlowStroke:setAlpha( 0.1 )
				f8_arg0.ElixirGlowStroke:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.ElixirGlowStroke:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end
			
			f8_arg0.ElixirGlowStroke:completeAnimation()
			f8_arg0.ElixirGlowStroke:setAlpha( 0.8 )
			f8_local0( f8_arg0.ElixirGlowStroke )
			local f8_local1 = function ( f11_arg0 )
				local f11_local0 = function ( f12_arg0 )
					f12_arg0:beginAnimation( 1000 )
					f12_arg0:setAlpha( 0 )
					f12_arg0:setScale( 1.08, 1.08 )
					f12_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.ElixirGlowStrokeScale:beginAnimation( 1000 )
				f8_arg0.ElixirGlowStrokeScale:setAlpha( 0.5 )
				f8_arg0.ElixirGlowStrokeScale:setScale( 1.04, 1.04 )
				f8_arg0.ElixirGlowStrokeScale:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.ElixirGlowStrokeScale:registerEventHandler( "transition_complete_keyframe", f11_local0 )
			end
			
			f8_arg0.ElixirGlowStrokeScale:completeAnimation()
			f8_arg0.ElixirGlowStrokeScale:setAlpha( 0 )
			f8_arg0.ElixirGlowStrokeScale:setScale( 1, 1 )
			f8_local1( f8_arg0.ElixirGlowStrokeScale )
			local f8_local2 = function ( f13_arg0 )
				local f13_local0 = function ( f14_arg0 )
					f14_arg0:beginAnimation( 850 )
					f14_arg0:setAlpha( 0 )
					f14_arg0:setScale( 1.3, 1.3 )
					f14_arg0:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
				end
				
				f8_arg0.Base:beginAnimation( 1150 )
				f8_arg0.Base:setAlpha( 1 )
				f8_arg0.Base:setScale( 0.75, 0.75 )
				f8_arg0.Base:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.Base:registerEventHandler( "transition_complete_keyframe", f13_local0 )
			end
			
			f8_arg0.Base:completeAnimation()
			f8_arg0.Base:setAlpha( 0 )
			f8_arg0.Base:setScale( 0, 0 )
			f8_local2( f8_arg0.Base )
			f8_arg0.nextClip = "DefaultClip"
		end,
		DefaultState = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 3 )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.ElixirGlowStroke:beginAnimation( 500 )
				f15_arg0.ElixirGlowStroke:setAlpha( 0 )
				f15_arg0.ElixirGlowStroke:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.ElixirGlowStroke:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.ElixirGlowStroke:completeAnimation()
			f15_arg0.ElixirGlowStroke:setAlpha( 0.8 )
			f15_local0( f15_arg0.ElixirGlowStroke )
			f15_arg0.ElixirGlowStrokeScale:completeAnimation()
			f15_arg0.ElixirGlowStrokeScale:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.ElixirGlowStrokeScale )
			f15_arg0.Base:completeAnimation()
			f15_arg0.Base:setAlpha( 0 )
			f15_arg0.clipFinished( f15_arg0.Base )
		end
	}
}
