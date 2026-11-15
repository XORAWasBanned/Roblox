-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.observables.asyncMap
local v1 = script.Parent.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Boolean
local v_u_3 = require(v1.Promise)
local v4 = {}
local v_u_5 = require(script.Parent.Observable).Observable
function v4.asyncMap(p_u_6, p_u_7, p_u_8) -- name: asyncMap
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	return v_u_5.new(function(p_u_9)
		-- upvalues: (ref) v_u_3, (ref) v_u_2, (copy) p_u_7, (copy) p_u_8, (copy) p_u_6
		local v_u_10 = nil
		local v_u_11 = p_u_9.next
		local v_u_12 = p_u_9.error
		local v_u_13 = p_u_9.complete
		local v_u_14 = 0
		local v_u_15 = false
		local v_u_18 = {
			["andThen"] = function(_, p_u_16) -- name: andThen
				-- upvalues: (ref) v_u_3
				return v_u_3.new(function(p17)
					-- upvalues: (copy) p_u_16
					return p17(p_u_16())
				end)
			end
		}
		local v19 = {}
		local v_u_20 = p_u_7
		local v21
		if v_u_2.toJSBoolean(v_u_20) then
			v21 = function(_, p_u_22)
				-- upvalues: (ref) v_u_14, (copy) v_u_20, (ref) v_u_18, (ref) v_u_3, (ref) v_u_2, (copy) v_u_11, (copy) p_u_9, (ref) v_u_15, (ref) v_u_10, (copy) v_u_12
				v_u_14 = v_u_14 + 1
				local function v23() -- name: both
					-- upvalues: (ref) v_u_20, (copy) p_u_22
					return v_u_20(p_u_22)
				end
				v_u_18 = v_u_18:andThen(function()
					-- upvalues: (ref) v_u_3
					return v_u_3.delay(0)
				end):andThen(v23, v23):andThen(function(p24)
					-- upvalues: (ref) v_u_14, (ref) v_u_2, (ref) v_u_11, (ref) p_u_9, (ref) v_u_15, (ref) v_u_10
					v_u_14 = v_u_14 - 1
					if v_u_2.toJSBoolean(v_u_11) then
						v_u_11(p_u_9, p24)
					end
					if v_u_2.toJSBoolean(v_u_15) then
						v_u_10.complete()
					end
				end, function(p25)
					-- upvalues: (ref) v_u_14
					v_u_14 = v_u_14 - 1
					error(p25)
				end):catch(function(p26)
					-- upvalues: (ref) v_u_2, (ref) v_u_12, (ref) p_u_9
					if v_u_2.toJSBoolean(v_u_12) then
						return v_u_12(p_u_9, p26)
					end
				end)
			end
		else
			v21 = function(_, p27)
				-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) p_u_9
				if v_u_2.toJSBoolean(v_u_11) then
					v_u_11(p_u_9, p27)
				end
			end
		end
		v19.next = v21
		local v_u_28 = p_u_8
		local v29
		if v_u_2.toJSBoolean(v_u_28) then
			v29 = function(_, p_u_30)
				-- upvalues: (ref) v_u_14, (copy) v_u_28, (ref) v_u_18, (ref) v_u_3, (ref) v_u_2, (copy) v_u_11, (copy) p_u_9, (ref) v_u_15, (ref) v_u_10, (copy) v_u_12
				v_u_14 = v_u_14 + 1
				local function v31() -- name: both
					-- upvalues: (ref) v_u_28, (copy) p_u_30
					return v_u_28(p_u_30)
				end
				v_u_18 = v_u_18:andThen(function()
					-- upvalues: (ref) v_u_3
					return v_u_3.delay(0)
				end):andThen(v31, v31):andThen(function(p32)
					-- upvalues: (ref) v_u_14, (ref) v_u_2, (ref) v_u_11, (ref) p_u_9, (ref) v_u_15, (ref) v_u_10
					v_u_14 = v_u_14 - 1
					if v_u_2.toJSBoolean(v_u_11) then
						v_u_11(p_u_9, p32)
					end
					if v_u_2.toJSBoolean(v_u_15) then
						v_u_10.complete()
					end
				end, function(p33)
					-- upvalues: (ref) v_u_14
					v_u_14 = v_u_14 - 1
					error(p33)
				end):catch(function(p34)
					-- upvalues: (ref) v_u_2, (ref) v_u_12, (ref) p_u_9
					if v_u_2.toJSBoolean(v_u_12) then
						return v_u_12(p_u_9, p34)
					end
				end)
			end
		else
			v29 = function(_, p35)
				-- upvalues: (ref) v_u_2, (copy) v_u_12, (copy) p_u_9
				if v_u_2.toJSBoolean(v_u_12) then
					v_u_12(p_u_9, p35)
				end
			end
		end
		v19.error = v29
		function v19.complete() -- name: complete
			-- upvalues: (ref) v_u_15, (ref) v_u_2, (ref) v_u_14, (copy) v_u_13, (copy) p_u_9
			v_u_15 = true
			if not v_u_2.toJSBoolean(v_u_14) and v_u_2.toJSBoolean(v_u_13) then
				v_u_13(p_u_9)
			end
		end
		v_u_10 = v19
		local v_u_36 = p_u_6:subscribe(v_u_10)
		return function()
			-- upvalues: (copy) v_u_36
			return v_u_36:unsubscribe()
		end
	end)
end
return v4