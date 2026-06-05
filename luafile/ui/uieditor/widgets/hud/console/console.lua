require( "ui/uieditor/widgets/hud/console/consoleentrycontainer" )

CoD.Console = InheritFrom( LUI.UIElement )
CoD.Console.__defaultWidth = 1020
CoD.Console.__defaultHeight = 150
CoD.Console.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Console )
	self.id = "Console"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local ConsoleEntry0 = CoD.ConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1020, 1, 1, -30, 4 )
	ConsoleEntry0:subscribeToGlobalModel( f1_arg1, "HUDItems", "console.line0", function ( model )
		ConsoleEntry0:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry0 )
	self.ConsoleEntry0 = ConsoleEntry0
	
	local ConsoleEntry1 = CoD.ConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1020, 1, 1, -30, 4 )
	ConsoleEntry1:subscribeToGlobalModel( f1_arg1, "HUDItems", "console.line1", function ( model )
		ConsoleEntry1:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry1 )
	self.ConsoleEntry1 = ConsoleEntry1
	
	local ConsoleEntry2 = CoD.ConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1020, 1, 1, -30, 4 )
	ConsoleEntry2:subscribeToGlobalModel( f1_arg1, "HUDItems", "console.line2", function ( model )
		ConsoleEntry2:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry2 )
	self.ConsoleEntry2 = ConsoleEntry2
	
	local ConsoleEntry3 = CoD.ConsoleEntryContainer.new( f1_arg0, f1_arg1, 0, 0, 0, 1020, 1, 1, -30, 4 )
	ConsoleEntry3:subscribeToGlobalModel( f1_arg1, "HUDItems", "console.line3", function ( model )
		ConsoleEntry3:setModel( model, f1_arg1 )
	end )
	self:addElement( ConsoleEntry3 )
	self.ConsoleEntry3 = ConsoleEntry3
	
	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local5 = self
	CoD.ConsoleUtility.Init( self, f1_arg1, "console", 3, 8 )
	return self
end

CoD.Console.__resetProperties = function ( f7_arg0 )
	f7_arg0.ConsoleEntry3:completeAnimation()
	f7_arg0.ConsoleEntry2:completeAnimation()
	f7_arg0.ConsoleEntry1:completeAnimation()
	f7_arg0.ConsoleEntry0:completeAnimation()
	f7_arg0.ConsoleEntry3:setAlpha( 1 )
	f7_arg0.ConsoleEntry2:setAlpha( 1 )
	f7_arg0.ConsoleEntry1:setAlpha( 1 )
	f7_arg0.ConsoleEntry0:setAlpha( 1 )
end

CoD.Console.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties()
			f8_arg0:setupElementClipCounter( 0 )
		end
	},
	HideForCodCaster = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 4 )
			f9_arg0.ConsoleEntry0:completeAnimation()
			f9_arg0.ConsoleEntry0:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.ConsoleEntry0 )
			f9_arg0.ConsoleEntry1:completeAnimation()
			f9_arg0.ConsoleEntry1:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.ConsoleEntry1 )
			f9_arg0.ConsoleEntry2:completeAnimation()
			f9_arg0.ConsoleEntry2:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.ConsoleEntry2 )
			f9_arg0.ConsoleEntry3:completeAnimation()
			f9_arg0.ConsoleEntry3:setAlpha( 0 )
			f9_arg0.clipFinished( f9_arg0.ConsoleEntry3 )
		end
	}
}
CoD.Console.__onClose = function ( f10_arg0 )
	f10_arg0.ConsoleEntry0:close()
	f10_arg0.ConsoleEntry1:close()
	f10_arg0.ConsoleEntry2:close()
	f10_arg0.ConsoleEntry3:close()
end

