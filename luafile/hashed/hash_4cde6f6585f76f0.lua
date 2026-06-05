CoD.ZmAmmo_WeaponProgressFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_WeaponProgressFactory.__defaultWidth = 64
CoD.ZmAmmo_WeaponProgressFactory.__defaultHeight = 16
CoD.ZmAmmo_WeaponProgressFactory.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ZmAmmo_WeaponProgressFactory )
	self.id = "ZmAmmo_WeaponProgressFactory"
	self.soundSet = "none"
	
	local backing = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	backing:setImage( RegisterImage( "uie_zm_hud_specweapon_meterbg" ) )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	backing:setShaderVector( 0, 0.05, 0.05, 0.05, 0.05 )
	self:addElement( backing )
	self.backing = backing
	
	local progress = LUI.UIImage.new( 0, 1, 0, 0, 0, 1, 0, 0 )
	progress:setImage( RegisterImage( "uie_zm_hud_specweapon_meterfg" ) )
	progress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	progress:setShaderVector( 1, 0, 0, 0, 0 )
	progress:setShaderVector( 2, 1, 0, 0, 0 )
	progress:setShaderVector( 3, 0, 0, 0, 0 )
	progress:setShaderVector( 4, 0, 0, 0, 0 )
	progress:subscribeToGlobalModel( f1_arg1, "ZMHud", "weaponProgression", function ( model )
		local f2_local0 = model:get()
		if f2_local0 ~= nil then
			progress:setShaderVector( 0, AdjustStartEnd( 0.08, 0.88, CoD.GetVectorComponentFromString( f2_local0, 1 ), CoD.GetVectorComponentFromString( f2_local0, 2 ), CoD.GetVectorComponentFromString( f2_local0, 3 ), CoD.GetVectorComponentFromString( f2_local0, 4 ) ) )
		end
	end )
	self:addElement( progress )
	self.progress = progress
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ZmAmmo_WeaponProgressFactory.__onClose = function ( f3_arg0 )
	f3_arg0.progress:close()
end

