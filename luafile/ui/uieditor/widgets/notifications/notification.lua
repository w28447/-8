require( "ui/uieditor/widgets/notifications/medals/notification_medals" )
require( "ui/uieditor/widgets/notifications/notificationqueue" )
require( "ui/uieditor/widgets/notifications/perks/notificationperkscontainer" )

CoD.Notification = InheritFrom( LUI.UIElement )
CoD.Notification.__defaultWidth = 1920
CoD.Notification.__defaultHeight = 1080
CoD.Notification.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.Notification )
	self.id = "Notification"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local PreMatchTimer = LUI.UIText.new( 0.5, 0.5, -101, 101, 0, 0, 449, 539 )
	PreMatchTimer:setAlpha( 0 )
	PreMatchTimer:setTTF( "default" )
	PreMatchTimer:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	self:addElement( PreMatchTimer )
	self.PreMatchTimer = PreMatchTimer
	
	local NotificationPerksContainer = CoD.NotificationPerksContainer.new( f1_arg0, f1_arg1, 1, 1, -851, -57, 1, 1, -779, -485 )
	self:addElement( NotificationPerksContainer )
	self.NotificationPerksContainer = NotificationPerksContainer
	
	local Medals = CoD.Notification_Medals.new( f1_arg0, f1_arg1, 0.5, 0.5, -384, 384, 0, 0, 0.5, 267.5 )
	Medals:setAlpha( 0 )
	self:addElement( Medals )
	self.Medals = Medals
	
	local NotificationQueueWidget = CoD.NotificationQueue.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( NotificationQueueWidget )
	self.NotificationQueueWidget = NotificationQueueWidget
	
	self:mergeStateConditions( {
		{
			stateName = "ShowMedals",
			condition = function ( menu, element, event )
				local f2_local0
				if not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x1CDCB451655ABCF] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x198075B069840DC] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x8A5E996D4528DA2] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0x24E603C16FCC38F] ) and not Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) then
					f2_local0 = not CoD.CodCasterUtility.CodCasterEnabledAndProfileVarEqualTo( f1_arg1, "shoutcaster_ds_playernotifications", false )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		}
	} )
	local f1_local5 = self
	local f1_local6 = self.subscribeToModel
	local f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x1CDCB451655ABCF]
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]], function ( f4_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x198075B069840DC]
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]], function ( f5_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f5_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x8A5E996D4528DA2]
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]], function ( f6_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0x24E603C16FCC38F]
		} )
	end, false )
	f1_local5 = self
	f1_local6 = self.subscribeToModel
	f1_local7 = Engine.GetModelForController( f1_arg1 )
	f1_local6( f1_local5, f1_local7["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f7_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.Notification.__resetProperties = function ( f8_arg0 )
	f8_arg0.Medals:completeAnimation()
	f8_arg0.Medals:setAlpha( 0 )
end

CoD.Notification.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties()
			f9_arg0:setupElementClipCounter( 0 )
		end
	},
	ShowMedals = {
		DefaultClip = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties()
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.Medals:completeAnimation()
			f10_arg0.Medals:setAlpha( 1 )
			f10_arg0.clipFinished( f10_arg0.Medals )
		end
	}
}
CoD.Notification.__onClose = function ( f11_arg0 )
	f11_arg0.NotificationPerksContainer:close()
	f11_arg0.Medals:close()
	f11_arg0.NotificationQueueWidget:close()
end

