-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.makeUniqueId
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Boolean
local v_u_5 = v3.Map.new(nil)
local v_u_6 = {
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z"
}
math.randomseed(os.clock())
local function v_u_8() -- name: uuid
	-- upvalues: (copy) v_u_6
	local v7 = ""
	for _ = 1, 11 do
		v7 = v7 .. v_u_6[math.random(1, 36)]
	end
	return v7
end
v1.uuid = v_u_8
function v1.makeUniqueId(p9) -- name: makeUniqueId
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5
	local v10 = v_u_8()
	local v11 = v_u_4.toJSBoolean(v_u_5:get(p9)) and (v_u_5:get(p9) or 1) or 1
	v_u_5:set(p9, v11 + 1)
	return ("%s:%s:%s"):format(p9, tostring(v11), v10)
end
return v1