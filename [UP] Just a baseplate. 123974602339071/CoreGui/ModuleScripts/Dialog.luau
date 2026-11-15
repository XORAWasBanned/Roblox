-- Path: CoreGui.RobloxGui.Modules.VR.Dialog
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("CorePackages")
local v4 = require(v3.Workspace.Packages.AppCommonLib).Create
local v5 = require(v3.Workspace.Packages.VrCommon).Panel3D
Color3.new(0.2, 0.2, 0.2)
local _ = Enum.FontSize.Size36
Color3.new(1, 1, 1)
local v_u_6 = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.141592653589793, 0)
v4("ImageLabel")({
	["Name"] = "EmptySelectionImage",
	["Image"] = "",
	["BackgroundTransparency"] = 1,
	["ImageTransparency"] = 1
})
local v_u_7 = v5.Get("Dialog")
v_u_7:SetType(v5.Type.Fixed)
v_u_7.localCF = v_u_6
v_u_7:SetCanFade(true)
local v_u_8 = 0
local v_u_9 = {}
local v_u_10 = false
local v_u_11 = 0
function v_u_7.CalculateTransparency(_) -- name: CalculateTransparency
	-- upvalues: (copy) v_u_1, (ref) v_u_11, (ref) v_u_8, (ref) v_u_10
	local v12 = v_u_1:GetUserCFrame(Enum.UserCFrame.Head)
	local v13 = v12.lookVector * Vector3.new(1, 0, 1)
	local v14 = v12.lookVector.Y
	local v15 = math.asin(v14)
	local v16 = v_u_11 + v_u_8 + 1.5707963267948966
	local v17 = math.cos(v16)
	local v18 = v_u_11 + v_u_8 + 1.5707963267948966
	local v19 = -math.sin(v18)
	local v20 = Vector3.new(v17, 0, v19)
	if math.abs(v15) > 0.767944870877505 then
		v_u_10 = true
	end
	local v21 = v13:Dot(v20)
	local v22 = (math.acos(v21) - 0.6544984694978736) / 0.11344640137963136
	local v23 = math.max(0, v22)
	return math.min(v23, 1)
end
local function v_u_32() -- name: updatePanelPosition
	-- upvalues: (copy) v_u_1, (ref) v_u_11, (ref) v_u_10, (ref) v_u_8, (copy) v_u_7, (copy) v_u_6
	local v24 = v_u_1:GetUserCFrame(Enum.UserCFrame.Head).lookVector * Vector3.new(1, 0, 1)
	local v25 = -v24.Z
	local v26 = v24.X
	local v27 = (math.atan2(v25, v26) - 1.5707963267948966) % 6.283185307179586
	local v28 = v_u_11
	local v29 = v27 / 1.5707963267948966 + 0.5
	local v30 = v28 + math.floor(v29) * 1.5707963267948966
	if v_u_10 then
		v_u_10 = false
		v_u_11 = v27
	end
	v_u_8 = v30
	local v31 = v_u_1:GetUserCFrame(Enum.UserCFrame.Head).p
	v_u_7.localCF = CFrame.new(v31) * CFrame.Angles(0, v30, 0) * v_u_6
end
function dialogPanelRenderUpdate() -- name: dialogPanelRenderUpdate
	-- upvalues: (copy) v_u_7, (ref) v_u_10, (copy) v_u_32, (ref) v_u_9
	if v_u_7.transparency == 1 or v_u_10 then
		v_u_32()
	end
	local v33 = 1 - v_u_7.transparency
	for v34, v35 in pairs(v_u_9) do
		local v36 = 1 - v35 * v33
		if v34:IsA("TextLabel") or v34:IsA("TextButton") then
			v34.TextTransparency = v36
		elseif v34:IsA("ImageLabel") or v34:IsA("ImageButton") then
			v34.ImageTransparency = v36
		else
			if not v34:IsA("Frame") then
				continue
			end
			v34.BackgroundTransparency = v36
		end
	end
end
local v_u_37 = {}
local v_u_38 = nil
local v_u_39 = nil
local function v_u_46() -- name: updatePanel
	-- upvalues: (copy) v_u_37, (ref) v_u_39, (copy) v_u_7, (ref) v_u_9, (ref) v_u_38, (ref) v_u_10, (copy) v_u_32
	local v40 = v_u_37[1]
	if v_u_39 and v_u_39.content then
		v_u_39.content.Parent = nil
	end
	if v40 and v40.content then
		v40.content.Parent = v_u_7:GetGUI()
		v_u_39 = v40
		local v41 = v40.content.AbsoluteSize
		v_u_7:ResizePixels(v41.X, v41.Y, 100)
		v_u_10 = true
		v_u_32()
		v_u_7:SetVisible(true)
		v_u_9 = {}
		local function v_u_44(p42) -- name: search
			-- upvalues: (ref) v_u_9, (copy) v_u_44
			if p42:IsA("ImageLabel") or p42:IsA("ImageButton") then
				v_u_9[p42] = 1 - p42.ImageTransparency
			elseif p42:IsA("TextLabel") or p42:IsA("TextButton") then
				v_u_9[p42] = 1 - p42.TextTransparency
			elseif p42:IsA("Frame") then
				v_u_9[p42] = 1 - p42.BackgroundTransparency
			end
			for _, v43 in pairs(p42:GetChildren()) do
				v_u_44(v43)
			end
		end
		v_u_44(v_u_7:GetGUI())
		if v_u_38 then
			v_u_38:disconnect()
			v_u_38 = nil
		end
		v_u_38 = v_u_7:GetGUI().DescendantAdded:connect(function(p45)
			-- upvalues: (copy) v_u_44
			v_u_44(p45)
		end)
	else
		v_u_7:SetVisible(false)
		v_u_9 = {}
		if v_u_38 then
			v_u_38:disconnect()
			v_u_38 = nil
			return
		end
	end
end
local v_u_47 = {}
v_u_47.__index = v_u_47
function v_u_47.new(p48) -- name: new
	-- upvalues: (copy) v_u_47
	local v49 = v_u_47
	local v50 = setmetatable({}, v49)
	v50.content = p48
	return v50
end
function v_u_47.SetContent(p51, p52) -- name: SetContent
	if not p52 and p51.content then
		p51.content.Parent = nil
	end
	p51.content = p52
end
local v_u_53 = false
function v_u_47.Show(p54, p55) -- name: Show
	-- upvalues: (ref) v_u_53, (copy) v_u_2, (copy) v_u_37, (copy) v_u_46
	if not v_u_53 then
		v_u_53 = true
		v_u_2:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate)
	end
	if p55 then
		local v56 = v_u_37
		table.insert(v56, 1, p54)
	else
		local v57 = v_u_37
		table.insert(v57, p54)
	end
	v_u_46()
end
function v_u_47.Close(p58) -- name: Close
	-- upvalues: (copy) v_u_37, (ref) v_u_53, (copy) v_u_2, (copy) v_u_46
	for v59, v60 in pairs(v_u_37) do
		if v60 ~= p58 then
			continue
		end
		table.remove(v_u_37, v59)
	end
	if v_u_53 and #v_u_37 == 0 then
		v_u_53 = false
		v_u_2:UnbindFromRenderStep("DialogPanel")
	end
	v_u_46()
end
return v_u_47