require( "lua/shared/luareadonlytables" )

local f0_local0 = {
	MaxAllocation = 10,
	PrimaryGunfighterWildcards = {
		{
			refHash = "bonuscard_primary_gunfighter"
		},
		{
			refHash = "bonuscard_primary_gunfighter_2"
		},
		{
			refHash = "bonuscard_primary_gunfighter_3"
		}
	},
	SecondaryGunfighterWildcards = {
		{
			refHash = "bonuscard_secondary_gunfighter"
		},
		{
			refHash = "bonuscard_secondary_gunfighter_2"
		},
		{
			refHash = "bonuscard_secondary_gunfighter_3"
		}
	},
	OperatorModWildcards = {
		primary = {
			refHash = "bonuscard_primary_operator_mod"
		},
		secondary = {
			refHash = "bonuscard_secondary_operator_mod"
		}
	},
	loadoutSlotNamesZM = {
		{
			name = "primary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "secondary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "primarygrenade",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "herogadget",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "talisman1",
			statIndexOffset = Enum[0x6EB546760F890D2][0x5544C104CD15F10]
		},
		{
			name = "specialty1",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "specialty2",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "specialty3",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "specialty4",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "specialty5",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "specialty6",
			statIndexOffset = Enum[0x6EB546760F890D2][0x9AF82A21BAD026D]
		},
		{
			name = "equippedbubblegumpack",
			statIndexOffset = Enum[0x6EB546760F890D2][0x48CD0338EE0B3AE]
		}
	},
	loadoutSlotNamesMP = {
		{
			name = "primary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "secondary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "primarygrenade",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "primarygrenadecount",
			statIndexOffset = Enum[0x6EB546760F890D2][0x3057ABF96AF8289],
			quantityType = true
		},
		{
			name = "tacticalgear",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.1",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.2",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.3",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.4",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.5",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "talent.6",
			statIndexOffset = Enum[0x6EB546760F890D2][0x8EA6ADA81FD4511]
		},
		{
			name = "bonuscard.1",
			statIndexOffset = Enum[0x6EB546760F890D2][0x1A949B83CC070B0]
		},
		{
			name = "bonuscard.2",
			statIndexOffset = Enum[0x6EB546760F890D2][0x1A949B83CC070B0]
		},
		{
			name = "bonuscard.3",
			statIndexOffset = Enum[0x6EB546760F890D2][0x1A949B83CC070B0]
		}
	},
	loadoutSlotNamesCP = {
		{
			name = "primary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "secondary",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "primarygrenade",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		},
		{
			name = "herogadget",
			statIndexOffset = Enum[0x6EB546760F890D2][0x569E84652131CD7]
		}
	},
	loadoutSlotNames = {
		[Enum.eModes.mode_zombies] = f0_local0.loadoutSlotNamesZM,
		[Enum.eModes.mode_multiplayer] = f0_local0.loadoutSlotNamesMP,
		[Enum.eModes.mode_campaign] = f0_local0.loadoutSlotNamesCP,
		[Enum.eModes.mode_warzone] = f0_local0.loadoutSlotNamesMP
	},
	characterCustomizationRegions = {
		{
			name = "palettes",
			stat = "palette",
			type = Enum.CharacterItemType[0x922FE5C41D9EE8B],
			displayName = "heroes/outfit"
		},
		{
			name = "warPaints",
			stat = "war_paint",
			type = Enum.CharacterItemType[0x8E3A65D78229DC1],
			displayName = "heroes/war_paint",
			requiresBreadcrumb = true,
			usedForPersonalizationPrompt = true
		},
		{
			name = "decals",
			stat = "decals",
			type = Enum.CharacterItemType[0x7852FCB3BFCC8D1],
			displayName = "heroes/decal",
			requiresBreadcrumb = true
		},
		{
			name = "arms",
			stat = "arms",
			type = Enum.CharacterItemType[0x41B42F0A58AC50F],
			displayName = "heroes/arms"
		},
		{
			name = "heads",
			stat = "head",
			type = Enum.CharacterItemType[0x7AD40A4111A72FE],
			displayName = "heroes/head"
		},
		{
			name = "headgears",
			stat = "headgear",
			type = Enum.CharacterItemType[0xFF8573E011622F4],
			displayName = "heroes/head_gear"
		},
		{
			name = "legs",
			stat = "legs",
			type = Enum.CharacterItemType[0x83CBB806B732B11],
			displayName = "heroes/legs"
		},
		{
			name = "torsos",
			stat = "torso",
			type = Enum.CharacterItemType[0x9DDCEC39BA98B97],
			displayName = "heroes/torso"
		}
	},
	ArenaHiddenPositionRoles = {
		prt_mp_outrider = true,
		prt_mp_engineer = true,
		prt_mp_trapper = true,
		prt_mp_spectre = true,
		prt_mp_swatpolice = true,
		prt_mp_reaper = true
	},
	CreateList = function ( f1_arg0, f1_arg1, f1_arg2 )
		local f1_local0 = {}
		for f1_local1 = f1_arg1, f1_arg2, 1 do
			table.insert( f1_local0, f1_arg0 .. f1_local1 )
		end
		return f1_local0
	end,
	MaxBonusCards = 3,
	BonuscardSlotNameList = f0_local0.CreateList( "bonuscard.", 1, f0_local0.MaxBonusCards ),
	GetUnlockableItemTable = function ()
		if f0_local0.UnlockableItemsTable == nil then
			f0_local0.UnlockableItemsTable = Engine[0x18492CF2CF50EFD]()
		end
		return f0_local0.UnlockableItemsTable
	end,
	SortUnlockableItemsBySortIndex = function ( f3_arg0, f3_arg1 )
		if f3_arg1 == Enum.eModes.mode_zombies then
			table.sort( f3_arg0, function ( f4_arg0, f4_arg1 )
				return f4_arg0[0xB1CB62B2AF54BFE] < f4_arg1[0xB1CB62B2AF54BFE]
			end )
		else
			table.sort( f3_arg0, function ( f5_arg0, f5_arg1 )
				return f5_arg0.sortindex < f5_arg1.sortindex
			end )
		end
		return f3_arg0
	end,
	GetUnlockableItemsForLoadoutSlot = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		local f6_local0 = {}
		for f6_local5, f6_local6 in pairs( CoDLoadoutsShared.GetUnlockableItemTable() ) do
			if CoDShared.IsBitSet( f6_local6.modes, f6_arg0 ) and LUI.startswith( f6_local6.loadoutSlot, f6_arg1 ) and f6_local6[0x32A46624FFC3379] ~= 1 and not CoD.CACUtility.DvarHideUnlockableItem( f6_local6.nameHash, f6_arg0 ) then
				if f6_arg2 and f6_arg3 then
					local f6_local4 = CoD.BlackMarketTableUtility.LootInfoLookup( f6_arg2, f6_local6.nameHash )
					if not f6_local4 or not f6_local4.isLoot or f6_local4.available then
						table.insert( f6_local0, f6_local6 )
					end
				end
				table.insert( f6_local0, f6_local6 )
			end
		end
		return CoDLoadoutsShared.SortUnlockableItemsBySortIndex( f6_local0, f6_arg0 )
	end,
	GetStatIndexOffsetForLoadoutSlot = function ( f7_arg0, f7_arg1 )
		if f7_arg0 ~= nil then
			for f7_local3, f7_local4 in pairs( CoDLoadoutsShared.loadoutSlotNames[f7_arg1] ) do
				if LUI.startswith( f7_local4.name, f7_arg0 ) then
					return f7_local4.statIndexOffset
				end
			end
		end
		return Enum[0x6EB546760F890D2][0x3057ABF96AF8289]
	end,
	IsBonuscardEquippedToStats = function ( f8_arg0, f8_arg1, f8_arg2 )
		if f8_arg0 then
			for f8_local6, f8_local7 in ipairs( CoDLoadoutsShared.BonuscardSlotNameList ) do
				local f8_local8 = LUI.splitString( f8_local7, "." )
				for f8_local3, f8_local4 in DDLUtils.ipairs( f8_arg0[f8_local8[1]] ) do
					if Engine[0xB98952F69D937F9]( f8_local4:get(), Enum[0x6EB546760F890D2][0x1A949B83CC070B0], f8_arg2 ) == f8_arg1 then
						return true
					end
				end
			end
		end
		return false
	end,
	IsOperatorModBonuscardEquippedToStats = function ( f9_arg0, f9_arg1, f9_arg2 )
		local f9_local0 = CoDLoadoutsShared.OperatorModWildcards[f9_arg1].refHash
		if f9_local0 then
			return CoDLoadoutsShared.IsBonuscardEquippedToStats( f9_arg0, f9_local0, f9_arg2 )
		else
			return false
		end
	end,
	GetSpecialIssueEquipmentItemIndex = function ()
		if f0_local0.SpecialIssueItemIndex == nil or f0_local0.SpecialIssueItemIndex == CoDShared.EmptyItemIndex then
			f0_local0.SpecialIssueItemIndex = Engine[0xD97229B24C685D5]( CoDShared.DefaultSpecialistEquipment, Enum.eModes.mode_multiplayer )
		end
		return f0_local0.SpecialIssueItemIndex
	end,
	[0xF38B8964D4F989C] = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
		local f11_local0 = function ( f12_arg0 )
			local f12_local0 = 0
			for f12_local1 = 0, 2, 1 do
				local f12_local4 = Engine[0xB98952F69D937F9]( f11_arg1.bonuscard[f12_local1]:get(), Enum[0x6EB546760F890D2][0x1A949B83CC070B0], f11_arg3 )
				for f12_local8, f12_local9 in ipairs( f12_arg0 ) do
					if f12_local9.refHash == f12_local4 then
						f12_local0 = f12_local0 + 1
					end
				end
			end
			return f12_local0
		end
		
		local f11_local1 = 0
		if f11_arg2 == "primary" then
			f11_local1 = f11_local0( CoDLoadoutsShared.PrimaryGunfighterWildcards )
		elseif f11_arg2 == "secondary" then
			f11_local1 = f11_local0( CoDLoadoutsShared.SecondaryGunfighterWildcards )
		end
		if CoDLoadoutsShared.IsOperatorModBonuscardEquippedToStats( f11_arg1, f11_arg2, f11_arg3 ) then
			f11_local1 = f11_local1 + 1
		end
		local f11_local2 = 0
		for f11_local3 = 5, 3, -1 do
			if f11_arg1[f11_arg2].attachment[f11_local3]:get() ~= CoDShared.EmptyItemIndex then
				f11_local2 = f11_local2 + 1
			end
		end
		if f11_local1 < f11_local2 then
			if f11_arg4 then
				for f11_local3 = 5, 3, -1 do
					f11_arg1[f11_arg2].attachment[f11_local3]:set( CoDShared.EmptyItemIndex )
				end
			end
			CoDShared.ReportUser( f11_arg0, Engine.GetXUID64( f11_arg0 ), "cheater_extraattachment", 1, true )
		end
	end,
	[0x526F3E053898F12] = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		local f13_local0 = {
			bonuscard_perk_1_greed = 3,
			bonuscard_perk_2_greed = 4,
			bonuscard_perk_3_greed = 5
		}
		local f13_local1 = function ( f14_arg0 )
			local f14_local0 = Engine[0xD97229B24C685D5]( f14_arg0 )
			for f14_local1 = 0, 2, 1 do
				if f13_arg1.bonuscard[f14_local1]:get() == f14_local0 then
					return true
				end
			end
			return false
		end
		
		for f13_local5, f13_local6 in pairs( f13_local0 ) do
			if not f13_local1( f13_local5 ) and f13_arg1.talent[f13_local6]:get() ~= CoDShared.EmptyItemIndex then
				CoDShared.ReportUser( f13_arg0, Engine.GetXUID64( f13_arg0 ), "cheater_greedbonuscard", 1, true )
				if f13_arg3 then
					f13_arg1.talent[f13_local6]:set( CoDShared.EmptyItemIndex )
				end
			end
		end
	end,
	[0x9CA7AE60A79C317] = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		local f15_local0 = {
			{
				bonuscardRefHash = "bonuscard_perk_1_gluttony",
				slotName = "talent1",
				slotsToValidate = {
					1,
					2
				}
			},
			{
				bonuscardRefHash = "bonuscard_perk_2_gluttony",
				slotName = "talent2",
				slotsToValidate = {
					0,
					2
				}
			},
			{
				bonuscardRefHash = "bonuscard_perk_3_gluttony",
				slotName = "talent3",
				slotsToValidate = {
					0,
					1
				}
			}
		}
		local f15_local1 = function ( f16_arg0 )
			local f16_local0 = Engine[0xD97229B24C685D5]( f16_arg0 )
			for f16_local1 = 0, 2, 1 do
				if f15_arg1.bonuscard[f16_local1]:get() == f16_local0 then
					return true
				end
			end
			return false
		end
		
		for f15_local18, f15_local19 in ipairs( f15_local0 ) do
			local f15_local20 = f15_local19.bonuscardRefHash
			local f15_local21 = f15_local19.slotName
			local f15_local22 = f15_local19.slotsToValidate
			if not f15_local1( f15_local20 ) then
				local f15_local5 = CoDLoadoutsShared.GetUnlockableItemsForLoadoutSlot( f15_arg2, f15_local21 )
				for f15_local15, f15_local16 in ipairs( f15_local22 ) do
					local f15_local17 = f15_arg1.talent[f15_local16]:get()
					if f15_local17 ~= CoDShared.EmptyItemIndex then
						local f15_local9 = true
						for f15_local13, f15_local14 in ipairs( f15_local5 ) do
							if f15_local17 == f15_local14.itemIndex then
								f15_local9 = false
							end
						end
						if not f15_local9 then
							CoDShared.ReportUser( f15_arg0, Engine.GetXUID64( f15_arg0 ), "cheater_gluttonybonuscard", 1, true )
							if f15_arg3 then
								f15_arg1.talent[f15_local16]:set( CoDShared.EmptyItemIndex )
							end
						end
					end
				end
			end
		end
	end,
	[0x273D8BD6ADA6C7C] = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		local f17_local0 = function ( f18_arg0 )
			local f18_local0 = 0
			local f18_local1 = f17_arg1[f18_arg0].itemIndex:get()
			if f18_local1 ~= CoDShared.EmptyItemIndex then
				f18_local0 = f18_local0 + Engine.GetItemAllocationCost( f18_local1, CoDLoadoutsShared.GetStatIndexOffsetForLoadoutSlot( f18_arg0, f17_arg2 ), f17_arg2 )
				for f18_local2 = 0, 6, 1 do
					local f18_local5 = f17_arg1[f18_arg0].attachment[f18_local2]:get()
					if f18_local5 ~= CoDShared.EmptyItemIndex then
						f18_local0 = f18_local0 + Engine.GetAttachmentAllocationCost( Engine.GetItemAttachment( f18_local1, f18_local5, f17_arg2 ) )
					end
				end
			end
			return f18_local0
		end
		
		local f17_local1 = function ()
			local f19_local0 = 0
			local f19_local1 = f17_arg1.tacticalgear:get()
			if f19_local1 ~= CoDShared.EmptyItemIndex then
				f19_local0 = Engine.GetItemAllocationCost( f19_local1, CoDLoadoutsShared.GetStatIndexOffsetForLoadoutSlot( "tacticalgear", f17_arg2 ), f17_arg2 )
			end
			return f19_local0
		end
		
		local f17_local2 = function ()
			local f20_local0 = 0
			local f20_local1 = f17_arg1.primarygrenade:get()
			if f20_local1 ~= CoDShared.EmptyItemIndex then
				f20_local0 = Engine.GetItemAllocationCost( f20_local1, CoDLoadoutsShared.GetStatIndexOffsetForLoadoutSlot( "primarygrenade", f17_arg2 ), f17_arg2 ) + f17_arg1.primarygrenadecount:get()
			end
			return f20_local0
		end
		
		local f17_local3 = function ()
			local f21_local0 = 0
			for f21_local1 = 0, 5, 1 do
				local f21_local4 = f17_arg1.talent[f21_local1]:get()
				if f21_local4 ~= CoDShared.EmptyItemIndex then
					f21_local0 = f21_local0 + Engine.GetItemAllocationCost( f21_local4, CoDLoadoutsShared.GetStatIndexOffsetForLoadoutSlot( "talent", f17_arg2 ), f17_arg2 )
				end
			end
			return f21_local0
		end
		
		local f17_local4 = function ()
			local f22_local0 = 0
			for f22_local1 = 0, 2, 1 do
				local f22_local4 = f17_arg1.bonuscard[f22_local1]:get()
				if f22_local4 ~= CoDShared.EmptyItemIndex then
					f22_local0 = f22_local0 + Engine.GetItemAllocationCost( f22_local4, CoDLoadoutsShared.GetStatIndexOffsetForLoadoutSlot( "bonuscard", f17_arg2 ), f17_arg2 )
				end
			end
			return f22_local0
		end
		
		if f17_local0( "primary" ) + f17_local0( "secondary" ) + f17_local1() + f17_local2() + f17_local3() + f17_local4() > CoDLoadoutsShared.MaxAllocation then
			CoDShared.ReportUser( f17_arg0, Engine.GetXUID64( f17_arg0 ), "cheater_overallocation", 1, true )
			if f17_arg3 then
				LuaUtils.ClearDDLKeysAndArrays( f17_arg1, CoDShared.LoadoutSlotOrder[f17_arg2], CoDShared.EmptyItemIndex )
				f17_arg1.primarygrenade:set( CoDLoadoutsShared.GetSpecialIssueEquipmentItemIndex() )
			end
		end
	end,
	[0x59EDDE47AB63CA1] = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		for f23_local18, f23_local19 in ipairs( {
			"primary",
			"secondary"
		} ) do
			local f23_local20 = f23_arg1[f23_local19]
			local f23_local21 = f23_local20.itemindex:get()
			local f23_local22 = f23_local20.camoindex:get()
			if f23_local22 ~= 0 then
				local f23_local3 = CoD.WeaponOptionsUtility.GetCamoWeaponOptionIndexFromCamoOptionsIndex( f23_local22 )
				local f23_local4 = Engine[0xF1FD722970FDBA3]( f23_arg0, f23_local21, f23_local3, f23_arg2 )
				local f23_local5 = CoD.WeaponOptionsUtility.IsCamoWeaponOptionIndexActiveCamo( f23_local3 )
				local f23_local6 = false
				local f23_local7 = false
				local f23_local8 = Engine.TableLookup( CoD.CACUtility.CamoOptionsTable, Enum[0x5DD5CC8AEA7314B][0xB0DA2DF6A22B400], Enum[0x5DD5CC8AEA7314B][0xA6342D60A0D5AAE], f23_local22 )
				if f23_local8 then
					local f23_local9 = Engine[0xE00B2F29271C60B]( f23_local8 )
					if f23_local9 then
						local f23_local10 = CoD.CACUtility.GetUnlockableItemInfoField( f23_local21, f23_arg2, "nameHash" )
						local f23_local11 = f23_local9.stages[1][0xEB90A3D94D23B68]
						local f23_local12
						if f23_local11 then
							f23_local12 = CoD.WeaponOptionsUtility.AlternateCamoLootIDLookup[f23_local11]
							if not f23_local12 then
							
							else
								local f23_local13 = CoD.BlackMarketTableUtility.LootInfoLookup( f23_arg0, f23_local12, nil, {
									weaponRef = f23_local10
								} )
								f23_local6 = f23_local13.isLoot and f23_local13 and f23_local13.owned ~= true
								local f23_local14 = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e[0x9A2FFE632B9ED93], Enum.attachmentTableColumn_e[0x419575E672F6FA2], f23_local11 )
								if f23_local14 and f23_local14 ~= "" and not IsBooleanDvarSet( "ui_allowReactiveOnAnyWeapon" ) then
									local f23_local15 = Engine[0xB98952F69D937F9]( f23_local21, Enum[0x6EB546760F890D2][0x569E84652131CD7], f23_arg2 )
									local f23_local16 = CoD.WeaponOptionsUtility.IsGoldCamoLockedForWeapon( f23_arg0, f23_local21, f23_arg2 )
									local f23_local17 = f23_local15
									if f23_local15 ~= f23_local14 then
										f23_local7 = f23_local16
									else
										f23_local7 = false
									end
								end
							end
						end
						f23_local12 = f23_local11
					end
				end
				if not (not f23_local4 or f23_local5) or f23_local6 or f23_local7 then
					if f23_arg3 then
						f23_local20.camoindex:set( 0 )
					end
					CoDShared.ReportUser( f23_arg0, Engine.GetXUID64( f23_arg0 ), "cheater_invalidcamo", 1, true )
				end
			end
		end
	end,
	[0x1040083716E3993] = function ( f24_arg0 )
		local f24_local0 = {}
		local f24_local1 = Engine[0xA7E3CD65E63086F]( "weaponcharm_list" )
		if f24_local1 then
			for f24_local7, f24_local8 in ipairs( f24_local1 ) do
				local f24_local5 = false
				local f24_local6 = false
				if f24_local8.lootid then
					f24_local5, f24_local6 = CoDShared.IsLootItemOwnedByNameSimple( f24_arg0, f24_local8.lootid )
				end
				if (not f24_local5 or f24_local6) and (not f24_local8[0x562938AF86028A0] or Engine.HasEntitlement( f24_arg0, f24_local8[0x562938AF86028A0] )) then
					table.insert( f24_local0, f24_local7 - 1 )
				end
			end
		end
		return f24_local0
	end,
	[0xF3A3045A9BEB31] = function ( f25_arg0 )
		local f25_local0 = {}
		local f25_local1 = Engine[0xA7E3CD65E63086F]( "weapondeathfx_list" )
		if f25_local1 then
			for f25_local7, f25_local8 in ipairs( f25_local1 ) do
				local f25_local5 = false
				local f25_local6 = false
				if f25_local8.lootid then
					f25_local5, f25_local6 = CoDShared.IsLootItemOwnedByNameSimple( f25_arg0, f25_local8.lootid )
				end
				if (not f25_local5 or f25_local6) and (not f25_local8[0x562938AF86028A0] or Engine.HasEntitlement( f25_arg0, f25_local8[0x562938AF86028A0] )) then
					table.insert( f25_local0, f25_local7 - 1 )
				end
			end
		end
		return f25_local0
	end,
	[0x4F02E81CF4CC1BB] = function ( f26_arg0, f26_arg1 )
		local f26_local0 = Enum.eModes.mode_multiplayer
		local f26_local1 = Dvar[0xA3A4F1AC02F1439]:get()
		if f26_local1 then
			f26_local1 = tonumber( f26_local1 )
		end
		local f26_local2 = 0
		local f26_local3 = 0
		local f26_local4 = CoDLoadoutsShared[0x1040083716E3993]( f26_arg0 )
		local f26_local5 = CoDLoadoutsShared[0xF3A3045A9BEB31]( f26_arg0 )
		local f26_local6 = function ( f27_arg0, f27_arg1 )
			for f27_local3, f27_local4 in ipairs( f27_arg1 ) do
				if f27_local4 == f27_arg0 then
					return true
				end
			end
			return false
		end
		
		local f26_local7 = CoD.CACUtility.GetCustomClassCount( f26_arg0 )
		for f26_local8 = 1, f26_local7, 1 do
			local f26_local11 = Engine[0xED9C4D9D6233895]( f26_arg0, f26_local8 - 1, f26_local0 )
			if f26_local11 and f26_local1 and f26_local1 > 0 then
				local f26_local12 = {}
				for f26_local16, f26_local17 in DDLUtils.ipairs( f26_local11.talent ) do
					local f26_local18 = f26_local17:get()
					if f26_local18 ~= 0 then
						if f26_local12[f26_local18] then
							f26_local2 = f26_local2 + 1
							if f26_local1 ~= 3 then
								f26_local17:set( 0 )
							end
						end
						f26_local12[f26_local18] = 1
					end
				end
				for f26_local16, f26_local17 in ipairs( {
					"primary",
					"secondary"
				} ) do
					local f26_local18 = {}
					for f26_local20, f26_local21 in DDLUtils.ipairs( f26_local11[f26_local17].attachment ) do
						if f26_local20 > 0 then
							local f26_local19 = f26_local21:get()
							if f26_local19 ~= 0 then
								if f26_local18[f26_local19] then
									f26_local3 = f26_local3 + 1
									if f26_local1 ~= 3 then
										f26_local21:set( 0 )
									end
								end
								f26_local18[f26_local19] = 1
							end
						end
					end
					if f26_local11[f26_local17].charmindex and f26_local11[f26_local17].charmindex:get() ~= 0 and not f26_local6( f26_local11[f26_local17].charmindex:get(), f26_local4 ) then
						f26_local11[f26_local17].charmindex:set( 0 )
					end
					if f26_local11[f26_local17].deathfxindex and f26_local11[f26_local17].deathfxindex:get() ~= 0 and not f26_local6( f26_local11[f26_local17].deathfxindex:get(), f26_local5 ) then
						f26_local11[f26_local17].deathfxindex:set( 0 )
					end
				end
				f26_local13 = f26_local1 ~= 3
				CoDLoadoutsShared[0xF38B8964D4F989C]( f26_arg0, f26_local11, "primary", f26_local0, f26_local13 )
				CoDLoadoutsShared[0xF38B8964D4F989C]( f26_arg0, f26_local11, "secondary", f26_local0, f26_local13 )
				CoDLoadoutsShared[0x526F3E053898F12]( f26_arg0, f26_local11, f26_local0, f26_local13 )
				CoDLoadoutsShared[0x9CA7AE60A79C317]( f26_arg0, f26_local11, f26_local0, f26_local13 )
				if f26_arg1 then
					CoDLoadoutsShared[0x59EDDE47AB63CA1]( f26_arg0, f26_local11, f26_local0, f26_local13 )
					CoDLoadoutsShared[0x273D8BD6ADA6C7C]( f26_arg0, f26_local11, f26_local0, f26_local13 )
				end
			end
		end
		if f26_local2 > 0 and f26_local1 > 1 then
			CoDShared.ReportUser( f26_arg0, Engine.GetXUID64( f26_arg0 ), "cheater_multiperk", 1, true )
		end
		if f26_local3 > 0 and f26_local1 > 1 then
			CoDShared.ReportUser( f26_arg0, Engine.GetXUID64( f26_arg0 ), "cheater_multiattachment", 1, true )
		end
	end,
	[0x7243F374ADEF72D] = function ( f28_arg0, f28_arg1, f28_arg2 )
		local f28_local0 = Engine.StorageGetBuffer( f28_arg0, f28_arg1 )
		if not f28_local0 then
			return 
		end
		local f28_local1 = f28_local0.cacLoadouts
		if f28_local1 then
			local f28_local2 = Enum.eModes.mode_multiplayer
			local f28_local3 = Engine[0xE00B2F29271C60B]( f28_arg2 )
			if not f28_local3 then
				return 
			end
			for f28_local4 = Enum[0x33AC0FF9A1537DE][0xB269FFE65DEF21C] + 1, Enum[0x33AC0FF9A1537DE][0x3618B16E81F1FBD], 1 do
				CoDShared.SetCustomDefaultLoadout( f28_local1, f28_local4, f28_local3, f28_local2, nil )
			end
			if Engine[0x3091707D0144833]() then
				for f28_local4 = Enum[0x33AC0FF9A1537DE][0xFEA2C4AFF9A65EC] + 1, Enum[0x33AC0FF9A1537DE][0x46004DB4E087522] + 1, 1 do
					CoDShared.SetDefaultLoadout( f28_local1, f28_local4, f28_local3, f28_local2, nil )
				end
			end
			CoDShared.SetDefaultGlobalLoadout( f28_local1, f28_local3, f28_local2 )
			Engine[0xE6C09FDF6C8D188]( f28_arg0, f28_local2 )
		end
	end,
	CopyClassLoadout = function ( f29_arg0, f29_arg1, f29_arg2 )
		if f29_arg2 ~= Enum.eModes.mode_multiplayer then
			return 
		end
		local f29_local0 = f29_arg0.primary
		local f29_local1 = f29_arg1.primary
		local f29_local2 = f29_local0.itemIndex:get()
		local f29_local3 = f29_local1.itemIndex:get()
		f29_local0.itemIndex:set( f29_local1.itemIndex:get() )
		if f29_local2 ~= f29_local3 then
			f29_local0.camoIndex:set( 0 )
			f29_local0.charmIndex:set( 0 )
			f29_local0.deathFxIndex:set( 0 )
			f29_local0.reticleIndex:set( 0 )
			f29_local0.paintjobSlot:set( 255 )
		end
		f29_local0.weaponModelSlot:set( f29_local1.weaponModelSlot:get() )
		for f29_local4 = 0, #f29_local0.attachment - 1, 1 do
			f29_local0.attachment[f29_local4]:set( f29_local1.attachment[f29_local4]:get() )
		end
		local f29_local4 = f29_arg0.secondary
		local f29_local5 = f29_arg1.secondary
		local f29_local6 = f29_local4.itemIndex:get()
		local f29_local7 = f29_local5.itemIndex:get()
		f29_local4.itemIndex:set( f29_local5.itemIndex:get() )
		if f29_local6 ~= f29_local7 then
			f29_local4.camoIndex:set( 0 )
			f29_local4.reticleIndex:set( 0 )
			f29_local4.charmIndex:set( 0 )
			f29_local4.deathFxIndex:set( 0 )
			f29_local4.paintjobSlot:set( 255 )
		end
		f29_local4.weaponModelSlot:set( f29_local5.weaponModelSlot:get() )
		for f29_local8 = 0, #f29_local4.attachment - 1, 1 do
			f29_local4.attachment[f29_local8]:set( f29_local5.attachment[f29_local8]:get() )
		end
		f29_arg0.primarygrenade:set( f29_arg1.primarygrenade:get() )
		f29_arg0.primarygrenadecount:set( f29_arg1.primarygrenadecount:get() )
		f29_arg0.tacticalgear:set( f29_arg1.tacticalgear:get() )
		for f29_local8 = 0, #f29_arg0.talent - 1, 1 do
			f29_arg0.talent[f29_local8]:set( f29_arg1.talent[f29_local8]:get() )
		end
		for f29_local8 = 0, #f29_arg0.bonuscard - 1, 1 do
			f29_arg0.bonuscard[f29_local8]:set( f29_arg1.bonuscard[f29_local8]:get() )
		end
	end
}
CoDLoadoutsShared = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
