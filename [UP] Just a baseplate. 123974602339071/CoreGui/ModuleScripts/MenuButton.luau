-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MenuButtons.MenuButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("UserInputService")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Settings.Utility)
local v_u_6 = require(v1.Packages.React)
local v7 = require(v1.Packages.Foundation)
local v_u_8 = require(v1.Workspace.Packages.Responsive)
local v_u_9 = v7.Hooks.useTokens
local v_u_10 = v7.View
local v_u_11 = v7.Text
local v_u_12 = v7.Image
local v_u_13 = v7.Enums.PopoverSide
local v_u_14 = require(v4.Modules.Settings.Components.Traversal.TraversalHistoryMenu)
local v15 = require(v1.Workspace.Packages.SharedFlags)
local v_u_16 = require(v4.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local v_u_17 = require(v4.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local v_u_18 = game:DefineFastFlag("MenuButtonsIncreaseIconSize", false)
local v_u_19 = require(v4.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons)
local v_u_20 = v15.FFlagGamepadIconSupportCheck
local function v_u_37(p21, p22) -- name: KeyLabelIcon
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_10, (copy) v_u_11
	local v23 = v_u_9()
	local v24 = v_u_6.createElement
	local v25 = v_u_10
	local v26 = {
		["LayoutOrder"] = 1,
		["backgroundStyle"] = nil,
		["tag"] = "size-1000-700 row align-x-center align-y-center radius-medium"
	}
	local v27 = {
		["Color3"] = v23.Color.ActionStandard.Background.Color3
	}
	local v28
	if p22 then
		local v29 = v23.Color.ActionStandard.Background.Transparency
		v28 = v29 + (1 - v29) * 0.5
	else
		v28 = v23.Color.ActionStandard.Background.Transparency
	end
	v27.Transparency = v28
	v26.backgroundStyle = v27
	local v30 = {}
	local v31 = v_u_6.createElement
	local v32 = v_u_11
	local v33 = {
		["Text"] = nil,
		["textStyle"] = nil,
		["tag"] = "text-title-small",
		["Text"] = p21
	}
	local v34 = {
		["Color3"] = v23.Color.ActionStandard.Foreground.Color3
	}
	local v35
	if p22 then
		local v36 = v23.Color.ActionStandard.Foreground.Transparency
		v35 = v36 + (1 - v36) * 0.5
	else
		v35 = v23.Color.ActionStandard.Foreground.Transparency
	end
	v34.Transparency = v35
	v33.textStyle = v34
	v30.HotkeyText = v31(v32, v33)
	return v24(v25, v26, v30)
end
local function v_u_51(p38) -- name: Hint
	-- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_8, (copy) v_u_18, (copy) v_u_6, (copy) v_u_12, (copy) v_u_37
	if v_u_17 == 2 and v_u_5:IsSmallTouchScreen() then
		return nil
	end
	if p38.lastInput ~= v_u_8.Input.Pointer and p38.lastInput ~= v_u_8.Input.Directional then
		if p38.lastInput == v_u_8.Input.Pointer then
			return v_u_37(p38.keyboardHint, p38.isDisabled)
		end
		if p38.lastInput ~= v_u_8.Input.Directional then
			return nil
		end
		local v39 = v_u_6.createElement
		local v40 = v_u_12
		local v41 = {
			["Image"] = p38.gamepadButtonImageHint,
			["imageStyle"] = {
				["Color3"] = p38.foregroundStyle.Color3,
				["Transparency"] = p38.isDisabled and 0.5 or p38.foregroundStyle.Transparency
			},
			["tag"] = {
				["size-600"] = not p38.isSmall,
				["size-500"] = p38.isSmall
			}
		}
		return v39(v40, v41)
	end
	local v42 = v_u_18
	if v42 then
		v42 = p38.lastInput ~= v_u_8.Input.Directional
	end
	local v43 = v_u_6.createElement
	local v44 = v_u_12
	local v45 = {}
	local v46
	if p38.lastInput == v_u_8.Input.Directional then
		v46 = p38.gamepadButtonImageHint
	else
		v46 = p38.keyboardButtonImageHint
	end
	v45.Image = v46
	v45.imageStyle = {
		["Color3"] = p38.foregroundStyle.Color3,
		["Transparency"] = p38.isDisabled and 0.5 or p38.foregroundStyle.Transparency
	}
	local v47 = {}
	local v48 = not v42
	if v48 then
		v48 = p38.isSmall
	end
	v47["size-700"] = v48
	local v49 = not v42
	if v49 then
		v49 = not p38.isSmall
	end
	v47["size-800"] = v49
	local v50
	if v42 then
		v50 = p38.isSmall
	else
		v50 = v42
	end
	v47["size-900"] = v50
	if v42 then
		v42 = not p38.isSmall
	end
	v47["size-1000"] = v42
	v45.tag = v47
	return v43(v44, v45)
end
local function v_u_56(p52) -- name: ButtonText
	-- upvalues: (copy) v_u_6, (copy) v_u_11
	local v53 = v_u_6.createElement
	local v54 = v_u_11
	local v55 = {
		["Text"] = nil,
		["LayoutOrder"] = 2,
		["textStyle"] = nil,
		["tag"] = nil,
		["Text"] = p52.text,
		["textStyle"] = {
			["Color3"] = p52.foregroundStyle.Color3,
			["Transparency"] = p52.isDisabled and 0.5 or p52.foregroundStyle.Transparency
		},
		["tag"] = {
			["auto-x"] = true,
			["text-title-medium"] = not p52.isSmall,
			["text-title-small"] = p52.isSmall,
			["content-action-standard"] = not p52.isEmphasized,
			["content-action-soft-emphasis"] = p52.isEmphasized
		}
	}
	return v53(v54, v55)
end
local function v_u_59(p57, p58) -- name: supportsButton
	-- upvalues: (copy) v_u_20, (copy) v_u_8, (copy) v_u_3
	return (not v_u_20 or (not p58 or p57 ~= v_u_8.Input.Directional)) and true or v_u_3:GamepadSupports(v_u_3:GetLastInputType(), p58)
end
return v_u_6.memo(function(p_u_60) -- name: MenuButton
	-- upvalues: (copy) v_u_9, (copy) v_u_19, (copy) v_u_16, (copy) v_u_6, (copy) v_u_59, (copy) v_u_20, (copy) v_u_3, (copy) v_u_18, (copy) v_u_8, (copy) v_u_10, (copy) v_u_51, (copy) v_u_56, (copy) v_u_17, (copy) v_u_5, (copy) v_u_12, (copy) v_u_37, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13
	local v61 = v_u_9()
	local v62
	if v_u_19 then
		v62 = p_u_60.buttonRef
	elseif v_u_16 then
		v62 = v_u_6.useRef(nil)
	else
		v62 = nil
	end
	local v63
	if p_u_60.isEmphasized then
		v63 = v61.Color.ActionSoftEmphasis.Background
	else
		v63 = v61.Color.ActionStandard.Background
	end
	local v64
	if p_u_60.isEmphasized then
		v64 = v61.Color.ActionSoftEmphasis.Foreground
	else
		v64 = v61.Color.ActionStandard.Foreground
	end
	local v65, v_u_66 = v_u_6.useState(v_u_59(p_u_60.lastInput, p_u_60.gamepadButton))
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_20, (copy) p_u_60, (ref) v_u_3, (copy) v_u_66, (ref) v_u_59
		local v_u_67
		if v_u_20 and p_u_60.gamepadButton then
			v_u_67 = v_u_3.LastInputTypeChanged:Connect(function()
				-- upvalues: (ref) v_u_66, (ref) v_u_59, (ref) p_u_60
				v_u_66(v_u_59(p_u_60.lastInput, p_u_60.gamepadButton))
			end)
		else
			v_u_67 = nil
		end
		return function()
			-- upvalues: (ref) v_u_67
			if v_u_67 then
				v_u_67:Disconnect()
			end
		end
	end, { p_u_60.gamepadButton, p_u_60.lastInput })
	local v68 = v_u_18
	if v68 then
		v68 = p_u_60.lastInput ~= v_u_8.Input.Directional
	end
	local v69 = v_u_6.createElement
	local v70 = v_u_10
	local v71 = {
		["onActivated"] = p_u_60.onActivated,
		["isDisabled"] = p_u_60.isDisabled,
		["LayoutOrder"] = p_u_60.layoutOrder
	}
	local v72 = {
		["Color3"] = v63.Color3
	}
	local v73
	if p_u_60.isDisabled then
		local v74 = v63.Transparency
		v73 = v74 + (1 - v74) * 0.5
	else
		v73 = v63.Transparency
	end
	v72.Transparency = v73
	v71.backgroundStyle = v72
	v71.tag = {
		["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true,
		["size-0-1200"] = not p_u_60.isSmall,
		["size-0-1000"] = p_u_60.isSmall,
		["bg-action-standard"] = not p_u_60.isEmphasized,
		["bg-action-soft-emphasis"] = p_u_60.isEmphasized
	}
	local v75
	if v_u_16 or v_u_19 then
		v75 = v62
	else
		v75 = nil
	end
	v71.ref = v75
	v71.Selectable = v_u_19 and true or nil
	local v76 = {}
	local v77
	if v_u_16 then
		local v78 = v_u_6.createElement
		local v79 = v_u_10
		local v80 = {
			["tag"] = "auto-xy row align-y-center align-x-center grow gap-small"
		}
		local v81 = {}
		local v82
		if v_u_20 and not v65 then
			v82 = nil
		else
			v82 = v_u_6.createElement(v_u_51, {
				["lastInput"] = p_u_60.lastInput,
				["gamepadButtonImageHint"] = p_u_60.gamepadButtonImageHint,
				["keyboardButtonImageHint"] = p_u_60.keyboardButtonImageHint,
				["isDisabled"] = p_u_60.isDisabled,
				["foregroundStyle"] = v64,
				["isSmall"] = p_u_60.isSmall
			})
		end
		v81.Hint = v82
		v81.ButtonText = v_u_6.createElement(v_u_56, {
			["text"] = p_u_60.text,
			["isDisabled"] = p_u_60.isDisabled,
			["foregroundStyle"] = v64,
			["isEmphasized"] = p_u_60.isEmphasized,
			["isSmall"] = p_u_60.isSmall
		})
		v77 = v78(v79, v80, v81)
	else
		v77 = nil
	end
	v76.Button = v77
	local v83
	if v_u_20 and not v65 or (v_u_16 or v_u_17 == 2 and v_u_5:IsSmallTouchScreen()) then
		v83 = nil
	elseif p_u_60.lastInput == v_u_8.Input.Pointer or p_u_60.lastInput == v_u_8.Input.Directional then
		local v84 = v_u_6.createElement
		local v85 = v_u_12
		local v86 = {}
		local v87
		if p_u_60.lastInput == v_u_8.Input.Directional then
			v87 = p_u_60.gamepadButtonImageHint
		else
			v87 = p_u_60.keyboardButtonImageHint
		end
		v86.Image = v87
		v86.imageStyle = {
			["Color3"] = v64.Color3,
			["Transparency"] = p_u_60.isDisabled and 0.5 or v64.Transparency
		}
		local v88 = {}
		local v89 = not v68
		if v89 then
			v89 = p_u_60.isSmall
		end
		v88["size-700"] = v89
		local v90 = not v68
		if v90 then
			v90 = not p_u_60.isSmall
		end
		v88["size-800"] = v90
		local v91
		if v68 then
			v91 = p_u_60.isSmall
		else
			v91 = v68
		end
		v88["size-900"] = v91
		if v68 then
			v68 = not p_u_60.isSmall
		end
		v88["size-1000"] = v68
		v86.tag = v88
		v83 = v84(v85, v86)
	elseif p_u_60.lastInput == v_u_8.Input.Pointer then
		v83 = v_u_37(p_u_60.keyboardHint, p_u_60.isDisabled)
	elseif p_u_60.lastInput == v_u_8.Input.Directional then
		local v92 = v_u_6.createElement
		local v93 = v_u_12
		local v94 = {
			["Image"] = p_u_60.gamepadButtonImageHint,
			["imageStyle"] = {
				["Color3"] = v64.Color3,
				["Transparency"] = p_u_60.isDisabled and 0.5 or v64.Transparency
			},
			["tag"] = {
				["size-600"] = not p_u_60.isSmall,
				["size-500"] = p_u_60.isSmall
			}
		}
		v83 = v92(v93, v94)
	else
		v83 = nil
	end
	v76.Hint = v83
	local v95
	if v_u_16 then
		v95 = nil
	else
		local v96 = v_u_6.createElement
		local v97 = v_u_11
		local v98 = {
			["Text"] = nil,
			["LayoutOrder"] = 2,
			["textStyle"] = nil,
			["tag"] = nil,
			["Text"] = p_u_60.text,
			["textStyle"] = {
				["Color3"] = v64.Color3,
				["Transparency"] = p_u_60.isDisabled and 0.5 or v64.Transparency
			},
			["tag"] = {
				["auto-x"] = true,
				["text-title-medium"] = not p_u_60.isSmall,
				["text-title-small"] = p_u_60.isSmall,
				["content-action-standard"] = not p_u_60.isEmphasized,
				["content-action-soft-emphasis"] = p_u_60.isEmphasized
			}
		}
		v95 = v96(v97, v98)
	end
	v76.ButtonText = v95
	local v99
	if v_u_16 and p_u_60.addTraversalHistoryMenu then
		local v100 = v_u_6.createElement
		local v101 = v_u_14
		local v102 = {
			["anchorRef"] = nil,
			["idleButtonStateIsDown"] = true,
			["currentPageChangeSignal"] = nil,
			["isDarkOnDarkMode"] = true,
			["menuSide"] = nil,
			["anchorRef"] = v62,
			["currentPageChangeSignal"] = p_u_60.currentPageChangeSignal
		}
		local v103
		if p_u_60.isSmall then
			v103 = v_u_13.Bottom
		else
			v103 = v_u_13.Top
		end
		v102.menuSide = v103
		v99 = v100(v101, v102)
	else
		v99 = nil
	end
	v76.TraversalHistoryMenu = v99
	return v69(v70, v71, v76)
end)