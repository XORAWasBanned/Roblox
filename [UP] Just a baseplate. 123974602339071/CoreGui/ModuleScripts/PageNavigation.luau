-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PageNavigation
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Otter
local v_u_4 = v2.Roact
local v5 = v2.RoactRodux
local v6 = v2.UIBlox
local v_u_7 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_8 = v6.Core.ImageSet.ImageSetLabel
local v9 = require(v1.Packages.Foundation)
local v_u_10 = v9.Icon
local v_u_11 = v9.Enums.IconSize
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_13
if v_u_12 then
	v_u_13 = v9.UNSTABLE.withCursorMigration
else
	v_u_13 = v6.App.SelectionImage.withSelectionCursorProvider
end
local v_u_14
if v_u_12 then
	v_u_14 = v9.Enums.CursorType
else
	v_u_14 = v6.App.SelectionImage.CursorKind
end
local v15 = script.Parent.Parent
local v_u_16 = require(v15.Actions.SetCurrentPage)
local v_u_17 = require(script.Parent.Pages)
local v_u_18 = require(script.Parent.ThemedTextLabel)
local v_u_19 = require(script.Parent.Divider)
local v_u_20 = require(v15.Localization.withLocalization)
local v_u_21 = require(v15.Utility.divideTransparency)
local v_u_22 = require(v15.Utility.SendAnalytics)
local v_u_23 = require(v15.Resources.Constants)
local v_u_24 = v_u_4.PureComponent:extend("NavigationButton")
function v_u_24.init(p_u_25, p26) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v27 = p26.selected and 1 or 0
	local v28, v_u_29 = v_u_4.createBinding(v27)
	p_u_25.fillSize = v28:map(function(p30)
		return UDim2.new(p30, 0, 1, 0)
	end)
	local v31, v32 = v_u_4.createBinding(0)
	p_u_25.hoverTransparency = v31
	p_u_25.setHoverTransparency = v32
	p_u_25.motor = v_u_3.createGroupMotor({
		["fillProgress"] = nil,
		["hoverTransparency"] = 0,
		["fillProgress"] = v27
	})
	p_u_25.motor:onStep(function(p33)
		-- upvalues: (copy) v_u_29, (copy) p_u_25
		v_u_29(p33.fillProgress)
		p_u_25.setHoverTransparency(p33.hoverTransparency)
	end)
	p_u_25:setState({
		["hovering"] = false,
		["pressing"] = false
	})
