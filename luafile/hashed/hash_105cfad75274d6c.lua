require( "ui/uieditor/widgets/hud/zm_ammowidgetfactory/zmammo_bgbcarouselbuttonpromptfactory" )
require( "x64:5cdd51dc1448649" )
require( "x64:7357025bc1f19ee" )

CoD.ZmAmmo_BGBCarouselFactory_Internal = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_BGBCarouselFactory_Internal.__defaultWidth = 460
CoD.ZmAmmo_BGBCarouselFactory_Internal.__defaultHeight = 330
CoD.ZmAmmo_BGBCarouselFactory_Internal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_BGBCarouselFactory_Internal )
	self.id = "ZmAmmo_BGBCarouselFactory_Internal"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ElixirBackerMid = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirBackerMid:setImage( RegisterImage( 0x1F0F92E00ECDC00 ) )
	self:addElement( ElixirBackerMid )
	self.ElixirBackerMid = ElixirBackerMid
	
	local ElixirBackerMidBlurBG = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirBackerMidBlurBG:setImage( RegisterImage( 0xB531C3597E25DB2 ) )
	ElixirBackerMidBlurBG:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	ElixirBackerMidBlurBG:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( ElixirBackerMidBlurBG )
	self.ElixirBackerMidBlurBG = ElixirBackerMidBlurBG
	
	local ElixirBackerMidCooldownOverlay = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirBackerMidCooldownOverlay:setRGB( 1, 0, 0 )
	ElixirBackerMidCooldownOverlay:setZRot( 180 )
	ElixirBackerMidCooldownOverlay:setImage( RegisterImage( 0x1F0F92E00ECDC00 ) )
	ElixirBackerMidCooldownOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ElixirBackerMidCooldownOverlay:setShaderVector( 0, 1, 0, 0, 0 )
	ElixirBackerMidCooldownOverlay:setShaderVector( 1, 0, 0, 0, 0 )
	ElixirBackerMidCooldownOverlay:setShaderVector( 3, 0, 0, 0, 0 )
	ElixirBackerMidCooldownOverlay:setShaderVector( 4, 0, 0, 0, 0 )
	ElixirBackerMidCooldownOverlay:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "global_cooldown", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			ElixirBackerMidCooldownOverlay:setShaderVector( 2, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
		end
	end )
	self:addElement( ElixirBackerMidCooldownOverlay )
	self.ElixirBackerMidCooldownOverlay = ElixirBackerMidCooldownOverlay
	
	local ElixirBackerFrame = LUI.UIImage.new( 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirBackerFrame:setImage( RegisterImage( 0xE31C763C216DA25 ) )
	self:addElement( ElixirBackerFrame )
	self.ElixirBackerFrame = ElixirBackerFrame
	
	local BBGumRingBackerLeft = LUI.UIImage.new( 0.5, 0.5, -126, -38, 0.5, 0.5, -44, 44 )
	BBGumRingBackerLeft:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerLeft )
	self.BBGumRingBackerLeft = BBGumRingBackerLeft
	
	local BBGumRingBackerBtm = LUI.UIImage.new( 0.5, 0.5, -44, 44, 0.5, 0.5, 38, 126 )
	BBGumRingBackerBtm:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerBtm )
	self.BBGumRingBackerBtm = BBGumRingBackerBtm
	
	local BBGumRingBackerRight = LUI.UIImage.new( 0.5, 0.5, 38, 126, 0.5, 0.5, -44, 44 )
	BBGumRingBackerRight:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerRight )
	self.BBGumRingBackerRight = BBGumRingBackerRight
	
	local BBGumRingBackerTop = LUI.UIImage.new( 0.5, 0.5, -44, 44, 0.5, 0.5, -126, -38 )
	BBGumRingBackerTop:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerTop )
	self.BBGumRingBackerTop = BBGumRingBackerTop
	
	local up = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -44, 44, 0.5, 0.5, -126, -38 )
	up:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "0", function ( model )
		up:setModel( model, f1_arg1 )
	end )
	self:addElement( up )
	self.up = up
	
	local right = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, 38, 126, 0.5, 0.5, -44, 44 )
	right:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "1", function ( model )
		right:setModel( model, f1_arg1 )
	end )
	self:addElement( right )
	self.right = right
	
	local bottom = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -44, 44, 0.5, 0.5, 38, 126 )
	bottom:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "2", function ( model )
		bottom:setModel( model, f1_arg1 )
	end )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -126, -38, 0.5, 0.5, -44, 44 )
	left:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "3", function ( model )
		left:setModel( model, f1_arg1 )
	end )
	self:addElement( left )
	self.left = left
	
	local tempGumUpName = LUI.UIText.new( 0.5, 0.5, -100, 100, 0.5, 0.5, -152, -131 )
	tempGumUpName:setTTF( "skorzhen" )
	tempGumUpName:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	tempGumUpName:setAlignment( Enum.LUIAlignment[0x70510683C22104B] )
	tempGumUpName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "0.gum_idx", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			tempGumUpName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f7_local0 ) ) )
		end
	end )
	self:addElement( tempGumUpName )
	self.tempGumUpName = tempGumUpName
	
	local tempGumRightName = LUI.UIText.new( 0.5, 0.5, 129, 260, 0.5, 0.5, -17, 4 )
	tempGumRightName:setTTF( "skorzhen" )
	tempGumRightName:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	tempGumRightName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	tempGumRightName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "1.gum_idx", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			tempGumRightName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f8_local0 ) ) )
		end
	end )
	self:addElement( tempGumRightName )
	self.tempGumRightName = tempGumRightName
	
	local tempGumDownName = LUI.UIText.new( 0.5, 0.5, -100, 100, 0.5, 0.5, 124, 145 )
	tempGumDownName:setTTF( "skorzhen" )
	tempGumDownName:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	tempGumDownName:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	tempGumDownName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "2.gum_idx", function ( model )
		local f9_local0 = model:get()
		if f9_local0 ~= nil then
			tempGumDownName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f9_local0 ) ) )
		end
	end )
	self:addElement( tempGumDownName )
	self.tempGumDownName = tempGumDownName
	
	local tempGumLeftName = LUI.UIText.new( 0.5, 0.5, -272.5, -132.5, 0.5, 0.5, -17, 4 )
	tempGumLeftName:setTTF( "skorzhen" )
	tempGumLeftName:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	tempGumLeftName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	tempGumLeftName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "3.gum_idx", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			tempGumLeftName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f10_local0 ) ) )
		end
	end )
	self:addElement( tempGumLeftName )
	self.tempGumLeftName = tempGumLeftName
	
	local ElixirGlowStroke = CoD.ZmAmmo_BGBCarouselFactory_CooldownGlow.new( f1_arg0, f1_arg1, 0.5, 0.5, -64, 64, 0.5, 0.5, -64, 64 )
	ElixirGlowStroke:subscribeToGlobalModel( f1_arg1, "BGBCarousel", nil, function ( model )
		ElixirGlowStroke:setModel( model, f1_arg1 )
	end )
	self:addElement( ElixirGlowStroke )
	self.ElixirGlowStroke = ElixirGlowStroke
	
	local DpadBackplate = LUI.UIImage.new( 0.5, 0.5, -34, 34, 0.5, 0.5, -34, 34 )
	DpadBackplate:setImage( RegisterImage( "uie_zm_hud_elixirdpadbacking" ) )
	self:addElement( DpadBackplate )
	self.DpadBackplate = DpadBackplate
	
	local ButtonPrompt = CoD.ZmAmmo_BGBCarouselButtonPromptFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, -34, 34, 0.5, 0.5, -34, 34 )
	self:addElement( ButtonPrompt )
	self.ButtonPrompt = ButtonPrompt
	
	self:mergeStateConditions( {
		{
			stateName = "ScoreboardOpen",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f1_arg1, "ZMHudGlobal", "isScoreboardPCOpen" )
			end
		}
	} )
	local f1_local20 = self
	local f1_local21 = self.subscribeToModel
	local f1_local22 = Engine.GetModelForController( f1_arg1 )
	f1_local21( f1_local20, f1_local22["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f13_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f13_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local20 = self
	f1_local21 = self.subscribeToModel
	f1_local22 = DataSources.ZMHudGlobal.getModel( f1_arg1 )
	f1_local21( f1_local20, f1_local22.isScoreboardPCOpen, function ( f14_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f14_arg0:get(),
			modelName = "isScoreboardPCOpen"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_BGBCarouselFactory_Internal.__resetProperties = function ( f15_arg0 )
	f15_arg0.tempGumLeftName:completeAnimation()
	f15_arg0.tempGumDownName:completeAnimation()
	f15_arg0.tempGumRightName:completeAnimation()
	f15_arg0.tempGumUpName:completeAnimation()
	f15_arg0.tempGumLeftName:setAlpha( 1 )
	f15_arg0.tempGumDownName:setAlpha( 1 )
	f15_arg0.tempGumRightName:setAlpha( 1 )
	f15_arg0.tempGumUpName:setAlpha( 1 )
end

CoD.ZmAmmo_BGBCarouselFactory_Internal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 4 )
			f16_arg0.tempGumUpName:completeAnimation()
			f16_arg0.tempGumUpName:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.tempGumUpName )
			f16_arg0.tempGumRightName:completeAnimation()
			f16_arg0.tempGumRightName:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.tempGumRightName )
			f16_arg0.tempGumDownName:completeAnimation()
			f16_arg0.tempGumDownName:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.tempGumDownName )
			f16_arg0.tempGumLeftName:completeAnimation()
			f16_arg0.tempGumLeftName:setAlpha( 0 )
			f16_arg0.clipFinished( f16_arg0.tempGumLeftName )
		end,
		ScoreboardOpen = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties()
			f17_arg0:setupElementClipCounter( 4 )
			local f17_local0 = function ( f18_arg0 )
				f17_arg0.tempGumUpName:beginAnimation( 200 )
				f17_arg0.tempGumUpName:setAlpha( 1 )
				f17_arg0.tempGumUpName:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.tempGumUpName:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.tempGumUpName:completeAnimation()
			f17_arg0.tempGumUpName:setAlpha( 0 )
			f17_local0( f17_arg0.tempGumUpName )
			local f17_local1 = function ( f19_arg0 )
				f17_arg0.tempGumRightName:beginAnimation( 200 )
				f17_arg0.tempGumRightName:setAlpha( 1 )
				f17_arg0.tempGumRightName:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.tempGumRightName:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.tempGumRightName:completeAnimation()
			f17_arg0.tempGumRightName:setAlpha( 0 )
			f17_local1( f17_arg0.tempGumRightName )
			local f17_local2 = function ( f20_arg0 )
				f17_arg0.tempGumDownName:beginAnimation( 200 )
				f17_arg0.tempGumDownName:setAlpha( 1 )
				f17_arg0.tempGumDownName:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.tempGumDownName:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.tempGumDownName:completeAnimation()
			f17_arg0.tempGumDownName:setAlpha( 0 )
			f17_local2( f17_arg0.tempGumDownName )
			local f17_local3 = function ( f21_arg0 )
				f17_arg0.tempGumLeftName:beginAnimation( 200 )
				f17_arg0.tempGumLeftName:setAlpha( 1 )
				f17_arg0.tempGumLeftName:registerEventHandler( "interrupted_keyframe", f17_arg0.clipInterrupted )
				f17_arg0.tempGumLeftName:registerEventHandler( "transition_complete_keyframe", f17_arg0.clipFinished )
			end
			
			f17_arg0.tempGumLeftName:completeAnimation()
			f17_arg0.tempGumLeftName:setAlpha( 0 )
			f17_local3( f17_arg0.tempGumLeftName )
		end
	},
	ScoreboardOpen = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 0 )
		end,
		DefaultState = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 4 )
			local f23_local0 = function ( f24_arg0 )
				f23_arg0.tempGumUpName:beginAnimation( 200 )
				f23_arg0.tempGumUpName:setAlpha( 0 )
				f23_arg0.tempGumUpName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.tempGumUpName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.tempGumUpName:completeAnimation()
			f23_arg0.tempGumUpName:setAlpha( 1 )
			f23_local0( f23_arg0.tempGumUpName )
			local f23_local1 = function ( f25_arg0 )
				f23_arg0.tempGumRightName:beginAnimation( 200 )
				f23_arg0.tempGumRightName:setAlpha( 0 )
				f23_arg0.tempGumRightName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.tempGumRightName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.tempGumRightName:completeAnimation()
			f23_arg0.tempGumRightName:setAlpha( 1 )
			f23_local1( f23_arg0.tempGumRightName )
			local f23_local2 = function ( f26_arg0 )
				f23_arg0.tempGumDownName:beginAnimation( 200 )
				f23_arg0.tempGumDownName:setAlpha( 0 )
				f23_arg0.tempGumDownName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.tempGumDownName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.tempGumDownName:completeAnimation()
			f23_arg0.tempGumDownName:setAlpha( 1 )
			f23_local2( f23_arg0.tempGumDownName )
			local f23_local3 = function ( f27_arg0 )
				f23_arg0.tempGumLeftName:beginAnimation( 200 )
				f23_arg0.tempGumLeftName:setAlpha( 0 )
				f23_arg0.tempGumLeftName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.tempGumLeftName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.tempGumLeftName:completeAnimation()
			f23_arg0.tempGumLeftName:setAlpha( 1 )
			f23_local3( f23_arg0.tempGumLeftName )
		end
	}
}
CoD.ZmAmmo_BGBCarouselFactory_Internal.__onClose = function ( f28_arg0 )
	f28_arg0.ElixirBackerMidCooldownOverlay:close()
	f28_arg0.up:close()
	f28_arg0.right:close()
	f28_arg0.bottom:close()
	f28_arg0.left:close()
	f28_arg0.tempGumUpName:close()
	f28_arg0.tempGumRightName:close()
	f28_arg0.tempGumDownName:close()
	f28_arg0.tempGumLeftName:close()
	f28_arg0.ElixirGlowStroke:close()
	f28_arg0.ButtonPrompt:close()
end

