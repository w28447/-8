require( "ui/uieditor/widgets/scoreboard/zm/scoreboardrowbase" )

CoD.ScoreboardRowBackgroundZM = InheritFrom( LUI.UIElement )
CoD.ScoreboardRowBackgroundZM.__defaultWidth = 176
CoD.ScoreboardRowBackgroundZM.__defaultHeight = 60
CoD.ScoreboardRowBackgroundZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreboardRowBackgroundZM )
	self.id = "ScoreboardRowBackgroundZM"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Base = CoD.ScoreboardRowBase.new( f1_arg0, f1_arg1, 0, 1, 0, 0, 0, 1, 0, 0 )
	Base:setRGB( 0, 0, 0 )
	self:addElement( Base )
	self.Base = Base
	
	local TextureMid = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TextureMid:setAlpha( 0.5 )
	TextureMid:setImage( RegisterImage( "uie_zm_hud_inventory_backing_mid" ) )
	self:addElement( TextureMid )
	self.TextureMid = TextureMid
	
	local TextureMidAdd = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	TextureMidAdd:setAlpha( 0 )
	TextureMidAdd:setImage( RegisterImage( "uie_zm_hud_inventory_backing_mid" ) )
	TextureMidAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureMidAdd )
	self.TextureMidAdd = TextureMidAdd
	
	local TextureTip = LUI.UIImage.new( 0, 0, -40, 104, 0.5, 0.5, -30, 30 )
	TextureTip:setAlpha( 0.6 )
	TextureTip:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip" ) )
	self:addElement( TextureTip )
	self.TextureTip = TextureTip
	
	local TextureEnd = LUI.UIImage.new( 1, 1, -104, 40, 0.5, 0.5, -30, 30 )
	TextureEnd:setAlpha( 0.6 )
	TextureEnd:setYRot( 180 )
	TextureEnd:setImage( RegisterImage( "uie_zm_hud_inventory_backing_tip" ) )
	self:addElement( TextureEnd )
	self.TextureEnd = TextureEnd
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreboardRowBackgroundZM.__resetProperties = function ( f2_arg0 )
	f2_arg0.TextureMidAdd:completeAnimation()
	f2_arg0.TextureMidAdd:setAlpha( 0 )
end

CoD.ScoreboardRowBackgroundZM.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f3_arg0, f3_arg1 )
			f3_arg0:__resetProperties()
			f3_arg0:setupElementClipCounter( 1 )
			local f3_local0 = function ( f4_arg0 )
				local f4_local0 = function ( f5_arg0 )
					local f5_local0 = function ( f6_arg0 )
						local f6_local0 = function ( f7_arg0 )
							f7_arg0:beginAnimation( 1000 )
							f7_arg0:setAlpha( 0 )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f3_arg0.clipFinished )
						end
						
						f6_arg0:beginAnimation( 1000 )
						f6_arg0:setAlpha( 0.3 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
					
					f5_arg0:beginAnimation( 1000 )
					f5_arg0:setAlpha( 0 )
					f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
				end
				
				f3_arg0.TextureMidAdd:beginAnimation( 1000 )
				f3_arg0.TextureMidAdd:setAlpha( 0.5 )
				f3_arg0.TextureMidAdd:registerEventHandler( "interrupted_keyframe", f3_arg0.clipInterrupted )
				f3_arg0.TextureMidAdd:registerEventHandler( "transition_complete_keyframe", f4_local0 )
			end
			
			f3_arg0.TextureMidAdd:completeAnimation()
			f3_arg0.TextureMidAdd:setAlpha( 0 )
			f3_local0( f3_arg0.TextureMidAdd )
			f3_arg0.nextClip = "DefaultClip"
		end
	}
}
CoD.ScoreboardRowBackgroundZM.__onClose = function ( f8_arg0 )
	f8_arg0.Base:close()
end

