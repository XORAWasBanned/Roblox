-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.Rules.cornerRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.CornerProperty)
require(script.Parent.Types)
local v_u_3 = UDim.new(0, 0)
local v_u_4 = {
	v2.TopLeft,
	v2.TopRight,
	v2.BottomRight,
	v2.BottomLeft
}
local v_u_5 = {
	["top-left"] = v2.TopLeft,
	["top-right"] = v2.TopRight,
	["bottom-right"] = v2.BottomRight,
	["bottom-left"] = v2.BottomLeft
}
local v_u_6 = {
	["top"] = { v2.TopLeft, v2.TopRight },
	["bottom"] = { v2.BottomLeft, v2.BottomRight },
	["left"] = { v2.TopLeft, v2.BottomLeft },
	["right"] = { v2.TopRight, v2.BottomRight }
}
return function(p7, p8) -- name: cornerRules
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v9 = {}
	for _, v10 in p7 do
		local v11 = p8(v10)
		local v12 = v11.cornerValue
		local v13 = v11.attributes
		local v14 = {
			["tag"] = nil,
			["pseudo"] = "UICorner",
			["priority"] = 1,
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("radius-%*"):format(v10.name)
		}
		local v15 = {}
		for _, v16 in v_u_4 do
			v15[v16] = v12
		end
		v14.properties = v15
		v14.attributes = v13
		table.insert(v9, v14)
		for v17, v18 in v_u_6 do
			local v19 = ("radius-%*-%*"):format(v17, v10.name)
			local v20 = {}
			local v21 = {
				["tag"] = nil,
				["pseudo"] = "UICorner",
				["priority"] = 2,
				["properties"] = nil,
				["attributes"] = nil,
				["children"] = nil,
				["tag"] = v19
			}
			for _, v22 in v18 do
				v20[v22] = v12
			end
			v21.properties = v20
			v21.attributes = v13
			local v23 = v_u_3
			local v24 = {}
			local v25 = {
				["tag"] = nil,
				["pseudo"] = "UICorner",
				["priority"] = 0,
				["properties"] = nil,
				["tag"] = v19
			}
			local v26 = {}
			for _, v27 in v_u_4 do
				v24[v27] = v23
			end
			v25.properties = v24
			__set_list(v26, 1, {v25})
			v21.children = v26
			table.insert(v9, v21)
		end
		for v28, v29 in v_u_5 do
			local v30 = ("radius-%*-%*"):format(v28, v10.name)
			local v31 = {}
			local v32 = {
				["tag"] = nil,
				["pseudo"] = "UICorner",
				["priority"] = 3,
				["properties"] = nil,
				["attributes"] = nil,
				["children"] = nil,
				["tag"] = v30
			}
			for _, v33 in { v29 } do
				v31[v33] = v12
			end
			v32.properties = v31
			v32.attributes = v13
			local v34 = v_u_3
			local v35 = {}
			local v36 = {
				["tag"] = nil,
				["pseudo"] = "UICorner",
				["priority"] = 0,
				["properties"] = nil,
				["tag"] = v30
			}
			local v37 = {}
			for _, v38 in v_u_4 do
				v35[v38] = v34
			end
			v36.properties = v35
			__set_list(v37, 1, {v36})
			v32.children = v37
			table.insert(v9, v32)
		end
	end
	return v9
end