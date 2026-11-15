-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.parseSceneAsset
require(script.Parent.Types)
local function v_u_16(p1) -- name: readValue
	-- upvalues: (copy) v_u_16
	if p1:IsA("StringValue") then
		return p1.Value
	end
	if p1:IsA("IntValue") or p1:IsA("NumberValue") then
		return p1.Value
	end
	if p1:IsA("BoolValue") then
		return p1.Value
	end
	if p1:IsA("Color3Value") then
		return p1.Value
	end
	if p1:IsA("Vector3Value") then
		return p1.Value
	end
	if p1:IsA("CFrameValue") then
		return p1.Value
	end
	if p1:IsA("ObjectValue") then
		return p1.Value
	end
	if not p1:IsA("Folder") then
		return nil
	end
	local v2 = p1:GetChildren()
	local v3 = #v2 > 0
	local v4 = {}
	for _, v5 in v2 do
		local v6 = v5.Name
		local v7 = tonumber(v6)
		if v7 == nil or (v7 < 1 or v7 % 1 ~= 0) then
			v3 = false
			break
		end
		table.insert(v4, {
			["index"] = v7,
			["child"] = v5
		})
	end
	if not v3 then
		local v8 = {}
		for _, v9 in v2 do
			v8[v9.Name] = v_u_16(v9)
		end
		return v8
	end
	table.sort(v4, function(p10, p11)
		return p10.index < p11.index
	end)
	local v12 = {}
	for v13, v14 in v4 do
		local v15 = v_u_16(v14.child)
		v12[v13] = v15
		if v15 ~= nil then
			continue
		end
		warn((("parseSceneAsset: %* is a %*, which holds no value this parser reads. Slot %* is empty."):format(v14.child:GetFullName(), v14.child.ClassName, v13)))
	end
	return v12
end
local function v_u_20(p17) -- name: findSceneFolder
	local v18 = p17:FindFirstChild("MomentScene")
	if v18 ~= nil then
		return v18
	end
	if p17:FindFirstChild("Type") ~= nil then
		return p17
	end
	if p17:FindFirstChild("Args") ~= nil then
		return p17
	end
	for _, v19 in p17:GetChildren() do
		if v19:FindFirstChild("Type") == nil and v19:FindFirstChild("Args") == nil then
			continue
		end
		return v19
	end
	return p17
end
return function(p21) -- name: parseSceneAsset
	-- upvalues: (copy) v_u_20, (copy) v_u_16
	local v22 = v_u_20(p21)
	local v23 = nil
	local v24
	if v22 then
		v24 = v22:FindFirstChild("Type")
	else
		v24 = nil
	end
	if v24 ~= nil and v24:IsA("StringValue") then
		v23 = v24.Value
	end
	local v25 = {}
	local v26
	if v22 then
		v26 = v22:FindFirstChild("Args")
	else
		v26 = nil
	end
	if v26 ~= nil then
		for _, v27 in v26:GetChildren() do
			v25[v27.Name] = v_u_16(v27)
		end
	end
	return {
		["type"] = v23,
		["args"] = v25
	}
end