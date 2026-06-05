CoD.List1ButtonLarge_PH_Internal = InheritFrom( LUI.UIElement )
CoD.List1ButtonLarge_PH_Internal.__defaultWidth = 310
CoD.List1ButtonLarge_PH_Internal.__defaultHeight = 60
CoD.List1ButtonLarge_PH_Internal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.List1ButtonLarge_PH_Internal )
	self.id = "List1ButtonLarge_PH_Internal"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Backing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	Backing:setAlpha( 0.01 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local NoiseTiledBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NoiseTiledBacking:setAlpha( 0.4 )
	NoiseTiledBacking:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseTiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	NoiseTiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseTiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseTiledBacking )
	self.NoiseTiledBacking = NoiseTiledBacking
	
	local NoiseTiledBackingAdd = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	NoiseTiledBackingAdd:setAlpha( 0.35 )
	NoiseTiledBackingAdd:setImage( RegisterImage( "uie_ui_menu_specialist_hub_repeat_bg" ) )
	NoiseTiledBackingAdd:setMaterial( LUI.UIImage.GetCachedMaterial( 0x7C9C02F608D0A75 ) )
	NoiseTiledBackingAdd:setShaderVector( 0, 0, 0, 0, 0 )
	NoiseTiledBackingAdd:setupNineSliceShader( 196, 88 )
	self:addElement( NoiseTiledBackingAdd )
	self.NoiseTiledBackingAdd = NoiseTiledBackingAdd
	
	local SelectorOverlay = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	SelectorOverlay:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	SelectorOverlay:setAlpha( 0.01 )
	self:addElement( SelectorOverlay )
	self.SelectorOverlay = SelectorOverlay
	
	local FrontendFrameSelected = LUI.UIImage.new( 0, 1, -4, 4, 0, 1, -4, 4 )
	FrontendFrameSelected:setAlpha( 0 )
	FrontendFrameSelected:setImage( RegisterImage( "uie_ui_menu_store_focus_frame" ) )
	FrontendFrameSelected:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FrontendFrameSelected:setShaderVector( 0, 0, 0, 0, 0 )
	FrontendFrameSelected:setupNineSliceShader( 12, 12 )
	self:addElement( FrontendFrameSelected )
	self.FrontendFrameSelected = FrontendFrameSelected
	
	local FrontendFocusPip = LUI.UIImage.new( 0, 1, -6, 6, 0, 1, -6, 6 )
	FrontendFocusPip:setImage( RegisterImage( "uie_ui_menu_store_focus_pips" ) )
	FrontendFocusPip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FrontendFocusPip:setShaderVector( 0, 0, 0, 0, 0 )
	FrontendFocusPip:setupNineSliceShader( 40, 40 )
	self:addElement( FrontendFocusPip )
	self.FrontendFocusPip = FrontendFocusPip
	
	local FrontendFrameSelectedGlow = LUI.UIImage.new( 0, 1, -8, 8, 0, 1, -8, 8 )
	FrontendFrameSelectedGlow:setAlpha( 0 )
	FrontendFrameSelectedGlow:setImage( RegisterImage( "uie_ui_menu_store_focus_frame" ) )
	FrontendFrameSelectedGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FrontendFrameSelectedGlow:setShaderVector( 0, 0, 0, 0, 0 )
	FrontendFrameSelectedGlow:setupNineSliceShader( 28, 28 )
	self:addElement( FrontendFrameSelectedGlow )
	self.FrontendFrameSelectedGlow = FrontendFrameSelectedGlow
	
	local FrontendFrame = LUI.UIImage.new( 0, 1, -1, 1, 0, 1, -1, 1 )
	FrontendFrame:setAlpha( 0.2 )
	FrontendFrame:setImage( RegisterImage( "uie_ui_menu_store_common_frame" ) )
	FrontendFrame:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FrontendFrame:setShaderVector( 0, 0, 0, 0, 0 )
	FrontendFrame:setupNineSliceShader( 12, 12 )
	self:addElement( FrontendFrame )
	self.FrontendFrame = FrontendFrame
	
	local Text = LUI.UIText.new( 0.5, 0.5, -145, 145, 0.5, 0.5, -11, 11 )
	Text:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	Text:setTTF( "ttmussels_regular" )
	Text:setLetterSpacing( 1 )
	Text:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Text:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Text )
	self.Text = Text
	
	self.Text:linkToElementModel( self, "displayText", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Text:setText( LocalizeToUpperString( f2_local0 ) )
		end
	end )
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, f1_arg1 ) and not PropertyIsTrue( self, "hideHelpItemLabel" )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.List1ButtonLarge_PH_Internal.__resetProperties = function ( f5_arg0 )
	f5_arg0.FrontendFocusPip:completeAnimation()
	f5_arg0.Text:completeAnimation()
	f5_arg0.FrontendFrameSelectedGlow:completeAnimation()
	f5_arg0.FrontendFrameSelected:completeAnimation()
	f5_arg0.SelectorOverlay:completeAnimation()
	f5_arg0.FrontendFocusPip:setAlpha( 1 )
	f5_arg0.FrontendFocusPip:setScale( 1, 1 )
	f5_arg0.Text:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
	f5_arg0.FrontendFrameSelectedGlow:setAlpha( 0 )
	f5_arg0.FrontendFrameSelected:setAlpha( 0 )
	f5_arg0.SelectorOverlay:setAlpha( 0.01 )
