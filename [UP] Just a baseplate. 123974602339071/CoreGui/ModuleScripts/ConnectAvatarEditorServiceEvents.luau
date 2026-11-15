-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.ConnectAvatarEditorServiceEvents
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = game:GetService("CorePackages")
local v3 = script.Parent
local v_u_4 = require(v3.Actions.OpenPrompt)
local v_u_5 = require(v3.PromptType)
local v_u_6 = require(v3.Thunks.OpenSetFavoritePrompt)
local v_u_7 = require(v3.Thunks.OpenSaveAvatarPrompt)
local v_u_8 = require(v3.Thunks.OpenDeleteOutfitPrompt)
local v_u_9 = require(v3.Thunks.OpenRenameOutfitPrompt)
local v_u_10 = require(v3.Thunks.OpenUpdateOutfitPrompt)
local v_u_11 = require(v2.Workspace.Packages.AvatarExperienceCommon)
local v_u_12 = require(v3.showSaveAvatarTimeoutFeatureRestriction)
local v_u_13 = require(v2.Workspace.Packages.AvatarExperienceFlags).FFlagAXUseUFRForTimeoutPromptInExperience
return function(p_u_14) -- name: ConnectAvatarEditorServiceEvents
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v15 = {}
	local v16 = v_u_1.OpenPromptSaveAvatar
	local function v20(p_u_17, p_u_18)
		-- upvalues: (ref) v_u_11, (ref) v_u_13, (ref) v_u_12, (copy) p_u_14, (ref) v_u_4, (ref) v_u_5, (ref) v_u_7
		v_u_11.Stores.getTimeoutStatusStore().fetchStatusAsync():andThen(function(p19)
			-- upvalues: (ref) v_u_13, (ref) v_u_12, (ref) p_u_14, (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (copy) p_u_17, (copy) p_u_18
			if p19.isTimedOut then
				if v_u_13 then
					v_u_12()
				else
					p_u_14:dispatch(v_u_4(v_u_5.SaveAvatarTimeout, {}))
				end
			else
				p_u_14:dispatch(v_u_7(p_u_17, p_u_18))
				return
			end
		end)
	end
	table.insert(v15, v16:Connect(v20))
	local v21 = v_u_1.OpenAllowInventoryReadAccess
	local function v22()
		-- upvalues: (copy) p_u_14, (ref) v_u_4, (ref) v_u_5
		p_u_14:dispatch(v_u_4(v_u_5.AllowInventoryReadAccess, {}))
	end
	table.insert(v15, v21:Connect(v22))
	local v23 = v_u_1.OpenPromptCreateOufit
	local function v26(p24, p25)
		-- upvalues: (copy) p_u_14, (ref) v_u_4, (ref) v_u_5
		p_u_14:dispatch(v_u_4(v_u_5.CreateOutfit, {
			["humanoidDescription"] = p24,
			["rigType"] = p25
		}))
	end
	table.insert(v15, v23:Connect(v26))
	local v27 = v_u_1.OpenPromptSetFavorite
	local function v31(p28, p29, p30)
		-- upvalues: (copy) p_u_14, (ref) v_u_6
		p_u_14:dispatch(v_u_6(p28, p29, p30))
	end
	table.insert(v15, v27:Connect(v31))
	local v32 = v_u_1.OpenPromptDeleteOutfit
	local function v34(p33)
		-- upvalues: (copy) p_u_14, (ref) v_u_8
		p_u_14:dispatch(v_u_8(p33))
	end
	table.insert(v15, v32:Connect(v34))
	local v35 = v_u_1.OpenPromptRenameOutfit
	local function v37(p36)
		-- upvalues: (copy) p_u_14, (ref) v_u_9
		p_u_14:dispatch(v_u_9(p36))
	end
	table.insert(v15, v35:Connect(v37))
	local v38 = v_u_1.OpenPromptUpdateOutfit
	local function v42(p39, p40, p41)
		-- upvalues: (copy) p_u_14, (ref) v_u_10
		p_u_14:dispatch(v_u_10(p39, p40, p41))
	end
	table.insert(v15, v38:Connect(v42))
	return v15
end