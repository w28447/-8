require( "lua/lobby/common/lobbycore" )
require( "lua/lobby/process/lobbyprocessnavigate" )
require( "lua/lobby/process/lobbyprocess" )
require( "lua/shared/lobbydata" )

Lobby.CharacterSelection = {}
Lobby.CharacterSelection.InvalidCharacterIndex = 0
Lobby.CharacterSelection.InvalidCharacterData = {
	characterIndex = Lobby.CharacterSelection.InvalidCharacterIndex
}
Lobby.CharacterSelection.SelectedCharacterStats = {
	[Enum.eModes.mode_zombies] = {
		selectedIndex = "selectedcharacterindex_zm",
		characterArray = "zmcharacters"
	},
	[Enum.eModes.mode_warzone] = {
		selectedIndex = "selectedcharacterindex_wz",
		characterArray = "wzcharacters"
	}
}
Lobby.CharacterSelection.GetCurrentMap = function ()
	local f1_local0 = Engine[0xC53F8D38DF9042B]( Engine[0xE67E7253CC272C9]() )
	local f1_local1 = LuaUtils.GetMapsTable()
	return f1_local1[f1_local0]
end

Lobby.CharacterSelection.CharacterIsValid = function ( f2_arg0, f2_arg1 )
	if f2_arg1 == Lobby.CharacterSelection.InvalidCharacterIndex then
		return false
	end
	local f2_local0 = Engine.CurrentSessionMode()
	if f2_local0 == Enum.eModes.mode_zombies then
		local f2_local1 = Lobby.CharacterSelection.GetMaxUniqueRolesPerTeam( f2_arg0, f2_arg1 )
		local f2_local2 = Engine[0x5A93802BE50A531]( Enum.LobbyModule[0x98EA1BB7164D103], f2_arg0 )
		local f2_local3 = Enum.LobbyModule[0x98EA1BB7164D103]
		local f2_local4 = Engine[0x755D55B3813D249]( f2_local3, Engine[0xC3DF042E7492B66]( f2_local3 ) )
		for f2_local8, f2_local9 in ipairs( f2_local4.sessionClients ) do
			if f2_local9.clientNum ~= f2_arg0 and f2_local9.characterDraft.characterIndex == f2_arg1 then
				f2_local1 = f2_local1 - 1
			end
		end
		if f2_local1 <= 0 then
			return false
		end
		f2_local5 = Lobby.CharacterSelection.GetCurrentMap()
		if not f2_local5 then
			return true
		elseif f2_local5 and f2_local5.zmCharacters then
			f2_local6 = {}
			for f2_local11, f2_local12 in ipairs( f2_local4.sessionClients ) do
				if f2_local12.clientNum ~= f2_arg0 then
					local f2_local10 = Engine[0xB678B832BC9DC0]( f2_local0, f2_local12.characterDraft.characterIndex )
					f2_local6[f2_local10.globalcharacterindex] = true
				end
			end
			for f2_local11, f2_local12 in pairs( f2_local5.zmCharacters ) do
				local f2_local10 = Engine[0xB678B832BC9DC0]( f2_local0, f2_local12.characterIndex )
				if f2_local6[f2_local10.globalcharacterindex] == nil and f2_local12.characterIndex == f2_arg1 then
					return true
				end
			end
		end
		return false
	end
	return true
end

