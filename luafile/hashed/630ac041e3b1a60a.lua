require( "lua/lobby/common/lobbycore" )
require( "lua/lobby/process/lobbyprocess" )

Lobby.Theater = {}
Lobby.Theater.OnSessionStart = function ( f1_arg0 )
	if f1_arg0.lobbyMode ~= Enum.LobbyMode[0x8B3B066EFD7CD01] then
		return 
	else
		Lobby.Theater.fileID = Engine.DefaultID64Value()
	end
end

Lobby.Theater.OnSessionEnd = function ( f2_arg0 )
	if f2_arg0.lobbyMode ~= Enum.LobbyMode[0x8B3B066EFD7CD01] then
		return 
	else
		Lobby.MapVote.Clear()
		local f2_local0 = Engine.GetPrimaryController()
		Engine.ExecNow( f2_local0, "demo_abortfilesharedownload" )
		Engine.SwitchMode( f2_local0, "" )
		Engine.FreeTheaterMemoryIfAllocated()
		Engine.SetDvar( "ui_demoname", "" )
		Lobby.Theater.fileID = Engine.DefaultID64Value()
		Lobby.Theater.downloadPercent = 0
		Engine[0x926702316790C77]( Enum.LobbyModule[0x98EA1BB7164D103], Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] ), f2_local0 )
	end
end

Lobby.Theater.Pump = function ()
	local f3_local0 = LobbyData.GetLobbyMenuByID( Engine[0x9882F293C327557]() )
	if not f3_local0 then
		return 
	elseif f3_local0.LobbyMode ~= Enum.LobbyMode[0x8B3B066EFD7CD01] then
		return 
	end
	local f3_local1 = Engine[0xC3DF042E7492B66]( Enum.LobbyModule[0x98EA1BB7164D103] )
	if Engine[0x3E68E350BEFE50D]( Enum.LobbyModule[0x98EA1BB7164D103], f3_local1 ) == false then
		return 
	elseif Engine[0xEA2BE00F49480D]( f3_local1 ) == false then
		return 
	end
	local f3_local2 = Engine[0x23AF33F30C69410]( Enum.LobbyModule[0xC46B73E8E18BA2], f3_local1 )
	if f3_local2 then
		local f3_local3 = f3_local2.fileID
		local f3_local4 = f3_local2.readyForPlayback
		local f3_local5 = f3_local2.downloadPercent
		local f3_local6 = false
		local f3_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
		local f3_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
		if Engine.GetModelValue( f3_local7 ) == nil or Engine.GetModelValue( f3_local8 ) == nil then
			f3_local6 = true
		end
		if f3_local3 ~= Lobby.Theater.fileID or f3_local4 ~= Lobby.Theater.readyForPlayback or f3_local5 ~= Lobby.Theater.downloadPercent or f3_local6 then
			Lobby.Theater.fileID = f3_local3
			Lobby.Theater.readyForPlayback = f3_local2.readyForPlayback
			Lobby.Theater.downloadPercent = f3_local2.downloadPercent
			Engine.SetModelValue( f3_local7, Lobby.Theater.readyForPlayback )
			Engine.SetModelValue( f3_local8, Lobby.Theater.downloadPercent )
		end
	end
end

