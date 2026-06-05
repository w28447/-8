require( "ui/uieditor/widgets/hud/zm_ammowidgetfactory/zmammo_particlefx" )
require( "ui/uieditor/widgets/hud/zm_fx/zmfx_spark2" )
require( "ui/uieditor/widgets/hud/zm_notif/zmnotif1_cursorhint" )
require( "x64:864dadf12afab03" )
require( "x64:376d060dda641ba" )
require( "ui/uieditor/widgets/zmhudwidgets/gameover/zm_hud_gameover_smokebackground" )
require( "x64:a7b351dd7a35ea5" )
require( "x64:a02c9d8bb7c1832" )
require( "x64:5b5ec14d5ec98c9" )

local PostLoadFunc = function ( self, controller )
	self.notificationQueueEmptyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueueEmpty" )
	self.BGBNotificationQueueEmptyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BGBNotificationQueueEmpty" )
	self.currentNotification = nil
	self.playNotification = function ( f2_arg0, f2_arg1 )
		Engine.SetModelValue( f2_arg0.BGBNotificationQueueEmptyModel, false )
		f2_arg0.currentNotification = LUI.ShallowCopy( f2_arg1 )
		if f2_arg1.description then
			f2_arg0.ZmNotif1CursorHint0.CursorHintText:setText( Engine[0xF9F1239CFD921FE]( f2_arg1.description ) )
		else
			f2_arg0.ZmNotif1CursorHint0.CursorHintText:setText( "" )
		end
		if f2_arg1.title then
			f2_arg0.ZmNotifFactory.Label1:setText( f2_arg1.title )
			f2_arg0.ZmNotifFactory.Label2:setText( f2_arg1.title )
		else
			f2_arg0.ZmNotifFactory.Label1:setText( "" )
			f2_arg0.ZmNotifFactory.Label2:setText( "" )
		end
		if f2_arg1.clip == "TextandImageBGB" or f2_arg1.clip == "TextandImageBGBToken" then
			f2_arg0.bgbTexture:setImage( f2_arg1.bgbImage )
		elseif f2_arg1.clip == "TextandImageCallings" then
			f2_arg0.callingImage:setImage( f2_arg1.taskImage )
		elseif f2_arg1.clip == "TextAndImageSpecial" then
			f2_arg0.specialImage:setImage( f2_arg1.specialImage )
		end
		if f2_arg1.playCallback ~= nil then
			f2_arg1.playCallback( controller )
		end
		f2_arg0:playClip( f2_arg1.clip )
	end
	
	self.appendNotification = function ( f3_arg0, f3_arg1 )
		if f3_arg0.notificationInProgress == true or Engine.GetModelValue( f3_arg0.notificationQueueEmptyModel ) ~= true then
			local f3_local0 = f3_arg0.nextNotification
			if f3_local0 == nil then
				f3_arg0.nextNotification = LUI.ShallowCopy( f3_arg1 )
			end
			while f3_local0 and f3_local0.next ~= nil do
				f3_local0 = f3_local0.next
			end
			f3_local0.next = LUI.ShallowCopy( f3_arg1 )
		else
			f3_arg0:playNotification( LUI.ShallowCopy( f3_arg1 ) )
		end
	end
	
	self.prependNotification = function ( f4_arg0, f4_arg1 )
		if f4_arg0.notificationInProgress == true or Engine.GetModelValue( f4_arg0.notificationQueueEmptyModel ) ~= true then
			local f4_local0 = f4_arg0.nextNotification
			if f4_local0 == nil then
				f4_arg0.nextNotification = LUI.ShallowCopy( f4_arg1 )
			else
				notifToInsert = LUI.ShallowCopy( f4_arg1 )
				notifToInsert.next = f4_local0
				f4_arg0.nextNotification = notifToInsert
			end
		else
			f4_arg0:playNotification( f4_arg0.currentNotification )
		end
	end
	
	self.notificationInProgress = false
	self.nextNotification = nil
	LUI.OverrideFunction_CallOriginalSecond( self, "playClip", function ( element )
		element.notificationInProgress = true
	end )
	self:registerEventHandler( "clip_over", function ( element, event )
		Engine.SetModelValue( self.BGBNotificationQueueEmptyModel, true )
		if self.currentNotification and self.currentNotification.finishCallback ~= nil then
			self.currentNotification.finishCallback( controller )
		end
		self.notificationInProgress = false
		if Engine.GetModelValue( self.notificationQueueEmptyModel ) ~= true then
			self.currentNotification = nil
		else
			self.currentNotification = self.nextNotification
			if self.nextNotification ~= nil then
				self:playNotification( self.nextNotification )
				self.nextNotification = self.nextNotification.next
			end
		end
	end )
	self:subscribeToModel( self.notificationQueueEmptyModel, function ( model )
		if Engine.GetModelValue( model ) == true then
			self:processEvent( {
				name = "clip_over"
			} )
		end
	end )
end

CoD.ZmNotifBGB_ContainerFactory = InheritFrom( LUI.UIElement )
CoD.ZmNotifBGB_ContainerFactory.__defaultWidth = 468
CoD.ZmNotifBGB_ContainerFactory.__defaultHeight = 379
CoD.ZmNotifBGB_ContainerFactory.new = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7, f8_arg8, f8_arg9 )
	local self = LUI.UIElement.new( f8_arg2, f8_arg3, f8_arg4, f8_arg5, f8_arg6, f8_arg7, f8_arg8, f8_arg9 )
	self:setClass( CoD.ZmNotifBGB_ContainerFactory )
	self.id = "ZmNotifBGB_ContainerFactory"
	self.soundSet = "HUD"
	self.anyChildUsesUpdateState = true
	f8_arg0:addElementToPendingUpdateStateList( self )
	
	local Pointers = LUI.UIImage.new( 0, 0, 138, 326, 0, 0, 91, 279 )
	Pointers:setAlpha( 0 )
	Pointers:setScale( 1.6, 1.6 )
	Pointers:setImage( RegisterImage( "uie_zm_hud_notification_pointers" ) )
	self:addElement( Pointers )
	self.Pointers = Pointers
	
	local BlackBacker = LUI.UIImage.new( 0, 0, 139, 327, 0, 0, 90, 278 )
	BlackBacker:setAlpha( 0 )
	BlackBacker:setScale( 1.6, 1.6 )
	BlackBacker:setImage( RegisterImage( "uie_zm_hud_notification_backer" ) )
	self:addElement( BlackBacker )
	self.BlackBacker = BlackBacker
	
	local TcmSplash = CoD.Tcm_Splash.new( f8_arg0, f8_arg1, 0.5, 0.5, -504.5, 504.5, 0, 0, 51, 351 )
	TcmSplash:setAlpha( 0 )
	self:addElement( TcmSplash )
	self.TcmSplash = TcmSplash
	
	local ZMTrialTitleNotif = CoD.ZM_Trials_Title_Splash.new( f8_arg0, f8_arg1, 0.5, 0.5, -960, 960, 0, 0, 75, 305 )
	ZMTrialTitleNotif:setAlpha( 0 )
	self:addElement( ZMTrialTitleNotif )
	self.ZMTrialTitleNotif = ZMTrialTitleNotif
	
	local TributeSplash = CoD.ZMTributeSplash.new( f8_arg0, f8_arg1, 0.5, 0.5, -960, 960, 0, 0, 75, 305 )
	TributeSplash:setAlpha( 0 )
	self:addElement( TributeSplash )
	self.TributeSplash = TributeSplash
	
	local Star = LUI.UIImage.new( 0.5, 0.5, -94, 94, 0, 0, 89.5, 277.5 )
	Star:setAlpha( 0 )
	Star:setScale( 1.6, 1.6 )
	Star:setImage( RegisterImage( "uie_zm_hud_notification_star" ) )
	self:addElement( Star )
	self.Star = Star
	
	local Aura = LUI.UIImage.new( 0, 0, 170, 298, 0, 0, 118, 246 )
	Aura:setRGB( 0.12, 1, 0 )
	Aura:setAlpha( 0 )
	Aura:setScale( 1.6, 1.6 )
	Aura:setImage( RegisterImage( "uie_zm_hud_notification_aura" ) )
	Aura:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Aura )
	self.Aura = Aura
	
	local Symbol = LUI.UIImage.new( 0, 0, 138.5, 326.5, 0, 0, 88, 276 )
	Symbol:setAlpha( 0 )
	Symbol:setScale( 1.6, 1.6 )
	Symbol:setImage( RegisterImage( "uie_zm_hud_notification_symbol" ) )
	self:addElement( Symbol )
	self.Symbol = Symbol
	
	local bgbGlowOrangeOver = LUI.UIImage.new( 0.5, 0.5, -155, 155, 0.5, 0.5, -276, 186 )
	bgbGlowOrangeOver:setRGB( 0, 0.43, 1 )
	bgbGlowOrangeOver:setAlpha( 0 )
	bgbGlowOrangeOver:setZRot( 90 )
	bgbGlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbGlowOrangeOver )
	self.bgbGlowOrangeOver = bgbGlowOrangeOver
	
	local KeyEnabled = LUI.UIImage.new( 0, 0, 45, 402, 0, 0, 52, 224 )
	KeyEnabled:setAlpha( 0 )
	KeyEnabled:setImage( RegisterImage( 0x92C3826B1AB38D ) )
	self:addElement( KeyEnabled )
	self.KeyEnabled = KeyEnabled
	
	local RushHeart = LUI.UIImage.new( 0, 0, 83, 385, 0, 0, -27, 253 )
	RushHeart:setAlpha( 0 )
	RushHeart:setImage( RegisterImage( 0xC1C4913FD23C7DC ) )
	self:addElement( RushHeart )
	self.RushHeart = RushHeart
	
	local specialImage = LUI.UIImage.new( 0, 0, 1, 446, 0, 0, -47, 345 )
	specialImage:setAlpha( 0 )
	specialImage:setScale( 0.5, 0.5 )
	specialImage:setImage( RegisterImage( "blacktransparent" ) )
	self:addElement( specialImage )
	self.specialImage = specialImage
	
	local bgbTexture = LUI.UIImage.new( 0.5, 0.5, -134, 136, 0, 0, -5, 265 )
	bgbTexture:setAlpha( 0 )
	bgbTexture:setScale( 1.1, 1.1 )
	bgbTexture:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgumtexture" ) )
	self:addElement( bgbTexture )
	self.bgbTexture = bgbTexture
	
	local bgbAbilitySwirl = LUI.UIImage.new( 0.5, 0.5, -95, 113, 0, 0, 30, 235 )
	bgbAbilitySwirl:setRGB( 0, 0.39, 1 )
	bgbAbilitySwirl:setAlpha( 0 )
	bgbAbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	bgbAbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbAbilitySwirl )
	self.bgbAbilitySwirl = bgbAbilitySwirl
	
	local Ring = LUI.UIImage.new( 0, 0, 139, 327, 0, 0, 91, 279 )
	Ring:setAlpha( 0 )
	Ring:setScale( 1.6, 1.6 )
	Ring:setImage( RegisterImage( "uie_zm_hud_notification_ring" ) )
	self:addElement( Ring )
	self.Ring = Ring
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( f8_arg0, f8_arg1, 0.5, 0.5, -153, 152, 0, 0, 110, 338 )
	ZmFxSpark20:setRGB( 0, 0, 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local SmokeStandard = LUI.UIImage.new( 0.1, 0.9, 0, 0, 0.1, 0.9, 0, 0 )
	SmokeStandard:setRGB( 0.75, 0.12, 0.03 )
	SmokeStandard:setAlpha( 0 )
	SmokeStandard:setZRot( 50 )
	SmokeStandard:setScale( 0.8, 0.8 )
	SmokeStandard:setImage( RegisterImage( "uie_zm_hud_gameover_smokebackground" ) )
	SmokeStandard:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	SmokeStandard:setShaderVector( 0, 2, 0, 0, 0 )
	self:addElement( SmokeStandard )
	self.SmokeStandard = SmokeStandard
	
	local SmokeHorizontalSM = LUI.UIImage.new( 0.05, 0.95, 0, 0, 0.15, 0.85, 0, 0 )
	SmokeHorizontalSM:setRGB( 0.52, 0.14, 0.09 )
	SmokeHorizontalSM:setAlpha( 0 )
	SmokeHorizontalSM:setImage( RegisterImage( "uie_zm_hud_inventory_objectivesmoke" ) )
	SmokeHorizontalSM:setMaterial( LUI.UIImage.GetCachedMaterial( 0xF755127C95CF5B6 ) )
	SmokeHorizontalSM:setShaderVector( 0, 2.5, 0, 0, 0 )
	self:addElement( SmokeHorizontalSM )
	self.SmokeHorizontalSM = SmokeHorizontalSM
	
	local callingImage = LUI.UIImage.new( 0.5, 0.5, -93, 97, 0, 0, 81, 271 )
	callingImage:setAlpha( 0 )
	callingImage:setImage( RegisterImage( "uie_t7_zm_hud_notif_factory" ) )
	self:addElement( callingImage )
	self.callingImage = callingImage
	
	local ZmAmmoParticleFX3right = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, 307, 522, 0, 0, 191, 303 )
	ZmAmmoParticleFX3right:setAlpha( 0 )
	ZmAmmoParticleFX3right:setZRot( 180 )
	ZmAmmoParticleFX3right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX3right.p1:setAlpha( 0 )
	ZmAmmoParticleFX3right.p2:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX3right )
	self.ZmAmmoParticleFX3right = ZmAmmoParticleFX3right
	
	local ZmAmmoParticleFX1left = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, -26, 189, 0, 0, 199, 311 )
	ZmAmmoParticleFX1left:setAlpha( 0 )
	ZmAmmoParticleFX1left:setXRot( 1 )
	ZmAmmoParticleFX1left:setYRot( 1 )
	ZmAmmoParticleFX1left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX1left.p2:setAlpha( 0 )
	ZmAmmoParticleFX1left.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX1left )
	self.ZmAmmoParticleFX1left = ZmAmmoParticleFX1left
	
	local ZmAmmoParticleFX2left = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, -26, 189, 0, 0, 196, 308 )
	ZmAmmoParticleFX2left:setAlpha( 0 )
	ZmAmmoParticleFX2left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX2left.p1:setAlpha( 0 )
	ZmAmmoParticleFX2left.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX2left )
	self.ZmAmmoParticleFX2left = ZmAmmoParticleFX2left
	
	local ZmAmmoParticleFX3left = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, -26, 189, 0, 0, 197, 309 )
	ZmAmmoParticleFX3left:setAlpha( 0 )
	ZmAmmoParticleFX3left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX3left.p1:setAlpha( 0 )
	ZmAmmoParticleFX3left.p2:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX3left )
	self.ZmAmmoParticleFX3left = ZmAmmoParticleFX3left
	
	local ZmAmmoParticleFX1right = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, 307, 522, 0, 0, 193, 305 )
	ZmAmmoParticleFX1right:setAlpha( 0 )
	ZmAmmoParticleFX1right:setXRot( 1 )
	ZmAmmoParticleFX1right:setYRot( 1 )
	ZmAmmoParticleFX1right:setZRot( 180 )
	ZmAmmoParticleFX1right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX1right.p2:setAlpha( 0 )
	ZmAmmoParticleFX1right.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX1right )
	self.ZmAmmoParticleFX1right = ZmAmmoParticleFX1right
	
	local ZmAmmoParticleFX2right = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, 307, 522, 0, 0, 190, 302 )
	ZmAmmoParticleFX2right:setAlpha( 0 )
	ZmAmmoParticleFX2right:setZRot( 180 )
	ZmAmmoParticleFX2right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX2right.p1:setAlpha( 0 )
	ZmAmmoParticleFX2right.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX2right )
	self.ZmAmmoParticleFX2right = ZmAmmoParticleFX2right
	
	local Lightning3 = LUI.UIImage.new( 0, 0, 163, 298, 0, 0, 67, 319 )
	Lightning3:setRGB( 0.12, 1, 0 )
	Lightning3:setAlpha( 0 )
	Lightning3:setZRot( 135 )
	Lightning3:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	Lightning3:setShaderVector( 0, 28, 1, 0, 0 )
	Lightning3:setShaderVector( 1, 20, 0, 0, 0 )
	self:addElement( Lightning3 )
	self.Lightning3 = Lightning3
	
	local Lightning = LUI.UIImage.new( 0, 0, 164.5, 299.5, 0, 0, 58, 310 )
	Lightning:setRGB( 0.12, 1, 0 )
	Lightning:setAlpha( 0 )
	Lightning:setZRot( 50 )
	Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	Lightning:setShaderVector( 0, 28, 1, 0, 0 )
	Lightning:setShaderVector( 1, 20, 0, 0, 0 )
	self:addElement( Lightning )
	self.Lightning = Lightning
	
	local particleLeft = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, -26, 189, 0, 0, 196, 308 )
	particleLeft:setAlpha( 0 )
	particleLeft:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	particleLeft.p1:setAlpha( 0 )
	particleLeft.p3:setAlpha( 0 )
	self:addElement( particleLeft )
	self.particleLeft = particleLeft
	
	local particleRight = CoD.ZmAmmo_ParticleFX.new( f8_arg0, f8_arg1, 0, 0, 307, 522, 0, 0, 190, 302 )
	particleRight:setAlpha( 0 )
	particleRight:setZRot( 180 )
	particleRight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	particleRight.p1:setAlpha( 0 )
	particleRight.p3:setAlpha( 0 )
	self:addElement( particleRight )
	self.particleRight = particleRight
	
	local SmokeBackground = CoD.zm_hud_gameover_smokebackground.new( f8_arg0, f8_arg1, 0.5, 0.5, -235, 235, 0.5, 0.5, -178.5, 291.5 )
	SmokeBackground:setAlpha( 0 )
	SmokeBackground:setScale( 0.7, 0.85 )
	self:addElement( SmokeBackground )
	self.SmokeBackground = SmokeBackground
	
	local Flsh = LUI.UIImage.new( 0.5, 0.5, -329, 329, 0, 0, 219, 290 )
	Flsh:setRGB( 0.73, 0.35, 0 )
	Flsh:setAlpha( 0 )
	Flsh:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtstreak" ) )
	Flsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flsh )
	self.Flsh = Flsh
	
	local ZmNotif1CursorHint0 = CoD.ZmNotif1_CursorHint.new( f8_arg0, f8_arg1, 0.5, 0.5, -960, 960, 0, 0, 358, 388 )
	ZmNotif1CursorHint0:setAlpha( 0 )
	ZmNotif1CursorHint0:setScale( 1.4, 1.4 )
	self:addElement( ZmNotif1CursorHint0 )
	self.ZmNotif1CursorHint0 = ZmNotif1CursorHint0
	
	local ZmNotifFactory = CoD.ZmNotif1Factory.new( f8_arg0, f8_arg1, 0.5, 0.5, -400, 400, 0.5, 0.5, 83.5, 165.5 )
	ZmNotifFactory:setAlpha( 0 )
	self:addElement( ZmNotifFactory )
	self.ZmNotifFactory = ZmNotifFactory
	
	local firework = CoD.ZmNotifbasic.new( f8_arg0, f8_arg1, 0, 0, -70, 530, 0, 0, -92, 508 )
	firework:setScale( 0.8, 0.8 )
	firework:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_rft" ) )
	firework:setShaderVector( 0, 0, 1, 0, 0 )
	firework:setShaderVector( 1, 0, 0, 0, 0 )
	firework:setShaderVector( 2, 0, 0.53, 0, 0 )
	firework:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( firework )
	self.firework = firework
	
	local scaffold = LUI.UIImage.new( 0, 0, -69.5, 530.5, 0, 0, 176.5, 240.5 )
	scaffold:setAlpha( 0 )
	scaffold:setScale( 0.8, 0.8 )
	scaffold:setImage( RegisterImage( "uie_zm_hud_notification_scaffold" ) )
	self:addElement( scaffold )
	self.scaffold = scaffold
	
	local NotifSound = LUI.UIElement.new( 0, 0, -127, -95, 0, 0, -134.5, -102.5 )
	NotifSound:setPlaySoundDirect( true )
	self:addElement( NotifSound )
	self.NotifSound = NotifSound
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsAnyGameType( f8_arg1, "ztrials" ) and not CoD.ModelUtility.IsGlobalModelValueEqualTo( "ZMHudGlobal.trials.gameState", 0 )
			end
		}
	} )
	local f8_local37 = self
	local f8_local38 = self.subscribeToModel
	local f8_local39 = Engine.GetGlobalModel()
	f8_local38( f8_local37, f8_local39["ZMHudGlobal.trials.gameState"], function ( f10_arg0 )
		f8_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f8_arg0,
			controller = f8_arg1,
			modelValue = f10_arg0:get(),
			modelName = "ZMHudGlobal.trials.gameState"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f8_arg1, f8_arg0 )
	end
	
	return self
