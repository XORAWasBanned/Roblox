-- Path: CoreGui.RobloxGui.Modules.InGameMenu.SetupFunctions.requestGameNameAndDescription
local v1 = game:GetService("HttpRbxApiService")
local v2 = game:GetService("CorePackages")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Actions.SetGameNameAndDescription)
local v_u_5 = require(v3.Network.httpRequest)(v1)
local v_u_6 = require(v2.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
return function(p_u_7) -- name: requestGameNameAndDescription
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	if game.GameId ~= 0 then
		v_u_6(v_u_5, game.GameId):andThen(function(p8)
			-- upvalues: (copy) p_u_7, (ref) v_u_4
			p_u_7:dispatch(v_u_4(p8.Name, p8.Description))
		end):catch(function()
			warn("Unable to retrieve game name for in game menu")
		end)
	end
end