Lobby.CharacterSelection.GetDefaultCharacter = function ( f3_arg0 )
	local f3_local0 = Engine.CurrentSessionMode()
	if f3_local0 ~= Enum.eModes.mode_warzone then
		return nil
	elseif f3_arg0 < 0 then
		return nil
	end
	local f3_local1 = Engine.GetHeroList( f3_local0 )
	local f3_local2 = Engine[0xFC41172469DB251]( f3_arg0 )
	local f3_local3 = f3_local2[0xA8BD5071BCB463C]:get()
	local f3_local4 = {}
	for f3_local8, f3_local9 in ipairs( f3_local1 ) do
		local f3_local10 = f3_local9.bodyIndex
		local f3_local11 = Engine[0xB678B832BC9DC0]( f3_local0, f3_local10 )
		if f3_local11[0xC9366DE09ED7379] == 1 then
			if f3_local10 == f3_local3 then
				break
			end
			table.insert( f3_local4, f3_local10 )
		end
		if f3_local10 == f3_local3 then
			f3_local3 = nil
		end
	end
	f3_local5 = f3_local3
	if not f3_local5 or f3_local5 == Lobby.CharacterSelection.InvalidCharacterIndex then
		f3_local5 = f3_local4[math.random( #f3_local4 )]
	end
	return {
		characterIndex = f3_local5
	}
end

Lobby.CharacterSelection.InitializeLobby = function ()
	if Engine.IsInGame() or Engine.CurrentSessionMode() ~= Enum.eModes.mode_zombies then
		return 
	end
	local f4_local0 = Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] )
	local f4_local1 = Engine[0x755D55B3813D249]( Enum.LobbyModule[0x98EA1BB7164D103], f4_local0 )
	for f4_local5, f4_local6 in ipairs( f4_local1.sessionClients ) do
		local f4_local7 = Lobby.CharacterSelection.GetClientNumForXUID( f4_local6.xuid )
		local f4_local8 = Lobby.CharacterSelection.GetSelectedCharacter( f4_local6.xuid )
		if f4_local7 ~= LuaDefine.INVALID_CLIENT_INDEX and not Lobby.CharacterSelection.CharacterIsValid( f4_local7, f4_local8.characterIndex ) then
			Engine[0x4558F0683EF31FC]( f4_local0, f4_local6.xuid, Lobby.CharacterSelection.GetRandomUnpickedCharacter( f4_local7 ), 0 )
		end
	end
end

Lobby.CharacterSelection.OnSetGametype = function ( f5_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		Lobby.CharacterSelection.InitializeLobby()
	end
end

Lobby.CharacterSelection.OnClientAdded = function ( f6_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		Lobby.CharacterSelection.InitializeLobby()
	end
end

Lobby.CharacterSelection.OnChangeMap = function ( f7_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		Lobby.CharacterSelection.InitializeLobby()
	end
end

Lobby.CharacterSelection.OnPrivateLobbyServerDataUpdate = function ( f8_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		Lobby.CharacterSelection.InitializeLobby()
	end
end

Lobby.CharacterSelection.OnGameLobbyGameServerDataUpdate = function ( f9_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		Lobby.CharacterSelection.InitializeLobby()
	end
end

Lobby.CharacterSelection.GetClientNumForXUID = function ( f10_arg0 )
	local f10_local0 = Enum.LobbyModule[0x98EA1BB7164D103]
	return Engine[0xEFBAAD12776201D]( f10_local0, Engine[0xC3DF042E7492B66]( f10_local0 ), f10_arg0 )
end

Lobby.CharacterSelection.GetSelectedCharacter = function ( f11_arg0 )
	local f11_local0 = Engine[0x755D55B3813D249]( Enum.LobbyModule[0x98EA1BB7164D103], Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] ) )
	for f11_local4, f11_local5 in pairs( f11_local0.sessionClients ) do
		if f11_local5.xuid == f11_arg0 then
			return f11_local5.characterDraft
		end
	end
	return Lobby.CharacterSelection.InvalidCharacterData
end

Lobby.CharacterSelection.GetMaxUniqueRolesPerTeam = function ( f12_arg0, f12_arg1 )
	local f12_local0 = Engine.GetGametypeSettings()
	if f12_local0 == nil or f12_arg1 == nil or f12_local0.maxUniqueRolesPerTeam == nil or f12_local0.maxUniqueRolesPerTeam[f12_arg1] == nil then
		return 0
	else
		local f12_local1 = Engine[0x5A93802BE50A531]( Enum.LobbyModule[0x98EA1BB7164D103], f12_arg0 )
		local f12_local2 = Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] )
		return f12_local0.maxUniqueRolesPerTeam[f12_arg1]:get()
	end
end

Lobby.CharacterSelection.OnGameLobbyClientCharacterChanged = function ( f13_arg0 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f13_arg0.controller ), "PositionDraft.CloseCharacterSelection" ) )
	local f13_local0 = Engine.GetXUID64( f13_arg0.controller )
	if f13_arg0.xuid == f13_local0 and f13_arg0.newCharacter ~= f13_arg0.oldCharacter then
		local f13_local1 = Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0xC46B73E8E18BA2] )
		local f13_local2 = Lobby.CharacterSelection.GetSelectedCharacter( f13_local0 )
		Engine[0x11D727BB83FE0C5]( f13_arg0.controller, f13_local1, f13_arg0.newCharacter )
	end
