-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.Matchers.toHaveBeenCalled
local v1 = script.Parent.Parent
local v_u_2 = require(v1.MagicMock)
local v_u_3 = require(v1.Spy)
local v_u_4 = require(v1.getCalls)
return function(p5, p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	if not (v_u_2.is(p5) or v_u_3.is(p5)) then
		return {
			["pass"] = false,
			["message"] = nil,
			["message"] = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalled is used. Given %s instead", (tostring(p5)))
		}
	end
	local v7 = #v_u_4(p5)
	local v8, v9
	if p6 then
		local v10
		if type(p6) == "number" and p6 > 0 then
			v10 = p6 % 1 == 0
		else
			v10 = false
		end
		if not v10 then
			return {
				["pass"] = false,
				["message"] = nil,
				["message"] = string.format("expectedTimesCalled must be a positive integer. Given %s instead.", (tostring(p6)))
			}
		end
		v8 = p6 == v7
		v9 = v8 and string.format("Expected %s to not have been called exactly %d times.", tostring(p5), p6) or string.format("Expected %s to have been called %d times. Was called %d times instead.", tostring(p5), p6, v7)
	else
		v8 = v7 > 0
		v9 = v8 and string.format("Expected %s to never have been called. Was called %d times instead.", tostring(p5), v7) or string.format("Expected %s to have been called at least once.", (tostring(p5)))
	end
	return {
		["pass"] = v8,
		["message"] = v9
	}
end