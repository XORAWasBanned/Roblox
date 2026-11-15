-- Path: CoreGui.RobloxGui.Modules.UIManager.Constants
local v1 = {
	["ScreenUI"] = "ScreenUI",
	["SpatialUI"] = "SpatialUI",
	["SpatialUIPartOnly"] = "SpatialUIPartOnly",
	["SpatialUIRoact"] = "SpatialUIRoact"
}
local v2 = {
	["Chat"] = "Chat",
	["RobloxGui"] = "RobloxGui",
	["BottomBar"] = "BottomBar",
	["MoreMenu"] = "MoreMenu"
}
local v3 = {
	["MainUIGroup"] = "MainUIGroup",
	["WristUIGroup"] = "WristUIGroup"
}
local v4 = Vector2.new(0.1365, 0.1995) * 3.3333333333333335
local v5 = Vector2.new(0.532, 0.3395) * 3.3333333333333335
local v6 = CFrame.new(v5.X * 0.5 + v4.X * 0.5 + 0.06666666666666667, (v5.Y - v4.Y) / 2, 0)
local v7 = {}
local v8 = v2.Chat
local v9 = {
	["type"] = v1.SpatialUI,
	["spatialPanelProps"] = {
		["name"] = "ExperienceChat",
		["faceCamera"] = true,
		["lerp"] = true,
		["partSize"] = nil,
		["virtualScreenSize"] = nil,
		["partSize"] = v4,
		["virtualScreenSize"] = v4 * 800
	}
}
v7[v8] = v9
local v10 = v2.RobloxGui
local v11 = {
	["type"] = v1.SpatialUIPartOnly,
	["spatialPanelProps"] = {
		["name"] = "RobloxGuiPanel-PartOnly",
		["faceCamera"] = true,
		["lerp"] = true,
		["partSize"] = nil,
		["transparency"] = 0.5,
		["partSize"] = v5
	}
}
v7[v10] = v11
local v12 = {}
local v13 = v2.Chat
local v14 = {
	["uiGroup"] = v3.MainUIGroup,
	["cameraFixedPanelProp"] = {
		["uiGroupElementOffset"] = v6
	}
}
v12[v13] = v14
local v15 = v2.RobloxGui
local v16 = {
	["uiGroup"] = v3.MainUIGroup,
	["cameraFixedPanelProp"] = {
		["uiGroupElementOffset"] = CFrame.new(0, 0, 0)
	}
}
v12[v15] = v16
local v17 = CFrame.new(0, -v5.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0)
local v18 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0)
local v19 = {
	[v2.BottomBar] = v3.MainUIGroup,
	[v2.MoreMenu] = v3.MainUIGroup
}
local v20 = {
	[v2.BottomBar] = v17,
	[v2.MoreMenu] = v18
}
return {
	["SpatialUIType"] = nil,
	["SpatialUIGroupType"] = nil,
	["PanelType"] = nil,
	["DEFAULT_VR_PANEL_SIZE"] = nil,
	["VR_PANEL_RESOLUTION_MULTIPLIER"] = 800,
	["BOTTOM_BAR_BASE_PART_SIZE"] = 0.15,
	["COMPAT_PANEL_PROPS_MAP"] = nil,
	["SPATIAL_PANEL_POSITION_PROPS_MAP"] = nil,
	["ROACT_PANEL_UIGROUP_MAP"] = nil,
	["ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP"] = nil,
	["SpatialUIType"] = v1,
	["SpatialUIGroupType"] = v3,
	["PanelType"] = v2,
	["DEFAULT_VR_PANEL_SIZE"] = Vector2.new(10, 10),
	["COMPAT_PANEL_PROPS_MAP"] = v7,
	["SPATIAL_PANEL_POSITION_PROPS_MAP"] = v12,
	["ROACT_PANEL_UIGROUP_MAP"] = v19,
	["ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP"] = v20
}