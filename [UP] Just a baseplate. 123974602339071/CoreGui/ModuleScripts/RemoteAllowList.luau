-- Path: CoreGui.RobloxGui.Modules.Server.RemoteAllowList
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags)
local v_u_3 = v2.FFlagEnableModerateChatRemoteEvent
local v_u_4 = v2.FFlagPlatformLeaderboardRccEnabled
local v_u_5 = game:DefineFastFlag("RemoteAllowListAddExpChatFeatureValueChanged", false)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v6 = game:FindService("NetworkServer") ~= nil
	assert(v6)
	local v7 = game:GetService("NetworkServer")
	local v8 = {}
	table.insert(v8, "GetServerVersion")
	table.insert(v8, "GetServerChannel")
	table.insert(v8, "WhisperChat")
	table.insert(v8, "GetServerType")
	table.insert(v8, "ServerSideBulkPurchaseEvent")
	table.insert(v8, "CanChatWith")
	table.insert(v8, "SetPlayerBlockList")
	table.insert(v8, "UpdatePlayerBlockList")
	table.insert(v8, "NewPlayerGroupDetails")
	table.insert(v8, "NewPlayerCanManageDetails")
	table.insert(v8, "SendPlayerBlockList")
	table.insert(v8, "UpdateLocalPlayerBlockList")
	table.insert(v8, "SendPlayerProfileSettings")
	table.insert(v8, "UpdatePlayerProfileSettings")
	table.insert(v8, "ShowPlayerJoinedFriendsToast")
	table.insert(v8, "ShowFriendJoinedPlayerToast")
	table.insert(v8, "CreateOrJoinParty")
	table.insert(v8, "RequestPlayerProfileSettings")
	if v_u_3 then
		table.insert(v8, "ModerateChatSettingUpdated")
	end
	if v_u_5 then
		table.insert(v8, "ExpChatFeatureValueChanged")
	end
	table.insert(v8, "SetDialogInUse")
	table.insert(v8, "RequestDeviceCameraOrientationCapability")
	table.insert(v8, "RequestDeviceCameraCFrame")
	table.insert(v8, "ReplicateDeviceCameraCFrame")
	table.insert(v8, "ReferredPlayerJoin")
	table.insert(v8, "BuildExperiencePlaytestTeleport")
	table.insert(v8, "SetUserActive")
	table.insert(v8, "AvatarGesturesVRPlayer")
	if v_u_4 then
		table.insert(v8, "PlatformLeaderboardPush")
		table.insert(v8, "PlatformLeaderboardTabOpened")
		table.insert(v8, "PlatformLeaderboardTabClosed")
	end
	v7:InitializeRemoteAllowList(v8)
end