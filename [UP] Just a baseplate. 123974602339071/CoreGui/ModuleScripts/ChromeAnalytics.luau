-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Analytics.ChromeAnalytics
local v1 = script:FindFirstAncestor("ChromeShared")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("UserInputService")
local v6 = game:GetService("Players")
local v_u_7 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_8 = v6.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local v_u_9 = require(v3.Packages.Cryo)
local v_u_10 = require(v1.Service)
local v_u_11 = require(v1.Unibar.Constants)
require(v3.Workspace.Packages.Chrome)
local v_u_12 = require(v3.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_13 = require(v1.Parent.Flags.FFlagIntegrationsChromeShortcutTelemetry)
local v_u_14 = require(v1.Analytics.Tracker)
local v_u_15 = {}
v_u_15.__index = v_u_15
local function v_u_20() -- name: getDynamicEventProps
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (copy) v_u_5
	local v16
	if v_u_8 then
		v16 = v_u_11.ANALYTICS.SCREEN_ORIENTATION_MAP[v_u_8.CurrentScreenOrientation]
		if not v16 then
			local v17 = v_u_8.CurrentScreenOrientation
			v16 = tostring(v17)
		end
	else
		v16 = "Unknown"
	end
	local v18 = v_u_11.ANALYTICS.INPUT_TYPE_MAP[v_u_5:GetLastInputType()]
	if not v18 then
		local v19 = v_u_5
		v18 = tostring(v19:GetLastInputType())
	end
	return {
		["screen_orientation"] = v16,
		["last_input_device"] = v18
	}
end
function v_u_15.new() -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_15, (copy) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_20, (copy) v_u_4, (copy) v_u_13
	local v21 = {
		["_target"] = "client",
		["_context"] = "chrome",
		["_defaultProps"] = nil,
		["_tracker"] = nil
	}
	local v22 = {
		["screen_width"] = 0,
		["screen_height"] = 0,
		["universeid"] = nil,
		["placeid"] = nil,
		["sessionid"] = nil,
		["is_game_menu_opened"] = false
	}
	local v23 = game.GameId
	v22.universeid = tostring(v23)
	local v24 = game.PlaceId
	v22.placeid = tostring(v24)
	v22.sessionid = v_u_2:GetSessionId()
	v21._defaultProps = v22
	v21._tracker = v_u_14.new()
	local v25 = v_u_15
	local v_u_26 = setmetatable(v21, v25)
	if v_u_7 then
		v_u_26._defaultProps.playsessionid = v_u_2:GetPlaySessionId()
	end
	function v_u_26._observeIntegration(p_u_27)
		-- upvalues: (ref) v_u_10, (copy) v_u_26
		local v_u_28 = v_u_10:integrations()[p_u_27]
		if v_u_28 and v_u_28.windowSize then
			v_u_26._tracker:set("window_size_" .. p_u_27, v_u_28.windowSize:get())
			v_u_28.windowSize:connect(function(p29)
				-- upvalues: (copy) v_u_28, (ref) v_u_26, (copy) p_u_27
				if typeof(p29) == "UDim2" then
					local v30 = v_u_28.windowSize:get()
					local v31 = v_u_26._tracker:get("window_status_" .. p_u_27)
					local v32 = "window_size_" .. p_u_27
					if v31 == 1 then
						if v_u_26._tracker:get(v32) then
							v_u_26:onWindowResize(p_u_27, v30)
						end
						v_u_26._tracker:set(v32, v30)
					end
				end
			end)
		end
	end
	function v_u_26._resetWindowTrackers(p33)
		-- upvalues: (copy) v_u_26
		v_u_26._tracker:reset("window_dposition_" .. p33)
		v_u_26._tracker:reset("window_position_" .. p33)
		v_u_26._tracker:reset("window_size_" .. p33)
		v_u_26._tracker:reset("window_drag_" .. p33)
		v_u_26._tracker:reset("window_status_" .. p33)
	end
	function v_u_26._defaultWindowTrackers(p34)
		-- upvalues: (copy) v_u_26
		v_u_26._resetWindowTrackers(p34)
		v_u_26._tracker:startTime("window_time_" .. p34)
		v_u_26._tracker:set("window_status_" .. p34, 1)
	end
	function v_u_26._sendEvent(p35, p36)
		-- upvalues: (ref) v_u_9, (ref) v_u_20, (copy) v_u_26, (ref) v_u_2
		local v37 = v_u_9.Dictionary.join(v_u_20(), v_u_26._defaultProps, p36 or {})
		v_u_2:SendEventDeferred(v_u_26._target, v_u_26._context, p35, v37)
	end
	function v_u_26._calculateWindowAbsolutePosition(p38, p39)
		-- upvalues: (copy) v_u_26
		local v40 = v_u_26._defaultProps.screen_width
		local v41 = v_u_26._defaultProps.screen_height
		return Vector2.new(p38.X.Scale * v40 + p38.X.Offset - p39.Width.Offset / 2, p38.Y.Scale * v41 + p38.Y.Offset - p39.Height.Offset / 2)
	end
	function v_u_26._setWindowLastPosition(p42, p43)
		-- upvalues: (copy) v_u_26
		v_u_26._tracker:set("window_position_" .. p42, p43)
	end
	v_u_4.MenuOpened:Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26._defaultProps.is_game_menu_opened = not v_u_26._defaultProps.is_game_menu_opened
	end)
	for _, v44 in v_u_10:integrations() do
		v_u_26._observeIntegration(v44.id)
	end
	v_u_10:onIntegrationRegistered():connect(function(p45)
		-- upvalues: (copy) v_u_26
		v_u_26._observeIntegration(p45)
	end)
	v_u_10:onIntegrationActivated():connect(function(p46, p47)
		-- upvalues: (ref) v_u_13, (copy) v_u_26
		if v_u_13 then
			v_u_26:onIconActivated(p46, p47)
		else
			v_u_26:onIconActivated(p46)
		end
	end)
	v_u_10:onIntegrationStatusChanged():connect(function(p48, p49)
		-- upvalues: (ref) v_u_10, (copy) v_u_26
		local v50 = v_u_10:integrations()[p48]
		if v50 and v50.components.Window then
			if p49 == v_u_10.IntegrationStatus.Window then
				v_u_26:onWindowOpened(p48)
				return
			end
			v_u_26:onWindowClosed(p48)
		end
	end)
	return v_u_26
