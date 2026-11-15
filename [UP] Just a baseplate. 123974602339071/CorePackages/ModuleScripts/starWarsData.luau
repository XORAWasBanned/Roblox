-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.__tests__.starWarsData
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
local v_u_2 = require(v1.LuauPolyfill).Array
local v_u_3 = require(v1.Promise)
local v_u_4 = {
	["type"] = "Human",
	["id"] = "1000",
	["name"] = "Luke Skywalker",
	["friends"] = nil,
	["appearsIn"] = nil,
	["homePlanet"] = "Tatooine",
	["friends"] = {
		"1002",
		"1003",
		"2000",
		"2001"
	},
	["appearsIn"] = { 4, 5, 6 }
}
local v5 = {
	["type"] = "Human",
	["id"] = "1001",
	["name"] = "Darth Vader",
	["friends"] = nil,
	["appearsIn"] = nil,
	["homePlanet"] = "Tatooine",
	["friends"] = { "1004" },
	["appearsIn"] = { 4, 5, 6 }
}
local v6 = {
	["type"] = "Human",
	["id"] = "1002",
	["name"] = "Han Solo",
	["friends"] = nil,
	["appearsIn"] = nil,
	["friends"] = { "1000", "1003", "2001" },
	["appearsIn"] = { 4, 5, 6 }
}
local v7 = {
	["type"] = "Human",
	["id"] = "1003",
	["name"] = "Leia Organa",
	["friends"] = nil,
	["appearsIn"] = nil,
	["homePlanet"] = "Alderaan",
	["friends"] = {
		"1000",
		"1002",
		"2000",
		"2001"
	},
	["appearsIn"] = { 4, 5, 6 }
}
local v8 = {
	["type"] = "Human",
	["id"] = "1004",
	["name"] = "Wilhuff Tarkin",
	["friends"] = nil,
	["appearsIn"] = nil,
	["friends"] = { "1001" },
	["appearsIn"] = { 4 }
}
local v_u_9 = {
	[v_u_4.id] = v_u_4,
	[v5.id] = v5,
	[v6.id] = v6,
	[v7.id] = v7,
	[v8.id] = v8
}
local v10 = {
	["type"] = "Droid",
	["id"] = "2000",
	["name"] = "C-3PO",
	["friends"] = nil,
	["appearsIn"] = nil,
	["primaryFunction"] = "Protocol",
	["friends"] = {
		"1000",
		"1002",
		"1003",
		"2001"
	},
	["appearsIn"] = { 4, 5, 6 }
}
local v_u_11 = {
	["type"] = "Droid",
	["id"] = "2001",
	["name"] = "R2-D2",
	["friends"] = nil,
	["appearsIn"] = nil,
	["primaryFunction"] = "Astromech",
	["friends"] = { "1000", "1002", "1003" },
	["appearsIn"] = { 4, 5, 6 }
}
local v_u_12 = {
	[v10.id] = v10,
	[v_u_11.id] = v_u_11
}
local function v_u_14(p13) -- name: getCharacter
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_12
	return v_u_3.resolve(v_u_9[p13] or v_u_12[p13])
end
return {
	["getHuman"] = function(p15) -- name: getHuman
		-- upvalues: (copy) v_u_9
		return v_u_9[p15]
	end,
	["getCharacter"] = v_u_14,
	["getDroid"] = function(p16) -- name: getDroid
		-- upvalues: (copy) v_u_12
		return v_u_12[p16]
	end,
	["getFriends"] = function(p17) -- name: getFriends
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		return v_u_2.map(p17.friends, function(p18)
			-- upvalues: (ref) v_u_14
			return v_u_14(p18)
		end)
	end,
	["getHero"] = function(p19) -- name: getHero
		-- upvalues: (copy) v_u_4, (copy) v_u_11
		if p19 == 5 then
			return v_u_4
		else
			return v_u_11
		end
	end
}