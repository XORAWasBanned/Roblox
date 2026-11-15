-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.ConnectAssetServiceEvents
local v_u_1 = game:GetService("AssetService")
local v_u_2 = game:GetService("AvatarCreationService")
local v_u_3 = game:GetService("ExperienceAuthService")
local v_u_4 = game:GetService("RobloxReplicatedStorage")
local v5 = game:GetService("CorePackages")
local v6 = script.Parent
local v_u_7 = require(v6.Thunks.OpenPublishAssetPrompt)
local v_u_8 = require(v6.Thunks.OpenPublishAvatarPrompt)
local v_u_9 = require(v6.Thunks.OpenPublishAvatarAssetPrompt)
local v_u_10 = require(v6.Thunks.OpenPublishMakeupLookPrompt)
local v_u_11 = require(v6.Thunks.OpenResultModal)
local v_u_12 = require(v6.Actions.SetHumanoidModel)
local v_u_13 = require(v6.Actions.SetAccessoryInstance)
local v_u_14 = require(v6.Actions.SetPriceInRobux)
local v_u_15 = require(v6.Actions.OpenValidationErrorModal)
local v_u_16 = require(v5.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local v_u_17 = require(v6.Flags.GetFFlagUploadMakeupSupport)
local v_u_18 = require(v6.Flags.FFlagPublishAssetPromptItemDetailsTelemetry)
local v_u_19 = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled")
local function v_u_24(p20) -- name: updateModelAttachmentsWithWrapDeformers
	-- upvalues: (copy) v_u_4
	p20.Parent = v_u_4
	for _, v21 in p20:GetChildren() do
		if not v21:IsA("MeshPart") then
			continue
		end
		local v22 = v21:FindFirstChildWhichIsA("WrapDeformer")
		if not v22 then
			continue
		end
		for _, v23 in v21:GetChildren() do
			if not v23:IsA("Attachment") then
				continue
			end
			v23.CFrame = v22:GetDeformedCFrameAsync(v23.CFrame)
		end
	end
end
local function v_u_26(p25) -- name: setAnalyticsItemDetails
	-- upvalues: (copy) v_u_16
	if p25.instanceToPublish or p25.serializedInstance then
		v_u_16.setItemDetails(v_u_16.ItemType.Asset, p25.assetType.Name)
		return
	elseif p25.outfitToPublish then
		v_u_16.setItemDetails(v_u_16.ItemType.Outfit, Enum.OutfitType.Avatar.Name)
		return
	elseif p25.makeupLookToPublish then
		v_u_16.setItemDetails(v_u_16.ItemType.Outfit, Enum.OutfitType.Makeup.Name)
	elseif p25.accessoryToPublish then
		v_u_16.setItemDetails(v_u_16.ItemType.Asset, p25.accessoryType.Name)
	end
end
return function(p_u_27) -- name: ConnectAssetServiceEvents
	-- upvalues: (copy) v_u_3, (copy) v_u_19, (copy) v_u_18, (copy) v_u_26, (copy) v_u_7, (copy) v_u_1, (copy) v_u_8, (copy) v_u_17, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11, (copy) v_u_2, (copy) v_u_13, (copy) v_u_14, (copy) v_u_24, (copy) v_u_12, (copy) v_u_15
	local v28 = {}
	local v29 = v_u_3.OpenAuthPrompt
	local function v34(p30, p31, p32)
		-- upvalues: (ref) v_u_19, (ref) v_u_18, (ref) v_u_26, (copy) p_u_27, (ref) v_u_7, (ref) v_u_1, (ref) v_u_8, (ref) v_u_17, (ref) v_u_10, (ref) v_u_9
		local v33 = v_u_19
		if v33 then
			v33 = p32.isVideoToAnimationFlow
		end
		if #p31 == 1 and (p31[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not v33) then
			if v_u_18 then
				v_u_26(p32)
			end
			if p32.instanceToPublish then
				p_u_27:dispatch(v_u_7(p32.instanceToPublish, p32.assetType, p30, p31))
				return
			end
			if p32.serializedInstance then
				p_u_27:dispatch(v_u_7(v_u_1:DeserializeInstance(p32.serializedInstance), p32.assetType, p30, p31))
				return
			end
			if p32.outfitToPublish then
				p_u_27:dispatch(v_u_8(p30, p31))
				return
			end
			if v_u_17() and p32.makeupLookToPublish then
				p_u_27:dispatch(v_u_10(p30, p31, p32.makeupEntries))
				return
			end
			if p32.accessoryToPublish then
				p_u_27:dispatch(v_u_9(p32.accessoryType, p30, p31))
			end
		end
	end
	table.insert(v28, v29:Connect(v34))
	local v35 = v_u_1.OpenPublishResultModal
	local function v37(p36)
		-- upvalues: (copy) p_u_27, (ref) v_u_11
		p_u_27:dispatch(v_u_11(p36))
	end
	table.insert(v28, v35:Connect(v37))
	local function v39() -- name: checkNewEventsExist
		-- upvalues: (ref) v_u_2
		local v38 = v_u_2.UgcValidationSuccess
		if v38 then
			v38 = v_u_2.UgcValidationFailure
		end
		return v38
	end
	if pcall(v39) then
		local v40 = v_u_2.UgcValidationSuccess
		local function v46(p41, p42, p43)
			-- upvalues: (copy) p_u_27, (ref) v_u_17, (ref) v_u_2, (ref) v_u_13, (ref) v_u_14, (ref) v_u_24, (ref) v_u_12
			local v44 = p_u_27:getState()
			if v44 and (v44.promptRequest.promptInfo.promptType == "PublishAvatarAsset" or v_u_17() and v44.promptRequest.promptInfo.promptType == "PublishMakeupLook") then
				p_u_27:dispatch(v_u_13((v_u_2:DeserializeAvatarModel(p42))))
				if p43 then
					p_u_27:dispatch(v_u_14(p43))
				end
			elseif v44 and v44.promptRequest.promptInfo.guid == p41 then
				local v45 = v_u_2:DeserializeAvatarModel(p42)
				v_u_24(v45)
				p_u_27:dispatch(v_u_12(v45))
				p_u_27:dispatch(v_u_14(p43))
			end
		end
		table.insert(v28, v40:Connect(v46))
	end
	if pcall(v39) then
		local v47 = v_u_2.UgcValidationFailure
		local function v51(p48, p49)
			-- upvalues: (copy) p_u_27, (ref) v_u_15
			local v50 = p_u_27:getState()
			if v50 and v50.promptRequest.promptInfo.guid == p48 then
				p_u_27:dispatch(v_u_15(p49))
			end
		end
		table.insert(v28, v47:Connect(v51))
	end
	return v28
end