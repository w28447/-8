require( "x64:7357025bc1f19ee" )

CoD.PC_ZmAmmo_BGBCarouselFactory_Internal = InheritFrom( LUI.UIElement )
CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.__defaultWidth = 400
CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.__defaultHeight = 363
CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.PC_ZmAmmo_BGBCarouselFactory_Internal )
	self.id = "PC_ZmAmmo_BGBCarouselFactory_Internal"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local FourthElixirBG = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, 72.5, 172.5 )
	FourthElixirBG:setAlpha( 0.24 )
	FourthElixirBG:setZRot( 180 )
	FourthElixirBG:setImage( RegisterImage( 0x57983154A73D175 ) )
	self:addElement( FourthElixirBG )
	self.FourthElixirBG = FourthElixirBG
	
	local FourthElixirBGWipe = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, 72.5, 172.5 )
	FourthElixirBGWipe:setXRot( 1 )
	FourthElixirBGWipe:setZRot( 180 )
	FourthElixirBGWipe:setImage( RegisterImage( 0x57983154A73D175 ) )
	FourthElixirBGWipe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	FourthElixirBGWipe:setShaderVector( 1, 0, 0, 0, 0 )
	FourthElixirBGWipe:setShaderVector( 2, 1, 0, 0, 0 )
	FourthElixirBGWipe:setShaderVector( 3, 0, 0, 0, 0 )
	FourthElixirBGWipe:setShaderVector( 4, 0, 0, 0, 0 )
	FourthElixirBGWipe:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "global_cooldown", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			FourthElixirBGWipe:setShaderVector( 0, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) )
		end
	end )
	self:addElement( FourthElixirBGWipe )
	self.FourthElixirBGWipe = FourthElixirBGWipe
	
	local FourthElixirFrame = LUI.UIImage.new( 0.5, 0.5, 26, 208, 0.5, 0.5, 70.5, 170.5 )
	FourthElixirFrame:setImage( RegisterImage( 0x3A8B203A5D9E443 ) )
	self:addElement( FourthElixirFrame )
	self.FourthElixirFrame = FourthElixirFrame
	
	local FourthtempGumName = LUI.UIText.new( 0.5, 0.5, -199, 1, 0.5, 0.5, 110, 131 )
	FourthtempGumName:setTTF( "skorzhen" )
	FourthtempGumName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	FourthtempGumName:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	FourthtempGumName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	FourthtempGumName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "3.gum_idx", function ( model )
		local f3_local0 = model:get()
		if f3_local0 ~= nil then
			FourthtempGumName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f3_local0 ) ) )
		end
	end )
	self:addElement( FourthtempGumName )
	self.FourthtempGumName = FourthtempGumName
	
	local BBGumRingBackerFourth = LUI.UIImage.new( 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, 81, 162 )
	BBGumRingBackerFourth:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerFourth )
	self.BBGumRingBackerFourth = BBGumRingBackerFourth
	
	local fourthElixir = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, 81, 162 )
	fourthElixir:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "3", function ( model )
		fourthElixir:setModel( model, f1_arg1 )
	end )
	self:addElement( fourthElixir )
	self.fourthElixir = fourthElixir
	
	local ThirdElixirBGWipe = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -12.5, 87.5 )
	ThirdElixirBGWipe:setZRot( 180 )
	ThirdElixirBGWipe:setImage( RegisterImage( 0x57983154A73D175 ) )
	ThirdElixirBGWipe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	ThirdElixirBGWipe:setShaderVector( 1, 0, 0, 0, 0 )
	ThirdElixirBGWipe:setShaderVector( 2, 1, 0, 0, 0 )
	ThirdElixirBGWipe:setShaderVector( 3, 0, 0, 0, 0 )
	ThirdElixirBGWipe:setShaderVector( 4, 0, 0, 0, 0 )
	ThirdElixirBGWipe:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "global_cooldown", function ( model )
		local f5_local0 = model:get()
		if f5_local0 ~= nil then
			ThirdElixirBGWipe:setShaderVector( 0, CoD.GetVectorComponentFromString( f5_local0, 1 ), CoD.GetVectorComponentFromString( f5_local0, 2 ), CoD.GetVectorComponentFromString( f5_local0, 3 ), CoD.GetVectorComponentFromString( f5_local0, 4 ) )
		end
	end )
	self:addElement( ThirdElixirBGWipe )
	self.ThirdElixirBGWipe = ThirdElixirBGWipe
	
	local ThirdElixirBG = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -12.5, 87.5 )
	ThirdElixirBG:setAlpha( 0.24 )
	ThirdElixirBG:setZRot( 180 )
	ThirdElixirBG:setImage( RegisterImage( 0x57983154A73D175 ) )
	self:addElement( ThirdElixirBG )
	self.ThirdElixirBG = ThirdElixirBG
	
	local ThirdBGBKeybind2 = LUI.UIText.new( 0.5, 0.5, 20.5, 123.5, 0.5, 0.5, 106, 133 )
	ThirdBGBKeybind2:setTTF( "notosans_bold" )
	ThirdBGBKeybind2:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	ThirdBGBKeybind2:setShaderVector( 0, 0.15, 0, 0, 0 )
	ThirdBGBKeybind2:setShaderVector( 1, 0, 0, 0, 1 )
	ThirdBGBKeybind2:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ThirdBGBKeybind2:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	ThirdBGBKeybind2:subscribeToGlobalModel( f1_arg1, "BGBLoadout", "Left.promptPC", function ( model )
		local f6_local0 = model:get()
		if f6_local0 ~= nil then
			ThirdBGBKeybind2:setText( Engine[0xF9F1239CFD921FE]( f6_local0 ) )
		end
	end )
	self:addElement( ThirdBGBKeybind2 )
	self.ThirdBGBKeybind2 = ThirdBGBKeybind2
	
	local ThirdElixirFrame = LUI.UIImage.new( 0.5, 0.5, 26, 208, 0.5, 0.5, -14.5, 85.5 )
	ThirdElixirFrame:setImage( RegisterImage( 0x3A8B203A5D9E443 ) )
	self:addElement( ThirdElixirFrame )
	self.ThirdElixirFrame = ThirdElixirFrame
	
	local ThirdtempGumName = LUI.UIText.new( 0.5, 0.5, -199, 1, 0.5, 0.5, 27, 48 )
	ThirdtempGumName:setTTF( "skorzhen" )
	ThirdtempGumName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	ThirdtempGumName:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	ThirdtempGumName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	ThirdtempGumName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "2.gum_idx", function ( model )
		local f7_local0 = model:get()
		if f7_local0 ~= nil then
			ThirdtempGumName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f7_local0 ) ) )
		end
	end )
	self:addElement( ThirdtempGumName )
	self.ThirdtempGumName = ThirdtempGumName
	
	local ThirdBGBKeybind = LUI.UIText.new( 0.5, 0.5, 20.5, 123.5, 0.5, 0.5, 22, 49 )
	ThirdBGBKeybind:setTTF( "notosans_bold" )
	ThirdBGBKeybind:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	ThirdBGBKeybind:setShaderVector( 0, 0.15, 0, 0, 0 )
	ThirdBGBKeybind:setShaderVector( 1, 0, 0, 0, 1 )
	ThirdBGBKeybind:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	ThirdBGBKeybind:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	ThirdBGBKeybind:subscribeToGlobalModel( f1_arg1, "BGBLoadout", "Down.promptPC", function ( model )
		local f8_local0 = model:get()
		if f8_local0 ~= nil then
			ThirdBGBKeybind:setText( Engine[0xF9F1239CFD921FE]( f8_local0 ) )
		end
	end )
	self:addElement( ThirdBGBKeybind )
	self.ThirdBGBKeybind = ThirdBGBKeybind
	
	local BBGumRingBackerThird = LUI.UIImage.new( 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -4, 77 )
	BBGumRingBackerThird:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerThird )
	self.BBGumRingBackerThird = BBGumRingBackerThird
	
	local thirdElixir = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -4, 77 )
	thirdElixir:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "2", function ( model )
		thirdElixir:setModel( model, f1_arg1 )
	end )
	self:addElement( thirdElixir )
	self.thirdElixir = thirdElixir
	
	local SecondElixirBG = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -98, 2 )
	SecondElixirBG:setAlpha( 0.24 )
	SecondElixirBG:setZRot( 180 )
	SecondElixirBG:setImage( RegisterImage( 0x57983154A73D175 ) )
	self:addElement( SecondElixirBG )
	self.SecondElixirBG = SecondElixirBG
	
	local SecondElixirBGWipe = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -98, 2 )
	SecondElixirBGWipe:setZRot( 180 )
	SecondElixirBGWipe:setImage( RegisterImage( 0x57983154A73D175 ) )
	SecondElixirBGWipe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	SecondElixirBGWipe:setShaderVector( 1, 0, 0, 0, 0 )
	SecondElixirBGWipe:setShaderVector( 2, 1, 0, 0, 0 )
	SecondElixirBGWipe:setShaderVector( 3, 0, 0, 0, 0 )
	SecondElixirBGWipe:setShaderVector( 4, 0, 0, 0, 0 )
	SecondElixirBGWipe:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "global_cooldown", function ( model )
		local f10_local0 = model:get()
		if f10_local0 ~= nil then
			SecondElixirBGWipe:setShaderVector( 0, CoD.GetVectorComponentFromString( f10_local0, 1 ), CoD.GetVectorComponentFromString( f10_local0, 2 ), CoD.GetVectorComponentFromString( f10_local0, 3 ), CoD.GetVectorComponentFromString( f10_local0, 4 ) )
		end
	end )
	self:addElement( SecondElixirBGWipe )
	self.SecondElixirBGWipe = SecondElixirBGWipe
	
	local SecondElixirFrame = LUI.UIImage.new( 0.5, 0.5, 26, 208, 0.5, 0.5, -100, 0 )
	SecondElixirFrame:setImage( RegisterImage( 0x3A8B203A5D9E443 ) )
	self:addElement( SecondElixirFrame )
	self.SecondElixirFrame = SecondElixirFrame
	
	local BBGumRingBackerSecond = LUI.UIImage.new( 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -89.5, -8.5 )
	BBGumRingBackerSecond:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerSecond )
	self.BBGumRingBackerSecond = BBGumRingBackerSecond
	
	local secondElixir = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -89.5, -8.5 )
	secondElixir:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "1", function ( model )
		secondElixir:setModel( model, f1_arg1 )
	end )
	self:addElement( secondElixir )
	self.secondElixir = secondElixir
	
	local SecondtempGumName = LUI.UIText.new( 0.5, 0.5, -199, 1, 0.5, 0.5, -60.5, -39.5 )
	SecondtempGumName:setTTF( "skorzhen" )
	SecondtempGumName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	SecondtempGumName:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	SecondtempGumName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	SecondtempGumName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "1.gum_idx", function ( model )
		local f12_local0 = model:get()
		if f12_local0 ~= nil then
			SecondtempGumName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f12_local0 ) ) )
		end
	end )
	self:addElement( SecondtempGumName )
	self.SecondtempGumName = SecondtempGumName
	
	local SecondBGBKeybind = LUI.UIText.new( 0.5, 0.5, 20.5, 123.5, 0.5, 0.5, -64.5, -37.5 )
	SecondBGBKeybind:setTTF( "notosans_bold" )
	SecondBGBKeybind:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	SecondBGBKeybind:setShaderVector( 0, 0.15, 0, 0, 0 )
	SecondBGBKeybind:setShaderVector( 1, 0, 0, 0, 1 )
	SecondBGBKeybind:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	SecondBGBKeybind:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	SecondBGBKeybind:subscribeToGlobalModel( f1_arg1, "BGBLoadout", "Right.promptPC", function ( model )
		local f13_local0 = model:get()
		if f13_local0 ~= nil then
			SecondBGBKeybind:setText( Engine[0xF9F1239CFD921FE]( f13_local0 ) )
		end
	end )
	self:addElement( SecondBGBKeybind )
	self.SecondBGBKeybind = SecondBGBKeybind
	
	local FirstElixirBG = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -183, -83 )
	FirstElixirBG:setAlpha( 0.24 )
	FirstElixirBG:setZRot( 180 )
	FirstElixirBG:setImage( RegisterImage( 0x57983154A73D175 ) )
	self:addElement( FirstElixirBG )
	self.FirstElixirBG = FirstElixirBG
	
	local FirstElixirBGWipe = LUI.UIImage.new( 0.5, 0.5, -2.5, 140.5, 0.5, 0.5, -183, -83 )
	FirstElixirBGWipe:setZRot( 180 )
	FirstElixirBGWipe:setImage( RegisterImage( 0x57983154A73D175 ) )
	FirstElixirBGWipe:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	FirstElixirBGWipe:setShaderVector( 1, 0, 0, 0, 0 )
	FirstElixirBGWipe:setShaderVector( 2, 1, 0, 0, 0 )
	FirstElixirBGWipe:setShaderVector( 3, 0, 0, 0, 0 )
	FirstElixirBGWipe:setShaderVector( 4, 0, 0, 0, 0 )
	FirstElixirBGWipe:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "global_cooldown", function ( model )
		local f14_local0 = model:get()
		if f14_local0 ~= nil then
			FirstElixirBGWipe:setShaderVector( 0, CoD.GetVectorComponentFromString( f14_local0, 1 ), CoD.GetVectorComponentFromString( f14_local0, 2 ), CoD.GetVectorComponentFromString( f14_local0, 3 ), CoD.GetVectorComponentFromString( f14_local0, 4 ) )
		end
	end )
	self:addElement( FirstElixirBGWipe )
	self.FirstElixirBGWipe = FirstElixirBGWipe
	
	local FirstElixirFrame = LUI.UIImage.new( 0.5, 0.5, 26, 208, 0.5, 0.5, -185.5, -85.5 )
	FirstElixirFrame:setImage( RegisterImage( 0x3A8B203A5D9E443 ) )
	self:addElement( FirstElixirFrame )
	self.FirstElixirFrame = FirstElixirFrame
	
	local FirsttempGumName = LUI.UIText.new( 0.5, 0.5, -199, 1, 0.5, 0.5, -146, -125 )
	FirsttempGumName:setTTF( "skorzhen" )
	FirsttempGumName:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	FirsttempGumName:setAlignment( Enum.LUIAlignment[0x830CFD395E6AA0A] )
	FirsttempGumName:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	FirsttempGumName:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "0.gum_idx", function ( model )
		local f15_local0 = model:get()
		if f15_local0 ~= nil then
			FirsttempGumName:setText( Engine[0xF9F1239CFD921FE]( GetItemNameFromIndex( Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE], f15_local0 ) ) )
		end
	end )
	self:addElement( FirsttempGumName )
	self.FirsttempGumName = FirsttempGumName
	
	local FirstBGBKeybind = LUI.UIText.new( 0.5, 0.5, 20.5, 123.5, 0.5, 0.5, -149, -122 )
	FirstBGBKeybind:setTTF( "notosans_bold" )
	FirstBGBKeybind:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6250C6FCAC36BD4 ) )
	FirstBGBKeybind:setShaderVector( 0, 0.15, 0, 0, 0 )
	FirstBGBKeybind:setShaderVector( 1, 0, 0, 0, 1 )
	FirstBGBKeybind:setAlignment( Enum.LUIAlignment[0xFEEB12BCB0D7041] )
	FirstBGBKeybind:setAlignment( Enum.LUIAlignment[0x6ED4298C93DC5ED] )
	FirstBGBKeybind:subscribeToGlobalModel( f1_arg1, "BGBLoadout", "Up.promptPC", function ( model )
		local f16_local0 = model:get()
		if f16_local0 ~= nil then
			FirstBGBKeybind:setText( Engine[0xF9F1239CFD921FE]( f16_local0 ) )
		end
	end )
	self:addElement( FirstBGBKeybind )
	self.FirstBGBKeybind = FirstBGBKeybind
	
	local BBGumRingBackerFirst = LUI.UIImage.new( 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -175.5, -94.5 )
	BBGumRingBackerFirst:setImage( RegisterImage( "uie_zm_hud_elixirringmeterbg" ) )
	self:addElement( BBGumRingBackerFirst )
	self.BBGumRingBackerFirst = BBGumRingBackerFirst
	
	local firstElixir = CoD.ZmAmmo_BGBCarouselItemInternalFactory.new( f1_arg0, f1_arg1, 0.5, 0.5, 121.5, 202.5, 0.5, 0.5, -176, -95 )
	firstElixir:subscribeToGlobalModel( f1_arg1, "BGBCarousel", "0", function ( model )
		firstElixir:setModel( model, f1_arg1 )
	end )
	self:addElement( firstElixir )
	self.firstElixir = firstElixir
	
	self:mergeStateConditions( {
		{
			stateName = "ScoreboardOpen",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( f1_arg1, Enum.UIVisibilityBit[0xF4EDA8B636F3F04] ) and not CoD.ModelUtility.IsGlobalDataSourceModelValueTrue( f1_arg1, "ZMHudGlobal", "isScoreboardPCOpen" )
			end
		}
	} )
	local f1_local29 = self
	local f1_local30 = self.subscribeToModel
	local f1_local31 = Engine.GetModelForController( f1_arg1 )
	f1_local30( f1_local29, f1_local31["UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]], function ( f19_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f19_arg0:get(),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit[0xF4EDA8B636F3F04]
		} )
	end, false )
	f1_local29 = self
	f1_local30 = self.subscribeToModel
	f1_local31 = DataSources.ZMHudGlobal.getModel( f1_arg1 )
	f1_local30( f1_local29, f1_local31.isScoreboardPCOpen, function ( f20_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f20_arg0:get(),
			modelName = "isScoreboardPCOpen"
		} )
	end, false )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	f1_local30 = self
	SetElementProperty( self.firstElixir, "isKBMElixir", 1 )
	SetElementProperty( self.secondElixir, "isKBMElixir", 1 )
	SetElementProperty( self.thirdElixir, "isKBMElixir", 1 )
	SetElementProperty( self.fourthElixir, "isKBMElixir", 1 )
	return self
