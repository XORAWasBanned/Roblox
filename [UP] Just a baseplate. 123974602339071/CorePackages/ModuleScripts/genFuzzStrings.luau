-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.__testUtils__.genFuzzStrings
return {
	["genFuzzStrings"] = function(p_u_1) -- name: genFuzzStrings
		return coroutine.wrap(function() -- name: getFuzzStrings
			-- upvalues: (copy) p_u_1
			local v2 = p_u_1.allowedChars
			local v3 = p_u_1.maxLength
			local v4 = #v2
			local v5 = 0
			for v6 = 1, v3 do
				v5 = v5 + v4 ^ v6
			end
			coroutine.yield("")
			for v10 = 0, v5 - 1 do
				local _ = v10
				local v8 = ""
				while v10 >= 0 do
					local v9 = v10 % v4
					v8 = v2[v9 + 1] .. v8
					local v10 = (v10 - v9) / v4 - 1
				end
				coroutine.yield(v8)
			end
		end)
	end
}