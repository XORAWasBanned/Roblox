-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.InviteToGamePrompt
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("GuiService")
local v5 = v1:WaitForChild("RobloxGui")
local v_u_6 = require(v2.Packages.Roact)
local v_u_7 = require(v2.Packages.Rodux)
local v8 = v5.Modules
local v9 = v8.Settings
local v_u_10 = require(v8.Settings.Pages.ShareGame.Constants)
local v_u_11 = require(v2.Workspace.Packages.GameInvite).GameInviteEvents
local v12 = v9.Pages.ShareGame
local v_u_13 = require(v12.Components.FullModalShareGameComponent)
local v_u_14 = require(v12.AppReducer)
local v_u_15 = require(v8.Common.renderWithCoreScriptsStyleProvider)
local v_u_16 = require(v12.InviteStore)
local v_u_17 = require(v8.Flags.GetFFlagEnableSharedInviteStore)
local v_u_18 = require(v8.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new(p20) -- name: new
	-- upvalues: (copy) v_u_19
	local v21 = {
		["mountTarget"] = nil,
		["isActive"] = false,
		["mountTarget"] = p20
	}
	local v22 = v_u_19
	setmetatable(v21, v22)
	return v21
end
function v_u_19.withSocialServiceAndLocalPlayer(p23, p24, p25) -- name: withSocialServiceAndLocalPlayer
	p23.socialService = p24
	p23.localPlayer = p25
	return p23
end
function v_u_19.withAnalytics(p26, p27) -- name: withAnalytics
	p26.analytics = p27
	return p26
end
function v_u_19.withRequestImpl(p28, p29) -- name: withRequestImpl
	p28.requestImpl = p29
	return p28
end
function v_u_19._createTree(p_u_30, p31, p32) -- name: _createTree
	-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_7, (copy) v_u_14, (copy) v_u_15, (copy) v_u_6, (copy) v_u_13
	local v33
	if v_u_17() then
		v33 = v_u_16
	else
		v33 = v_u_7.Store.new(v_u_14, nil, { v_u_7.thunkMiddleware })
	end
	local v34 = v_u_15
	local v35 = {}
	local v36 = v_u_6.createElement
	local v37 = v_u_13
	local v38 = {
		["store"] = v33,
		["isVisible"] = p31,
		["analytics"] = p_u_30.analytics
	}
	local v39
	if p32 then
		v39 = p32.promptMessage
	else
		v39 = p32
	end
	v38.promptMessage = v39
	local v40
	if p32 then
		v40 = p32.inviteUserId
	else
		v40 = p32
	end
	v38.inviteUserId = v40
	local v41
	if p32 then
		v41 = p32.inviteMessageId
	else
		v41 = p32
	end
	v38.inviteMessageId = v41
	local v42
	if p32 then
		v42 = p32.launchData
	else
		v42 = p32
	end
	v38.launchData = v42
	if p32 then
		p32 = p32.isLoading
	end
	v38.isLoading = p32
	v38.requestImpl = p_u_30.requestImpl
	function v38.onAfterClosePage(_) -- name: onAfterClosePage
		-- upvalues: (copy) p_u_30
		p_u_30:hide({})
	end
	v35.FullModalShareGame = v36(v37, v38)
	return v34(v35)
end
function v_u_19.show(p_u_43, p44) -- name: show
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_18, (copy) v_u_6, (copy) v_u_3
	if not p_u_43.isActive then
		local v45
		if p44 then
			v45 = p44.isLoading
		else
			v45 = p44
		end
		p_u_43.isLoading = v45
		p_u_43.isActive = not p_u_43.isLoading
		if p44 then
			local v46
			if p44.inviteUserId then
				v46 = v_u_10.Triggers.DeveloperSingle
			else
				v46 = v_u_10.Triggers.DeveloperMultiple
			end
			local v47
			if p44.launchData == nil then
				v47 = false
			else
				v47 = p44.launchData ~= ""
			end
			p_u_43.analytics:sendEvent(v46, v_u_11.ModalOpened, v_u_18() and {
				["isLaunchDataProvided"] = v47
			} or nil)
		end
		if p_u_43.instance then
			p_u_43.instance = v_u_6.update(p_u_43.instance, p_u_43:_createTree(true, p44))
		else
			p_u_43.instance = v_u_6.mount(p_u_43:_createTree(true, p44), p_u_43.mountTarget, "invitePrompt")
		end
		if p_u_43.analytics and not p_u_43.isLoading then
			p_u_43.analytics:inputShareGameEntryPoint()
		end
		v_u_3:BindCoreAction("hideInvitePrompt", function(_, p48, _)
			-- upvalues: (copy) p_u_43
			if p48 == Enum.UserInputState.Begin then
				p_u_43:hide()
			end
		end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
	end
end
function v_u_19.hide(p49, _) -- name: hide
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	if p49.isActive or p49.isLoading then
		p49.isLoading = false
		p49.isActive = false
		p49.instance = v_u_6.update(p49.instance, p49:_createTree(false))
		if p49.socialService and p49.localPlayer then
			p49.socialService:InvokeGameInvitePromptClosed(p49.localPlayer, {})
		end
		v_u_3:UnbindCoreAction("hideInvitePrompt")
		v_u_4.SelectedCoreObject = nil
		v_u_4:RemoveSelectionGroup("invitePrompt")
	end
end
function v_u_19.destruct(p50) -- name: destruct
	-- upvalues: (copy) v_u_6
	if p50.instance then
		v_u_6.unmount(p50.instance)
	end
end
return v_u_19