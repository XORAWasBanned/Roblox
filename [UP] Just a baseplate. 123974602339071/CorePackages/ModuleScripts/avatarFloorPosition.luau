-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders._Utils.avatarFloorPosition
local function v_u_6(p1) -- name: heightForCharacter
	local v2 = p1:FindFirstChildOfClass("Humanoid")
	local v3 = p1:FindFirstChild("HumanoidRootPart")
	if v2 == nil or (v3 == nil or not v3:IsA("BasePart")) then
		return nil
	end
	local v4 = v2.HipHeight + 0.5 * v3.Size.Y
	if v2.RigType == Enum.HumanoidRigType.R6 then
		local v5 = p1:FindFirstChild("Left Leg")
		if v5 ~= nil and v5:IsA("BasePart") then
			v4 = v4 + v5.Size.Y
		end
	end
	return v4
end
return {
	["heightForCharacter"] = v_u_6,
	["positionOnFloor"] = function(p7, p8, p9) -- name: positionOnFloor
		-- upvalues: (copy) v_u_6
		local v10 = p9 or CFrame.new()
		local v11 = v_u_6(p7)
		if v11 == nil then
			p7:PivotTo(v10 * CFrame.new(p8, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0))
		else
			local v12 = p7:FindFirstChild("HumanoidRootPart")
			v12.Anchored = true
			p7.PrimaryPart = v12
			p7:PivotTo(v10 * CFrame.new(p8, v11, 0) * CFrame.Angles(0, 3.141592653589793, 0))
		end
	end
}