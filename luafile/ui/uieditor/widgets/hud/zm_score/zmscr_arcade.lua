require( "ui/uieditor/widgets/hud/zm_score/zmscrarcade_listing" )

CoD.ZMScr_Arcade = InheritFrom( LUI.UIElement )
CoD.ZMScr_Arcade.__defaultWidth = 201
CoD.ZMScr_Arcade.__defaultHeight = 192
CoD.ZMScr_Arcade.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	if CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" ) then
		CoD.ZombieUtility.SetupZMPlayerListModel( self, f1_arg1 )
	end
	self:setClass( CoD.ZMScr_Arcade )
	self.id = "ZMScr_Arcade"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Listing1 = CoD.ZMScrArcade_Listing.new( f1_arg0, f1_arg1, 0, 0, 56, 252, 0, 0, 142, 230 )
	Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f1_arg1, 1 ) )
	Listing1:subscribeToGlobalModel( f1_arg1, "PlayerListZM", "0", function ( model )
		Listing1:setModel( model, f1_arg1 )
	end )
	self:addElement( Listing1 )
	self.Listing1 = Listing1
	
	local Listing2 = CoD.ZMScrArcade_Listing.new( f1_arg0, f1_arg1, 0, 0, 56, 252, 0, 0, 52, 140 )
	Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f1_arg1, 1 ) )
	Listing2:subscribeToGlobalModel( f1_arg1, "PlayerListZM", "1", function ( model )
		Listing2:setModel( model, f1_arg1 )
	end )
	self:addElement( Listing2 )
	self.Listing2 = Listing2
	
	local Listing3 = CoD.ZMScrArcade_Listing.new( f1_arg0, f1_arg1, 0, 0, 56, 252, 0, 0, -38, 50 )
	Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f1_arg1, 1 ) )
	Listing3:subscribeToGlobalModel( f1_arg1, "PlayerListZM", "2", function ( model )
		Listing3:setModel( model, f1_arg1 )
	end )
	self:addElement( Listing3 )
	self.Listing3 = Listing3
	
	local Listing4 = CoD.ZMScrArcade_Listing.new( f1_arg0, f1_arg1, 0, 0, 56, 252, 0, 0, -128, -40 )
	Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f1_arg1, 1 ) )
	Listing4:subscribeToGlobalModel( f1_arg1, "PlayerListZM", "3", function ( model )
		Listing4:setModel( model, f1_arg1 )
	end )
	self:addElement( Listing4 )
	self.Listing4 = Listing4
	
	Listing1.id = "Listing1"
	Listing2.id = "Listing2"
	Listing3.id = "Listing3"
	Listing4.id = "Listing4"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local5 = self
	if CoD.HUDUtility.IsAnyGameType( f1_arg1, "zstandard" ) then
		ClearResetPropertiesFunc( self, f1_arg1 )
		CoD.ZombieUtility.AddUpdateOrderHandlingForZMRushPlayercards( self, f1_arg1 )
	end
	return self
end

CoD.ZMScr_Arcade.__resetProperties = function ( f6_arg0, f6_arg1 )
	f6_arg0.Listing4:completeAnimation()
	f6_arg0.Listing3:completeAnimation()
	f6_arg0.Listing2:completeAnimation()
	f6_arg0.Listing1:completeAnimation()
	f6_arg0.Listing4:setTopBottom( 0, 0, -128, -40 )
	f6_arg0.Listing4:setAlpha( 1 )
	f6_arg0.Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f6_arg1, 1 ) )
	f6_arg0.Listing3:setTopBottom( 0, 0, -38, 50 )
	f6_arg0.Listing3:setAlpha( 1 )
	f6_arg0.Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f6_arg1, 1 ) )
	f6_arg0.Listing2:setTopBottom( 0, 0, 52, 140 )
	f6_arg0.Listing2:setAlpha( 1 )
	f6_arg0.Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f6_arg1, 1 ) )
	f6_arg0.Listing1:setTopBottom( 0, 0, 142, 230 )
	f6_arg0.Listing1:setAlpha( 1 )
	f6_arg0.Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f6_arg1, 1 ) )
end

