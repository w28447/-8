CoD.PerkInfo = InheritFrom( LUI.UIElement )
CoD.PerkInfo.__defaultWidth = 750
CoD.PerkInfo.__defaultHeight = 93
CoD.PerkInfo.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PerkInfo )
	self.id = "PerkInfo"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PerkImage1 = LUI.UIImage.new( 1, 1, -93, 0, 0, 0, 0, 93 )
	self:addElement( PerkImage1 )
	self.PerkImage1 = PerkImage1
	
	local PerkImage0 = LUI.UIImage.new( 1, 1, -186, -93, 0, 0, 0, 93 )
	self:addElement( PerkImage0 )
	self.PerkImage0 = PerkImage0
	
	local DoublePerkDescription = LUI.UIText.new( 1, 1, -750, -189, 0, 0, 33, 57 )
	DoublePerkDescription:setText( "" )
	DoublePerkDescription:setTTF( "ttmussels_demibold" )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	DoublePerkDescription:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( DoublePerkDescription )
	self.DoublePerkDescription = DoublePerkDescription
	
	local DoublePerkDescriptionArabic = LUI.UIText.new( 1, 1, -750, -189, 0, 0, 27, 51 )
	DoublePerkDescriptionArabic:setAlpha( 0 )
	DoublePerkDescriptionArabic:setText( "" )
	DoublePerkDescriptionArabic:setTTF( "ttmussels_demibold" )
	DoublePerkDescriptionArabic:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	DoublePerkDescriptionArabic:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( DoublePerkDescriptionArabic )
	self.DoublePerkDescriptionArabic = DoublePerkDescriptionArabic
	
	local SinglePerkDescription = LUI.UIText.new( 1, 1, -750, -186, 0, 0, 33, 57 )
	SinglePerkDescription:setAlpha( 0 )
	SinglePerkDescription:setText( "" )
	SinglePerkDescription:setTTF( "ttmussels_demibold" )
	SinglePerkDescription:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	SinglePerkDescription:setShaderVector( 0, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 1, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 2, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 3, 0, 0, 0, 0 )
	SinglePerkDescription:setShaderVector( 4, 0, 0, 0, 0 )
	SinglePerkDescription:setLetterSpacing( 0.5 )
	SinglePerkDescription:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	self:addElement( SinglePerkDescription )
	self.SinglePerkDescription = SinglePerkDescription
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.PerkInfo.__resetProperties = function ( f2_arg0 )
	f2_arg0.PerkImage0:completeAnimation()
	f2_arg0.PerkImage1:completeAnimation()
	f2_arg0.SinglePerkDescription:completeAnimation()
	f2_arg0.DoublePerkDescription:completeAnimation()
	f2_arg0.DoublePerkDescriptionArabic:completeAnimation()
	f2_arg0.PerkImage0:setLeftRight( 1, 1, -186, -93 )
	f2_arg0.PerkImage0:setTopBottom( 0, 0, 0, 93 )
	f2_arg0.PerkImage0:setAlpha( 1 )
	f2_arg0.PerkImage1:setAlpha( 1 )
	f2_arg0.SinglePerkDescription:setLeftRight( 1, 1, -750, -186 )
	f2_arg0.SinglePerkDescription:setTopBottom( 0, 0, 33, 57 )
	f2_arg0.SinglePerkDescription:setAlpha( 0 )
	f2_arg0.DoublePerkDescription:setLeftRight( 1, 1, -750, -189 )
	f2_arg0.DoublePerkDescription:setTopBottom( 0, 0, 33, 57 )
	f2_arg0.DoublePerkDescription:setAlpha( 1 )
	f2_arg0.DoublePerkDescriptionArabic:setAlpha( 0 )
end

CoD.PerkInfo.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 4 )
			f3_arg0.PerkImage1:completeAnimation()
			f3_arg0.PerkImage1:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.PerkImage1 )
			f3_arg0.PerkImage0:completeAnimation()
			f3_arg0.PerkImage0:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.PerkImage0 )
			f3_arg0.DoublePerkDescription:completeAnimation()
			f3_arg0.DoublePerkDescription:setLeftRight( 1, 1, -750, -189 )
			f3_arg0.DoublePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f3_arg0.DoublePerkDescription:setAlpha( 0 )
			f3_arg0.clipFinished( f3_arg0.DoublePerkDescription )
			f3_arg0.SinglePerkDescription:completeAnimation()
			f3_arg0.SinglePerkDescription:setLeftRight( 1, 1, -750, -102 )
			f3_arg0.SinglePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f3_arg0.clipFinished( f3_arg0.SinglePerkDescription )
		end
	},
	SinglePerk = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 4 )
			f4_arg0.PerkImage1:completeAnimation()
			f4_arg0.PerkImage1:setAlpha( 0 )
			f4_arg0.clipFinished( f4_arg0.PerkImage1 )
			f4_arg0.PerkImage0:completeAnimation()
			f4_arg0.PerkImage0:setLeftRight( 1, 1, -93, 0 )
			f4_arg0.PerkImage0:setTopBottom( 0, 0, 0, 93 )
			f4_arg0.clipFinished( f4_arg0.PerkImage0 )
			f4_arg0.DoublePerkDescription:completeAnimation()
			f4_arg0.DoublePerkDescription:setLeftRight( 1, 1, -750, -189 )
			f4_arg0.DoublePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f4_arg0.DoublePerkDescription:setAlpha( 0 )
			f4_arg0.clipFinished( f4_arg0.DoublePerkDescription )
			f4_arg0.SinglePerkDescription:completeAnimation()
			f4_arg0.SinglePerkDescription:setLeftRight( 1, 1, -750.5, -93.5 )
			f4_arg0.SinglePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f4_arg0.SinglePerkDescription:setAlpha( 1 )
			f4_arg0.clipFinished( f4_arg0.SinglePerkDescription )
		end
	},
	DoublePerk = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 2 )
			f5_arg0.DoublePerkDescription:completeAnimation()
			f5_arg0.DoublePerkDescription:setLeftRight( 1, 1, -750, -189 )
			f5_arg0.DoublePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f5_arg0.clipFinished( f5_arg0.DoublePerkDescription )
			f5_arg0.SinglePerkDescription:completeAnimation()
			f5_arg0.SinglePerkDescription:setLeftRight( 1, 1, -750, -226 )
			f5_arg0.SinglePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f5_arg0.clipFinished( f5_arg0.SinglePerkDescription )
		end
	},
	DoublePerkArabic = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 3 )
			f6_arg0.DoublePerkDescription:completeAnimation()
			f6_arg0.DoublePerkDescription:setLeftRight( 1, 1, -750, -189 )
			f6_arg0.DoublePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f6_arg0.DoublePerkDescription:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.DoublePerkDescription )
			f6_arg0.DoublePerkDescriptionArabic:completeAnimation()
			f6_arg0.DoublePerkDescriptionArabic:setAlpha( 1 )
			f6_arg0.clipFinished( f6_arg0.DoublePerkDescriptionArabic )
			f6_arg0.SinglePerkDescription:completeAnimation()
			f6_arg0.SinglePerkDescription:setLeftRight( 1, 1, -750, -226 )
			f6_arg0.SinglePerkDescription:setTopBottom( 0, 0, 27, 51 )
			f6_arg0.clipFinished( f6_arg0.SinglePerkDescription )
		end
	}
}