end

CoD.List1ButtonLarge_PH_Internal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 1 )
			f6_arg0.FrontendFocusPip:completeAnimation()
			f6_arg0.FrontendFocusPip:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.FrontendFocusPip )
		end,
		Focus = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 5 )
			f7_arg0.SelectorOverlay:completeAnimation()
			f7_arg0.SelectorOverlay:setAlpha( 0.04 )
			f7_arg0.clipFinished( f7_arg0.SelectorOverlay )
			f7_arg0.FrontendFrameSelected:completeAnimation()
			f7_arg0.FrontendFrameSelected:setAlpha( 1 )
			f7_arg0.clipFinished( f7_arg0.FrontendFrameSelected )
			f7_arg0.FrontendFocusPip:completeAnimation()
			f7_arg0.FrontendFocusPip:setAlpha( 0.3 )
			f7_arg0.FrontendFocusPip:setScale( 1, 1 )
			f7_arg0.clipFinished( f7_arg0.FrontendFocusPip )
			f7_arg0.FrontendFrameSelectedGlow:completeAnimation()
			f7_arg0.FrontendFrameSelectedGlow:setAlpha( 0.05 )
			f7_arg0.clipFinished( f7_arg0.FrontendFrameSelectedGlow )
			f7_arg0.Text:completeAnimation()
			f7_arg0.Text:setRGB( 0.92, 0.89, 0.72 )
			f7_arg0.clipFinished( f7_arg0.Text )
		end,
		GainFocus = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 5 )
			local f8_local0 = function ( f9_arg0 )
				f8_arg0.SelectorOverlay:beginAnimation( 150 )
				f8_arg0.SelectorOverlay:setAlpha( 0.04 )
				f8_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.SelectorOverlay:completeAnimation()
			f8_arg0.SelectorOverlay:setAlpha( 0.01 )
			f8_local0( f8_arg0.SelectorOverlay )
			local f8_local1 = function ( f10_arg0 )
				f8_arg0.FrontendFrameSelected:beginAnimation( 150 )
				f8_arg0.FrontendFrameSelected:setAlpha( 1 )
				f8_arg0.FrontendFrameSelected:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FrontendFrameSelected:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FrontendFrameSelected:completeAnimation()
			f8_arg0.FrontendFrameSelected:setAlpha( 0 )
			f8_local1( f8_arg0.FrontendFrameSelected )
			local f8_local2 = function ( f11_arg0 )
				f8_arg0.FrontendFocusPip:beginAnimation( 150 )
				f8_arg0.FrontendFocusPip:setAlpha( 0.3 )
				f8_arg0.FrontendFocusPip:setScale( 1, 1 )
				f8_arg0.FrontendFocusPip:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FrontendFocusPip:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FrontendFocusPip:completeAnimation()
			f8_arg0.FrontendFocusPip:setAlpha( 1 )
			f8_arg0.FrontendFocusPip:setScale( 1.04, 1.16 )
			f8_local2( f8_arg0.FrontendFocusPip )
			local f8_local3 = function ( f12_arg0 )
				f8_arg0.FrontendFrameSelectedGlow:beginAnimation( 150 )
				f8_arg0.FrontendFrameSelectedGlow:setAlpha( 0.05 )
				f8_arg0.FrontendFrameSelectedGlow:registerEventHandler( "interrupted_keyframe", f8_arg0.clipInterrupted )
				f8_arg0.FrontendFrameSelectedGlow:registerEventHandler( "transition_complete_keyframe", f8_arg0.clipFinished )
			end
			
			f8_arg0.FrontendFrameSelectedGlow:completeAnimation()
			f8_arg0.FrontendFrameSelectedGlow:setAlpha( 0 )
			f8_local3( f8_arg0.FrontendFrameSelectedGlow )
			f8_arg0.Text:completeAnimation()
			f8_arg0.Text:setRGB( 0.92, 0.89, 0.72 )
			f8_arg0.clipFinished( f8_arg0.Text )
		end,
		LoseFocus = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 5 )
			local f13_local0 = function ( f14_arg0 )
				f13_arg0.SelectorOverlay:beginAnimation( 150 )
				f13_arg0.SelectorOverlay:setAlpha( 0.01 )
				f13_arg0.SelectorOverlay:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.SelectorOverlay:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.SelectorOverlay:completeAnimation()
			f13_arg0.SelectorOverlay:setAlpha( 0.04 )
			f13_local0( f13_arg0.SelectorOverlay )
			local f13_local1 = function ( f15_arg0 )
				f13_arg0.FrontendFrameSelected:beginAnimation( 150 )
				f13_arg0.FrontendFrameSelected:setAlpha( 0 )
				f13_arg0.FrontendFrameSelected:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.FrontendFrameSelected:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.FrontendFrameSelected:completeAnimation()
			f13_arg0.FrontendFrameSelected:setAlpha( 1 )
			f13_local1( f13_arg0.FrontendFrameSelected )
			local f13_local2 = function ( f16_arg0 )
				f13_arg0.FrontendFocusPip:beginAnimation( 150 )
				f13_arg0.FrontendFocusPip:setAlpha( 1 )
				f13_arg0.FrontendFocusPip:setScale( 1.04, 1.16 )
				f13_arg0.FrontendFocusPip:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.FrontendFocusPip:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.FrontendFocusPip:completeAnimation()
			f13_arg0.FrontendFocusPip:setAlpha( 0.3 )
			f13_arg0.FrontendFocusPip:setScale( 1, 1 )
			f13_local2( f13_arg0.FrontendFocusPip )
			local f13_local3 = function ( f17_arg0 )
				f13_arg0.FrontendFrameSelectedGlow:beginAnimation( 150 )
				f13_arg0.FrontendFrameSelectedGlow:setAlpha( 0 )
				f13_arg0.FrontendFrameSelectedGlow:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.FrontendFrameSelectedGlow:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
			end
			
			f13_arg0.FrontendFrameSelectedGlow:completeAnimation()
			f13_arg0.FrontendFrameSelectedGlow:setAlpha( 0.05 )
			f13_local3( f13_arg0.FrontendFrameSelectedGlow )
			f13_arg0.Text:completeAnimation()
			f13_arg0.Text:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f13_arg0.clipFinished( f13_arg0.Text )
		end
	},
	Disabled = {
		DefaultClip = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties()
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.FrontendFocusPip:completeAnimation()
			f18_arg0.FrontendFocusPip:setAlpha( 0 )
			f18_arg0.clipFinished( f18_arg0.FrontendFocusPip )
		end
	}
}
CoD.List1ButtonLarge_PH_Internal.__onClose = function ( f19_arg0 )
	f19_arg0.Text:close()
end

