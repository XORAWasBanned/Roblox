-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Cursor.CursorProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Utility.Wrappers).Services.CoreGui
local v_u_4 = require(v1.Utility.Wrappers).Services.GuiService
local v_u_5 = require(v2.Dash)
local v_u_6 = require(v2.React)
local v_u_7 = require(v2.ReactUtils).useRefCache
local v_u_8 = require(v1.Utility.isPluginSecurity)
local v_u_9 = require(script.Parent.Cursors.Cursor)
local v_u_10 = require(script.Parent.CursorComponent)
local v_u_11 = require(script.Parent.CursorContext)
require(v1.Enums.CursorType)
local v_u_12 = require(script.Parent.KeyUtilities)
require(v1.Enums.ColorNamespace)
require(v1.Components.Types)
local v_u_13 = require(v1.Providers.Style.useTokens)
return function(p14) -- name: CursorProvider
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_13, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_11
	local v_u_15, v_u_16 = v_u_6.useState({})
	local v_u_17 = v_u_6.useRef(nil)
	local v_u_18, v_u_19 = v_u_6.useState(nil)
	local v_u_20 = v_u_7()
	local v_u_21 = v_u_13()
	local v26 = v_u_6.useMemo(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_16, (ref) v_u_12, (copy) v_u_21, (ref) v_u_5
		return {
			["refCache"] = v_u_20,
			["setMountedCursors"] = v_u_16,
			["getCursor"] = function(p22) -- name: getCursor
				-- upvalues: (ref) v_u_12, (ref) v_u_21, (ref) v_u_16, (ref) v_u_5, (ref) v_u_20
				local v_u_23 = v_u_12.mapCursorToKey(p22, v_u_21)
				v_u_16(function(p24)
					-- upvalues: (copy) v_u_23, (ref) v_u_5
					if p24[v_u_23] ~= nil then
						return p24
					end
					local v25 = {
						[v_u_23] = true
					}
					return v_u_5.union(p24, v25)
				end)
				return v_u_20[v_u_23]
			end
		}
	end, { v_u_20, v_u_16, v_u_21 })
	local function v37()
		-- upvalues: (copy) v_u_15, (copy) v_u_20, (copy) v_u_18, (ref) v_u_12, (ref) v_u_6, (ref) v_u_9, (ref) v_u_10
		local v27 = {}
		for v28, _ in v_u_15 do
			local v29
			if v_u_20[v28] == nil or v_u_18 == nil then
				v29 = false
			else
				v29 = v_u_20[v28].current == v_u_18
			end
			local v30 = string.split(v28, " ")
			if #v30 == 2 then
				local v31, v32 = v_u_12.decodeCursorTypeKey(v30)
				v27[v28] = v_u_6.createElement(v_u_9, {
					["ref"] = v_u_20[v28],
					["isVisible"] = v29,
					["cursorType"] = v31,
					["colorNamespace"] = v32
				})
			else
				local v33, v34, v35, v36 = v_u_12.decodeKey(v30)
				v27[v28] = v_u_6.createElement(v_u_10, {
					["ref"] = v_u_20[v28],
					["isVisible"] = v29,
					["cornerRadius"] = v33,
					["offset"] = v34,
					["borderWidth"] = v35,
					["colorNamespace"] = v36
				})
			end
		end
		return v27
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_17, (ref) v_u_8, (ref) v_u_3, (ref) v_u_4, (copy) v_u_19
		if v_u_17.current ~= nil and game:IsAncestorOf(v_u_17.current) then
			local v_u_38 = v_u_8()
			if v_u_38 then
				v_u_38 = v_u_17.current:IsDescendantOf(v_u_3)
			end
			local function v_u_39() -- name: setUpSelectionImageObjectConnection
				-- upvalues: (copy) v_u_38, (ref) v_u_4, (ref) v_u_19
				if v_u_38 then
					return v_u_4:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
						-- upvalues: (ref) v_u_4, (ref) v_u_19
						if v_u_4.SelectedCoreObject == nil then
							v_u_19(nil)
						else
							v_u_19(v_u_4.SelectedCoreObject.SelectionImageObject)
						end
					end)
				else
					return v_u_4:GetPropertyChangedSignal("SelectedObject"):Connect(function()
						-- upvalues: (ref) v_u_4, (ref) v_u_19
						if v_u_4.SelectedObject == nil then
							v_u_19(nil)
						else
							v_u_19(v_u_4.SelectedObject.SelectionImageObject)
						end
					end)
				end
			end
			local v_u_40 = v_u_39()
			local v_u_41 = v_u_17.current.AncestryChanged:Connect(function()
				-- upvalues: (ref) v_u_40, (copy) v_u_39
				v_u_40:Disconnect()
				v_u_40 = v_u_39()
			end)
			return function()
				-- upvalues: (ref) v_u_40, (copy) v_u_41
				v_u_40:Disconnect()
				v_u_41:Disconnect()
			end
		end
	end, {})
	local v42 = v_u_6.createElement
	local v43 = v_u_11.Provider
	local v44 = {
		["Children"] = v_u_6.createElement(v_u_6.Fragment, {}, p14.children),
		["FoundationCursorContainer"] = v_u_6.createElement("Frame", {
			["Size"] = nil,
			["Visible"] = false,
			["ref"] = nil,
			["Size"] = UDim2.new(0, 0, 0, 0),
			["ref"] = v_u_17
		}, (v37()))
	}
	return v42(v43, {
		["value"] = v26
	}, v44)
end