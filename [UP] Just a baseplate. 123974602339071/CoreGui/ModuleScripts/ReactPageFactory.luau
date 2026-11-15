-- Path: CoreGui.RobloxGui.Modules.Settings.ReactPageFactory
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = {}
local function v_u_8(p4) -- name: createNewPage
	-- upvalues: (copy) v_u_2
	local v_u_7 = {
		["name"] = nil,
		["page"] = nil,
		["hubRef"] = nil,
		["name"] = p4,
		["setPage"] = function(_, p5) -- name: setPage
			-- upvalues: (copy) v_u_7
			v_u_7.page = p5
		end,
		["createPage"] = function(_, p6) -- name: createPage
			-- upvalues: (copy) v_u_7, (ref) v_u_2
			if v_u_7.page then
				return v_u_2.createElement(v_u_7.page, p6)
			else
				return nil
			end
		end
	}
	return v_u_7
end
function v3.createNewPage(_, p9) -- name: createNewPage
	-- upvalues: (copy) v_u_8
	return v_u_8(p9)
end
return v3