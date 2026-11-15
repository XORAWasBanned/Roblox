-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.VersionReporter
local v_u_1 = game:GetService("RbxAnalyticsService")
local v_u_2 = game:GetService("ContentProvider")
local v3 = game:GetService("CoreGui")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("HttpRbxApiService")
local v_u_6 = game:GetService("HttpService")
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("RobloxReplicatedStorage")
local v_u_9 = game:GetService("RunService")
local v_u_10 = game:GetService("StarterPlayer")
local v11 = v3:WaitForChild("RobloxGui")
local v12 = require(v4.Packages.InGameMenuDependencies)
local v_u_13 = v12.Roact
local v14 = v12.t
local v_u_15 = require(v4.Packages.Foundation).Skeleton
local v_u_16 = require(v3.RobloxGui.Modules.PlayerPermissionsModule)
local v17 = script.Parent.Parent.Parent
local v_u_18 = require(v17.Resources.Constants)
local v_u_19 = require(v17.Components.Divider)
local v_u_20 = require(v17.Components.ThemedTextLabel)
local v_u_21 = require(v17.Utility.ExternalEventConnection)
local v_u_22 = require(v17.Localization.withLocalization)
local v_u_23 = game:GetEngineFeature("CoreScriptVersionEnabled")
local v_u_24 = require(v11.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions)
local v_u_25 = require(v11.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint)
local v26 = v_u_13.PureComponent:extend("VersionReporter")
v26.validateProps = v14.strictInterface({
	["LayoutOrder"] = v14.integer
})
local function v_u_40(p27) -- name: inferPlayerScriptStatus
	-- upvalues: (copy) v_u_18, (copy) v_u_1, (copy) v_u_24
	local v28 = p27:FindFirstChild("PlayerScriptsLoader")
	local v29 = p27:FindFirstChild("PlayerModule")
	local v30
	if v28 == nil or v29 == nil then
		local v31 = p27:FindFirstChild("CameraScript")
		local v32 = p27:FindFirstChild("ControlScript")
		if v31 == nil and v32 == nil then
			v30 = v_u_18.PlayerScriptStatusStrings.Custom
		else
			v30 = v_u_18.PlayerScriptStatusStrings.CustomOld
		end
	elseif v29.Archivable or v28.Archivable then
		v30 = v_u_18.PlayerScriptStatusStrings.PossiblyCustom
	else
		v30 = v_u_18.PlayerScriptStatusStrings.Default
	end
	local v33 = v_u_1
	local v34 = v_u_18.AnalyticsTargetName
	local v35 = "player_scripts_status"
	local v36 = "player_scripts_status_action"
	local v37 = {
		["defaultPlayerScripts"] = v30 == v_u_18.PlayerScriptStatusStrings.Default
	}
	local v38 = game.PlaceId
	v37.placeID = tostring(v38)
	local v39
	if v_u_24() then
		v39 = v30
	else
		v39 = nil
	end
	v37.rawValue = v39
	v37.context = v_u_24() and "IGMv2" or nil
	v33:SetRBXEventStream(v34, v35, v36, v37)
	return v30
end
function v26.init(p_u_41) -- name: init
	-- upvalues: (copy) v_u_10, (copy) v_u_40, (copy) v_u_2, (copy) v_u_9, (copy) v_u_23
	local v42 = "PlayerScript Status: Unknown"
	local v43 = v_u_10:FindFirstChild("StarterPlayerScripts")
	if v43 then
		v42 = v_u_40(v43)
	else
		p_u_41.playerScriptsAddedConnection = v_u_10.ChildAdded:Connect(function(p44)
			-- upvalues: (copy) p_u_41, (ref) v_u_40
			if p44.Name == "StarterPlayerScripts" then
				p_u_41.playerScriptsAddedConnection:Disconnect()
				p_u_41.playerScriptsAddedConnection = nil
				p_u_41:setState({
					["playerScriptStatus"] = v_u_40(p44)
				})
			end
		end)
	end
	p_u_41:setState({
		["baseUrl"] = nil,
		["clientVersion"] = nil,
		["isAdmin"] = false,
		["latestPlaceVersion"] = nil,
		["placeVersion"] = nil,
		["serverVersion"] = nil,
		["playerScriptStatus"] = nil,
		["coreScriptVersion"] = nil,
		["baseUrl"] = v_u_2.BaseUrl,
		["clientVersion"] = v_u_9:GetRobloxVersion(),
		["placeVersion"] = game.PlaceVersion,
		["playerScriptStatus"] = v42,
		["coreScriptVersion"] = v_u_23 and v_u_9:GetCoreScriptVersion() or nil
	})
