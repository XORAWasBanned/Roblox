-- Path: CoreGui.RobloxGui.Modules.Shimmer
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
v1:WaitForChild("RobloxGui")
local v_u_3 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v2.Workspace.Packages.CoreScriptsCommon).Constants
local v_u_6 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0)
local v_u_7 = {}
v_u_7.__index = v_u_7
local v_u_9 = {
	["PrimaryButton"] = function(p8)
		-- upvalues: (copy) v_u_3, (copy) v_u_5
		return v_u_3("ImageLabel")({
			["Name"] = "ShimmerFrame",
			["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
			["BackgroundTransparency"] = 0.7,
			["ClipsDescendants"] = true,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BorderSizePixel"] = 0,
			["Visible"] = false,
			["Parent"] = p8,
			["ZIndex"] = 8,
			v_u_3("ImageLabel")({
				["Name"] = "Shimmer",
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Image"] = nil,
				["BorderSizePixel"] = 0,
				["ZIndex"] = 8,
				["Size"] = UDim2.new(1, 0, 2, 0),
				["Position"] = UDim2.new(-1, 0, 0, 0),
				["Image"] = v_u_5.SHIMMER_TEXTURE
			}),
			v_u_3("ImageLabel")({
				["Name"] = "ShimmerOverlay",
				["ScaleType"] = nil,
				["SliceCenter"] = nil,
				["ImageColor3"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Image"] = nil,
				["Size"] = nil,
				["ZIndex"] = 9,
				["ScaleType"] = Enum.ScaleType.Slice,
				["SliceCenter"] = Rect.new(8, 8, 9, 9),
				["ImageColor3"] = v_u_5.COLORS.FLINT,
				["Image"] = v_u_5.OVERLAY_TEXTURE,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
		})
	end
}
function v_u_7.new(p10, p11) -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	if p11 and v_u_9[p11] then
		local v12 = v_u_7
		local v13 = setmetatable({}, v12)
		v13._shimmer = v_u_9[p11](p10)
		v13._shimmerAnimation = v_u_4:Create(v13._shimmer.Shimmer, v_u_6, {
			["Position"] = UDim2.new(1, 0, 0, 0)
		})
		return v13
	end
end
function v_u_7.play(p14) -- name: play
	p14._shimmer.Visible = true
	p14._shimmerAnimation:Play()
end
function v_u_7.stop(p15) -- name: stop
	p15._shimmerAnimation:Cancel()
	p15._shimmer.Visible = false
end
return v_u_7