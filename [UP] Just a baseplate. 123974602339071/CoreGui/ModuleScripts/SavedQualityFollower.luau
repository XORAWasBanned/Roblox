-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.SavedQualityFollower
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3) -- name: new
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1
	return setmetatable({
		["_enabler"] = nil,
		["_slider"] = nil,
		["_isShowing"] = false,
		["_showCount"] = 0,
		["_enabler"] = p2,
		["_slider"] = p3
	}, v4)
end
function v_u_1.isShowing(p5) -- name: isShowing
	return p5._isShowing
end
function v_u_1.show(p_u_6, p7) -- name: show
	local v8 = p7 == Enum.SavedQualitySetting.Automatic
	local v9 = v8 and 1 or 2
	local v10 = p_u_6._enabler:GetSelectedIndex() ~= v9
	local v11 = not v8
	if v11 then
		v11 = p_u_6._slider:GetValue() ~= p7.Value
	end
	if v10 or v11 then
		p_u_6._isShowing = true
		p_u_6._showCount = p_u_6._showCount + 1
		local v_u_12 = p_u_6._showCount
		if v10 then
			p_u_6._enabler:SetSelectionIndex(v9)
		end
		if v11 then
			p_u_6._slider:SetValue(p7.Value)
		end
		task.defer(function()
			-- upvalues: (copy) p_u_6, (copy) v_u_12
			if p_u_6._showCount == v_u_12 then
				p_u_6._isShowing = false
			end
		end)
	end
end
return v_u_1