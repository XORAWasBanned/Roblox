-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.didYouMean
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
return {
	["didYouMean"] = function(p2, p3) -- name: didYouMean
		if not p3 then
			p3 = p2
			p2 = nil
		end
		local v4 = " Did you mean "
		if p2 then
			v4 = v4 .. p2 .. " "
		end
		local v5 = {}
		for v6 = 1, #p3 do
			v5[v6] = ("%q"):format(p3[v6])
		end
		local v7 = #v5
		if v7 == 0 then
			return ""
		end
		if v7 == 1 then
			return v4 .. v5[1] .. "?"
		end
		if v7 == 2 then
			return v4 .. v5[1] .. " or " .. v5[2] .. "?"
		end
		local v8 = {}
		table.move(v5, 1, 5, 1, v8)
		local v9 = table.remove(v8)
		return v4 .. table.concat(v8, ", ") .. ", or " .. tostring(v9) .. "?"
	end
}