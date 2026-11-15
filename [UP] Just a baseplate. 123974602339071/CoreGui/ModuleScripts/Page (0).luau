-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Reducers.Page
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).Immutable
local v_u_4 = require(v2.Constants)
local v_u_5 = require(v2.Actions.OpenPage)
local v_u_6 = require(v2.Actions.ClosePage)
return function(p7, p8)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	local v9 = p7 or {
		["IsOpen"] = false,
		["Route"] = nil,
		["Route"] = v_u_4.PageRoute.NONE
	}
	if p8.type == v_u_5.name then
		return v_u_3.JoinDictionaries(v9, {
			["IsOpen"] = true,
			["Route"] = nil,
			["Route"] = p8.route or v_u_4.PageRoute.NONE
		})
	end
	if p8.type == v_u_6.name then
		v9 = v_u_3.JoinDictionaries(v9, {
			["IsOpen"] = false,
			["Route"] = nil,
			["Route"] = p8.route or v_u_4.PageRoute.NONE
		})
	end
	return v9
end