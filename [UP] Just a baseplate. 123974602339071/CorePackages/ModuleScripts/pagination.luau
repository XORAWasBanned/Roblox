-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.policies.pagination
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Boolean
local v_u_5 = v3.Array
local v_u_6 = v3.Object
local function v_u_11(p7, p8) -- name: __rest
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v_u_9 = {}
	v_u_5.forEach(p8, function(p10)
		-- upvalues: (copy) v_u_9, (ref) v_u_6
		v_u_9[p10] = v_u_6.None
	end)
	return v_u_6.assign({}, p7, v_u_9)
end
require(script.Parent.Parent.Parent.cache.inmemory.policies_types)
require(script.Parent.Parent.graphql.storeUtils)
local v_u_12 = require(script.Parent.Parent.common.mergeDeep).mergeDeep
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
function v1.concatPagination(p16) -- name: concatPagination
	-- upvalues: (copy) v_u_5
	if p16 == nil then
		p16 = false
	end
	return {
		["keyArgs"] = p16,
		["merge"] = function(_, p17, p18) -- name: merge
			-- upvalues: (ref) v_u_5
			if p17 then
				return v_u_5.concat(p17, p18)
			else
				return p18
			end
		end
	}
end
function v1.offsetLimitPagination(p19) -- name: offsetLimitPagination
	-- upvalues: (copy) v_u_5
	if p19 == nil then
		p19 = false
	end
	return {
		["keyArgs"] = p19,
		["merge"] = function(_, p20, p21, p22) -- name: merge
			-- upvalues: (ref) v_u_5
			local v23 = p22.args
			local v24 = p20 == nil and {} or v_u_5.slice(p20, 1)
			if v23 == nil then
				return v_u_5.concat(v24, p21)
			end
			local v25 = v23.offset == nil and 0 or v23.offset
			for v26 = 1, #p21 do
				v24[v25 + v26] = p21[v26]
			end
			return v24
		end
	}
