require( "ui/uieditor/widgets/hud/console/consoleentry" )

CoD.ConsoleEntryContainer = InheritFrom( LUI.UIElement )
CoD.ConsoleEntryContainer.__defaultWidth = 1020
CoD.ConsoleEntryContainer.__defaultHeight = 34
CoD.ConsoleEntryContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ConsoleEntryContainer )
	self.id = "ConsoleEntryContainer"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	
	local ConsoleEntry = CoD.ConsoleEntry.new( f1_arg0, f1_arg1, 0, 0, 0, 1020, 1, 1, -34, 0 )
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
	CoD.ConsoleUtility.EntryInit( self, f1_arg1, Enum.LUIAlignment[0x58C8A85F2048829] )
	return self
end

CoD.ConsoleEntryContainer.__onClose = function ( f3_arg0 )
	f3_arg0.ConsoleEntry:close()
end

