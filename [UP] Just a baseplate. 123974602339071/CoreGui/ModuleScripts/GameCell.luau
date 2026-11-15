-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.GameCell
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.UIBlox)
local v4 = require(v1.Packages.t)
local v_u_5 = v3.App.Table.Cell
local v_u_6 = v3.App.SelectionImage.withSelectionCursorProvider
local v7 = script.Parent.Parent
local v8 = require(v7.Dependencies)
local v_u_9 = require(v8.GameIcon)
local v_u_10 = require(v8.ThemedTextLabel)
local v_u_11 = require(v8.withLocalization)
local v12 = v_u_2.PureComponent:extend("GameCell")
v12.validateProps = v4.strictInterface({
	["gameId"] = v4.number,
	["layoutOrder"] = v4.optional(v4.union(v4.integer, v4.table)),
	["onActivated"] = v4.optional(v4.callback)
})
function v12.renderWithSelectionCursor(p13, _) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_5, (copy) v_u_9, (copy) v_u_10
	local v_u_14 = p13.props
	return v_u_11({
		["labelText"] = "CoreScripts.InGameMenu.Report.ReportExperience"
	})(function(p15)
		-- upvalues: (ref) v_u_2, (ref) v_u_5, (copy) v_u_14, (ref) v_u_9, (ref) v_u_10
		local v16 = v_u_2.createElement
		local v17 = v_u_5
		local v18 = {
			["onActivated"] = v_u_14.onActivated,
			["layoutOrder"] = v_u_14.layoutOrder,
			["size"] = UDim2.new(1, 0, 0, 72)
		}
		local v19 = v_u_2.createElement
		local v20 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 72)
		}
		local v21 = {
			["GameIcon"] = v_u_2.createElement(v_u_9, {
				["gameId"] = nil,
				["iconSize"] = 48,
				["cornerRadius"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["gameId"] = v_u_14.gameId,
				["cornerRadius"] = UDim.new(0, 8),
				["Position"] = UDim2.new(0, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0, 0.5)
			}),
			["Label"] = v_u_2.createElement(v_u_10, {
				["fontKey"] = "Header2",
				["themeKey"] = "TextEmphasis",
				["BackgroundTransparency"] = 1,
				["AnchorPoint"] = nil,
				["AutomaticSize"] = nil,
				["Text"] = nil,
				["TextXAlignment"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["Text"] = p15.labelText,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Position"] = UDim2.new(0, 54, 0.5, 0)
			})
		}
		v18.head = v19("Frame", v20, v21)
		v18.tail = v_u_2.createElement("Frame", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 0),
			["Size"] = UDim2.new(0, 0, 1, 0)
		})
		return v16(v17, v18)
	end)
end
function v12.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_6
	return v_u_6(function(p23)
		-- upvalues: (copy) p_u_22
		return p_u_22:renderWithSelectionCursor(p23)
	end)
end
return v12