-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareGamePageFrame
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("HttpRbxApiService")
local v_u_4 = game:GetService("RobloxReplicatedStorage")
local v5 = v_u_1:WaitForChild("RobloxGui", (1 / 0))
local v_u_6 = require(v2.Workspace.Packages.CoreScriptsCommon).Constants
local v7 = v_u_1.RobloxGui.Modules
local v8 = v7.Settings.Pages.ShareGame
local v_u_9 = require(v2.Packages.Promise)
local v_u_10 = require(v5.Modules.Settings.Utility)
local v11 = require(v7.Flags.GetFFlagEnableNewInviteMenu)
local v_u_12 = require(v2.Packages.Roact)
local v13 = require(v2.Packages.RoactRodux)
local v14 = require(v2.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local v_u_15 = require(v7.Common.httpRequest)
local v_u_16 = require(v8.Components.Header)
local v_u_17 = require(v8.Components.ConversationList)
local v_u_18 = require(v8.Constants)
local v_u_19 = require(v8.Components.ShareInviteLink)
local v_u_20 = require(v2.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v_u_21 = require(v8.Components.BackButton)
local v_u_22 = require(v8.Actions.SetGameInfoCreated)
local v_u_23, v_u_24
if v11() then
	v_u_23 = 52
	v_u_24 = 16
else
	v_u_23 = 44
	v_u_24 = 10
end
local v25 = v_u_12.PureComponent:extend("ShareGamePageFrame")
local v_u_26 = require(v8.Components.ErrorToaster)
function v25.init(p27) -- name: init
	p27.state = {
		["serverType"] = nil
	}
end
function v25.shouldShowInviteLink(p28, p29) -- name: shouldShowInviteLink
	-- upvalues: (copy) v_u_6, (copy) v_u_10
	return p28.props.experienceInviteShareLinkEnabled and (p28.state.serverType == v_u_6.STANDARD_SERVER and v_u_10:IsExperienceOlderThanOneWeek(p29)) and true or false
end
function v25.didMount(p_u_30) -- name: didMount
	-- upvalues: (copy) v_u_9, (copy) v_u_4
	p_u_30.props.fetchGameInfo()
	if p_u_30.state.serverType == nil then
		v_u_9.try(function()
			-- upvalues: (ref) v_u_4
			return v_u_4:WaitForChild("GetServerType", (1 / 0)):InvokeServer()
		end):andThen(function(p31)
			-- upvalues: (copy) p_u_30
			p_u_30:setState({
				["serverType"] = p31
			})
		end)
	end
end
function v25.render(p32) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_21, (ref) v_u_23, (copy) v_u_12, (copy) v_u_1, (copy) v_u_26, (copy) v_u_16, (copy) v_u_19, (copy) v_u_17, (ref) v_u_24
	local v33 = p32.props.analytics
	local v34 = p32.props.deviceLayout
	local v35 = p32.props.zIndex
	local v36 = p32.props.closePage
	local v37 = p32.props.searchAreaActive
	local v38 = p32.props.searchText
	local v39 = v_u_18.LayoutSpecific[v34]
	local v40 = v39.HEADER_HEIGHT
	local v41 = v34 == v_u_18.DeviceLayout.DESKTOP
	local v42 = not v41 and v_u_21.IconType.Arrow or v_u_21.IconType.None
	local v43 = not v41
	local v44 = p32.props.isVisible
	local v45 = p32:shouldShowInviteLink(p32.props.gameInfo)
	local v46 = 0
	local v47
	if v45 then
		v46 = v46 - v_u_23
		v47 = 10
	else
		v47 = 0
	end
	local v48 = v_u_12.createElement
	local v49 = "Frame"
	local v50 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = nil,
		["AutoLocalize"] = false,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["ZIndex"] = v35
	}
	local v51 = {
		["toasterPortal"] = v_u_12.createElement(v_u_12.Portal, {
			["target"] = v_u_1
		}, {
			["Toaster"] = v_u_12.createElement(v_u_26)
		}),
		["Header"] = v_u_12.createElement(v_u_16, {
			["deviceLayout"] = nil,
			["size"] = nil,
			["position"] = nil,
			["layoutOrder"] = 0,
			["zIndex"] = nil,
			["closePage"] = nil,
			["searchAreaActive"] = nil,
			["toggleSearchIcon"] = nil,
			["iconType"] = nil,
			["analytics"] = nil,
			["deviceLayout"] = v34,
			["size"] = UDim2.new(1, 0, 0, v40),
			["position"] = UDim2.new(0, 0, 0, -v40),
			["zIndex"] = v35,
			["closePage"] = v36,
			["searchAreaActive"] = v37,
			["toggleSearchIcon"] = v43,
			["iconType"] = v42,
			["analytics"] = v33
		})
	}
	local v52
	if v45 then
		v52 = v_u_12.createElement(v_u_19, {
			["position"] = nil,
			["analytics"] = nil,
			["deviceLayout"] = nil,
			["size"] = nil,
			["layoutOrder"] = 1,
			["zIndex"] = nil,
			["position"] = UDim2.new(0, 0, 0, v47),
			["analytics"] = v33,
			["deviceLayout"] = v34,
			["size"] = UDim2.new(1, 0, 0, v_u_23),
			["zIndex"] = v35
		}) or nil
	else
		v52 = nil
	end
	v51.ShareInviteLink = v52
	v51.ConversationList = v_u_12.createElement(v_u_17, {
		["analytics"] = nil,
		["size"] = nil,
		["topPadding"] = nil,
		["layoutOrder"] = nil,
		["zIndex"] = nil,
		["searchText"] = nil,
		["isVisible"] = nil,
		["trigger"] = "GameMenu",
		["analytics"] = v33,
		["size"] = UDim2.new(1, 0, 1, v39.EXTEND_BOTTOM_SIZE - v_u_24 + v46),
		["topPadding"] = v45 and v_u_24 + v_u_23 + v47 or v_u_24,
		["layoutOrder"] = v45 and 2 or 1,
		["zIndex"] = v35,
		["searchText"] = v38,
		["isVisible"] = v44
	})
	return v48(v49, v50, v51)
end
local v56 = v13.connect(function(p53)
	return {
		["gameInfo"] = p53.GameInfo
	}
end, function(p_u_54)
	-- upvalues: (copy) v_u_15, (copy) v_u_3, (copy) v_u_20, (copy) v_u_22
	return {
		["fetchGameInfo"] = function() -- name: fetchGameInfo
			-- upvalues: (ref) v_u_15, (ref) v_u_3, (ref) v_u_20, (copy) p_u_54, (ref) v_u_22
			v_u_20(v_u_15(v_u_3), game.GameId):andThen(function(p55)
				-- upvalues: (ref) p_u_54, (ref) v_u_22
				p_u_54(v_u_22(p55.Created))
			end)
		end
	}
end)(v25)
return v14.connect(function(p57)
	return {
		["experienceInviteShareLinkEnabled"] = p57.getExperienceInviteShareLinkEnabled()
	}
end)(v56)