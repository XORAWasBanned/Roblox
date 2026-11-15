-- Path: CoreGui.RobloxGui.Modules.Watermark.WatermarkComponent
local v1 = game:GetService("CorePackages")
game:GetService("CoreGui")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Packages.Roact)
require(v1.Packages.RoactRodux)
local _ = require(v1.Packages.UIBlox).App.ImageSet.Images
local v4 = v_u_3.PureComponent:extend("WatermarkComponent")
local v_u_5 = game:GetService("PolicyService")
function v4.init(p_u_6) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local function v_u_10() -- name: UpdateWatermarkVisibility
		-- upvalues: (copy) p_u_6, (ref) v_u_2, (ref) v_u_5
		local v7 = p_u_6
		local v8 = {}
		local v9 = not v_u_2:IsStudio()
		if v9 then
			if v_u_5.IsLuobuServer == Enum.TriStateBoolean.True then
				v9 = v_u_5.LuobuWhitelisted == Enum.TriStateBoolean.False
			else
				v9 = false
			end
		end
		v8.watermarkVisible = v9
		v7:setState(v8)
	end
	v_u_5:GetPropertyChangedSignal("IsLuobuServer"):connect(function()
		-- upvalues: (copy) v_u_10
		v_u_10()
	end)
	v_u_5:GetPropertyChangedSignal("LuobuWhitelisted"):connect(function()
		-- upvalues: (copy) v_u_10
		v_u_10()
	end)
	p_u_6:setState({
		["absoluteSize"] = nil,
		["watermarkVisible"] = false,
		["absoluteSize"] = Vector2.new(0, 0)
	})
	function p_u_6.onAbsoluteSizeChange(p11)
		-- upvalues: (copy) p_u_6
		p_u_6:setState({
			["absoluteSize"] = p11.AbsoluteSize
		})
	end
	v_u_10()
end
function v4.render(p_u_12) -- name: render
	-- upvalues: (copy) v_u_3
	local function v27() -- name: CreateGridItems
		-- upvalues: (copy) p_u_12, (ref) v_u_3
		local v13 = (p_u_12.state.absoluteSize.X * 0.9681476403781077 + p_u_12.state.absoluteSize.Y * 0.25038000405444144) / 450
		local v14 = math.ceil(v13)
		local v15 = (p_u_12.state.absoluteSize.Y * 0.9681476403781077 + p_u_12.state.absoluteSize.X * 0.25038000405444144) / 450
		local v16 = {}
		for v17 = 0, math.ceil(v15) - 1 do
			for v18 = 0, v14 - 1 do
				local v19 = v_u_3.createElement
				local v20 = {
					["BackgroundTransparency"] = 1,
					["TextTransparency"] = 0.75,
					["Text"] = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
					["TextSize"] = 30,
					["TextColor3"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = Color3.new(1, 1, 1),
					["Size"] = UDim2.new(0, 225, 0, 225),
					["Position"] = UDim2.new(0, v18 * 450, 0, v17 * 450)
				}
				table.insert(v16, v19("TextLabel", v20))
				local v21 = v_u_3.createElement
				local v22 = {
					["BackgroundTransparency"] = 1,
					["TextTransparency"] = 0.91,
					["Text"] = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
					["TextSize"] = 30,
					["TextColor3"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = Color3.new(0, 0, 0),
					["Size"] = UDim2.new(0, 225, 0, 225),
					["Position"] = UDim2.new(0, v18 * 450 + 1, 0, v17 * 450 + 1)
				}
				table.insert(v16, v21("TextLabel", v22))
				local v23 = v_u_3.createElement
				local v24 = {
					["BackgroundTransparency"] = 1,
					["TextTransparency"] = 0.75,
					["Text"] = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
					["TextSize"] = 30,
					["TextColor3"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = Color3.new(1, 1, 1),
					["Size"] = UDim2.new(0, 225, 0, 225),
					["Position"] = UDim2.new(0, v18 * 450 + 225, 0, v17 * 450 + 225)
				}
				table.insert(v16, v23("TextLabel", v24))
				local v25 = v_u_3.createElement
				local v26 = {
					["BackgroundTransparency"] = 1,
					["TextTransparency"] = 0.91,
					["Text"] = "\228\187\133\231\148\168\228\186\142\230\181\139\232\175\149\239\188\140\n\233\157\158\230\173\163\229\188\143\229\143\145\232\161\168\227\128\130",
					["TextSize"] = 30,
					["TextColor3"] = nil,
					["Size"] = nil,
					["Position"] = nil,
					["TextColor3"] = Color3.new(0, 0, 0),
					["Size"] = UDim2.new(0, 225, 0, 225),
					["Position"] = UDim2.new(0, v18 * 450 + 226, 0, v17 * 450 + 226)
				}
				table.insert(v16, v25("TextLabel", v26))
			end
		end
		return v16
	end
	local v28
	if p_u_12.state.watermarkVisible then
		v28 = v_u_3.createElement("ScreenGui", {
			["IgnoreGuiInset"] = true,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
			["AutoLocalize"] = false,
			["DisplayOrder"] = 10,
			[v_u_3.Change.AbsoluteSize] = p_u_12.onAbsoluteSizeChange
		}, {
			["FullScreenFrame"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Rotation"] = 14.5,
				["Size"] = UDim2.new(0, p_u_12.state.absoluteSize.X * 0.9681476403781077 + p_u_12.state.absoluteSize.Y * 0.25038000405444144, 0, p_u_12.state.absoluteSize.Y * 0.9681476403781077 + p_u_12.state.absoluteSize.X * 0.25038000405444144),
				["Position"] = UDim2.new(0, (p_u_12.state.absoluteSize.X - (p_u_12.state.absoluteSize.X * 0.9681476403781077 + p_u_12.state.absoluteSize.Y * 0.25038000405444144)) * 0.5, 0, (p_u_12.state.absoluteSize.Y - (p_u_12.state.absoluteSize.Y * 0.9681476403781077 + p_u_12.state.absoluteSize.X * 0.25038000405444144)) * 0.5)
			}, (v27()))
		}) or nil
	else
		v28 = nil
	end
	return v28
end
return v4