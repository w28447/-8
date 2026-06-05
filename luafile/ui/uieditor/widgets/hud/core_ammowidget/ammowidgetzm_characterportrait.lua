CoD.AmmoWidgetZM_CharacterPortrait = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetZM_CharacterPortrait.__defaultWidth = 103
CoD.AmmoWidgetZM_CharacterPortrait.__defaultHeight = 103
CoD.AmmoWidgetZM_CharacterPortrait.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidgetZM_CharacterPortrait )
	self.id = "AmmoWidgetZM_CharacterPortrait"
	self.soundSet = "none"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Normal = LUI.UIImage.new( 0, 1, 0, 0, 0.14, 0.86, 0, 0 )
	Normal:linkToElementModel( self, "characterIndex", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			Normal:setImage( RegisterImage( GetPositionDraftStatePortraitByIndex( CoD.HUDUtility.CharacterPortraitStates.CHARACTER_PORTRAIT_NORMAL, f2_local0 ) ) )
		end
	end )
	self:addElement( Normal )
	self.Normal = Normal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local2 = self
	CoD.HUDUtility.SetupCharacterPortrait( self, f1_arg1 )
	return self
end

CoD.AmmoWidgetZM_CharacterPortrait.__resetProperties = function ( f3_arg0 )
	f3_arg0.Normal:completeAnimation()
	f3_arg0.Normal:setAlpha( 1 )
end

CoD.AmmoWidgetZM_CharacterPortrait.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			f4_arg0.Normal:completeAnimation()
			f4_arg0.Normal:setAlpha( 1 )
			f4_arg0.clipFinished( f4_arg0.Normal )
		end
	}
}
CoD.AmmoWidgetZM_CharacterPortrait.__onClose = function ( f5_arg0 )
	f5_arg0.Normal:close()
end

