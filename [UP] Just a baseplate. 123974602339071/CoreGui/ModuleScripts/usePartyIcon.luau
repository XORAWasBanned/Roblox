-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Party.usePartyIcon
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Workspace.Packages.CrossExperienceVoice)
local v4 = require(v1.Workspace.Packages.RoactUtils)
local v5 = require(v1.Workspace.Packages.SharedFlags)
local v_u_6 = require(v1.Workspace.Packages.SquadsCore.getColorFromUserId)
local v_u_7 = v_u_3.Hooks.useLastActiveParticipant
local v_u_8 = v_u_3.Hooks.useSequentialAnimation
local v_u_9 = v4.Hooks.usePrevious
local v_u_10 = require(v1.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local v_u_11 = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorAnimationMs", 50)
local v_u_12 = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorDebounceMs", 50)
local v_u_13 = v5.GetFFlagEnableCrossExpVoice
function createAnimations(p14, p15) -- name: createAnimations
	-- upvalues: (copy) v_u_11
	local v16 = {
		["ICON_OUT_ANIMATION"] = {
			["value"] = 0,
			["durationInMs"] = nil,
			["easingStyle"] = nil,
			["durationInMs"] = v_u_11,
			["easingStyle"] = Enum.EasingStyle.Linear
		},
		["ICON_IN_ANIMATION"] = {
			["value"] = p14,
			["durationInMs"] = v_u_11,
			["easingStyle"] = Enum.EasingStyle.Linear
		},
		["AVATAR_IN_ANIMATION"] = {
			["value"] = p15,
			["durationInMs"] = v_u_11,
			["easingStyle"] = Enum.EasingStyle.Linear
		},
		["AVATAR_OUT_ANIMATION"] = {
			["value"] = 0,
			["durationInMs"] = nil,
			["easingStyle"] = nil,
			["durationInMs"] = v_u_11,
			["easingStyle"] = Enum.EasingStyle.Linear
		}
	}
	return v16
end
function getDisplayImage(p17, p18) -- name: getDisplayImage
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	local v19 = {}
	if p17 ~= -1 then
		p18 = v_u_10((tostring(p17)))
	end
	v19.thumbnail = p18
	local v20
	if p17 == -1 then
		v20 = nil
	else
		v20 = v_u_6(p17)
	end
	v19.backgroundColor = v20
	return v19
end
function usePartyIcon(p_u_21, p_u_22, p_u_23) -- name: usePartyIcon
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8, (copy) v_u_3, (copy) v_u_12
	if not v_u_13() then
		local v24, _ = v_u_2.createBinding(p_u_21)
		return {
			["image"] = getDisplayImage(-1, p_u_23),
			["size"] = v24
		}
	end
	local v25 = v_u_7()
	local v_u_26 = v25 and v25.userId or -1
	local v_u_27 = v_u_9(v_u_26)
	local v28, v_u_29 = v_u_2.useState(getDisplayImage(v_u_26, p_u_23))
	local v30 = v_u_8
	local v31
	if v_u_26 == -1 then
		v31 = p_u_21
	else
		v31 = p_u_22
	end
	local v32, v_u_33 = v30(v31)
	local v_u_34 = v_u_2.useMemo(function()
		-- upvalues: (copy) p_u_21, (copy) p_u_22
		return createAnimations(p_u_21, p_u_22)
	end, { p_u_21, p_u_22 })
	local v_u_38 = v_u_2.useCallback(function(p_u_35)
		-- upvalues: (copy) v_u_29, (copy) p_u_23
		v_u_29(function(p36)
			-- upvalues: (copy) p_u_35, (ref) p_u_23
			local v37 = getDisplayImage(p_u_35, p_u_23)
			if p36.thumbnail == v37.thumbnail and p36.backgroundColor == v37.backgroundColor then
				return p36
			else
				return v37
			end
		end)
	end, { p_u_23, v_u_29 })
	local v_u_41 = v_u_2.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_33, (ref) v_u_12
		return v_u_3.Utils.debounce(function(p39, p40)
			-- upvalues: (ref) v_u_33
			v_u_33(p39, p40)
		end, v_u_12)
	end, {})
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_26, (copy) v_u_41, (copy) v_u_34, (copy) v_u_38, (copy) v_u_33
		if v_u_27 == nil or v_u_26 == v_u_27 then
			v_u_38(v_u_26)
			return
		else
			v_u_41.cancel()
			if v_u_26 == -1 then
				v_u_41.call({ v_u_34.AVATAR_OUT_ANIMATION, v_u_34.ICON_IN_ANIMATION }, function()
					-- upvalues: (ref) v_u_38
					v_u_38(-1)
				end)
				return
			elseif v_u_27 == -1 then
				v_u_33({ v_u_34.ICON_OUT_ANIMATION, v_u_34.AVATAR_IN_ANIMATION }, function()
					-- upvalues: (ref) v_u_38, (ref) v_u_26
					v_u_38(v_u_26)
				end)
			else
				v_u_38(v_u_26)
			end
		end
	end, {
		v_u_26,
		v_u_38,
		v_u_41,
		v_u_34
	})
	return {
		["image"] = v28,
		["size"] = v32
	}
end
return usePartyIcon