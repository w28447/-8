CoD.ZmNotif_frontLines02rotation = InheritFrom( LUI.UIElement )
CoD.ZmNotif_frontLines02rotation.__defaultWidth = 600
CoD.ZmNotif_frontLines02rotation.__defaultHeight = 600
CoD.ZmNotif_frontLines02rotation.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmNotif_frontLines02rotation )
	self.id = "ZmNotif_frontLines02rotation"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local frontlines02 = LUI.UIImage.new( 0, 0, 0, 600, 0, 0, 0, 600 )
	frontlines02:setImage( RegisterImage( 0x21FED2761DB51BB ) )
	self:addElement( frontlines02 )
	self.frontlines02 = frontlines02
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmNotif_frontLines02rotation.__resetProperties = function ( f2_arg0 )
	f2_arg0.frontlines02:completeAnimation()
	f2_arg0.frontlines02:setZRot( 0 )
end

CoD.ZmNotif_frontLines02rotation.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			local f3_local0 = function ( f4_arg0 )
				f3_arg0.frontlines02:beginAnimation( 10000 )
				f3_arg0.frontlines02:setZRot( -180 )
				f3_arg0.frontlines02:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.frontlines02:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
			end
			
			f3_arg0.frontlines02:completeAnimation()
			f3_arg0.frontlines02:setZRot( 0 )
			f3_local0( f3_arg0.frontlines02 )
			f3_arg0.nextClip = "DefaultClip"
		end
	}
}
