-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PlayerProfile.PlayerProfileContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.Rodux)
local v_u_4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.Foundation).View
local v_u_6 = require(v1.Workspace.Packages.Responsive)
local v_u_7 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_8 = require(v1.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local v_u_9 = require(v1.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local v_u_10 = require(v1.Workspace.Packages.SocialPolicies).ChatPolicies
local v_u_11 = require(v1.Workspace.Packages.AvatarPolicies).AvatarPolicies
local v_u_12 = require(v1.Workspace.Packages.SocialPolicies).SharePolicies
local v_u_13 = require(v1.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies
local v_u_14 = require(v1.Workspace.Packages.ProfilePlatform.Enums)
local v_u_15 = require(v1.Workspace.Packages.ProfilePlatform.installReducer)
local v_u_16 = require(v1.Workspace.Packages.ProfilePlatform.Constants)
local v_u_17 = v_u_14.ProfileTypes
local v_u_18 = require(v1.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local v_u_19 = require(script.Parent.PlayerProfile)
local function v_u_22(p20) -- name: createStore
	-- upvalues: (copy) v_u_3, (copy) v_u_16, (copy) v_u_15
	local v21 = v_u_3.combineReducers({
		[v_u_16.RODUX_KEY] = v_u_15()
	})
	return v_u_3.Store.new(v21, p20 or {}, { v_u_3.thunkMiddleware })
end
return function(p23) -- name: PlayerProfileContainer
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_18, (copy) v_u_17, (copy) v_u_14, (copy) v_u_7, (copy) v_u_4, (copy) v_u_22, (copy) v_u_6, (copy) v_u_5, (copy) v_u_19
	local v24 = v_u_2.useRef(nil)
	local v25 = v_u_2.createElement
	local v26 = v_u_8.Provider
	local v27 = {
		["policy"] = {
			v_u_9,
			v_u_10,
			v_u_11,
			v_u_12,
			v_u_13
		}
	}
	local v28 = {}
	local v29 = v_u_2.createElement
	local v30 = v_u_18.Provider
	local v31 = {}
	local v32 = {}
	local v33 = p23.userId
	v32.profileId = tostring(v33)
	v32.profileType = v_u_17.User
	v32.sourceInfo = {
		["source"] = nil,
		["contextualInfoType"] = "",
		["source"] = v_u_14.Sources.InExperienceProfile
	}
	v32.navigateTo = {
		["qRCodePage"] = function() -- name: qRCodePage end,
		["previousView"] = function(_) -- name: previousView end,
		["itemDetails"] = function(_) -- name: itemDetails end,
		["itemOrBundleDetails"] = function(_, _) -- name: itemOrBundleDetails end,
		["catalogSearch"] = function(_) -- name: catalogSearch end,
		["tryOnItem"] = function(_, _, _, _) -- name: tryOnItem end,
		["inspectAvatar"] = p23.inspectAvatar,
		["editUsername"] = function() -- name: editUsername end,
		["openLeaveRobloxAlertUIBlox"] = function(_) -- name: openLeaveRobloxAlertUIBlox end,
		["closeLeaveRobloxAlert"] = function() -- name: closeLeaveRobloxAlert end
	}
	v32.externalAnalytics = {
		["catalogAnalytics"] = {}
	}
	v31.value = v32
	local v34 = {}
	local v35 = v_u_2.createElement
	local v36 = v_u_7
	local v37 = {}
	local v38 = v_u_2.createElement
	local v39 = v_u_4.StoreProvider
	local v40 = {
		["store"] = v_u_22()
	}
	local v41 = {}
	local v42 = v_u_2.createElement
	local v43 = v_u_6.ContainerRef.Provider
	local v44 = {}
	local v45 = v_u_2.createElement
	local v46 = v_u_5
	local v47 = {
		["PlayerProfile"] = v_u_2.createElement(v_u_19, {
			["userId"] = p23.userId,
			["closePage"] = p23.closePage
		})
	}
	v44.PlayerProfileContainer = v45(v46, {
		["tag"] = "size-full",
		["ref"] = nil,
		["ref"] = v24
	}, v47)
	v41.ResponsiveProvider = v42(v43, {
		["value"] = v24
	}, v44)
	v37.RoduxStore = v38(v39, v40, v41)
	v34.CoreScriptsRootProvider = v35(v36, {}, v37)
	v28.ProfileWrapperProvider = v29(v30, v31, v34)
	return v25(v26, v27, v28)
end