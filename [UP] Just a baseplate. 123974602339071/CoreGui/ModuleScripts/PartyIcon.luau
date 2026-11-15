-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.PartyIcon
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.ChromeShared.Unibar.Constants)
local v4 = require(v1.ChromeShared.Flags)
local v_u_5 = require(v2.Packages.Foundation)
local v_u_6 = require(v2.Packages.React)
local v7 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_8 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_9 = require(v1.Integrations.Party.usePartyIcon)
local v_u_10 = v7.MappedSignal
local v_u_11 = v_u_5.Hooks.useTokens
local v_u_12 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_13 = require(v1.ChromeShared.Unibar.SubMenuContext)
local v_u_14 = require(v2.Workspace.Packages.AppChat.InExperienceAppChatModal)
local v_u_15 = v4.FFlagTokenizeUnibarConstantsWithStyleProvider
return function() -- name: PartyIcon
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_12, (copy) v_u_3, (copy) v_u_10, (copy) v_u_14, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_13, (copy) v_u_5
	local v16 = v_u_11()
	local v17
	if v_u_15 then
		v17 = v_u_12.use().ICON_SIZE
	else
		v17 = v_u_3.ICON_SIZE
	end
	local v18 = v_u_9(v17, 24, v_u_8((v_u_10.new(v_u_14.default.visibilitySignal.Event, function(_)
		-- upvalues: (ref) v_u_14
		return v_u_14:getVisible()
	end))) and "icons/menu/2-person-with-bubble-on" or "icons/menu/2-person-with-bubble")
	local v19 = v_u_6.useContext(v_u_13)
	local v20 = v_u_6.createElement
	local v21 = v_u_5.View
	local v22 = {
		["Size"] = UDim2.new(0, v17, 0, v17)
	}
	local v23 = {}
	local v24 = v_u_6.createElement
	local v25 = v_u_5.Image
	local v27 = {
		["Size"] = nil,
		["backgroundStyle"] = nil,
		["Image"] = nil,
		["imageStyle"] = nil,
		["tag"] = "anchor-center-center position-center-center radius-circle",
		["Size"] = v18.size:map(function(p26)
			return UDim2.fromOffset(p26, p26)
		end)
	}
	local v28
	if v18.image.backgroundColor then
		v28 = {
			["Color3"] = v18.image.backgroundColor
		}
		local v29
		if v19 then
			local v_u_30 = 0
			v29 = v19:map(function(p31)
				-- upvalues: (copy) v_u_30
				return v_u_30 + (1 - v_u_30) * (1 - p31)
			end)
		else
			v29 = 0
		end
		v28.Transparency = v29
	else
		v28 = v16.Color.None
	end
	v27.backgroundStyle = v28
	v27.Image = v18.image.thumbnail
	local v32 = {
		["Color3"] = v16.Color.Content.Emphasis.Color3
	}
	local v_u_33 = v16.Color.Content.Emphasis.Transparency
	if v19 then
		v_u_33 = v19:map(function(p34)
			-- upvalues: (copy) v_u_33
			return v_u_33 + (1 - v_u_33) * (1 - p34)
		end)
	end
	v32.Transparency = v_u_33
	v27.imageStyle = v32
	v23.Icon = v24(v25, v27)
	local v35 = v_u_6.createElement
	local v36 = v_u_5.View
	local v37 = {
		["Position"] = nil,
		["backgroundStyle"] = nil,
		["stroke"] = nil,
		["tag"] = "anchor-top-right radius-circle size-200 stroke-thicker",
		["ZIndex"] = 2,
		["Position"] = UDim2.new(1, -v16.Stroke.Thicker, 0, v16.Stroke.Thicker)
	}
	local v38 = {
		["Color3"] = v16.Color.System.Success.Color3
	}
	local v_u_39 = v16.Color.System.Success.Transparency
	if v19 then
		v_u_39 = v19:map(function(p40)
			-- upvalues: (copy) v_u_39
			return v_u_39 + (1 - v_u_39) * (1 - p40)
		end)
	end
	v38.Transparency = v_u_39
	v37.backgroundStyle = v38
	local v41 = {
		["Color"] = v16.Color.Surface.Surface_0.Color3
	}
	local v_u_42 = v16.Color.Surface.Surface_0.Transparency
	if v19 then
		v_u_42 = v19:map(function(p43)
			-- upvalues: (copy) v_u_42
			return v_u_42 + (1 - v_u_42) * (1 - p43)
		end)
	end
	v41.Transparency = v_u_42
	v41.Thickness = v16.Stroke.Thicker
	v37.stroke = v41
	v23.Badge = v35(v36, v37)
	return v20(v21, v22, v23)
end