-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.navigationReducer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Cryo
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Components.Pages)
local v_u_5 = require(v3.Actions.NavigateBack)
local v_u_6 = require(v3.Actions.SetCurrentPage)
return function(p7, p8)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
	local v9 = v_u_4.pagesByKey[p7.menuPage]
	if p8.type == v_u_5.name then
		if p7.respawn.dialogOpen then
			return v_u_2.Dictionary.join(p7, {
				["respawn"] = v_u_2.Dictionary.join(p7.respawn, {
					["dialogOpen"] = false
				})
			})
		end
		if p7.report.dialogOpen then
			return v_u_2.Dictionary.join(p7, {
				["report"] = v_u_2.Dictionary.join(p7.report, {
					["dialogOpen"] = false
				})
			})
		end
		if p7.menuPage then
			local v10 = v9.parentPage
			if v10 ~= nil then
				return v_u_2.Dictionary.join(p7, {
					["menuPage"] = v10
				})
			end
		end
	elseif p8.type == v_u_6.name then
		return v_u_2.Dictionary.join(p7, {
			["currentlyOpenBubble"] = v_u_2.None
		})
	end
	return p7
end