CoD.ScoreInfo_ScoreBarRoundPip = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_ScoreBarRoundPip.__defaultWidth = 12
CoD.ScoreInfo_ScoreBarRoundPip.__defaultHeight = 3
CoD.ScoreInfo_ScoreBarRoundPip.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_ScoreBarRoundPip )
	self.id = "ScoreInfo_ScoreBarRoundPip"
	self.soundSet = "none"
	
	local Pip = LUI.UIImage.new( 0, 0, 74, 86, 0, 0, -2, 8 )
	Pip:setAlpha( 0 )
	Pip:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_triangle" ) )
	Pip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Pip )
	self.Pip = Pip
	
	local Pip2 = LUI.UIImage.new( 0, 0, -4.5, 7.5, 0, 0, -2, 8 )
	Pip2:setAlpha( 0 )
	Pip2:setZRot( 180 )
	Pip2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_triangle" ) )
	Pip2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Pip2 )
	self.Pip2 = Pip2
	
	local FUI = LUI.UIImage.new( 0, 0, -4.5, 87.5, 0, 0, -2, 8 )
	FUI:setAlpha( 0.6 )
	FUI:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_fui" ) )
	self:addElement( FUI )
	self.FUI = FUI
	
	local Half2 = LUI.UIImage.new( 0, 0, -13.5, -1.5, 0, 0, -2.5, 7.5 )
	Half2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	Half2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Half2 )
	self.Half2 = Half2
	
	local Half = LUI.UIImage.new( 0, 0, 82, 94, 0, 0, -2.5, 7.5 )
	Half:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_meter_cap" ) )
	Half:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Half )
	self.Half = Half
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

