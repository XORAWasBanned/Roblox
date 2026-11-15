-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.loadAsset
local v_u_1 = game:GetService("InsertService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
return {
	["loadAsset"] = nil,
	["takePreviewResult"] = nil,
	["PREVIEW_REMOTE_NAME"] = "PreviewLoadAsset",
	["loadAsset"] = function(p4) -- name: loadAsset
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
		if v_u_3:IsStudio() and v_u_3:IsClient() then
			local v5 = v_u_2:FindFirstChild("PreviewLoadAsset")
			if v5 ~= nil and v5:IsA("RemoteFunction") then
				local v6 = v5:InvokeServer(p4)
				if v6 == nil or typeof(v6) ~= "Instance" then
					error((("loadAsset: PreviewLoadAsset returned nil for %*"):format(p4)))
				end
				local v7 = v6:Clone()
				v6:Destroy()
				return v7
			end
		end
		return v_u_1:LoadAsset(p4)
	end,
	["takePreviewResult"] = function(p8, p9) -- name: takePreviewResult
		if p8 == nil or typeof(p8) ~= "Instance" then
			error((("loadAsset: PreviewLoadAsset returned nil for %*"):format(p9)))
		end
		local v10 = p8:Clone()
		p8:Destroy()
		return v10
	end
}