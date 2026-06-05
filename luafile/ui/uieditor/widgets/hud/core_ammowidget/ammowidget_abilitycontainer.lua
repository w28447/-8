CoD.AmmoWidget_AbilityContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityContainer.__defaultWidth = 92
CoD.AmmoWidget_AbilityContainer.__defaultHeight = 44
CoD.AmmoWidget_AbilityContainer.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.AmmoWidget_AbilityContainer )
	self.id = "AmmoWidget_AbilityContainer"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local BlurPanel = LUI.UIImage.new( 0, 0, -6, 114, 0, 0, -3, 45 )
	BlurPanel:setImage( RegisterImage( "uie_hud_common_core_ammo_panelcenter" ) )
	BlurPanel:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	BlurPanel:setShaderVector( 0, 0, 0.07, 0, 0 )
	self:addElement( BlurPanel )
	self.BlurPanel = BlurPanel
	
	local BlurPanelTint = LUI.UIImage.new( 0, 0, -6, 114, 0, 0, -3, 45 )
	BlurPanelTint:setRGB( 0, 0, 0 )
	BlurPanelTint:setAlpha( 0.2 )
	BlurPanelTint:setImage( RegisterImage( "uie_hud_common_core_ammo_panelcenter" ) )
	self:addElement( BlurPanelTint )
	self.BlurPanelTint = BlurPanelTint
	
	local EquipmentEmpty = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, 0, 44 )
	EquipmentEmpty:setRGB( 0, 0, 0 )
	EquipmentEmpty:setAlpha( 0 )
	EquipmentEmpty:setImage( RegisterImage( 0xE06EE06576BABAB ) )
	EquipmentEmpty:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	EquipmentEmpty:setShaderVector( 0, 0, 0, 0, 0 )
	EquipmentEmpty:setupNineSliceShader( 46, 22 )
	self:addElement( EquipmentEmpty )
	self.EquipmentEmpty = EquipmentEmpty
	
	local EquipmentBacking = LUI.UIImage.new( 0, 1, 0, 0, 0, 0, 0, 44 )
	EquipmentBacking:setRGB( 0, 0, 0 )
	EquipmentBacking:setAlpha( 0 )
	EquipmentBacking:setImage( RegisterImage( 0x3D9FA23761E74CB ) )
	EquipmentBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	EquipmentBacking:setShaderVector( 0, 0, 0, 0, 0 )
	EquipmentBacking:setupNineSliceShader( 46, 22 )
	self:addElement( EquipmentBacking )
	self.EquipmentBacking = EquipmentBacking
	
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	local f1_local5 = self
	local f1_local6 = self.subscribeToModel
	local f1_local7 = Engine.GetGlobalModel()
	f1_local6( f1_local5, f1_local7["lobbyRoot.lobbyNav"], function ( f3_arg0 )
		f1_arg0:updateElementState( self, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f3_arg0:get(),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end, false )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

