require( "lua/lobby/common/lobbycore" )

Lobby.Paintjobs = {}
Lobby.Paintjobs.OnClientAdded = function ( f1_arg0 )
	if f1_arg0.lobbyModule == Enum.LobbyModule[0xC46B73E8E18BA2] then
		Engine[0xE41ECF8228967AD]( f1_arg0.xuid )
	end
end

Lobby.Paintjobs.OnClientRemoved = function ( f2_arg0 )
	if f2_arg0.lobbyModule == Enum.LobbyModule[0xC46B73E8E18BA2] then
		Engine[0xF3D516679F0B183]( f2_arg0.xuid )
	end
end

Lobby.Paintjobs.OnMatchEnd = function ( f3_arg0 )
	Engine[0x51041C5B9B5DD93]()
end

