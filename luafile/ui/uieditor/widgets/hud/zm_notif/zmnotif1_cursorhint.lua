require( "x64:e974620a2d49d8f" )

CoD.ZmNotif1_CursorHint = InheritFrom( LUI.UIElement )
CoD.ZmNotif1_CursorHint.__defaultWidth = 768
CoD.ZmNotif1_CursorHint.__defaultHeight = 30
CoD.ZmNotif1_CursorHint.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmNotif1_CursorHint )
	self.id = "ZmNotif1_CursorHint"
	self.soundSet = "HUD"
	
	local CursorHintText = LUI.UIText.new( 0, 1, 0, 0, 0, 0, 4, 30 )
	CursorHintText:setText( Engine[0xF9F1239CFD921FE]( "menu/new" ) )
	CursorHintText:setTTF( "skorzhen" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	CursorHintText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	CursorHintText:setBackingType( 1 )
	CursorHintText:setBackingWidget( CoD.Corner9SliceZM, f1_arg0, f1_arg1 )
	CursorHintText:setBackingAlpha( 0.8 )
	CursorHintText:setBackingXPadding( 10 )
	CursorHintText:setBackingYPadding( 4 )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

