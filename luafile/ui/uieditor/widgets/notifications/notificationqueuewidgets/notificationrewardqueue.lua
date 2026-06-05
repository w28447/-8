CoD.NotificationRewardQueue = InheritFrom( LUI.UIElement )
CoD.NotificationRewardQueue.__defaultWidth = 1920
CoD.NotificationRewardQueue.__defaultHeight = 1080
CoD.NotificationRewardQueue.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.NotificationRewardQueue )
	self.id = "NotificationRewardQueue"
	self.soundSet = "default"
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local1 = self
	CoD.NotificationUtility.RewardQueuePostLoad( self, f1_arg1, f1_arg0 )
	return self
end