end
function v_u_24.renderWithSelectionCursor(p_u_34, p_u_35) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_20, (copy) v_u_7, (copy) v_u_4, (copy) v_u_14, (copy) v_u_12, (copy) v_u_10, (copy) v_u_11, (copy) v_u_21, (copy) v_u_8, (copy) v_u_18
	local v_u_36 = p_u_34.props
	return v_u_20({
		["text"] = v_u_36.text
	})(function(p_u_37)
		-- upvalues: (ref) v_u_7, (copy) p_u_34, (copy) v_u_36, (ref) v_u_4, (copy) p_u_35, (ref) v_u_14, (ref) v_u_12, (ref) v_u_10, (ref) v_u_11, (ref) v_u_21, (ref) v_u_8, (ref) v_u_18
		return v_u_7(function(p38)
			local v39 = {}
			local v40 = {
				["BackgroundOnPress"] = {
					["Color"] = p38.Color.State.Press.Color3,
					["Transparency"] = p38.Color.State.Press.Transparency
				},
				["BackgroundOnHover"] = {
					["Color"] = p38.Color.State.Hover.Color3,
					["Transparency"] = p38.Color.State.Hover.Transparency
				},
				["IconEmphasis"] = {
					["Color"] = p38.Color.Content.Emphasis.Color3,
					["Transparency"] = p38.Color.Content.Emphasis.Transparency
				},
				["TextEmphasis"] = {
					["Color"] = p38.Color.Content.Emphasis.Color3,
					["Transparency"] = p38.Color.Content.Emphasis.Transparency
				},
				["BackgroundMuted"] = {
					["Color"] = p38.Color.Surface.Surface_200.Color3,
					["Transparency"] = p38.Color.Surface.Surface_200.Transparency
				}
			}
			v39.Theme = v40
			return v39
		end, function(p41)
			-- upvalues: (ref) p_u_34, (ref) v_u_36, (ref) v_u_4, (ref) p_u_35, (ref) v_u_14, (ref) v_u_12, (ref) v_u_10, (ref) v_u_11, (ref) v_u_21, (ref) v_u_8, (ref) v_u_18, (copy) p_u_37
			local v42 = p_u_34.state.pressing
			if v42 then
				v42 = not v_u_36.selected
			end
			local v43 = {
				["Transparency"] = 1,
				["Color"] = nil,
				["Color"] = Color3.new(1, 1, 1)
			}
			if p_u_34.state.pressing then
				v43 = p41.Theme.BackgroundOnPress
			elseif p_u_34.state.hovering then
				v43 = p41.Theme.BackgroundOnHover
			end
			local v44 = v_u_4.createElement
			local v45 = "TextButton"
			local v46 = {
				["AutoButtonColor"] = false,
				["BackgroundTransparency"] = v43.Transparency,
				["BackgroundColor3"] = v43.Color,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = v_u_36.LayoutOrder,
				["Size"] = UDim2.new(1, 0, 0, 70),
				["Text"] = "",
				["SelectionImageObject"] = p_u_35(v_u_14.Square),
				[v_u_4.Event.Activated] = v_u_36.onActivated
			}
			local v47 = v_u_4.Ref
			local v48
			if v_u_36.LayoutOrder == 1 then
				v48 = v_u_36.mainPageFirstButtonRef or nil
			else
				v48 = nil
			end
			v46[v47] = v48
			v46[v_u_4.Event.MouseEnter] = function()
				-- upvalues: (ref) p_u_34
				p_u_34:setState({
					["hovering"] = true
				})
			end
			v46[v_u_4.Event.MouseLeave] = function()
				-- upvalues: (ref) p_u_34
				p_u_34:setState({
					["hovering"] = false,
					["pressing"] = false
				})
			end
			v46[v_u_4.Event.InputBegan] = function(_, p49)
				-- upvalues: (ref) p_u_34
				if p49.UserInputType == Enum.UserInputType.MouseButton1 or p49.UserInputType == Enum.UserInputType.Touch then
					p_u_34:setState({
						["pressing"] = true
					})
				end
			end
			v46[v_u_4.Event.InputEnded] = function(_, p50)
				-- upvalues: (ref) p_u_34
				if p50.UserInputType == Enum.UserInputType.MouseButton1 or p50.UserInputType == Enum.UserInputType.Touch then
					p_u_34:setState({
						["pressing"] = false
					})
				end
			end
			local v51 = {}
			local v52 = v_u_4.createElement
			local v53 = "Frame"
			local v54 = {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["ZIndex"] = 3,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5)
			}
			local v55 = {}
			local v56
			if v_u_12 then
				local v57 = v_u_4.createElement
				local v58 = v_u_10
				local v59 = {
					["AnchorPoint"] = nil,
					["name"] = nil,
					["size"] = nil,
					["style"] = nil,
					["Position"] = nil,
					["ZIndex"] = 3,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["name"] = v_u_36.icon,
					["size"] = v_u_11.Medium,
					["style"] = {
						["Color3"] = p41.Theme.IconEmphasis.Color,
						["Transparency"] = v_u_21(p41.Theme.IconEmphasis.Transparency, v42 and 2 or 1)
					},
					["Position"] = UDim2.new(0, 28, 0.5, 0)
				}
				v56 = v57(v58, v59)
			else
				v56 = v_u_4.createElement(v_u_8, {
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["ImageColor3"] = nil,
					["ImageTransparency"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["ZIndex"] = 3,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Image"] = v_u_36.icon,
					["ImageColor3"] = p41.Theme.IconEmphasis.Color,
					["ImageTransparency"] = v_u_21(p41.Theme.IconEmphasis.Transparency, v42 and 2 or 1),
					["Position"] = UDim2.new(0, 28, 0.5, 0),
					["Size"] = UDim2.new(0, 36, 0, 36)
				})
			end
			v55.Icon = v56
			v55.Text = v_u_4.createElement(v_u_18, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextTransparency"] = nil,
				["TextXAlignment"] = nil,
				["ZIndex"] = 3,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 80, 0.5, 0),
				["Size"] = UDim2.new(1, -104, 1, 0),
				["Text"] = p_u_37.text,
				["TextTransparency"] = v_u_21(p41.Theme.TextEmphasis.Transparency, v42 and 2 or 1),
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
			v51.ContentContainer = v52(v53, v54, v55)
			v51.SelectedFill = v_u_4.createElement("Frame", {
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["ZIndex"] = 2,
				["Size"] = p_u_34.fillSize,
				["BackgroundColor3"] = p41.Theme.BackgroundMuted.Color
			})
			return v44(v45, v46, v51)
		end)
	end)
