require( "lua/shared/ddlutils" )
require( "lua/shared/luadefine" )
require( "lua/shared/luaenum" )
require( "lua/shared/luareadonlytables" )
require( "lua/shared/luautils" )
require( "ui/lui/lui" )

if Engine[0x2DA54CF5D6B7F02]() then
	require( "x64:3b9be7a3bb18b43" )
end
if Engine[0x2DA54CF5D6B7F02]() or Engine[0xA056213B64313A6]() then
	require( "x64:6c682fb7f8b97de" )
end
require( "ui/codroot" )
EnableGlobals()
require( "ui/uieditor/actions" )
require( "x64:886f43e2ac316b2" )
require( "ui/uieditor/conditions" )
require( "ui/uieditor/datasources" )
require( "x64:5814753ce54450b" )
require( "ui/uieditor/soundsets" )
require( "lua/shared/codshared" )
require( "x64:34fcf0a333ae4ab" )
require( "x64:adbf45d40e2a79" )
DisableGlobals()
