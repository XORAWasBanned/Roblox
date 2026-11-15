-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.iconMigrationUtils
local v1 = script:FindFirstAncestor("Foundation")
local v2 = script.Parent
local v3 = v1.Parent
local v_u_4 = require(v3.BuilderIcons).Migration.uiblox
local v_u_5 = require(v2.isBuilderIcon)
return {
	["isMigrated"] = function(p6) -- name: isMigrated
		-- upvalues: (copy) v_u_4
		return v_u_4[p6] ~= nil
	end,
	["isBuilderOrMigratedIcon"] = function(p7) -- name: isBuilderOrMigratedIcon
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		return v_u_5(p7) or v_u_4[p7] ~= nil
	end,
	["normalizeIconName"] = function(p8) -- name: normalizeIconName
		-- upvalues: (copy) v_u_4
		if v_u_4[p8] == nil then
			return {
				["name"] = nil,
				["variant"] = nil,
				["name"] = p8
			}
		end
		local v9 = v_u_4[p8]
		return {
			["name"] = v9.name,
			["variant"] = v9.variant
		}
	end
}