-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.Rules.shadowRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.ShadowPreset)
require(v1.Providers.Style.Tokens)
require(script.Parent.Types)
local v_u_3 = {
	{
		["name"] = v2.Raised100,
		["layers"] = {
			{
				["blur"] = "100",
				["spread"] = "0"
			},
			{
				["blur"] = "500",
				["spread"] = "0"
			}
		}
	},
	{
		["name"] = v2.Raised300,
		["layers"] = {
			{
				["blur"] = "100",
				["spread"] = "0"
			},
			{
				["blur"] = "500",
				["spread"] = "0"
			},
			{
				["blur"] = "800",
				["spread"] = "0"
			},
			{
				["blur"] = "1400",
				["spread"] = "0"
			}
		}
	},
	{
		["name"] = v2.Overlay100,
		["layers"] = {
			{
				["offsetY"] = "50",
				["blur"] = "100",
				["spread"] = "-0.5"
			},
			{
				["offsetY"] = "250",
				["blur"] = "500",
				["spread"] = "-0.75"
			}
		}
	},
	{
		["name"] = v2.Overlay300,
		["layers"] = {
			{
				["offsetY"] = "50",
				["blur"] = "100",
				["spread"] = "-0.5"
			},
			{
				["offsetY"] = "250",
				["blur"] = "500",
				["spread"] = "-0.75"
			},
			{
				["offsetY"] = "400",
				["blur"] = "800",
				["spread"] = "-1"
			},
			{
				["offsetY"] = "1200",
				["blur"] = "1400",
				["spread"] = "-1.5"
			}
		}
	}
}
local function v_u_17(p4, p5, p6, p7, p8) -- name: layerRule
	local v9 = ("ShadowBlurSize%*"):format(p5.blur)
	local v10 = p5.spread
	local v11 = tonumber(v10)
	local v12 = math.floor(v11)
	local v13 = {
		["BlurRadius"] = nil,
		["Color"] = nil,
		["Transparency"] = 0.92,
		["Spread"] = nil,
		["ZIndex"] = nil,
		["BlurRadius"] = "$" .. v9,
		["Color"] = p8,
		["Spread"] = UDim2.fromOffset(v12, v12),
		["ZIndex"] = -p6
	}
	local v14 = {
		{
			["name"] = v9,
			["value"] = UDim.new(0, p7[("Size_%*"):format(p5.blur)])
		}
	}
	if p5.offsetY == nil then
		v13.Offset = UDim2.new()
	else
		local v15 = ("ShadowOffsetSize%*"):format(p5.offsetY)
		v13.Offset = "$" .. v15
		local v16 = {
			["name"] = v15,
			["value"] = UDim2.fromOffset(0, p7[("Size_%*"):format(p5.offsetY)])
		}
		table.insert(v14, v16)
	end
	return {
		["tag"] = nil,
		["pseudo"] = "UIShadow",
		["pseudoName"] = nil,
		["properties"] = nil,
		["attributes"] = nil,
		["tag"] = p4,
		["pseudoName"] = ("%*-%*"):format(p4, p6),
		["properties"] = v13,
		["attributes"] = v14
	}
end
return function(p18) -- name: shadowRules
	-- upvalues: (copy) v_u_3, (copy) v_u_17
	local v19 = p18.Size
	local v20 = p18.Color.Common.Shadow.Color3
	local v21 = {}
	for _, v22 in v_u_3 do
		local v23 = ("shadow-%*"):format(v22.name)
		local v24 = v22.layers
		local v25 = v_u_17(v23, v24[1], 1, v19, v20)
		if #v24 > 1 then
			local v26 = {}
			for v27 = 2, #v24 do
				local v28 = v_u_17(v23, v24[v27], v27, v19, v20)
				table.insert(v26, v28)
			end
			v25.children = v26
		end
		table.insert(v21, v25)
	end
	return v21
end