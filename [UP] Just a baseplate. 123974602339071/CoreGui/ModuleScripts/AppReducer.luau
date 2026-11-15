-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.AppReducer
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local v3 = require(v1.Workspace.Packages.NotificationsCommon).ReducerDependencies
local v_u_4 = require(v1.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer
local v_u_5 = require(v1.Workspace.Packages.UserLib).Reducers.UserReducer
local v_u_6 = require(v1.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends
local v_u_7 = require(v1.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).FFlagRemoveUnusedFriendCountRoduxSlice
local v_u_9 = require(v2.Reducers.ConversationsSearch)
local v_u_10 = require(v2.Reducers.DeviceInfo)
local v_u_11 = require(v2.Reducers.Invites)
local v_u_12 = require(v2.Reducers.GameInfo)
local v_u_13 = require(v2.Reducers.Page)
local v_u_14 = require(v2.Reducers.Toasts)
local v15 = v3.ShareLinksRodux
local v_u_16 = v3.RoduxNetworking.installReducer()
local v_u_17 = v15.installReducer()
return function(p18, p19)
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_13, (copy) v_u_4, (copy) v_u_14, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_17, (copy) v_u_12, (copy) v_u_16
	local v20 = p18 or {}
	local v21 = {
		["ConversationsSearch"] = v_u_9(v20.ConversationsSearch, p19),
		["DeviceInfo"] = v_u_10(v20.DeviceInfo, p19),
		["Invites"] = v_u_11(v20.Invites, p19),
		["Page"] = v_u_13(v20.Page, p19),
		["PlaceInfos"] = v_u_4(v20.PlaceInfos, p19),
		["Toasts"] = v_u_14(v20.Toasts, p19),
		["Users"] = v_u_5(v20.Users, p19),
		["Friends"] = v_u_6(v20.Friends, p19)
	}
	local v22
	if v_u_8 then
		v22 = nil
	else
		v22 = v_u_7(v20.FriendCount, p19)
	end
	v21.FriendCount = v22
	v21.ShareLinks = v_u_17(v20.ShareLinks, p19)
	v21.GameInfo = v_u_12(v20.GameInfo, p19)
	v21.NetworkStatus = v_u_16(v20.NetworkStatus, p19)
	return v21
end