end

CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.__resetProperties = function ( f21_arg0 )
	f21_arg0.FourthtempGumName:completeAnimation()
	f21_arg0.ThirdtempGumName:completeAnimation()
	f21_arg0.SecondtempGumName:completeAnimation()
	f21_arg0.FirsttempGumName:completeAnimation()
	f21_arg0.FourthtempGumName:setAlpha( 1 )
	f21_arg0.FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	f21_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	f21_arg0.ThirdtempGumName:setAlpha( 1 )
	f21_arg0.ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	f21_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	f21_arg0.SecondtempGumName:setAlpha( 1 )
	f21_arg0.SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	f21_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
	f21_arg0.FirsttempGumName:setAlpha( 1 )
	f21_arg0.FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
	f21_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
end

CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f22_arg0, f22_arg1 )
			f22_arg0:__resetProperties()
			f22_arg0:setupElementClipCounter( 4 )
			f22_arg0.FourthtempGumName:completeAnimation()
			f22_arg0.FourthtempGumName:setAlpha( 0 )
			f22_arg0.FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f22_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f22_arg0.clipFinished( f22_arg0.FourthtempGumName )
			f22_arg0.ThirdtempGumName:completeAnimation()
			f22_arg0.ThirdtempGumName:setAlpha( 0 )
			f22_arg0.ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f22_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f22_arg0.clipFinished( f22_arg0.ThirdtempGumName )
			f22_arg0.SecondtempGumName:completeAnimation()
			f22_arg0.SecondtempGumName:setAlpha( 0 )
			f22_arg0.SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f22_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f22_arg0.clipFinished( f22_arg0.SecondtempGumName )
			f22_arg0.FirsttempGumName:completeAnimation()
			f22_arg0.FirsttempGumName:setAlpha( 0 )
			f22_arg0.FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f22_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f22_arg0.clipFinished( f22_arg0.FirsttempGumName )
		end,
		ScoreboardOpen = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 4 )
			local f23_local0 = function ( f24_arg0 )
				f23_arg0.FourthtempGumName:beginAnimation( 200 )
				f23_arg0.FourthtempGumName:setAlpha( 1 )
				f23_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
				f23_arg0.FourthtempGumName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.FourthtempGumName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.FourthtempGumName:completeAnimation()
			f23_arg0.FourthtempGumName:setAlpha( 0 )
			f23_arg0.FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f23_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f23_local0( f23_arg0.FourthtempGumName )
			local f23_local1 = function ( f25_arg0 )
				f23_arg0.ThirdtempGumName:beginAnimation( 200 )
				f23_arg0.ThirdtempGumName:setAlpha( 1 )
				f23_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
				f23_arg0.ThirdtempGumName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.ThirdtempGumName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.ThirdtempGumName:completeAnimation()
			f23_arg0.ThirdtempGumName:setAlpha( 0 )
			f23_arg0.ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f23_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f23_local1( f23_arg0.ThirdtempGumName )
			local f23_local2 = function ( f26_arg0 )
				f23_arg0.SecondtempGumName:beginAnimation( 200 )
				f23_arg0.SecondtempGumName:setAlpha( 1 )
				f23_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
				f23_arg0.SecondtempGumName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.SecondtempGumName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.SecondtempGumName:completeAnimation()
			f23_arg0.SecondtempGumName:setAlpha( 0 )
			f23_arg0.SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f23_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f23_local2( f23_arg0.SecondtempGumName )
			local f23_local3 = function ( f27_arg0 )
				f23_arg0.FirsttempGumName:beginAnimation( 200 )
				f23_arg0.FirsttempGumName:setAlpha( 1 )
				f23_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
				f23_arg0.FirsttempGumName:registerEventHandler( "interrupted_keyframe", f23_arg0.clipInterrupted )
				f23_arg0.FirsttempGumName:registerEventHandler( "transition_complete_keyframe", f23_arg0.clipFinished )
			end
			
			f23_arg0.FirsttempGumName:completeAnimation()
			f23_arg0.FirsttempGumName:setAlpha( 0 )
			f23_arg0.FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f23_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0 )
			f23_local3( f23_arg0.FirsttempGumName )
		end
	},
	ScoreboardOpen = {
		DefaultClip = function ( f28_arg0, f28_arg1 )
			f28_arg0:__resetProperties()
			f28_arg0:setupElementClipCounter( 4 )
			f28_arg0.FourthtempGumName:completeAnimation()
			f28_arg0.FourthtempGumName:setAlpha( 1 )
			f28_arg0.FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f28_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f28_arg0.clipFinished( f28_arg0.FourthtempGumName )
			f28_arg0.ThirdtempGumName:completeAnimation()
			f28_arg0.ThirdtempGumName:setAlpha( 1 )
			f28_arg0.ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f28_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f28_arg0.clipFinished( f28_arg0.ThirdtempGumName )
			f28_arg0.SecondtempGumName:completeAnimation()
			f28_arg0.SecondtempGumName:setAlpha( 1 )
			f28_arg0.SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f28_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f28_arg0.clipFinished( f28_arg0.SecondtempGumName )
			f28_arg0.FirsttempGumName:completeAnimation()
			f28_arg0.FirsttempGumName:setAlpha( 1 )
			f28_arg0.FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f28_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f28_arg0.clipFinished( f28_arg0.FirsttempGumName )
		end,
		DefaultState = function ( f29_arg0, f29_arg1 )
			f29_arg0:__resetProperties()
			f29_arg0:setupElementClipCounter( 4 )
			local f29_local0 = function ( f30_arg0 )
				f29_arg0.FourthtempGumName:beginAnimation( 200 )
				f29_arg0.FourthtempGumName:setAlpha( 0 )
				f29_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
				f29_arg0.FourthtempGumName:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.FourthtempGumName:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.FourthtempGumName:completeAnimation()
			f29_arg0.FourthtempGumName:setAlpha( 1 )
			f29_arg0.FourthtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f29_arg0.FourthtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f29_local0( f29_arg0.FourthtempGumName )
			local f29_local1 = function ( f31_arg0 )
				f29_arg0.ThirdtempGumName:beginAnimation( 200 )
				f29_arg0.ThirdtempGumName:setAlpha( 0 )
				f29_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
				f29_arg0.ThirdtempGumName:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.ThirdtempGumName:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.ThirdtempGumName:completeAnimation()
			f29_arg0.ThirdtempGumName:setAlpha( 1 )
			f29_arg0.ThirdtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f29_arg0.ThirdtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f29_local1( f29_arg0.ThirdtempGumName )
			local f29_local2 = function ( f32_arg0 )
				f29_arg0.SecondtempGumName:beginAnimation( 200 )
				f29_arg0.SecondtempGumName:setAlpha( 0 )
				f29_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0 )
				f29_arg0.SecondtempGumName:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.SecondtempGumName:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.SecondtempGumName:completeAnimation()
			f29_arg0.SecondtempGumName:setAlpha( 1 )
			f29_arg0.SecondtempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f29_arg0.SecondtempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f29_local2( f29_arg0.SecondtempGumName )
			local f29_local3 = function ( f33_arg0 )
				f29_arg0.FirsttempGumName:beginAnimation( 200 )
				f29_arg0.FirsttempGumName:setAlpha( 0 )
				f29_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0 )
				f29_arg0.FirsttempGumName:registerEventHandler( "interrupted_keyframe", f29_arg0.clipInterrupted )
				f29_arg0.FirsttempGumName:registerEventHandler( "transition_complete_keyframe", f29_arg0.clipFinished )
			end
			
			f29_arg0.FirsttempGumName:completeAnimation()
			f29_arg0.FirsttempGumName:setAlpha( 1 )
			f29_arg0.FirsttempGumName:setShaderVector( 0, 0.1, 0, 0, 0 )
			f29_arg0.FirsttempGumName:setShaderVector( 1, 0, 0, 0, 0.7 )
			f29_local3( f29_arg0.FirsttempGumName )
		end
	}
}
CoD.PC_ZmAmmo_BGBCarouselFactory_Internal.__onClose = function ( f34_arg0 )
	f34_arg0.FourthElixirBGWipe:close()
	f34_arg0.FourthtempGumName:close()
	f34_arg0.fourthElixir:close()
	f34_arg0.ThirdElixirBGWipe:close()
	f34_arg0.ThirdBGBKeybind2:close()
	f34_arg0.ThirdtempGumName:close()
	f34_arg0.ThirdBGBKeybind:close()
	f34_arg0.thirdElixir:close()
	f34_arg0.SecondElixirBGWipe:close()
	f34_arg0.secondElixir:close()
	f34_arg0.SecondtempGumName:close()
	f34_arg0.SecondBGBKeybind:close()
	f34_arg0.FirstElixirBGWipe:close()
	f34_arg0.FirsttempGumName:close()
	f34_arg0.FirstBGBKeybind:close()
	f34_arg0.firstElixir:close()
end

