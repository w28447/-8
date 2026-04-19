require( "ui/uieditor/widgets/callingcards/callingcards_blackmarket_set_widget" )
require( "ui/uieditor/widgets/scrollbars/verticalcounter" )

CoD.CallingCards_Set_BlackMarket = InheritFrom( LUI.UIElement )
CoD.CallingCards_Set_BlackMarket.__defaultWidth = 1725
CoD.CallingCards_Set_BlackMarket.__defaultHeight = 780
CoD.CallingCards_Set_BlackMarket.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CallingCards_Set_BlackMarket )
	self.id = "CallingCards_Set_BlackMarket"
	self.soundSet = "ChooseDecal"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local CallingCardSet = LUI.UIList.new( f1_arg0, f1_arg1, 30, 0, nil, true, false, false, false )
	CallingCardSet:setLeftRight( 0.5, 0.5, -709.5, 709.5 )
	CallingCardSet:setTopBottom( 0, 0, 57, 723 )
	CallingCardSet:setWidgetType( CoD.CallingCards_BlackMarket_Set_Widget )
	CallingCardSet:setHorizontalCount( 3 )
	CallingCardSet:setVerticalCount( 3 )
	CallingCardSet:setSpacing( 30 )
	CallingCardSet:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	CallingCardSet:setVerticalCounter( CoD.verticalCounter )
	CallingCardSet:setDataSource( "CallingCardSetBlackMarket" )
	CallingCardSet:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( CallingCardSet, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		if not IsGameTrial() then
			ProcessListAction( self, f3_arg0, f3_arg2, f3_arg1 )
			PlaySoundSetSound( self, "action" )
			return true
		else
			
		end
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		if not IsGameTrial() then
			CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( CallingCardSet )
	self.CallingCardSet = CallingCardSet
	
	CallingCardSet.id = "CallingCardSet"
	self.__defaultFocus = CallingCardSet
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.CallingCards_Set_BlackMarket.__onClose = function ( f5_arg0 )
	f5_arg0.CallingCardSet:close()
end

