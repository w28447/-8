CoD.ArenaGauntletProgressBar = InheritFrom( LUI.UIElement )
CoD.ArenaGauntletProgressBar.__defaultWidth = 10
CoD.ArenaGauntletProgressBar.__defaultHeight = 150
CoD.ArenaGauntletProgressBar.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ArenaGauntletProgressBar )
	self.id = "ArenaGauntletProgressBar"
	self.soundSet = "none"
	
	local ProgressBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	ProgressBacking:setRGB( ColorSet.HealthBarBackground.r, ColorSet.HealthBarBackground.g, ColorSet.HealthBarBackground.b )
	ProgressBacking:setZRot( 180 )
	ProgressBacking:setImage( RegisterImage( "uie_hud_core_player_healthbar_empty" ) )
	ProgressBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_repeat_nineslice_normal" ) )
	ProgressBacking:setShaderVector( 0, 0, 0, 0, 0 )
	ProgressBacking:setShaderVector( 1, 1, 8, 0, 0 )
	ProgressBacking:setShaderVector( 2, 0, 1, 0, 1 )
	ProgressBacking:setupNineSliceShader( 6, 6 )
	self:addElement( ProgressBacking )
	self.ProgressBacking = ProgressBacking
	
	local ProgressFill = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	ProgressFill:setRGB( ColorSet.PlayerGreen.r, ColorSet.PlayerGreen.g, ColorSet.PlayerGreen.b )
	ProgressFill:setZRot( 180 )
	ProgressFill:setImage( RegisterImage( "uie_hud_core_player_healthbar_empty" ) )
	ProgressFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_repeat_nineslice_normal" ) )
	ProgressFill:setShaderVector( 0, 0, 0, 0, 0 )
	ProgressFill:setShaderVector( 1, 1, 8, 0, 0 )
	ProgressFill:setShaderVector( 2, 0, 1, 0, 1 )
	ProgressFill:setupNineSliceShader( 6, 6 )
	self:addElement( ProgressFill )
	self.ProgressFill = ProgressFill
	
	local Count = LUI.UIText.new( 0, 0, -27, 37, 0, 0, -20, 0 )
	Count:setText( "" )
	Count:setTTF( "ttmussels_regular" )
	Count:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Count:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( Count )
	self.Count = Count
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