end

Lobby.CharacterSelection.OnClientSelectionReceived = function ( f14_arg0 )
	if f14_arg0.forced then
		return 
	end
	local f14_local0 = Engine.CurrentSessionMode()
	if f14_local0 == Enum.eModes.mode_warzone then
		Engine[0x4558F0683EF31FC]( Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] ), f14_arg0.xuid, f14_arg0.characterData, 0 )
	elseif f14_local0 == Enum.eModes.mode_zombies then
		local f14_local1 = Lobby.CharacterSelection.GetClientNumForXUID( f14_arg0.xuid )
		local f14_local2 = Lobby.CharacterSelection.GetSelectedCharacter( f14_arg0.xuid )
		if f14_local1 ~= LuaDefine.INVALID_CLIENT_INDEX and Lobby.CharacterSelection.CharacterIsValid( f14_local1, f14_arg0.characterData.characterIndex ) then
			Engine[0x4558F0683EF31FC]( Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] ), f14_arg0.xuid, f14_arg0.characterData, 0 )
		end
	end
end

Lobby.CharacterSelection.GetRandomUnpickedCharacter = function ( f15_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.mode_invalid then
		return Lobby.CharacterSelection.InvalidCharacterData
	elseif Engine.CurrentSessionMode() == Enum.eModes.mode_zombies then
		local f15_local0 = Lobby.CharacterSelection.GetCurrentMap()
		if f15_local0 and f15_local0.zmCharacters then
			local f15_local1 = {}
			for f15_local5, f15_local6 in pairs( f15_local0.zmCharacters ) do
				if Lobby.CharacterSelection.CharacterIsValid( f15_arg0, f15_local6.characterIndex ) then
					table.insert( f15_local1, {
						characterIndex = f15_local6.characterIndex
					} )
				end
			end
			if #f15_local1 > 0 then
				return f15_local1[math.random( 1, #f15_local1 )]
			end
		end
		return Lobby.CharacterSelection.InvalidCharacterData
	else
		return Lobby.CharacterSelection.InvalidCharacterData
	end
end

Lobby.CharacterSelection.GetValidWarzoneCharacterSelections = function ( f16_arg0 )
	local f16_local0 = {}
	local f16_local1 = Enum.eModes.mode_warzone
	for f16_local6, f16_local7 in ipairs( Engine.GetHeroList( f16_local1 ) ) do
		if f16_local7.disabled == false then
			local f16_local5 = Engine[0xB678B832BC9DC0]( f16_local1, f16_local7.bodyIndex )
			if f16_local5 and f16_local5[0xD3C54AD4040DDBE] == 1 and (LuaUtils.IsRoleUnlocked( f16_arg0, f16_local1, f16_local7.bodyIndex ) or f16_local5[0xC9366DE09ED7379] == 1) then
				table.insert( f16_local0, f16_local7.bodyIndex )
			end
		end
	end
	return f16_local0
end

Lobby.CharacterSelection.GetDefaultWarzoneCharacters = function ( f17_arg0 )
	local f17_local0 = {}
	local f17_local1 = Enum.eModes.mode_warzone
	for f17_local6, f17_local7 in ipairs( Engine.GetHeroList( f17_local1 ) ) do
		if f17_local7.disabled == false then
			local f17_local5 = Engine[0xB678B832BC9DC0]( f17_local1, f17_local7.bodyIndex )
			if f17_local5 and f17_local5[0xD3C54AD4040DDBE] == 1 and f17_local5[0xC9366DE09ED7379] == 1 then
				table.insert( f17_local0, f17_local7.bodyIndex )
			end
		end
	end
	return f17_local0
end

