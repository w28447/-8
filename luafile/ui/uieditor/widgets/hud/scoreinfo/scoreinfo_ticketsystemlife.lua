CoD.ScoreInfo_TicketSystemLife = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TicketSystemLife.__defaultWidth = 32
CoD.ScoreInfo_TicketSystemLife.__defaultHeight = 32
CoD.ScoreInfo_TicketSystemLife.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_TicketSystemLife )
	self.id = "ScoreInfo_TicketSystemLife"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local DeathIcon = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	DeathIcon:setAlpha( 0 )
	DeathIcon:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_person" ) )
	DeathIcon:setMaterial( LUI.UIImage.GetCachedMaterial( 0x1CC85D0A86303B0 ) )
	DeathIcon:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( DeathIcon )
	self.DeathIcon = DeathIcon
	
	local LifeIcon = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	LifeIcon:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_person" ) )
	LifeIcon:setMaterial( LUI.UIImage.GetCachedMaterial( 0x1CC85D0A86303B0 ) )
	LifeIcon:setShaderVector( 0, 1, 0, 0, 0 )
	LifeIcon:linkToElementModel( self, "teamColor", true, function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			LifeIcon:setRGB( f2_local0 )
		end
	end )
	self:addElement( LifeIcon )
	self.LifeIcon = LifeIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_TicketSystemLife.__resetProperties = function ( f3_arg0 )
	f3_arg0.LifeIcon:completeAnimation()
	f3_arg0.DeathIcon:completeAnimation()
	f3_arg0.LifeIcon:setAlpha( 1 )
	f3_arg0.LifeIcon:setZRot( 0 )
	f3_arg0.LifeIcon:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_person" ) )
	f3_arg0.DeathIcon:setRGB( 1, 1, 1 )
	f3_arg0.DeathIcon:setAlpha( 0 )
end

CoD.ScoreInfo_TicketSystemLife.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			f4_arg0.LifeIcon:completeAnimation()
			f4_arg0.LifeIcon:setAlpha( 1 )
			f4_arg0.clipFinished( f4_arg0.LifeIcon )
		end
	},
	Hidden = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.LifeIcon:completeAnimation()
			f5_arg0.LifeIcon:setAlpha( 0 )
			f5_arg0.clipFinished( f5_arg0.LifeIcon )
		end
	},
	Eliminated = {
		DefaultClip = function ( f6_arg0, f6_arg1 )
			f6_arg0:__resetProperties()
			f6_arg0:setupElementClipCounter( 2 )
			f6_arg0.DeathIcon:completeAnimation()
			f6_arg0.DeathIcon:setRGB( 0.5, 0.5, 0.5 )
			f6_arg0.DeathIcon:setAlpha( 0.2 )
			f6_arg0.clipFinished( f6_arg0.DeathIcon )
			f6_arg0.LifeIcon:completeAnimation()
			f6_arg0.LifeIcon:setAlpha( 0 )
			f6_arg0.clipFinished( f6_arg0.LifeIcon )
		end
	},
	Downed = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties()
			f7_arg0:setupElementClipCounter( 1 )
			f7_arg0.LifeIcon:completeAnimation()
			f7_arg0.LifeIcon:setZRot( 0 )
			f7_arg0.LifeIcon:setImage( RegisterImage( 0x60D34BEB4B4E1F2 ) )
			f7_arg0.clipFinished( f7_arg0.LifeIcon )
		end
	}
}
CoD.ScoreInfo_TicketSystemLife.__onClose = function ( f8_arg0 )
	f8_arg0.LifeIcon:close()
end

