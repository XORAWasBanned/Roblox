-- Path: CoreGui.RobloxGui.Modules.Shell.Reducers.ScreenList
local v1 = game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions
local v_u_2 = require(v1.InsertScreen)
local v_u_3 = require(v1.RemoveScreen)
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Workspace.Packages.AppCommonLib).Immutable
return function(p6, p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
	local v8 = p6 or {}
	assert(v8, "")
	if p7.type == v_u_2.name then
		local v9 = v_u_5.Append(v8, p7.item)
		table.sort(v9, function(p10, p11)
			if p10.priority == p11.priority then
				return p10.createdAt > p11.createdAt
			else
				return p10.priority > p11.priority
			end
		end)
		return v9
	elseif p7.type == v_u_3.name then
		return v_u_5.RemoveValueFromList(v8, p7.item)
	else
		return v8
	end
end