end
function v_u_15.setScreenSize(p51, p52) -- name: setScreenSize
	p51._defaultProps.screen_width = p52.X
	p51._defaultProps.screen_height = p52.Y
	return nil
end
function v_u_15.onIconActivated(p53, p54, p55) -- name: onIconActivated
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
	local v56 = v_u_10:integrations()[p54]
	if v56 then
		local v57 = v56.notification:get()
		local v58
		if v57.type == "count" then
			local v59 = v57.value
			v58 = tonumber(v59) or 0
		else
			v58 = 0
		end
		local v60
		if v56.isActivated then
			v60 = not v56.isActivated:get()
		else
			v60 = nil
		end
		local v61 = p53._sendEvent
		local v62 = v_u_11.ANALYTICS.ICON_ACTIVATED
		local v63 = {
			["integration_id"] = p54
		}
		local v64
		if v_u_12 and v_u_10:withinOpenSideSheet(p54) then
			v64 = "sidesheet"
		elseif v_u_10:withinCurrentSubmenu(p54) then
			v64 = v_u_10:currentSubMenu():get()
		else
			v64 = v_u_10:withinCurrentTopLevelMenu(p54) and "unibar" or "unknown"
		end
		v63.source = v64
		v63.notification_count = v58
		v63.is_toggle_on = v60
		local v65
		if v_u_13 and p55 then
			v65 = p55.fromShortcut or false
		else
			v65 = nil
		end
		v63.used_shortcut = v65
		v61(v62, v63)
	end
	return nil
