require( "ui/uieditor/widgets/itemshop/contracts/contractactivebannerbacker" )

CoD.ReservesBribeStackFreeBanner = InheritFrom( LUI.UIElement )
CoD.ReservesBribeStackFreeBanner.__defaultWidth = 150
CoD.ReservesBribeStackFreeBanner.__defaultHeight = 25
CoD.ReservesBribeStackFreeBanner.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ReservesBribeStackFreeBanner )
	self.id = "ReservesBribeStackFreeBanner"
	self.soundSet = "none"
	
	local ActiveTitle = LUI.UIText.new( 0.5, 0.5, -73, 73, 0.5, 0.5, -9, 9 )
	ActiveTitle:setRGB( 0, 0.96, 1 )
	ActiveTitle:setText( LocalizeToUpperString( 0xAA691B8F819AC52 ) )
	ActiveTitle:setTTF( "ttmussels_demibold" )
	ActiveTitle:setLetterSpacing( 4 )
	ActiveTitle:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	ActiveTitle:setBackingType( 1 )
	ActiveTitle:setBackingWidget( CoD.ContractActiveBannerBacker, f1_arg0, f1_arg1 )
	ActiveTitle:setBackingXPadding( 8 )
	ActiveTitle:setBackingYPadding( 2 )
	ActiveTitle._backingElement.Frame:setRGB( 0, 0.96, 1 )
	self:addElement( ActiveTitle )
	self.ActiveTitle = ActiveTitle
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

