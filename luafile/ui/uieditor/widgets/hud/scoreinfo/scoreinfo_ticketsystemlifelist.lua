require( "ui/uieditor/widgets/hud/scoreinfo/scoreinfo_ticketsystemlife" )

CoD.ScoreInfo_TicketSystemLifeList = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_TicketSystemLifeList.__defaultWidth = 85
CoD.ScoreInfo_TicketSystemLifeList.__defaultHeight = 32
CoD.ScoreInfo_TicketSystemLifeList.new = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	local self = LUI.UIElement.new( f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6, f1_arg7, f1_arg8, f1_arg9 )
	self:setClass( CoD.ScoreInfo_TicketSystemLifeList )
	self.id = "ScoreInfo_TicketSystemLifeList"
	self.soundSet = "default"
	self.anyChildUsesUpdateState = true
	
	local Life1 = CoD.ScoreInfo_TicketSystemLife.new( f1_arg0, f1_arg1, 0, 0, -5, 27, 0, 0, 0, 32 )
	Life1:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "teamSize", 1 )
			end
		},
		{
			stateName = "Eliminated",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "numPlayersAlive", 1 ) and CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	Life1:linkToElementModel( Life1, "teamSize", true, function ( model )
		f1_arg0:updateElementState( Life1, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "teamSize"
		} )
	end )
	Life1:linkToElementModel( Life1, "numPlayersAlive", true, function ( model )
		f1_arg0:updateElementState( Life1, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersAlive"
		} )
	end )
	Life1:linkToElementModel( Life1, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( Life1, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	Life1:linkToElementModel( self, nil, false, function ( model )
		Life1:setModel( model, f1_arg1 )
	end )
	self:addElement( Life1 )
	self.Life1 = Life1
	
	local Life2 = CoD.ScoreInfo_TicketSystemLife.new( f1_arg0, f1_arg1, 0, 0, 11, 43, 0, 0, 0, 32 )
	Life2:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "teamSize", 2 )
			end
		},
		{
			stateName = "Eliminated",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "numPlayersAlive", 2 )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.BountyHunterUtility.TicketInDownedState( self, 1 )
			end
		}
	} )
	Life2:linkToElementModel( Life2, "teamSize", true, function ( model )
		f1_arg0:updateElementState( Life2, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "teamSize"
		} )
	end )
	Life2:linkToElementModel( Life2, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( Life2, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	Life2:linkToElementModel( Life2, "numPlayersAlive", true, function ( model )
		f1_arg0:updateElementState( Life2, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersAlive"
		} )
	end )
	Life2:linkToElementModel( Life2, "numPlayersDowned", true, function ( model )
		f1_arg0:updateElementState( Life2, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersDowned"
		} )
	end )
	Life2:linkToElementModel( self, nil, false, function ( model )
		Life2:setModel( model, f1_arg1 )
	end )
	self:addElement( Life2 )
	self.Life2 = Life2
	
	local Life3 = CoD.ScoreInfo_TicketSystemLife.new( f1_arg0, f1_arg1, 0, 0, 27, 59, 0, 0, 0, 32 )
	Life3:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "teamSize", 3 )
			end
		},
		{
			stateName = "Eliminated",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "numPlayersAlive", 3 )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.BountyHunterUtility.TicketInDownedState( self, 2 )
			end
		}
	} )
	Life3:linkToElementModel( Life3, "teamSize", true, function ( model )
		f1_arg0:updateElementState( Life3, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "teamSize"
		} )
	end )
	Life3:linkToElementModel( Life3, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( Life3, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	Life3:linkToElementModel( Life3, "numPlayersAlive", true, function ( model )
		f1_arg0:updateElementState( Life3, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersAlive"
		} )
	end )
	Life3:linkToElementModel( Life3, "numPlayersDowned", true, function ( model )
		f1_arg0:updateElementState( Life3, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersDowned"
		} )
	end )
	Life3:linkToElementModel( self, nil, false, function ( model )
		Life3:setModel( model, f1_arg1 )
	end )
	self:addElement( Life3 )
	self.Life3 = Life3
	
	local Life4 = CoD.ScoreInfo_TicketSystemLife.new( f1_arg0, f1_arg1, 0, 0, 43, 75, 0, 0, 0, 32 )
	Life4:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "teamSize", 4 )
			end
		},
		{
			stateName = "Eliminated",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "numPlayersAlive", 4 )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.BountyHunterUtility.TicketInDownedState( self, 3 )
			end
		}
	} )
	Life4:linkToElementModel( Life4, "teamSize", true, function ( model )
		f1_arg0:updateElementState( Life4, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "teamSize"
		} )
	end )
	Life4:linkToElementModel( Life4, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( Life4, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	Life4:linkToElementModel( Life4, "numPlayersAlive", true, function ( model )
		f1_arg0:updateElementState( Life4, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersAlive"
		} )
	end )
	Life4:linkToElementModel( Life4, "numPlayersDowned", true, function ( model )
		f1_arg0:updateElementState( Life4, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersDowned"
		} )
	end )
	Life4:linkToElementModel( self, nil, false, function ( model )
		Life4:setModel( model, f1_arg1 )
	end )
	self:addElement( Life4 )
	self.Life4 = Life4
	
	local Life5 = CoD.ScoreInfo_TicketSystemLife.new( f1_arg0, f1_arg1, 0, 0, 59, 91, 0, 0, 0, 32 )
	Life5:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "teamSize", 5 )
			end
		},
		{
			stateName = "Eliminated",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.ModelUtility.IsSelfModelValueLessThan( element, f1_arg1, "numPlayersAlive", 5 )
			end
		},
		{
			stateName = "Downed",
			condition = function ( menu, element, event )
				return CoD.ModelUtility.IsSelfModelValueTrue( element, f1_arg1, "noRespawnsLeft" ) and CoD.BountyHunterUtility.TicketInDownedState( self, 4 )
			end
		}
	} )
	Life5:linkToElementModel( Life5, "teamSize", true, function ( model )
		f1_arg0:updateElementState( Life5, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "teamSize"
		} )
	end )
	Life5:linkToElementModel( Life5, "noRespawnsLeft", true, function ( model )
		f1_arg0:updateElementState( Life5, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "noRespawnsLeft"
		} )
	end )
	Life5:linkToElementModel( Life5, "numPlayersAlive", true, function ( model )
		f1_arg0:updateElementState( Life5, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersAlive"
		} )
	end )
	Life5:linkToElementModel( Life5, "numPlayersDowned", true, function ( model )
		f1_arg0:updateElementState( Life5, {
			name = "model_validation",
			menu = f1_arg0,
			controller = f1_arg1,
			modelValue = model:get(),
			modelName = "numPlayersDowned"
		} )
	end )
	Life5:linkToElementModel( self, nil, false, function ( model )
		Life5:setModel( model, f1_arg1 )
	end )
	self:addElement( Life5 )
	self.Life5 = Life5
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", self.__onClose )
	
	if PostLoadFunc then
		PostLoadFunc( self, f1_arg1, f1_arg0 )
	end
	
	return self
end

CoD.ScoreInfo_TicketSystemLifeList.__onClose = function ( f41_arg0 )
	f41_arg0.Life1:close()
	f41_arg0.Life2:close()
	f41_arg0.Life3:close()
	f41_arg0.Life4:close()
	f41_arg0.Life5:close()
end

