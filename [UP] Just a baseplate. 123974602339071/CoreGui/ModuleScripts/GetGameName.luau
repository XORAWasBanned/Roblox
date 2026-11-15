-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.GetGameName
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("HttpRbxApiService")
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v2.Packages.Promise)
local v_u_6 = require(v4.Modules.Common.httpRequest)(v3)
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Actions.GameNameFetched)
local v_u_9 = require(v2.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
return function(p_u_10)
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_6, (copy) v_u_8
	if game.GameId == 0 then
		return v_u_5.resolve()
	else
		return v_u_9(v_u_6, game.GameId):andThen(function(p11)
			-- upvalues: (copy) p_u_10, (ref) v_u_8
			p_u_10:dispatch(v_u_8(p11.Name))
			return p11.Name
		end, function()
			-- upvalues: (ref) v_u_5
			warn("Unable to get game name for Avatar Editor Prompts")
			return v_u_5.reject()
		end)
	end
end