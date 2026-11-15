-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.PlayerIconInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.AddPlayer)
local v6 = require(v4.RemovePlayer)
local v7 = require(v4.SetPlayerSpecialGroupIcon)
local v8 = require(v4.SetPlayerIsCreator)
local v9 = require(v4.SetPlayerAvatarIcon)
return v2.createReducer({}, {
	[v5.name] = function(p10, p11)
		-- upvalues: (copy) v_u_3
		local v12 = v_u_3.Dictionary.join
		local v13 = {}
		local v14 = p11.userId
		local v15 = {
			["isPlaceOwner"] = nil,
			["avatarIcon"] = nil,
			["specialGroupIcon"] = nil
		}
		local v16
		if game.CreatorType == Enum.CreatorType.User then
			v16 = p11.userId == game.CreatorId
		else
			v16 = false
		end
		v15.isPlaceOwner = v16
		v13[v14] = v15
		return v12(p10, v13)
	end,
	[v6.name] = function(p17, p18)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p17, {
			[p18.userId] = v_u_3.None
		})
	end,
	[v9.name] = function(p19, p20)
		-- upvalues: (copy) v_u_3
		local v21 = v_u_3.Dictionary.join
		local v22 = {
			[p20.userId] = {
				["isPlaceOwner"] = p19[p20.userId].isPlaceOwner,
				["avatarIcon"] = p20.avatarIcon,
				["specialGroupIcon"] = p19[p20.userId].specialGroupIcon
			}
		}
		return v21(p19, v22)
	end,
	[v8.name] = function(p23, p24)
		-- upvalues: (copy) v_u_3
		local v25 = v_u_3.Dictionary.join
		local v26 = {
			[p24.userId] = {
				["isPlaceOwner"] = p24.isCreator,
				["avatarIcon"] = p23[p24.userId].avatarIcon,
				["specialGroupIcon"] = p23[p24.userId].specialGroupIcon
			}
		}
		return v25(p23, v26)
	end,
	[v7.name] = function(p27, p28)
		-- upvalues: (copy) v_u_3
		local v29 = v_u_3.Dictionary.join
		local v30 = {
			[p28.userId] = {
				["isPlaceOwner"] = p27[p28.userId].isPlaceOwner,
				["avatarIcon"] = p27[p28.userId].avatarIcon,
				["specialGroupIcon"] = p28.specialGroupIcon
			}
		}
		return v29(p27, v30)
	end
})