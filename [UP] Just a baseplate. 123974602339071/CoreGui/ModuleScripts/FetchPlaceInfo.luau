-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Thunks.FetchPlaceInfo
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("HttpRbxApiService")
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v2.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v_u_6 = require(v4.Modules.Common.httpRequest)(v3)
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Actions.SetPlaceInfo)
return function(p_u_9)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_8
	return function(p_u_10)
		-- upvalues: (copy) p_u_9, (ref) v_u_5, (ref) v_u_6, (ref) v_u_8
		if p_u_9 ~= 0 then
			v_u_5(v_u_6, p_u_9):andThen(function(p11)
				-- upvalues: (copy) p_u_10, (ref) v_u_8
				p_u_10:dispatch(v_u_8(p11.Name, p11.Description))
			end):catch(function()
				warn("Unable to fetch place info for TrustAndSafety.")
			end)
		end
	end
end