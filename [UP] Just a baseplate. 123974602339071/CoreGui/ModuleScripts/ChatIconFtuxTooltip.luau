-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.ChatIconFtuxTooltip
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("AppStorageService")
local v_u_5 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_6 = require(v1.Packages.React)
local v_u_7 = require(v1.Packages.Cryo)
local v8 = require(v1.Packages.UIBlox)
local v_u_9 = v8.App.Dialog.TooltipV2.withTooltip
local v_u_10 = v8.App.Dialog.Enum.TooltipOrientation
local _ = require(v1.Workspace.Packages.AppCommonLib).Signal
local v11 = require(v1.Packages.LuauPolyfill)
local v_u_12 = v11.clearTimeout
local v_u_13 = v11.setTimeout
local v_u_14 = {
	["showDelay"] = 1000,
	["dismissDelay"] = 7000,
	["onDismissed"] = nil,
	["onDismissed"] = function(_, _) -- name: onDismissed end
}
return function(p15)
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_6, (copy) v_u_13, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_12, (copy) v_u_9, (copy) v_u_3, (copy) v_u_10
	local v_u_16 = v_u_7.Dictionary.union(v_u_14, p15)
	local v_u_17, v_u_18 = v_u_6.useState(false)
	local v19, v_u_20 = v_u_6.useState(false)
	local v_u_21 = v_u_6.useRef(v_u_13(function() end, v_u_16.showDelay))
	local v_u_22 = v_u_6.useRef(v_u_13(function() end, v_u_16.dismissDelay))
	local v_u_27 = not (v_u_6.useMemo(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_4
		local v23
		if v_u_16.localStorageKey then
			local function v24()
				-- upvalues: (ref) v_u_4, (ref) v_u_16
				return v_u_4:GetItem(v_u_16.localStorageKey)
			end
			local v25, v26 = pcall(v24)
			if v25 then
				return v26 == "true"
			end
			v23 = true
		else
			v23 = false
		end
		return v23
	end, { v_u_16.localStorageKey }) or v19)
	local v_u_28 = v_u_17 and v_u_27
	local v29 = v_u_5({
		["headerText"] = v_u_16.headerKey,
		["bodyText"] = v_u_16.bodyKey
	})
	local v_u_31 = v_u_6.useCallback(function(p30)
		-- upvalues: (copy) v_u_16, (copy) v_u_28, (copy) v_u_20
		if v_u_16.onDismissed then
			v_u_16.onDismissed(v_u_28, p30)
		end
		v_u_20(true)
	end, { v_u_20, v_u_28 })
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_27, (copy) v_u_31, (copy) v_u_16
		local v_u_32 = { v_u_2.MenuOpened:Connect(function()
				-- upvalues: (ref) v_u_27, (ref) v_u_31
				if v_u_27 then
					v_u_31("menuOpened")
				end
			end), v_u_16.iconClickedSignal:connect(function()
				-- upvalues: (ref) v_u_27, (ref) v_u_31
				if v_u_27 then
					v_u_31("chatIconClicked")
				end
			end) }
		return function()
			-- upvalues: (copy) v_u_32
			for _, v33 in v_u_32 do
				if v33.disconnect then
					v33:disconnect()
				else
					if not v33.Disconnect then
						continue
					end
					v33:Disconnect()
				end
			end
		end
	end, {
		v_u_2.MenuOpened,
		v_u_16.iconClickedSignal,
		v_u_27,
		v_u_31
	})
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_21, (copy) v_u_27, (ref) v_u_13, (copy) v_u_18, (copy) v_u_16
		v_u_12(v_u_21.current)
		if v_u_27 then
			v_u_21.current = v_u_13(function()
				-- upvalues: (ref) v_u_27, (ref) v_u_18
				if v_u_27 then
					v_u_18(true)
				end
			end, v_u_16.showDelay)
		end
	end, { v_u_27, v_u_21 })
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_22, (copy) v_u_17, (ref) v_u_13, (copy) v_u_31, (copy) v_u_16
		v_u_12(v_u_22.current)
		if v_u_17 then
			v_u_22.current = v_u_13(function()
				-- upvalues: (ref) v_u_31
				v_u_31("timeout")
			end, v_u_16.dismissDelay)
		end
	end, { v_u_17, v_u_22 })
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_28, (copy) v_u_16, (ref) v_u_4
		if v_u_28 and v_u_16.localStorageKey then
			local function v34()
				-- upvalues: (ref) v_u_4, (ref) v_u_16
				v_u_4:SetItem(v_u_16.localStorageKey, "true")
			end
			pcall(v34)
		end
	end, { v_u_28, v_u_16.localStorageKey })
	return v_u_9({
		["headerText"] = v29.headerText,
		["bodyText"] = v29.bodyText
	}, {
		["DisplayOrder"] = 10,
		["active"] = nil,
		["guiTarget"] = nil,
		["preferredOrientation"] = nil,
		["active"] = v_u_28,
		["guiTarget"] = v_u_3,
		["preferredOrientation"] = v_u_10.Bottom
	}, function(p35)
		-- upvalues: (ref) v_u_6
		return v_u_6.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = 1,
			[v_u_6.Change.AbsoluteSize] = p35,
			[v_u_6.Change.AbsolutePosition] = p35
		})
	end)
end