end
function v1.relayStylePagination(p27) -- name: relayStylePagination
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (ref) v_u_13, (ref) v_u_14, (copy) v_u_12
	if p27 == nil then
		p27 = false
	end
	return {
		["keyArgs"] = p27,
		["read"] = function(_, p28, p_u_29) -- name: read
			-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_6, (ref) v_u_13
			if p28 then
				local v_u_30 = {}
				local v_u_31 = ""
				local v_u_32 = ""
				v_u_5.forEach(p28.edges, function(p33)
					-- upvalues: (copy) p_u_29, (copy) v_u_30, (ref) v_u_31, (ref) v_u_4, (ref) v_u_32
					if p_u_29:canRead(p_u_29:readField("node", p33)) then
						local v34 = v_u_30
						table.insert(v34, p33)
						if p33.cursor then
							v_u_31 = v_u_4.toJSBoolean(v_u_31) and v_u_31 or (p33.cursor or "")
							v_u_32 = v_u_4.toJSBoolean(p33.cursor) and p33.cursor or v_u_32
						end
					end
				end)
				local v35 = p28.pageInfo
				local v36
				if v35 then
					v36 = v35.startCursor
				else
					v36 = v35
				end
				if v35 then
					v35 = v35.endCursor
				end
				local v37 = v_u_6.assign
				local v38 = v_u_13(p28)
				local v39 = {
					["edges"] = v_u_30,
					["pageInfo"] = v_u_6.assign({}, p28.pageInfo, {
						["startCursor"] = v_u_4.toJSBoolean(v36) and v36 and v36 or v_u_31,
						["endCursor"] = v_u_4.toJSBoolean(v35) and v35 and v35 or v_u_32
					})
				}
				return v37({}, v38, v39)
			end
		end,
		["merge"] = function(_, p40, p41, p_u_42) -- name: merge
			-- upvalues: (ref) v_u_14, (ref) v_u_5, (ref) v_u_6, (ref) v_u_12, (ref) v_u_4, (ref) v_u_13
			if p40 == nil then
				p40 = v_u_14()
			end
			local v_u_43 = p_u_42.args
			local v46 = not p41.edges and {} or v_u_5.map(p41.edges, function(p44)
				-- upvalues: (ref) v_u_6, (copy) p_u_42
				local v45 = v_u_6.assign({
					["cursor"] = ""
				}, p44)
				if p_u_42:isReference(v45) then
					v45.cursor = p_u_42:readField("cursor", v45)
				end
				return v45
			end)
			if p41.pageInfo then
				local v47 = p41.pageInfo
				local v48 = v47.startCursor
				local v49 = v47.endCursor
				local v50 = v46[1]
				local v51 = v46[#v46]
				if v50 and v48 then
					v50.cursor = v48
				end
				if v51 and v49 then
					v51.cursor = v49
				end
				if v50 then
					v50 = v50.cursor
				end
				if v50 and not v48 then
					p41 = v_u_12(p41, {
						["pageInfo"] = {
							["startCursor"] = v50
						}
					})
				end
				if v51 then
					v51 = v51.cursor
				end
				if v51 and not v49 then
					p41 = v_u_12(p41, {
						["pageInfo"] = {
							["endCursor"] = v51
						}
					})
				end
			end
			local v52 = p40.edges
			local v53 = {}
			if v_u_43 == nil or not v_u_43.after then
				if v_u_43 == nil or not v_u_4.toJSBoolean(v_u_43.before) then
					if v_u_4.toJSBoolean(p41.edges) then
						v52 = {}
					end
				else
					local v55 = v_u_5.findIndex(v52, function(p54)
						-- upvalues: (copy) v_u_43
						return p54.cursor == v_u_43.before
					end)
					if v55 < 0 then
						v53 = v52
					else
						v53 = v_u_5.slice(v52, v55)
					end
					v52 = {}
				end
			else
				local v57 = v_u_5.findIndex(v52, function(p56)
					-- upvalues: (copy) v_u_43
					return p56.cursor == v_u_43.after
				end)
				if v57 >= 1 then
					v52 = v_u_5.slice(v52, 1, v57 + 1)
				end
			end
			local v58 = v_u_5.concat(v52, v46, v53)
			local v59 = v_u_6.assign({}, p41.pageInfo, p40.pageInfo)
			if p41.pageInfo then
				local v60 = p41.pageInfo
				local v61 = v60.hasPreviousPage
				local v62 = v60.hasNextPage
				local v63 = v60.startCursor
				local v64 = v60.endCursor
				local v65 = v_u_6.assign({}, v60, {
					["hasPreviousPage"] = v_u_6.None,
					["hasNextPage"] = v_u_6.None,
					["startCursor"] = v_u_6.None,
					["endCursor"] = v_u_6.None
				})
				v_u_6.assign(v59, v65)
				if not v_u_4.toJSBoolean(#v52) then
					if v61 ~= nil then
						v59.hasPreviousPage = v61
					end
					if v63 ~= nil then
						v59.startCursor = v63
					end
				end
				if not v_u_4.toJSBoolean(#v53) then
					if v62 ~= nil then
						v59.hasNextPage = v62
					end
					if v64 ~= nil then
						v59.endCursor = v64
					end
				end
			end
			return v_u_6.assign({}, v_u_13(p40), v_u_13(p41), {
				["edges"] = v58,
				["pageInfo"] = v59
			})
		end
	}
end
v_u_13 = function(p66) -- name: getExtras
	-- upvalues: (copy) v_u_11, (ref) v_u_15
	return v_u_11(p66, v_u_15)
end
v_u_15 = { "edges", "pageInfo" }
v_u_14 = function() -- name: makeEmptyData
	return {
		["edges"] = {},
		["pageInfo"] = {
			["hasPreviousPage"] = false,
			["hasNextPage"] = true,
			["startCursor"] = "",
			["endCursor"] = ""
		}
	}
end
return v1