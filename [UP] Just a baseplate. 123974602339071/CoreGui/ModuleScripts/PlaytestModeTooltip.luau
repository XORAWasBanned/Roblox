-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.PlaytestModeTooltip
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = require(v1.Workspace.Packages.LinkingProtocol).LinkingProtocol
local v_u_7 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_8 = require(v1.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local v_u_9 = require(v1.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v_u_10 = require(v1.Workspace.Packages.CoreScriptsRoactCommon.GetPlaytestModeStore)
local v11 = require(v2.Modules.Chrome.ChromeShared.Service.ChromeUtils).ObservableValue
local v_u_12 = require(v2.Modules.Chrome.ChromeShared.Hooks.useIsPlaytestMode)
local v_u_13 = require(v2.Modules.Chrome.ChromeShared.Hooks.useObservableValue)
local v_u_14 = v5.EducationalTooltip
local v_u_15 = v5.OverlayProvider
local v_u_16 = v5.Enums.PopoverSide
local v_u_17 = v5.Enums.PopoverAlign
local v_u_18 = v5.Enums.ButtonVariant
local v_u_19 = game:DefineFastFlag("PlaytestModeDismissTooltip", false)
local v20 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v21
if v_u_19 then
	v21 = require(v1.Workspace.Packages.Chrome).Enabled()
else
	v21 = nil
end
local v_u_22
if v_u_19 and (v20 and v21) then
	v_u_22 = require(script.Parent.Parent.GamepadConnector)
else
	v_u_22 = nil
end
local v_u_23 = game:DefineFastFlag("PlaytestModeTooltipExcludeBuildMode", false)
local v_u_24 = require(v1.Workspace.Packages.SharedFlags).FFlagPlaytestModeTooltipOncePerWeek
local v_u_25 = require(v1.Workspace.Packages.SharedFlags).FFlagPlaytestModeTooltipOnlyPrivateTesters
local v_u_26 = game:DefineFastString("PlaytestModeTooltipLearnMoreUrl", "https://about.roblox.com/community-standards")
local v_u_27 = game:DefineFastInt("PlaytestModeTooltipDisplayOrder", -1)
local v_u_28 = false
local v_u_29 = false
local v_u_30
if v_u_19 then
	v_u_30 = v11.new(false)
else
	v_u_30 = nil
end
local function v_u_35(p31, p32, p33, p34) -- name: getCanShow
	-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) v_u_23, (copy) v_u_8, (ref) v_u_29, (copy) v_u_10, (ref) v_u_28, (copy) v_u_19
	if v_u_24 and not p33 then
		return false
	end
	if v_u_25 and p34 ~= true then
		return false
	end
	if v_u_23 and v_u_8:hasBuildMode() then
		return false
	end
	if v_u_24 then
		if not (v_u_29 or v_u_10(false).getHasTooltipCooldownExpired()) then
			return false
		end
	elseif v_u_28 then
		return false
	end
	return p31 == nil or (p31.current == nil or not v_u_19) or p32 ~= false
end
return v_u_3.memo(function(p_u_36) -- name: PlaytestModeTooltip
	-- upvalues: (copy) v_u_7, (copy) v_u_25, (copy) v_u_12, (copy) v_u_4, (copy) v_u_10, (copy) v_u_19, (copy) v_u_13, (copy) v_u_22, (copy) v_u_30, (copy) v_u_3, (copy) v_u_35, (copy) v_u_24, (ref) v_u_29, (ref) v_u_28, (copy) v_u_6, (copy) v_u_26, (copy) v_u_9, (copy) v_u_15, (copy) v_u_27, (copy) v_u_14, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	local v37 = v_u_7(v_u_25 and {
		["title"] = "CoreScripts.FTUX.Heading.YouAreAnEarlyTester",
		["text"] = "CoreScripts.FTUX.Description.WhiteMenuPreviewing",
		["continueText"] = "CommonUI.Features.Action.OK",
		["learnMoreText"] = "CommonUI.Features.Action.ViewDetails"
	} or {
		["title"] = "CoreScripts.FTUX.Heading.ReadyToPlaytest",
		["text"] = "CoreScripts.FTUX.Description.WhiteMenuPlaytestMode",
		["continueText"] = "CommonUI.Features.Action.Continue",
		["learnMoreText"] = "CommonUI.Features.Action.LearnMore"
	})
	local v_u_38 = v_u_12()
	local v_u_39
	if v_u_25 then
		v_u_39 = v_u_4.useSignalState(v_u_10(false).getIsPrivatePlaytester)
	else
		v_u_39 = nil
	end
	local v_u_40
	if v_u_19 then
		local v41 = v_u_13
		local v42
		if v_u_22 == nil then
			v42 = v_u_30
		else
			v42 = v_u_22:getShowTopBar()
		end
		v_u_40 = v41(v42)
	else
		v_u_40 = nil
	end
	local v43 = v_u_3.useState
	local v44 = v_u_35
	local v45 = p_u_36.anchorRef
	local v46
	if v_u_19 then
		v46 = v_u_40
	else
		v46 = nil
	end
	local v_u_47, v_u_48 = v43((v44(v45, v46, v_u_38, v_u_39)))
	if v_u_24 then
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_47, (ref) v_u_29, (ref) v_u_10
			if v_u_47 and not v_u_29 then
				v_u_29 = true
				v_u_10(false).markTooltipSeen()
			end
		end, { v_u_47 })
	end
	local v_u_49 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_24, (ref) v_u_29, (ref) v_u_28, (copy) v_u_48
		if v_u_24 then
			v_u_29 = false
		else
			v_u_28 = true
		end
		v_u_48(false)
	end, {})
	local v50 = v_u_3.useCallback
	local function v51()
		-- upvalues: (ref) v_u_6, (ref) v_u_26, (ref) v_u_19, (copy) v_u_49, (ref) v_u_28, (copy) v_u_48
		v_u_6.default:openURL(v_u_26)
		if v_u_19 then
			v_u_49()
		else
			v_u_28 = true
			v_u_48(false)
		end
	end
	local v52 = {}
	local v53
	if v_u_19 then
		v53 = v_u_49
	else
		v53 = nil
	end
	__set_list(v52, 1, {v53})
	local v54 = v50(v51, v52)
	local v55 = v_u_3.useEffect
	local function v60()
		-- upvalues: (copy) v_u_48, (ref) v_u_35, (copy) p_u_36, (ref) v_u_19, (ref) v_u_40, (copy) v_u_38, (ref) v_u_39
		local v56 = v_u_48
		local v57 = v_u_35
		local v58 = p_u_36.anchorRef
		local v59
		if v_u_19 then
			v59 = v_u_40
		else
			v59 = nil
		end
		v56((v57(v58, v59, v_u_38, v_u_39)))
	end
	local v61 = {}
	local v62 = p_u_36.anchorRef
	local v63
	if v_u_19 then
		v63 = v_u_40
	else
		v63 = nil
	end
	local v64
	if v_u_24 then
		v64 = v_u_38
	else
		v64 = nil
	end
	if not v_u_25 then
		v_u_39 = nil
	end
	__set_list(v61, 1, {v62, v63, v64, v_u_39})
	v55(v60, v61)
	if v_u_19 then
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_47, (ref) v_u_40, (copy) v_u_49
			if v_u_47 and not v_u_40 then
				v_u_49()
			end
		end, { v_u_47, v_u_40 })
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_9, (copy) v_u_49
			local v_u_66 = v_u_9:connect(function(p65)
				-- upvalues: (ref) v_u_49
				if p65 then
					v_u_49()
				end
			end)
			return function()
				-- upvalues: (copy) v_u_66
				v_u_66:Disconnect()
			end
		end, { v_u_49 })
	end
	if (v_u_24 or not v_u_28 and v_u_38) and v_u_47 then
		return v_u_3.createElement(v_u_15, {
			["DisplayOrder"] = v_u_27
		}, {
			["Tooltip"] = v_u_3.createElement(v_u_14, {
				["anchorRef"] = nil,
				["title"] = nil,
				["text"] = nil,
				["side"] = nil,
				["align"] = nil,
				["isOpen"] = true,
				["onClose"] = nil,
				["actions"] = nil,
				["anchorRef"] = p_u_36.anchorRef,
				["title"] = v37.title,
				["text"] = v37.text,
				["side"] = v_u_16.Bottom,
				["align"] = v_u_17.Start,
				["onClose"] = v_u_49,
				["actions"] = {
					{
						["text"] = v37.continueText,
						["variant"] = v_u_18.Emphasis,
						["onActivated"] = v_u_49
					},
					{
						["text"] = v37.learnMoreText,
						["variant"] = v_u_18.Standard,
						["onActivated"] = v54
					}
				}
			})
		})
	else
		return nil
	end
end)