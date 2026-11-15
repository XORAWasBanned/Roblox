-- Path: CorePackages.Packages._Index.NetworkingFriends.NetworkingFriends.createRequestThunks
require(script.Parent.networkingFriendsTypes)
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetFriendsFromUserId)
local v_u_3 = require(v1.createFindFriendsFromUserId)
local v_u_4 = require(v1.createSearchFriendsByQuery)
local v_u_5 = require(v1.createGetFriendRequestsCount)
local v_u_6 = require(v1.createUnfriendTargetUserId)
local v_u_7 = require(v1.createGetFriendRequests)
local v_u_8 = require(v1.createAcceptFriendRequestFromUserId)
local v_u_9 = require(v1.createDeclineFriendRequestFromUserId)
local v_u_10 = require(v1.createDeclineAllFriendRequests)
local v_u_11 = require(v1.createGetFriendsCountFromUserId)
local v_u_12 = require(v1.createGetInactiveFriends)
local v_u_13 = require(v1.createRequestFriendshipFromUserId)
local v_u_14 = require(v1.createRequestFriendshipFromContactId)
local v_u_15 = require(v1.createGetFollowingExists)
local v_u_16 = require(v1.createGetUserFollowers)
local v_u_17 = require(v1.createGetFriendRecommendationsFromUserId)
local v_u_18 = require(v1.createGetFriendshipStatus)
local v_u_19 = require(v1.createGetExtendedFriendshipStatus)
local v_u_20 = require(v1.createAcceptFriendRequestWithToken)
local v_u_21 = require(v1.createGetFollowersCount)
local v_u_22 = require(v1.createGetFollowingsCount)
local v_u_23 = require(v1.createValidateFriendRequestNickname)
return function(p24)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23
	return {
		["GetFriendsFromUserId"] = v_u_2(p24),
		["FindFriendsFromUserId"] = v_u_3(p24),
		["SearchFriendsByQuery"] = v_u_4(p24),
		["GetFriendRequestsCount"] = v_u_5(p24),
		["UnfriendTargetUserId"] = v_u_6(p24),
		["GetFriendRequests"] = v_u_7(p24),
		["AcceptFriendRequestFromUserId"] = v_u_8(p24),
		["DeclineFriendRequestFromUserId"] = v_u_9(p24),
		["DeclineAllFriendRequests"] = v_u_10(p24),
		["GetFriendsCountFromUserId"] = v_u_11(p24),
		["GetInactiveFriends"] = v_u_12(p24),
		["RequestFriendshipFromUserId"] = v_u_13(p24),
		["RequestFriendshipFromContactId"] = v_u_14(p24),
		["GetFollowingExists"] = v_u_15(p24),
		["GetUserFollowers"] = v_u_16(p24),
		["GetFriendRecommendationsFromUserId"] = v_u_17(p24),
		["GetFriendshipStatus"] = v_u_18(p24),
		["GetExtendedFriendshipStatus"] = v_u_19(p24),
		["AcceptFriendRequestWithToken"] = v_u_20(p24),
		["GetFollowersCount"] = v_u_21(p24),
		["GetFollowingsCount"] = v_u_22(p24),
		["ValidateFriendRequestNickname"] = v_u_23(p24)
	}
end