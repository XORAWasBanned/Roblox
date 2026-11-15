-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.CursorComponent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Enums.ColorNamespace)
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Providers.Style.useTokens)
local v12 = v_u_3.forwardRef(function(p5, p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = v_u_4()
	local v8 = p5.colorNamespace
	local v9 = v_u_3.createElement
	local v10 = {
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Position"] = nil,
		["Size"] = nil,
		["ref"] = nil,
		["Position"] = UDim2.fromOffset(-p5.offset, -p5.offset),
		["Size"] = UDim2.new(1, p5.offset * 2, 1, p5.offset * 2),
		["ref"] = p6
	}
	local v11 = {
		["UICorner"] = v_u_3.createElement("UICorner", {
			["CornerRadius"] = p5.cornerRadius
		}),
		["UIStroke"] = v_u_3.createElement("UIStroke", {
			["Color"] = v7[v8].Selection.Start.Color3,
			["Transparency"] = v7[v8].Selection.Start.Transparency,
			["Thickness"] = p5.borderWidth
		}, {})
	}
	return v9("Frame", v10, v11)
end)
return v_u_3.memo(v12)