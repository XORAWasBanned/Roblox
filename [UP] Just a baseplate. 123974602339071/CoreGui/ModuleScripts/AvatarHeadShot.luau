-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AvatarHeadShot
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v3.Colors)
local v7 = v_u_4.PureComponent:extend("AvatarHeadShot")
local v8 = v2:WaitForChild("RobloxGui"):WaitForChild("Modules")
local v_u_9 = require(v8.Common.LegacyThumbnailUrls).Headshot
function v7.render(p10) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_6
	local v11 = p10.props.playerId
	local v12
	if v11 and v11 ~= "" then
		v12 = v_u_9:format(v11, 48, 48)
	else
		v12 = nil
	end
	if not v12 then
		return nil
	end
	local v13 = v_u_4.createElement
	local v14 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Image"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = UDim2.new(0, 48, 0, 48),
		["BackgroundColor3"] = v_u_6.GrayBackground,
		["Image"] = v12
	}
	local v15 = {
		["MaskFrame"] = v_u_4.createElement("ImageLabel", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Image"] = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar mask-90x90.png",
			["ImageColor3"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ImageColor3"] = v_u_6.Carbon
		})
	}
	return v13("ImageLabel", v14, v15)
end
return v5.UNSTABLE_connect2(function(p16, _)
	return {
		["playerId"] = p16.playerId
	}
end)(v7)