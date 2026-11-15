-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.UtilAndTab
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Constants)
local v_u_5 = v_u_4.TabRowFormatting.FrameHeight
local v_u_6 = v_u_4.TabRowFormatting.TabDropDownWidth
local v_u_7 = v_u_4.TabRowFormatting.TabOverlapThreshold
local v_u_8 = v_u_4.UtilityBarFormatting.FrameHeight
local v_u_9 = v_u_4.UtilityBarFormatting.SmallFrameHeight
local v_u_10 = v_u_4.UtilityBarFormatting.SmallUtilPadding
local v_u_11 = v_u_4.UtilityBarFormatting.ClientServerButtonWidth
local v_u_12 = v_u_4.UtilityBarFormatting.ClientServerDropDownWidth
local v_u_13 = v_u_4.GeneralFormatting.MainRowPadding
local v14 = script.Parent
local v_u_15 = require(v14.ClientServerButton)
local v_u_16 = require(v14.CheckboxContainer)
local v_u_17 = require(v14.TabRowContainer)
local v_u_18 = require(v14.SearchBar)
local v_u_19 = require(v14.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local v20 = v_u_3.Component:extend("UtilAndTab")
function v20.init(p_u_21) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v22 = p_u_21.props.tabList
	local v23 = 0
	local v24 = 0
	for v25, _ in pairs(v22) do
		v23 = v23 + v_u_2:GetTextSize(v25, v_u_4.DefaultFontSize.TabBar, v_u_4.Font.TabBar, Vector2.new(0, 0)).X
		v24 = v24 + 1
	end
	function p_u_21.showSearchBar()
		-- upvalues: (copy) p_u_21
		p_u_21:setState({
			["activeSearchTerm"] = true
		})
	end
	function p_u_21.cancelInput(_, p26)
		-- upvalues: (copy) p_u_21
		if p26.UserInputType == Enum.UserInputType.MouseButton1 or p26.UserInputType == Enum.UserInputType.Touch and p26.UserInputState == Enum.UserInputState.End then
			if p_u_21.searchRef.current then
				p_u_21.searchRef.current.Text = ""
			end
			local v27 = p_u_21.props.onSearchTermChanged
			if v27 then
				v27("")
			end
			p_u_21:setState({
				["activeSearchTerm"] = false
			})
		end
	end
	function p_u_21.focusLost(p28, p29, _)
		-- upvalues: (copy) p_u_21
		if p29 then
			local v30 = p28.text
			local v31 = p_u_21.props.onSearchTermChanged
			if v31 then
				v31(v30)
			end
			local v32 = v30 ~= ""
			if p_u_21.state.activeSearchTerm ~= v32 then
				p_u_21:setState({
					["activeSearchTerm"] = v32
				})
			end
		end
	end
	p_u_21.state = {
		["totalTabWidth"] = nil,
		["totalTabCount"] = nil,
		["activeSearchTerm"] = false,
		["totalTabWidth"] = v23,
		["totalTabCount"] = v24
	}
	p_u_21.utilRef = v_u_3.createRef()
	p_u_21.searchRef = v_u_3.createRef()
end
function v20.render(p33) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_11, (copy) v_u_13, (copy) v_u_10, (copy) v_u_6, (copy) v_u_12, (copy) v_u_2, (copy) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_19, (copy) v_u_18, (copy) v_u_5
	local v34 = p33.props.windowWidth
	local v35 = p33.props.formFactor
	local v36 = p33.props.tabList
	local v37 = p33.props.orderedCheckboxState
	local v38 = p33.props.layoutOrder
	local v39 = p33.props.isClientView
	local v40 = p33.props.searchTerm
	local v41 = p33.props.onClientButton
	local v42 = p33.props.onServerButton
	local v43 = p33.props.onCheckboxChanged
	local v44 = p33.props.onSearchTermChanged
	local v45 = p33.state.totalTabWidth
	local v46 = p33.state.totalTabCount
	local v47 = p33.state.activeSearchTerm
	local v48
	if (v34 - v45) / v46 < v_u_7 then
		v48 = v34 > 0
	else
		v48 = false
	end
	local v49 = v35 == v_u_4.FormFactor.Small and v_u_9 or v_u_8
	local v50 = v35 == v_u_4.FormFactor.Small and 6 or 7
	local v51
	if p33.props[v_u_3.Children] then
		local v52 = #p33.props[v_u_3.Children] / 5
		v51 = math.ceil(v52) or 1
	else
		v51 = 1
	end
	local v53 = v_u_3.createElement
	local v54 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(1, -v50 * v_u_11 - v_u_13, 0, 0),
		["Size"] = UDim2.new(0, 5 * v_u_11, 0, v49 * v51)
	}
	local v55 = {
		["Layout"] = v_u_3.createElement("UIGridLayout", {
			["CellPadding"] = nil,
			["CellSize"] = nil,
			["SortOrder"] = nil,
			["HorizontalAlignment"] = nil,
			["VerticalAlignment"] = nil,
			["FillDirectionMaxCells"] = 5,
			["CellPadding"] = UDim2.new(0, v_u_13, 0, 0),
			["CellSize"] = UDim2.new(0, v_u_11, 0, v49),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		})
	}
	local v56 = p33.props[v_u_3.Children] or {}
	__set_list(v55, 1, {unpack(v56)})
	local v57 = v53("Frame", v54, v55)
	if v35 ~= v_u_4.FormFactor.Small and not v48 then
		local v58 = v41 and v42
		local v59 = v34 - v_u_10 * 3 - 3 * v_u_11
		if v58 then
			v59 = v59 - v_u_11
		end
		local v60 = v_u_3.createElement
		local v61 = "Frame"
		local v62 = {
			["Size"] = UDim2.new(1, 0, 0, v_u_5 + v_u_8 * v51 + v_u_13),
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = v38,
			[v_u_3.Ref] = p33.props.refForParent
		}
		local v63 = {}
		local v64 = {
			["tabList"] = v36,
			["windowWidth"] = v34,
			["frameHeight"] = v_u_5,
			["formFactor"] = v35
		}
		v63.Tabs = v_u_3.createElement(v_u_17, v64)
		local v65 = v_u_3.createElement
		local v66 = "Frame"
		local v67 = {
			["Position"] = UDim2.new(0, 4, 0, v_u_5 + v_u_13),
			["Size"] = UDim2.new(1, -8, 0, v_u_8),
			["BackgroundTransparency"] = 1,
			[v_u_3.Ref] = p33.utilRef
		}
		local v68 = {}
		local v69 = v_u_3.createElement
		local v70 = "Frame"
		local v71 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v72 = {
			["UIListLayout"] = v_u_3.createElement("UIListLayout", {
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["Padding"] = UDim.new(0, v_u_10)
			})
		}
		if v58 then
			v58 = v_u_3.createElement(v_u_15, {
				["formFactor"] = v35,
				["isClientView"] = v39,
				["onClientButton"] = v41,
				["onServerButton"] = v42
			})
		end
		v72.ClientServerButton = v58
		if v43 then
			v43 = v_u_3.createElement(v_u_16, {
				["orderedCheckboxState"] = v37,
				["frameWidth"] = v59,
				["frameHeight"] = v_u_8,
				["pos"] = UDim2.new(0, 2 * v_u_11 + v_u_13, 0, 0),
				["onCheckboxChanged"] = v43
			})
		end
		v72.FilterCheckboxes = v43
		v68.MainRow = v69(v70, v71, v72)
		if v44 then
			v44 = v_u_3.createElement(v_u_18, {
				["size"] = UDim2.new(0, 2 * v_u_11, 0, v_u_8),
				["pos"] = UDim2.new(1, -2 * v_u_11, 0, 0),
				["searchTerm"] = v40,
				["showClear"] = v47,
				["textSize"] = v_u_4.DefaultFontSize.Search,
				["font"] = v_u_4.Font.Search,
				["frameHeight"] = v_u_4.UtilityBarFormatting.FrameHeight,
				["refForParent"] = p33.searchRef,
				["cancelInput"] = p33.cancelInput,
				["focusLost"] = p33.focusLost
			})
		end
		v68.SearchBar = v44
		v68.Buttons = v57
		local v73
		if v_u_19() then
			v73 = p33.props.extraContent
		else
			v73 = nil
		end
		v68.ExtraContent = v73
		v63.UtilBar = v65(v66, v67, v68)
		return v60(v61, v62, v63)
	end
	local v74 = v_u_9 * v51 + v_u_10
	if v47 then
		v74 = v74 + v_u_9 + v_u_10
	end
	local v75 = v41 and v42
	local v76 = v34 - v_u_9 - v_u_6
	if v75 then
		v76 = v76 - v_u_12
	end
	local v77 = v_u_2:GetTextSize("Cancel", v_u_4.DefaultFontSize.UtilBar, v_u_4.Font.UtilBar, Vector2.new(0, 0)).X + 12
	local v78 = v_u_3.createElement
	local v79 = "Frame"
	local v80 = {
		["Size"] = UDim2.new(1, 0, 0, v74),
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = v38,
		[v_u_3.Ref] = p33.props.refForParent
	}
	local v81 = {}
	local v82 = v_u_3.createElement
	local v83 = "Frame"
	local v84 = {
		["Size"] = UDim2.new(1, 0, 0, v_u_9),
		["BackgroundTransparency"] = 1,
		[v_u_3.Ref] = p33.utilRef
	}
	local v85 = {}
	local v86 = v_u_3.createElement
	local v87 = "Frame"
	local v88 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v89 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["Padding"] = UDim.new(0, v_u_10)
		})
	}
	local v90 = {
		["tabList"] = nil,
		["windowWidth"] = nil,
		["frameHeight"] = nil,
		["formFactor"] = nil,
		["layoutOrder"] = 1,
		["tabList"] = v36,
		["windowWidth"] = v34,
		["frameHeight"] = v_u_9,
		["formFactor"] = v35
	}
	v89.Tabs = v_u_3.createElement(v_u_17, v90)
	if v75 then
		local v91 = {
			["frameHeight"] = nil,
			["formFactor"] = nil,
			["useDropDown"] = nil,
			["isClientView"] = nil,
			["layoutOrder"] = 2,
			["onClientButton"] = nil,
			["onServerButton"] = nil,
			["frameHeight"] = v_u_9,
			["formFactor"] = v35,
			["useDropDown"] = v48,
			["isClientView"] = v39,
			["onClientButton"] = v41,
			["onServerButton"] = v42
		}
		v75 = v_u_3.createElement(v_u_15, v91)
	end
	v89.ClientServerButton = v75
	if v43 then
		v43 = v_u_3.createElement(v_u_16, {
			["orderedCheckboxState"] = nil,
			["frameWidth"] = nil,
			["frameHeight"] = nil,
			["pos"] = nil,
			["layoutOrder"] = 3,
			["onCheckboxChanged"] = nil,
			["orderedCheckboxState"] = v37,
			["frameWidth"] = v76,
			["frameHeight"] = v_u_9,
			["pos"] = UDim2.new(0, 2 * v_u_11 + v_u_13, 0, 0),
			["onCheckboxChanged"] = v43
		})
	end
	v89.FilterCheckboxes = v43
	v85.MainRow = v86(v87, v88, v89)
	v85.SearchButton = v_u_3.createElement("ImageButton", {
		["Size"] = UDim2.new(0, v_u_9, 0, v_u_9),
		["Position"] = UDim2.new(1, -v_u_9, 0, 0),
		["BackgroundTransparency"] = 1,
		["Image"] = v_u_4.Image.Search,
		["Visible"] = not v47,
		[v_u_3.Event.Activated] = p33.showSearchBar
	})
	v85.Buttons = v57
	local v92
	if v_u_19() then
		v92 = p33.props.extraContent
	else
		v92 = nil
	end
	v85.ExtraContent = v92
	v81.MainFrame = v82(v83, v84, v85)
	v81.SearchBarFrame = v_u_3.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["Visible"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, v_u_9),
		["Position"] = UDim2.new(0, 0, 0, (v_u_9 + v_u_10) * v51),
		["Visible"] = v47
	}, {
		["SearchBar"] = v_u_3.createElement(v_u_18, {
			["size"] = UDim2.new(1, -v77, 0, v_u_9),
			["searchTerm"] = v40,
			["showClear"] = v47,
			["textSize"] = v_u_4.DefaultFontSize.Search,
			["font"] = v_u_4.Font.Search,
			["frameHeight"] = v_u_9,
			["refForParent"] = p33.searchRef,
			["cancelInput"] = p33.cancelInput,
			["focusLost"] = p33.focusLost
		}),
		["CancelButton"] = v_u_3.createElement("TextButton", {
			["Size"] = UDim2.new(0, v77, 1, 0),
			["Position"] = UDim2.new(1, -v77, 0, 0),
			["Text"] = "Cancel",
			["TextSize"] = v_u_4.DefaultFontSize.UtilBar,
			["TextColor3"] = v_u_4.Color.Text,
			["Font"] = v_u_4.Font.UtilBar,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			[v_u_3.Event.Activated] = p33.cancelInput
		})
	})
	return v78(v79, v80, v81)
end
return v20