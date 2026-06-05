require( "ui/uieditor/widgets/dynamiccontainerwidget" )
require( "ui/uieditor/widgets/hud/centerconsole/centerconsole" )
require( "ui/uieditor/widgets/hud/deadspectate/deadspectate" )
require( "ui/uieditor/widgets/hud/zm_cursorhint/zmcursorhint" )
require( "ui/uieditor/widgets/mphudwidgets/scorepopup/mpscr" )
require( "x64:b4608168bbee1cb" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_factory_safeareacontainer" )
require( "ui/uieditor/widgets/zmhudwidgets/hud_zm_serverpausenotification" )
require( "ui/uieditor/widgets/zmhudwidgets/inventory/zminventory" )
require( "x64:13012bca0fbd2f4" )
require( "x64:c0887595cfb6bb1" )

CoD.T7Hud_zm_factory = InheritFrom( CoD.Menu )
LUI.createMenu.T7Hud_zm_factory = function ( f1_arg0, f1_arg1 )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_factory", f1_arg0 )
	local f1_local1 = self
	CoD.BlackMarketUtility.InitInGameContractRecord( f1_arg0, f1_local1 )
	self:setClass( CoD.T7Hud_zm_factory )
	self.soundSet = "HUD"
	self:setOwner( f1_arg0 )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", f1_arg0 )
	self.anyChildUsesUpdateState = true
	f1_local1:addElementToPendingUpdateStateList( self )
	
	local OverheadNameContainer = CoD.DynamicContainerWidget.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( OverheadNameContainer )
	self.OverheadNameContainer = OverheadNameContainer
	
	local SafeAreaContainer = CoD.Hud_ZM_Factory_SafeAreaContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	SafeAreaContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if element.menuLoaded then
			f2_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f2_local0 = element.super:menuLoaded( event )
		end
		if not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( SafeAreaContainer )
	self.SafeAreaContainer = SafeAreaContainer
	
	local fullscreenContainer = CoD.DynamicContainerWidget.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( fullscreenContainer )
	self.fullscreenContainer = fullscreenContainer
	
	local CursorHint = CoD.ZMCursorHint.new( f1_local1, f1_arg0, 0.5, 0.5, -375, 375, 0.8, 0.8, -81, 60 )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local DamageFeedback = CoD.MPDamageFeedback.new( f1_local1, f1_arg0, 0.5, 0.5, -30, 30, 0.5, 0.5, -30, 30 )
	DamageFeedback:subscribeToGlobalModel( f1_arg0, "CurrentWeapon", nil, function ( model )
		DamageFeedback:setModel( model, f1_arg0 )
	end )
	self:addElement( DamageFeedback )
	self.DamageFeedback = DamageFeedback
	
	local ConsoleCenter = CoD.CenterConsole.new( f1_local1, f1_arg0, 0.5, 0.5, -555, 555, 0, 0, 102.5, 249.5 )
	self:addElement( ConsoleCenter )
	self.ConsoleCenter = ConsoleCenter
	
	local DeadSpectate = CoD.DeadSpectate.new( f1_local1, f1_arg0, 0.5, 0.5, -225, 225, 1, 1, -270, -180 )
	self:addElement( DeadSpectate )
	self.DeadSpectate = DeadSpectate
	
	local MPScore = CoD.MPScr.new( f1_local1, f1_arg0, 0.5, 0.5, -75, 75, 0, 0, 350, 388 )
	MPScore:subscribeToGlobalModel( f1_arg0, "PerController", "scriptNotify", function ( model )
		local f4_local0 = MPScore
		if CoD.ModelUtility.IsParamModelEqualToHashString( model, "score_event" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, f1_arg0 )
			SetMPScoreText( f1_local1, f4_local0, f1_arg0, model )
		end
	end )
	self:addElement( MPScore )
	self.MPScore = MPScore
	
	local WaypointContainer = CoD.DynamicContainerWidget.new( f1_local1, f1_arg0, 0, 1, 0, 0, 0, 1, 0, 0 )
	self:addElement( WaypointContainer )
	self.WaypointContainer = WaypointContainer
	
	local ZMInventory = CoD.ZMInventory.new( f1_local1, f1_arg0, 0.5, 0.5, -960, 960, 0.5, 0.5, -540, 540 )
	ZMInventory:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		if element.menuLoaded then
			f5_local0 = element:menuLoaded( event )
		elseif element.super.menuLoaded then
			f5_local0 = element.super:menuLoaded( event )
		end
		if IsLowAspectRatio( f1_arg0 ) and not IsPC() then
			SizeToSafeArea( element, f1_arg0 )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( ZMInventory )
	self.ZMInventory = ZMInventory
	
	local PCNotifContainer = nil
	
	PCNotifContainer = CoD.PC_Notif_Container.new( f1_local1, f1_arg0, 0.5, 0.5, 470, 920, 0, 0, 106, 206 )
	self:addElement( PCNotifContainer )
	self.PCNotifContainer = PCNotifContainer
	
	local FrontendBattlenetContainer = nil
	
	FrontendBattlenetContainer = CoD.FrontendBattlenetContainer.new( f1_local1, f1_arg0, 0.5, 0.5, -795.5, -359.5, 1, 1, -841, -61 )
	self:addElement( FrontendBattlenetContainer )
	self.FrontendBattlenetContainer = FrontendBattlenetContainer
	
	local HUDZMServerPauseNotification = CoD.HUD_ZM_ServerPauseNotification.new( f1_local1, f1_arg0, 0.5, 0.5, -1920, 1920, 0.5, 0.5, -540, 540 )
	self:addElement( HUDZMServerPauseNotification )
	self.HUDZMServerPauseNotification = HUDZMServerPauseNotification
	
	self:mergeStateConditions( {
		{
			stateName = "Trials_HUDDeactivated",
			condition = function ( menu, element, event )
				local f6_local0 = CoD.HUDUtility.IsAnyGameType( f1_arg0, "ztrials" )
				if f6_local0 then
					f6_local0 = CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.hudDeactivated", 1 )
					if f6_local0 then
						f6_local0 = not CoD.ModelUtility.IsGlobalModelValueTrue( "ZMHudGlobal.trials.infoHidden" )
					end
				end
				return f6_local0
			end
		}
	} )
	local f1_local15 = self
	local f1_local16 = self.subscribeToModel
	local f1_local17 = Engine.GetGlobalModel()
	f1_local16( f1_local15, f1_local17["ZMHudGlobal.trials.hudDeactivated"], function ( f7_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f7_arg0:get(),
			modelName = "ZMHudGlobal.trials.hudDeactivated"
		} )
	end, false )
	f1_local15 = self
	f1_local16 = self.subscribeToModel
	f1_local17 = Engine.GetGlobalModel()
	f1_local16( f1_local15, f1_local17["ZMHudGlobal.trials.infoHidden"], function ( f8_arg0 )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			controller = f1_arg0,
			modelValue = f8_arg0:get(),
			modelName = "ZMHudGlobal.trials.infoHidden"
		} )
	end, false )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f9_local0 = nil
		if self.menuLoaded then
			f9_local0 = self:menuLoaded( event )
		elseif self.super.menuLoaded then
			f9_local0 = self.super:menuLoaded( event )
		end
		SetAllowCursorMovement( f1_local1, false )
		if not f9_local0 then
			f9_local0 = self:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, f1_arg0, Enum.LUIButton[0x93AB4C84F113EE1], nil, function ( element, menu, controller, model )
		if CoD.ScoreboardUtility.CanShowScoreboard( controller ) then
			CoD.ScoreboardUtility.ShowScoreboard( controller )
			return true
		elseif CoD.ScoreboardUtility.CanHideScoreboard( controller ) then
			CoD.ScoreboardUtility.HideScoreboard( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CoD.ScoreboardUtility.CanShowScoreboard( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x93AB4C84F113EE1], "", nil, nil )
			return false
		elseif CoD.ScoreboardUtility.CanHideScoreboard( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton[0x93AB4C84F113EE1], "", nil, nil )
			return false
		else
			return false
		end
	end, false )
	self:subscribeToGlobalModel( f1_arg0, "PerController", "scriptNotify", function ( model )
		local f12_local0 = self
		if CoD.ModelUtility.IsParamModelEqualToHashString( model, "loot_contract_complete" ) then
			CoD.BlackMarketUtility.RecordCompletedContractInGame( f1_arg0, model, f1_local1 )
		elseif CoD.ModelUtility.IsParamModelEqualToHashString( model, "loot_contract_progress" ) then
			CoD.BlackMarketUtility.UpdateInGameContractRecord( f1_arg0, model, f1_local1 )
		end
	end )
	SafeAreaContainer.id = "SafeAreaContainer"
	DeadSpectate.id = "DeadSpectate"
	ZMInventory.id = "ZMInventory"
	if CoD.isPC then
		PCNotifContainer.id = "PCNotifContainer"
	end
	if CoD.isPC then
		FrontendBattlenetContainer.id = "FrontendBattlenetContainer"
	end
	self:processEvent( {
		name = "menu_loaded",
		controller = f1_arg0
	} )
	self.__defaultFocus = DeadSpectate
	if CoD.isPC and (IsKeyboard( f1_arg0 ) or self.ignoreCursor) then
		self:restoreState( f1_arg0 )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg0 )
	end
	f1_local16 = self
	CoD.ZombieUtility.CommonPostLoadHud( self, f1_arg0, f1_local1 )
	CoD.HUDUtility.InitOverheadNames( self, f1_arg0, "OverheadNameContainer" )
	CoD.HUDUtility.InitWaypointHandlers( f1_local1, self, f1_arg0, "WaypointContainer", "" )
	f1_local16 = SafeAreaContainer
	if IsPC() then
		SizeToHudArea( f1_local16, f1_arg0 )
	end
	f1_local16 = ZMInventory
	if IsPC() then
		SizeToHudArea( f1_local16, f1_arg0 )
	end
	return self
