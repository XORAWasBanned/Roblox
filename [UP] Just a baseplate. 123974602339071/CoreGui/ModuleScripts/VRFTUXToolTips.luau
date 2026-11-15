-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Tooltips.VRFTUXToolTips
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.VrCommon).VRHub
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).IsVRAppBuild
local v_u_4 = require(v1.Packages.React)
local v_u_5 = game:GetService("RunService")
local v_u_6 = require(script.Parent.ToolTip)
local v_u_7 = require(v1.Packages.LuauPolyfill)
local v_u_8 = {}
local function v_u_12(_) -- name: onRenderStepped
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_2
	if v_u_3() then
		for _, v9 in pairs(v_u_8) do
			local v10 = v_u_2:GetControllerModel(v9.Button.Controller)
			local v11
			if v10 then
				v11 = v10:getButtonPosition(v9.Button.ButtonKeycode)
			else
				v11 = nil
			end
			if not v9.Part then
				continue
			end
			if v10 == nil or v11 == nil then
				v9.Part.Position = Vector3.new(-99999, -99999, -99999)
			else
				v9.Part.Position = v11
			end
		end
	end
end
function spawnTooltipPart() -- name: spawnTooltipPart
	local v13 = Instance.new("Part")
	v13.Name = "TooltipPart"
	v13.Position = Vector3.new(0, -100, 0)
	v13.Anchored = true
	v13.CanCollide = false
	v13.Transparency = 1
	v13.Size = Vector3.new(0.1, 0.1, 0.1)
	v13.Parent = game.Workspace
	local v14 = Instance.new("BillboardGui")
	v14.Parent = v13
	v14.Adornee = v13
	v14.AlwaysOnTop = true
	v14.Active = false
	v14.Size = UDim2.new(1, 0, 1, 0)
	return v13
end
function showTooltipText(p15) -- name: showTooltipText
	for _, v16 in ipairs(p15.Part:GetDescendants()) do
		if not v16:IsA("TextLabel") or v16.Name ~= "Body" then
			continue
		end
		v16.ZIndex = 10
	end
end
function Tooltips(p_u_17) -- name: Tooltips
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_12, (copy) v_u_7, (copy) v_u_6
	for v18, v19 in pairs(p_u_17.tooltipButtons) do
		v_u_8[v18] = {
			["Button"] = v19,
			["Part"] = spawnTooltipPart()
		}
	end
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_8
		for _, v20 in pairs(v_u_8) do
			showTooltipText(v20)
		end
	end, {})
	v_u_5.RenderStepped:Connect(v_u_12)
	return v_u_4.createElement("Frame", {}, (v_u_7.Array.map(v_u_8, function(p21, p22)
		-- upvalues: (ref) v_u_4, (ref) v_u_6, (copy) p_u_17
		return v_u_4.createElement(v_u_6, {
			["controllerPart"] = p21.Part,
			["tooltipText"] = p_u_17.tooltipButtons[p22].Text
		})
	end)))
end
return Tooltips