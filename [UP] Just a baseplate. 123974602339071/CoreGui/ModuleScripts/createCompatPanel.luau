-- Path: CoreGui.RobloxGui.Modules.UIManager.createCompatPanel
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetEngineFeature("CurvedSurfaceGuisEnabled")
local v_u_3 = game:GetService("CoreGui")
local v4 = script.Parent
local v_u_5 = require(v4.Constants)
local v_u_6 = v_u_5.SpatialUIType
local v_u_7 = require(v1.Packages.LuauPolyfill).Object
local v_u_8 = game:GetService("VRService")
local v_u_9 = {
	["spatialPanelProps"] = nil,
	["screenGuiProps"] = nil,
	["type"] = nil,
	["type"] = v_u_6.ScreenUI
}
local v_u_10 = {
	["Name"] = "ScreenGui",
	["ResetOnSpawn"] = false,
	["DisplayOrder"] = 0,
	["ZIndexBehavior"] = nil
}
local v_u_11 = {
	["name"] = "",
	["partSize"] = nil,
	["virtualScreenSize"] = nil,
	["cframe"] = nil,
	["alwaysOnTop"] = true,
	["hidden"] = false,
	["curvature"] = 1,
	["transparency"] = 1,
	["partSize"] = v_u_5.DEFAULT_VR_PANEL_SIZE,
	["virtualScreenSize"] = v_u_5.DEFAULT_VR_PANEL_SIZE * v_u_5.VR_PANEL_RESOLUTION_MULTIPLIER,
	["cframe"] = CFrame.new(0, 0, 0)
}
local function v_u_16(p12) -- name: createPanelPart
	local v13 = Instance.new("Part")
	v13.Parent = workspace.CurrentCamera
	v13.Name = p12.name .. "_Part"
	v13.CFrame = p12.cframe
	v13.CastShadow = false
	local v14 = p12.partSize.X
	local v15 = p12.partSize.Y
	v13.Size = Vector3.new(v14, v15, 0.002)
	v13.Transparency = not p12.transparency and 1 or p12.transparency
	v13.Color = Color3.new(0, 0, 0)
	v13.CanCollide = false
	v13.CanTouch = false
	v13.Anchored = true
	return v13
end
local function v_u_28(p17) -- name: createPanel
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_6, (copy) v_u_11, (copy) v_u_16, (copy) v_u_3, (copy) v_u_2, (copy) v_u_10
	local v18 = v_u_7.assign({}, v_u_9, p17)
	if v18.type == v_u_6.SpatialUIPartOnly then
		local v19 = v_u_16((v_u_7.assign({}, v_u_11, v18.spatialPanelProps)))
		return {
			["type"] = v18.type,
			["panelObject"] = v19
		}
	end
	if v18.type ~= v_u_6.SpatialUI then
		if v18.type ~= v_u_6.ScreenUI then
			local v20 = print
			local v21 = v18.type
			v20("Invalid panel type: " .. tostring(v21))
			return nil
		end
		local v22 = v_u_7.assign({}, v_u_10, v18.screenGuiProps)
		local v23 = Instance.new("ScreenGui", v_u_3)
		v23.Name = v22.Name
		v23.ResetOnSpawn = v22.ResetOnSpawn
		v23.DisplayOrder = v22.DisplayOrder
		if v22.ZIndexBehavior then
			v23.ZIndexBehavior = v22.ZIndexBehavior
		end
		return {
			["type"] = v18.type,
			["panelObject"] = v23
		}
	end
	local v24 = v_u_7.assign({}, v_u_11, v18.spatialPanelProps)
	local v25 = v_u_16(v24)
	local v26 = Instance.new("SurfaceGui", v_u_3)
	v26.Name = v24.name .. "_SurfaceGui"
	v26.Enabled = not v24.hidden
	v26.CanvasSize = v24.virtualScreenSize
	v26.AlwaysOnTop = v24.alwaysOnTop
	local v27
	if v_u_2 and v24.curvature ~= 0 then
		v27 = Enum.SurfaceGuiShape.CurvedHorizontally
	else
		v27 = Enum.SurfaceGuiShape.Flat
	end
	v26.Shape = v27
	v26.HorizontalCurvature = not v_u_2 and 0 or v24.curvature
	v26.Active = true
	v26.Adornee = v25
	v26.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v26.LightInfluence = 0
	v26.ZOffset = 0
	v26.Face = Enum.NormalId.Back
	return {
		["type"] = v18.type,
		["panelObject"] = v26
	}
end
return function(p29)
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_5, (copy) v_u_6
	if v_u_8.VREnabled then
		local v30 = v_u_28(v_u_5.COMPAT_PANEL_PROPS_MAP[p29.panelType])
		return v30 ~= nil and {
			["panelObject"] = nil,
			["uiType"] = nil,
			["panelType"] = nil,
			["panelPositionProps"] = nil,
			["headScale"] = 1,
			["panelObject"] = v30.panelObject,
			["uiType"] = v30.type,
			["panelType"] = p29.panelType,
			["panelPositionProps"] = v_u_5.SPATIAL_PANEL_POSITION_PROPS_MAP[p29.panelType]
		} or nil
	else
		local v31 = v_u_28({
			["type"] = v_u_6.ScreenUI,
			["screenGuiProps"] = p29.screenGuiProps
		})
		return v31 ~= nil and {
			["panelObject"] = nil,
			["uiType"] = nil,
			["panelType"] = nil,
			["panelPositionProps"] = nil,
			["panelObject"] = v31.panelObject,
			["uiType"] = v31.type,
			["panelType"] = p29.panelType
		} or nil
	end
end