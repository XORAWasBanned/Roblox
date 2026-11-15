-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Card.Subcomponents.CardHeader
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.BuilderIcons)
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Icon)
local v_u_5 = require(v1.Enums.InputSize)
local v_u_6 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Components.Button.getSharedVariants)
require(script.Parent.Parent.useCardVariants)
local v_u_9 = require(v1.Providers.Style.useTokens)
return function(p10) -- name: CardHeader
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5
	local v11 = v_u_9()
	local v12 = p10.variantProps
	local v13 = v12.titleRow.gap
	local v14 = p10.icon
	local v15
	if typeof(v14) == "table" then
		v15 = p10.icon.name
	else
		v15 = p10.icon
	end
	local v16 = p10.icon
	local v17
	if typeof(v16) == "table" then
		v17 = p10.icon.variant
	else
		v17 = nil
	end
	local v18
	if p10.descriptionLineClamp == nil then
		v18 = nil
	else
		v18 = v12.description.lineHeight * p10.descriptionLineClamp
	end
	local v19 = v_u_3.createElement
	local v20 = v_u_7
	local v21 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["tag"] = v12.headerText.tag,
		["testId"] = ("%*--header-content"):format(p10.testId)
	}
	local v22 = {}
	local v23
	if p10.eyebrow and p10.title ~= nil then
		v23 = v_u_3.createElement(v_u_6, {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = p10.eyebrow,
			["tag"] = v12.eyebrow.tag,
			["testId"] = ("%*--eyebrow"):format(p10.testId)
		})
	else
		v23 = nil
	end
	v22.Eyebrow = v23
	local v24
	if p10.title == nil then
		v24 = nil
	else
		local v25 = v_u_3.createElement
		local v26 = v_u_7
		local v27 = {
			["tag"] = nil,
			["layout"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["tag"] = v12.titleRow.tag,
			["layout"] = v13 and {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Padding"] = UDim.new(0, v13)
			} or nil,
			["testId"] = ("%*--title-row"):format(p10.testId)
		}
		local v28 = {}
		local v29
		if v15 then
			v29 = v_u_3.createElement(v_u_4, {
				["name"] = nil,
				["variant"] = nil,
				["size"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["name"] = v15,
				["variant"] = v17,
				["size"] = v12.icon.size,
				["testId"] = ("%*--icon"):format(p10.testId)
			})
		else
			v29 = nil
		end
		v28.Icon = v29
		local v30
		if p10.title then
			v30 = v_u_3.createElement(v_u_6, {
				["Text"] = nil,
				["tag"] = nil,
				["LayoutOrder"] = 2,
				["testId"] = nil,
				["Text"] = p10.title,
				["tag"] = v12.title.tag,
				["testId"] = ("%*--title"):format(p10.testId)
			})
		else
			v30 = nil
		end
		v28.Title = v30
		v24 = v25(v26, v27, v28)
	end
	v22.TitleRow = v24
	local v31
	if p10.description then
		local v32 = v_u_3.createElement
		local v33 = v_u_6
		local v34 = {
			["Text"] = nil,
			["TextTruncate"] = nil,
			["sizeConstraint"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["Text"] = p10.description
		}
		local v35
		if v18 then
			v35 = Enum.TextTruncate.AtEnd
		else
			v35 = nil
		end
		v34.TextTruncate = v35
		v34.sizeConstraint = v18 and {
			["MaxSize"] = Vector2.new((1 / 0), v18)
		} or nil
		v34.tag = v12.description.tag
		v34.testId = ("%*--description"):format(p10.testId)
		v31 = v32(v33, v34)
	else
		v31 = nil
	end
	v22.Description = v31
	local v36 = v19(v20, v21, v22)
	local v37 = v_u_8(v11).sizes[v_u_5.Small].container.height
	return v_u_3.createElement(v_u_7, {
		["tag"] = nil,
		["sizeConstraint"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["tag"] = v12.header.tag,
		["sizeConstraint"] = {
			["MinSize"] = Vector2.new(0, v37)
		},
		["testId"] = ("%*--header"):format(p10.testId)
	}, {
		["Text"] = v36,
		["Actions"] = p10.actions
	})
end