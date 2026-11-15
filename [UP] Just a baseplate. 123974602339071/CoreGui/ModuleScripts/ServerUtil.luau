-- Path: CoreGui.RobloxGui.Modules.Server.ServerUtil
local v_u_1 = game:DefineFastFlag("ServerCoreScriptSourceCode", false)
local v2 = {
	["getFFlagServerCoreScriptSourceCode"] = function() -- name: getFFlagServerCoreScriptSourceCode
		-- upvalues: (copy) v_u_1
		return v_u_1
	end
}
if v_u_1 then
	local v_u_3 = game:GetService("InsertService")
	local v_u_4 = game:GetService("CoreGui"):WaitForChild("RobloxGui", (1 / 0)).Modules
	local function v_u_9(p5, p6) -- name: getRelativePathArray
		local v7 = {}
		while p6 ~= p5 do
			if p6 == nil then
				return nil
			end
			local v8 = p6.Name
			table.insert(v7, 1, v8)
			p6 = p6.Parent
		end
		return v7
	end
	function v2.getSourceForServerScript(p10) -- name: getSourceForServerScript
		-- upvalues: (copy) v_u_4, (copy) v_u_9
		if p10.Source ~= "" then
			return p10.Source
		end
		local v11 = v_u_4
		local v12 = v_u_4.SourceCode
		local v13 = v_u_9(v11, p10)
		if v13 == nil then
			error("Instance is not a descendant of the byte code root")
		end
		for v14 = 1, #v13 do
			v12 = v12:FindFirstChild(v13[v14])
		end
		if v12 == nil then
			error("No source found for instance")
		end
		return v12.Source
	end
	function v2.initSourceCodeFolder() -- name: initSourceCodeFolder
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		if script.Source == "" then
			local v15 = v_u_3:LoadLocalAsset("rbxasset://models/ServerCoreScripts.rbxm")
			local v16 = Instance.new("Folder")
			v16.Name = "SourceCode"
			v16.Parent = v_u_4
			local v17 = v15.Server
			local v18 = v15.Common
			v17.Parent = v16
			v18.Parent = v16
		end
	end
end
return v2