end
function v26.render(p_u_45) -- name: render
	-- upvalues: (copy) v_u_22, (copy) v_u_23, (copy) v_u_9, (copy) v_u_13, (copy) v_u_20, (copy) v_u_15, (copy) v_u_19, (copy) v_u_21
	local v_u_46 = p_u_45.state.serverVersion ~= nil
	local v47 = p_u_45.state.latestPlaceVersion ~= nil
	local v_u_48 = not p_u_45.state.baseUrl:find("www.roblox.com")
	local v_u_49 = v_u_48 or p_u_45.state.isAdmin
	return v_u_22({
		["clientVersion"] = {
			"CoreScripts.InGameMenu.GameSettings.ClientVersion",
			["CLIENT_VERSION"] = p_u_45.state.clientVersion
		},
		["serverVersion"] = {
			"CoreScripts.InGameMenu.GameSettings.ServerVersion",
			["SERVER_VERSION"] = p_u_45.state.serverVersion
		},
		["placeVersion"] = {
			v47 and "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest" or "CoreScripts.InGameMenu.GameSettings.PlaceVersion",
			["PLACE_VERSION"] = p_u_45.state.placeVersion,
			["LATEST_PLACE_VERSION"] = p_u_45.state.latestPlaceVersion
		},
		["coreScriptVersion"] = v_u_23 and ({
			"CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion",
			["CLIENT_CORESCRIPT_VERSION"] = p_u_45.state.coreScriptVersion
		} or nil) or nil
	})(function(p50)
		-- upvalues: (ref) v_u_9, (ref) v_u_13, (copy) p_u_45, (ref) v_u_20, (copy) v_u_46, (ref) v_u_15, (copy) v_u_48, (copy) v_u_49, (ref) v_u_19, (ref) v_u_23, (ref) v_u_21
		local v51 = p50.clientVersion
		local function v52()
			-- upvalues: (ref) v_u_9
			return v_u_9.ClientGitHash
		end
		local v53, v54 = pcall(v52)
		if v53 then
			v51 = string.format("%s (%.6s)", v51, v54)
		end
		local v55 = v_u_13.createElement
		local v56 = "Frame"
		local v57 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 80),
			["LayoutOrder"] = p_u_45.props.LayoutOrder
		}
		local v58 = {
			["Padding"] = v_u_13.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 14),
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingBottom"] = UDim.new(0, 14)
			}),
			["Layout"] = v_u_13.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 10)
			}),
			["ClientVersion"] = v_u_13.createElement(v_u_20, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Footer",
				["Text"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = nil,
				["Text"] = v51,
				["Size"] = UDim2.new(1, -24, 0, 14)
			})
		}
		local v59 = v_u_13.createElement
		local v60 = v_u_20
		local v61 = {
			["themeKey"] = "TextDefault",
			["fontKey"] = "Footer",
			["Text"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Text"] = v_u_46 and (p50.serverVersion or "") or "",
			["Size"] = UDim2.new(1, -24, 0, 14)
		}
		local v62 = {}
		local v63 = not v_u_46
		if v63 then
			v63 = v_u_13.createElement(v_u_15, {
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
		end
		__set_list(v62, 1, {v63})
		v58.ServerVersion = v59(v60, v61, v62)
		v58.PlaceVersion = v_u_13.createElement(v_u_20, {
			["themeKey"] = "TextDefault",
			["fontKey"] = "Footer",
			["Text"] = nil,
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["Text"] = p50.placeVersion,
			["Size"] = UDim2.new(1, -24, 0, 14)
		})
		local v64 = v_u_48 or v_u_49
		if v64 then
			v64 = v_u_13.createElement(v_u_19, {
				["Size"] = nil,
				["LayoutOrder"] = 4,
				["Size"] = UDim2.new(1, 0, 0, 1)
			})
		end
		v58.Divider = v64
		local v65 = v_u_49
		if v65 then
			v65 = v_u_13.createElement(v_u_20, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Footer",
				["Text"] = nil,
				["LayoutOrder"] = 5,
				["Size"] = nil,
				["Text"] = p_u_45.state.playerScriptStatus,
				["Size"] = UDim2.new(1, -24, 0, 14)
			})
		end
		v58.PlayerScriptStatus = v65
		local v66 = v_u_48
		if v66 then
			v66 = v_u_13.createElement(v_u_20, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Footer",
				["Text"] = nil,
				["LayoutOrder"] = 6,
				["Size"] = nil,
				["Text"] = ("Base URL: %s"):format(p_u_45.state.baseUrl),
				["Size"] = UDim2.new(1, -24, 0, 14)
			})
		end
		v58.Environment = v66
		local v67 = v_u_23
		if v67 then
			v67 = v_u_13.createElement(v_u_19, {
				["Size"] = nil,
				["LayoutOrder"] = 7,
				["Size"] = UDim2.new(1, 0, 0, 1)
			})
		end
		v58.Divider2 = v67
		local v68 = v_u_23
		if v68 then
			v68 = v_u_13.createElement(v_u_20, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Footer",
				["Text"] = nil,
				["LayoutOrder"] = 8,
				["Size"] = nil,
				["Text"] = p50.coreScriptVersion,
				["Size"] = UDim2.new(1, -24, 0, 14)
			})
		end
		v58.CoreScriptVersion = v68
		v58.VersionWatcher = v_u_13.createElement(v_u_21, {
			["event"] = game:GetPropertyChangedSignal("PlaceVersion"),
			["callback"] = function() -- name: callback
				-- upvalues: (ref) p_u_45
				p_u_45:setState({
					["placeVersion"] = game.PlaceVersion
				})
			end
		})
		return v55(v56, v57, v58)
	end)