end

CoD.ZmNotifBGB_ContainerFactory.__resetProperties = function ( f11_arg0 )
	f11_arg0.Flsh:completeAnimation()
	f11_arg0.callingImage:completeAnimation()
	f11_arg0.ZMTrialTitleNotif:completeAnimation()
	f11_arg0.Star:completeAnimation()
	f11_arg0.ZmNotifFactory:completeAnimation()
	f11_arg0.ZmNotif1CursorHint0:completeAnimation()
	f11_arg0.bgbTexture:completeAnimation()
	f11_arg0.bgbGlowOrangeOver:completeAnimation()
	f11_arg0.bgbAbilitySwirl:completeAnimation()
	f11_arg0.ZmFxSpark20:completeAnimation()
	f11_arg0.ZmAmmoParticleFX1left:completeAnimation()
	f11_arg0.ZmAmmoParticleFX3left:completeAnimation()
	f11_arg0.ZmAmmoParticleFX1right:completeAnimation()
	f11_arg0.ZmAmmoParticleFX2right:completeAnimation()
	f11_arg0.ZmAmmoParticleFX2left:completeAnimation()
	f11_arg0.ZmAmmoParticleFX3right:completeAnimation()
	f11_arg0.particleRight:completeAnimation()
	f11_arg0.particleLeft:completeAnimation()
	f11_arg0.firework:completeAnimation()
	f11_arg0.scaffold:completeAnimation()
	f11_arg0.SmokeHorizontalSM:completeAnimation()
	f11_arg0.SmokeStandard:completeAnimation()
	f11_arg0.NotifSound:completeAnimation()
	f11_arg0.KeyEnabled:completeAnimation()
	f11_arg0.RushHeart:completeAnimation()
	f11_arg0.specialImage:completeAnimation()
	f11_arg0.TcmSplash:completeAnimation()
	f11_arg0.TributeSplash:completeAnimation()
	f11_arg0.Lightning:completeAnimation()
	f11_arg0.Lightning3:completeAnimation()
	f11_arg0.Ring:completeAnimation()
	f11_arg0.Symbol:completeAnimation()
	f11_arg0.Aura:completeAnimation()
	f11_arg0.BlackBacker:completeAnimation()
	f11_arg0.Pointers:completeAnimation()
	f11_arg0.Flsh:setLeftRight( 0.5, 0.5, -329, 329 )
	f11_arg0.Flsh:setRGB( 0.73, 0.35, 0 )
	f11_arg0.Flsh:setAlpha( 0 )
	f11_arg0.callingImage:setAlpha( 0 )
	f11_arg0.callingImage:setScale( 1, 1 )
	f11_arg0.ZMTrialTitleNotif:setAlpha( 0 )
	f11_arg0.Star:setAlpha( 0 )
	f11_arg0.ZmNotifFactory:setTopBottom( 0.5, 0.5, 83.5, 165.5 )
	f11_arg0.ZmNotifFactory:setRGB( 1, 1, 1 )
	f11_arg0.ZmNotifFactory:setAlpha( 0 )
	f11_arg0.ZmNotif1CursorHint0:setRGB( 1, 1, 1 )
	f11_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
	f11_arg0.bgbTexture:setAlpha( 0 )
	f11_arg0.bgbTexture:setScale( 1.1, 1.1 )
	f11_arg0.bgbGlowOrangeOver:setAlpha( 0 )
	f11_arg0.bgbAbilitySwirl:setLeftRight( 0.5, 0.5, -95, 113 )
	f11_arg0.bgbAbilitySwirl:setTopBottom( 0, 0, 30, 235 )
	f11_arg0.bgbAbilitySwirl:setRGB( 0, 0.39, 1 )
	f11_arg0.bgbAbilitySwirl:setAlpha( 0 )
	f11_arg0.bgbAbilitySwirl:setZRot( 0 )
	f11_arg0.bgbAbilitySwirl:setScale( 1, 1 )
	f11_arg0.ZmFxSpark20:setAlpha( 1 )
	f11_arg0.ZmAmmoParticleFX1left:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX3left:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX1right:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX2left:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX3right:setLeftRight( 0, 0, 307, 522 )
	f11_arg0.ZmAmmoParticleFX3right:setTopBottom( 0, 0, 191, 303 )
	f11_arg0.ZmAmmoParticleFX3right:setAlpha( 0 )
	f11_arg0.ZmAmmoParticleFX3right:setZRot( 180 )
	f11_arg0.particleRight:setAlpha( 0 )
	f11_arg0.particleLeft:setAlpha( 0 )
	f11_arg0.scaffold:setAlpha( 0 )
	f11_arg0.SmokeHorizontalSM:setAlpha( 0 )
	f11_arg0.SmokeHorizontalSM:setScale( 1, 1 )
	f11_arg0.SmokeStandard:setAlpha( 0 )
	f11_arg0.SmokeStandard:setScale( 0.8, 0.8 )
	f11_arg0.KeyEnabled:setAlpha( 0 )
	f11_arg0.KeyEnabled:setScale( 1, 1 )
	f11_arg0.RushHeart:setLeftRight( 0, 0, 83, 385 )
	f11_arg0.RushHeart:setTopBottom( 0, 0, -27, 253 )
	f11_arg0.RushHeart:setAlpha( 0 )
	f11_arg0.RushHeart:setScale( 1, 1 )
	f11_arg0.specialImage:setAlpha( 0 )
	f11_arg0.specialImage:setScale( 0.5, 0.5 )
	f11_arg0.TcmSplash:setAlpha( 0 )
	f11_arg0.TributeSplash:setAlpha( 0 )
	f11_arg0.Lightning:setAlpha( 0 )
	f11_arg0.Lightning3:setAlpha( 0 )
	f11_arg0.Ring:setAlpha( 0 )
	f11_arg0.Symbol:setAlpha( 0 )
	f11_arg0.Aura:setAlpha( 0 )
	f11_arg0.BlackBacker:setAlpha( 0 )
	f11_arg0.Pointers:setAlpha( 0 )
end

