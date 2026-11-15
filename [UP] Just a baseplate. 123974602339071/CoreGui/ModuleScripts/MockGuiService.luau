-- Path: CoreGui.RobloxGui.Modules.TestHelpers.MockGuiService
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v_u_2 = Instance.new("BindableEvent")
	local v4 = {
		["broadcasts"] = nil,
		["NativeClose"] = nil,
		["MenuIsOpen"] = false,
		["openedMenus"] = nil,
		["broadcasts"] = {},
		["NativeClose"] = {
			["Connect"] = function(_, p3) -- name: Connect
				-- upvalues: (copy) v_u_2
				return v_u_2.Event:Connect(p3)
			end
		},
		["openedMenus"] = {}
	}
	local v5 = {
		["__index"] = v_u_1
	}
	setmetatable(v4, v5)
	return v4
end
function v_u_1.SetMenuIsOpen(p6, p7, p8) -- name: SetMenuIsOpen
	if p7 then
		local v9 = p6.openedMenus
		table.insert(v9, p8)
	else
		local v10 = table.find(p6.openedMenus, p8)
		if v10 then
			table.remove(p6.openedMenus, v10)
		end
	end
	p6.MenuIsOpen = #p6.openedMenus > 0
end
function v_u_1.BroadcastNotification(p11, p12, p13) -- name: BroadcastNotification
	local v14 = p11.broadcasts
	table.insert(v14, {
		["data"] = p12,
		["notification"] = p13
	})
end
function v_u_1.GetNotificationTypeList(_) -- name: GetNotificationTypeList
	return {
		["NATIVE_EXIT"] = 35,
		["RESTART_APP"] = 41
	}
end
return v_u_1