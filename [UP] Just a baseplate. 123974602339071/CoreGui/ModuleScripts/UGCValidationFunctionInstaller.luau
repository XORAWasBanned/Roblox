-- Path: CoreGui.RobloxGui.Modules.Server.UGCValidation.UGCValidationFunctionInstaller
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UGCValidationService")
local v_u_3 = require(v1.Packages.UGCValidation)
local v_u_4 = game:GetEngineFeature("UGCValidationWithContextEntrypointFeature")
local v_u_5 = game:DefineFastFlag("UGCValidateMigrateSchemaProperties2", false)
local v_u_6 = game:DefineFastFlag("UGCValidateForwardIECRestrictedUserIds", false)
local function v_u_27(p7) -- name: UGCValidationFunction
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v8 = p7.instances
	local v9 = p7.assetType
	local v10 = p7.isServer
	local v11 = p7.fullBodyData
	local v12 = p7.allowUnreviewedAssets
	local v13 = p7.restrictedUserIds
	local v14 = p7.token
	local v15 = p7.universeId
	local v16 = p7.requireAllFolders
	local v17 = {
		["skipSnapshot"] = true,
		["skipPhysicsDataReset"] = true,
		["skipValidateHSR"] = true
	}
	local v18, v19
	if v_u_4 then
		local v20 = {
			["instances"] = nil,
			["assetTypeEnum"] = nil,
			["isServer"] = nil,
			["allowUnreviewedAssets"] = nil,
			["restrictedUserIds"] = nil,
			["token"] = nil,
			["universeId"] = nil,
			["allowEditableInstances"] = true,
			["shouldYield"] = true,
			["validateMeshPartAccessories"] = true,
			["requireAllFolders"] = nil,
			["bypassFlags"] = nil,
			["instances"] = v8,
			["assetTypeEnum"] = v9,
			["isServer"] = v10,
			["allowUnreviewedAssets"] = v12,
			["restrictedUserIds"] = v13,
			["token"] = v14,
			["universeId"] = v15,
			["requireAllFolders"] = v16,
			["bypassFlags"] = v17
		}
		local v21 = {
			["fullBodyData"] = nil,
			["isServer"] = nil,
			["allowEditableInstances"] = true,
			["bypassFlags"] = nil,
			["shouldYield"] = true,
			["requireAllFolders"] = nil,
			["validateMeshPartAccessories"] = false,
			["fullBodyData"] = v11,
			["isServer"] = v10,
			["bypassFlags"] = v17,
			["requireAllFolders"] = v16
		}
		if v11 then
			v18, v19 = v_u_3.validateFullBodyWithContext(v21)
		else
			v18, v19 = v_u_3.validateWithContext(v20)
		end
	elseif v11 then
		v18, v19 = v_u_3.validateFullBody(v11, v10, true, v17, true, v16)
	else
		v18, v19 = v_u_3.validate(v8, v9, v10, v12, v13, v14, v15, true, v17, true, true, v16)
	end
	local v22 = {
		["source"] = v10 and "InExpServer" or "InExpClient",
		["enforceR15FolderStructure"] = v16 or false,
		["skipAssetQualityChecks"] = v_u_3.shouldSkipAssetQualityChecks and v_u_3.shouldSkipAssetQualityChecks() or nil
	}
	local v23
	if v_u_5 then
		v23 = {
			["token"] = v14,
			["universeId"] = v15
		}
		if not v_u_6 then
			v13 = nil
		end
		v23.restrictedUserIds = v13
	else
		v23 = nil
	end
	v22.iecConfigs = v23
	local v24
	if v11 then
		v24 = v_u_3.ValidateFinalizedBundle(v11, Enum.BundleType.BodyParts, v22)
	else
		v24 = v_u_3.ValidateAsset(v8, v9, v22)
	end
	local v25, v26 = v_u_3.combineResultsIntoLegacy(v18, v19, v24)
	if v25 then
		return true, { "Success" }
	else
		return false, v26
	end
end
return function() -- name: Install
	-- upvalues: (copy) v_u_2, (copy) v_u_27
	v_u_2:RegisterUGCValidationFunction(v_u_27)
end