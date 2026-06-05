require( "ui/uieditor/widgets/notifications/perks/notification_perks" )

CoD.NotificationPerksContainer = InheritFrom( LUI.UIElement )
CoD.NotificationPerksContainer.__defaultWidth = 750
CoD.NotificationPerksContainer.__defaultHeight = 255
CoD.NotificationPerksContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.NotificationPerksContainer )
	self.id = "NotificationPerksContainer"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Perks = CoD.Notification_Perks.new( f1_arg0, f1_arg1, 1, 1, -750, 0, 1, 1, -255, 0 )
	Perks:mergeStateConditions( {
		{
			stateName = "Perk0",
			condition = function ( menu, element, event )
				local f2_local0 = HasPerksInSlot0( f1_arg1 )
				if f2_local0 then
					if not HasPerksInSlot1( f1_arg1 ) then
						f2_local0 = not HasPerksInSlot2( f1_arg1 )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		},
		{
			stateName = "Perk0_Perk1_Perk2",
			condition = function ( menu, element, event )
				local f3_local0 = HasPerksInSlot0( f1_arg1 )
				if f3_local0 then
					f3_local0 = HasPerksInSlot1( f1_arg1 )
					if f3_local0 then
						f3_local0 = HasPerksInSlot2( f1_arg1 )
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Perk0_Perk1",
			condition = function ( menu, element, event )
				local f4_local0 = HasPerksInSlot0( f1_arg1 )
				if f4_local0 then
					f4_local0 = HasPerksInSlot1( f1_arg1 )
					if f4_local0 then
						f4_local0 = not HasPerksInSlot2( f1_arg1 )
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "Perk0_Perk2",
			condition = function ( menu, element, event )
				local f5_local0 = HasPerksInSlot0( f1_arg1 )
				if f5_local0 then
					if not HasPerksInSlot1( f1_arg1 ) then
						f5_local0 = HasPerksInSlot2( f1_arg1 )
					else
						f5_local0 = false
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "Perk1",
			condition = function ( menu, element, event )
				local f6_local0
				if not HasPerksInSlot0( f1_arg1 ) then
					f6_local0 = HasPerksInSlot1( f1_arg1 )
					if f6_local0 then
						f6_local0 = not HasPerksInSlot2( f1_arg1 )
					end
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "Perk1_Perk2",
			condition = function ( menu, element, event )
				local f7_local0
				if not HasPerksInSlot0( f1_arg1 ) then
					f7_local0 = HasPerksInSlot1( f1_arg1 )
					if f7_local0 then
						f7_local0 = HasPerksInSlot2( f1_arg1 )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "Perk2",
			condition = function ( menu, element, event )
				local f8_local0
				if not HasPerksInSlot0( f1_arg1 ) and not HasPerksInSlot1( f1_arg1 ) then
					f8_local0 = HasPerksInSlot2( f1_arg1 )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	local f1_local2 = Perks
	local f1_local3 = Perks.subscribeToModel
	local f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["perks.perk0_count"], function ( f9_arg0 )
		f1_arg0:updateElementState( Perks, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f9_arg0:get(),
			modelName = "perks.perk0_count"
		} )
	end, false )
	f1_local2 = Perks
	f1_local3 = Perks.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["perks.perk1_count"], function ( f10_arg0 )
		f1_arg0:updateElementState( Perks, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f10_arg0:get(),
			modelName = "perks.perk1_count"
		} )
	end, false )
	f1_local2 = Perks
	f1_local3 = Perks.subscribeToModel
	f1_local4 = Engine.GetModelForController( f1_arg1 )
	f1_local3( f1_local2, f1_local4["perks.perk2_count"], function ( f11_arg0 )
		f1_arg0:updateElementState( Perks, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f11_arg0:get(),
			modelName = "perks.perk2_count"
		} )
	end, false )
	Perks:setAlpha( 0 )
	Perks:setYRot( -20 )
	Perks:registerEventHandler( "hud_boot", function ( element, event )
		local f12_local0 = nil
		if IsInPrematchPeriod( f1_arg1 ) then
			PlayClip( self, "hud_start", f1_arg1 )
		end
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	Perks:subscribeToGlobalModel( f1_arg1, "PerController", "scriptNotify", function ( model )
		local f13_local0 = Perks
		if CoD.ModelUtility.IsParamModelEqualToHashString( model, "show_perk_notification" ) and not IsInPrematchPeriod( f1_arg1 ) and HasPerksInAnySlot( f1_arg1 ) then
			PlayClip( self, "hud_start", f1_arg1 )
		end
	end )
	self:addElement( Perks )
	self.Perks = Perks
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.NotificationPerksContainer.__resetProperties = function ( f14_arg0 )
	f14_arg0.Perks:completeAnimation()
	f14_arg0.Perks:setAlpha( 0 )
	f14_arg0.Perks:setZoom( 0 )
end

CoD.NotificationPerksContainer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f15_arg0, f15_arg1 )
			f15_arg0:__resetProperties()
			f15_arg0:setupElementClipCounter( 0 )
		end,
		hud_start = function ( f16_arg0, f16_arg1 )
			f16_arg0:__resetProperties()
			f16_arg0:setupElementClipCounter( 1 )
			local f16_local0 = function ( f17_arg0 )
				local f17_local0 = function ( f18_arg0 )
					local f18_local0 = function ( f19_arg0 )
						f19_arg0:beginAnimation( 690, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f19_arg0:setAlpha( 0 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f16_arg0.clipFinished )
					end
					
					f18_arg0:beginAnimation( 2000 )
					f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
				end
				
				f16_arg0.Perks:beginAnimation( 250, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f16_arg0.Perks:setAlpha( 1 )
				f16_arg0.Perks:registerEventHandler( "interrupted_keyframe", f16_arg0.clipInterrupted )
				f16_arg0.Perks:registerEventHandler( "transition_complete_keyframe", f17_local0 )
			end
			
			f16_arg0.Perks:completeAnimation()
			f16_arg0.Perks:setAlpha( 0 )
			f16_arg0.Perks:setZoom( 0 )
			f16_local0( f16_arg0.Perks )
		end,
		hud_stop = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 1 )
			local f20_local0 = function ( f21_arg0 )
				f20_arg0.Perks:beginAnimation( 320, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f20_arg0.Perks:setAlpha( 0 )
				f20_arg0.Perks:registerEventHandler( "interrupted_keyframe", f20_arg0.clipInterrupted )
				f20_arg0.Perks:registerEventHandler( "transition_complete_keyframe", f20_arg0.clipFinished )
			end
			
			f20_arg0.Perks:completeAnimation()
			f20_arg0.Perks:setAlpha( 1 )
			f20_local0( f20_arg0.Perks )
		end
	}
}
CoD.NotificationPerksContainer.__onClose = function ( f22_arg0 )
	f22_arg0.Perks:close()
end