CoD.ZmNotifBGB_ContainerFactory.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f12_arg0, f12_arg1 )
			f12_arg0:__resetProperties()
			f12_arg0:setupElementClipCounter( 4 )
			f12_arg0.ZMTrialTitleNotif:completeAnimation()
			f12_arg0.ZMTrialTitleNotif:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.ZMTrialTitleNotif )
			f12_arg0.Star:beginAnimation( 4370 )
			f12_arg0.Star:setAlpha( 0 )
			f12_arg0.Star:registerEventHandler( "interrupted_keyframe", f12_arg0.clipInterrupted )
			f12_arg0.Star:registerEventHandler( "transition_complete_keyframe", f12_arg0.clipFinished )
			f12_arg0.callingImage:completeAnimation()
			f12_arg0.callingImage:setAlpha( 0 )
			f12_arg0.clipFinished( f12_arg0.callingImage )
			f12_arg0.Flsh:completeAnimation()
			f12_arg0.Flsh:setRGB( 0.62, 0.22, 0 )
			f12_arg0.clipFinished( f12_arg0.Flsh )
		end,
		TextandImageBGB = function ( f13_arg0, f13_arg1 )
			f13_arg0:__resetProperties()
			f13_arg0:setupElementClipCounter( 13 )
			local f13_local0 = function ( f14_arg0 )
				local f14_local0 = function ( f15_arg0 )
					local f15_local0 = function ( f16_arg0 )
						local f16_local0 = function ( f17_arg0 )
							local f17_local0 = function ( f18_arg0 )
								local f18_local0 = function ( f19_arg0 )
									local f19_local0 = function ( f20_arg0 )
										local f20_local0 = function ( f21_arg0 )
											local f21_local0 = function ( f22_arg0 )
												local f22_local0 = function ( f23_arg0 )
													local f23_local0 = function ( f24_arg0 )
														local f24_local0 = function ( f25_arg0 )
															local f25_local0 = function ( f26_arg0 )
																f26_arg0:beginAnimation( 720, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
																f26_arg0:setAlpha( 0 )
																f26_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
															end
															
															f25_arg0:beginAnimation( 109 )
															f25_arg0:setAlpha( 0.75 )
															f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
														end
														
														f24_arg0:beginAnimation( 120 )
														f24_arg0:setAlpha( 1 )
														f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
													end
													
													f23_arg0:beginAnimation( 539 )
													f23_arg0:setAlpha( 0.8 )
													f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
												end
												
												f22_arg0:beginAnimation( 500 )
												f22_arg0:setAlpha( 0.36 )
												f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
											end
											
											f21_arg0:beginAnimation( 520 )
											f21_arg0:setAlpha( 0.8 )
											f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
										end
										
										f20_arg0:beginAnimation( 579 )
										f20_arg0:setAlpha( 0.36 )
										f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
									end
									
									f19_arg0:beginAnimation( 480 )
									f19_arg0:setAlpha( 0.8 )
									f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
								end
								
								f18_arg0:beginAnimation( 340 )
								f18_arg0:setAlpha( 0.33 )
								f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
							end
							
							f17_arg0:beginAnimation( 60 )
							f17_arg0:setAlpha( 0.75 )
							f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
						end
						
						f16_arg0:beginAnimation( 60 )
						f16_arg0:setAlpha( 1 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
					
					f15_arg0:beginAnimation( 160, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
					f15_arg0:setAlpha( 0.75 )
					f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
				end
				
				f13_arg0.bgbGlowOrangeOver:beginAnimation( 100 )
				f13_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f14_local0 )
			end
			
			f13_arg0.bgbGlowOrangeOver:completeAnimation()
			f13_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f13_local0( f13_arg0.bgbGlowOrangeOver )
			local f13_local1 = function ( f27_arg0 )
				local f27_local0 = function ( f28_arg0 )
					local f28_local0 = function ( f29_arg0 )
						local f29_local0 = function ( f30_arg0 )
							local f30_local0 = function ( f31_arg0 )
								local f31_local0 = function ( f32_arg0 )
									local f32_local0 = function ( f33_arg0 )
										local f33_local0 = function ( f34_arg0 )
											f34_arg0:beginAnimation( 39 )
											f34_arg0:setScale( 0.5, 0.5 )
											f34_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
										end
										
										f33_arg0:beginAnimation( 340 )
										f33_arg0:setAlpha( 0 )
										f33_arg0:setScale( 0.57, 0.57 )
										f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
									end
									
									f32_arg0:beginAnimation( 99 )
									f32_arg0:setAlpha( 0.77 )
									f32_arg0:setScale( 1.2, 1.2 )
									f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
								end
								
								f31_arg0:beginAnimation( 29 )
								f31_arg0:setScale( 0.82, 0.82 )
								f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
							end
							
							f30_arg0:beginAnimation( 3170 )
							f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
						end
						
						f29_arg0:beginAnimation( 40 )
						f29_arg0:setScale( 0.7, 0.7 )
						f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
					end
					
					f28_arg0:beginAnimation( 160 )
					f28_arg0:setAlpha( 1 )
					f28_arg0:setScale( 1.2, 1.2 )
					f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
				end
				
				f13_arg0.bgbTexture:beginAnimation( 100 )
				f13_arg0.bgbTexture:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.bgbTexture:registerEventHandler( "transition_complete_keyframe", f27_local0 )
			end
			
			f13_arg0.bgbTexture:completeAnimation()
			f13_arg0.bgbTexture:setAlpha( 0 )
			f13_arg0.bgbTexture:setScale( 0.5, 0.5 )
			f13_local1( f13_arg0.bgbTexture )
			local f13_local2 = function ( f35_arg0 )
				local f35_local0 = function ( f36_arg0 )
					local f36_local0 = function ( f37_arg0 )
						f37_arg0:beginAnimation( 49 )
						f37_arg0:setAlpha( 0 )
						f37_arg0:setZRot( 360 )
						f37_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f36_arg0:beginAnimation( 90 )
					f36_arg0:setAlpha( 0.29 )
					f36_arg0:setZRot( 317 )
					f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
				end
				
				f13_arg0.bgbAbilitySwirl:beginAnimation( 280 )
				f13_arg0.bgbAbilitySwirl:setAlpha( 0.8 )
				f13_arg0.bgbAbilitySwirl:setZRot( 240 )
				f13_arg0.bgbAbilitySwirl:setScale( 1.7, 1.7 )
				f13_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f35_local0 )
			end
			
			f13_arg0.bgbAbilitySwirl:completeAnimation()
			f13_arg0.bgbAbilitySwirl:setLeftRight( 0.5, 0.5, -102, 106 )
			f13_arg0.bgbAbilitySwirl:setTopBottom( 0, 0, 28, 233 )
			f13_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f13_arg0.bgbAbilitySwirl:setZRot( 0 )
			f13_arg0.bgbAbilitySwirl:setScale( 1, 1 )
			f13_local2( f13_arg0.bgbAbilitySwirl )
			f13_arg0.ZmFxSpark20:completeAnimation()
			f13_arg0.ZmFxSpark20:setAlpha( 0 )
			f13_arg0.clipFinished( f13_arg0.ZmFxSpark20 )
			local f13_local3 = function ( f38_arg0 )
				local f38_local0 = function ( f39_arg0 )
					local f39_local0 = function ( f40_arg0 )
						f40_arg0:beginAnimation( 440 )
						f40_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f39_arg0:beginAnimation( 3720 )
					f39_arg0:setAlpha( 0 )
					f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX3right:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX3right:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", f38_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX3right:completeAnimation()
			f13_arg0.ZmAmmoParticleFX3right:setLeftRight( 0, 0, 307, 522 )
			f13_arg0.ZmAmmoParticleFX3right:setTopBottom( 0, 0, 191, 303 )
			f13_arg0.ZmAmmoParticleFX3right:setAlpha( 1 )
			f13_arg0.ZmAmmoParticleFX3right:setZRot( 180 )
			f13_local3( f13_arg0.ZmAmmoParticleFX3right )
			local f13_local4 = function ( f41_arg0 )
				local f41_local0 = function ( f42_arg0 )
					local f42_local0 = function ( f43_arg0 )
						f43_arg0:beginAnimation( 440 )
						f43_arg0:setAlpha( 0 )
						f43_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f42_arg0:beginAnimation( 3720 )
					f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX1left:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX1left:setAlpha( 1 )
				f13_arg0.ZmAmmoParticleFX1left:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", f41_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f13_arg0.ZmAmmoParticleFX1left:setAlpha( 0 )
			f13_local4( f13_arg0.ZmAmmoParticleFX1left )
			local f13_local5 = function ( f44_arg0 )
				local f44_local0 = function ( f45_arg0 )
					local f45_local0 = function ( f46_arg0 )
						f46_arg0:beginAnimation( 440 )
						f46_arg0:setAlpha( 0 )
						f46_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f45_arg0:beginAnimation( 3720 )
					f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX2left:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX2left:setAlpha( 1 )
				f13_arg0.ZmAmmoParticleFX2left:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", f44_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f13_arg0.ZmAmmoParticleFX2left:setAlpha( 0 )
			f13_local5( f13_arg0.ZmAmmoParticleFX2left )
			local f13_local6 = function ( f47_arg0 )
				local f47_local0 = function ( f48_arg0 )
					local f48_local0 = function ( f49_arg0 )
						f49_arg0:beginAnimation( 440 )
						f49_arg0:setAlpha( 0 )
						f49_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f48_arg0:beginAnimation( 3720 )
					f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX3left:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX3left:setAlpha( 1 )
				f13_arg0.ZmAmmoParticleFX3left:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", f47_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f13_arg0.ZmAmmoParticleFX3left:setAlpha( 0 )
			f13_local6( f13_arg0.ZmAmmoParticleFX3left )
			local f13_local7 = function ( f50_arg0 )
				local f50_local0 = function ( f51_arg0 )
					local f51_local0 = function ( f52_arg0 )
						f52_arg0:beginAnimation( 440 )
						f52_arg0:setAlpha( 0 )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f51_arg0:beginAnimation( 3720 )
					f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX1right:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX1right:setAlpha( 1 )
				f13_arg0.ZmAmmoParticleFX1right:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", f50_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f13_arg0.ZmAmmoParticleFX1right:setAlpha( 0 )
			f13_local7( f13_arg0.ZmAmmoParticleFX1right )
			local f13_local8 = function ( f53_arg0 )
				local f53_local0 = function ( f54_arg0 )
					local f54_local0 = function ( f55_arg0 )
						f55_arg0:beginAnimation( 440 )
						f55_arg0:setAlpha( 0 )
						f55_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f54_arg0:beginAnimation( 3720 )
					f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
				end
				
				f13_arg0.ZmAmmoParticleFX2right:beginAnimation( 90 )
				f13_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
				f13_arg0.ZmAmmoParticleFX2right:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", f53_local0 )
			end
			
			f13_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f13_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
			f13_local8( f13_arg0.ZmAmmoParticleFX2right )
			local f13_local9 = function ( f56_arg0 )
				local f56_local0 = function ( f57_arg0 )
					f57_arg0:beginAnimation( 609, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f57_arg0:setRGB( 0, 0.34, 1 )
					f57_arg0:setAlpha( 0 )
					f57_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
				end
				
				f13_arg0.Flsh:beginAnimation( 40 )
				f13_arg0.Flsh:setRGB( 0, 0.89, 1 )
				f13_arg0.Flsh:setAlpha( 1 )
				f13_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f56_local0 )
			end
			
			f13_arg0.Flsh:completeAnimation()
			f13_arg0.Flsh:setRGB( 0, 0.33, 1 )
			f13_arg0.Flsh:setAlpha( 0.36 )
			f13_local9( f13_arg0.Flsh )
			local f13_local10 = function ( f58_arg0 )
				local f58_local0 = function ( f59_arg0 )
					local f59_local0 = function ( f60_arg0 )
						local f60_local0 = function ( f61_arg0 )
							f61_arg0:beginAnimation( 1069 )
							f61_arg0:setAlpha( 0 )
							f61_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
						end
						
						f60_arg0:beginAnimation( 2850 )
						f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
					end
					
					f59_arg0:beginAnimation( 329, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f59_arg0:setAlpha( 1 )
					f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
				end
				
				f13_arg0.ZmNotif1CursorHint0:beginAnimation( 120 )
				f13_arg0.ZmNotif1CursorHint0:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
			end
			
			f13_arg0.ZmNotif1CursorHint0:completeAnimation()
			f13_arg0.ZmNotif1CursorHint0:setRGB( 1, 1, 1 )
			f13_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f13_local10( f13_arg0.ZmNotif1CursorHint0 )
			local f13_local11 = function ( f62_arg0 )
				local f62_local0 = function ( f63_arg0 )
					local f63_local0 = function ( f64_arg0 )
						f64_arg0:beginAnimation( 869, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f64_arg0:setAlpha( 0 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f13_arg0.clipFinished )
					end
					
					f63_arg0:beginAnimation( 3240 )
					f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
				end
				
				f13_arg0.ZmNotifFactory:beginAnimation( 260, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f13_arg0.ZmNotifFactory:setAlpha( 1 )
				f13_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f13_arg0.clipInterrupted )
				f13_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f62_local0 )
			end
			
			f13_arg0.ZmNotifFactory:completeAnimation()
			f13_arg0.ZmNotifFactory:setAlpha( 0 )
			f13_local11( f13_arg0.ZmNotifFactory )
		end,
		TextandImageBGBToken = function ( f65_arg0, f65_arg1 )
			f65_arg0:__resetProperties()
			f65_arg0:setupElementClipCounter( 13 )
			local f65_local0 = function ( f66_arg0 )
				local f66_local0 = function ( f67_arg0 )
					local f67_local0 = function ( f68_arg0 )
						local f68_local0 = function ( f69_arg0 )
							local f69_local0 = function ( f70_arg0 )
								local f70_local0 = function ( f71_arg0 )
									local f71_local0 = function ( f72_arg0 )
										local f72_local0 = function ( f73_arg0 )
											local f73_local0 = function ( f74_arg0 )
												local f74_local0 = function ( f75_arg0 )
													local f75_local0 = function ( f76_arg0 )
														local f76_local0 = function ( f77_arg0 )
															local f77_local0 = function ( f78_arg0 )
																f78_arg0:beginAnimation( 720, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
																f78_arg0:setAlpha( 0 )
																f78_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
															end
															
															f77_arg0:beginAnimation( 109 )
															f77_arg0:setAlpha( 0.75 )
															f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
														end
														
														f76_arg0:beginAnimation( 120 )
														f76_arg0:setAlpha( 1 )
														f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
													end
													
													f75_arg0:beginAnimation( 539 )
													f75_arg0:setAlpha( 0.8 )
													f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
												end
												
												f74_arg0:beginAnimation( 500 )
												f74_arg0:setAlpha( 0.36 )
												f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
											end
											
											f73_arg0:beginAnimation( 520 )
											f73_arg0:setAlpha( 0.8 )
											f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
										end
										
										f72_arg0:beginAnimation( 579 )
										f72_arg0:setAlpha( 0.36 )
										f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
									end
									
									f71_arg0:beginAnimation( 480 )
									f71_arg0:setAlpha( 0.8 )
									f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
								end
								
								f70_arg0:beginAnimation( 340 )
								f70_arg0:setAlpha( 0.33 )
								f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
							end
							
							f69_arg0:beginAnimation( 60 )
							f69_arg0:setAlpha( 0.75 )
							f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
						end
						
						f68_arg0:beginAnimation( 60 )
						f68_arg0:setAlpha( 1 )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
					end
					
					f67_arg0:beginAnimation( 160, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] | Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
					f67_arg0:setAlpha( 0.75 )
					f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
				end
				
				f65_arg0.bgbGlowOrangeOver:beginAnimation( 100 )
				f65_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f66_local0 )
			end
			
			f65_arg0.bgbGlowOrangeOver:completeAnimation()
			f65_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f65_local0( f65_arg0.bgbGlowOrangeOver )
			local f65_local1 = function ( f79_arg0 )
				local f79_local0 = function ( f80_arg0 )
					local f80_local0 = function ( f81_arg0 )
						local f81_local0 = function ( f82_arg0 )
							local f82_local0 = function ( f83_arg0 )
								local f83_local0 = function ( f84_arg0 )
									local f84_local0 = function ( f85_arg0 )
										local f85_local0 = function ( f86_arg0 )
											f86_arg0:beginAnimation( 39 )
											f86_arg0:setScale( 0.5, 0.5 )
											f86_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
										end
										
										f85_arg0:beginAnimation( 340 )
										f85_arg0:setAlpha( 0 )
										f85_arg0:setScale( 0.57, 0.57 )
										f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
									end
									
									f84_arg0:beginAnimation( 99 )
									f84_arg0:setAlpha( 0.77 )
									f84_arg0:setScale( 1.2, 1.2 )
									f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
								end
								
								f83_arg0:beginAnimation( 29 )
								f83_arg0:setScale( 0.82, 0.82 )
								f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
							end
							
							f82_arg0:beginAnimation( 3170 )
							f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
						end
						
						f81_arg0:beginAnimation( 40 )
						f81_arg0:setScale( 0.7, 0.7 )
						f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
					end
					
					f80_arg0:beginAnimation( 160 )
					f80_arg0:setAlpha( 1 )
					f80_arg0:setScale( 1.2, 1.2 )
					f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
				end
				
				f65_arg0.bgbTexture:beginAnimation( 100 )
				f65_arg0.bgbTexture:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.bgbTexture:registerEventHandler( "transition_complete_keyframe", f79_local0 )
			end
			
			f65_arg0.bgbTexture:completeAnimation()
			f65_arg0.bgbTexture:setAlpha( 0 )
			f65_arg0.bgbTexture:setScale( 0.5, 0.5 )
			f65_local1( f65_arg0.bgbTexture )
			local f65_local2 = function ( f87_arg0 )
				local f87_local0 = function ( f88_arg0 )
					f88_arg0:beginAnimation( 139 )
					f88_arg0:setAlpha( 0 )
					f88_arg0:setZRot( 360 )
					f88_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
				end
				
				f65_arg0.bgbAbilitySwirl:beginAnimation( 280 )
				f65_arg0.bgbAbilitySwirl:setAlpha( 0.8 )
				f65_arg0.bgbAbilitySwirl:setZRot( 240 )
				f65_arg0.bgbAbilitySwirl:setScale( 1.7, 1.7 )
				f65_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f87_local0 )
			end
			
			f65_arg0.bgbAbilitySwirl:completeAnimation()
			f65_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f65_arg0.bgbAbilitySwirl:setZRot( 0 )
			f65_arg0.bgbAbilitySwirl:setScale( 1, 1 )
			f65_local2( f65_arg0.bgbAbilitySwirl )
			f65_arg0.ZmFxSpark20:completeAnimation()
			f65_arg0.ZmFxSpark20:setAlpha( 0 )
			f65_arg0.clipFinished( f65_arg0.ZmFxSpark20 )
			local f65_local3 = function ( f89_arg0 )
				local f89_local0 = function ( f90_arg0 )
					local f90_local0 = function ( f91_arg0 )
						f91_arg0:beginAnimation( 440 )
						f91_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f90_arg0:beginAnimation( 3720 )
					f90_arg0:setAlpha( 0 )
					f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX3right:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX3right:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX3right:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", f89_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX3right:completeAnimation()
			f65_arg0.ZmAmmoParticleFX3right:setAlpha( 0 )
			f65_local3( f65_arg0.ZmAmmoParticleFX3right )
			local f65_local4 = function ( f92_arg0 )
				local f92_local0 = function ( f93_arg0 )
					local f93_local0 = function ( f94_arg0 )
						f94_arg0:beginAnimation( 440 )
						f94_arg0:setAlpha( 0 )
						f94_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f93_arg0:beginAnimation( 3720 )
					f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX1left:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX1left:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX1left:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", f92_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f65_arg0.ZmAmmoParticleFX1left:setAlpha( 0 )
			f65_local4( f65_arg0.ZmAmmoParticleFX1left )
			local f65_local5 = function ( f95_arg0 )
				local f95_local0 = function ( f96_arg0 )
					local f96_local0 = function ( f97_arg0 )
						f97_arg0:beginAnimation( 440 )
						f97_arg0:setAlpha( 0 )
						f97_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f96_arg0:beginAnimation( 3720 )
					f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX2left:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX2left:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX2left:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", f95_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f65_arg0.ZmAmmoParticleFX2left:setAlpha( 0 )
			f65_local5( f65_arg0.ZmAmmoParticleFX2left )
			local f65_local6 = function ( f98_arg0 )
				local f98_local0 = function ( f99_arg0 )
					local f99_local0 = function ( f100_arg0 )
						f100_arg0:beginAnimation( 440 )
						f100_arg0:setAlpha( 0 )
						f100_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f99_arg0:beginAnimation( 3720 )
					f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX3left:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX3left:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX3left:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", f98_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f65_arg0.ZmAmmoParticleFX3left:setAlpha( 0 )
			f65_local6( f65_arg0.ZmAmmoParticleFX3left )
			local f65_local7 = function ( f101_arg0 )
				local f101_local0 = function ( f102_arg0 )
					local f102_local0 = function ( f103_arg0 )
						f103_arg0:beginAnimation( 440 )
						f103_arg0:setAlpha( 0 )
						f103_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f102_arg0:beginAnimation( 3720 )
					f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX1right:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX1right:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX1right:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", f101_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f65_arg0.ZmAmmoParticleFX1right:setAlpha( 0 )
			f65_local7( f65_arg0.ZmAmmoParticleFX1right )
			local f65_local8 = function ( f104_arg0 )
				local f104_local0 = function ( f105_arg0 )
					local f105_local0 = function ( f106_arg0 )
						f106_arg0:beginAnimation( 440 )
						f106_arg0:setAlpha( 0 )
						f106_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f105_arg0:beginAnimation( 3720 )
					f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
				end
				
				f65_arg0.ZmAmmoParticleFX2right:beginAnimation( 90 )
				f65_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
				f65_arg0.ZmAmmoParticleFX2right:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", f104_local0 )
			end
			
			f65_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f65_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
			f65_local8( f65_arg0.ZmAmmoParticleFX2right )
			local f65_local9 = function ( f107_arg0 )
				local f107_local0 = function ( f108_arg0 )
					f108_arg0:beginAnimation( 609, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f108_arg0:setRGB( 0, 0.33, 1 )
					f108_arg0:setAlpha( 0 )
					f108_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
				end
				
				f65_arg0.Flsh:beginAnimation( 40 )
				f65_arg0.Flsh:setRGB( 0, 0.92, 1 )
				f65_arg0.Flsh:setAlpha( 1 )
				f65_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f107_local0 )
			end
			
			f65_arg0.Flsh:completeAnimation()
			f65_arg0.Flsh:setRGB( 0, 0.37, 1 )
			f65_arg0.Flsh:setAlpha( 0.36 )
			f65_local9( f65_arg0.Flsh )
			local f65_local10 = function ( f109_arg0 )
				local f109_local0 = function ( f110_arg0 )
					local f110_local0 = function ( f111_arg0 )
						local f111_local0 = function ( f112_arg0 )
							f112_arg0:beginAnimation( 1069 )
							f112_arg0:setAlpha( 0 )
							f112_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
						end
						
						f111_arg0:beginAnimation( 2850 )
						f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
					end
					
					f110_arg0:beginAnimation( 329, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f110_arg0:setAlpha( 1 )
					f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
				end
				
				f65_arg0.ZmNotif1CursorHint0:beginAnimation( 120 )
				f65_arg0.ZmNotif1CursorHint0:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
			end
			
			f65_arg0.ZmNotif1CursorHint0:completeAnimation()
			f65_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f65_local10( f65_arg0.ZmNotif1CursorHint0 )
			local f65_local11 = function ( f113_arg0 )
				local f113_local0 = function ( f114_arg0 )
					local f114_local0 = function ( f115_arg0 )
						f115_arg0:beginAnimation( 869, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
						f115_arg0:setAlpha( 0 )
						f115_arg0:registerEventHandler( "transition_complete_keyframe", f65_arg0.clipFinished )
					end
					
					f114_arg0:beginAnimation( 3240 )
					f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
				end
				
				f65_arg0.ZmNotifFactory:beginAnimation( 260, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f65_arg0.ZmNotifFactory:setAlpha( 1 )
				f65_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f65_arg0.clipInterrupted )
				f65_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f113_local0 )
			end
			
			f65_arg0.ZmNotifFactory:completeAnimation()
			f65_arg0.ZmNotifFactory:setAlpha( 0 )
			f65_local11( f65_arg0.ZmNotifFactory )
		end,
		TextandImageBasic_Story1 = function ( f116_arg0, f116_arg1 )
			f116_arg0:__resetProperties()
			f116_arg0:setupElementClipCounter( 8 )
			f116_arg0.callingImage:completeAnimation()
			f116_arg0.callingImage:setAlpha( 0 )
			f116_arg0.clipFinished( f116_arg0.callingImage )
			local f116_local0 = function ( f117_arg0 )
				local f117_local0 = function ( f118_arg0 )
					local f118_local0 = function ( f119_arg0 )
						f119_arg0:beginAnimation( 199 )
						f119_arg0:setAlpha( 0 )
						f119_arg0:registerEventHandler( "transition_complete_keyframe", f116_arg0.clipFinished )
					end
					
					f118_arg0:beginAnimation( 3700 )
					f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
				end
				
				f116_arg0.particleLeft:beginAnimation( 300 )
				f116_arg0.particleLeft:setAlpha( 1 )
				f116_arg0.particleLeft:registerEventHandler( "interrupted_keyframe", f116_arg0.clipInterrupted )
				f116_arg0.particleLeft:registerEventHandler( "transition_complete_keyframe", f117_local0 )
			end
			
			f116_arg0.particleLeft:completeAnimation()
			f116_arg0.particleLeft:setAlpha( 0 )
			f116_local0( f116_arg0.particleLeft )
			local f116_local1 = function ( f120_arg0 )
				local f120_local0 = function ( f121_arg0 )
					local f121_local0 = function ( f122_arg0 )
						f122_arg0:beginAnimation( 199 )
						f122_arg0:setAlpha( 0 )
						f122_arg0:registerEventHandler( "transition_complete_keyframe", f116_arg0.clipFinished )
					end
					
					f121_arg0:beginAnimation( 3700 )
					f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
				end
				
				f116_arg0.particleRight:beginAnimation( 300 )
				f116_arg0.particleRight:setAlpha( 1 )
				f116_arg0.particleRight:registerEventHandler( "interrupted_keyframe", f116_arg0.clipInterrupted )
				f116_arg0.particleRight:registerEventHandler( "transition_complete_keyframe", f120_local0 )
			end
			
			f116_arg0.particleRight:completeAnimation()
			f116_arg0.particleRight:setAlpha( 0 )
			f116_local1( f116_arg0.particleRight )
			local f116_local2 = function ( f123_arg0 )
				local f123_local0 = function ( f124_arg0 )
					f124_arg0:beginAnimation( 1839, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
					f124_arg0:setLeftRight( 0.5, 0.5, -340, 104 )
					f124_arg0:setAlpha( 0 )
					f124_arg0:registerEventHandler( "transition_complete_keyframe", f116_arg0.clipFinished )
				end
				
				f123_arg0:beginAnimation( 2020, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f123_arg0:setLeftRight( 0.5, 0.5, -265.64, 178.36 )
				f123_arg0:setAlpha( 1 )
				f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
			end
			
			f116_arg0.Flsh:beginAnimation( 140 )
			f116_arg0.Flsh:setLeftRight( 0.5, 0.5, -184, 260 )
			f116_arg0.Flsh:setRGB( 0.35, 0, 1 )
			f116_arg0.Flsh:setAlpha( 0 )
			f116_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f116_arg0.clipInterrupted )
			f116_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f116_local2 )
			f116_arg0.ZmNotif1CursorHint0:completeAnimation()
			f116_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f116_arg0.clipFinished( f116_arg0.ZmNotif1CursorHint0 )
			local f116_local3 = function ( f125_arg0 )
				local f125_local0 = function ( f126_arg0 )
					local f126_local0 = function ( f127_arg0 )
						f127_arg0:beginAnimation( 199 )
						f127_arg0:setAlpha( 0 )
						f127_arg0:registerEventHandler( "transition_complete_keyframe", f116_arg0.clipFinished )
					end
					
					f126_arg0:beginAnimation( 3700 )
					f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
				end
				
				f125_arg0:beginAnimation( 160 )
				f125_arg0:setAlpha( 1 )
				f125_arg0:registerEventHandler( "transition_complete_keyframe", f125_local0 )
			end
			
			f116_arg0.ZmNotifFactory:beginAnimation( 140 )
			f116_arg0.ZmNotifFactory:setAlpha( 0 )
			f116_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f116_arg0.clipInterrupted )
			f116_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f116_local3 )
			f116_arg0.firework:completeAnimation()
			f116_arg0.firework:playClip( "TextandImageBasic" )
			f116_arg0.clipFinished( f116_arg0.firework )
			local f116_local4 = function ( f128_arg0 )
				local f128_local0 = function ( f129_arg0 )
					local f129_local0 = function ( f130_arg0 )
						f130_arg0:beginAnimation( 199 )
						f130_arg0:setAlpha( 0 )
						f130_arg0:registerEventHandler( "transition_complete_keyframe", f116_arg0.clipFinished )
					end
					
					f129_arg0:beginAnimation( 3700 )
					f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
				end
				
				f128_arg0:beginAnimation( 210 )
				f128_arg0:setAlpha( 1 )
				f128_arg0:registerEventHandler( "transition_complete_keyframe", f128_local0 )
			end
			
			f116_arg0.scaffold:beginAnimation( 90 )
			f116_arg0.scaffold:setAlpha( 0 )
			f116_arg0.scaffold:registerEventHandler( "interrupted_keyframe", f116_arg0.clipInterrupted )
			f116_arg0.scaffold:registerEventHandler( "transition_complete_keyframe", f116_local4 )
		end,
		TextandImageCallings = function ( f131_arg0, f131_arg1 )
			f131_arg0:__resetProperties()
			f131_arg0:setupElementClipCounter( 6 )
			local f131_local0 = function ( f132_arg0 )
				local f132_local0 = function ( f133_arg0 )
					local f133_local0 = function ( f134_arg0 )
						local f134_local0 = function ( f135_arg0 )
							local f135_local0 = function ( f136_arg0 )
								f136_arg0:beginAnimation( 569 )
								f136_arg0:setAlpha( 0 )
								f136_arg0:setScale( 1.08, 1.08 )
								f136_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
							end
							
							f135_arg0:beginAnimation( 2310 )
							f135_arg0:setAlpha( 0.1 )
							f135_arg0:setScale( 1.06, 1.06 )
							f135_arg0:registerEventHandler( "transition_complete_keyframe", f135_local0 )
						end
						
						f134_arg0:beginAnimation( 170 )
						f134_arg0:setAlpha( 0.5 )
						f134_arg0:setScale( 0.96, 0.96 )
						f134_arg0:registerEventHandler( "transition_complete_keyframe", f134_local0 )
					end
					
					f133_arg0:beginAnimation( 49 )
					f133_arg0:setAlpha( 0.33 )
					f133_arg0:setScale( 0.95, 0.95 )
					f133_arg0:registerEventHandler( "transition_complete_keyframe", f133_local0 )
				end
				
				f131_arg0.SmokeStandard:beginAnimation( 270 )
				f131_arg0.SmokeStandard:setAlpha( 0.28 )
				f131_arg0.SmokeStandard:setScale( 1.1, 1.1 )
				f131_arg0.SmokeStandard:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.SmokeStandard:registerEventHandler( "transition_complete_keyframe", f132_local0 )
			end
			
			f131_arg0.SmokeStandard:completeAnimation()
			f131_arg0.SmokeStandard:setAlpha( 0 )
			f131_arg0.SmokeStandard:setScale( 0, 0 )
			f131_local0( f131_arg0.SmokeStandard )
			local f131_local1 = function ( f137_arg0 )
				local f137_local0 = function ( f138_arg0 )
					local f138_local0 = function ( f139_arg0 )
						local f139_local0 = function ( f140_arg0 )
							local f140_local0 = function ( f141_arg0 )
								local f141_local0 = function ( f142_arg0 )
									f142_arg0:beginAnimation( 770 )
									f142_arg0:setAlpha( 0 )
									f142_arg0:setScale( 1.06, 1.06 )
									f142_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
								end
								
								f141_arg0:beginAnimation( 1999 )
								f141_arg0:setAlpha( 0.4 )
								f141_arg0:setScale( 1.02, 1.02 )
								f141_arg0:registerEventHandler( "transition_complete_keyframe", f141_local0 )
							end
							
							f140_arg0:beginAnimation( 110 )
							f140_arg0:setAlpha( 0.3 )
							f140_arg0:setScale( 0.91, 0.91 )
							f140_arg0:registerEventHandler( "transition_complete_keyframe", f140_local0 )
						end
						
						f139_arg0:beginAnimation( 80 )
						f139_arg0:setAlpha( 0.25 )
						f139_arg0:setScale( 0.9, 0.9 )
						f139_arg0:registerEventHandler( "transition_complete_keyframe", f139_local0 )
					end
					
					f138_arg0:beginAnimation( 269 )
					f138_arg0:setAlpha( 0.21 )
					f138_arg0:setScale( 1, 1 )
					f138_arg0:registerEventHandler( "transition_complete_keyframe", f138_local0 )
				end
				
				f131_arg0.SmokeHorizontalSM:beginAnimation( 140 )
				f131_arg0.SmokeHorizontalSM:setAlpha( 0.07 )
				f131_arg0.SmokeHorizontalSM:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.SmokeHorizontalSM:registerEventHandler( "transition_complete_keyframe", f137_local0 )
			end
			
			f131_arg0.SmokeHorizontalSM:completeAnimation()
			f131_arg0.SmokeHorizontalSM:setAlpha( 0 )
			f131_arg0.SmokeHorizontalSM:setScale( 0, 0 )
			f131_local1( f131_arg0.SmokeHorizontalSM )
			local f131_local2 = function ( f143_arg0 )
				local f143_local0 = function ( f144_arg0 )
					local f144_local0 = function ( f145_arg0 )
						local f145_local0 = function ( f146_arg0 )
							local f146_local0 = function ( f147_arg0 )
								local f147_local0 = function ( f148_arg0 )
									f148_arg0:beginAnimation( 679 )
									f148_arg0:setAlpha( 0 )
									f148_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
								end
								
								f147_arg0:beginAnimation( 1930 )
								f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
							end
							
							f146_arg0:beginAnimation( 30 )
							f146_arg0:setAlpha( 1 )
							f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
						end
						
						f145_arg0:beginAnimation( 50 )
						f145_arg0:setAlpha( 0.94 )
						f145_arg0:setScale( 1, 1 )
						f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
					end
					
					f144_arg0:beginAnimation( 189 )
					f144_arg0:setAlpha( 0.83 )
					f144_arg0:setScale( 1.2, 1.2 )
					f144_arg0:registerEventHandler( "transition_complete_keyframe", f144_local0 )
				end
				
				f131_arg0.callingImage:beginAnimation( 200 )
				f131_arg0.callingImage:setAlpha( 0.43 )
				f131_arg0.callingImage:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.callingImage:registerEventHandler( "transition_complete_keyframe", f143_local0 )
			end
			
			f131_arg0.callingImage:completeAnimation()
			f131_arg0.callingImage:setAlpha( 0 )
			f131_arg0.callingImage:setScale( 0, 0 )
			f131_local2( f131_arg0.callingImage )
			local f131_local3 = function ( f149_arg0 )
				local f149_local0 = function ( f150_arg0 )
					local f150_local0 = function ( f151_arg0 )
						local f151_local0 = function ( f152_arg0 )
							f152_arg0:beginAnimation( 1069 )
							f152_arg0:setAlpha( 0 )
							f152_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
						end
						
						f151_arg0:beginAnimation( 1849 )
						f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
					end
					
					f150_arg0:beginAnimation( 329 )
					f150_arg0:setAlpha( 1 )
					f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
				end
				
				f131_arg0.ZmNotif1CursorHint0:beginAnimation( 120 )
				f131_arg0.ZmNotif1CursorHint0:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
			end
			
			f131_arg0.ZmNotif1CursorHint0:completeAnimation()
			f131_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f131_local3( f131_arg0.ZmNotif1CursorHint0 )
			local f131_local4 = function ( f153_arg0 )
				local f153_local0 = function ( f154_arg0 )
					local f154_local0 = function ( f155_arg0 )
						f155_arg0:beginAnimation( 869 )
						f155_arg0:setAlpha( 0 )
						f155_arg0:registerEventHandler( "transition_complete_keyframe", f131_arg0.clipFinished )
					end
					
					f154_arg0:beginAnimation( 2240 )
					f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
				end
				
				f131_arg0.ZmNotifFactory:beginAnimation( 260 )
				f131_arg0.ZmNotifFactory:setAlpha( 1 )
				f131_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f131_arg0.clipInterrupted )
				f131_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f153_local0 )
			end
			
			f131_arg0.ZmNotifFactory:completeAnimation()
			f131_arg0.ZmNotifFactory:setAlpha( 0 )
			f131_local4( f131_arg0.ZmNotifFactory )
			f131_arg0.NotifSound:completeAnimation()
			f131_arg0.NotifSound:playSound( "zmb_plr_toast_stinger", f131_arg1 )
			f131_arg0.clipFinished( f131_arg0.NotifSound )
		end,
		TextandImageKey = function ( f156_arg0, f156_arg1 )
			f156_arg0:__resetProperties()
			f156_arg0:setupElementClipCounter( 11 )
			local f156_local0 = function ( f157_arg0 )
				local f157_local0 = function ( f158_arg0 )
					local f158_local0 = function ( f159_arg0 )
						local f159_local0 = function ( f160_arg0 )
							local f160_local0 = function ( f161_arg0 )
								local f161_local0 = function ( f162_arg0 )
									local f162_local0 = function ( f163_arg0 )
										local f163_local0 = function ( f164_arg0 )
											local f164_local0 = function ( f165_arg0 )
												local f165_local0 = function ( f166_arg0 )
													local f166_local0 = function ( f167_arg0 )
														local f167_local0 = function ( f168_arg0 )
															local f168_local0 = function ( f169_arg0 )
																f169_arg0:beginAnimation( 720 )
																f169_arg0:setAlpha( 0 )
																f169_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
															end
															
															f168_arg0:beginAnimation( 109 )
															f168_arg0:setAlpha( 0.75 )
															f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
														end
														
														f167_arg0:beginAnimation( 120 )
														f167_arg0:setAlpha( 1 )
														f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
													end
													
													f166_arg0:beginAnimation( 539 )
													f166_arg0:setAlpha( 0.8 )
													f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
												end
												
												f165_arg0:beginAnimation( 500 )
												f165_arg0:setAlpha( 0.36 )
												f165_arg0:registerEventHandler( "transition_complete_keyframe", f165_local0 )
											end
											
											f164_arg0:beginAnimation( 520 )
											f164_arg0:setAlpha( 0.8 )
											f164_arg0:registerEventHandler( "transition_complete_keyframe", f164_local0 )
										end
										
										f163_arg0:beginAnimation( 579 )
										f163_arg0:setAlpha( 0.36 )
										f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
									end
									
									f162_arg0:beginAnimation( 480 )
									f162_arg0:setAlpha( 0.8 )
									f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
								end
								
								f161_arg0:beginAnimation( 340 )
								f161_arg0:setAlpha( 0.33 )
								f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
							end
							
							f160_arg0:beginAnimation( 60 )
							f160_arg0:setAlpha( 0.75 )
							f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
						end
						
						f159_arg0:beginAnimation( 60 )
						f159_arg0:setAlpha( 1 )
						f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
					end
					
					f158_arg0:beginAnimation( 160 )
					f158_arg0:setAlpha( 0.75 )
					f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
				end
				
				f156_arg0.bgbGlowOrangeOver:beginAnimation( 100 )
				f156_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f157_local0 )
			end
			
			f156_arg0.bgbGlowOrangeOver:completeAnimation()
			f156_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f156_local0( f156_arg0.bgbGlowOrangeOver )
			local f156_local1 = function ( f170_arg0 )
				local f170_local0 = function ( f171_arg0 )
					local f171_local0 = function ( f172_arg0 )
						local f172_local0 = function ( f173_arg0 )
							local f173_local0 = function ( f174_arg0 )
								local f174_local0 = function ( f175_arg0 )
									local f175_local0 = function ( f176_arg0 )
										local f176_local0 = function ( f177_arg0 )
											f177_arg0:beginAnimation( 39 )
											f177_arg0:setScale( 0.5, 0.5 )
											f177_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
										end
										
										f176_arg0:beginAnimation( 340 )
										f176_arg0:setAlpha( 0 )
										f176_arg0:setScale( 0.57, 0.57 )
										f176_arg0:registerEventHandler( "transition_complete_keyframe", f176_local0 )
									end
									
									f175_arg0:beginAnimation( 99 )
									f175_arg0:setAlpha( 0.77 )
									f175_arg0:setScale( 1.2, 1.2 )
									f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
								end
								
								f174_arg0:beginAnimation( 29 )
								f174_arg0:setScale( 0.82, 0.82 )
								f174_arg0:registerEventHandler( "transition_complete_keyframe", f174_local0 )
							end
							
							f173_arg0:beginAnimation( 3170 )
							f173_arg0:registerEventHandler( "transition_complete_keyframe", f173_local0 )
						end
						
						f172_arg0:beginAnimation( 40 )
						f172_arg0:setScale( 0.7, 0.7 )
						f172_arg0:registerEventHandler( "transition_complete_keyframe", f172_local0 )
					end
					
					f171_arg0:beginAnimation( 160 )
					f171_arg0:setAlpha( 1 )
					f171_arg0:setScale( 1.2, 1.2 )
					f171_arg0:registerEventHandler( "transition_complete_keyframe", f171_local0 )
				end
				
				f156_arg0.KeyEnabled:beginAnimation( 100 )
				f156_arg0.KeyEnabled:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.KeyEnabled:registerEventHandler( "transition_complete_keyframe", f170_local0 )
			end
			
			f156_arg0.KeyEnabled:completeAnimation()
			f156_arg0.KeyEnabled:setAlpha( 0 )
			f156_arg0.KeyEnabled:setScale( 0.5, 0.5 )
			f156_local1( f156_arg0.KeyEnabled )
			local f156_local2 = function ( f178_arg0 )
				local f178_local0 = function ( f179_arg0 )
					f179_arg0:beginAnimation( 139 )
					f179_arg0:setAlpha( 0 )
					f179_arg0:setZRot( 360 )
					f179_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.bgbAbilitySwirl:beginAnimation( 280 )
				f156_arg0.bgbAbilitySwirl:setAlpha( 0.8 )
				f156_arg0.bgbAbilitySwirl:setZRot( 240 )
				f156_arg0.bgbAbilitySwirl:setScale( 1.7, 1.7 )
				f156_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f178_local0 )
			end
			
			f156_arg0.bgbAbilitySwirl:completeAnimation()
			f156_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f156_arg0.bgbAbilitySwirl:setZRot( 0 )
			f156_arg0.bgbAbilitySwirl:setScale( 1, 1 )
			f156_local2( f156_arg0.bgbAbilitySwirl )
			f156_arg0.ZmFxSpark20:completeAnimation()
			f156_arg0.ZmFxSpark20:setAlpha( 0 )
			f156_arg0.clipFinished( f156_arg0.ZmFxSpark20 )
			local f156_local3 = function ( f180_arg0 )
				local f180_local0 = function ( f181_arg0 )
					f181_arg0:beginAnimation( 439 )
					f181_arg0:setAlpha( 0 )
					f181_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.ZmAmmoParticleFX1left:beginAnimation( 2930 )
				f156_arg0.ZmAmmoParticleFX1left:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", f180_local0 )
			end
			
			f156_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f156_arg0.ZmAmmoParticleFX1left:setAlpha( 1 )
			f156_local3( f156_arg0.ZmAmmoParticleFX1left )
			local f156_local4 = function ( f182_arg0 )
				local f182_local0 = function ( f183_arg0 )
					f183_arg0:beginAnimation( 439 )
					f183_arg0:setAlpha( 0 )
					f183_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.ZmAmmoParticleFX2left:beginAnimation( 2930 )
				f156_arg0.ZmAmmoParticleFX2left:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", f182_local0 )
			end
			
			f156_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f156_arg0.ZmAmmoParticleFX2left:setAlpha( 1 )
			f156_local4( f156_arg0.ZmAmmoParticleFX2left )
			local f156_local5 = function ( f184_arg0 )
				local f184_local0 = function ( f185_arg0 )
					f185_arg0:beginAnimation( 439 )
					f185_arg0:setAlpha( 0 )
					f185_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.ZmAmmoParticleFX3left:beginAnimation( 2930 )
				f156_arg0.ZmAmmoParticleFX3left:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", f184_local0 )
			end
			
			f156_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f156_arg0.ZmAmmoParticleFX3left:setAlpha( 1 )
			f156_local5( f156_arg0.ZmAmmoParticleFX3left )
			local f156_local6 = function ( f186_arg0 )
				local f186_local0 = function ( f187_arg0 )
					f187_arg0:beginAnimation( 439 )
					f187_arg0:setAlpha( 0 )
					f187_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.ZmAmmoParticleFX1right:beginAnimation( 2930 )
				f156_arg0.ZmAmmoParticleFX1right:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", f186_local0 )
			end
			
			f156_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f156_arg0.ZmAmmoParticleFX1right:setAlpha( 1 )
			f156_local6( f156_arg0.ZmAmmoParticleFX1right )
			local f156_local7 = function ( f188_arg0 )
				local f188_local0 = function ( f189_arg0 )
					f189_arg0:beginAnimation( 439 )
					f189_arg0:setAlpha( 0 )
					f189_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.ZmAmmoParticleFX2right:beginAnimation( 2930 )
				f156_arg0.ZmAmmoParticleFX2right:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", f188_local0 )
			end
			
			f156_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f156_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
			f156_local7( f156_arg0.ZmAmmoParticleFX2right )
			local f156_local8 = function ( f190_arg0 )
				local f190_local0 = function ( f191_arg0 )
					f191_arg0:beginAnimation( 609, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
					f191_arg0:setRGB( 0, 0.56, 1 )
					f191_arg0:setAlpha( 0 )
					f191_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
				end
				
				f156_arg0.Flsh:beginAnimation( 40 )
				f156_arg0.Flsh:setRGB( 0, 0.86, 1 )
				f156_arg0.Flsh:setAlpha( 1 )
				f156_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f190_local0 )
			end
			
			f156_arg0.Flsh:completeAnimation()
			f156_arg0.Flsh:setRGB( 0, 0.53, 1 )
			f156_arg0.Flsh:setAlpha( 0.36 )
			f156_local8( f156_arg0.Flsh )
			local f156_local9 = function ( f192_arg0 )
				local f192_local0 = function ( f193_arg0 )
					local f193_local0 = function ( f194_arg0 )
						f194_arg0:beginAnimation( 869 )
						f194_arg0:setAlpha( 0 )
						f194_arg0:registerEventHandler( "transition_complete_keyframe", f156_arg0.clipFinished )
					end
					
					f193_arg0:beginAnimation( 2240 )
					f193_arg0:registerEventHandler( "transition_complete_keyframe", f193_local0 )
				end
				
				f156_arg0.ZmNotifFactory:beginAnimation( 260, Enum[0xF50FFF429AB1890][0x5D2D9CF90AB1735] )
				f156_arg0.ZmNotifFactory:setAlpha( 1 )
				f156_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f156_arg0.clipInterrupted )
				f156_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f192_local0 )
			end
			
			f156_arg0.ZmNotifFactory:completeAnimation()
			f156_arg0.ZmNotifFactory:setAlpha( 0 )
			f156_local9( f156_arg0.ZmNotifFactory )
		end,
		TextandImageExtraLife = function ( f195_arg0, f195_arg1 )
			f195_arg0:__resetProperties()
			f195_arg0:setupElementClipCounter( 11 )
			local f195_local0 = function ( f196_arg0 )
				local f196_local0 = function ( f197_arg0 )
					local f197_local0 = function ( f198_arg0 )
						local f198_local0 = function ( f199_arg0 )
							local f199_local0 = function ( f200_arg0 )
								local f200_local0 = function ( f201_arg0 )
									local f201_local0 = function ( f202_arg0 )
										local f202_local0 = function ( f203_arg0 )
											local f203_local0 = function ( f204_arg0 )
												local f204_local0 = function ( f205_arg0 )
													local f205_local0 = function ( f206_arg0 )
														local f206_local0 = function ( f207_arg0 )
															local f207_local0 = function ( f208_arg0 )
																f208_arg0:beginAnimation( 220 )
																f208_arg0:setAlpha( 0 )
																f208_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
															end
															
															f207_arg0:beginAnimation( 109 )
															f207_arg0:setAlpha( 0.75 )
															f207_arg0:registerEventHandler( "transition_complete_keyframe", f207_local0 )
														end
														
														f206_arg0:beginAnimation( 120 )
														f206_arg0:setAlpha( 1 )
														f206_arg0:registerEventHandler( "transition_complete_keyframe", f206_local0 )
													end
													
													f205_arg0:beginAnimation( 539 )
													f205_arg0:setAlpha( 0.8 )
													f205_arg0:registerEventHandler( "transition_complete_keyframe", f205_local0 )
												end
												
												f204_arg0:beginAnimation( 500 )
												f204_arg0:setAlpha( 0.36 )
												f204_arg0:registerEventHandler( "transition_complete_keyframe", f204_local0 )
											end
											
											f203_arg0:beginAnimation( 520 )
											f203_arg0:setAlpha( 0.8 )
											f203_arg0:registerEventHandler( "transition_complete_keyframe", f203_local0 )
										end
										
										f202_arg0:beginAnimation( 579 )
										f202_arg0:setAlpha( 0.36 )
										f202_arg0:registerEventHandler( "transition_complete_keyframe", f202_local0 )
									end
									
									f201_arg0:beginAnimation( 480 )
									f201_arg0:setAlpha( 0.8 )
									f201_arg0:registerEventHandler( "transition_complete_keyframe", f201_local0 )
								end
								
								f200_arg0:beginAnimation( 340 )
								f200_arg0:setAlpha( 0.33 )
								f200_arg0:registerEventHandler( "transition_complete_keyframe", f200_local0 )
							end
							
							f199_arg0:beginAnimation( 60 )
							f199_arg0:setAlpha( 0.75 )
							f199_arg0:registerEventHandler( "transition_complete_keyframe", f199_local0 )
						end
						
						f198_arg0:beginAnimation( 60 )
						f198_arg0:setAlpha( 1 )
						f198_arg0:registerEventHandler( "transition_complete_keyframe", f198_local0 )
					end
					
					f197_arg0:beginAnimation( 160 )
					f197_arg0:setAlpha( 0.75 )
					f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
				end
				
				f195_arg0.bgbGlowOrangeOver:beginAnimation( 100 )
				f195_arg0.bgbGlowOrangeOver:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", f196_local0 )
			end
			
			f195_arg0.bgbGlowOrangeOver:completeAnimation()
			f195_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f195_local0( f195_arg0.bgbGlowOrangeOver )
			local f195_local1 = function ( f209_arg0 )
				local f209_local0 = function ( f210_arg0 )
					local f210_local0 = function ( f211_arg0 )
						local f211_local0 = function ( f212_arg0 )
							local f212_local0 = function ( f213_arg0 )
								local f213_local0 = function ( f214_arg0 )
									local f214_local0 = function ( f215_arg0 )
										local f215_local0 = function ( f216_arg0 )
											f216_arg0:beginAnimation( 39 )
											f216_arg0:setLeftRight( 0, 0, -849.5, -602.5 )
											f216_arg0:setTopBottom( 0, 0, 894, 1123 )
											f216_arg0:setScale( 0.5, 0.5 )
											f216_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
										end
										
										f215_arg0:beginAnimation( 360 )
										f215_arg0:setLeftRight( 0, 0, -463, -216 )
										f215_arg0:setTopBottom( 0, 0, 625, 854 )
										f215_arg0:setAlpha( 0 )
										f215_arg0:setScale( 0.57, 0.57 )
										f215_arg0:registerEventHandler( "transition_complete_keyframe", f215_local0 )
									end
									
									f214_arg0:beginAnimation( 99 )
									f214_arg0:setTopBottom( 0, 0, 24, 253 )
									f214_arg0:setAlpha( 0.78 )
									f214_arg0:registerEventHandler( "transition_complete_keyframe", f214_local0 )
								end
								
								f213_arg0:beginAnimation( 29 )
								f213_arg0:registerEventHandler( "transition_complete_keyframe", f213_local0 )
							end
							
							f212_arg0:beginAnimation( 3150 )
							f212_arg0:registerEventHandler( "transition_complete_keyframe", f212_local0 )
						end
						
						f211_arg0:beginAnimation( 60 )
						f211_arg0:registerEventHandler( "transition_complete_keyframe", f211_local0 )
					end
					
					f210_arg0:beginAnimation( 160 )
					f210_arg0:setAlpha( 1 )
					f210_arg0:setScale( 1.2, 1.2 )
					f210_arg0:registerEventHandler( "transition_complete_keyframe", f210_local0 )
				end
				
				f195_arg0.RushHeart:beginAnimation( 100 )
				f195_arg0.RushHeart:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.RushHeart:registerEventHandler( "transition_complete_keyframe", f209_local0 )
			end
			
			f195_arg0.RushHeart:completeAnimation()
			f195_arg0.RushHeart:setLeftRight( 0, 0, 100, 347 )
			f195_arg0.RushHeart:setTopBottom( 0, 0, 14, 243 )
			f195_arg0.RushHeart:setAlpha( 0 )
			f195_arg0.RushHeart:setScale( 0.5, 0.5 )
			f195_local1( f195_arg0.RushHeart )
			local f195_local2 = function ( f217_arg0 )
				local f217_local0 = function ( f218_arg0 )
					f218_arg0:beginAnimation( 139 )
					f218_arg0:setAlpha( 0 )
					f218_arg0:setZRot( 360 )
					f218_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.bgbAbilitySwirl:beginAnimation( 280 )
				f195_arg0.bgbAbilitySwirl:setAlpha( 0.8 )
				f195_arg0.bgbAbilitySwirl:setZRot( 240 )
				f195_arg0.bgbAbilitySwirl:setScale( 1.7, 1.7 )
				f195_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f217_local0 )
			end
			
			f195_arg0.bgbAbilitySwirl:completeAnimation()
			f195_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f195_arg0.bgbAbilitySwirl:setZRot( 0 )
			f195_arg0.bgbAbilitySwirl:setScale( 1, 1 )
			f195_local2( f195_arg0.bgbAbilitySwirl )
			f195_arg0.ZmFxSpark20:completeAnimation()
			f195_arg0.ZmFxSpark20:setAlpha( 0 )
			f195_arg0.clipFinished( f195_arg0.ZmFxSpark20 )
			local f195_local3 = function ( f219_arg0 )
				local f219_local0 = function ( f220_arg0 )
					f220_arg0:beginAnimation( 439 )
					f220_arg0:setAlpha( 0 )
					f220_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.ZmAmmoParticleFX1left:beginAnimation( 2930 )
				f195_arg0.ZmAmmoParticleFX1left:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", f219_local0 )
			end
			
			f195_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f195_arg0.ZmAmmoParticleFX1left:setAlpha( 1 )
			f195_local3( f195_arg0.ZmAmmoParticleFX1left )
			local f195_local4 = function ( f221_arg0 )
				local f221_local0 = function ( f222_arg0 )
					f222_arg0:beginAnimation( 439 )
					f222_arg0:setAlpha( 0 )
					f222_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.ZmAmmoParticleFX2left:beginAnimation( 2930 )
				f195_arg0.ZmAmmoParticleFX2left:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", f221_local0 )
			end
			
			f195_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f195_arg0.ZmAmmoParticleFX2left:setAlpha( 1 )
			f195_local4( f195_arg0.ZmAmmoParticleFX2left )
			local f195_local5 = function ( f223_arg0 )
				local f223_local0 = function ( f224_arg0 )
					f224_arg0:beginAnimation( 439 )
					f224_arg0:setAlpha( 0 )
					f224_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.ZmAmmoParticleFX3left:beginAnimation( 2930 )
				f195_arg0.ZmAmmoParticleFX3left:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", f223_local0 )
			end
			
			f195_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f195_arg0.ZmAmmoParticleFX3left:setAlpha( 1 )
			f195_local5( f195_arg0.ZmAmmoParticleFX3left )
			local f195_local6 = function ( f225_arg0 )
				local f225_local0 = function ( f226_arg0 )
					f226_arg0:beginAnimation( 439 )
					f226_arg0:setAlpha( 0 )
					f226_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.ZmAmmoParticleFX1right:beginAnimation( 2930 )
				f195_arg0.ZmAmmoParticleFX1right:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", f225_local0 )
			end
			
			f195_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f195_arg0.ZmAmmoParticleFX1right:setAlpha( 1 )
			f195_local6( f195_arg0.ZmAmmoParticleFX1right )
			local f195_local7 = function ( f227_arg0 )
				local f227_local0 = function ( f228_arg0 )
					f228_arg0:beginAnimation( 439 )
					f228_arg0:setAlpha( 0 )
					f228_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.ZmAmmoParticleFX2right:beginAnimation( 2930 )
				f195_arg0.ZmAmmoParticleFX2right:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", f227_local0 )
			end
			
			f195_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f195_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
			f195_local7( f195_arg0.ZmAmmoParticleFX2right )
			local f195_local8 = function ( f229_arg0 )
				local f229_local0 = function ( f230_arg0 )
					f230_arg0:beginAnimation( 609 )
					f230_arg0:setRGB( 0, 0.56, 1 )
					f230_arg0:setAlpha( 0 )
					f230_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
				end
				
				f195_arg0.Flsh:beginAnimation( 40 )
				f195_arg0.Flsh:setRGB( 0, 0.86, 1 )
				f195_arg0.Flsh:setAlpha( 1 )
				f195_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f229_local0 )
			end
			
			f195_arg0.Flsh:completeAnimation()
			f195_arg0.Flsh:setRGB( 0, 0.53, 1 )
			f195_arg0.Flsh:setAlpha( 0.36 )
			f195_local8( f195_arg0.Flsh )
			local f195_local9 = function ( f231_arg0 )
				local f231_local0 = function ( f232_arg0 )
					local f232_local0 = function ( f233_arg0 )
						f233_arg0:beginAnimation( 869 )
						f233_arg0:setAlpha( 0 )
						f233_arg0:registerEventHandler( "transition_complete_keyframe", f195_arg0.clipFinished )
					end
					
					f232_arg0:beginAnimation( 2240 )
					f232_arg0:registerEventHandler( "transition_complete_keyframe", f232_local0 )
				end
				
				f195_arg0.ZmNotifFactory:beginAnimation( 260 )
				f195_arg0.ZmNotifFactory:setAlpha( 1 )
				f195_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f195_arg0.clipInterrupted )
				f195_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f231_local0 )
			end
			
			f195_arg0.ZmNotifFactory:completeAnimation()
			f195_arg0.ZmNotifFactory:setAlpha( 0 )
			f195_local9( f195_arg0.ZmNotifFactory )
		end,
		TrialsRoundSplash = function ( f234_arg0, f234_arg1 )
			f234_arg0:__resetProperties()
			f234_arg0:setupElementClipCounter( 1 )
			local f234_local0 = function ( f235_arg0 )
				f234_arg0.ZMTrialTitleNotif:beginAnimation( 11000 )
				f234_arg0.ZMTrialTitleNotif:registerEventHandler( "interrupted_keyframe", f234_arg0.clipInterrupted )
				f234_arg0.ZMTrialTitleNotif:registerEventHandler( "transition_complete_keyframe", f234_arg0.clipFinished )
			end
			
			f234_arg0.ZMTrialTitleNotif:completeAnimation()
			f234_arg0.ZMTrialTitleNotif:setAlpha( 1 )
			f234_local0( f234_arg0.ZMTrialTitleNotif )
		end,
		TextAndImageSpecial = function ( f236_arg0, f236_arg1 )
			f236_arg0:__resetProperties()
			f236_arg0:setupElementClipCounter( 10 )
			local f236_local0 = function ( f237_arg0 )
				local f237_local0 = function ( f238_arg0 )
					local f238_local0 = function ( f239_arg0 )
						local f239_local0 = function ( f240_arg0 )
							local f240_local0 = function ( f241_arg0 )
								local f241_local0 = function ( f242_arg0 )
									local f242_local0 = function ( f243_arg0 )
										local f243_local0 = function ( f244_arg0 )
											f244_arg0:beginAnimation( 39 )
											f244_arg0:setScale( 0.5, 0.5 )
											f244_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
										end
										
										f243_arg0:beginAnimation( 340 )
										f243_arg0:setAlpha( 0 )
										f243_arg0:setScale( 0.57, 0.57 )
										f243_arg0:registerEventHandler( "transition_complete_keyframe", f243_local0 )
									end
									
									f242_arg0:beginAnimation( 99 )
									f242_arg0:setAlpha( 0.77 )
									f242_arg0:setScale( 1.2, 1.2 )
									f242_arg0:registerEventHandler( "transition_complete_keyframe", f242_local0 )
								end
								
								f241_arg0:beginAnimation( 29 )
								f241_arg0:setScale( 0.82, 0.82 )
								f241_arg0:registerEventHandler( "transition_complete_keyframe", f241_local0 )
							end
							
							f240_arg0:beginAnimation( 3170 )
							f240_arg0:registerEventHandler( "transition_complete_keyframe", f240_local0 )
						end
						
						f239_arg0:beginAnimation( 40 )
						f239_arg0:setScale( 0.7, 0.7 )
						f239_arg0:registerEventHandler( "transition_complete_keyframe", f239_local0 )
					end
					
					f238_arg0:beginAnimation( 160 )
					f238_arg0:setAlpha( 1 )
					f238_arg0:setScale( 1.2, 1.2 )
					f238_arg0:registerEventHandler( "transition_complete_keyframe", f238_local0 )
				end
				
				f236_arg0.specialImage:beginAnimation( 100 )
				f236_arg0.specialImage:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.specialImage:registerEventHandler( "transition_complete_keyframe", f237_local0 )
			end
			
			f236_arg0.specialImage:completeAnimation()
			f236_arg0.specialImage:setAlpha( 0 )
			f236_arg0.specialImage:setScale( 0.5, 0.5 )
			f236_local0( f236_arg0.specialImage )
			local f236_local1 = function ( f245_arg0 )
				local f245_local0 = function ( f246_arg0 )
					f246_arg0:beginAnimation( 139 )
					f246_arg0:setAlpha( 0 )
					f246_arg0:setZRot( 360 )
					f246_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.bgbAbilitySwirl:beginAnimation( 280 )
				f236_arg0.bgbAbilitySwirl:setAlpha( 0.8 )
				f236_arg0.bgbAbilitySwirl:setZRot( 240 )
				f236_arg0.bgbAbilitySwirl:setScale( 1.7, 1.7 )
				f236_arg0.bgbAbilitySwirl:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", f245_local0 )
			end
			
			f236_arg0.bgbAbilitySwirl:completeAnimation()
			f236_arg0.bgbAbilitySwirl:setRGB( ColorSet.EnemyOrange_Bright.r, ColorSet.EnemyOrange_Bright.g, ColorSet.EnemyOrange_Bright.b )
			f236_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f236_arg0.bgbAbilitySwirl:setZRot( 0 )
			f236_arg0.bgbAbilitySwirl:setScale( 1, 1 )
			f236_local1( f236_arg0.bgbAbilitySwirl )
			f236_arg0.ZmFxSpark20:completeAnimation()
			f236_arg0.ZmFxSpark20:setAlpha( 0 )
			f236_arg0.clipFinished( f236_arg0.ZmFxSpark20 )
			local f236_local2 = function ( f247_arg0 )
				local f247_local0 = function ( f248_arg0 )
					f248_arg0:beginAnimation( 439 )
					f248_arg0:setAlpha( 0 )
					f248_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.ZmAmmoParticleFX1left:beginAnimation( 2930 )
				f236_arg0.ZmAmmoParticleFX1left:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", f247_local0 )
			end
			
			f236_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f236_arg0.ZmAmmoParticleFX1left:setAlpha( 1 )
			f236_local2( f236_arg0.ZmAmmoParticleFX1left )
			local f236_local3 = function ( f249_arg0 )
				local f249_local0 = function ( f250_arg0 )
					f250_arg0:beginAnimation( 439 )
					f250_arg0:setAlpha( 0 )
					f250_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.ZmAmmoParticleFX2left:beginAnimation( 2930 )
				f236_arg0.ZmAmmoParticleFX2left:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", f249_local0 )
			end
			
			f236_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f236_arg0.ZmAmmoParticleFX2left:setAlpha( 1 )
			f236_local3( f236_arg0.ZmAmmoParticleFX2left )
			local f236_local4 = function ( f251_arg0 )
				local f251_local0 = function ( f252_arg0 )
					f252_arg0:beginAnimation( 439 )
					f252_arg0:setAlpha( 0 )
					f252_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.ZmAmmoParticleFX3left:beginAnimation( 2930 )
				f236_arg0.ZmAmmoParticleFX3left:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", f251_local0 )
			end
			
			f236_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f236_arg0.ZmAmmoParticleFX3left:setAlpha( 1 )
			f236_local4( f236_arg0.ZmAmmoParticleFX3left )
			local f236_local5 = function ( f253_arg0 )
				local f253_local0 = function ( f254_arg0 )
					f254_arg0:beginAnimation( 439 )
					f254_arg0:setAlpha( 0 )
					f254_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.ZmAmmoParticleFX1right:beginAnimation( 2930 )
				f236_arg0.ZmAmmoParticleFX1right:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", f253_local0 )
			end
			
			f236_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f236_arg0.ZmAmmoParticleFX1right:setAlpha( 1 )
			f236_local5( f236_arg0.ZmAmmoParticleFX1right )
			local f236_local6 = function ( f255_arg0 )
				local f255_local0 = function ( f256_arg0 )
					f256_arg0:beginAnimation( 439 )
					f256_arg0:setAlpha( 0 )
					f256_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.ZmAmmoParticleFX2right:beginAnimation( 2930 )
				f236_arg0.ZmAmmoParticleFX2right:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", f255_local0 )
			end
			
			f236_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f236_arg0.ZmAmmoParticleFX2right:setAlpha( 1 )
			f236_local6( f236_arg0.ZmAmmoParticleFX2right )
			local f236_local7 = function ( f257_arg0 )
				local f257_local0 = function ( f258_arg0 )
					f258_arg0:beginAnimation( 609 )
					f258_arg0:setAlpha( 0 )
					f258_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
				end
				
				f236_arg0.Flsh:beginAnimation( 40 )
				f236_arg0.Flsh:setAlpha( 1 )
				f236_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f257_local0 )
			end
			
			f236_arg0.Flsh:completeAnimation()
			f236_arg0.Flsh:setRGB( ColorSet.EnemyOrange_Bright.r, ColorSet.EnemyOrange_Bright.g, ColorSet.EnemyOrange_Bright.b )
			f236_arg0.Flsh:setAlpha( 0.36 )
			f236_local7( f236_arg0.Flsh )
			local f236_local8 = function ( f259_arg0 )
				local f259_local0 = function ( f260_arg0 )
					local f260_local0 = function ( f261_arg0 )
						local f261_local0 = function ( f262_arg0 )
							f262_arg0:beginAnimation( 869 )
							f262_arg0:setAlpha( 0 )
							f262_arg0:registerEventHandler( "transition_complete_keyframe", f236_arg0.clipFinished )
						end
						
						f261_arg0:beginAnimation( 1569 )
						f261_arg0:registerEventHandler( "transition_complete_keyframe", f261_local0 )
					end
					
					f260_arg0:beginAnimation( 670 )
					f260_arg0:registerEventHandler( "transition_complete_keyframe", f260_local0 )
				end
				
				f236_arg0.ZmNotifFactory:beginAnimation( 260 )
				f236_arg0.ZmNotifFactory:setAlpha( 1 )
				f236_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f236_arg0.clipInterrupted )
				f236_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f259_local0 )
			end
			
			f236_arg0.ZmNotifFactory:completeAnimation()
			f236_arg0.ZmNotifFactory:setTopBottom( 0, 0, 207, 289 )
			f236_arg0.ZmNotifFactory:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
			f236_arg0.ZmNotifFactory:setAlpha( 0 )
			f236_local8( f236_arg0.ZmNotifFactory )
		end,
		TcmSplash = function ( f263_arg0, f263_arg1 )
			f263_arg0:__resetProperties()
			f263_arg0:setupElementClipCounter( 1 )
			local f263_local0 = function ( f264_arg0 )
				local f264_local0 = function ( f265_arg0 )
					local f265_local0 = function ( f266_arg0 )
						f266_arg0:beginAnimation( 500 )
						f266_arg0:setAlpha( 0 )
						f266_arg0:registerEventHandler( "transition_complete_keyframe", f263_arg0.clipFinished )
					end
					
					f265_arg0:beginAnimation( 7500 )
					f265_arg0:registerEventHandler( "transition_complete_keyframe", f265_local0 )
				end
				
				f263_arg0.TcmSplash:beginAnimation( 500 )
				f263_arg0.TcmSplash:setAlpha( 1 )
				f263_arg0.TcmSplash:registerEventHandler( "interrupted_keyframe", f263_arg0.clipInterrupted )
				f263_arg0.TcmSplash:registerEventHandler( "transition_complete_keyframe", f264_local0 )
			end
			
			f263_arg0.TcmSplash:completeAnimation()
			f263_arg0.TcmSplash:setAlpha( 0 )
			f263_local0( f263_arg0.TcmSplash )
		end,
		TextandImageBasic_Story2 = function ( f267_arg0, f267_arg1 )
			f267_arg0:__resetProperties()
			f267_arg0:setupElementClipCounter( 8 )
			f267_arg0.callingImage:completeAnimation()
			f267_arg0.callingImage:setAlpha( 0 )
			f267_arg0.clipFinished( f267_arg0.callingImage )
			local f267_local0 = function ( f268_arg0 )
				local f268_local0 = function ( f269_arg0 )
					local f269_local0 = function ( f270_arg0 )
						f270_arg0:beginAnimation( 199 )
						f270_arg0:setAlpha( 0 )
						f270_arg0:registerEventHandler( "transition_complete_keyframe", f267_arg0.clipFinished )
					end
					
					f269_arg0:beginAnimation( 3700 )
					f269_arg0:registerEventHandler( "transition_complete_keyframe", f269_local0 )
				end
				
				f267_arg0.particleLeft:beginAnimation( 300 )
				f267_arg0.particleLeft:setAlpha( 1 )
				f267_arg0.particleLeft:registerEventHandler( "interrupted_keyframe", f267_arg0.clipInterrupted )
				f267_arg0.particleLeft:registerEventHandler( "transition_complete_keyframe", f268_local0 )
			end
			
			f267_arg0.particleLeft:completeAnimation()
			f267_arg0.particleLeft:setAlpha( 0 )
			f267_local0( f267_arg0.particleLeft )
			local f267_local1 = function ( f271_arg0 )
				local f271_local0 = function ( f272_arg0 )
					local f272_local0 = function ( f273_arg0 )
						f273_arg0:beginAnimation( 199 )
						f273_arg0:setAlpha( 0 )
						f273_arg0:registerEventHandler( "transition_complete_keyframe", f267_arg0.clipFinished )
					end
					
					f272_arg0:beginAnimation( 3700 )
					f272_arg0:registerEventHandler( "transition_complete_keyframe", f272_local0 )
				end
				
				f267_arg0.particleRight:beginAnimation( 300 )
				f267_arg0.particleRight:setAlpha( 1 )
				f267_arg0.particleRight:registerEventHandler( "interrupted_keyframe", f267_arg0.clipInterrupted )
				f267_arg0.particleRight:registerEventHandler( "transition_complete_keyframe", f271_local0 )
			end
			
			f267_arg0.particleRight:completeAnimation()
			f267_arg0.particleRight:setAlpha( 0 )
			f267_local1( f267_arg0.particleRight )
			local f267_local2 = function ( f274_arg0 )
				local f274_local0 = function ( f275_arg0 )
					f275_arg0:beginAnimation( 1839, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
					f275_arg0:setLeftRight( 0.5, 0.5, -340, 104 )
					f275_arg0:setAlpha( 0 )
					f275_arg0:registerEventHandler( "transition_complete_keyframe", f267_arg0.clipFinished )
				end
				
				f274_arg0:beginAnimation( 2020, Enum[0xF50FFF429AB1890][0x53CEB9A0427197] )
				f274_arg0:setLeftRight( 0.5, 0.5, -265.64, 178.36 )
				f274_arg0:setAlpha( 1 )
				f274_arg0:registerEventHandler( "transition_complete_keyframe", f274_local0 )
			end
			
			f267_arg0.Flsh:beginAnimation( 140 )
			f267_arg0.Flsh:setLeftRight( 0.5, 0.5, -184, 260 )
			f267_arg0.Flsh:setRGB( 0.35, 0, 1 )
			f267_arg0.Flsh:setAlpha( 0 )
			f267_arg0.Flsh:registerEventHandler( "interrupted_keyframe", f267_arg0.clipInterrupted )
			f267_arg0.Flsh:registerEventHandler( "transition_complete_keyframe", f267_local2 )
			f267_arg0.ZmNotif1CursorHint0:completeAnimation()
			f267_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f267_arg0.clipFinished( f267_arg0.ZmNotif1CursorHint0 )
			local f267_local3 = function ( f276_arg0 )
				local f276_local0 = function ( f277_arg0 )
					local f277_local0 = function ( f278_arg0 )
						f278_arg0:beginAnimation( 199 )
						f278_arg0:setAlpha( 0 )
						f278_arg0:registerEventHandler( "transition_complete_keyframe", f267_arg0.clipFinished )
					end
					
					f277_arg0:beginAnimation( 3700 )
					f277_arg0:registerEventHandler( "transition_complete_keyframe", f277_local0 )
				end
				
				f276_arg0:beginAnimation( 160 )
				f276_arg0:setAlpha( 1 )
				f276_arg0:registerEventHandler( "transition_complete_keyframe", f276_local0 )
			end
			
			f267_arg0.ZmNotifFactory:beginAnimation( 140 )
			f267_arg0.ZmNotifFactory:setAlpha( 0 )
			f267_arg0.ZmNotifFactory:registerEventHandler( "interrupted_keyframe", f267_arg0.clipInterrupted )
			f267_arg0.ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", f267_local3 )
			f267_arg0.firework:completeAnimation()
			f267_arg0.firework:playClip( "TextandImageBasic" )
			f267_arg0.clipFinished( f267_arg0.firework )
			local f267_local4 = function ( f279_arg0 )
				local f279_local0 = function ( f280_arg0 )
					local f280_local0 = function ( f281_arg0 )
						f281_arg0:beginAnimation( 199 )
						f281_arg0:setAlpha( 0 )
						f281_arg0:registerEventHandler( "transition_complete_keyframe", f267_arg0.clipFinished )
					end
					
					f280_arg0:beginAnimation( 3700 )
					f280_arg0:registerEventHandler( "transition_complete_keyframe", f280_local0 )
				end
				
				f279_arg0:beginAnimation( 210 )
				f279_arg0:setAlpha( 1 )
				f279_arg0:registerEventHandler( "transition_complete_keyframe", f279_local0 )
			end
			
			f267_arg0.scaffold:beginAnimation( 90 )
			f267_arg0.scaffold:setAlpha( 0 )
			f267_arg0.scaffold:registerEventHandler( "interrupted_keyframe", f267_arg0.clipInterrupted )
			f267_arg0.scaffold:registerEventHandler( "transition_complete_keyframe", f267_local4 )
		end,
		TributeSplash = function ( f282_arg0, f282_arg1 )
			f282_arg0:__resetProperties()
			f282_arg0:setupElementClipCounter( 1 )
			local f282_local0 = function ( f283_arg0 )
				f282_arg0.TributeSplash:beginAnimation( 5250 )
				f282_arg0.TributeSplash:registerEventHandler( "interrupted_keyframe", f282_arg0.clipInterrupted )
				f282_arg0.TributeSplash:registerEventHandler( "transition_complete_keyframe", f282_arg0.clipFinished )
			end
			
			f282_arg0.TributeSplash:completeAnimation()
			f282_arg0.TributeSplash:setAlpha( 1 )
			f282_local0( f282_arg0.TributeSplash )
		end
	},
	Hidden = {
		DefaultClip = function ( f284_arg0, f284_arg1 )
			f284_arg0:__resetProperties()
			f284_arg0:setupElementClipCounter( 25 )
			f284_arg0.Pointers:completeAnimation()
			f284_arg0.Pointers:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Pointers )
			f284_arg0.BlackBacker:completeAnimation()
			f284_arg0.BlackBacker:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.BlackBacker )
			f284_arg0.ZMTrialTitleNotif:completeAnimation()
			f284_arg0.ZMTrialTitleNotif:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZMTrialTitleNotif )
			f284_arg0.Star:completeAnimation()
			f284_arg0.Star:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Star )
			f284_arg0.Aura:completeAnimation()
			f284_arg0.Aura:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Aura )
			f284_arg0.Symbol:completeAnimation()
			f284_arg0.Symbol:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Symbol )
			f284_arg0.bgbGlowOrangeOver:completeAnimation()
			f284_arg0.bgbGlowOrangeOver:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.bgbGlowOrangeOver )
			f284_arg0.KeyEnabled:completeAnimation()
			f284_arg0.KeyEnabled:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.KeyEnabled )
			f284_arg0.RushHeart:completeAnimation()
			f284_arg0.RushHeart:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.RushHeart )
			f284_arg0.bgbTexture:completeAnimation()
			f284_arg0.bgbTexture:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.bgbTexture )
			f284_arg0.bgbAbilitySwirl:completeAnimation()
			f284_arg0.bgbAbilitySwirl:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.bgbAbilitySwirl )
			f284_arg0.Ring:completeAnimation()
			f284_arg0.Ring:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Ring )
			f284_arg0.ZmFxSpark20:completeAnimation()
			f284_arg0.ZmFxSpark20:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmFxSpark20 )
			f284_arg0.callingImage:completeAnimation()
			f284_arg0.callingImage:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.callingImage )
			f284_arg0.ZmAmmoParticleFX3right:completeAnimation()
			f284_arg0.ZmAmmoParticleFX3right:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX3right )
			f284_arg0.ZmAmmoParticleFX1left:completeAnimation()
			f284_arg0.ZmAmmoParticleFX1left:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX1left )
			f284_arg0.ZmAmmoParticleFX2left:completeAnimation()
			f284_arg0.ZmAmmoParticleFX2left:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX2left )
			f284_arg0.ZmAmmoParticleFX3left:completeAnimation()
			f284_arg0.ZmAmmoParticleFX3left:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX3left )
			f284_arg0.ZmAmmoParticleFX1right:completeAnimation()
			f284_arg0.ZmAmmoParticleFX1right:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX1right )
			f284_arg0.ZmAmmoParticleFX2right:completeAnimation()
			f284_arg0.ZmAmmoParticleFX2right:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmAmmoParticleFX2right )
			f284_arg0.Lightning3:completeAnimation()
			f284_arg0.Lightning3:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Lightning3 )
			f284_arg0.Lightning:completeAnimation()
			f284_arg0.Lightning:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Lightning )
			f284_arg0.Flsh:completeAnimation()
			f284_arg0.Flsh:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.Flsh )
			f284_arg0.ZmNotif1CursorHint0:completeAnimation()
			f284_arg0.ZmNotif1CursorHint0:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmNotif1CursorHint0 )
			f284_arg0.ZmNotifFactory:completeAnimation()
			f284_arg0.ZmNotifFactory:setAlpha( 0 )
			f284_arg0.clipFinished( f284_arg0.ZmNotifFactory )
		end
	}
}
CoD.ZmNotifBGB_ContainerFactory.__onClose = function ( f285_arg0 )
	f285_arg0.TcmSplash:close()
	f285_arg0.ZMTrialTitleNotif:close()
	f285_arg0.TributeSplash:close()
	f285_arg0.ZmFxSpark20:close()
	f285_arg0.ZmAmmoParticleFX3right:close()
	f285_arg0.ZmAmmoParticleFX1left:close()
	f285_arg0.ZmAmmoParticleFX2left:close()
	f285_arg0.ZmAmmoParticleFX3left:close()
	f285_arg0.ZmAmmoParticleFX1right:close()
	f285_arg0.ZmAmmoParticleFX2right:close()
	f285_arg0.particleLeft:close()
	f285_arg0.particleRight:close()
	f285_arg0.SmokeBackground:close()
	f285_arg0.ZmNotif1CursorHint0:close()
	f285_arg0.ZmNotifFactory:close()
	f285_arg0.firework:close()
end

