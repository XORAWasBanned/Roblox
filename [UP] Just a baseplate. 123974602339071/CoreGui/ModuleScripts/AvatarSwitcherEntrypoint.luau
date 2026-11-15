-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.AvatarSwitcher.AvatarSwitcherEntrypoint
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("HttpRbxApiService")
local v_u_4 = game:GetService("HttpService")
local v5 = game:GetService("StarterGui")
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v1.Service)
local v8 = require(v1.ChromeShared.Service.ChromeUtils)
local v9 = v8.MappedSignal
local v10 = require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_11 = require(v1.ChromeShared.Unibar.Constants)
local v_u_12 = require(v1.Integrations.AvatarSwitcher.AvatarSwitcherChromeWrapper)
local v_u_13 = require(v1.Integrations.AvatarSwitcher.AvatarSwitcherIcon)
local v14 = require(v2.Workspace.Packages.Http).Url
local v15 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v16 = require(v2.Workspace.Packages.SharedFlags)
local v17 = v16.FFlagChromeWindowSignalConstraintsToggle
local v18 = v16.FFlagRemoveAvatarSwitcherIfUnsupported
local v19 = v16.FFlagAvatarWorkshopReplacesAvatarSwitcher
local v_u_20 = v9.new(v_u_7:onIntegrationStatusChanged(), function()
	-- upvalues: (copy) v_u_7, (copy) v_u_11
	return v_u_7:isWindowOpen(v_u_11.AVATAR_SWITCHER_ID)
end)
local v_u_21
if v18 then
	v_u_21 = v14.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support"
else
	v_u_21 = nil
end
local v_u_22
if v17 then
	v_u_22 = v10.new(844, 754, false, true)
else
	v_u_22 = v10.new(844, 754, false)
end
local v_u_23 = v5:GetCoreGuiEnabled(Enum.CoreGuiType.All) or v5:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher)
local v24 = {
	["initialAvailability"] = nil,
	["id"] = nil,
	["label"] = nil,
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["cachePosition"] = true,
	["draggable"] = true,
	["windowSize"] = nil,
	["components"] = nil
}
local v25
if v_u_23 and not v18 then
	v25 = v_u_7.AvailabilitySignal.Available
else
	v25 = v_u_7.AvailabilitySignal.Unavailable
end
v24.initialAvailability = v25
v24.id = v_u_11.AVATAR_SWITCHER_ID
v24.label = v19 and "CommonUI.Features.Label.Avatar" or "Feature.AvatarSwitcher.Heading.SwitchAvatar"
v24.sideSheetPlacement = v15.AboveFold
function v24.activated(_) -- name: activated
	-- upvalues: (copy) v_u_7, (copy) v_u_11
	v_u_7:toggleWindow(v_u_11.AVATAR_SWITCHER_ID)
end
v24.isActivated = v_u_20
v24.windowSize = v_u_22
v24.components = {
	["Icon"] = function() -- name: Icon
		-- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_20
		local v26 = {
			["isActive"] = v_u_20
		}
		return v_u_6.createElement(v_u_13, v26)
	end,
	["Window"] = function() -- name: Window
		-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_22
		local v27 = {
			["windowSize"] = nil,
			["maxWindowWidth"] = 844,
			["maxWindowHeight"] = 754,
			["windowSize"] = v_u_22
		}
		return v_u_6.createElement(v_u_12, v27)
	end
}
local v_u_28 = v_u_7:register(v24)
local v_u_29 = not v18
v8.setCoreGuiAvailability(v_u_28, Enum.CoreGuiType.AvatarSwitcher, function(p30)
	-- upvalues: (ref) v_u_23, (ref) v_u_29, (copy) v_u_28, (copy) v_u_7, (copy) v_u_11
	v_u_23 = p30
	if v_u_23 and v_u_29 then
		v_u_28.availability:available()
	else
		if v_u_7:isWindowOpen(v_u_11.AVATAR_SWITCHER_ID) then
			v_u_7:toggleWindow(v_u_11.AVATAR_SWITCHER_ID)
		end
		v_u_28.availability:unavailable()
	end
end)
if v18 then
	task.spawn(function()
		-- upvalues: (copy) v_u_3, (copy) v_u_21, (copy) v_u_4, (ref) v_u_29, (ref) v_u_23, (copy) v_u_28, (copy) v_u_7, (copy) v_u_11
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local function v31()
			-- upvalues: (ref) v_u_3, (ref) v_u_21, (ref) v_u_4
			return v_u_4:JSONDecode((v_u_3:GetAsyncFullUrl(v_u_21)))
		end
		local v32, v33 = pcall(v31)
		if v32 and (v33 and v33.experienceAvatarSupportType ~= 0) then
			v_u_29 = true
			if v_u_23 and v_u_29 then
				v_u_28.availability:available()
				return
			end
			if v_u_7:isWindowOpen(v_u_11.AVATAR_SWITCHER_ID) then
				v_u_7:toggleWindow(v_u_11.AVATAR_SWITCHER_ID)
			end
			v_u_28.availability:unavailable()
		end
	end)
end
return v_u_28