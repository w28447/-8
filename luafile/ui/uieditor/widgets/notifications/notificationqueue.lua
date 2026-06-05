require( "ui/uieditor/widgets/notifications/notificationqueuewidgets/notificationrewardqueue" )

CoD.NotificationQueue = InheritFrom( LUI.UIElement )
CoD.NotificationQueue.__defaultWidth = 1920
CoD.NotificationQueue.__defaultHeight = 1080
CoD.NotificationQueue.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.NotificationQueue )
	self.id = "NotificationQueue"
	self.soundSet = "default"
	
	local NotificationRewardQueue = CoD.NotificationRewardQueue.new( f1_arg0, f1_arg1, 1, 1, -894, -30, 0, 0, 213, 510 )
	self:addElement( NotificationRewardQueue )
	self.NotificationRewardQueue = NotificationRewardQueue
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local2 = self
	CoD.NotificationUtility.InitNotifications( self, f1_arg1, f1_arg0 )
	return self
end

CoD.NotificationQueue.__onClose = function ( f2_arg0 )
	f2_arg0.NotificationRewardQueue:close()
end

