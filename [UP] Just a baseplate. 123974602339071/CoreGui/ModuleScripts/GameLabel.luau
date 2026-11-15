-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.GameLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.UIBlox
local v5 = v2.t
local v_u_6 = v2.Cryo
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v_u_9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v4.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v_u_9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v4.App.SelectionImage.CursorKind
end
local v12 = script.Parent.Parent.Parent
local v_u_13 = require(v12.Components.ThemedTextLabel)
local v_u_14 = require(v12.Resources.Assets)
local v_u_15 = require(v1.Packages.React)
local v_u_16 = v4.Core.ImageSet.ImageSetLabel
local v_u_17 = v8.Image
local v_u_18 = v_u_3.PureComponent:extend("GameLabel")
v_u_18.validateProps = v5.strictInterface({
	["gameId"] = v5.number,
	["gameName"] = v5.string,
	["LayoutOrder"] = v5.integer,
	["onActivated"] = v5.optional(v5.callback),
	[v_u_3.Children] = v5.optional(v5.table),
	["buttonRef"] = v5.optional(v5.table)
})
function v_u_18.renderButtons(p19) -- name: renderButtons
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v20 = p19.props[v_u_3.Children] or {}
	return v_u_6.Dictionary.join(v20, {
		["List"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, 12)
		})
	})
end
function v_u_18.renderWithSelectionCursor(p_u_21, p_u_22) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_14, (copy) v_u_7, (copy) v_u_3, (copy) v_u_15, (copy) v_u_11, (copy) v_u_9, (copy) v_u_17, (copy) v_u_16, (copy) v_u_13
	local v23 = p_u_21.props.gameId
	local v_u_24 = v_u_14.Images.PlaceholderGameIcon
	if p_u_21.props.gameId > 0 then
		v_u_24 = "rbxthumb://type=GameIcon&id=" .. v23 .. "&w=150&h=150"
	end
	return v_u_7(function(_)
		return {}
	end, function(_)
		-- upvalues: (ref) v_u_3, (ref) v_u_15, (copy) p_u_21, (copy) p_u_22, (ref) v_u_11, (ref) v_u_9, (ref) v_u_17, (ref) v_u_24, (ref) v_u_16, (ref) v_u_13
		local v25 = v_u_3.createElement
		local v26 = "TextButton"
		local v27 = {
			[v_u_15.Tag] = "data-testid=experienceLabel",
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = p_u_21.props.LayoutOrder,
			["Size"] = UDim2.new(1, 0, 0, 70),
			["Text"] = "",
			["AutoButtonColor"] = false,
			["SelectionImageObject"] = p_u_22(v_u_11.Square),
			[v_u_3.Ref] = p_u_21.props.buttonRef,
			[v_u_3.Event.Activated] = p_u_21.props.onActivated
		}
		local v28 = {}
		local v29
		if v_u_9 then
			v29 = v_u_3.createElement(v_u_17, {
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 24, 0.5, 0),
				["Size"] = UDim2.new(0, 44, 0, 44),
				["Image"] = v_u_24
			})
		else
			v29 = v_u_3.createElement(v_u_16, {
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 24, 0.5, 0),
				["Size"] = UDim2.new(0, 44, 0, 44),
				["Image"] = v_u_24
			})
		end
		v28.GameIcon = v29
		v28.GameNameLabel = v_u_3.createElement(v_u_13, {
			["fontKey"] = "Header2",
			["themeKey"] = "TextEmphasis",
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextTruncate"] = nil,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 80, 0.5, 0),
			["Size"] = UDim2.new(0, 219, 0, 22),
			["Text"] = p_u_21.props.gameName,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextTruncate"] = Enum.TextTruncate.AtEnd
		})
		v28.ButtonContainer = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, -24, 0, 0),
			["Size"] = UDim2.new(0, 0, 1, 0)
		}, p_u_21:renderButtons())
		return v25(v26, v27, v28)
	end)
end
function v_u_18.render(p_u_30) -- name: render
	-- upvalues: (copy) v_u_10
	return v_u_10(function(p31)
		-- upvalues: (copy) p_u_30
		return p_u_30:renderWithSelectionCursor(p31)
	end)
end
return v_u_3.forwardRef(function(p32, p33)
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_6
	return v_u_3.createElement(v_u_18, v_u_6.Dictionary.join(p32, {
		["buttonRef"] = p33
	}))
end)