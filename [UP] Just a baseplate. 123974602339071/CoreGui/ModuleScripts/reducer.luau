-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Cryo
local v3 = script.Parent
local v4 = require(v3.Actions.SetMenuOpen)
local v5 = require(v3.Actions.SetMainPageMoreMenuOpen)
local v6 = require(v3.Actions.SetCurrentPage)
local v7 = require(v3.Actions.SetScreenSize)
local v8 = require(v3.Actions.StartLeavingGame)
local v9 = require(v3.Actions.CancelLeavingGame)
local v10 = require(v3.Actions.SetControlLayout)
local v11 = require(v3.Actions.SetRespawning)
local v12 = require(v3.Actions.SetCurrentZone)
local v13 = require(v3.Actions.SetControllerBarHeight)
local v14 = require(v3.Actions.DecrementControllerBar)
local v15 = require(v3.Actions.IncrementControllerBar)
local v_u_16 = require(script.navigationReducer)
local v_u_17 = require(script.respawn)
local v_u_18 = require(script.invites)
local v_u_19 = require(script.gameInfo)
local v_u_20 = require(script.report)
local v_u_21 = require(script.friends)
local v_u_22 = require(script.displayOptions)
local v_u_23 = require(script.nativeClosePrompt)
local v_u_24 = require(v3.Parent.VoiceChat.Reducers.voiceState)
local v_u_25 = require(v3.Resources.Constants)
local v_u_26 = require(v3.Resources.Controls)
local v_u_50 = {
	[v4.name] = function(p27, p28)
		-- upvalues: (copy) v_u_2
		local v29
		if p28.isMenuOpen then
			v29 = nil
		else
			v29 = false
		end
		return v_u_2.Dictionary.join(p27, {
			["isMenuOpen"] = p28.isMenuOpen,
			["isMainPageMoreMenuOpen"] = v29,
			["currentZone"] = p27.isMenuOpen ~= p28.isMenuOpen and 1 or nil
		})
	end,
	[v5.name] = function(p30, p31)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p30, {
			["isMainPageMoreMenuOpen"] = p31.isMainPageMoreMenuOpen
		})
	end,
	[v8.name] = function(p32, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p32, {
			["leavingGame"] = true
		})
	end,
	[v9.name] = function(p33, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p33, {
			["leavingGame"] = false
		})
	end,
	[v6.name] = function(p34, p35)
		-- upvalues: (copy) v_u_2, (copy) v_u_25
		return v_u_2.Dictionary.join(p34, {
			["menuPage"] = nil,
			["isMainPageMoreMenuOpen"] = false,
			["currentZone"] = nil,
			["menuPage"] = p35.newPage,
			["currentZone"] = p35.newPage == v_u_25.InitalPageKey and 0 or 1
		})
	end,
	[v10.name] = function(p36, p37)
		-- upvalues: (copy) v_u_2
		local v38 = {
			["controlLayout"] = p37.controlLayout
		}
		return v_u_2.Dictionary.join(p36, v38)
	end,
	[v7.name] = function(p39, p40)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p39, {
			["screenSize"] = p40.newScreenSize
		})
	end,
	[v11.name] = function(p41, p42)
		-- upvalues: (copy) v_u_2
		local v43
		if p42.respawning then
			v43 = false
		else
			v43 = p41.isMainPageMoreMenuOpen
		end
		return v_u_2.Dictionary.join(p41, {
			["isMainPageMoreMenuOpen"] = v43
		})
	end,
	[v12.name] = function(p44, p45)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p44, {
			["currentZone"] = p45.zone
		})
	end,
	[v13.name] = function(p46, p47)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p46, {
			["controllerBarHeight"] = p47.controllerBarHeight
		})
	end,
	[v15.name] = function(p48, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p48, {
			["controllerBarCount"] = p48.controllerBarCount + 1
		})
	end,
	[v14.name] = function(p49, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p49, {
			["controllerBarCount"] = p49.controllerBarCount - 1
		})
	end
}
return function(p51, p52) -- name: reducer
	-- upvalues: (copy) v_u_26, (copy) v_u_25, (copy) v_u_18, (copy) v_u_17, (copy) v_u_19, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_50, (copy) v_u_16, (copy) v_u_24, (copy) v_u_20
	local v53 = p51 == nil and {
		["controlLayout"] = nil,
		["isMenuOpen"] = false,
		["leavingGame"] = false,
		["currentZone"] = nil,
		["menuPage"] = nil,
		["voiceState"] = nil,
		["invites"] = nil,
		["respawn"] = nil,
		["gameInfo"] = nil,
		["friends"] = nil,
		["displayOptions"] = nil,
		["screenSize"] = nil,
		["recording"] = false,
		["isMainPageMoreMenuOpen"] = false,
		["nativeClosePrompt"] = nil,
		["controllerBarHeight"] = 0,
		["controllerBarCount"] = 0,
		["controlLayout"] = v_u_26.ControlLayouts.KEYBOARD,
		["menuPage"] = v_u_25.defaultPageKey,
		["invites"] = v_u_18(nil, p52),
		["respawn"] = v_u_17(nil, p52),
		["gameInfo"] = v_u_19(nil, p52),
		["friends"] = v_u_21(nil, p52),
		["displayOptions"] = v_u_22(nil, p52),
		["screenSize"] = Vector2.new(0, 0),
		["nativeClosePrompt"] = v_u_23(nil, p52)
	} or p51
	local v54 = v_u_50[p52.type]
	if v54 ~= nil then
		v53 = v54(v53, p52)
	end
	local v55 = v_u_16(v53, p52)
	v55.respawn = v_u_17(v55.respawn, p52)
	v55.invites = v_u_18(v55.invites, p52)
	v55.voiceState = v_u_24(v55.voiceState, p52)
	v55.gameInfo = v_u_19(v55.gameInfo, p52)
	v55.report = v_u_20(v55.report, p52)
	v55.friends = v_u_21(v55.friends, p52)
	v55.displayOptions = v_u_22(v55.displayOptions, p52)
	v55.nativeClosePrompt = v_u_23(v55.nativeClosePrompt, p52)
	return v55
end