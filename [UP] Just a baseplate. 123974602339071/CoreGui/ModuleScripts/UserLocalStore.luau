-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.UserLocalStore
local v_u_1 = game:GetService("AppStorageService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("HttpService")
local function v_u_9(p4) -- name: getValuesForAllUsers
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v_u_5 = v_u_1:GetItem(p4)
	local function v6()
		-- upvalues: (ref) v_u_3, (copy) v_u_5
		return v_u_3:JSONDecode(v_u_5)
	end
	local v7, v8 = pcall(v6)
	return (not v7 or type(v8) ~= "table") and {
		["default"] = v_u_5
	} or v8
end
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_10
	if not p11 then
		if v_u_2.LocalPlayer and v_u_2.LocalPlayer.UserId > 0 then
			local v12 = v_u_2.LocalPlayer.UserId
			p11 = tostring(v12)
		else
			p11 = "0"
		end
	end
	local v13 = {
		["userId"] = tostring(p11)
	}
	local v14 = v_u_10
	setmetatable(v13, v14)
	return v13
end
function v_u_10.GetItem(p15, p16) -- name: GetItem
	-- upvalues: (copy) v_u_9
	local v17 = v_u_9(p16)
	local v18 = p15.userId or "0"
	local v19 = v17["u_" .. tostring(v18)]
	if v19 == nil then
		v19 = v17.default
	end
	return v19
end
function v_u_10.SetItem(p20, p21, p22) -- name: SetItem
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_1
	local v23 = v_u_9(p21)
	local v24 = p20.userId or "0"
	v23["u_" .. tostring(v24)] = p22
	v_u_1:SetItem(p21, (v_u_3:JSONEncode(v23)))
end
function v_u_10.Flush(_) -- name: Flush
	-- upvalues: (copy) v_u_1
	v_u_1:Flush()
end
v_u_10.getItem = v_u_10.GetItem
v_u_10.setItem = v_u_10.SetItem
v_u_10.flush = v_u_10.Flush
return v_u_10