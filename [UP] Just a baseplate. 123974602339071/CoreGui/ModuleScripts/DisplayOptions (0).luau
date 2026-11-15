-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.DisplayOptions
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("VRService")
local v3 = game:GetService("GuiService")
local v4 = require(v1.Packages.Rodux)
local v_u_5 = require(v1.Packages.Cryo)
local v6 = require(v1.Workspace.Packages.PlayerList)
local v7 = script.Parent.Parent
local v8 = script.Parent.Parent.Actions
local v9 = require(v8.SetPlayerListVisibility)
local v10 = require(v8.SetPlayerListEnabled)
local v11 = require(v8.SetTempHideKey)
local v12 = require(v8.SetPerformanceStatsVisible)
local v13 = require(v8.SetSmallTouchDevice)
local v14 = require(v8.SetTenFootInterface)
local v15 = require(v8.SetInspectMenuEnabled)
local v16 = require(v8.SetIsUsingGamepad)
local v17 = require(v8.SetHasPermissionToVoiceChat)
local v18 = require(v8.SetMinimized)
local v19 = require(v8.SetSubjectToChinaPolicies)
local v_u_20 = require(v7.Flags.FFlagPlayerListPersistVisibility)
local v_u_21 = v6.Flags.FFlagAddNewPlayerListMobileFocusNav
local v22 = v6.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local v_u_23
if v_u_20 then
	v_u_23 = UserSettings().GameSettings
else
	v_u_23 = nil
end
local v24 = {
	["isMinimized"] = false,
	["setVisible"] = nil,
	["isVisible"] = true,
	["isSmallTouchDevice"] = false,
	["performanceStatsVisible"] = false,
	["vrEnabled"] = nil,
	["inspectMenuEnabled"] = nil,
	["playerlistCoreGuiEnabled"] = true,
	["isTenFootInterface"] = false,
	["isUsingGamepad"] = false,
	["hasPermissionToVoiceChat"] = false,
	["tempHideKeys"] = nil,
	["subjectToChinaPolicies"] = true
}
local v25
if v22 then
	v25 = false
else
	v25 = not v_u_20 and true or v_u_23.PlayerListVisible
end
v24.setVisible = v25
v24.vrEnabled = v2.VREnabled
v24.inspectMenuEnabled = v3:GetInspectMenuEnabled()
v24.tempHideKeys = {}
return v4.createReducer(v24, {
	[v9.name] = function(p26, p27)
		-- upvalues: (copy) v_u_20, (copy) v_u_23, (copy) v_u_5
		if v_u_20 and not (p26.isSmallTouchDevice or p26.isTenFootInterface) then
			v_u_23.PlayerListVisible = p27.isVisible
		end
		local v28 = v_u_5.Dictionary.join(p26, {
			["setVisible"] = p27.isVisible
		})
		v28.isVisible = v28.setVisible
		if not v28.isTenFootInterface then
			v28.isVisible = v28.isVisible
		end
		local v29 = v28.isVisible
		if v29 then
			v29 = v_u_5.isEmpty(v28.tempHideKeys)
		end
		v28.isVisible = v29
		return v28
	end,
	[v10.name] = function(p30, p31)
		-- upvalues: (copy) v_u_21, (copy) v_u_5
		local v32
		if v_u_21 and not p31.isEnabled then
			v32 = false
		else
			v32 = nil
		end
		local v33 = v_u_5.Dictionary.join
		local v34 = {
			["playerlistCoreGuiEnabled"] = p31.isEnabled
		}
		if not v_u_21 then
			v32 = nil
		end
		v34.setVisible = v32
		local v35 = v33(p30, v34)
		v35.isVisible = v35.setVisible
		if not v35.isTenFootInterface then
			v35.isVisible = v35.isVisible
		end
		local v36 = v35.isVisible
		if v36 then
			v36 = v_u_5.isEmpty(v35.tempHideKeys)
		end
		v35.isVisible = v36
		return v35
	end,
	[v11.name] = function(p37, p38)
		-- upvalues: (copy) v_u_5
		local v39 = p38.tempHideValue
		if v39 == nil then
			v39 = v_u_5.None
		end
		local v40 = v_u_5.Dictionary.join
		local v41 = {
			["tempHideKeys"] = v_u_5.Dictionary.join(p37.tempHideKeys, {
				[p38.tempHideKey] = v39
			})
		}
		local v42 = v40(p37, v41)
		v42.isVisible = v42.setVisible
		if not v42.isTenFootInterface then
			v42.isVisible = v42.isVisible
		end
		local v43 = v42.isVisible
		if v43 then
			v43 = v_u_5.isEmpty(v42.tempHideKeys)
		end
		v42.isVisible = v43
		return v42
	end,
	[v12.name] = function(p44, p45)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p44, {
			["performanceStatsVisible"] = p45.isVisible
		})
	end,
	[v13.name] = function(p46, p47)
		-- upvalues: (copy) v_u_5
		local v48 = v_u_5.Dictionary.join(p46, {
			["isSmallTouchDevice"] = p47.isSmallTouchDevice
		})
		v48.isVisible = v48.setVisible
		if not v48.isTenFootInterface then
			v48.isVisible = v48.isVisible
		end
		local v49 = v48.isVisible
		if v49 then
			v49 = v_u_5.isEmpty(v48.tempHideKeys)
		end
		v48.isVisible = v49
		return v48
	end,
	[v14.name] = function(p50, p51)
		-- upvalues: (copy) v_u_5
		local v52 = p50.setVisible
		if p51.isTenFootInterface then
			v52 = false
		end
		local v53 = v_u_5.Dictionary.join(p50, {
			["isTenFootInterface"] = p51.isTenFootInterface,
			["setVisible"] = v52
		})
		v53.isVisible = v53.setVisible
		if not v53.isTenFootInterface then
			v53.isVisible = v53.isVisible
		end
		local v54 = v53.isVisible
		if v54 then
			v54 = v_u_5.isEmpty(v53.tempHideKeys)
		end
		v53.isVisible = v54
		return v53
	end,
	[v15.name] = function(p55, p56)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p55, {
			["inspectMenuEnabled"] = p56.enabled
		})
	end,
	[v16.name] = function(p57, p58)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p57, {
			["isUsingGamepad"] = p58.isUsingGamepad
		})
	end,
	[v17.name] = function(p59, p60)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p59, {
			["hasPermissionToVoiceChat"] = p60.hasPermissionToVoiceChat
		})
	end,
	[v18.name] = function(p61, p62)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p61, {
			["isMinimized"] = p62.isMinimized
		})
	end,
	[v19.name] = function(p63, p64)
		-- upvalues: (copy) v_u_5
		return v_u_5.Dictionary.join(p63, {
			["subjectToChinaPolicies"] = p64.subjectToChinaPolicies
		})
	end
})