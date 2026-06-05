require( "ui/uieditor/widgets/common/commonlistbutton" )
require( "ui/uieditor/widgets/pc/utility/verticallistspacer" )
require( "x64:ddfe0d4a3fb5310" )

CoD.Social_OptionsButtonList = InheritFrom( LUI.UIElement )
CoD.Social_OptionsButtonList.__defaultWidth = 566
CoD.Social_OptionsButtonList.__defaultHeight = 561
CoD.Social_OptionsButtonList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIVerticalList.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9, 0, false )
	self:setAlignment( LUI.Alignment.Top )
	self:setClass( CoD.Social_OptionsButtonList )
	self.id = "Social_OptionsButtonList"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonFrameTop = CoD.Social_playerDetailButton_frame.new( f1_arg0, f1_arg1, 0, 0, 0, 566, 0, 0, 0, 12 )
	ButtonFrameTop:setAlpha( 0 )
	self:addElement( ButtonFrameTop )
	self.ButtonFrameTop = ButtonFrameTop
	
	local VerticalListSpacer = CoD.VerticalListSpacer.new( f1_arg0, f1_arg1, 0, 0, -92, 658, 0, 0, 12, 54 )
	self:addElement( VerticalListSpacer )
	self.VerticalListSpacer = VerticalListSpacer
	
	local options = LUI.UIList.new( f1_arg0, f1_arg1, 12, 0, nil, false, false, false, false )
	options:setLeftRight( 0.5, 0.5, -258, 102 )
	options:setTopBottom( 0, 0, 54, 614 )
	options:setWidgetType( CoD.CommonListButton )
	options:setVerticalCount( 11 )
	options:setSpacing( 12 )
	options:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	options:setDataSource( "SocialPlayerDetailsButtons" )
	options:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F] )
		return f2_local0
	end )
	f1_arg0:AddButtonCallbackFunction( options, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], "ui_confirm", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller, menu )
		PlaySoundAlias( "uin_toggle_generic" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x755DA1E2E7C263F], "menu/select", nil, "ui_confirm" )
		return true
	end, false )
	self:addElement( options )
	self.options = options
	
	local VerticalListSpacer2 = CoD.VerticalListSpacer.new( f1_arg0, f1_arg1, 0, 0, -92, 658, 0, 0, 614, 656 )
	self:addElement( VerticalListSpacer2 )
	self.VerticalListSpacer2 = VerticalListSpacer2
	
	local ButtonFrameBot = CoD.Social_playerDetailButton_frame.new( f1_arg0, f1_arg1, 0, 0, 0, 566, 0, 0, 656, 668 )
	ButtonFrameBot:setAlpha( 0 )
	ButtonFrameBot:setZRot( 180 )
	self:addElement( ButtonFrameBot )
	self.ButtonFrameBot = ButtonFrameBot
	
	options.id = "options"
	self.__defaultFocus = options
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.Social_OptionsButtonList.__onClose = function ( f5_arg0 )
	f5_arg0.ButtonFrameTop:close()
	f5_arg0.VerticalListSpacer:close()
	f5_arg0.options:close()
	f5_arg0.VerticalListSpacer2:close()
	f5_arg0.ButtonFrameBot:close()
end

