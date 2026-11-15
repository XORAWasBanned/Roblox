-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.MainView
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Actions.SetActiveTab)
local v_u_3 = require(script.Parent.Parent.Actions.SetTabList)
local v_u_4 = require(script.Parent.Flags.FFlagDevConsoleTabReselectKeepsClientView)
return function(p5, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	if not p5 then
		p5 = {
			["isDeveloperView"] = false,
			["isClientView"] = true,
			["tabList"] = nil,
			["currTabIndex"] = nil,
			["tabList"] = {}
		}
	end
	if p6.type == v_u_2.name then
		if p5.tabList[p6.newTabIndex] then
			local v7 = {
				["currTabIndex"] = p6.newTabIndex,
				["isClientView"] = p6.isClientView
			}
			if p5.currTabIndex ~= p6.newTabIndex then
				v7.isClientView = true
			end
			if v_u_4 and v7.isClientView == nil then
				v7.isClientView = true
			end
			local v8 = v_u_1.JoinDictionaries(p5, v7)
			if v7.isClientView == nil then
				v8 = v_u_1.RemoveFromDictionary(v8, "isClientView")
			end
			return v8
		end
	elseif p6.type == v_u_3.name and p6.tabList[p6.initIndex] then
		local v9 = {
			["currTabIndex"] = nil,
			["tabList"] = nil,
			["isDeveloperView"] = nil,
			["isClientView"] = true,
			["currTabIndex"] = p6.initIndex,
			["tabList"] = p6.tabList,
			["isDeveloperView"] = p6.isDeveloperView
		}
		return v_u_1.JoinDictionaries(p5, v9)
	end
	return p5
end