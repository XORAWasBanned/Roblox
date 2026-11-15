-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.inExpChatMessagesLoaderUsernameEnrichment
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Promise)
local v_u_3 = require(v1.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local function v_u_11(p4) -- name: collectUserIdsMissingUsername
	local v5 = {}
	local v6 = {}
	for _, v7 in p4 do
		for _, v8 in v7.items do
			local v9 = v8.meta
			local v10
			if v9 then
				v10 = v9.userId
			else
				v10 = v9
			end
			if v9 then
				v9 = v9.username
			end
			if not v10 or (v10 == "0" or v9 and v9 ~= "") or v5[v10] then
				continue
			end
			v5[v10] = true
			table.insert(v6, v10)
		end
	end
	return v6
end
local function v_u_21(p12, p13) -- name: enrichGroupsWithProfileUsernames
	local v14 = {}
	for _, v15 in p13 do
		local v16 = v15.names.getUsername(false)
		if not v16 or #v16 <= 0 then
			continue
		end
		v14[v15.userId] = v16
	end
	for _, v17 in p12 do
		for _, v18 in v17.items do
			local v19 = v18.meta
			if not v19 or v19.username and v19.username ~= "" then
				continue
			end
			local v20 = v14[v19.userId]
			if not v20 then
				continue
			end
			v19.username = v20
		end
	end
end
return {
	["collectUserIdsMissingUsername"] = v_u_11,
	["enrichGroupsWithProfileUsernames"] = v_u_21,
	["enrichMissingUsernames"] = function(p_u_22) -- name: enrichMissingUsernames
		-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_3, (copy) v_u_21
		local v_u_23 = v_u_11(p_u_22)
		if #v_u_23 == 0 then
			return v_u_2.resolve(p_u_22)
		else
			return v_u_2.new(function(p_u_24)
				-- upvalues: (ref) v_u_3, (copy) v_u_23, (ref) v_u_21, (copy) p_u_22
				v_u_3.get().fetchNamesByUserIds(v_u_23, function(p25)
					-- upvalues: (ref) v_u_21, (ref) p_u_22, (copy) p_u_24
					if p25.status == "success" and p25.data then
						v_u_21(p_u_22, p25.data)
						p_u_24(p_u_22)
					elseif p25.status == "failed" then
						p_u_24(p_u_22)
					end
				end)
			end)
		end
	end
}