CoD.ZMScr_Arcade.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f7_arg0, f7_arg1 )
			f7_arg0:__resetProperties( f7_arg1 )
			f7_arg0:setupElementClipCounter( 4 )
			f7_arg0.Listing1:completeAnimation()
			f7_arg0.Listing1:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Listing1 )
			f7_arg0.Listing2:completeAnimation()
			f7_arg0.Listing2:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Listing2 )
			f7_arg0.Listing3:completeAnimation()
			f7_arg0.Listing3:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Listing3 )
			f7_arg0.Listing4:completeAnimation()
			f7_arg0.Listing4:setAlpha( 0 )
			f7_arg0.clipFinished( f7_arg0.Listing4 )
		end
	},
	Hidden = {
		DefaultClip = function ( f8_arg0, f8_arg1 )
			f8_arg0:__resetProperties( f8_arg1 )
			f8_arg0:setupElementClipCounter( 4 )
			f8_arg0.Listing1:completeAnimation()
			f8_arg0.Listing1:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Listing1 )
			f8_arg0.Listing2:completeAnimation()
			f8_arg0.Listing2:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Listing2 )
			f8_arg0.Listing3:completeAnimation()
			f8_arg0.Listing3:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Listing3 )
			f8_arg0.Listing4:completeAnimation()
			f8_arg0.Listing4:setAlpha( 0 )
			f8_arg0.clipFinished( f8_arg0.Listing4 )
		end
	},
	HudStart = {
		DefaultClip = function ( f9_arg0, f9_arg1 )
			f9_arg0:__resetProperties( f9_arg1 )
			f9_arg0:setupElementClipCounter( 4 )
			f9_arg0.Listing1:completeAnimation()
			f9_arg0.Listing1:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.Listing1 )
			f9_arg0.Listing2:completeAnimation()
			f9_arg0.Listing2:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.Listing2 )
			f9_arg0.Listing3:completeAnimation()
			f9_arg0.Listing3:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.Listing3 )
			f9_arg0.Listing4:completeAnimation()
			f9_arg0.Listing4:setAlpha( 1 )
			f9_arg0.clipFinished( f9_arg0.Listing4 )
		end,
		Client0Pos3 = function ( f10_arg0, f10_arg1 )
			f10_arg0:__resetProperties( f10_arg1 )
			f10_arg0:setupElementClipCounter( 1 )
			f10_arg0.Listing1:completeAnimation()
			f10_arg0.Listing1.PositionText.PositionText:completeAnimation()
			f10_arg0.Listing1:setTopBottom( 0, 0, 131, 219 )
			f10_arg0.Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f10_arg1, 4 ) )
			f10_arg0.clipFinished( f10_arg0.Listing1 )
		end,
		Client0Pos2 = function ( f11_arg0, f11_arg1 )
			f11_arg0:__resetProperties( f11_arg1 )
			f11_arg0:setupElementClipCounter( 1 )
			f11_arg0.Listing1:completeAnimation()
			f11_arg0.Listing1.PositionText.PositionText:completeAnimation()
			f11_arg0.Listing1:setTopBottom( 0, 0, 41, 129 )
			f11_arg0.Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f11_arg1, 3 ) )
			f11_arg0.clipFinished( f11_arg0.Listing1 )
		end,
		Client0Pos1 = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties( f12_arg1 )
			f12_arg0:setupElementClipCounter( 1 )
			f12_arg0.Listing1:completeAnimation()
			f12_arg0.Listing1.PositionText.PositionText:completeAnimation()
			f12_arg0.Listing1:setTopBottom( 0, 0, -49, 39 )
			f12_arg0.Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f12_arg1, 2 ) )
			f12_arg0.clipFinished( f12_arg0.Listing1 )
		end,
		Client0Pos0 = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties( f13_arg1 )
			f13_arg0:setupElementClipCounter( 1 )
			f13_arg0.Listing1:completeAnimation()
			f13_arg0.Listing1.PositionText.PositionText:completeAnimation()
			f13_arg0.Listing1:setTopBottom( 0, 0, -139, -51 )
			f13_arg0.Listing1.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f13_arg1, 1 ) )
			f13_arg0.clipFinished( f13_arg0.Listing1 )
		end,
		Client1Pos3 = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties( f14_arg1 )
			f14_arg0:setupElementClipCounter( 1 )
			f14_arg0.Listing2:completeAnimation()
			f14_arg0.Listing2.PositionText.PositionText:completeAnimation()
			f14_arg0.Listing2:setTopBottom( 0, 0, 140, 228 )
			f14_arg0.Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f14_arg1, 4 ) )
			f14_arg0.clipFinished( f14_arg0.Listing2 )
		end,
		Client1Pos2 = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties( f15_arg1 )
			f15_arg0:setupElementClipCounter( 1 )
			f15_arg0.Listing2:completeAnimation()
			f15_arg0.Listing2.PositionText.PositionText:completeAnimation()
			f15_arg0.Listing2:setTopBottom( 0, 0, 50, 138 )
			f15_arg0.Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f15_arg1, 3 ) )
			f15_arg0.clipFinished( f15_arg0.Listing2 )
		end,
		Client1Pos1 = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties( f16_arg1 )
			f16_arg0:setupElementClipCounter( 1 )
			f16_arg0.Listing2:completeAnimation()
			f16_arg0.Listing2.PositionText.PositionText:completeAnimation()
			f16_arg0.Listing2:setTopBottom( 0, 0, -40, 48 )
			f16_arg0.Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f16_arg1, 2 ) )
			f16_arg0.clipFinished( f16_arg0.Listing2 )
		end,
		Client1Pos0 = function ( f17_arg0, f17_arg1 )
			f17_arg0:__resetProperties( f17_arg1 )
			f17_arg0:setupElementClipCounter( 1 )
			f17_arg0.Listing2:completeAnimation()
			f17_arg0.Listing2.PositionText.PositionText:completeAnimation()
			f17_arg0.Listing2:setTopBottom( 0, 0, -130, -42 )
			f17_arg0.Listing2.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f17_arg1, 1 ) )
			f17_arg0.clipFinished( f17_arg0.Listing2 )
		end,
		Client2Pos3 = function ( f18_arg0, f18_arg1 )
			f18_arg0:__resetProperties( f18_arg1 )
			f18_arg0:setupElementClipCounter( 1 )
			f18_arg0.Listing3:completeAnimation()
			f18_arg0.Listing3.PositionText.PositionText:completeAnimation()
			f18_arg0.Listing3:setTopBottom( 0, 0, 140, 228 )
			f18_arg0.Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f18_arg1, 4 ) )
			f18_arg0.clipFinished( f18_arg0.Listing3 )
		end,
		Client2Pos2 = function ( f19_arg0, f19_arg1 )
			f19_arg0:__resetProperties( f19_arg1 )
			f19_arg0:setupElementClipCounter( 1 )
			f19_arg0.Listing3:completeAnimation()
			f19_arg0.Listing3.PositionText.PositionText:completeAnimation()
			f19_arg0.Listing3:setTopBottom( 0, 0, 50, 138 )
			f19_arg0.Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f19_arg1, 3 ) )
			f19_arg0.clipFinished( f19_arg0.Listing3 )
		end,
		Client2Pos1 = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties( f20_arg1 )
			f20_arg0:setupElementClipCounter( 1 )
			f20_arg0.Listing3:completeAnimation()
			f20_arg0.Listing3.PositionText.PositionText:completeAnimation()
			f20_arg0.Listing3:setTopBottom( 0, 0, -40, 48 )
			f20_arg0.Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f20_arg1, 2 ) )
			f20_arg0.clipFinished( f20_arg0.Listing3 )
		end,
		Client2Pos0 = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties( f21_arg1 )
			f21_arg0:setupElementClipCounter( 1 )
			f21_arg0.Listing3:completeAnimation()
			f21_arg0.Listing3.PositionText.PositionText:completeAnimation()
			f21_arg0.Listing3:setTopBottom( 0, 0, -130, -42 )
			f21_arg0.Listing3.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f21_arg1, 1 ) )
			f21_arg0.clipFinished( f21_arg0.Listing3 )
		end,
		Client3Pos3 = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties( f22_arg1 )
			f22_arg0:setupElementClipCounter( 1 )
			f22_arg0.Listing4:completeAnimation()
			f22_arg0.Listing4.PositionText.PositionText:completeAnimation()
			f22_arg0.Listing4:setTopBottom( 0, 0, 140, 228 )
			f22_arg0.Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f22_arg1, 4 ) )
			f22_arg0.clipFinished( f22_arg0.Listing4 )
		end,
		Client3Pos2 = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties( f23_arg1 )
			f23_arg0:setupElementClipCounter( 1 )
			f23_arg0.Listing4:completeAnimation()
			f23_arg0.Listing4.PositionText.PositionText:completeAnimation()
			f23_arg0.Listing4:setTopBottom( 0, 0, 50, 138 )
			f23_arg0.Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f23_arg1, 3 ) )
			f23_arg0.clipFinished( f23_arg0.Listing4 )
		end,
		Client3Pos1 = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties( f24_arg1 )
			f24_arg0:setupElementClipCounter( 1 )
			f24_arg0.Listing4:completeAnimation()
			f24_arg0.Listing4.PositionText.PositionText:completeAnimation()
			f24_arg0.Listing4:setTopBottom( 0, 0, -40, 48 )
			f24_arg0.Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f24_arg1, 2 ) )
			f24_arg0.clipFinished( f24_arg0.Listing4 )
		end,
		Client3Pos0 = function ( f25_arg0, f25_arg1 )
			f25_arg0:__resetProperties( f25_arg1 )
			f25_arg0:setupElementClipCounter( 1 )
			f25_arg0.Listing4:completeAnimation()
			f25_arg0.Listing4.PositionText.PositionText:completeAnimation()
			f25_arg0.Listing4:setTopBottom( 0, 0, -130, -42 )
			f25_arg0.Listing4.PositionText.PositionText:setText( CoD.ZombieUtility.GetZombiesRushPositionForIndex( f25_arg1, 1 ) )
			f25_arg0.clipFinished( f25_arg0.Listing4 )
		end
	}
}
CoD.ZMScr_Arcade.__onClose = function ( f26_arg0 )
	f26_arg0.Listing1:close()
	f26_arg0.Listing2:close()
	f26_arg0.Listing3:close()
	f26_arg0.Listing4:close()
end

