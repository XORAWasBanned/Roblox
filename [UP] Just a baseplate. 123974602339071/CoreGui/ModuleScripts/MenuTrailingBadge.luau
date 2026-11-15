-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.MenuTrailingBadge
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v4 = require(v2.Packages.Foundation)
local v_u_5 = v4.Badge
local v_u_6 = v4.View
local v_u_7 = v4.Enums.BadgeVariant
local v_u_8 = v4.Enums.BadgeShape
local v9 = require(v2.Packages.Signals)
local v_u_10 = require(v2.Packages.SignalsReact)
local v_u_11 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_12 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableCustomTextInMenuTrailingBadge
local v_u_13 = require(v1.Service)
local v_u_14 = require(v1.Service.LocalStore)
require(v2.Workspace.Packages.Chrome)
local v_u_15 = v9.createSignal(nil)
local v_u_16 = {}
local function v_u_22(p17, p18) -- name: renderBadge
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8
	local v19 = v_u_3.createElement
	local v20 = v_u_6
	local v21 = {
		["Badge"] = v_u_3.createElement(v_u_5, {
			["text"] = p17,
			["variant"] = v_u_7.Emphasis,
			["shape"] = v_u_8.Box
		})
	}
	return v19(v20, {
		["tag"] = "auto-xy",
		["LayoutOrder"] = nil,
		["LayoutOrder"] = p18
	}, v21)
end
return function(p23) -- name: MenuTrailingBadge
	-- upvalues: (copy) v_u_12, (copy) v_u_10, (copy) v_u_15, (copy) v_u_3, (copy) v_u_16, (copy) v_u_14, (copy) v_u_11, (copy) v_u_13, (copy) v_u_22
	local v_u_24 = p23.integrationId
	local v_u_25 = p23.config
	local v_u_26
	if v_u_12 then
		v_u_26 = v_u_10.useSignalState(v_u_25.customText or v_u_15)
	else
		v_u_26 = nil
	end
	local v_u_35, v_u_36 = v_u_3.useState(function()
		-- upvalues: (copy) v_u_24, (copy) v_u_25, (ref) v_u_16, (ref) v_u_14, (copy) v_u_26
		local v27 = v_u_25
		local v28
		if v_u_16[v_u_24] then
			v28 = true
		else
			local v29 = v27.maxViewCount
			if v29 <= 0 then
				v28 = true
			else
				local v30 = v_u_14.getValue(v27.localStorageKey)
				v28 = v29 <= (type(v30) ~= "number" and 0 or v30)
			end
		end
		local v31 = not v28
		if v31 and v_u_26 == nil then
			local v32 = v_u_25
			if v32.maxViewCount <= 0 then
				return v31
			end
			local v33 = v_u_14.getValue(v32.localStorageKey)
			local v34 = type(v33) ~= "number" and 0 or v33
			v_u_14.storeForLocalPlayer(v32.localStorageKey, v34 + 1)
		end
		return v31
	end)
	local v37 = v_u_11({
		["text"] = "Feature.Catalog.Label.New"
	})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_35, (ref) v_u_13, (copy) v_u_24, (ref) v_u_16, (ref) v_u_14, (copy) v_u_25, (copy) v_u_36
		if v_u_35 then
			local v_u_39 = v_u_13:onIntegrationActivated():connect(function(p38)
				-- upvalues: (ref) v_u_24, (ref) v_u_16, (ref) v_u_14, (ref) v_u_25, (ref) v_u_36
				if p38 == v_u_24 then
					v_u_16[v_u_24] = true
					v_u_14.storeForLocalPlayer(v_u_25.localStorageKey, v_u_25.maxViewCount)
					v_u_36(false)
				end
			end)
			return function()
				-- upvalues: (copy) v_u_39
				v_u_39:disconnect()
			end
		end
	end, {
		v_u_24,
		v_u_25.localStorageKey,
		v_u_25.maxViewCount,
		v_u_35
	})
	if v_u_26 == nil then
		if v_u_35 then
			return v_u_22(v37.text, p23.layoutOrder)
		else
			return nil
		end
	else
		return v_u_22(v_u_26, p23.layoutOrder)
	end
end