-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.FullModalShareGameComponent
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Roact)
local v_u_4 = require(v2.Packages.RoactRodux)
local v_u_5 = require(v2.Packages.Foundation).Hooks.useStyleSheet
local v6 = v1.RobloxGui.Modules
local v7 = script.Parent
local v_u_8 = require(v6.Flags.GetFFlagExtraInviteModalStringValidation)
local v_u_9 = require(v6.Flags.FFlagFixPromptGameInviteUIButtonScaling)
local v_u_10 = require(v7.ShareGameContainer)
local v_u_11 = require(v7.ModalShareGamePageFrame)
local v_u_12 = require(v7.LayoutProvider)
local v_u_13 = require(v7.InviteSingleUserContainer)
local v_u_14 = require(v7.LoadingModal)
local function v_u_16() -- name: FoundationStyleLink
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v15 = {
		["StyleSheet"] = v_u_5()
	}
	return v_u_3.createElement("StyleLink", v15)
end
local v17 = v_u_3.PureComponent:extend("FullModalShareGameComponent")
function v17.render(p18) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_16, (copy) v_u_14, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_11
	local v19 = p18.props.isVisible
	local v20 = p18.props.analytics
	local v_u_21 = p18.props.onAfterClosePage
	local v_u_22 = p18.props.store
	local v23 = p18.props.promptMessage
	local v24 = p18.props.inviteUserId
	local v25 = p18.props.inviteMessageId
	local v26 = p18.props.launchData
	local v27 = p18.props.isLoading
	local v28 = p18.props.requestImpl
	if v_u_8() and v23 then
		if not v24 then
			v23 = v23:gsub("\n", " ")
		end
		if v23:gsub("%s", "") == "" then
			v23 = nil
		end
	end
	local v29 = v_u_3.createElement
	local v30 = v_u_4.StoreProvider
	local v31 = {
		["store"] = v_u_22
	}
	local v32 = {}
	local v33 = v_u_3.createElement
	local v34 = "ScreenGui"
	local v35 = {
		["AutoLocalize"] = false,
		["Enabled"] = nil,
		["DisplayOrder"] = -1,
		["ZIndexBehavior"] = nil,
		["Enabled"] = v19,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v36 = {}
	local v37
	if v_u_9 then
		v37 = v_u_3.createElement(v_u_16)
	else
		v37 = nil
	end
	v36.foundationStyleLink = v37
	local v38
	if v27 then
		v38 = v_u_3.createElement(v_u_14)
	else
		v38 = v27
	end
	v36.loadingIndicator = v38
	local v39 = not v27
	if v39 then
		local v40 = v_u_3.createElement
		local v41 = v_u_12
		local v42 = nil
		local v43 = {}
		local v44 = v_u_3.createElement
		local v45 = v_u_10
		local v46 = {
			["analytics"] = v20,
			["isVisible"] = v19
		}
		local v47
		if v24 then
			v47 = v_u_13
		else
			v47 = v_u_11
		end
		v46.skeletonComponent = v47
		v46.promptMessage = v23
		v46.inviteUserId = v24
		v46.inviteMessageId = v25
		v46.launchData = v26
		v46.requestImpl = v28
		function v46.onAfterClosePage() -- name: onAfterClosePage
			-- upvalues: (copy) v_u_22, (copy) v_u_21
			local v48 = {}
			for v49, _ in pairs(v_u_22:getState().Invites) do
				table.insert(v48, v49)
			end
			v_u_21(v48)
		end
		v43.ShareGameContainer = v44(v45, v46)
		v39 = v40(v41, v42, v43)
	end
	v36.layoutProvider = v39
	v32.screenGui = v33(v34, v35, v36)
	return v29(v30, v31, v32)
end
return v17