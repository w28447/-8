CoD.ScoreboardColHeadersZM = InheritFrom( LUI.UIElement )
CoD.ScoreboardColHeadersZM.__defaultWidth = 888
CoD.ScoreboardColHeadersZM.__defaultHeight = 30
CoD.ScoreboardColHeadersZM.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreboardColHeadersZM )
	self.id = "ScoreboardColHeadersZM"
	self.soundSet = "default"
	
	local BackingBase = LUI.UIImage.new( 0, 0, 0, 888, 0, 1.5, -5, -5 )
	BackingBase:setRGB( 0, 0, 0 )
	BackingBase:setAlpha( 0.5 )
	self:addElement( BackingBase )
	self.BackingBase = BackingBase
	
	local Col1 = LUI.UIText.new( 0, 0, 332, 484, 0.5, 0.5, -5, 13 )
	Col1:setRGB( 0.83, 0.11, 0.01 )
	Col1:setScale( 0.9, 0.9 )
	Col1:setText( LocalizeToUpperString( "menu/score_caps" ) )
	Col1:setTTF( "dinnext_regular" )
	Col1:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col1:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Col1 )
	self.Col1 = Col1
	
	local Col2 = LUI.UIText.new( 0, 0, 498, 594, 0.5, 0.5, -5, 13 )
	Col2:setRGB( 0.83, 0.11, 0.01 )
	Col2:setScale( 0.9, 0.9 )
	Col2:setText( LocalizeToUpperString( "menu/kills_caps" ) )
	Col2:setTTF( "dinnext_regular" )
	Col2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col2:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Col2 )
	self.Col2 = Col2
	
	local Col3 = LUI.UIText.new( 0, 0, 596, 688, 0.5, 0.5, -5, 13 )
	Col3:setRGB( 0.83, 0.11, 0.01 )
	Col3:setScale( 0.9, 0.9 )
	Col3:setText( LocalizeToUpperString( "" ) )
	Col3:setTTF( "dinnext_regular" )
	Col3:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col3:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Col3 )
	self.Col3 = Col3
	
	local Col4 = LUI.UIText.new( 0, 0, 690, 788, 0.5, 0.5, -5, 13 )
	Col4:setRGB( 0.83, 0.11, 0.01 )
	Col4:setScale( 0.9, 0.9 )
	Col4:setText( LocalizeToUpperString( "" ) )
	Col4:setTTF( "dinnext_regular" )
	Col4:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col4:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Col4 )
	self.Col4 = Col4
	
	local Col5 = LUI.UIText.new( 0, 0, 791, 887, 0.5, 0.5, -5, 13 )
	Col5:setRGB( 0.83, 0.11, 0.01 )
	Col5:setScale( 0.9, 0.9 )
	Col5:setText( LocalizeToUpperString( "" ) )
	Col5:setTTF( "dinnext_regular" )
	Col5:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col5:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	self:addElement( Col5 )
	self.Col5 = Col5
	
	local Col6 = LUI.UIText.new( 0, 0, 33.5, 320.5, 0.5, 0.5, -5, 13 )
	Col6:setRGB( 0.83, 0.11, 0.01 )
	Col6:setScale( 0.9, 0.9 )
	Col6:setText( Engine[0xF9F1239CFD921FE]( "menu/playername" ) )
	Col6:setTTF( "dinnext_regular" )
	Col6:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	Col6:setAlignment( Enum.LUIAlignment[0xE821F0ECFF8D1C7] )
	self:addElement( Col6 )
	self.Col6 = Col6
	
	local TopBarAdd = LUI.UIImage.new( 0, 0, -3, 891, 0, 0, -9, -1 )
	TopBarAdd:setRGB( 0.92, 0.92, 0.92 )
	TopBarAdd:setImage( RegisterImage( "uie_ui_hud_zm_aar_common_bar" ) )
	TopBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	TopBarAdd:setShaderVector( 0, 0, 0, 0, 0 )
	TopBarAdd:setupNineSliceShader( 20, 4 )
	self:addElement( TopBarAdd )
	self.TopBarAdd = TopBarAdd
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	local f1_local9 = self
	CoD.ScoreboardUtility.SetRowHeader( f1_arg1, self.Col1, 0 )
	CoD.ScoreboardUtility.SetRowHeader( f1_arg1, self.Col2, 1 )
	CoD.ScoreboardUtility.SetRowHeader( f1_arg1, self.Col3, 2 )
	CoD.ScoreboardUtility.SetRowHeader( f1_arg1, self.Col4, 3 )
	CoD.ScoreboardUtility.SetRowHeader( f1_arg1, self.Col5, 4 )
	return self
end

CoD.ScoreboardColHeadersZM.__onClose = function ( f2_arg0 )
	f2_arg0.Col1:close()
	f2_arg0.Col2:close()
	f2_arg0.Col3:close()
	f2_arg0.Col4:close()
	f2_arg0.Col5:close()
end

