-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Components.AudioDeviceInputDebugger
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.React)
return function(p4) -- name: AudioDeviceInputDebugger
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_5, v_u_6 = v_u_3.useState(true)
	local v7 = p4.instances
	local v_u_8 = p4.mutedPlayers
	local v15 = v_u_2.List.map(v_u_2.Dictionary.keys(v7), function(p9, p10)
		-- upvalues: (copy) v_u_8, (ref) v_u_3
		local v11 = p9.Active
		local v12 = p9.Player and (p9.Player.Name or "(no player)") or "(no player)"
		local v13 = p9.Player and v_u_8[p9.Player.UserId] and "muted" or "unmuted"
		local v14 = p9.MutedByLocalUser and "mutedByLocalUser" or "not-mutedByLocalUser"
		return v_u_3.createElement("TextLabel", {
			["Text"] = nil,
			["Size"] = nil,
			["RichText"] = true,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = nil,
			["TextXAlignment"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Font"] = nil,
			["TextSize"] = 18,
			["Text"] = string.format("<b>%s</b>: %s, %s, %s", v12, v11 and "active" or "inactive", v13, v14),
			["Size"] = UDim2.fromOffset(20, 25),
			["AutomaticSize"] = Enum.AutomaticSize.X,
			["LayoutOrder"] = p10,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextColor3"] = Color3.fromRGB(255, 255, 255),
			["Font"] = Enum.Font.SourceSans
		})
	end)
	v15.Title = v_u_3.createElement("TextButton", {
		["Text"] = "<b>AudioDeviceInputs</b>",
		[v_u_3.Event.Activated] = function()
			-- upvalues: (copy) v_u_6, (copy) v_u_5
			v_u_6(not v_u_5)
		end,
		["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
		["TextStrokeTransparency"] = 0.5,
		["Size"] = UDim2.fromOffset(20, 25),
		["RichText"] = true,
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["LayoutOrder"] = 0,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundTransparency"] = 1,
		["Font"] = Enum.Font.SourceSansBold,
		["TextSize"] = 20
	})
	v15.UIListLayout = v_u_3.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, 3)
	})
	v15.UIPadding = v_u_3.createElement("UIPadding", {
		["PaddingTop"] = UDim.new(0, 3),
		["PaddingBottom"] = UDim.new(0, 3),
		["PaddingLeft"] = UDim.new(0, 3),
		["PaddingRight"] = UDim.new(0, 3)
	})
	return v_u_3.createElement("ScreenGui", {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 100,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}, v_u_3.createElement("ScrollingFrame", {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Active"] = true,
		["AutomaticCanvasSize"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["CanvasSize"] = nil,
		["ScrollBarThickness"] = 6,
		["BackgroundTransparency"] = nil,
		["Size"] = UDim2.new(0.3333333333333333, 0, v_u_5 and 0.3333333333333333 or 0, v_u_5 and 0 or 25),
		["Position"] = UDim2.new(0, 0, 1, 0),
		["AnchorPoint"] = Vector2.new(0, 1),
		["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
		["BackgroundColor3"] = Color3.fromRGB(50, 50, 50),
		["CanvasSize"] = UDim2.new(0, 0, 0, #v_u_2.Dictionary.keys(v7) * 28),
		["BackgroundTransparency"] = v_u_5 and 0.2 or 1
	}, v15))
end