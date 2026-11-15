-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameIconHeader
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Components.ThemedTextLabel)
local v_u_7 = require(v5.Components.GameIcon)
return v4.UNSTABLE_connect2(function(p8)
	return {
		["gameName"] = p8.gameInfo.name
	}
end)(function(p9) -- name: GameIconHeader
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_6
	local v10 = v_u_3.createElement
	local v11 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 148)
	}
	local v12 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 24),
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24),
			["PaddingTop"] = UDim.new(0, 24)
		}),
		["GameIcon"] = v_u_3.createElement(v_u_7, {
			["gameId"] = nil,
			["iconSize"] = 100,
			["gameId"] = game.GameId
		}),
		["GameName"] = v_u_3.createElement(v_u_6, {
			["fontKey"] = "Title",
			["themeKey"] = "TextEmphasis",
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Position"] = UDim2.new(0, 112, 0, 0),
			["Size"] = UDim2.new(1, -112, 1, 0),
			["Text"] = p9.gameName,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top
		})
	}
	return v10("ImageLabel", v11, v12)
end)