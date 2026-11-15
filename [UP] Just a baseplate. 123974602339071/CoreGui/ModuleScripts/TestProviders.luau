-- Path: CoreGui.RobloxGui.Modules.PlayerList.TestProviders
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Packages.Rodux)
local v_u_4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.UIBlox)
local v_u_6 = require(v1.Packages.Foundation)
local v7 = script.Parent
local v8 = v7.Reducers
local v_u_9 = require(v8.Reducer)
local v10 = script.Parent.Components.Connection
local v_u_11 = require(v10.LayoutValues).Provider
local v12 = require(v1.Workspace.Packages.PlayerList)
local v_u_13 = v12.Common.LayoutValuesContext
local v_u_14 = v12.LeaderboardStoreContext
local v_u_15 = require(v1.Workspace.Packages.LeaderboardStore).dev.createMockLeaderboardStore()()
local v_u_16 = require(v1.Packages.ApolloClient).ApolloProvider
local v_u_17 = require(v1.Workspace.Packages.GraphQLServer).ApolloClientTestUtils.mockApolloClient
local v_u_18 = require(v1.Packages.LuauPolyfill).Array
local v_u_19 = require(v7.CreateLayoutValues)
return function(p20) -- name: TestProviders
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_17, (copy) v_u_18, (copy) v_u_2, (copy) v_u_4, (copy) v_u_16, (copy) v_u_11, (copy) v_u_19, (copy) v_u_5, (copy) v_u_6, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15
	local v21 = v_u_3.Store.new(v_u_9)
	local v28 = v_u_17({
		["mockResolvers"] = {
			["Query"] = {
				["userProfiles"] = function(_, p22, _, _) -- name: userProfiles
					-- upvalues: (ref) v_u_18
					return v_u_18.map(p22.userIds, function(p23)
						local v24 = {
							["userId"] = p23,
							["names"] = {
								["alias"] = ("alias%*"):format(p23),
								["combinedName"] = ("combinedName%*"):format(p23),
								["contactName"] = ("contactName%*"):format(p23),
								["displayName"] = ("displayName%*"):format(p23),
								["username"] = ("username%*"):format(p23),
								["platformName"] = ("platformName%*"):format(p23),
								["inExperienceCombinedName"] = ("inExperienceCombinedName%*"):format(p23)
							}
						}
						return v24
					end)
				end
			},
			["UserProfile"] = {
				["id"] = function(p25) -- name: id
					local v26 = p25.userId
					return tostring(v26)
				end,
				["names"] = function(p27) -- name: names
					return p27.names
				end
			}
		}
	})
	local v29 = v_u_2.createElement
	local v30 = v_u_4.StoreProvider
	local v31 = {
		["store"] = p20.store or v21
	}
	local v32 = {}
	local v33 = v_u_2.createElement
	local v34 = v_u_16
	local v35 = {
		["client"] = p20.client or v28
	}
	local v36 = {}
	local v37 = v_u_2.createElement
	local v38 = v_u_11
	local v39 = {
		["layoutValues"] = p20.layoutValues or v_u_19(false)
	}
	local v40 = {}
	local v41 = v_u_2.createElement
	local v42 = v_u_5.App.Style.AppStyleProvider
	local v43 = {}
	local v44 = v_u_2.createElement
	local v45 = v_u_6.FoundationProvider
	local v46 = {
		["colorMode"] = v_u_6.Enums.ColorMode.Dark
	}
	local v47 = {}
	local v48 = v_u_2.createElement
	local v49 = v_u_13.Provider
	local v50 = {
		["value"] = p20.layoutValues or v_u_19(false)
	}
	local v51 = {
		["LeaderboardStoreProvider"] = v_u_2.createElement(v_u_14.Provider, {
			["value"] = p20.leaderboardStore or v_u_15
		}, p20.children)
	}
	v47.LayoutValuesProvider = v48(v49, v50, v51)
	v43.FoundationProvider = v44(v45, v46, v47)
	v40.ThemeProvider = v41(v42, {}, v43)
	v36.LayoutValuesProvider_DEPRECATED = v37(v38, v39, v40)
	v32.ApolloProvider = v33(v34, v35, v36)
	return v29(v30, v31, v32)
end