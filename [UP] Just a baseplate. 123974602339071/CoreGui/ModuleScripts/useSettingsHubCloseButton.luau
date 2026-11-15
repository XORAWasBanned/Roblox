-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.useSettingsHubCloseButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Packages.React)
return function(p_u_4, p5) -- name: useSettingsHubCloseButton
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_6, v_u_7 = v_u_3.useState(nil)
	local v8, v_u_9 = v_u_3.useState(false)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_7
		local v10
		if p_u_4 then
			v10 = p_u_4()
		else
			v10 = nil
		end
		local v11 = v_u_7
		local v12
		if v10 then
			v12 = v10.PageTitleCloseButton
		else
			v12 = nil
		end
		v11(v12)
	end, { p_u_4, p5 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_9, (ref) v_u_2
		if not v_u_6 then
			v_u_9(false)
			return nil
		end
		local function v13() -- name: updateIsSelected
			-- upvalues: (ref) v_u_9, (ref) v_u_2, (ref) v_u_6
			v_u_9(v_u_2.SelectedCoreObject == v_u_6)
		end
		v_u_9(v_u_2.SelectedCoreObject == v_u_6)
		local v_u_14 = v_u_2:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v13)
		return function()
			-- upvalues: (copy) v_u_14
			v_u_14:Disconnect()
		end
	end, { v_u_6 })
	return v_u_6, v8
end