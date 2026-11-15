-- Path: CoreGui.RobloxGui.Modules.FriendingUtility
local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("HttpRbxApiService")
local v3 = game:GetService("StarterGui")
local v4 = game:GetService("Players")
local v5 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_6 = require(v5.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
local v7 = v4.LocalPlayer
while not v7 do
	v4:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v7 = v4.LocalPlayer
end
local v8 = {}
v8.__index = v8
local v9 = game:GetService("ContentProvider").BaseUrl:lower()
local v10 = string.gsub(v9, "http:", "https:")
local v_u_11 = string.gsub(v10, "www", "friends") .. "v1/users/{userId}/friends/count"
function v8.GetFriendCountAsync(_, p_u_12) -- name: GetFriendCountAsync
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_1
	local v13 = nil
	local function v15()
		-- upvalues: (ref) v_u_11, (copy) p_u_12, (ref) v_u_2
		local v14 = p_u_12
		return v_u_2:GetAsyncFullUrl((string.gsub(v_u_11, "{userId}", (tostring(v14)))))
	end
	local v16, v17 = pcall(v15)
	if not v16 then
		print(v_u_11, "failed because", v17)
		return nil
	end
	local v18 = v_u_1:JSONDecode(v17)
	if v18.count then
		v13 = v18.count
	end
	return v13
end
function v8.MaxFriendCount(_) -- name: MaxFriendCount
	-- upvalues: (copy) v_u_6
	local v19 = not v_u_6
	assert(v19, "Should not call MaxFriendCount when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	return 200
end
local v_u_20 = Instance.new("BindableEvent")
local v_u_21 = Instance.new("BindableEvent")
v7.FriendStatusChanged:connect(function(p22, p23)
	-- upvalues: (copy) v_u_20, (copy) v_u_21
	if p23 == Enum.FriendStatus.Friend then
		v_u_20:Fire(p22)
	elseif p23 == Enum.FriendStatus.NotFriend then
		v_u_21:Fire(p22)
	end
end)
v3:RegisterGetCore("PlayerFriendedEvent", function()
	-- upvalues: (copy) v_u_20
	return v_u_20
end)
v3:RegisterGetCore("PlayerUnfriendedEvent", function()
	-- upvalues: (copy) v_u_21
	return v_u_21
end)
return v8