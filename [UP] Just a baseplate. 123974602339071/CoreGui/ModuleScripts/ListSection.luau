-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.ItemsList.ListSection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Packages.RoactGamepad)
local v5 = require(v1.Packages.t)
local v_u_6 = require(v1.Packages.AvatarExperienceDeps).RoactFitComponents
local v_u_7 = require(script.Parent.ListEntry)
local v_u_8 = v_u_3.PureComponent:extend("ListSection")
v_u_8.validateProps = v5.strictInterface({
	["headerText"] = v5.string,
	["items"] = v5.array(v5.string),
	["layoutOrder"] = v5.integer,
	["isFirstSection"] = v5.boolean,
	["isLastSection"] = v5.boolean,
	["NextSelectionLeft"] = v5.optional(v5.table),
	["NextSelectionRight"] = v5.optional(v5.table),
	["NextSelectionUp"] = v5.optional(v5.table),
	["NextSelectionDown"] = v5.optional(v5.table),
	["forwardRef"] = v5.table
})
function v_u_8.init(p9) -- name: init
	-- upvalues: (copy) v_u_4
	p9.listRefCache = v_u_4.createRefCache()
end
function v_u_8.render(p10) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
	local v11 = {}
	local v12 = 0
	local v13 = v_u_3.createElement
	local v14 = v_u_4.Focusable[v_u_7]
	local v15 = {
		["text"] = p10.props.headerText,
		["hasBullet"] = false,
		["layoutOrder"] = 0
	}
	local v16
	if p10.props.isFirstSection then
		v16 = p10.firstEntryPositionChanged or nil
	else
		v16 = nil
	end
	v15.positionChangedCallback = v16
	local v17
	if #p10.props.items > 0 then
		v17 = p10.listRefCache[1] or nil
	else
		v17 = nil
	end
	v15.NextSelectionDown = v17
	v15[v_u_3.Ref] = p10.listRefCache[0]
	v11[v12] = v13(v14, v15)
	for v18, v19 in ipairs(p10.props.items) do
		local v20
		if p10.props.isLastSection and v18 == #p10.props.items then
			v20 = p10.lastEntryPositionChanged
		else
			v20 = nil
		end
		local v21 = v_u_3.createElement
		local v22 = v_u_4.Focusable[v_u_7]
		local v23 = {
			["text"] = v19,
			["hasBullet"] = true,
			["layoutOrder"] = v18,
			["positionChangedCallback"] = v20,
			["NextSelectionUp"] = p10.listRefCache[v18 - 1]
		}
		local v24
		if v18 == #p10.props.items then
			v24 = nil
		else
			v24 = p10.listRefCache[v18 + 1] or nil
		end
		v23.NextSelectionDown = v24
		v23[v_u_3.Ref] = p10.listRefCache[v18]
		v11[v18] = v21(v22, v23)
	end
	local v25 = p10.props.forwardRef
	return v_u_3.createElement(v_u_4.Focusable[v_u_6.FitFrameVertical], {
		["width"] = UDim.new(1, 0),
		["FillDirection"] = Enum.FillDirection.Vertical,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = p10.props.layoutOrder,
		["defaultChild"] = p10.listRefCache[0],
		["NextSelectionLeft"] = p10.props.NextSelectionLeft,
		["NextSelectionRight"] = p10.props.NextSelectionRight,
		["NextSelectionUp"] = p10.props.NextSelectionUp,
		["NextSelectionDown"] = p10.props.NextSelectionDown,
		[v_u_3.Ref] = v25
	}, v11)
end
return v_u_3.forwardRef(function(p26, p27)
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_2
	return v_u_3.createElement(v_u_8, v_u_2.Dictionary.join(p26, {
		["forwardRef"] = p27
	}))
end)