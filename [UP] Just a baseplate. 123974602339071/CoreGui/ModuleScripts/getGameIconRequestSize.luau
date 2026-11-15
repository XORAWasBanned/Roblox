-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.getGameIconRequestSize
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.ArgCheck)
local v_u_3 = {
	50,
	128,
	150,
	256,
	512
}
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	v_u_2.isNonNegativeNumber(p4, "Game Icon Size")
	local v5 = #v_u_3
	for _, v6 in ipairs(v_u_3) do
		if p4 > v6 then
			continue
		end
		return v6
	end
	return v_u_3[v5]
end