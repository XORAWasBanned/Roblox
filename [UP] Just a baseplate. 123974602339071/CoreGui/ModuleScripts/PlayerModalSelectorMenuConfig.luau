-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.Players.PlayerModalSelectorMenuConfig
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
local v_u_4 = require(v2.Workspace.Packages.VerifiedBadges)
local v_u_5 = require(v2.Workspace.Packages.UserLib)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.Constants)
local v_u_7 = require(v2.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
return {
	["componentType"] = "modalSelector",
	["getIsVisible"] = nil,
	["getMenuItems"] = nil,
	["getSelectedValue"] = nil,
	["onUpdateSelectedOption"] = nil,
	["fieldLabel"] = "WhichPerson",
	["componentName"] = "PlayerSelector",
	["getIsVisible"] = function(_) -- name: getIsVisible
		return true
	end,
	["getMenuItems"] = function(p8) -- name: getMenuItems
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
		return v_u_3.List.map(p8.playerObjects, function(p9)
			-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_7
			local v10 = not v_u_5.Utils.isPlayerVerified(p9) and "" or v_u_4.emoji.verified
			local v11 = {
				["label"] = p9.DisplayName .. v10
			}
			local v12
			if v_u_7.canDisplayPeoplesUsernames then
				v12 = "[@" .. p9.Name .. "]"
			else
				v12 = nil
			end
			v11.subLabel = v12
			v11.identifier = p9.Name
			return v11
		end)
	end,
	["getSelectedValue"] = function(p13) -- name: getSelectedValue
		-- upvalues: (copy) v_u_7
		local v14 = p13.allegedAbuser
		if not v14 then
			return nil
		end
		local v15 = v14.DisplayName
		local v16 = v14.Name
		return v15 .. (not v_u_7.canDisplayPeoplesUsernames and "" or "[@" .. v16 .. "]")
	end,
	["onUpdateSelectedOption"] = function(p17, p18, p19, p20) -- name: onUpdateSelectedOption
		-- upvalues: (copy) v_u_6
		if p17.identifier then
			local v21 = p17.identifier
			for _, v22 in p18.playerObjects do
				if v21 ~= v22.Name then
					continue
				end
				local v23 = v22.UserId
				p20.analyticsDispatch({
					["type"] = v_u_6.AnalyticsActions.IncrementPersonChanged
				})
				p19({
					["type"] = v_u_6.PlayerMenuActions.UpdateAbuser,
					["abuseId"] = v23,
					["abuser"] = v22
				})
			end
		end
	end
}