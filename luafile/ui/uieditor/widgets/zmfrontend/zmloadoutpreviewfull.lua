require( "ui/uieditor/widgets/zmfrontend/zmloadoutpreview" )
require( "ui/uieditor/widgets/zmfrontend/zmloadoutpreviewactiveclass" )
require( "ui/uieditor/widgets/zmfrontend/zmloadoutpreviewclasstabs" )
require( "ui/uieditor/widgets/zmfrontend/zmloadoutpreviewselectclass" )
require( "ui/uieditor/widgets/pc/pc_smallclosebutton" )

CoD.ZMLoadoutPreviewFull = InheritFrom( LUI.UIElement )
CoD.ZMLoadoutPreviewFull.__defaultWidth = 272
CoD.ZMLoadoutPreviewFull.__defaultHeight = 452
CoD.ZMLoadoutPreviewFull.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	CoD.CACUtility.InitSelectedCustomClassModel( f1_arg1 )
	self:setClass( CoD.ZMLoadoutPreviewFull )
	self.id = "ZMLoadoutPreviewFull"
	self.soundSet = "default"
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Blur = LUI.UIImage.new( 0, 0, -4, 276, 0, 0, 12.5, 455.5 )
	Blur:setMaterial( LUI.UIImage.GetCachedMaterial( 0xE2354BE557C4C7A ) )
	Blur:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Panel = LUI.UIImage.new( 0, 0, -4, 276, 0, 0, 12.5, 455.5 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.27 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local TiledBacking = LUI.UIImage.new( -0.02, -0.02, 1, 281, 0.04, 0.04, -4, 440 )
	TiledBacking:setAlpha( 0.5 )
	TiledBacking:setImage( RegisterImage( 0x34839E8065B1E53 ) )
	TiledBacking:setMaterial( LUI.UIImage.GetCachedMaterial( 0x6CBE95C250C6D15 ) )
	TiledBacking:setShaderVector( 0, 0, 0, 0, 0 )
	TiledBacking:setupNineSliceShader( 196, 88 )
	self:addElement( TiledBacking )
	self.TiledBacking = TiledBacking
	
	local ZMLoadoutPreview = CoD.ZMLoadoutPreview.new( f1_arg0, f1_arg1, 0.5, 0.5, -136, 136, 0, 0, 72, 451 )
	LUI.OverrideFunction_CallOriginalFirst( ZMLoadoutPreview, "childFocusGained", function ( element )
		UpdateElementState( self, "SelectedClass", f1_arg1 )
	end )
	LUI.OverrideFunction_CallOriginalFirst( ZMLoadoutPreview, "childFocusLost", function ( element )
		UpdateElementState( self, "SelectedClass", f1_arg1 )
	end )
	self:addElement( ZMLoadoutPreview )
	self.ZMLoadoutPreview = ZMLoadoutPreview
	
	local ZMLoadoutPreviewClassTabs = CoD.ZMLoadoutPreviewClassTabs.new( f1_arg0, f1_arg1, 0.5, 0.5, -180, 186, 0, 0, 5, 57 )
	self:addElement( ZMLoadoutPreviewClassTabs )
	self.ZMLoadoutPreviewClassTabs = ZMLoadoutPreviewClassTabs
	
	local SelectedClass = CoD.ZMLoadoutPreviewSelectClass.new( f1_arg0, f1_arg1, 0, 0, -4, 268, 0, 0, -36, 16 )
	SelectedClass:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f4_local0
				if not CoD.ZMLoadoutUtility.ShouldHideLoadoutPreviewSelectButton( menu, element, f1_arg1, "selectedCustomClass", "classNum" ) then
					f4_local0 = CoD.BaseUtility.DoesElementOrChildHaveFocus( self, "ZMLoadoutPreview" )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	SelectedClass:appendEventHandler( "input_source_changed", function ( f5_arg0, f5_arg1 )
		f5_arg1.menu = f5_arg1.menu or f1_arg0
		f1_arg0:updateElementState( SelectedClass, f5_arg1 )
	end )
	local Metalbar = SelectedClass
	local ActiveClassTab = SelectedClass.subscribeToModel
	local Metalbar3 = Engine.GetModelForController( f1_arg1 )
	ActiveClassTab( Metalbar, Metalbar3.LastInput, function ( f6_arg0 )
		f1_arg0:updateElementState( SelectedClass, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f6_arg0:get(),
			modelName = "LastInput"
		} )
	end, false )
	Metalbar = SelectedClass
	ActiveClassTab = SelectedClass.subscribeToModel
	Metalbar3 = Engine.GetModelForController( f1_arg1 )
	ActiveClassTab( Metalbar, Metalbar3.selectedCustomClass, function ( f7_arg0 )
		f1_arg0:updateElementState( SelectedClass, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = f7_arg0:get(),
			modelName = "selectedCustomClass"
		} )
	end, false )
	SelectedClass:linkToElementModel( SelectedClass, "classNum", true, function ( model )
		f1_arg0:updateElementState( SelectedClass, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "classNum"
		} )
	end )
	SelectedClass:appendEventHandler( "record_curr_focused_elem_id", function ( f9_arg0, f9_arg1 )
		f9_arg1.menu = f9_arg1.menu or f1_arg0
		f1_arg0:updateElementState( SelectedClass, f9_arg1 )
	end )
	self:addElement( SelectedClass )
	self.SelectedClass = SelectedClass
	
	ActiveClassTab = CoD.ZMLoadoutPreviewActiveClass.new( f1_arg0, f1_arg1, 0, 0, 13.5, 258.5, 0, 0, 6.5, 39.5 )
	self:addElement( ActiveClassTab )
	self.ActiveClassTab = ActiveClassTab
	
	Metalbar = LUI.UIImage.new( 0, 0, -14, 286, 0, 0, 59.5, 75.5 )
	Metalbar:setImage( RegisterImage( 0xF6761ADA7C49071 ) )
	self:addElement( Metalbar )
	self.Metalbar = Metalbar
	
	Metalbar3 = LUI.UIImage.new( 0, 0, -14, 286, 0, 0, 3.5, 19.5 )
	Metalbar3:setImage( RegisterImage( 0xF6761ADA7C49071 ) )
	self:addElement( Metalbar3 )
	self.Metalbar3 = Metalbar3
	
	local Metalbar2 = LUI.UIImage.new( 0, 0, -14, 286, 0, 0, 449, 465 )
	Metalbar2:setImage( RegisterImage( 0xF6761ADA7C49071 ) )
	self:addElement( Metalbar2 )
	self.Metalbar2 = Metalbar2
	
	local PCSmallCloseButton = nil
	
	PCSmallCloseButton = CoD.PC_SmallCloseButton.new( f1_arg0, f1_arg1, 1, 1, -20, 0, 0, 0, 15, 35 )
	PCSmallCloseButton:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_arg0, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8] )
		return f10_local0
	end )
	f1_arg0:AddButtonCallbackFunction( PCSmallCloseButton, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "ui_confirm", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		CoD.DirectorUtility.HideLoadoutPreview( f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "ui_confirm" )
		return false
	end, false )
	f1_arg0:AddButtonCallbackFunction( PCSmallCloseButton, f1_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], "MOUSE1", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		CoD.DirectorUtility.HideLoadoutPreview( f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton[0x865DD2DB1EFE9F8], 0x0, nil, "MOUSE1" )
		return false
	end, false )
	self:addElement( PCSmallCloseButton )
	self.PCSmallCloseButton = PCSmallCloseButton
	
	ZMLoadoutPreview:linkToElementModel( ZMLoadoutPreviewClassTabs.customClasssList, nil, false, function ( model )
		ZMLoadoutPreview:setModel( model, f1_arg1 )
	end )
	SelectedClass:linkToElementModel( ZMLoadoutPreviewClassTabs.customClasssList, nil, false, function ( model )
		SelectedClass:setModel( model, f1_arg1 )
	end )
	ActiveClassTab:linkToElementModel( ZMLoadoutPreviewClassTabs.customClasssList, nil, false, function ( model )
		ActiveClassTab:setModel( model, f1_arg1 )
	end )
	self:mergeStateConditions( {
		{
			stateName = "IsPC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	f1_arg0:AddButtonCallbackFunction( self, f1_arg1, Enum.LUIButton[0x755DA1E2E7C263F], nil, function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if IsElementInState( self.SelectedClass, "Visible" ) then
			CoD.ZMLoadoutUtility.SetEquippedBubbleGumPackToSelectedClass( self.ActiveClassTab, f19_arg2, f19_arg1 )
			CoD.CACUtility.SelectCustomClass( f19_arg2, self.SelectedClass )
			CoD.ZMLoadoutUtility.SaveZMLoadoutBuffer( f19_arg2 )
			PlaySoundAlias( "uin_list_action_generic" )
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		if IsElementInState( self.SelectedClass, "Visible" ) then
			CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton[0x755DA1E2E7C263F], 0x0, nil, nil )
			return false
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		PlaySoundAlias( "uin_list_close_generic" )
	end )
	ZMLoadoutPreview.id = "ZMLoadoutPreview"
	ZMLoadoutPreviewClassTabs.id = "ZMLoadoutPreviewClassTabs"
	if CoD.isPC then
		PCSmallCloseButton.id = "PCSmallCloseButton"
	end
	self.__defaultFocus = ZMLoadoutPreview
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	local f1_local12 = self
	if IsPC() then
		CoD.ZMLoadoutUtility.ChangeLoadoutPreviewLinkForPC( self, self.ZMLoadoutPreview, f1_arg1, self.ZMLoadoutPreviewClassTabs, "customClasssListPC" )
		CoD.ZMLoadoutUtility.ChangeLoadoutPreviewLinkForPC( self, self.ActiveClassTab, f1_arg1, self.ZMLoadoutPreviewClassTabs, "customClasssListPC" )
		CoD.ZMLoadoutUtility.ChangeLoadoutPreviewLinkForPC( self, self.SelectedClass, f1_arg1, self.ZMLoadoutPreviewClassTabs, "customClasssListPC" )
		CoD.ZMLoadoutUtility.LoadoutPreviewOcclusionWatcherPC( f1_arg0, f1_local12, f1_arg1 )
		DisableKeyboardNavigationByElement( self.ZMLoadoutPreviewClassTabs )
	end
	f1_local12 = ZMLoadoutPreview
	CoD.BaseUtility.SetElementModelToOtherElementModel( f1_arg1, self.ZMLoadoutPreviewClassTabs, self.ZMLoadoutPreviewClassTabs )
	return self
end

CoD.ZMLoadoutPreviewFull.__resetProperties = function ( f22_arg0 )
	f22_arg0.ActiveClassTab:completeAnimation()
	f22_arg0.ActiveClassTab:setLeftRight( 0, 0, 13.5, 258.5 )
	f22_arg0.ActiveClassTab:setTopBottom( 0, 0, 6.5, 39.5 )
end

CoD.ZMLoadoutPreviewFull.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f23_arg0, f23_arg1 )
			f23_arg0:__resetProperties()
			f23_arg0:setupElementClipCounter( 0 )
		end
	},
	IsPC = {
		DefaultClip = function ( f24_arg0, f24_arg1 )
			f24_arg0:__resetProperties()
			f24_arg0:setupElementClipCounter( 1 )
			f24_arg0.ActiveClassTab:completeAnimation()
			f24_arg0.ActiveClassTab:setLeftRight( 0.5, 0.5, -122.5, 122.5 )
			f24_arg0.ActiveClassTab:setTopBottom( 0, 0, 10, 43 )
			f24_arg0.clipFinished( f24_arg0.ActiveClassTab )
		end
	}
}
CoD.ZMLoadoutPreviewFull.__onClose = function ( f25_arg0 )
	f25_arg0.ZMLoadoutPreview:close()
	f25_arg0.SelectedClass:close()
	f25_arg0.ActiveClassTab:close()
	f25_arg0.ZMLoadoutPreviewClassTabs:close()
	f25_arg0.PCSmallCloseButton:close()
end