end
function v_u_15.onIconTouchBegan(p66, p67) -- name: onIconTouchBegan
	p66._tracker:set("icon_drag_" .. p67, 1)
	return nil
end
function v_u_15.onIconDrag(p68, p69) -- name: onIconDrag
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_10
	local v70 = "icon_drag_" .. p69
	if p68._tracker:get(v70) == 1 then
		p68._tracker:set(v70, 2)
		local v71 = p68._sendEvent
		local v72 = v_u_11.ANALYTICS.ICON_DRAG_START
		local v73 = {
			["integration_id"] = p69
		}
		local v74
		if v_u_12 and v_u_10:withinOpenSideSheet(p69) then
			v74 = "sidesheet"
		elseif v_u_10:withinCurrentSubmenu(p69) then
			v74 = v_u_10:currentSubMenu():get()
		else
			v74 = v_u_10:withinCurrentTopLevelMenu(p69) and "unibar" or "unknown"
		end
		v73.source = v74
		v71(v72, v73)
	end
	return nil
end
function v_u_15.onIconTouchEnded(p75, p76, p77, p78) -- name: onIconTouchEnded
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	local v79 = "icon_drag_" .. p76
	local v80 = p75._tracker:get(v79)
	local v81 = v_u_10:integrations()[p76]
	if v81 and (v81.windowSize and v80 == 2) then
		p75._tracker:reset(v79)
		p75._setWindowLastPosition(p76, p77)
		local v82 = v81.windowSize:get()
		local v83 = p75._sendEvent
		local v84 = v_u_11.ANALYTICS.ICON_DRAG_END
		local v85 = {
			["integration_id"] = p76
		}
		local v86
		if v_u_12 and v_u_10:withinOpenSideSheet(p76) then
			v86 = "sidesheet"
		elseif v_u_10:withinCurrentSubmenu(p76) then
			v86 = v_u_10:currentSubMenu():get()
		else
			v86 = v_u_10:withinCurrentTopLevelMenu(p76) and "unibar" or "unknown"
		end
		v85.source = v86
		v85.window_position_x = p77.X
		v85.window_position_y = p77.Y
		v85.window_width = v82.Width.Offset
		v85.window_height = v82.Height.Offset
		v85.will_reposition = p78
		v83(v84, v85)
	end
	return nil
end
function v_u_15.onWindowOpened(p87, p88) -- name: onWindowOpened
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v89 = v_u_10:integrations()[p88]
	if v89 and p87._tracker:get("window_status_" .. p88) ~= 1 then
		p87._defaultWindowTrackers(p88)
		local v90 = "window_dposition_" .. p88
		local v91 = (not p87._tracker:get(v90) and v89.windowSize and true or false) and v89.windowSize:get()
		if v91 then
			local v92 = v_u_10:windowPosition(v89.id) or (v89.startingWindowPosition or UDim2.fromOffset(0, 0))
			p87:setWindowDefaultPosition(p88, (p87._calculateWindowAbsolutePosition(v92, v91)))
		end
		p87._sendEvent(v_u_11.ANALYTICS.WINDOW_OPENED, {
			["integration_id"] = p88
		})
	end
	return nil
end
function v_u_15.onWindowClosed(p93, p94) -- name: onWindowClosed
	-- upvalues: (copy) v_u_11
	if p93._tracker:get("window_status_" .. p94) == 1 then
		p93._sendEvent(v_u_11.ANALYTICS.WINDOW_CLOSED, {
			["integration_id"] = p94,
			["total_open_time"] = p93._tracker:finishTime("window_time_" .. p94)
		})
		p93._resetWindowTrackers(p94)
	end
	return nil
end
function v_u_15.onWindowTouchBegan(p95, p96, _) -- name: onWindowTouchBegan
	-- upvalues: (copy) v_u_10
	local v97 = v_u_10:integrations()[p96]
	if v97 and v97.windowSize then
		p95._tracker:set("window_drag_" .. p96, 1)
	end
	return nil
