-- Path: CoreGui.RobloxGui.Modules.AvatarContextMenu.ThemeHandler
local v1 = game:GetService("InsertService")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = {
	["BackgroundImage"] = "rbxasset://textures/blackBkg_round.png",
	["BackgroundImageScaleType"] = nil,
	["BackgroundImageSliceCenter"] = nil,
	["BackgroundImageTransparency"] = 0,
	["BackgroundTransparency"] = 1,
	["BackgroundColor"] = nil,
	["NameTagColor"] = nil,
	["NameUnderlineColor"] = nil,
	["ButtonFrameColor"] = nil,
	["ButtonFrameTransparency"] = 0,
	["ButtonImage"] = "",
	["ButtonImageScaleType"] = nil,
	["ButtonImageSliceCenter"] = nil,
	["ButtonColor"] = nil,
	["ButtonTransparency"] = 1,
	["ButtonHoverColor"] = nil,
	["ButtonHoverTransparency"] = 0.5,
	["ButtonUnderlineColor"] = nil,
	["Font"] = nil,
	["TextColor"] = nil,
	["TextScale"] = 1,
	["LeaveMenuImage"] = "rbxasset://textures/loading/cancelButton.png",
	["ScrollRightImage"] = "rbxasset://textures/ui/AvatarContextMenu_Arrow.png",
	["ScrollLeftImage"] = "",
	["SelectedCharacterIndicator"] = nil,
	["Size"] = nil,
	["MinSize"] = nil,
	["MaxSize"] = nil,
	["AspectRatio"] = 1.15,
	["AnchorPoint"] = nil,
	["OnScreenPosition"] = nil,
	["OffScreenPosition"] = nil,
	["BackgroundImageScaleType"] = Enum.ScaleType.Slice,
	["BackgroundImageSliceCenter"] = Rect.new(12, 12, 12, 12),
	["BackgroundColor"] = Color3.fromRGB(31, 31, 31),
	["NameTagColor"] = Color3.fromRGB(79, 79, 79),
	["NameUnderlineColor"] = Color3.fromRGB(255, 255, 255),
	["ButtonFrameColor"] = Color3.fromRGB(79, 79, 79),
	["ButtonImageScaleType"] = Enum.ScaleType.Slice,
	["ButtonImageSliceCenter"] = Rect.new(8, 6, 46, 44),
	["ButtonColor"] = Color3.fromRGB(79, 79, 79),
	["ButtonHoverColor"] = Color3.fromRGB(163, 162, 165),
	["ButtonUnderlineColor"] = Color3.fromRGB(137, 137, 137),
	["Font"] = Enum.Font.SourceSansBold,
	["TextColor"] = Color3.fromRGB(255, 255, 255),
	["SelectedCharacterIndicator"] = v1:LoadLocalAsset("rbxasset://models/AvatarContextMenu/AvatarContextArrow.rbxm"),
	["Size"] = UDim2.new(0.95, 0, 0.9, 0),
	["MinSize"] = Vector2.new(200, 200),
	["MaxSize"] = Vector2.new(300, 300),
	["AnchorPoint"] = Vector2.new(0.5, 1),
	["OnScreenPosition"] = UDim2.new(0.5, 0, 0.98, 0),
	["OffScreenPosition"] = UDim2.new(0.5, 0, 1, 300)
}
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.UpdateTheme(p5, p6) -- name: UpdateTheme
	-- upvalues: (copy) v_u_3
	local v7 = {}
	for v8, v9 in pairs(v_u_3) do
		local v10 = p6[v8]
		if typeof(v10) == typeof(v9) then
			v7[v8] = p6[v8]
		elseif p6[v8] == nil then
			v7[v8] = v9
		else
			local v11 = error
			local v12 = string.format
			local v13 = p6[v8]
			v11(v12("AvatarContextMenuTheme wrong type for key %s: %s. Expected type %s", v8, typeof(v13), (typeof(v9))), 2)
		end
	end
	p5.Theme = v7
end
function v_u_4.RegisterCoreMethods(p_u_14) -- name: RegisterCoreMethods
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	v_u_2:RegisterSetCore("AvatarContextMenuTheme", function(p15) -- name: setMenuTheme
		-- upvalues: (ref) v_u_3, (copy) p_u_14
		if type(p15) == "table" then
			for v16 in pairs(p15) do
				if v_u_3[v16] ~= nil then
					continue
				end
				error(string.format("AvatarContextMenuTheme got invalid key: %s", v16))
			end
			p_u_14:UpdateTheme(p15)
		else
			error("AvatarContextMenuTheme argument must be a table")
		end
	end)
end
function v_u_4.GetTheme(p17) -- name: GetTheme
	return p17.Theme
end
function v_u_4.new() -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v18 = v_u_4
	local v19 = setmetatable({}, v18)
	v19.Theme = v_u_3
	v19:RegisterCoreMethods()
	return v19
end
return v_u_4.new()