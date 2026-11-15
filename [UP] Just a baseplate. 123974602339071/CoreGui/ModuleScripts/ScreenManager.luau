-- Path: CoreGui.RobloxGui.Modules.Shell.ScreenManager
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v_u_1.RobloxGui
local v4 = v3:FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_5 = require(script.Parent.Analytics)
local v_u_6 = require(script.Parent.AppState)
local v_u_7 = require(script.Parent.GlobalSettings)
local v_u_8 = require(script.Parent.Models.ScreenItem)
local v_u_9 = require(script.Parent.PageHeartbeatTimer)
local v_u_10 = require(script.Parent.Actions.InsertScreen)
local v_u_11 = require(script.Parent.Actions.RemoveScreen)
local v_u_12 = require(v4.XboxPrimaryNav:FindFirstChild("contentHistory"))
local v_u_13 = require(v4.Flags.GetFIntXboxPrimaryNavABLogging)
local v_u_14 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = { v3 }
local function v_u_22(p18, p19) -- name: setRBXEventStream_Screen
	-- upvalues: (copy) v_u_5
	if p18 then
		local v20 = p18.GetAnalyticsInfo
		if type(v20) == "function" then
			local v21 = p18:GetAnalyticsInfo()
			if type(v21) == "table" and v21[v_u_5.WidgetNames("WidgetId")] then
				v21.Status = p19
				v_u_5.SetRBXEventStream("Widget", v21)
			end
		end
	end
end
function v_u_15.GetScreenGuiByPriority(_, p23) -- name: GetScreenGuiByPriority
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_1
	local v24 = math.max(1, p23)
	if not v_u_17[v24] then
		for v25 = 1, v24 do
			if v_u_17[v25] then
				continue
			end
			v_u_17[v25] = v_u_14("ScreenGui")({
				["Name"] = "AppShell" .. tostring(v25),
				["Parent"] = v_u_1
			})
		end
	end
	return v_u_17[v24]
end
function v_u_15.OpenScreen(_, p26, p27) -- name: OpenScreen
	-- upvalues: (copy) v_u_16, (copy) v_u_8, (copy) v_u_7, (copy) v_u_13, (copy) v_u_15, (copy) v_u_12, (copy) v_u_6, (copy) v_u_10
	local v28 = {
		["hidePrevious"] = p27 == nil and true or p27
	}
	local v29 = tostring(p26)
	v_u_16[v29] = {
		["screen"] = nil,
		["isShown"] = false,
		["screen"] = p26
	}
	local v30 = v_u_8.new
	local v31 = v_u_7.DefaultPriority
	if p26.GetPriority ~= nil then
		v31 = p26:GetPriority()
	end
	local v32 = v30(v29, v31, v28)
	local v33 = v_u_13() > 0 and v_u_15:GetTopScreen()
	if v33 then
		v_u_12:setLastSelectedContent(v33)
	end
	v_u_6.store:dispatch(v_u_10(v32))
end
function v_u_15.CloseCurrent(_, p34) -- name: CloseCurrent
	-- upvalues: (copy) v_u_6, (copy) v_u_16, (copy) v_u_11
	local v35 = v_u_6.store:getState().ScreenList
	local v36
	if #v35 > 0 then
		v36 = v35[1]
	else
		v36 = false
	end
	if v36 and v_u_16[v36.id] then
		if not p34 or v36.id == tostring(p34) then
			v_u_6.store:dispatch(v_u_11(v36))
		end
	else
		return
	end
end
local function v_u_45(p37) -- name: handleScreensRemoved
	-- upvalues: (copy) v_u_16, (copy) v_u_22
	local v38 = {}
	for _, v39 in ipairs(p37) do
		v38[v39.id] = true
	end
	local v40 = {}
	for v41, _ in pairs(v_u_16) do
		if v38[v41] then
			continue
		end
		table.insert(v40, v41)
	end
	for _, v42 in ipairs(v40) do
		local v43 = v_u_16[v42]
		if v43 then
			local v44 = v43.screen
			v44:RemoveFocus()
			v44:Hide()
			if v44.ScreenRemoved then
				v44:ScreenRemoved()
			end
			v_u_22(v44, "Close")
		end
		v_u_16[v42] = nil
	end
end
local function v_u_53(p46) -- name: handleScreensAdded
	-- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_9, (copy) v_u_5
	for v47 = #p46, 1, -1 do
		local v48 = v_u_16[p46[v47].id]
		if not v48 then
			continue
		end
		local v49 = v48.screen
		if v47 > 1 then
			local v50 = p46[v47 - 1]
			local v51 = not (v50 and v50.data) and true or v50.data.hidePrevious
			v49:RemoveFocus()
			if v51 then
				v49:Hide()
				v48.isShown = false
			end
			if v48.isShown or v51 then
				continue
			end
			v49:Show()
			v48.isShown = true
		else
			if not v48.isShown then
				v49:Show()
				v48.isShown = true
				v_u_22(v49, "Show")
			end
			v49:Focus()
			v_u_22(v49, "Focus")
			local v52 = v48.screen.GetAnalyticsInfo
			if v52 then
				v52 = v48.screen.GetAnalyticsInfo()
			end
			if not v52 then
				continue
			end
			v_u_9.onPageChanged(v52[v_u_5.WidgetNames("WidgetId")])
		end
	end
	v_u_5.reportPageChanged()
end
v_u_6.store.changed:connect(function(p54, p55)
	-- upvalues: (copy) v_u_45, (copy) v_u_53
	local v56 = p54.ScreenList
	if v56 ~= p55.ScreenList then
		v_u_45(v56)
		v_u_53(v56)
	end
end)
function v_u_15.GetTopScreen(_) -- name: GetTopScreen
	-- upvalues: (copy) v_u_6, (copy) v_u_16
	local v57 = v_u_6.store:getState().ScreenList
	if v57 and #v57 > 0 then
		return v_u_16[v57[1].id].screen
	else
		return nil
	end
end
return v_u_15