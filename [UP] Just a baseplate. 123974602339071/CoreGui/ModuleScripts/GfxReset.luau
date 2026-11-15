-- Path: CoreGui.RobloxGui.Modules.Settings.GfxReset
local v_u_1 = UserSettings().GameSettings
local v_u_2 = game:DefineFastFlag("IGMResetGfxQuality", false)
local v_u_3 = game:DefineFastFlag("IGMRevertGfxQuality", false)
local v_u_4 = game:DefineFastFlag("IGMRevertGfxLv5Only", false)
local v_u_5 = game:DefineFastFlag("IGMResetGfxLv5Only", false)
local v_u_6 = game:DefineFastFlag("IGMAlwaysResetGfxLv5", false)
local v_u_7 = game:DefineFastInt("IGMTempOverrideGfxLv5", 0)
function applicationId() -- name: applicationId
	local v8 = game:GetService("AppStorageService")
	if not v8 then
		return nil
	end
	local v9 = v8:GetItem("AppInstallationId")
	local v10 = typeof(v9)
	if v10 == "number" then
		return tonumber(v9) or nil
	end
	if v10 ~= "string" then
		return nil
	end
	if string.len(v9) <= 0 then
		return nil
	end
	local v11 = tostring(1000)
	local v12 = -string.len(v11)
	local v13 = string.sub(v9, v12)
	return tonumber(v13)
end
return {
	["RunGfxReset"] = function() -- name: RunGfxReset
		-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5
		local v14 = v_u_6
		local v15 = v_u_1.SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel5
		if v14 and v15 then
			v_u_1.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
		end
		if game:GetEngineFeature("QualityLevelReset") then
			if v_u_3 then
				if v_u_1.QualityResetLevel >= 0 then
					local v16 = v_u_1.QualityResetLevel
					for _, v18 in Enum.SavedQualitySetting:GetEnumItems() do
						if v18.Value ~= v16 then
							continue
						end
					end
					local v18 = Enum.SavedQualitySetting.Automatic
					if v_u_4 and v18 == Enum.SavedQualitySetting.QualityLevel5 or v_u_4 == false then
						v_u_1.SavedQualityLevel = v18
						v_u_1.QualityResetLevel = -1
						return
					end
				end
			elseif v_u_2 then
				local v19 = v_u_5
				local v20 = v_u_1.QualityResetLevel
				if v20 < 0 or v20 == nil then
					local v21 = v_u_1.SavedQualityLevel.Value
					if v15 and v19 or v19 == false then
						v_u_1.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
					end
					v_u_1.QualityResetLevel = v21
				end
			end
		end
	end,
	["TemporaryOverride"] = function(p22) -- name: TemporaryOverride
		-- upvalues: (copy) v_u_7
		if ((applicationId() or 0) + 329) % 1000 < v_u_7 and (p22 == Enum.SavedQualitySetting.QualityLevel5 or p22 == Enum.SavedQualitySetting.QualityLevel5.Value) then
			return true, Enum.SavedQualitySetting.Automatic.Value
		else
			return false, Enum.SavedQualitySetting.Automatic.Value
		end
	end
}