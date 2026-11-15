-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.StoryMiddleware
local v1 = script.Parent.Parent
local v2 = require(v1.Foundation)
local v_u_3 = require(v1.React)
local v_u_4 = v2.FoundationProvider
local v_u_5 = v2.Enums.Theme
local v_u_6 = v2.Enums.Device
return function(p_u_7) -- name: StoryMiddleware
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	return function(p8)
		-- upvalues: (ref) v_u_5, (ref) v_u_3, (ref) v_u_4, (ref) v_u_6, (copy) p_u_7
		local v9 = v_u_5[p8.theme]
		local v10 = v_u_3.createElement
		local v11 = {
			["AutomaticSize"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Size"] = UDim2.fromScale(1, 0)
		}
		local v12 = {
			["UIPadding"] = v_u_3.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10),
				["PaddingBottom"] = UDim.new(0, 10),
				["PaddingLeft"] = UDim.new(0, 10),
				["PaddingRight"] = UDim.new(0, 10)
			}),
			["FoundationContext"] = v_u_3.createElement(v_u_4, {
				["theme"] = v9,
				["device"] = v_u_6[p8.platform],
				["preferences"] = p8.settings
			}, {
				["Child"] = v_u_3.createElement(p_u_7, p8)
			})
		}
		return v10("Frame", v11, v12)
	end
end