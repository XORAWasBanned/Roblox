-- Path: CoreGui.RobloxGui.Modules.UIManager.DragBar
local v1 = script.Parent
local v_u_2 = require(v1.Utils)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.getCFrame(p4) -- name: getCFrame
	return p4.part.CFrame
end
function v_u_3.setCFrame(p5, p6) -- name: setCFrame
	p5.part.CFrame = p6
end
function v_u_3.updateTransparency(p7) -- name: updateTransparency
	if p7.dragBarState == "Hovering" then
		p7.dragBarImage.ImageTransparency = 0.2
		return
	elseif p7.dragBarState == "Dragging" then
		p7.dragBarImage.ImageTransparency = 0
	else
		p7.dragBarImage.ImageTransparency = 0.6
	end
end
function v_u_3.updateState(p8) -- name: updateState
	if p8.dragging then
		p8.dragBarState = "Dragging"
	elseif p8.hovering and not p8.dragging then
		p8.dragBarState = "Hovering"
	else
		p8.dragBarState = "Idle"
	end
	p8:updateTransparency()
end
function v_u_3.startDrag(p9, p10) -- name: startDrag
	p9.dragging = true
	p9.uiGroupOffSet = p10
	p9:updateState()
end
function v_u_3.dragEnd(p11) -- name: dragEnd
	p11.dragging = false
	p11:updateState()
end
function v_u_3.startHover(p12) -- name: startHover
	p12.hovering = true
	p12:updateState()
end
function v_u_3.hoverEnd(p13) -- name: hoverEnd
	p13.hovering = false
	p13:updateState()
end
function v_u_3.show(p14) -- name: show
	p14.part.Parent = p14.partsParent
end
function v_u_3.hide(p15) -- name: hide
	p15.part.Parent = nil
end
function v_u_3.rescale(p16, p17) -- name: rescale
	-- upvalues: (copy) v_u_2
	p16.part.Size = p16.part.Size * p17
	if p16.uiGroupOffSet then
		p16.uiGroupOffSet = v_u_2.rescaleCFramePosition(p16.uiGroupOffSet, p17)
	end
end
function v_u_3.new(p18, p19) -- name: new
	-- upvalues: (copy) v_u_3
	local v20 = {
		["part"] = nil,
		["dragBarImage"] = nil,
		["hovering"] = false,
		["dragging"] = false,
		["dragBarState"] = "Idle",
		["partsParent"] = nil,
		["uiGroupOffSet"] = nil,
		["part"] = p18,
		["dragBarImage"] = p19,
		["partsParent"] = p18.Parent
	}
	local v21 = v_u_3
	setmetatable(v20, v21)
	v20.dragBarImage.ImageTransparency = 0.6
	return v20
end
return v_u_3