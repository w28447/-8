require( "ui/uieditor/widgets/hud/centerconsole/centerconsoleentrycontainer" )

CoD.CenterConsole = InheritFrom( LUI.UIElement )
CoD.CenterConsole.__defaultWidth = 1110
CoD.CenterConsole.__defaultHeight = 147
CoD.CenterConsole.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.CenterConsole )
	self.id = "CenterConsole"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	
	local ConsoleEntry0 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry0:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line0", function ( model )
		ConsoleEntry0:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry0 )
	self.ConsoleEntry0 = ConsoleEntry0
	
	local ConsoleEntry1 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry1:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line1", function ( model )
		ConsoleEntry1:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry1 )
	self.ConsoleEntry1 = ConsoleEntry1
	
	local ConsoleEntry2 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry2:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line2", function ( model )
		ConsoleEntry2:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry2 )
	self.ConsoleEntry2 = ConsoleEntry2
	
	local ConsoleEntry3 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry3:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line3", function ( model )
		ConsoleEntry3:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry3 )
	self.ConsoleEntry3 = ConsoleEntry3
	
	local ConsoleEntry4 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry4:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line4", function ( model )
		ConsoleEntry4:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry4 )
	self.ConsoleEntry4 = ConsoleEntry4
	
	local ConsoleEntry5 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry5:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line5", function ( model )
		ConsoleEntry5:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry5 )
	self.ConsoleEntry5 = ConsoleEntry5
	
	local ConsoleEntry6 = CoD.CenterConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1110, 1, 1, -30, 0 )
	ConsoleEntry6:subscribeToGlobalModel( f1_arg1, "HUDItems", "centerConsole.line6", function ( model )
		ConsoleEntry6:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry6 )
	self.ConsoleEntry6 = ConsoleEntry6
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PreLoadFunc then
		PreLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local8 = self
	if IsMultiplayer() then
		CoD.ConsoleUtility.Init( self, f1_arg1, "centerConsole", 0, 0 )
	else
		CoD.ConsoleUtility.Init( self, f1_arg1, "centerConsole", nil, 6 )
	end
	return self
end

CoD.CenterConsole.__onClose = function ( f9_arg0 )
	f9_arg0.ConsoleEntry0:close()
	f9_arg0.ConsoleEntry1:close()
	f9_arg0.ConsoleEntry2:close()
	f9_arg0.ConsoleEntry3:close()
	f9_arg0.ConsoleEntry4:close()
	f9_arg0.ConsoleEntry5:close()
	f9_arg0.ConsoleEntry6:close()
end

