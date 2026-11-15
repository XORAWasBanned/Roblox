-- Path: CoreGui.RobloxGui.Modules.InGameMenu.SetupFunctions.bindMenuActions
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = UserSettings():GetService("UserGameSettings")
local v_u_5 = require(v1.RobloxGui.Modules.DevConsoleMaster)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Thunks.OpenSystemMenu)
local v_u_8 = require(v6.Thunks.CloseMenu)
local v_u_9 = require(v6.Actions.SetRespawning)
local v_u_10 = require(v6.Actions.SetCurrentPage)
local v_u_11 = require(v6.Actions.NavigateBack)
local v_u_12 = require(v6.Actions.SetCurrentZone)
local v_u_13 = require(v6.Components.Pages)
local v_u_14 = require(v6.Resources.Constants)
return function(p_u_15) -- name: bindMenuActions
	-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_14, (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12
	v_u_2:BindCoreAction("ToggleInGameMenu", function(_, p16, _) -- name: toggleMenuFunc
		-- upvalues: (copy) p_u_15, (ref) v_u_13, (ref) v_u_10, (ref) v_u_14, (ref) v_u_7, (ref) v_u_8
		if p16 == Enum.UserInputState.Begin then
			local v17 = p_u_15:getState()
			local v18 = v17.isMenuOpen
			local v19 = v_u_13.pagesByKey[v17.menuPage]
			if v19 and v19.isModal then
				p_u_15:dispatch(v_u_10(v_u_14.defaultPageKey))
				return
			elseif v18 then
				if v17.menuPage == v_u_14.InitalPageKey then
					p_u_15:dispatch(v_u_7(v_u_14.AnalyticsMenuOpenTypes.Keyboard))
				else
					p_u_15:dispatch(v_u_8)
				end
			else
				p_u_15:dispatch(v_u_7(v_u_14.AnalyticsMenuOpenTypes.Keyboard))
				return
			end
		else
			return
		end
	end, false, Enum.KeyCode.Escape)
	v_u_2:BindCoreAction("ToggleDeveloperConsole", function(p20, p21)
		-- upvalues: (ref) v_u_5
		if p20 == "ToggleDeveloperConsole" then
			if p21 == Enum.UserInputState.Begin then
				v_u_5:ToggleVisibility()
			end
		else
			return
		end
	end, false, Enum.KeyCode.F9)
	v_u_2:BindCoreAction("TogglePerformanceStats", function(p22, p23)
		-- upvalues: (ref) v_u_3, (ref) v_u_4
		if v_u_3:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_3:IsKeyDown(Enum.KeyCode.RightControl) then
			if p22 == "TogglePerformanceStats" then
				if p23 == Enum.UserInputState.Begin then
					v_u_4.PerformanceStatsVisible = not v_u_4.PerformanceStatsVisible
				end
			else
				return
			end
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, Enum.KeyCode.F7)
	v_u_2:BindCoreAction("LeaveGame", function(_, p24, _) -- name: leaveGameFunc
		-- upvalues: (copy) p_u_15, (ref) v_u_13, (ref) v_u_10, (ref) v_u_14
		local v25 = p_u_15:getState()
		if p24 ~= Enum.UserInputState.Begin or not v25.isMenuOpen then
			return Enum.ContextActionResult.Pass
		end
		if v_u_13.pagesByKey[v25.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		end
		p_u_15:dispatch(v_u_10(v_u_14.LeaveGamePromptPageKey))
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.L, Enum.KeyCode.ButtonX)
	v_u_2:BindCoreAction("ResetCharacter", function(_, p26, _) -- name: resetCharacterFunc
		-- upvalues: (copy) p_u_15, (ref) v_u_13, (ref) v_u_14, (ref) v_u_9
		local v27 = p_u_15:getState()
		if p26 ~= Enum.UserInputState.Begin or not v27.isMenuOpen then
			return Enum.ContextActionResult.Pass
		end
		if not v27.respawn.enabled then
			return Enum.ContextActionResult.Pass
		end
		if v_u_13.pagesByKey[v27.menuPage].isModal then
			return Enum.ContextActionResult.Pass
		end
		if v27.menuPage == v_u_14.InitalPageKey then
			return Enum.ContextActionResult.Pass
		end
		p_u_15:dispatch(v_u_9(true))
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.R, Enum.KeyCode.ButtonY)
	v_u_2:BindCoreAction("NavigateBack", function(_, p28, _) -- name: navigateBackFunc
		-- upvalues: (copy) p_u_15, (ref) v_u_13, (ref) v_u_5, (ref) v_u_8, (ref) v_u_11
		local v29 = p_u_15:getState()
		local v30 = v_u_13.pagesByKey[v29.menuPage].parentPage
		local v31 = v_u_5:GetVisibility()
		if p28 ~= Enum.UserInputState.End or not (v29.isMenuOpen or v31) then
			return Enum.ContextActionResult.Pass
		end
		if v31 then
			v_u_5:SetVisibility(false)
		elseif v30 == nil and not v29.respawn.dialogOpen then
			p_u_15:dispatch(v_u_8)
		else
			p_u_15:dispatch(v_u_11())
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB)
	v_u_2:BindCoreAction("LeftBumperSwitchToZone0", function(_, p32, _)
		-- upvalues: (copy) p_u_15, (ref) v_u_12
		if p32 == Enum.UserInputState.Begin then
			local v33 = p_u_15:getState()
			local v34 = v33.menuPage ~= "Controls" and v33.isMenuOpen and not (v33.respawn.dialogOpen or v33.report.dialogOpen)
			if v34 then
				v34 = not v33.report.reportSentOpen
			end
			if v34 then
				p_u_15:dispatch(v_u_12(0))
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonL1)
	v_u_2:BindCoreAction("RightBumperSwitchToZone1", function(_, p35, _)
		-- upvalues: (copy) p_u_15, (ref) v_u_12
		if p35 == Enum.UserInputState.Begin then
			local v36 = p_u_15:getState()
			local v37 = v36.menuPage ~= "Controls" and v36.isMenuOpen and not (v36.respawn.dialogOpen or v36.report.dialogOpen)
			if v37 then
				v37 = not v36.report.reportSentOpen
			end
			if v37 then
				p_u_15:dispatch(v_u_12(1))
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonR1)
end