-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.frameCamera
local v_u_1 = require(script.Parent.avatarFloorPosition)
local v2 = script:FindFirstAncestor("MomentScenes").Parent
local v_u_3 = require(v2.SafeFlags).createGetFString("MomentScenesFrameCameraPadding", "2")
local function v_u_4() -- name: emptyFit
	return CFrame.lookAt(Vector3.new(0, 2.5, 8), Vector3.new(0, 2, 0)), Vector3.new(0, 2, 0), 8
end
local function v_u_15(p5, p6) -- name: distanceToFit
	-- upvalues: (copy) v_u_3
	local v7 = math.rad(p6) / 2
	local v8 = math.tan(v7) * 0.5625
	local v9 = math.atan(v8)
	local v10 = math.tan(v7) <= 0 and 8 or p5.Y / 2 / math.tan(v7)
	local v11 = math.tan(v9) <= 0 and 8 or p5.X / 2 / math.tan(v9)
	local v12 = math.max(v10, v11, 1)
	local v13 = v_u_3
	local v14 = tonumber(v13())
	return v12 * ((v14 == nil or v14 <= 0) and 2 or v14)
end
local function v_u_22(p16, p17, p18) -- name: fitBox
	-- upvalues: (copy) v_u_15
	local v19 = p17 - p16
	local v20 = (p16 + p17) / 2
	local v21 = v_u_15(v19, p18)
	return CFrame.lookAt(v20 + Vector3.new(0, 0, v21), v20), v20, v21
end
return {
	["fitStandingCharacters"] = function(p23, p24) -- name: fitStandingCharacters
		-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_22
		local v25 = Vector3.new(inf, inf, inf)
		local v26 = Vector3.new(-inf, -inf, -inf)
		local v27 = false
		for _, v28 in p23 do
			local v29 = v28:FindFirstChild("HumanoidRootPart")
			local v30 = v28:FindFirstChild("Head")
			local v31 = v_u_1.heightForCharacter(v28)
			if v29 == nil or (not v29:IsA("BasePart") or (v30 == nil or (not v30:IsA("BasePart") or v31 == nil))) then
				continue
			end
			local v32 = v31 + (v30.Position.Y - v29.Position.Y + 0.5 * v30.Size.Y)
			local v33 = v32 * 0.24
			local v34 = v29.Position
			local v35 = v25.X
			local v36 = v34.X - v33
			local v37 = math.min(v35, v36)
			local v38 = v25.Y
			local v39 = math.min(v38, 0)
			local v40 = v25.Z
			local v41 = v34.Z - 0.75
			local v42 = math.min(v40, v41)
			v25 = Vector3.new(v37, v39, v42)
			local v43 = v26.X
			local v44 = v34.X + v33
			local v45 = math.max(v43, v44)
			local v46 = v26.Y
			local v47 = math.max(v46, v32)
			local v48 = v26.Z
			local v49 = v34.Z + 0.75
			local v50 = math.max(v48, v49)
			v26 = Vector3.new(v45, v47, v50)
			v27 = true
		end
		if v27 then
			return v_u_22(v25, v26, p24)
		else
			return v_u_4()
		end
	end,
	["fitStandingFace"] = function(p51, p52) -- name: fitStandingFace
		-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_22
		local v53 = Vector3.new(inf, inf, inf)
		local v54 = Vector3.new(-inf, -inf, -inf)
		local v55 = false
		for _, v56 in p51 do
			local v57 = v56:FindFirstChild("HumanoidRootPart")
			local v58 = v56:FindFirstChild("Head")
			local v59 = v_u_1.heightForCharacter(v56)
			if v57 == nil or (not v57:IsA("BasePart") or (v58 == nil or (not v58:IsA("BasePart") or v59 == nil))) then
				continue
			end
			local v60 = v59 + (v58.Position.Y - v57.Position.Y + 0.5 * v58.Size.Y)
			local v61 = v57.Position
			local v62 = v53.X
			local v63 = v61.X - 0.7
			local v64 = math.min(v62, v63)
			local v65 = v53.Y
			local v66 = v60 - 2
			local v67 = math.min(v65, v66)
			local v68 = v53.Z
			local v69 = v61.Z - 0.5
			local v70 = math.min(v68, v69)
			v53 = Vector3.new(v64, v67, v70)
			local v71 = v54.X
			local v72 = v61.X + 0.7
			local v73 = math.max(v71, v72)
			local v74 = v54.Y
			local v75 = math.max(v74, v60)
			local v76 = v54.Z
			local v77 = v61.Z + 0.5
			local v78 = math.max(v76, v77)
			v54 = Vector3.new(v73, v75, v78)
			v55 = true
		end
		if v55 then
			return v_u_22(v53, v54, p52)
		else
			return v_u_4()
		end
	end
}