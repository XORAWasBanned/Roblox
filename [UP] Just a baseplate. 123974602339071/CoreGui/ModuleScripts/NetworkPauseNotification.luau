-- Path: CoreGui.RobloxGui.Modules.NetworkPauseNotification
local v_u_1 = UDim2.new(1.1, 0, 1.1, 0)
local v_u_2 = UDim2.new(0.9, 0, 0.9, 0)
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Workspace.Packages.Style).AppFonts
local v_u_6 = require(v4.Workspace.Packages.RobloxTranslator)
local v_u_7 = require(v4.Workspace.Packages.AppCommonLib).Create
local v_u_8 = TweenInfo.new(0.15, Enum.EasingStyle.Sine)
local v_u_9 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v_u_10 = game:DefineFastFlag("LocalizeGameplayPaused", false)
local function v_u_11() -- name: build
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_5, (copy) v_u_10, (copy) v_u_6
	return v_u_7("ImageLabel")({
		["Name"] = "NetworkPause",
		["Image"] = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png",
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 8, 12, 12),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["ImageColor3"] = Color3.fromRGB(122, 122, 122),
		["ImageTransparency"] = 0,
		["BackgroundTransparency"] = 1,
		v_u_7("UISizeConstraint")({
			["MaxSize"] = Vector2.new(312, 251)
		}),
		v_u_7("UIPadding")({
			["PaddingTop"] = UDim.new(0, 24),
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24),
			["PaddingBottom"] = UDim.new(0, 24)
		}),
		v_u_7("Frame")({
			["Name"] = "Accent",
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 0,
			["BackgroundColor3"] = Color3.fromRGB(66, 66, 66),
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 0, 88)
		}),
		v_u_7("Frame")({
			["Name"] = "Upper",
			["Size"] = UDim2.new(1, 0, 0, 88),
			["BackgroundTransparency"] = 1,
			v_u_7("Frame")({
				["Name"] = "IconContainer",
				["Size"] = UDim2.new(0, 40, 0, 37),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 0),
				["BackgroundTransparency"] = 1,
				v_u_7("ImageLabel")({
					["Name"] = "Icon",
					["BackgroundTransparency"] = 1,
					["Image"] = "rbxasset://textures/ui/NetworkPause/no connection.png",
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["ImageTransparency"] = 0,
					["Size"] = v_u_2,
					["Position"] = UDim2.new(0.5, 0, 0.88, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.88)
				})
			}),
			v_u_7("TextLabel")({
				["Name"] = "Label",
				["Font"] = nil,
				["Text"] = nil,
				["TextSize"] = 22,
				["TextWrapped"] = true,
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["TextColor3"] = nil,
				["TextTransparency"] = 0,
				["Font"] = v_u_5.default:getBold(),
				["Text"] = v_u_10 and v_u_6:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused",
				["Size"] = UDim2.new(1, 0, 0, 22),
				["Position"] = UDim2.new(0, 0, 0, 54),
				["TextColor3"] = Color3.fromRGB(255, 255, 255)
			})
		}),
		v_u_7("TextLabel")({
			["Name"] = "Lower",
			["Font"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextSize"] = 18,
			["TextWrapped"] = true,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["TextTransparency"] = 0,
			["Font"] = v_u_5.default:getDefault(),
			["Text"] = v_u_10 and v_u_6:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.",
			["TextColor3"] = Color3.fromRGB(190, 190, 190),
			["Position"] = UDim2.new(0, 0, 0, 89),
			["Size"] = UDim2.new(1, 0, 1, -89)
		})
	})
end
local v_u_12 = {}
v_u_12.__index = v_u_12
function v_u_12.new() -- name: new
	-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_1
	local v13 = v_u_12
	local v14 = setmetatable({}, v13)
	local v15 = v_u_11()
	local v16 = v_u_3:Create(v15, v_u_8, {
		["ImageTransparency"] = 0
	})
	local v17 = v_u_3:Create(v15, v_u_8, {
		["ImageTransparency"] = 1
	})
	local v18 = {
		["Size"] = nil,
		["ImageTransparency"] = 0.75,
		["Size"] = v_u_1
	}
	local v19 = v_u_3:Create(v15.Upper.IconContainer.Icon, v_u_9, v18)
	v14.__gui = v15
	v14.__guiParent = nil
	v14.__show = false
	v14.__animations = {
		["show"] = v16,
		["hide"] = v17,
		["pulse"] = v19
	}
	return v14
end
function v_u_12.Show(p20) -- name: Show
	-- upvalues: (copy) v_u_2
	p20.__gui.Upper.IconContainer.Icon.Size = v_u_2
	p20.__gui.Upper.IconContainer.Icon.ImageTransparency = 0
	p20.__show = true
	p20.__gui.Parent = p20.__guiParent
	p20.__animations.pulse:Play()
end
function v_u_12.Hide(p21) -- name: Hide
	p21.__show = false
	p21.__gui.Parent = nil
	p21.__animations.pulse:Cancel()
end
function v_u_12.SetParent(p22, p23) -- name: SetParent
	p22.__guiParent = p23
	if p22.__show then
		p22.__gui.Parent = p23
	end
end
return v_u_12