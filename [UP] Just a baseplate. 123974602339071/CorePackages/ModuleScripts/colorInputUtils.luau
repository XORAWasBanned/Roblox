-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.colorInputUtils
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v2.React)
local v_u_4 = require(v1.Enums.ColorInputMode)
return {
	["createInputConfigs"] = function(p_u_5, p_u_6, p7, p8, p_u_9, p_u_10, p11, p12, _) -- name: createInputConfigs
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v15 = v_u_3.map({ "R", "G", "B" }, function(p_u_13)
			-- upvalues: (copy) p_u_5, (copy) p_u_9
			return {
				["key"] = nil,
				["component"] = nil,
				["value"] = nil,
				["handler"] = nil,
				["minimum"] = 0,
				["maximum"] = 255,
				["step"] = 1,
				["key"] = p_u_13,
				["component"] = p_u_13:lower(),
				["value"] = p_u_5:map(function(p14)
					-- upvalues: (copy) p_u_13
					return p14[p_u_13:lower()]
				end),
				["handler"] = p_u_9
			}
		end)
		local v16 = table.clone(v15)
		table.insert(v16, {
			["key"] = "A",
			["value"] = nil,
			["handler"] = nil,
			["minimum"] = 0,
			["maximum"] = 1,
			["step"] = 0.01,
			["precision"] = 3,
			["value"] = p8,
			["handler"] = p12
		})
		local v19 = v_u_3.map({ "H", "S", "V" }, function(p_u_17)
			-- upvalues: (copy) p_u_6, (copy) p_u_10
			return {
				["key"] = nil,
				["component"] = nil,
				["value"] = nil,
				["handler"] = nil,
				["minimum"] = 0,
				["maximum"] = nil,
				["key"] = p_u_17,
				["component"] = p_u_17:lower(),
				["value"] = p_u_6:map(function(p18)
					-- upvalues: (copy) p_u_17
					return p18[p_u_17:lower()]
				end),
				["handler"] = p_u_10,
				["maximum"] = p_u_17 == "H" and 360 or nil
			}
		end)
		local v20 = {}
		local v21 = {
			["key"] = nil,
			["value"] = nil,
			["handler"] = nil,
			["placeholder"] = "#000000",
			["width"] = nil
		}
		local v22 = v_u_4.Hex
		v21.key = tostring(v22)
		v21.value = p7
		v21.handler = p11
		v21.width = UDim.new(1, 0)
		__set_list(v20, 1, {v21})
		return {
			[v_u_4.RGB] = v15,
			[v_u_4.RGBA] = v16,
			[v_u_4.HSV] = v19,
			[v_u_4.Hex] = v20
		}
	end
}