end

CoD.T7Hud_zm_factory.__resetProperties = function ( f13_arg0 )
	f13_arg0.ZMInventory:completeAnimation()
	f13_arg0.WaypointContainer:completeAnimation()
	f13_arg0.MPScore:completeAnimation()
	f13_arg0.DamageFeedback:completeAnimation()
	f13_arg0.CursorHint:completeAnimation()
	f13_arg0.OverheadNameContainer:completeAnimation()
	f13_arg0.ZMInventory:setAlpha( 1 )
	f13_arg0.WaypointContainer:setAlpha( 1 )
	f13_arg0.MPScore:setAlpha( 1 )
	f13_arg0.DamageFeedback:setAlpha( 1 )
	f13_arg0.CursorHint:setAlpha( 1 )
	f13_arg0.OverheadNameContainer:setAlpha( 1 )
end

CoD.T7Hud_zm_factory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f14_arg0, f14_arg1 )
			f14_arg0:__resetProperties()
			f14_arg0:setupElementClipCounter( 0 )
		end,
		Trials_HUDDeactivated = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 6 )
			local f15_local0 = function ( f16_arg0 )
				f15_arg0.OverheadNameContainer:beginAnimation( 3000 )
				f15_arg0.OverheadNameContainer:setAlpha( 0 )
				f15_arg0.OverheadNameContainer:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.OverheadNameContainer:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.OverheadNameContainer:completeAnimation()
			f15_arg0.OverheadNameContainer:setAlpha( 1 )
			f15_local0( f15_arg0.OverheadNameContainer )
			local f15_local1 = function ( f17_arg0 )
				f15_arg0.CursorHint:beginAnimation( 3000 )
				f15_arg0.CursorHint:setAlpha( 0 )
				f15_arg0.CursorHint:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.CursorHint:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.CursorHint:completeAnimation()
			f15_arg0.CursorHint:setAlpha( 1 )
			f15_local1( f15_arg0.CursorHint )
			local f15_local2 = function ( f18_arg0 )
				f15_arg0.DamageFeedback:beginAnimation( 3000 )
				f15_arg0.DamageFeedback:setAlpha( 0 )
				f15_arg0.DamageFeedback:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.DamageFeedback:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.DamageFeedback:completeAnimation()
			f15_arg0.DamageFeedback:setAlpha( 1 )
			f15_local2( f15_arg0.DamageFeedback )
			local f15_local3 = function ( f19_arg0 )
				f15_arg0.MPScore:beginAnimation( 3000 )
				f15_arg0.MPScore:setAlpha( 0 )
				f15_arg0.MPScore:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.MPScore:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.MPScore:completeAnimation()
			f15_arg0.MPScore:setAlpha( 1 )
			f15_local3( f15_arg0.MPScore )
			local f15_local4 = function ( f20_arg0 )
				f15_arg0.WaypointContainer:beginAnimation( 3000 )
				f15_arg0.WaypointContainer:setAlpha( 0 )
				f15_arg0.WaypointContainer:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.WaypointContainer:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.WaypointContainer:completeAnimation()
			f15_arg0.WaypointContainer:setAlpha( 1 )
			f15_local4( f15_arg0.WaypointContainer )
			local f15_local5 = function ( f21_arg0 )
				f15_arg0.ZMInventory:beginAnimation( 3000 )
				f15_arg0.ZMInventory:setAlpha( 0 )
				f15_arg0.ZMInventory:registerEventHandler( "interrupted_keyframe", f15_arg0.clipInterrupted )
				f15_arg0.ZMInventory:registerEventHandler( "transition_complete_keyframe", f15_arg0.clipFinished )
			end
			
			f15_arg0.ZMInventory:completeAnimation()
			f15_arg0.ZMInventory:setAlpha( 1 )
			f15_local5( f15_arg0.ZMInventory )
		end
	},
	Trials_HUDDeactivated = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 6 )
			f22_arg0.OverheadNameContainer:completeAnimation()
			f22_arg0.OverheadNameContainer:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.OverheadNameContainer )
			f22_arg0.CursorHint:completeAnimation()
			f22_arg0.CursorHint:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.CursorHint )
			f22_arg0.DamageFeedback:completeAnimation()
			f22_arg0.DamageFeedback:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.DamageFeedback )
			f22_arg0.MPScore:completeAnimation()
			f22_arg0.MPScore:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.MPScore )
			f22_arg0.WaypointContainer:completeAnimation()
			f22_arg0.WaypointContainer:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.WaypointContainer )
			f22_arg0.ZMInventory:completeAnimation()
			f22_arg0.ZMInventory:setAlpha( 0 )
			f22_arg0.clipFinished( f22_arg0.ZMInventory )
		end,
		DefaultState = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 6 )
			local f23_local0 = function ( f24_arg0 )
				f23_arg0.OverheadNameContainer:beginAnimation( 1000 )
				f23_arg0.OverheadNameContainer:setAlpha( 1 )
				f23_arg0.OverheadNameContainer:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.OverheadNameContainer:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.OverheadNameContainer:completeAnimation()
			f23_arg0.OverheadNameContainer:setAlpha( 0 )
			f23_local0( f23_arg0.OverheadNameContainer )
			local f23_local1 = function ( f25_arg0 )
				f23_arg0.CursorHint:beginAnimation( 1000 )
				f23_arg0.CursorHint:setAlpha( 1 )
				f23_arg0.CursorHint:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.CursorHint:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.CursorHint:completeAnimation()
			f23_arg0.CursorHint:setAlpha( 0 )
			f23_local1( f23_arg0.CursorHint )
			local f23_local2 = function ( f26_arg0 )
				f23_arg0.DamageFeedback:beginAnimation( 1000 )
				f23_arg0.DamageFeedback:setAlpha( 1 )
				f23_arg0.DamageFeedback:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.DamageFeedback:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.DamageFeedback:completeAnimation()
			f23_arg0.DamageFeedback:setAlpha( 0 )
			f23_local2( f23_arg0.DamageFeedback )
			local f23_local3 = function ( f27_arg0 )
				f23_arg0.MPScore:beginAnimation( 1000 )
				f23_arg0.MPScore:setAlpha( 1 )
				f23_arg0.MPScore:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.MPScore:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.MPScore:completeAnimation()
			f23_arg0.MPScore:setAlpha( 0 )
			f23_local3( f23_arg0.MPScore )
			local f23_local4 = function ( f28_arg0 )
				f23_arg0.WaypointContainer:beginAnimation( 1000 )
				f23_arg0.WaypointContainer:setAlpha( 1 )
				f23_arg0.WaypointContainer:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.WaypointContainer:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.WaypointContainer:completeAnimation()
			f23_arg0.WaypointContainer:setAlpha( 0 )
			f23_local4( f23_arg0.WaypointContainer )
			local f23_local5 = function ( f29_arg0 )
				f23_arg0.ZMInventory:beginAnimation( 1000 )
				f23_arg0.ZMInventory:setAlpha( 1 )
				f23_arg0.ZMInventory:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.ZMInventory:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.ZMInventory:completeAnimation()
			f23_arg0.ZMInventory:setAlpha( 0 )
			f23_local5( f23_arg0.ZMInventory )
		end
	}
}
CoD.T7Hud_zm_factory.__onClose = function ( f30_arg0 )
	f30_arg0.OverheadNameContainer:close()
	f30_arg0.SafeAreaContainer:close()
	f30_arg0.fullscreenContainer:close()
	f30_arg0.CursorHint:close()
	f30_arg0.DamageFeedback:close()
	f30_arg0.ConsoleCenter:close()
	f30_arg0.DeadSpectate:close()
	f30_arg0.MPScore:close()
	f30_arg0.WaypointContainer:close()
	f30_arg0.ZMInventory:close()
	f30_arg0.PCNotifContainer:close()
	f30_arg0.FrontendBattlenetContainer:close()
	f30_arg0.HUDZMServerPauseNotification:close()
end

