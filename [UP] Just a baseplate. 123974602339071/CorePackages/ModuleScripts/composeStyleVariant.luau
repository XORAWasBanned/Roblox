-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.composeStyleVariant
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Components.Types)
local function v_u_6(p4, p5) -- name: mergeTags
	-- upvalues: (copy) v_u_3
	if not p4 then
		return p5
	end
	if not p5 then
		return p4
	end
	if type(p4) ~= "table" and type(p5) ~= "table" then
		return ("%* %*"):format(p4, p5)
	end
	if type(p4) == "string" then
		p4 = {
			[p4] = true
		}
	end
	if type(p5) == "string" then
		p5 = {
			[p5] = true
		}
	end
	return v_u_3.join(p4, p5)
end
function composeStyleVariant(p7, ...) -- name: composeStyleVariant
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v_u_8 = v_u_3.copy(p7)
	v_u_3.forEachArgs(function(p9)
		-- upvalues: (copy) v_u_8, (ref) v_u_3, (ref) v_u_6
		if p9 ~= nil then
			for v10, v11 in p9 do
				local v12 = v_u_8
				local v13 = v_u_8[v10] or {}
				local v14 = v_u_3.join(v13, v11)
				v14.tag = v_u_6(v13.tag, v11.tag)
				v12[v10] = v14
			end
		end
	end, ...)
	return v_u_8
end
return composeStyleVariant