end
function v_u_24.render(p_u_60) -- name: render
	-- upvalues: (copy) v_u_13
	return v_u_13(function(p61)
		-- upvalues: (copy) p_u_60
		return p_u_60:renderWithSelectionCursor(p61)
	end)
end
function v_u_24.didUpdate(p62) -- name: didUpdate
	-- upvalues: (copy) v_u_3
	p62.motor:setGoal({
		["fillProgress"] = v_u_3.spring(p62.props.selected and 1 or 0, {
			["frequency"] = 2.5
		}),
		["hoverTransparency"] = v_u_3.spring(p62.state.hovering and 1 or 0, {
			["frequency"] = 5
		})
	})
end
return v5.UNSTABLE_connect2(function(p63, _)
	return {
		["currentPage"] = p63.menuPage
	}
end, function(p_u_64)
	-- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_23
	return {
		["setCurrentPage"] = function(p65) -- name: setCurrentPage
			-- upvalues: (copy) p_u_64, (ref) v_u_16, (ref) v_u_22, (ref) v_u_23
			p_u_64(v_u_16(p65))
			v_u_22("open_" .. p65 .. "_tab", v_u_23.AnalyticsMenuActionName, {})
		end
	}
end)(function(p_u_66) -- name: PageNavigation
	-- upvalues: (copy) v_u_4, (copy) v_u_17, (copy) v_u_23, (copy) v_u_24, (copy) v_u_19
	local v67 = {
		["Layout"] = v_u_4.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
		})
	}
	local v68 = #v_u_17.pagesByIndex
	local v69 = 1
	for v70, v_u_71 in ipairs(v_u_17.pagesByIndex) do
		if v_u_71.parentPage ~= v_u_23.MainPagePageKey then
			continue
		end
		local v72 = "Page" .. v_u_71.key
		local v73 = v_u_4.createElement
		local v74 = v_u_24
		local v75 = {
			["icon"] = v_u_71.icon,
			["LayoutOrder"] = v69,
			["selected"] = p_u_66.currentPage == v_u_71.key,
			["text"] = v_u_71.title,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_66, (copy) v_u_71
				p_u_66.setCurrentPage(v_u_71.key)
			end
		}
		local v76
		if v69 == 1 then
			v76 = p_u_66.mainPageFirstButtonRef or nil
		else
			v76 = nil
		end
		v75.mainPageFirstButtonRef = v76
		v67[v72] = v73(v74, v75)
		v69 = v69 + 1
		if v70 >= v68 then
			continue
		end
		v67["Divider" .. v69] = v_u_4.createElement(v_u_19, {
			["LayoutOrder"] = v69,
			["Size"] = UDim2.new(1, -24, 0, 1)
		})
		v69 = v69 + 1
	end
	return v_u_4.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["Position"] = p_u_66.Position,
		["Size"] = UDim2.new(1, -v_u_23.Zone.ContentOffset, 0, v68 * 70 + (v68 - 1))
	}, v67)
end)