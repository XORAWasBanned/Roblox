-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadNavigationDialog.GamepadNavigationDialogShowCounter
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("AppStorageService")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = require(v1.Packages.React)
require(v1.Packages.UIBlox)
local v_u_5 = require(script.Parent.GamepadNavigationDialog)
v_u_4.PureComponent:extend("GamepadNavigationDialogShowCounter")
local function v_u_16(p6, p7) -- name: shouldShowBasedOnCountInAppStorage
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_8 = v_u_2:GetItem(p6)
	local v9 = v_u_2:GetItem("UserId")
	local function v10()
		-- upvalues: (ref) v_u_3, (copy) v_u_8
		return v_u_3:JSONDecode(v_u_8)
	end
	local v11, v12 = pcall(v10)
	local v13 = (not v11 or type(v12) ~= "table") and {} or v12
	local v14 = v13[v9]
	local v15 = type(v14) ~= "number" and 0 or v14
	v13[v9] = v15 + 1
	return v15 < p7, v_u_3:JSONEncode(v13)
end
local function v_u_21(p_u_17) -- name: GamepadNavigationDialogTextButton
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	v_u_4.useEffect(function()
		-- upvalues: (copy) p_u_17
		return p_u_17.onCleanup
	end, {})
	local v18 = v_u_4.createElement
	local v19 = {
		["Text"] = "",
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 1, 0),
		[v_u_4.Event.Activated] = p_u_17.onDismissed
	}
	local v20 = {
		["GamepadNavigationDialog"] = v_u_4.createElement(v_u_5, {
			["selectButtonDismissesGamepadNavigationDialog"] = p_u_17.selectButtonDismissesGamepadNavigationDialog,
			["onDismissed"] = p_u_17.onDismissed
		})
	}
	return v18("TextButton", v19, v20)
end
return function(p_u_22) -- name: GamepadNavigationDialogShowCounter
	-- upvalues: (copy) v_u_16, (copy) v_u_4, (copy) v_u_21, (copy) v_u_2
	if p_u_22.isGamepadNavigationDialogEnabled and p_u_22.isGamepadNavigationDialogOpen then
		local v23, v_u_24 = v_u_16(p_u_22.appStorageKey, p_u_22.maxShownCount)
		if v23 then
			return v_u_4.createElement(v_u_21, {
				["selectButtonDismissesGamepadNavigationDialog"] = p_u_22.selectButtonDismissesGamepadNavigationDialog,
				["onDismissed"] = function() -- name: onDismissed
					-- upvalues: (copy) p_u_22
					p_u_22.SetGamepadNavigationDialogOpen(false)
				end,
				["onCleanup"] = function() -- name: onCleanup
					-- upvalues: (ref) v_u_2, (copy) p_u_22, (copy) v_u_24
					v_u_2:SetItem(p_u_22.appStorageKey, v_u_24)
					v_u_2:Flush()
				end
			})
		else
			return nil
		end
	else
		return nil
	end
end