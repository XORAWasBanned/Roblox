-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.AvatarSwitcher.AvatarSwitcherChromeWrapper
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = v3:WaitForChild("RobloxGui")
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Packages.ReactUtils).useEventConnection
local v_u_8 = require(v2.Packages.Foundation)
local v_u_9 = require(v1.Service)
local v_u_10 = require(v1.ChromeShared.Service.ViewportUtil)
require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_11 = require(v1.ChromeShared.Unibar.Constants)
local v_u_12 = require(v2.Workspace.Packages.AvatarSwitcher).Components.AvatarSwitcherContainer
local v_u_13 = require(v2.Workspace.Packages.SharedFlags).FFlagAvatarWorkshopReplacesAvatarSwitcher
local v_u_14
if v_u_13 then
	v_u_14 = require(v2.Workspace.Packages.AvatarWorkshop).Components.AvatarWorkshopWindow
else
	v_u_14 = nil
end
return function(p_u_15) -- name: AvatarSwitcherChromeWrapper
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_10, (copy) v_u_13, (copy) v_u_14, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12
	local v_u_16 = p_u_15.windowSize
	local v17 = v_u_6.useState
	local v18 = v_u_16:get()
	local v19, v_u_20 = v17(v18.X.Offset / v18.Y.Offset < 1.2)
	local v21, v_u_22 = v_u_6.useState(false)
	local v23 = require(v_u_5.Modules.Settings.SettingsHub)
	local v_u_33 = v_u_6.useCallback(function(p24)
		-- upvalues: (ref) v_u_4, (copy) p_u_15, (copy) v_u_16, (copy) v_u_22
		local v25 = v_u_4.TopbarInset.Max.Y
		local v26 = p24.X < p_u_15.maxWindowWidth and true or p24.Y - v25 < p_u_15.maxWindowHeight
		if v26 then
			v_u_16:requestSize(p24.X, p24.Y - v25)
		else
			local v27 = v_u_16
			local v28 = p_u_15.maxWindowWidth
			local v29 = p24.X
			local v30 = math.min(v28, v29)
			local v31 = p_u_15.maxWindowHeight
			local v32 = p24.Y - v25
			v27:requestSize(v30, (math.min(v31, v32)))
		end
		v_u_22(v26)
	end, {
		v_u_16,
		p_u_15.maxWindowWidth,
		p_u_15.maxWindowHeight,
		v21
	})
	v_u_7(v_u_4:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: (copy) v_u_33, (ref) v_u_10
		v_u_33(v_u_10.screenSize:get())
	end)
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_33, (copy) v_u_16, (copy) v_u_20
		local v_u_34 = v_u_10.screenSize:connect(v_u_33)
		local v_u_36 = v_u_16:connect(function(p35)
			-- upvalues: (ref) v_u_20
			v_u_20(p35.X.Offset / p35.Y.Offset < 1.2)
		end)
		v_u_33(v_u_10.screenSize:get())
		return function()
			-- upvalues: (copy) v_u_34, (copy) v_u_36
			v_u_34:disconnect()
			v_u_36:disconnect()
		end
	end, { v_u_33 })
	if not (v_u_13 and v_u_14) then
		return v_u_6.createElement(v_u_8.View, {
			["tag"] = ("size-full %*"):format(v21 and "padding-x-large padding-top-medium padding-bottom-xlarge" or "")
		}, {
			["AvatarSwitcherContainer"] = v_u_6.createElement(v_u_12, {
				["getRespawnBehaviour"] = v23.GetRespawnBehaviour,
				["respawnBehaviorChangedEvent"] = v23.RespawnBehaviourChangedEvent,
				["toggleWindow"] = function() -- name: toggleWindow
					-- upvalues: (ref) v_u_9, (ref) v_u_11
					v_u_9:toggleWindow(v_u_11.AVATAR_SWITCHER_ID)
				end,
				["verticalLayout"] = v19
			})
		})
	end
	local v37 = v_u_6.createElement
	local v38 = v_u_8.View
	local v39 = {}
	local v40 = {
		["verticalLayout"] = v19,
		["onClose"] = function() -- name: onClose
			-- upvalues: (ref) v_u_9, (ref) v_u_11
			v_u_9:toggleWindow(v_u_11.AVATAR_SWITCHER_ID)
		end
	}
	v39.AvatarWorkshopWindow = v_u_6.createElement(v_u_14, v40)
	return v37(v38, {
		["tag"] = {
			["size-full"] = true,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = v21
		}
	}, v39)
end