end
function v_u_15.onWindowDrag(p98, p99, p100) -- name: onWindowDrag
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v101 = "window_drag_" .. p99
	local v102 = p98._tracker:get(v101)
	local v103 = v_u_10:integrations()[p99]
	local v104 = v103 and (v103.windowSize and (v102 == 1 and p98._tracker:get("window_position_" .. p99)))
	if v104 then
		local v105 = Vector2.new(p100.X - v104.X, p100.Y - v104.Y)
		if v105.X ~= 0 or v105.Y ~= 0 then
			p98._tracker:set(v101, 2)
			local v106 = v103.windowSize:get()
			local v107 = p98._tracker:get("window_dposition_" .. p99)
			p98._sendEvent(v_u_11.ANALYTICS.WINDOW_DRAG_START, {
				["integration_id"] = p99,
				["position_x"] = v104.X,
				["position_y"] = v104.Y,
				["width"] = v106.Width.Offset,
				["height"] = v106.Height.Offset,
				["is_starting_position"] = v107 == v104
			})
		end
	end
	return nil
end
function v_u_15.onWindowTouchEnded(p108, p109, p110, p111) -- name: onWindowTouchEnded
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v112 = p108._tracker:get("icon_drag_" .. p109)
	local v113 = v_u_10:integrations()[p109]
	if v112 == 2 then
		return p108:onIconTouchEnded(p109, p110, p111)
	end
	local v114 = "window_drag_" .. p109
	local v115 = p108._tracker:get(v114)
	if v113 and (v113.windowSize and v115 == 2) then
		local v116 = v113.windowSize:get()
		p108._tracker:reset(v114)
		p108._setWindowLastPosition(p109, p110)
		p108._sendEvent(v_u_11.ANALYTICS.WINDOW_DRAG_END, {
			["integration_id"] = p109,
			["position_x"] = p110.X,
			["position_y"] = p110.Y,
			["width"] = v116.Width.Offset,
			["height"] = v116.Height.Offset,
			["will_autoposition"] = p111
		})
	end
	return nil
end
function v_u_15.setWindowDefaultPosition(p117, p118, p119) -- name: setWindowDefaultPosition
	p117._tracker:set("window_dposition_" .. p118, p119)
	p117._setWindowLastPosition(p118, p119)
	return nil
end
function v_u_15.onWindowResize(p120, p121, p122) -- name: onWindowResize
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	local v123 = v_u_10:integrations()[p121]
	if v123 and v123.windowSize then
		local v124 = "window_size_" .. p121
		local v125 = "window_position_" .. p121
		local v126 = p120._tracker:get(v124)
		local v127 = p120._tracker:get(v125)
		local v128
		if v127 then
			local v129 = (v126.Height.Offset - p122.Height.Offset) / 2
			local v130 = (v126.Width.Offset - p122.Width.Offset) / 2
			v128 = Vector2.new(v127.X + v130, v127.Y + v129)
		else
			v128 = nil
		end
		if v128 then
			p120._setWindowLastPosition(p121, v128)
		end
		p120._tracker:set(v124, p122)
		local v131 = p120._sendEvent
		local v132 = v_u_11.ANALYTICS.WINDOW_RESIZE
		local v133 = {
			["integration_id"] = p121
		}
		local v134
		if v127 then
			v134 = v127.X or nil
		else
			v134 = nil
		end
		v133.previous_position_x = v134
		v133.previous_position_y = v127 and v127.Y or nil
		local v135
		if v126 then
			v135 = v126.Width.Offset or nil
		else
			v135 = nil
		end
		v133.previous_width = v135
		v133.previous_height = v126 and v126.Height.Offset or nil
		local v136
		if v128 then
			v136 = v128.X or nil
		else
			v136 = nil
		end
		v133.current_position_x = v136
		v133.current_position_y = v128 and v128.Y or nil
		v133.current_width = p122.Width.Offset
		v133.current_height = p122.Height.Offset
		v131(v132, v133)
	end
	return nil
end
v_u_15.default = v_u_15.new()
return v_u_15