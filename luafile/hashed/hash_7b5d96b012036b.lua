Lobby.JSON.CreateStartSearchParamDoc = function ( f1_arg0 )
	local f1_local0 = "Lobby.JSON.CreateStartSearchParamDoc"
	local f1_local1 = {}
	local f1_local2 = "2.0"
	local f1_local3 = Engine[0x5E804BED092329B]()
	local f1_local4 = Engine[0xB15BEE2BE53060A]()
	local f1_local5 = Engine[0x7B3B2B73B53EB34]()
	local f1_local6 = Dvar[0x1E20802F756EFAF]:exists()
	if f1_local6 then
		f1_local6 = Dvar[0x1E20802F756EFAF]:get()
	end
	local f1_local7 = {}
	local f1_local8, f1_local9 = nil
	if f1_local6 then
		local f1_local10 = Engine.GetGlobalModel()
		f1_local10 = f1_local10.lobbyRoot.searchPlaylistIDs
		if f1_local10 then
			local f1_local11 = f1_local10.count:get()
			for f1_local12 = 1, f1_local11, 1 do
				table.insert( f1_local7, Engine[0x3ACB99DBAD24D55]( f1_local10[f1_local12]:get() ) )
			end
			if #f1_local7 > 0 then
				f1_local5 = f1_local7[1].id
			end
		end
	end
	local f1_local10 = #f1_local7 > 1
	local f1_local11 = Engine[0x3ACB99DBAD24D55]( f1_local5 )
	local f1_local12 = f1_local11.minPlayersToCreate
	local f1_local13 = f1_local11.maxPlayers
	local f1_local14 = ""
	local f1_local15 = false
	local f1_local16 = 0
	local f1_local17 = Engine.CurrentSessionMode()
	local f1_local18 = false
	local f1_local19 = Engine[0xF75734A98C53D1B]( f1_local5 )
	if f1_local19 and f1_local19.use_skill and not f1_local10 then
		f1_local18 = true
	end
	if Dvar[0xE0FB96935DF872D]:exists() and Dvar[0xE0FB96935DF872D]:get() > 0 then
		f1_local16 = Dvar[0xE0FB96935DF872D]:get()
	end
	if Dvar[0xB0353CA54760727]:exists() and Dvar[0xB0353CA54760727]:get() > 0 and Dvar[0xB0353CA54760727]:get() <= #LuaEnum.NeedForDedicatedServerString then
		f1_local9 = Dvar[0xB0353CA54760727]:get()
	end
	local f1_local20 = LobbyData.GetCurrentMenuTarget()
	local f1_local21 = Engine[0x786FFC9E621CAB7]()
	Lobby.MatchmakingAsync.MatchmakingSearchSummaryLog.utc_timestamp_created = f1_local21
	Lobby.MatchmakingAsync.PartyToMatchSummary.utc_timestamp_created = f1_local21
	if f1_arg0 == nil and f1_local11.mainMode ~= f1_local20.mainmode then
		Lobby.JSON.ErrorWrite( nil, f1_local0, "Playlist entry mainMode and lobby mainMode Don't match!!" )
		return nil
	elseif f1_local20.mainmode == Enum.LobbyMainMode[0x79D01499920B292] or f1_local20.mainmode == Enum.LobbyMainMode[0x7B50049993542C0] then
		f1_local8 = 1
	elseif f1_local20.mainmode == Enum.LobbyMainMode[0x78C124999125C42] then
		f1_local8 = 1
		if Dvar[0xA546240BBE08638]:exists() and Dvar[0xA546240BBE08638]:get() then
			f1_local9 = LuaEnum.NeedForDedicatedServer.NOT_NEEDED
		end
		local f1_local22 = Engine[0xE00882E35AF63D2]( Enum.LobbyModule[0x98EA1BB7164D103], Enum.LobbyType[0xA1647599284110] )
		if f1_local22 ~= nil then
			f1_local15 = f1_local22.fillParty
		end
	end
	if LuaDefine.isPCClient and f1_local20.mainmode == Enum.LobbyMainMode[0x7E41449995CD57E] and Dvar[0x3617F20591CC64]:exists() and Dvar[0x3617F20591CC64]:get() then
		f1_local9 = LuaEnum.NeedForDedicatedServer.REQUIRED
	end
	if f1_local20.LobbyMode == Enum.LobbyMode[0xD42D003CEEA3F87] then
		if Dvar[0xAAD4C8A3747B359]:exists() and Dvar[0xAAD4C8A3747B359]:get() then
			f1_local9 = LuaEnum.NeedForDedicatedServer.NOT_NEEDED
		end
		if Dvar[0x781206C11C8B523]:exists() then
			f1_local17 = f1_local17 + Dvar[0x781206C11C8B523]:get()
		end
	end
	local f1_local22 = f1_local8
	if f1_local22 == nil then
		if f1_local13 > 18 then
			local f1_local23 = 1
		end
		f1_local22 = f1_local23 or 2
	end
	if f1_local9 == nil then
		local f1_local24 = f1_local11.searchType
	end
	if Dvar[0xE4D6FF240788F81]:exists() and Dvar[0xE4D6FF240788F81]:get() then
		f1_local14 = LuaDefine.T8_BUILD_NAME
		if LuaDefine.isPS4Client then
			f1_local14 = f1_local14 .. "-ps4"
		elseif LuaDefine.isXboxClient then
			f1_local14 = f1_local14 .. "-xb1"
		elseif LuaDefine.isPCClient then
			f1_local14 = f1_local14 .. "-pc"
		else
			error( "Unsupported platform" )
		end
		if f1_local20.mainmode == Enum.LobbyMainMode[0x78C124999125C42] then
			f1_local14 = f1_local14 .. "-wz"
			if Dvar[0xAFE8B91B7B953C3]:exists() then
				suffix = "100"
				f1_local14 = f1_local14 .. "-" .. suffix
			end
		elseif f1_local20.mainmode == Enum.LobbyMainMode[0x7E41449995CD57E] then
			f1_local14 = f1_local14 .. "-mp"
		end
	end
	Engine.PrintInfo( Enum[0x7A63DCD561B0FA8][0x8E4EED9A90F9B5E], f1_local0 .. "\n buildNameContext: " .. f1_local14 .. "\n" )
	local f1_local25 = ""
	if Dvar[0x5909CF2A6D2C500]:exists() and Dvar[0x5909CF2A6D2C500]:get() then
		f1_local25 = Lobby.MatchmakingAsync.GetFullBuildName() .. " - " .. f1_local14
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "fullBuildNameContext" ), f1_local25 )
	local f1_local26 = f1_local11.usedDLCMask
	local f1_local27 = false
	local f1_local28 = Engine[0x9882F293C327557]()
	local f1_local29 = Engine[0xA4245AC303B4CD5]()
	if f1_local29 == nil then
		return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to create JSON handle." )
	elseif f1_local29:beginWrite( "playerInfoDoc" ) == false then
		return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to create playerInfoDoc JSON." )
	end
	local f1_local30 = f1_local29:getRoot()
	if f1_local30 == nil then
		return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to get root of playerInfoDoc JSON." )
	end
	local f1_local31 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local30, "members" )
	local f1_local32 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local30, "tokens" )
	if f1_local31 == nil or f1_local32 == nil then
		return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to create arrays for 'members' or 'tokens' array field." )
	end
	local f1_local33 = Engine[0x755D55B3813D249]( Enum.LobbyModule[0x98EA1BB7164D103], Enum.LobbyType[0xA1647599284110] )
	local f1_local34 = {}
	for f1_local38, f1_local39 in ipairs( f1_local33.sessionClients ) do
		f1_local31:addUInt64( f1_local39.xuid )
		f1_local32:addUInt64( f1_local39.asyncMatchmakingToken )
		f1_local34[#f1_local34 + 1] = f1_local39.xuid
	end
	if f1_arg0 ~= nil then
		if f1_local30:setUInt64( "user_to_join", f1_arg0 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'user_to_join'.\n" )
		end
	else
		if f1_local6 then
			f1_local35 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local30, "playlist_config" )
			if f1_local35 == nil then
				return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create playlist_config array." )
			end
			for f1_local39, f1_local44 in ipairs( f1_local7 ) do
				local f1_local41 = f1_local8
				if f1_local41 == nil then
					if f1_local44.maxPlayers > 18 then
						local f1_local40 = 1
					end
					f1_local41 = f1_local40 or 2
				end
				if f1_local9 == nil and (f1_local44.searchType == LuaEnum.NeedForDedicatedServer.REQUIRED or f1_local44.searchType == LuaEnum.NeedForDedicatedServer.BEST_EFFORT and f1_local24 == LuaEnum.NeedForDedicatedServer.NOT_NEEDED) then
					local f1_local24 = f1_local44.searchType
				end
				f1_local26 = f1_local26 | f1_local44.usedDLCMask
				local f1_local42 = f1_local35:addField( LuaEnum.JSON_TYPE.JSON_OBJECT )
				if f1_local42 == nil then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to add field to playlist_config array." )
				end
				local f1_local43 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local42, "playlist_ids" )
				if f1_local43 == nil then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create playlist_ids array in playlist_config." )
				elseif f1_local43:addUInt( f1_local44.id ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to add id " .. f1_local44.id .. " to playlist_ids array." )
				elseif f1_local42:setUInt( "min_slots", f1_local44.minPlayersToCreate ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set min_slots to " .. f1_local44.minPlayersToCreate .. " in playlist_config." )
				elseif f1_local42:setUInt( "max_slots", f1_local44.maxPlayers ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set max_slots to " .. f1_local44.maxPlayers .. " in playlist_config." )
				elseif f1_local42:setUInt( "num_teams", f1_local41 ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set num_teams to " .. f1_local41 .. " in playlist_config." )
				end
			end
		end
		f1_local35 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "lobby_slots" )
		if f1_local35 == nil then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create Lobby_slots" )
		elseif f1_local35:setUInt( "max", f1_local13 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set lobby_slots.max" )
		elseif f1_local35:setUInt( "min", f1_local12 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set lobby_slots.max" )
		end
		f1_local36 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "dedicated_server" )
		if f1_local36 == nil then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create dedicated_server" )
		elseif f1_local36:setString( "request_level", LuaEnum.NeedForDedicatedServerString[f1_local24] ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set 'request_level'" )
		elseif f1_local36:setString( "build_name_context", f1_local14 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'build_name_context'." )
		end
		f1_local38 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "team_balance" )
		if f1_local38 == nil then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create team_balance" )
		elseif f1_local38:setUInt( "num_teams", f1_local22 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set 'num_teams'" )
		end
		f1_local39 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "ruleset_payload" )
		if f1_local39 == nil then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create ruleset_payload" )
		end
		local f1_local44 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local39, "filter" )
		if f1_local44 == nil then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create 'filter'" )
		elseif Dvar[0x4BAF85486280784]:get() == true or Dvar[0x17148A4FB179B6C]:get() == true then
			Dvar[0x4BAF85486280784]:set( false )
			if Dvar[0x17148A4FB179B6C]:get() == false then
				Dvar[0xA546240BBE08638]:set( false )
			end
			if f1_local39:setBool( "force_host_of_empty_new_lobby", true ) == false then
				return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set 'force_host_of_empty_new_lobby'" )
			end
		end
		if f1_local44:setString( "matchmaking_version", f1_local2 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to set 'matchmaking_version'" )
		elseif f1_local44:setUInt64( "netcode_version", f1_local3 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'netcode_version'." )
		elseif f1_local44:setUInt( "playlist_version", f1_local4 ) == false then
			return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'playlist_version'." )
		end
		local f1_local42 = f1_local44
		local f1_local41 = f1_local44.setUInt
		local f1_local43 = "playlist_id"
		local f1_local45
		if f1_local10 then
			f1_local45 = 0
			if not f1_local45 then
			
			else
				if f1_local41( f1_local42, f1_local43, f1_local45 ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'playlist_id'." )
				elseif LuaDefine.isPC and Dvar[0xC8DE5D729904677]:get() and f1_local44:setString( "online_matchmaking_restrict", Engine[0x9A70B14679D905C]() ) == false then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'bnet_region'." )
				end
				f1_local41 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local39, "playlist_map_packs" )
				if f1_local41 == nil then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'playlist_map_packs'." )
				end
				Engine.PrintInfo( Enum[0x7A63DCD561B0FA8][0x8E4EED9A90F9B5E], "Getting Table of mappacks in the Playlist:\n" )
				f1_local42 = {}
				Lobby.JSON.BuildMapPackFlagsTable( f1_local42, f1_local26 )
				for f1_local47, f1_local48 in ipairs( f1_local42 ) do
					if f1_local41:addString( f1_local48 ) == false then
						return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to add map( " .. f1_local48 .. " ) to 'playlist_map_packs' field." )
					end
				end
				for f1_local47, f1_local48 in ipairs( f1_local11.rules ) do
					if f1_local48.name == 0xE535D66F4F89AE5 then
						if #f1_local48.value > 0 then
							local f1_local49 = f1_local48.value
							local f1_local50 = Lobby.JSON.CreateArrayAndAddToLocation( f1_local29, f1_local39, "force_datacenters" )
							if f1_local50 == nil then
								return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to write 'force_datacenters'." )
							elseif f1_local50:addString( f1_local49 ) == false then
							
							else
								Engine.PrintInfo( Enum[0x7A63DCD561B0FA8][0x8E4EED9A90F9B5E], "asyncMatchmakingStartDoc: forcing datacenter to  " .. f1_local49 .. "\n" )
								break
							end
							return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed to add forcedc( " .. f1_local49 .. " ) to 'force_datacenters' field." )
						end
					end
				end
				if f1_local39:setBool( "fill_party", f1_local15 ) == false then
					Lobby.JSON.ErrorWrite( nil, f1_local0, "Failed to set 'fill_party'" )
				end
				if f1_local39:setUInt( "affinity_id", f1_local16 ) == false then
					Lobby.JSON.ErrorWrite( nil, f1_local0, "Failed to set 'affinity_id'" )
				end
				if f1_local18 == true and f1_local39:setBool( "use_skill", true ) == false then
					Lobby.JSON.ErrorWrite( nil, f1_local0, "Failed to set 'use_skill'" )
				end
				if f1_local39:setUInt( "game_type", f1_local17 ) == false then
					Lobby.JSON.ErrorWrite( nil, f1_local0, "Failed to set 'game_type'" )
				end
				f1_local43 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "player_ruleset_payloads" )
				if f1_local43 == nil then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create player_ruleset_payload" )
				end
				for f1_local48, f1_local49 in ipairs( f1_local33.sessionClients ) do
					local f1_local54 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local43, Engine[0x4C599F1694E23EF]( f1_local49.xuid ) )
					f1_local54:setBool( "mic", f1_local49.VOIPStatus == Enum.eVoipStatus[0xABB324E88F12789] )
					f1_local54:setBool( "splitscreen", f1_local49.isSplitscreenClient )
					if f1_local48 == 1 then
						local f1_local51 = Engine.GetPrimaryController()
						local f1_local52 = nil
						if f1_local20.mainmode == Enum.LobbyMainMode[0x79D01499920B292] then
							f1_local52 = Engine.StorageGetBuffer( f1_local51, Enum.StorageFileType[0xEC77AD28A19F8E0] )
						elseif f1_local20.mainmode == Enum.LobbyMainMode[0x7E41449995CD57E] then
							f1_local52 = Engine.StorageGetBuffer( f1_local51, Enum.StorageFileType[0xFDE358A242AFA2C] )
						end
						if f1_local52 then
							local f1_local53 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local54, "match_participation_history" )
							if f1_local53 then
								f1_local53:setUInt( "host_total_match_count_from_go", f1_local52.match_participation_history.host_total_match_count_from_go:get() )
								f1_local53:setUInt( "host_disrupted_match_count_from_go", f1_local52.match_participation_history.host_disrupted_match_count_from_go:get() )
								f1_local53:setUInt( "host_consecutive_success_count_from_go", f1_local52.match_participation_history.host_consecutive_success_count_from_go:get() )
								f1_local53:setUInt( "host_consecutive_disrupted_count_from_go", f1_local52.match_participation_history.host_consecutive_disrupted_count_from_go:get() )
								f1_local53:setUInt( "host_migration_attempted_count_from_go", f1_local52.match_participation_history.host_migration_attempted_count_from_go:get() )
								f1_local53:setUInt( "host_migration_successful_count_from_go", f1_local52.match_participation_history.host_migration_successful_count_from_go:get() )
							end
						end
					end
				end
				f1_local45 = Lobby.JSON.CreateFieldAndAddToLocation( f1_local29, f1_local30, "performance" )
				if f1_local45 == nil then
					return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "Failed to create performance" )
				elseif f1_local45:setUInt( "game_type", f1_local17 ) == false then
					Lobby.JSON.ErrorWrite( nil, f1_local0, "Failed to set 'game_type'" )
				end
			end
		end
		f1_local45 = f1_local5
	end
	f1_local35 = f1_local29:getRepresentation()
	if f1_local35 == nil then
		return Lobby.JSON.ErrorWrite( f1_local29, f1_local0, "failed (getRepresentation) to get JSON.\n" )
	end
	f1_local29:endWrite()
	Engine.PrintInfo( Enum[0x7A63DCD561B0FA8][0x8E4EED9A90F9B5E], f1_local0 .. "\n asyncMatchmakingStartDoc: " .. f1_local35 .. "\n" )
	return f1_local35, f1_local34
end

Lobby.Process.Join = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	Lobby.ProcessNavigate.RemoveAllBots()
	LuaUtils.SetQuickplayPlaylistID( LuaDefine.INVALID_PLAYLIST_ID )
	local f2_local0 = Engine[0x3E68E350BEFE50D]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0x92676CF5B6FCD43] ) and Enum.LobbyType[0x92676CF5B6FCD43] or Enum.LobbyType[0xA1647599284110]
	local f2_local1 = Engine[0x29B25E8DA873863]( Enum.LobbyModule[0xC46B73E8E18BA2], f2_local0 )
	local f2_local2 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = f2_local0
		} )
	end
	
	local f2_local3 = function ()
		return Engine[0x3E68E350BEFE50D]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0x92676CF5B6FCD43] )
	end
	
	local f2_local4 = function ()
		LobbyVM.OnErrorShutdown( {
			controller = f2_arg0,
			signoutUsers = false
		} )
	end
	
	local f2_local5 = LobbyData.GetLobbyMenuByID( Engine[0x9882F293C327557]() )
	local f2_local6 = nil
	if f2_local5.networkmode == Enum.LobbyNetworkMode[0xE99F41098B71960] then
		f2_local6 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE )
	else
		f2_local6 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_LAN )
	end
	local f2_local7 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f2_local8 = function ()
		Engine[0xF56FEF6357B5097]( Enum.LobbyType[0xA1647599284110], Enum.SessionStatus[0x3C3743C7DF71B9F] )
	end
	
	local f2_local9 = function ()
		Engine[0xF56FEF6357B5097]( Enum.LobbyType[0xA1647599284110], Enum.SessionStatus[0x4787E42BE26EFCD] )
	end
	
	local f2_local10 = function ()
		if Engine[0x86E64DD1C270046]( Enum.LobbyModule[0xC46B73E8E18BA2], f2_local0, f2_arg1 ) then
			Engine[0xF56FEF6357B5097]( Enum.LobbyType[0xA1647599284110], Enum.SessionStatus[0x4787E42BE26EFCD] )
			return false
		else
			return true
		end
	end
	
	local f2_local11 = Lobby.Actions.ExecuteScript( f2_local8 )
	f2_local11.name = "preventPlayerJoining"
	local f2_local12 = Lobby.Actions.ExecuteScript( f2_local9 )
	f2_local12.name = "allowPlayerJoining"
	local f2_local13 = Lobby.Actions.ExecuteScript( f2_local10 )
	f2_local13.name = "didPlayerJoinUs"
	local f2_local14 = Lobby.Process.ReloadPrivateLobby( f2_arg0, f2_local6.networkmode )
	local f2_local15 = Lobby.Actions.LobbySettings( f2_arg0, f2_local6 )
	local f2_local16 = Lobby.Actions.UpdateUI( f2_arg0, f2_local6 )
	local f2_local17 = Lobby.Actions.OpenSpinner()
	local f2_local18 = Lobby.Actions.CloseSpinnerAllowJoining()
	local f2_local19 = Lobby.Actions.CloseSpinnerAllowJoining()
	local f2_local20 = Lobby.Actions.CloseSpinnerAllowJoining()
	f2_local20.name = f2_local20.name .. "Error"
	local f2_local21 = Lobby.Actions.CloseSpinnerAllowJoining()
	f2_local21.name = f2_local21.name .. "NeedsFirstTimeFlowPreCheck"
	local f2_local22 = Lobby.Actions.ExecuteScript( f2_local2 )
	local f2_local23 = Lobby.Actions.ExecuteScript( f2_local4 )
	local f2_local24 = Lobby.Actions.LeaveWithParty( 3000 )
	local f2_local25 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType[0xA1647599284110] )
	local f2_local26 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType[0xA1647599284110] )
	local f2_local27 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType[0x92676CF5B6FCD43] )
	local f2_local28 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType[0x92676CF5B6FCD43] )
	local f2_local29 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType[0xA1647599284110] )
	local f2_local30 = Lobby.Actions.LobbyInfoProbe( f2_arg0, {
		xuid = f2_arg1
	} )
	local f2_local31 = Lobby.Actions.CheckFirstTimeFlowRequirements( f2_arg0, f2_local30 )
	local f2_local32 = Lobby.Actions.ShowFirstTimeFlowError( f2_arg0, f2_local31 )
	local f2_local33 = Lobby.Actions.LobbyInfoProbe( f2_arg0, {
		xuid = f2_arg1
	} )
	local f2_local34 = Lobby.Actions.CheckRestrictedClients( f2_arg0, f2_local33 )
	local f2_local35 = Lobby.Actions.CheckLobbySessionStatus( Enum.LobbyType[0xA1647599284110], Enum.SessionStatus[0x4787E42BE26EFCD], f2_local33 )
	local f2_local36 = Lobby.Actions.AsyncMatchmakingJoinCheck( f2_local33 )
	local f2_local37 = Lobby.Actions.AsyncMatchmakingWaitTillHostHasAllTokens( 10000 )
	local f2_local38 = Lobby.Actions.AsyncMatchmakingStartSearch( f2_arg0, Engine[0x8506F73B393062F]( 40000 ), {
		probeResult = {
			probedXuid = f2_arg1
		}
	} )
	local f2_local39 = Lobby.Actions.AsyncMatchmakingWaitToComplete( f2_local38 )
	local f2_local40 = Lobby.Actions.AsyncMatchmakingCancel( f2_arg0, Engine[0x8506F73B393062F]( 40000 ), f2_local38 )
	local f2_local41 = Lobby.Actions.LobbyJoinXUIDExt( f2_arg0, f2_arg2, f2_local33, Enum.LobbyType[0x743687BBDF0B150] )
	f2_local41.name = f2_local41.name .. "_joinGame"
	local f2_local42 = Lobby.Actions.LobbyJoinXUIDExt( f2_arg0, Enum.jointype.join_type_party, f2_local33, Enum.LobbyType[0xA1647599284110] )
	f2_local42.name = f2_local42.name .. "_joinPrivate"
	local f2_local43 = Lobby.Actions.LobbyJoinXUIDExt( f2_arg0, Enum.jointype.join_type_party, f2_local33, Enum.LobbyType[0xA1647599284110] )
	f2_local43.name = f2_local42.name .. "_BackJoinPrivate"
	local f2_local44 = Lobby.Actions.ExecuteScriptWithReturn( f2_local3, true, false, false )
	local f2_local45 = Lobby.Actions.LobbyHostStart( f2_arg0, Enum.LobbyMainMode[0xD5FBB8D74AC6D62], Enum.LobbyType[0xA1647599284110], Enum.LobbyMode[0x285F46E8227BB03], f2_local1, "", "" )
	local f2_local46 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType[0xA1647599284110] )
	local f2_local47 = Lobby.Actions.LobbyClientStart( Enum.LobbyType[0xA1647599284110] )
	local f2_local48 = false
	if Engine[0x9882F293C327557]() ~= LobbyData.GetLobbyMenuIDByName( LuaEnum.UI.DIRECTOR_ONLINE_MP_PUBLIC ) then
		f2_local48 = true
	end
	local f2_local49 = Lobby.Actions.ForceLobbyUIScreen( f2_arg0, LobbyData.GetLobbyMenuIDByName( LuaEnum.UI.DIRECTOR_ONLINE ) )
	local f2_local50 = Lobby.Actions.ErrorPopup( f2_local41 )
	local f2_local51 = Lobby.Process.ReloadPrivateLobby( f2_arg0, f2_local6.networkmode )
	local f2_local52 = Lobby.Actions.LobbySettings( f2_arg0, f2_local6 )
	local f2_local53 = Lobby.Actions.UpdateUI( f2_arg0, f2_local6 )
	local f2_local54 = f2_local51.head
	Lobby.Process.ForceAction( f2_local51.tail, f2_local52 )
	Lobby.Process.ForceAction( f2_local52, f2_local53 )
	Lobby.Process.ForceAction( f2_local53, f2_local50 )
	Lobby.Process.ForceAction( f2_local50, f2_local12 )
	local f2_local55 = Lobby.Actions.ErrorPopup( f2_local42 )
	local f2_local56 = Lobby.Process.ReloadPrivateLobby( f2_arg0, f2_local6.networkmode )
	local f2_local57 = Lobby.Process.JoinFailedPrivateLobby( f2_arg0, f2_local6.networkmode )
	local f2_local58 = Lobby.Actions.LobbySettings( f2_arg0, f2_local6 )
	local f2_local59 = Lobby.Actions.UpdateUI( f2_arg0, f2_local6 )
	local f2_local60 = f2_local56.head
	Lobby.Process.ForceAction( f2_local56.tail, f2_local58 )
	Lobby.Process.ForceAction( f2_local58, f2_local59 )
	Lobby.Process.ForceAction( f2_local59, f2_local55 )
	Lobby.Process.ForceAction( f2_local55, f2_local12 )
	local f2_local61 = f2_local57.head
	Lobby.Process.ForceAction( f2_local57.tail, f2_local58 )
	local f2_local62 = f2_local22
	local f2_local63 = Engine.IsInGame()
	local f2_local64 = Engine[0x3E68E350BEFE50D]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0xA1647599284110] )
	local f2_local65 = Engine[0x3E68E350BEFE50D]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0x92676CF5B6FCD43] )
	local f2_local66 = Engine[0xEA2BE00F49480D]( Enum.LobbyType[0xA1647599284110] )
	local f2_local67 = Engine[0xEA2BE00F49480D]( Enum.LobbyType[0x92676CF5B6FCD43] )
	local f2_local68 = Engine[0x44FC97037CE42ED]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0xA1647599284110], Enum[0x575E471C039DBD6][0x92BC25E18D296F] )
	local f2_local69 = Engine[0x44FC97037CE42ED]( Enum.LobbyModule[0xC46B73E8E18BA2], Enum.LobbyType[0x92676CF5B6FCD43], Enum[0x575E471C039DBD6][0x92BC25E18D296F] )
	local f2_local70 = f2_local66 and f2_arg3 == LuaEnum.LEAVE_WITH_PARTY.WITH
	local f2_local71 = false
	local f2_local72 = false
	local f2_local73 = false
	local f2_local74 = false
	if f2_local63 == true then
		f2_local71 = true
		f2_local72 = true
		f2_local73 = true
		if f2_local66 == true then
			f2_local74 = true
		end
	elseif f2_local65 == true then
		f2_local71 = true
		f2_local72 = true
		if f2_local70 == false then
			f2_local73 = true
			if f2_local66 == true then
				f2_local74 = true
			end
		end
	elseif f2_local64 == true then
		if f2_local70 == false then
			f2_local73 = true
			if f2_local66 == true then
				f2_local74 = true
			end
		end
	else
		f2_local71 = true
		f2_local72 = true
		f2_local73 = true
		f2_local74 = true
	end
	local f2_local75 = {
		head = f2_local17,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f2_local17, f2_local7 )
	Lobby.Process.AddActions( f2_local7, f2_local11, f2_local18, f2_local18 )
	Lobby.Process.AddActions( f2_local11, f2_local13, f2_local18, f2_local18 )
	Lobby.Process.AddActions( f2_local13, f2_local30, f2_local18, f2_local18 )
	Lobby.Process.AddActions( f2_local30, f2_local31, f2_local18, f2_local18 )
	Lobby.Process.AddActions( f2_local31, f2_local22, f2_local21, f2_local21 )
	local f2_local76 = false
	if f2_local65 == true and f2_local70 == true then
		Lobby.Process.AddActions( f2_local62, f2_local24, f2_local60, f2_local60 )
		f2_local62 = f2_local24
		f2_local76 = true
	end
	if f2_local71 == true then
		Lobby.Process.AddActions( f2_local62, f2_local27, f2_local60, f2_local60 )
		f2_local62 = f2_local27
		f2_local76 = true
	end
	if f2_local72 == true then
		Lobby.Process.AddActions( f2_local62, f2_local28, f2_local60, f2_local60 )
		f2_local62 = f2_local28
		f2_local76 = true
	end
	if f2_local73 == true then
		Lobby.Process.AddActions( f2_local62, f2_local29, f2_local60, f2_local60 )
		f2_local62 = f2_local29
		f2_local48 = true
		f2_local76 = true
	end
	if f2_local74 == true then
		Lobby.Process.AddActions( f2_local62, f2_local26, f2_local60, f2_local60 )
		f2_local62 = f2_local26
		f2_local48 = true
		f2_local76 = true
	end
	if f2_local66 == false or f2_local74 == true then
		Lobby.Process.AddActions( f2_local62, f2_local45, f2_local60, f2_local60 )
		Lobby.Process.AddActions( f2_local45, f2_local46, f2_local60, f2_local60 )
		f2_local62 = f2_local46
		f2_local48 = true
		f2_local76 = true
	end
	if f2_local73 == true then
		Lobby.Process.AddActions( f2_local62, f2_local47, f2_local60, f2_local60 )
		f2_local62 = f2_local47
		f2_local48 = true
		f2_local76 = true
	end
	local f2_local77 = Lobby.Actions.IsConditionTrue( not f2_local48 )
	local f2_local78 = Lobby.Actions.IsConditionTrue( f2_local76 )
	Lobby.Process.AddActions( f2_local62, f2_local33, f2_local60, f2_local60 )
	Lobby.Process.AddActions( f2_local33, f2_local34, f2_local60, f2_local60 )
	Lobby.Process.AddActions( f2_local34, f2_local35, f2_local60, f2_local60 )
	Lobby.Process.AddActions( f2_local35, f2_local36, f2_local60, f2_local60 )
	Lobby.Process.AddActions( f2_local36, f2_local37, f2_local42, f2_local41 )
	Lobby.Process.AddActions( f2_local37, f2_local38, f2_local60, f2_local60 )
	Lobby.Process.AddActions( f2_local38, f2_local39, f2_local77, f2_local60 )
	Lobby.Process.AddActions( f2_local39, f2_local18, f2_local77, f2_local60 )
	Lobby.Process.AddActions( f2_local77, f2_local49, f2_local78, f2_local60 )
	Lobby.Process.AddActions( f2_local78, f2_local60, f2_local20, f2_local60 )
	Lobby.Process.AddActions( f2_local42, f2_local18, f2_local61, f2_local61 )
	Lobby.Process.AddActions( f2_local41, f2_local44, f2_local77, f2_local54 )
	Lobby.Process.AddActions( f2_local44, f2_local43, f2_local18, f2_local18 )
	Lobby.Process.ForceAction( f2_local43, f2_local18 )
	Lobby.Process.ForceAction( f2_local49, f2_local20 )
	Lobby.Process.ForceAction( f2_local20, f2_local50 )
	Lobby.Process.ForceAction( f2_local21, f2_local32 )
	return f2_local75
end

Lobby.Scheduler.ParseEventsSecure = function ()
	if Engine[0xA63E42B2FB6EC02]() == Enum.LobbyNetworkMode[0xE99F41098B71960] then
		Lobby.Scheduler.ParseEvents( false )
	end
end

LobbyVM.TestFFOTDFnOverride = function ()
	Engine.PrintInfo( Enum[0x7A63DCD561B0FA8][0xA9AE284CC7DE955], "Succeeded to override Lobby VM function from FFOTD.\n" )
end

Lobby.Events.eventHandlers.TestFFOTDFnOverride = LobbyVM.TestFFOTDFnOverride
