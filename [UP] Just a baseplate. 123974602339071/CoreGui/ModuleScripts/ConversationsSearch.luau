-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Reducers.ConversationsSearch
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1.RobloxGui.Modules.Settings.Pages.ShareGame
local v_u_4 = require(v2.Workspace.Packages.AppCommonLib).Immutable
local v_u_5 = require(v3.Actions.ClosePage)
local v_u_6 = require(v3.Actions.SetSearchAreaActive)
local v_u_7 = require(v3.Actions.SetSearchText)
local v_u_8 = {
	["SearchAreaActive"] = false,
	["SearchText"] = ""
}
return function(p9, p10)
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5
	local v11 = p9 or v_u_8
	if p10.type == v_u_6.name then
		return v_u_4.Set(v11, "SearchAreaActive", p10.isActive)
	end
	if p10.type == v_u_7.name then
		return v_u_4.Set(v11, "SearchText", p10.searchText)
	end
	if p10.type == v_u_5.name then
		v11 = v_u_8
	end
	return v11
end