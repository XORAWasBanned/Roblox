-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.CommonFtuxTooltip
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_6 = require(v2.Packages.React)
local v_u_7 = require(v2.Packages.Cryo)
local v_u_8 = require(v1.Service)
local v_u_9 = require(v1.ChromeShared.Service.LocalStore)
local v_u_10 = require(v1.ChromeShared.Unibar.Tooltips.TooltipContext)
require(v1.ChromeShared.Unibar.Tooltips.TooltipProvider)
local v_u_11 = require(v1.ChromeShared.Unibar.Tooltips.useIsTooltipTurn)
local v_u_12 = require(v1.Parent.TopBar.Components.Presentation.menuIconHoveredSignal)
local v_u_13 = require(v1.Integrations.FtuxTooltipAnchor)
local v_u_14 = {
	["id"] = nil,
	["priority"] = 1,
	["showDelay"] = 3000,
	["dismissDelay"] = 5000,
	["onDismissed"] = nil,
	["onDismissed"] = function(_, _) -- name: onDismissed end
}
local function v_u_38(p_u_15)
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_11, (copy) v_u_9, (copy) v_u_5, (copy) v_u_4, (copy) v_u_14, (copy) v_u_8, (copy) v_u_3, (copy) v_u_12, (copy) v_u_13
	local v_u_16 = v_u_6.useRef(nil)
	local v_u_17, _ = v_u_6.useState(false)
	local v_u_18, v_u_19 = v_u_6.useState(false)
	local v_u_20 = v_u_6.useContext(v_u_10)
	local v21 = v_u_11(p_u_15.id) or false
	local v23 = v_u_6.useMemo(function()
		-- upvalues: (copy) p_u_15, (ref) v_u_9
		local v22
		if p_u_15.localStorageKey then
			v22 = v_u_9.getValue(p_u_15.localStorageKey) or false
		else
			v22 = false
		end
		return v22
	end, { p_u_15.localStorageKey })
	local v_u_24 = p_u_15.isIconVisible
	if v_u_24 then
		v_u_24 = not v23
		if v_u_24 then
			v_u_24 = not v_u_18
		end
	end
	local v_u_25 = v_u_24 and v21
	local v26 = v_u_5({
		["headerText"] = p_u_15.headerKey,
		["bodyText"] = p_u_15.bodyKey
	})
	local v_u_28 = v_u_6.useCallback(function(p27)
		-- upvalues: (copy) p_u_15, (copy) v_u_25, (copy) v_u_19, (copy) v_u_20
		if p_u_15.onDismissed then
			p_u_15.onDismissed(v_u_25, p27)
		end
		v_u_19(true)
		if v_u_20 and p_u_15.id then
			v_u_20.dismissTooltip(p_u_15.id, p27)
		end
	end, { v_u_19, v_u_25 })
	v_u_6.useEffect(function()
		-- upvalues: (copy) p_u_15, (copy) v_u_17, (copy) v_u_18, (ref) v_u_4, (copy) v_u_16, (copy) v_u_24, (copy) v_u_28
		local v_u_29
		if p_u_15.dismissOnOutsideInput and (v_u_17 and not v_u_18) then
			v_u_29 = v_u_4.InputBegan:Connect(function(p30)
				-- upvalues: (ref) v_u_16, (ref) v_u_24, (ref) v_u_28
				if (p30.UserInputType == Enum.UserInputType.Touch or p30.UserInputType == Enum.UserInputType.MouseButton1) and v_u_16.current ~= nil then
					local v31 = p30.Position
					local v32 = v_u_16.current.AbsolutePosition
					local v33 = v_u_16.current.AbsoluteSize
					if v_u_24 and (v31.X < v32.X or (v31.X > v32.X + v33.X or (v31.Y < v32.Y or v31.Y > v32.Y + v33.Y))) then
						v_u_28("outsideInput")
					end
				end
			end)
		else
			v_u_29 = nil
		end
		return function()
			-- upvalues: (ref) v_u_29
			if v_u_29 then
				v_u_29:Disconnect()
				v_u_29 = nil
			end
		end
	end, { v_u_18, v_u_17, v_u_24 })
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_20, (copy) p_u_15, (copy) v_u_24, (ref) v_u_14
		if v_u_20 and (p_u_15.id and v_u_24) then
			v_u_20.registerTooltip(p_u_15.id, p_u_15.priority, p_u_15.showDelay or v_u_14.showDelay, p_u_15.dismissDelay or v_u_14.dismissDelay)
		end
		return function()
			-- upvalues: (ref) v_u_20, (ref) p_u_15, (ref) v_u_24
			if v_u_20 and (p_u_15.id and v_u_24) then
				v_u_20.unregisterTooltip(p_u_15.id)
			end
		end
	end, { v_u_24, p_u_15.id })
	local v34 = {
		v_u_8,
		v_u_3,
		v_u_12,
		v_u_24,
		v_u_28
	}
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_8, (copy) v_u_24, (copy) v_u_28, (ref) v_u_3, (ref) v_u_12
		local v_u_36 = {
			v_u_8:onIntegrationActivated():connect(function()
				-- upvalues: (ref) v_u_24, (ref) v_u_28
				if v_u_24 then
					v_u_28("unibarActivated")
				end
			end),
			v_u_8:onIntegrationHovered():connect(function()
				-- upvalues: (ref) v_u_24, (ref) v_u_28
				if v_u_24 then
					v_u_28("unibarHovered")
				end
			end),
			v_u_3.MenuOpened:Connect(function()
				-- upvalues: (ref) v_u_24, (ref) v_u_28
				if v_u_24 then
					v_u_28("menuOpened")
				end
			end),
			v_u_12:connect(function(p35)
				-- upvalues: (ref) v_u_24, (ref) v_u_28
				if v_u_24 and p35 then
					v_u_28("menuIconHovered")
				end
			end)
		}
		return function()
			-- upvalues: (copy) v_u_36
			for _, v37 in v_u_36 do
				if v37.disconnect then
					v37:disconnect()
				else
					if not v37.Disconnect then
						continue
					end
					v37:Disconnect()
				end
			end
		end
	end, v34)
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_25, (copy) p_u_15, (ref) v_u_9
		if v_u_25 and p_u_15.localStorageKey then
			v_u_9.storeForLocalPlayer(p_u_15.localStorageKey, true)
		end
	end, { v_u_25, p_u_15.localStorageKey })
	return v_u_6.createElement(v_u_13, {
		["ref"] = v_u_16,
		["bodyText"] = v26.bodyText,
		["headerText"] = v26.headerText,
		["shouldShowTooltip"] = v_u_25
	})
end
return function(p39)
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_6, (copy) v_u_38
	local v40 = v_u_7.Dictionary.union(v_u_14, p39)
	return v_u_6.createElement(v_u_38, v40)
end