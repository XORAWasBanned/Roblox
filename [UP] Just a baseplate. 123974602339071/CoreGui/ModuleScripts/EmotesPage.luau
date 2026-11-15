-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Reducers.EmotesPage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.EmotesChanged)
local v6 = require(v4.EquippedEmotesChanged)
local v7 = require(v4.NumberEmotesLoadedChanged)
local function v_u_14(p8, p9) -- name: createCurrentEmotes
	local v10 = {}
	for _, v11 in ipairs(p9) do
		local v12 = v11.Slot
		local v13 = v11.Name
		if not (v12 and (v13 and p8[v13])) then
			continue
		end
		v10[v12] = v13
	end
	return v10
end
return v3.createReducer({
	["emotesInfo"] = nil,
	["equippedEmotes"] = nil,
	["numberEmotesLoaded"] = -1,
	["currentEmotes"] = nil,
	["emotesInfo"] = {},
	["equippedEmotes"] = {},
	["currentEmotes"] = {}
}, {
	[v5.name] = function(p15, p16)
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		return v_u_2.Dictionary.join(p15, {
			["emotesInfo"] = p16.emotes,
			["currentEmotes"] = v_u_14(p16.emotes, p15.equippedEmotes)
		})
	end,
	[v6.name] = function(p17, p18)
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		return v_u_2.Dictionary.join(p17, {
			["equippedEmotes"] = p18.equippedEmotes,
			["currentEmotes"] = v_u_14(p17.emotesInfo, p18.equippedEmotes)
		})
	end,
	[v7.name] = function(p19, p20)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p19, {
			["numberEmotesLoaded"] = p20.numberEmotesLoaded
		})
	end
})