end
function v26.didMount(p_u_69) -- name: didMount
	-- upvalues: (copy) v_u_8, (copy) v_u_25, (copy) v_u_5, (copy) v_u_6, (copy) v_u_16, (copy) v_u_7
	p_u_69.mounted = true
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_8, (copy) p_u_69
		local v70 = v_u_8:WaitForChild("GetServerVersion", (1 / 0)):InvokeServer()
		if p_u_69.mounted then
			p_u_69:setState({
				["serverVersion"] = v70
			})
		end
	end)()
	if not v_u_25() then
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_6, (copy) p_u_69
			local function v72()
				-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) p_u_69
				local v71 = v_u_6:JSONDecode((v_u_5:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber
				if p_u_69.mounted then
					p_u_69:setState({
						["latestPlaceVersion"] = v71
					})
				end
			end
			pcall(v72)
		end)()
	end
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_16, (ref) v_u_7, (copy) p_u_69
		local v73 = v_u_16.IsPlayerAdminAsync(v_u_7.LocalPlayer)
		if p_u_69.mounted then
			p_u_69:setState({
				["isAdmin"] = v73
			})
		end
	end)()
end
function v26.willUnmount(p74) -- name: willUnmount
	p74.mounted = false
	if p74.playerScriptsAddedConnection then
		p74.playerScriptsAddedConnection:Disconnect()
	end
end
return v26