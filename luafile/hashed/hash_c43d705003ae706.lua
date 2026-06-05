CoD.DemoPip = InheritFrom( LUI.UIElement )
CoD.DemoPip.__defaultWidth = 5
CoD.DemoPip.__defaultHeight = 5
CoD.DemoPip.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.DemoPip )
	self.id = "DemoPip"
	self.soundSet = "default"
	f1_arg0:addElementToPendingUpdateStateList( self )
	
	local Pip = LUI.UIImage.new( 0, 0, 0, 5, 0, 0, 0, 5 )
	Pip:setAlpha( 0 )
	self:addElement( Pip )
	self.Pip = Pip
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.DemoPip.__resetProperties = function ( f3_arg0 )
	f3_arg0.Pip:completeAnimation()
	f3_arg0.Pip:setAlpha( 0 )
end

CoD.DemoPip.__clipsPerState = {
	DefaultState = {
		DefaultClip = function ( f4_arg0, f4_arg1 )
			f4_arg0:__resetProperties()
			f4_arg0:setupElementClipCounter( 1 )
			f4_arg0.Pip:completeAnimation()
			f4_arg0.Pip:setAlpha( 0 )
			f4_arg0.clipFinished( f4_arg0.Pip )
		end
	},
	Visible = {
		DefaultClip = function ( f5_arg0, f5_arg1 )
			f5_arg0:__resetProperties()
			f5_arg0:setupElementClipCounter( 1 )
			f5_arg0.Pip:completeAnimation()
			f5_arg0.Pip:setAlpha( 1 )
			f5_arg0.clipFinished( f5_arg0.Pip )
		end
	}
}
