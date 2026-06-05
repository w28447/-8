require( "ui/uieditor/widgets/hud/centerconsole/centerconsoleentry" )

CoD.CenterConsoleEntryContainer = InheritFrom( LUI.UIElement )
CoD.CenterConsoleEntryContainer.__defaultWidth = 1110
CoD.CenterConsoleEntryContainer.__defaultHeight = 33
CoD.CenterConsoleEntryContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CenterConsoleEntryContainer )
	self.id = "CenterConsoleEntryContainer"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	
	local ConsoleEntry = CoD.CenterConsoleEntry.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -39, 0 )
	ConsoleEntry:linkToElementModel( self, nil, false, function ( model )
		ConsoleEntry:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry )
	self.ConsoleEntry = ConsoleEntry
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local2 = self
	CoD.ConsoleUtility.EntryInit( self, f1_arg1, Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	return self
end

CoD.CenterConsoleEntryContainer.__onClose = function ( f3_arg0 )
	f3_arg0.ConsoleEntry:close()
end

