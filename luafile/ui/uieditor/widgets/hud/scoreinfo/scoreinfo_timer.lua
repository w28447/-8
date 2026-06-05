require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_timerblur" )
require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfohardpointobjective" )
require( "ui/uieditor/widgets/mphudwidgets/waypointhardpoint_timer" )

CoD.ScoreInfo_Timer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_Timer.__defaultWidth = 205
CoD.ScoreInfo_Timer.__defaultHeight = 40
CoD.ScoreInfo_Timer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.BaseUtility.InitGlobalModel( "hudItems.hardpointObj", nil )
	self:setClass( CoD.ScoreInfo_Timer )
	self.id = "ScoreInfo_Timer"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local BlurBacking = CoD.ScoreInfo_TimerBlur.new( f1_arg0, f1_arg1, 0, 0, 4.5, 200.5, 0, 0, 3, 36 )
	self:addElement( BlurBacking )
	self.BlurBacking = BlurBacking
	
	local PanelDark = LUI.UIImage.new( 0.5, 0.5, -98, 98, 0.5, 0.5, -17, 16 )
	PanelDark:setRGB( 0.09, 0.09, 0.09 )
	PanelDark:setAlpha( 0.94 )
	self:addElement( PanelDark )
	self.PanelDark = PanelDark
	
	local TiledShaderImage = LUI.UIImage.new( 0.5, 0.5, -110.5, 98.5, 0.5, 0.5, -28.5, 16.5 )
	TiledShaderImage:setRGB( 0, 0, 0 )
	TiledShaderImage:setAlpha( 0.2 )
	TiledShaderImage:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_led_screen_02" ) )
	TiledShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	TiledShaderImage:setShaderVector( 0, 0, 0, 0, 0 )
	TiledShaderImage:setupNineSliceShader( 220, 60 )
	self:addElement( TiledShaderImage )
	self.TiledShaderImage = TiledShaderImage
	
	local StretchableFrameThin = LUI.UIImage.new( 0.5, 0.5, -102.5, 102.5, 0.5, 0.5, -20, 20 )
	StretchableFrameThin:setImage( RegisterImage( "uie_ui_hud_core_frame_bottom_thin_stretchable" ) )
	StretchableFrameThin:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	StretchableFrameThin:setShaderVector( 0, 0, 0, 0, 0 )
	StretchableFrameThin:setupNineSliceShader( 22, 22 )
	self:addElement( StretchableFrameThin )
	self.StretchableFrameThin = StretchableFrameThin
	
	local Color = LUI.UIImage.new( 0.5, 0.5, -48, 32, 0.5, 0.5, -9, 11 )
	Color:setRGB( 1, 0, 0 )
	Color:setAlpha( 0 )
	self:addElement( Color )
	self.Color = Color
	
	local ring3 = LUI.UIImage.new( 0, 0, 98, 101, 0, 0, 20, 23 )
	ring3:setAlpha( 0 )
	ring3:setImage( RegisterImage( 0x1C64E99F5F757CB ) )
	ring3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ring3 )
	self.ring3 = ring3
	
	local line = LUI.UIImage.new( 0, 0, 92, 100, 0, 0, 21.5, 29.5 )
	line:setRGB( 0.73, 0.71, 0.64 )
	line:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_dot" ) )
	line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line )
	self.line = line
	
	local line2 = LUI.UIImage.new( 0, 0, 92, 100, 0, 0, 12.5, 20.5 )
	line2:setRGB( 0.73, 0.71, 0.64 )
	line2:setAlpha( 0.8 )
	line2:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_dot" ) )
	line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line2 )
	self.line2 = line2
	
	local line3 = LUI.UIImage.new( 0, 0, 41, 49, 0, 0, 22.5, 30.5 )
	line3:setRGB( 0.73, 0.71, 0.64 )
	line3:setAlpha( 0 )
	line3:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_dot" ) )
	line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line3 )
	self.line3 = line3
	
	local line4 = LUI.UIImage.new( 0, 0, 41, 49, 0, 0, 13.5, 21.5 )
	line4:setRGB( 0.73, 0.71, 0.64 )
	line4:setAlpha( 0 )
	line4:setImage( RegisterImage( "uie_ui_hud_core_objective_widget_dot" ) )
	line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line4 )
	self.line4 = line4
	
	local WhistleTime = LUI.UIText.new( 0, 0, 57, 148, 0, 0, 9, 35 )
	WhistleTime:setRGB( 0.73, 0.71, 0.64 )
	WhistleTime:setAlpha( 0 )
	WhistleTime:setTTF( "ttmussels_regular" )
	WhistleTime:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	WhistleTime:setShaderVector( 0, 0.5, 0, 0, 0 )
	WhistleTime:setShaderVector( 1, 0, 0, 0, 0 )
	WhistleTime:setShaderVector( 2, 0.73, 0.71, 0.64, 0.3 )
	WhistleTime:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	WhistleTime:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	WhistleTime:subscribeToGlobalModel( f1_arg1, "BombTimer", "bomb0.timeRemainingMilliSec", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			WhistleTime:setText( MillisecondsAsSeconds( f2_local0 ) )
		end
	end )
	self:addElement( WhistleTime )
	self.WhistleTime = WhistleTime
	
	local GameTimerSeconds = LUI.UIText.new( 0, 0, 103, 194, 0, 0, 7, 33 )
	GameTimerSeconds:setRGB( 0.73, 0.71, 0.64 )
	GameTimerSeconds:setTTF( "ttmussels_regular" )
	GameTimerSeconds:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	GameTimerSeconds:setShaderVector( 0, 0.5, 0, 0, 0 )
	GameTimerSeconds:setShaderVector( 1, 0, 0, 0, 0 )
	GameTimerSeconds:setShaderVector( 2, 0.73, 0.71, 0.64, 0.3 )
	GameTimerSeconds:setLetterSpacing( 1 )
	GameTimerSeconds:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	GameTimerSeconds:setupGameTimerSeconds()
	GameTimerSeconds:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( GameTimerSeconds )
	self.GameTimerSeconds = GameTimerSeconds
	
	local GameTimerMinutes = LUI.UIText.new( 0, 0, 58, 89, 0, 0, 7, 33 )
	GameTimerMinutes:setRGB( 0.73, 0.71, 0.64 )
	GameTimerMinutes:setTTF( "ttmussels_regular" )
	GameTimerMinutes:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	GameTimerMinutes:setShaderVector( 0, 0.5, 0, 0, 0 )
	GameTimerMinutes:setShaderVector( 1, 0, 0, 0, 0 )
	GameTimerMinutes:setShaderVector( 2, 0.4, 0.71, 0.64, 0.3 )
	GameTimerMinutes:setLetterSpacing( 1 )
	GameTimerMinutes:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	GameTimerMinutes:setupGameTimerMinutes()
	GameTimerMinutes:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	self:addElement( GameTimerMinutes )
	self.GameTimerMinutes = GameTimerMinutes
	
	local OvertimeText = LUI.UIText.new( 0, 0, 2.5, 202.5, 0, 0, 8.5, 29.5 )
	OvertimeText:setRGB( 1, 0, 0 )
	OvertimeText:setAlpha( 0 )
	OvertimeText:setText( Engine[0xF9F1239CFD921FE]( 0x9D325D8D1BFD3DE ) )
	OvertimeText:setTTF( "notosans_light" )
	OvertimeText:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	OvertimeText:setAlignment( Enum.LUIAlignment[0xF41D595A2B0EDF3] )
	self:addElement( OvertimeText )
	self.OvertimeText = OvertimeText
	
	local BombTimer = CoD.WaypointHardpoint_Timer.new( f1_arg0, f1_arg1, 0.5, 0.5, -54, 30, 0.5, 0.5, -13, 13 )
	BombTimer:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f3_local0
				if not IsGametypeSettingsValue( "autoDestroyTime", 0 ) then
					f3_local0 = Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xABEA46F8DE7F02F] )
				else
					f3_local0 = false
				end
				return f3_local0
			end
		}
	} )
	local HardpointObjective = BombTimer
	local GameTimer2 = BombTimer.subscribeToModel
	local WhistleImage = Engine.GetModelForController( f1_arg1 )
	GameTimer2( HardpointObjective, WhistleImage["UIVisibilityBit." .. Enum.UIVisibilityBit[0xABEA46F8DE7F02F]], function ( f4_arg0 )
		f1_arg0:updateElementState( BombTimer, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f4_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xABEA46F8DE7F02F]
		} )
	end, false )
	BombTimer:setRGB( 0.73, 0.71, 0.64 )
	BombTimer:setAlpha( 0 )
	BombTimer.TimerText:setTTF( "ttmussels_regular" )
	BombTimer.TimerText:setShaderVector( 0, 0.5, 0, 0, 0 )
	BombTimer.TimerText:setShaderVector( 2, 0.73, 0.71, 0.64, 0.3 )
	BombTimer.TimerText:setLetterSpacing( 2 )
	BombTimer.TimerText:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	BombTimer:linkToElementModel( self, nil, false, function ( model )
		BombTimer:setModel( model, f1_arg1 )
	end )
	self:addElement( BombTimer )
	self.BombTimer = BombTimer
	
	GameTimer2 = LUI.UIText.new( 0.71, 1.19, -7, -7, 0.5, 0.5, -13, 13 )
	GameTimer2:setRGB( 0.73, 0.71, 0.64 )
	GameTimer2:setAlpha( 0 )
	GameTimer2:setTTF( "ttmussels_regular" )
	GameTimer2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	GameTimer2:setShaderVector( 0, 0.8, 0, 0, 0 )
	GameTimer2:setShaderVector( 1, 0, 0, 0, 0 )
	GameTimer2:setShaderVector( 2, 1, 0, 0, 0.6 )
	GameTimer2:setLetterSpacing( 2 )
	GameTimer2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	GameTimer2:setupGameTimer()
	GameTimer2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	self:addElement( GameTimer2 )
	self.GameTimer2 = GameTimer2
	
	HardpointObjective = CoD.ScoreInfoHardpointObjective.new( f1_arg0, f1_arg1, 0, 0, 18.5, 44.5, 0, 0, 7.5, 33.5 )
	HardpointObjective:mergeStateConditions( {
		{
			stateName = "visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xABEA46F8DE7F02F] ) and CoD.ModelUtility.IsSelfModelValueEqualToEnum( element, f1_arg1, "state", Enum.objectiveState_t[0x54563D60375E060] )
			end
		}
	} )
	local PropHuntDivider = HardpointObjective
	WhistleImage = HardpointObjective.subscribeToModel
	local f1_local20 = Engine.GetModelForController( f1_arg1 )
	WhistleImage( PropHuntDivider, f1_local20["UIVisibilityBit." .. Enum.UIVisibilityBit[0xABEA46F8DE7F02F]], function ( f7_arg0 )
		f1_arg0:updateElementState( HardpointObjective, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xABEA46F8DE7F02F]
		} )
	end, false )
	HardpointObjective:linkToElementModel( HardpointObjective, "state", true, function ( model )
		f1_arg0:updateElementState( HardpointObjective, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "state"
		} )
	end )
	HardpointObjective:setAlpha( 0 )
	HardpointObjective:setScale( 0.5, 0.5 )
	self:addElement( HardpointObjective )
	self.HardpointObjective = HardpointObjective
	
	WhistleImage = LUI.UIImage.new( 0, 0, 11, 41, 0, 0, 5, 35 )
	WhistleImage:setAlpha( 0 )
	WhistleImage:setImage( RegisterImage( "uie_ui_hud_prophunt_match_widget_megaphone" ) )
	self:addElement( WhistleImage )
	self.WhistleImage = WhistleImage
	
	PropHuntDivider = LUI.UIImage.new( 0, 0, 91.5, 107.5, 0, 0, -2.5, 41.5 )
	PropHuntDivider:setAlpha( 0 )
	PropHuntDivider:setImage( RegisterImage( "uie_ui_hud_prophunt_match_widget_time_panel_divider" ) )
	self:addElement( PropHuntDivider )
	self.PropHuntDivider = PropHuntDivider
	
	self:mergeStateConditions( {
		{
			stateName = "HardpointActive",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "koth" )
			end
		},
		{
			stateName = "HardpointTimeLow",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "koth" )
			end
		},
		{
			stateName = "DepositActive",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "clean" )
			end
		},
		{
			stateName = "DepositTimeLow",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "clean" )
			end
		},
		{
			stateName = "PropHunt",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "prop" )
			end
		},
		{
			stateName = "PropHuntTimeLow",
			condition = function ( menu, element, event )
				return CoD.HUDUtility.IsGameTypeEqualToString( "prop" )
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Overtime",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "TimeLow",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToGlobalModel( f1_arg1, "GlobalModel", "hudItems.hardpointObj", function ( model )
		local f18_local0 = self
		CoD.HUDUtility.SetScoreInfoHardpointObjective( self.HardpointObjective, f1_arg1 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_Timer.__resetProperties = function ( f19_arg0 )
	f19_arg0.Color:completeAnimation()
	f19_arg0.line2:completeAnimation()
	f19_arg0.line:completeAnimation()
	f19_arg0.ring3:completeAnimation()
	f19_arg0.GameTimerSeconds:completeAnimation()
	f19_arg0.GameTimerMinutes:completeAnimation()
	f19_arg0.StretchableFrameThin:completeAnimation()
	f19_arg0.TiledShaderImage:completeAnimation()
	f19_arg0.PanelDark:completeAnimation()
	f19_arg0.BlurBacking:completeAnimation()
	f19_arg0.OvertimeText:completeAnimation()
	f19_arg0.GameTimer2:completeAnimation()
	f19_arg0.BombTimer:completeAnimation()
	f19_arg0.HardpointObjective:completeAnimation()
	f19_arg0.line3:completeAnimation()
	f19_arg0.line4:completeAnimation()
	f19_arg0.WhistleTime:completeAnimation()
	f19_arg0.WhistleImage:completeAnimation()
	f19_arg0.PropHuntDivider:completeAnimation()
	f19_arg0.Color:setLeftRight( 0.5, 0.5, -48, 32 )
	f19_arg0.Color:setTopBottom( 0.5, 0.5, -9, 11 )
	f19_arg0.Color:setRGB( 1, 0, 0 )
	f19_arg0.Color:setAlpha( 0 )
	f19_arg0.line2:setLeftRight( 0, 0, 92, 100 )
	f19_arg0.line2:setTopBottom( 0, 0, 12.5, 20.5 )
	f19_arg0.line2:setAlpha( 0.8 )
	f19_arg0.line:setLeftRight( 0, 0, 92, 100 )
	f19_arg0.line:setTopBottom( 0, 0, 21.5, 29.5 )
	f19_arg0.line:setAlpha( 1 )
	f19_arg0.ring3:setAlpha( 0 )
	f19_arg0.GameTimerSeconds:setLeftRight( 0, 0, 103, 194 )
	f19_arg0.GameTimerSeconds:setTopBottom( 0, 0, 7, 33 )
	f19_arg0.GameTimerSeconds:setRGB( 0.73, 0.71, 0.64 )
	f19_arg0.GameTimerSeconds:setAlpha( 1 )
	f19_arg0.GameTimerSeconds:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	f19_arg0.GameTimerSeconds:setShaderVector( 0, 0.5, 0, 0, 0 )
	f19_arg0.GameTimerSeconds:setShaderVector( 1, 0, 0, 0, 0 )
	f19_arg0.GameTimerSeconds:setShaderVector( 2, 0.73, 0.71, 0.64, 0.3 )
	f19_arg0.GameTimerSeconds:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	f19_arg0.GameTimerMinutes:setLeftRight( 0, 0, 58, 89 )
	f19_arg0.GameTimerMinutes:setTopBottom( 0, 0, 7, 33 )
	f19_arg0.GameTimerMinutes:setRGB( 0.73, 0.71, 0.64 )
	f19_arg0.GameTimerMinutes:setAlpha( 1 )
	f19_arg0.GameTimerMinutes:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
	f19_arg0.GameTimerMinutes:setShaderVector( 0, 0.5, 0, 0, 0 )
	f19_arg0.GameTimerMinutes:setShaderVector( 1, 0, 0, 0, 0 )
	f19_arg0.GameTimerMinutes:setShaderVector( 2, 0.4, 0.71, 0.64, 0.3 )
	f19_arg0.StretchableFrameThin:setAlpha( 1 )
	f19_arg0.TiledShaderImage:setAlpha( 0.2 )
	f19_arg0.PanelDark:setAlpha( 0.94 )
	f19_arg0.BlurBacking:setAlpha( 1 )
	f19_arg0.OvertimeText:setTopBottom( 0, 0, 8.5, 29.5 )
	f19_arg0.OvertimeText:setAlpha( 0 )
	f19_arg0.GameTimer2:setLeftRight( 0.71, 1.19, -7, -7 )
	f19_arg0.GameTimer2:setRGB( 0.73, 0.71, 0.64 )
	f19_arg0.GameTimer2:setAlpha( 0 )
	f19_arg0.GameTimer2:setAlignment( Enum.LUIAlignment[0x58C8A85F2048829] )
	f19_arg0.BombTimer:setAlpha( 0 )
	f19_arg0.HardpointObjective:setLeftRight( 0, 0, 18.5, 44.5 )
	f19_arg0.HardpointObjective:setAlpha( 0 )
	f19_arg0.line3:setLeftRight( 0, 0, 41, 49 )
	f19_arg0.line3:setTopBottom( 0, 0, 22.5, 30.5 )
	f19_arg0.line3:setAlpha( 0 )
	f19_arg0.line4:setLeftRight( 0, 0, 41, 49 )
	f19_arg0.line4:setTopBottom( 0, 0, 13.5, 21.5 )
	f19_arg0.line4:setAlpha( 0 )
	f19_arg0.WhistleTime:setTopBottom( 0, 0, 9, 35 )
	f19_arg0.WhistleTime:setAlpha( 0 )
	f19_arg0.WhistleImage:setLeftRight( 0, 0, 11, 41 )
	f19_arg0.WhistleImage:setTopBottom( 0, 0, 5, 35 )
	f19_arg0.WhistleImage:setRGB( 1, 1, 1 )
	f19_arg0.WhistleImage:setAlpha( 0 )
	f19_arg0.PropHuntDivider:setRGB( 1, 1, 1 )
	f19_arg0.PropHuntDivider:setAlpha( 0 )
end

CoD.ScoreInfo_Timer.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f20_arg0, f20_arg1 )
			f20_arg0:__resetProperties()
			f20_arg0:setupElementClipCounter( 11 )
			f20_arg0.BlurBacking:completeAnimation()
			f20_arg0.BlurBacking:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.BlurBacking )
			f20_arg0.PanelDark:completeAnimation()
			f20_arg0.PanelDark:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.PanelDark )
			f20_arg0.TiledShaderImage:completeAnimation()
			f20_arg0.TiledShaderImage:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.TiledShaderImage )
			f20_arg0.StretchableFrameThin:completeAnimation()
			f20_arg0.StretchableFrameThin:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.StretchableFrameThin )
			f20_arg0.Color:completeAnimation()
			f20_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f20_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f20_arg0.Color:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.Color )
			f20_arg0.ring3:completeAnimation()
			f20_arg0.ring3:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.ring3 )
			f20_arg0.line:completeAnimation()
			f20_arg0.line:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.line )
			f20_arg0.line2:completeAnimation()
			f20_arg0.line2:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.line2 )
			f20_arg0.GameTimerSeconds:completeAnimation()
			f20_arg0.GameTimerSeconds:setLeftRight( 0, 0, 59, 163 )
			f20_arg0.GameTimerSeconds:setTopBottom( 0, 0, 8, 34 )
			f20_arg0.GameTimerSeconds:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.GameTimerSeconds )
			f20_arg0.GameTimerMinutes:completeAnimation()
			f20_arg0.GameTimerMinutes:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.GameTimerMinutes )
			f20_arg0.OvertimeText:completeAnimation()
			f20_arg0.OvertimeText:setAlpha( 0 )
			f20_arg0.clipFinished( f20_arg0.OvertimeText )
		end,
		Active = function ( f21_arg0, f21_arg1 )
			f21_arg0:__resetProperties()
			f21_arg0:setupElementClipCounter( 1 )
			f21_arg0.Color:completeAnimation()
			f21_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f21_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f21_arg0.Color:setRGB( 1, 0, 0 )
			f21_arg0.Color:setAlpha( 0 )
			f21_arg0.clipFinished( f21_arg0.Color )
		end,
		TimeLow = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 1 )
			local f22_local0 = function ( f23_arg0 )
				f22_arg0.Color:beginAnimation( 100 )
				f22_arg0.Color:setAlpha( 0.5 )
				f22_arg0.Color:registerEventHandler( "interrupted_keyframe", f22_arg0.clipInterrupted )
				f22_arg0.Color:registerEventHandler( "transition_complete_keyframe", f22_arg0.clipFinished )
			end
			
			f22_arg0.Color:completeAnimation()
			f22_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f22_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f22_arg0.Color:setAlpha( 0 )
			f22_local0( f22_arg0.Color )
		end
	},
	HardpointActive = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 7 )
			f24_arg0.line:completeAnimation()
			f24_arg0.line:setLeftRight( 0, 0, 152, 160 )
			f24_arg0.line:setTopBottom( 0, 0, 22, 30 )
			f24_arg0.line:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.line )
			f24_arg0.line2:completeAnimation()
			f24_arg0.line2:setLeftRight( 0, 0, 152, 160 )
			f24_arg0.line2:setTopBottom( 0, 0, 13, 21 )
			f24_arg0.line2:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.line2 )
			f24_arg0.GameTimerSeconds:completeAnimation()
			f24_arg0.GameTimerSeconds:setLeftRight( 0, 0, 161, 252 )
			f24_arg0.GameTimerSeconds:setTopBottom( 0, 0, 7.5, 33.5 )
			f24_arg0.GameTimerSeconds:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.GameTimerSeconds )
			f24_arg0.GameTimerMinutes:completeAnimation()
			f24_arg0.GameTimerMinutes:setLeftRight( 0, 0, 119, 150 )
			f24_arg0.GameTimerMinutes:setTopBottom( 0, 0, 7.5, 33.5 )
			f24_arg0.GameTimerMinutes:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.GameTimerMinutes )
			f24_arg0.BombTimer:completeAnimation()
			f24_arg0.BombTimer:setAlpha( 1 )
			f24_arg0.clipFinished( f24_arg0.BombTimer )
			f24_arg0.GameTimer2:completeAnimation()
			f24_arg0.GameTimer2:setRGB( 0.73, 0.71, 0.64 )
			f24_arg0.GameTimer2:setAlpha( 0 )
			f24_arg0.clipFinished( f24_arg0.GameTimer2 )
			local f24_local0 = function ( f25_arg0 )
				f24_arg0.HardpointObjective:beginAnimation( 100 )
				f24_arg0.HardpointObjective:setAlpha( 1 )
				f24_arg0.HardpointObjective:registerEventHandler( "interrupted_keyframe", f24_arg0.clipInterrupted )
				f24_arg0.HardpointObjective:registerEventHandler( "transition_complete_keyframe", f24_arg0.clipFinished )
			end
			
			f24_arg0.HardpointObjective:completeAnimation()
			f24_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f24_arg0.HardpointObjective:setAlpha( 0 )
			f24_local0( f24_arg0.HardpointObjective )
		end
	},
	HardpointTimeLow = {
		DefaultClip = function ( f26_arg0, f26_arg1 )
			f26_arg0:__resetProperties()
			f26_arg0:setupElementClipCounter( 7 )
			f26_arg0.line:completeAnimation()
			f26_arg0.line:setAlpha( 0 )
			f26_arg0.clipFinished( f26_arg0.line )
			f26_arg0.line2:completeAnimation()
			f26_arg0.line2:setAlpha( 0 )
			f26_arg0.clipFinished( f26_arg0.line2 )
			f26_arg0.GameTimerSeconds:completeAnimation()
			f26_arg0.GameTimerSeconds:setAlpha( 0 )
			f26_arg0.clipFinished( f26_arg0.GameTimerSeconds )
			f26_arg0.GameTimerMinutes:completeAnimation()
			f26_arg0.GameTimerMinutes:setAlpha( 0 )
			f26_arg0.clipFinished( f26_arg0.GameTimerMinutes )
			f26_arg0.BombTimer:completeAnimation()
			f26_arg0.BombTimer:setAlpha( 1 )
			f26_arg0.clipFinished( f26_arg0.BombTimer )
			local f26_local0 = function ( f27_arg0 )
				local f27_local0 = function ( f28_arg0 )
					f28_arg0:beginAnimation( 500 )
					f28_arg0:setRGB( 1, 1, 1 )
					f28_arg0:registerEventHandler( "transition_complete_keyframe", f26_arg0.clipFinished )
				end
				
				f26_arg0.GameTimer2:beginAnimation( 500 )
				f26_arg0.GameTimer2:setRGB( 1, 0, 0 )
				f26_arg0.GameTimer2:registerEventHandler( "interrupted_keyframe", f26_arg0.clipInterrupted )
				f26_arg0.GameTimer2:registerEventHandler( "transition_complete_keyframe", f27_local0 )
			end
			
			f26_arg0.GameTimer2:completeAnimation()
			f26_arg0.GameTimer2:setLeftRight( 0.55, 1.02, 7, 7 )
			f26_arg0.GameTimer2:setRGB( 1, 1, 1 )
			f26_arg0.GameTimer2:setAlpha( 1 )
			f26_arg0.GameTimer2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
			f26_local0( f26_arg0.GameTimer2 )
			f26_arg0.HardpointObjective:completeAnimation()
			f26_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f26_arg0.HardpointObjective:setAlpha( 1 )
			f26_arg0.clipFinished( f26_arg0.HardpointObjective )
			f26_arg0.nextClip = "DefaultClip"
		end
	},
	DepositActive = {
		DefaultClip = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 7 )
			f29_arg0.line:completeAnimation()
			f29_arg0.line:setLeftRight( 0, 0, 152, 160 )
			f29_arg0.line:setTopBottom( 0, 0, 22, 30 )
			f29_arg0.line:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.line )
			f29_arg0.line2:completeAnimation()
			f29_arg0.line2:setLeftRight( 0, 0, 152, 160 )
			f29_arg0.line2:setTopBottom( 0, 0, 13, 21 )
			f29_arg0.line2:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.line2 )
			f29_arg0.GameTimerSeconds:completeAnimation()
			f29_arg0.GameTimerSeconds:setLeftRight( 0, 0, 161, 252 )
			f29_arg0.GameTimerSeconds:setTopBottom( 0, 0, 7.5, 33.5 )
			f29_arg0.GameTimerSeconds:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.GameTimerSeconds )
			f29_arg0.GameTimerMinutes:completeAnimation()
			f29_arg0.GameTimerMinutes:setLeftRight( 0, 0, 119, 150 )
			f29_arg0.GameTimerMinutes:setTopBottom( 0, 0, 7.5, 33.5 )
			f29_arg0.GameTimerMinutes:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.GameTimerMinutes )
			f29_arg0.BombTimer:completeAnimation()
			f29_arg0.BombTimer:setAlpha( 1 )
			f29_arg0.clipFinished( f29_arg0.BombTimer )
			f29_arg0.GameTimer2:completeAnimation()
			f29_arg0.GameTimer2:setRGB( 0.73, 0.71, 0.64 )
			f29_arg0.GameTimer2:setAlpha( 0 )
			f29_arg0.clipFinished( f29_arg0.GameTimer2 )
			local f29_local0 = function ( f30_arg0 )
				f29_arg0.HardpointObjective:beginAnimation( 100 )
				f29_arg0.HardpointObjective:setAlpha( 1 )
				f29_arg0.HardpointObjective:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.HardpointObjective:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.HardpointObjective:completeAnimation()
			f29_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f29_arg0.HardpointObjective:setAlpha( 0 )
			f29_local0( f29_arg0.HardpointObjective )
		end
	},
	DepositTimeLow = {
		DefaultClip = function ( f31_arg0, f31_arg1 )
			f31_arg0:__resetProperties()
			f31_arg0:setupElementClipCounter( 7 )
			f31_arg0.line:completeAnimation()
			f31_arg0.line:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.line )
			f31_arg0.line2:completeAnimation()
			f31_arg0.line2:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.line2 )
			f31_arg0.GameTimerSeconds:completeAnimation()
			f31_arg0.GameTimerSeconds:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.GameTimerSeconds )
			f31_arg0.GameTimerMinutes:completeAnimation()
			f31_arg0.GameTimerMinutes:setAlpha( 0 )
			f31_arg0.clipFinished( f31_arg0.GameTimerMinutes )
			f31_arg0.BombTimer:completeAnimation()
			f31_arg0.BombTimer:setAlpha( 1 )
			f31_arg0.clipFinished( f31_arg0.BombTimer )
			local f31_local0 = function ( f32_arg0 )
				local f32_local0 = function ( f33_arg0 )
					f33_arg0:beginAnimation( 500 )
					f33_arg0:setRGB( 1, 1, 1 )
					f33_arg0:registerEventHandler( "transition_complete_keyframe", f31_arg0.clipFinished )
				end
				
				f31_arg0.GameTimer2:beginAnimation( 500 )
				f31_arg0.GameTimer2:setRGB( 1, 0, 0 )
				f31_arg0.GameTimer2:registerEventHandler( "interrupted_keyframe", f31_arg0.clipInterrupted )
				f31_arg0.GameTimer2:registerEventHandler( "transition_complete_keyframe", f32_local0 )
			end
			
			f31_arg0.GameTimer2:completeAnimation()
			f31_arg0.GameTimer2:setLeftRight( 0.55, 1.02, 7, 7 )
			f31_arg0.GameTimer2:setRGB( 1, 1, 1 )
			f31_arg0.GameTimer2:setAlpha( 1 )
			f31_arg0.GameTimer2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
			f31_local0( f31_arg0.GameTimer2 )
			f31_arg0.HardpointObjective:completeAnimation()
			f31_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f31_arg0.HardpointObjective:setAlpha( 1 )
			f31_arg0.clipFinished( f31_arg0.HardpointObjective )
			f31_arg0.nextClip = "DefaultClip"
		end
	},
	PropHunt = {
		DefaultClip = function ( f34_arg0, f34_arg1 )
			f34_arg0:__resetProperties()
			f34_arg0:setupElementClipCounter( 12 )
			f34_arg0.line:completeAnimation()
			f34_arg0.line:setLeftRight( 0, 0, 152, 160 )
			f34_arg0.line:setTopBottom( 0, 0, 22, 30 )
			f34_arg0.line:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.line )
			f34_arg0.line2:completeAnimation()
			f34_arg0.line2:setLeftRight( 0, 0, 152, 160 )
			f34_arg0.line2:setTopBottom( 0, 0, 13, 21 )
			f34_arg0.line2:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.line2 )
			f34_arg0.line3:completeAnimation()
			f34_arg0.line3:setLeftRight( 0, 0, 49, 57 )
			f34_arg0.line3:setTopBottom( 0, 0, 22, 30 )
			f34_arg0.line3:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.line3 )
			f34_arg0.line4:completeAnimation()
			f34_arg0.line4:setLeftRight( 0, 0, 49, 57 )
			f34_arg0.line4:setTopBottom( 0, 0, 13, 21 )
			f34_arg0.line4:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.line4 )
			f34_arg0.WhistleTime:completeAnimation()
			f34_arg0.WhistleTime:setTopBottom( 0, 0, 7, 33 )
			f34_arg0.WhistleTime:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.WhistleTime )
			f34_arg0.GameTimerSeconds:completeAnimation()
			f34_arg0.GameTimerSeconds:setLeftRight( 0, 0, 161, 252 )
			f34_arg0.GameTimerSeconds:setTopBottom( 0, 0, 7.5, 33.5 )
			f34_arg0.GameTimerSeconds:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.GameTimerSeconds )
			f34_arg0.GameTimerMinutes:completeAnimation()
			f34_arg0.GameTimerMinutes:setLeftRight( 0, 0, 119, 150 )
			f34_arg0.GameTimerMinutes:setTopBottom( 0, 0, 7.5, 33.5 )
			f34_arg0.GameTimerMinutes:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.GameTimerMinutes )
			f34_arg0.BombTimer:completeAnimation()
			f34_arg0.BombTimer:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.BombTimer )
			f34_arg0.GameTimer2:completeAnimation()
			f34_arg0.GameTimer2:setRGB( 0.73, 0.71, 0.64 )
			f34_arg0.GameTimer2:setAlpha( 0 )
			f34_arg0.clipFinished( f34_arg0.GameTimer2 )
			local f34_local0 = function ( f35_arg0 )
				f34_arg0.HardpointObjective:beginAnimation( 100 )
				f34_arg0.HardpointObjective:setAlpha( 1 )
				f34_arg0.HardpointObjective:registerEventHandler( "interrupted_keyframe", f34_arg0.clipInterrupted )
				f34_arg0.HardpointObjective:registerEventHandler( "transition_complete_keyframe", f34_arg0.clipFinished )
			end
			
			f34_arg0.HardpointObjective:completeAnimation()
			f34_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f34_arg0.HardpointObjective:setAlpha( 0 )
			f34_local0( f34_arg0.HardpointObjective )
			f34_arg0.WhistleImage:completeAnimation()
			f34_arg0.WhistleImage:setLeftRight( 0, 0, 11, 36 )
			f34_arg0.WhistleImage:setTopBottom( 0, 0, 7, 32 )
			f34_arg0.WhistleImage:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f34_arg0.WhistleImage:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.WhistleImage )
			f34_arg0.PropHuntDivider:completeAnimation()
			f34_arg0.PropHuntDivider:setAlpha( 1 )
			f34_arg0.clipFinished( f34_arg0.PropHuntDivider )
		end
	},
	PropHuntTimeLow = {
		DefaultClip = function ( f36_arg0, f36_arg1 )
			f36_arg0:__resetProperties()
			f36_arg0:setupElementClipCounter( 12 )
			f36_arg0.line:completeAnimation()
			f36_arg0.line:setLeftRight( 0, 0, 152, 160 )
			f36_arg0.line:setTopBottom( 0, 0, 22, 30 )
			f36_arg0.line:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.line )
			f36_arg0.line2:completeAnimation()
			f36_arg0.line2:setLeftRight( 0, 0, 152, 160 )
			f36_arg0.line2:setTopBottom( 0, 0, 13, 21 )
			f36_arg0.line2:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.line2 )
			f36_arg0.line3:completeAnimation()
			f36_arg0.line3:setLeftRight( 0, 0, 49, 57 )
			f36_arg0.line3:setTopBottom( 0, 0, 22, 30 )
			f36_arg0.line3:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.line3 )
			f36_arg0.line4:completeAnimation()
			f36_arg0.line4:setLeftRight( 0, 0, 49, 57 )
			f36_arg0.line4:setTopBottom( 0, 0, 13, 21 )
			f36_arg0.line4:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.line4 )
			f36_arg0.WhistleTime:completeAnimation()
			f36_arg0.WhistleTime:setTopBottom( 0, 0, 7, 33 )
			f36_arg0.WhistleTime:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.WhistleTime )
			f36_arg0.GameTimerSeconds:completeAnimation()
			f36_arg0.GameTimerSeconds:setLeftRight( 0, 0, 161, 252 )
			f36_arg0.GameTimerSeconds:setTopBottom( 0, 0, 7.5, 33.5 )
			f36_arg0.GameTimerSeconds:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.GameTimerSeconds )
			f36_arg0.GameTimerMinutes:completeAnimation()
			f36_arg0.GameTimerMinutes:setLeftRight( 0, 0, 119, 150 )
			f36_arg0.GameTimerMinutes:setTopBottom( 0, 0, 7.5, 33.5 )
			f36_arg0.GameTimerMinutes:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.GameTimerMinutes )
			f36_arg0.BombTimer:completeAnimation()
			f36_arg0.BombTimer:setAlpha( 0 )
			f36_arg0.clipFinished( f36_arg0.BombTimer )
			local f36_local0 = function ( f37_arg0 )
				local f37_local0 = function ( f38_arg0 )
					f38_arg0:beginAnimation( 500 )
					f38_arg0:setRGB( 1, 1, 1 )
					f38_arg0:registerEventHandler( "transition_complete_keyframe", f36_arg0.clipFinished )
				end
				
				f36_arg0.GameTimer2:beginAnimation( 500 )
				f36_arg0.GameTimer2:setRGB( 1, 0, 0 )
				f36_arg0.GameTimer2:registerEventHandler( "interrupted_keyframe", f36_arg0.clipInterrupted )
				f36_arg0.GameTimer2:registerEventHandler( "transition_complete_keyframe", f37_local0 )
			end
			
			f36_arg0.GameTimer2:completeAnimation()
			f36_arg0.GameTimer2:setRGB( 0.73, 0.71, 0.64 )
			f36_arg0.GameTimer2:setAlpha( 1 )
			f36_local0( f36_arg0.GameTimer2 )
			f36_arg0.HardpointObjective:completeAnimation()
			f36_arg0.HardpointObjective:setLeftRight( 0, 0, 13.5, 39.5 )
			f36_arg0.HardpointObjective:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.HardpointObjective )
			f36_arg0.WhistleImage:completeAnimation()
			f36_arg0.WhistleImage:setLeftRight( 0, 0, 11, 36 )
			f36_arg0.WhistleImage:setTopBottom( 0, 0, 7, 32 )
			f36_arg0.WhistleImage:setRGB( ColorSet.T8__OFF__WHITE.r, ColorSet.T8__OFF__WHITE.g, ColorSet.T8__OFF__WHITE.b )
			f36_arg0.WhistleImage:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.WhistleImage )
			f36_arg0.PropHuntDivider:completeAnimation()
			f36_arg0.PropHuntDivider:setRGB( 1, 1, 1 )
			f36_arg0.PropHuntDivider:setAlpha( 1 )
			f36_arg0.clipFinished( f36_arg0.PropHuntDivider )
		end
	},
	Active = {
		DefaultClip = function ( f39_arg0, f39_arg1 )
			f39_arg0:__resetProperties()
			f39_arg0:setupElementClipCounter( 1 )
			f39_arg0.Color:completeAnimation()
			f39_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f39_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f39_arg0.clipFinished( f39_arg0.Color )
		end,
		DefaultState = function ( f40_arg0, f40_arg1 )
			f40_arg0:__resetProperties()
			f40_arg0:setupElementClipCounter( 1 )
			f40_arg0.Color:completeAnimation()
			f40_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f40_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f40_arg0.Color:setAlpha( 0 )
			f40_arg0.clipFinished( f40_arg0.Color )
		end
	},
	Overtime = {
		DefaultClip = function ( f41_arg0, f41_arg1 )
			f41_arg0:__resetProperties()
			f41_arg0:setupElementClipCounter( 5 )
			f41_arg0.line:completeAnimation()
			f41_arg0.line:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.line )
			f41_arg0.line2:completeAnimation()
			f41_arg0.line2:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.line2 )
			f41_arg0.GameTimerSeconds:completeAnimation()
			f41_arg0.GameTimerSeconds:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.GameTimerSeconds )
			f41_arg0.GameTimerMinutes:completeAnimation()
			f41_arg0.GameTimerMinutes:setAlpha( 0 )
			f41_arg0.clipFinished( f41_arg0.GameTimerMinutes )
			f41_arg0.OvertimeText:completeAnimation()
			f41_arg0.OvertimeText:setTopBottom( 0, 0, 6, 34 )
			f41_arg0.OvertimeText:setAlpha( 1 )
			f41_arg0.clipFinished( f41_arg0.OvertimeText )
		end
	},
	TimeLow = {
		DefaultClip = function ( f42_arg0, f42_arg1 )
			f42_arg0:__resetProperties()
			f42_arg0:setupElementClipCounter( 6 )
			f42_arg0.Color:completeAnimation()
			f42_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f42_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f42_arg0.Color:setAlpha( 0 )
			f42_arg0.clipFinished( f42_arg0.Color )
			f42_arg0.ring3:completeAnimation()
			f42_arg0.ring3:setAlpha( 0 )
			f42_arg0.clipFinished( f42_arg0.ring3 )
			f42_arg0.line:completeAnimation()
			f42_arg0.line:setAlpha( 0 )
			f42_arg0.clipFinished( f42_arg0.line )
			f42_arg0.line2:completeAnimation()
			f42_arg0.line2:setAlpha( 0 )
			f42_arg0.clipFinished( f42_arg0.line2 )
			local f42_local0 = function ( f43_arg0 )
				local f43_local0 = function ( f44_arg0 )
					f44_arg0:beginAnimation( 500 )
					f44_arg0:setRGB( 1, 1, 1 )
					f44_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
				end
				
				f42_arg0.GameTimerSeconds:beginAnimation( 500 )
				f42_arg0.GameTimerSeconds:setRGB( 1, 0, 0 )
				f42_arg0.GameTimerSeconds:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.GameTimerSeconds:registerEventHandler( "transition_complete_keyframe", f43_local0 )
			end
			
			f42_arg0.GameTimerSeconds:completeAnimation()
			f42_arg0.GameTimerSeconds:setLeftRight( 0, 0, 59.5, 150.5 )
			f42_arg0.GameTimerSeconds:setRGB( 1, 1, 1 )
			f42_arg0.GameTimerSeconds:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
			f42_arg0.GameTimerSeconds:setShaderVector( 0, 0.8, 0, 0, 0 )
			f42_arg0.GameTimerSeconds:setShaderVector( 1, 0, 0, 0, 0 )
			f42_arg0.GameTimerSeconds:setShaderVector( 2, 1, 0, 0, 0.6 )
			f42_arg0.GameTimerSeconds:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
			f42_local0( f42_arg0.GameTimerSeconds )
			local f42_local1 = function ( f45_arg0 )
				local f45_local0 = function ( f46_arg0 )
					f46_arg0:beginAnimation( 500 )
					f46_arg0:setRGB( 1, 1, 1 )
					f46_arg0:registerEventHandler( "transition_complete_keyframe", f42_arg0.clipFinished )
				end
				
				f42_arg0.GameTimerMinutes:beginAnimation( 500 )
				f42_arg0.GameTimerMinutes:setRGB( 1, 0, 0 )
				f42_arg0.GameTimerMinutes:registerEventHandler( "interrupted_keyframe", f42_arg0.clipInterrupted )
				f42_arg0.GameTimerMinutes:registerEventHandler( "transition_complete_keyframe", f45_local0 )
			end
			
			f42_arg0.GameTimerMinutes:completeAnimation()
			f42_arg0.GameTimerMinutes:setLeftRight( 0, 0, 106, 137 )
			f42_arg0.GameTimerMinutes:setRGB( 1, 1, 1 )
			f42_arg0.GameTimerMinutes:setMaterial( LUI.UIImage.GetCachedMaterial( 0x90D57B1E92D39D7 ) )
			f42_arg0.GameTimerMinutes:setShaderVector( 0, 0.8, 0, 0, 0 )
			f42_arg0.GameTimerMinutes:setShaderVector( 1, 0, 0, 0, 0 )
			f42_arg0.GameTimerMinutes:setShaderVector( 2, 1, 0, 0, 0.6 )
			f42_local1( f42_arg0.GameTimerMinutes )
			f42_arg0.nextClip = "DefaultClip"
		end,
		DefaultState = function ( f47_arg0, f47_arg1 )
			f47_arg0:__resetProperties()
			f47_arg0:setupElementClipCounter( 1 )
			f47_arg0.Color:completeAnimation()
			f47_arg0.Color:setLeftRight( 0, 0, 0, 114 )
			f47_arg0.Color:setTopBottom( 0, 0, 3, 34 )
			f47_arg0.Color:setAlpha( 0 )
			f47_arg0.clipFinished( f47_arg0.Color )
		end
	}
}
CoD.ScoreInfo_Timer.__onClose = function ( f48_arg0 )
	f48_arg0.BlurBacking:close()
	f48_arg0.WhistleTime:close()
	f48_arg0.BombTimer:close()
	f48_arg0.HardpointObjective:close()
end

