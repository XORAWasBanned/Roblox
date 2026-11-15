-- Path: CoreGui.RobloxGui.Modules.UIManager.registerRoactPanel
local v1 = script.Parent
local v_u_2 = require(v1.UIManager)
local v_u_3 = require(v1.Constants)
return function(p4, p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = v_u_3.ROACT_PANEL_UIGROUP_MAP[p5]
	local v7 = v6 and {
		["uiGroupElementOffset"] = v_u_3.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[p5]
	} or nil
	local v8 = {
		["panelObject"] = nil,
		["uiType"] = nil,
		["panelType"] = nil,
		["headScale"] = 1,
		["panelPositionProps"] = nil,
		["panelObject"] = p4.current,
		["uiType"] = v_u_3.SpatialUIType.SpatialUIRoact,
		["panelType"] = p5,
		["panelPositionProps"] = {
			["uiGroup"] = v6,
			["cameraFixedPanelProp"] = v7
		}
	}
	v_u_2.getInstance():registerRoactPanel(p5, v8)
end