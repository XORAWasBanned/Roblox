-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.DescriptionView
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_3.Button
local v_u_7 = v_u_3.Enums.ButtonVariant
local v_u_8 = v_u_3.Enums.InputSize
local v_u_9 = v_u_3.Text
local v_u_10 = v_u_3.View
local v_u_11 = require(v1.Actions.DescriptionUpdated)
local v_u_12 = v_u_5.useCallback
local v_u_13 = v4.Hooks.useDeviceInsets
local v_u_14 = v4.Hooks.useDispatch
local v_u_15 = v4.Hooks.useSelector
local v_u_16 = v_u_5.useState
local v_u_17 = v_u_3.Hooks.useTokens
local v_u_18 = require(v1.Context.CreationFlowContext)
local v_u_19 = require(v1.Constants)
local v_u_20 = require(v1.Enums.CreationFlowLocalization)
local v_u_21 = require(v1.Analytics.EventNames)
return function(p22)
	-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_17, (copy) v_u_5, (copy) v_u_18, (copy) v_u_15, (copy) v_u_19, (copy) v_u_16, (copy) v_u_12, (copy) v_u_11, (copy) v_u_21, (copy) v_u_10, (copy) v_u_20, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9
	local v_u_23 = v_u_14()
	local v24 = v_u_13()
	local v25 = v_u_17()
	local v_u_26 = v_u_5.useContext(v_u_18)
	local v_u_28, v_u_29 = v_u_16((v_u_15(function(p27)
		-- upvalues: (ref) v_u_19
		return p27[v_u_19.RoduxKey].CreationFlow.description
	end)))
	local v30 = v_u_12(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_11, (copy) v_u_28, (copy) v_u_26, (ref) v_u_21
		v_u_23(v_u_11(v_u_28))
		v_u_26.fireEvent(v_u_21.EditingFlowDescriptionEdited)
	end, { v_u_28 })
	local v36 = v_u_12(function(p31)
		-- upvalues: (copy) v_u_29
		local v32 = p31.Text:gsub("[\r\n]+", " ")
		local v33 = utf8.len(v32)
		if v33 == nil or v33 < 140 then
			v_u_29(v32)
			p31.Text = v32
		else
			local v34 = utf8.offset(v32, 141) - 1
			local v35 = string.sub(v32, 1, v34)
			v_u_29(v35)
			p31.Text = v35
		end
	end, {})
	local v37 = v_u_5.createElement
	local v38 = v_u_10
	local v39 = {
		["LayoutOrder"] = nil,
		["tag"] = "align-x-center auto-y size-full-0",
		["LayoutOrder"] = p22.layoutOrder
	}
	local v40 = {}
	local v41 = v_u_5.createElement
	local v42 = {
		["PaddingTop"] = UDim.new(0, v25.Padding.Large)
	}
	local v43 = UDim.new
	local v44 = v24.bottom
	local v45 = v25.Padding.Large
	v42.PaddingBottom = v43(0, (math.max(v44, v45)))
	local v46 = UDim.new
	local v47 = v24.left
	local v48 = v25.Padding.XLarge
	v42.PaddingLeft = v46(0, (math.max(v47, v48)))
	local v49 = UDim.new
	local v50 = v24.right
	local v51 = v25.Padding.XLarge
	v42.PaddingRight = v49(0, (math.max(v50, v51)))
	v40.Padding = v41("UIPadding", v42)
	local v52 = v_u_5.createElement
	local v53 = v_u_10
	local v54 = {
		["sizeConstraint"] = nil,
		["tag"] = "align-x-center auto-y col gap-large size-full-0",
		["sizeConstraint"] = {
			["MaxSize"] = v_u_19.BottomBarSizeConstraint
		}
	}
	local v55 = {}
	local v56 = v_u_5.createElement
	local v57 = v_u_10
	local v58 = {
		["TextBox"] = v_u_5.createElement("TextBox", {
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundTransparency"] = 1,
			["ClearTextOnFocus"] = false,
			["ClipsDescendants"] = true,
			["Font"] = Enum.Font.BuilderSans,
			["MaxVisibleGraphemes"] = 140,
			["MultiLine"] = false,
			["PlaceholderColor3"] = v25.Color.Content.Muted.Color3,
			["PlaceholderText"] = v_u_26.getLocalization(v_u_20.PublishingDescription),
			["ShowNativeInput"] = true,
			["Text"] = v_u_28,
			["TextColor3"] = v25.Color.ActionStandard.Foreground.Color3,
			["TextSize"] = v25.FontSize.FontSize_400,
			["TextWrapped"] = true,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			[v_u_5.Change.Text] = v36,
			[v_u_5.Event.FocusLost] = v30
		})
	}
	v55.TextBoxContainer = v56(v57, {
		["tag"] = "size-full-2100 bg-surface-100 padding-medium radius-medium"
	}, v58)
	local v59 = v_u_5.createElement
	local v60 = v_u_10
	local v61 = {
		["PostButton"] = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 1,
			["onActivated"] = nil,
			["size"] = nil,
			["text"] = nil,
			["variant"] = nil,
			["width"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fill,
			["onActivated"] = p22.onPublish,
			["size"] = v_u_8.Medium,
			["text"] = v_u_26.getLocalization(v_u_20.PublishingCtaPrimary),
			["variant"] = v_u_7.Emphasis,
			["width"] = UDim.new(0.5, 0)
		}),
		["ReturnToEditingButton"] = v_u_5.createElement(v_u_6, {
			["fillBehavior"] = nil,
			["LayoutOrder"] = 2,
			["text"] = nil,
			["variant"] = nil,
			["width"] = nil,
			["onActivated"] = nil,
			["size"] = nil,
			["fillBehavior"] = v_u_3.Enums.FillBehavior.Fill,
			["text"] = v_u_26.getLocalization(v_u_20.PublishingCtaSecondary),
			["variant"] = v_u_7.Standard,
			["width"] = UDim.new(0.5, 0),
			["onActivated"] = p22.onReturnToEditing,
			["size"] = v_u_8.Medium
		})
	}
	v55.CTAs = v59(v60, {
		["LayoutOrder"] = 2,
		["tag"] = "align-x-center auto-y align-y-bottom anchor-bottom-center gap-small position-bottom-center row size-full-0"
	}, v61)
	v55.Disclaimer = v_u_5.createElement(v_u_9, {
		["LayoutOrder"] = 3,
		["tag"] = "auto-xy text-body-small content-neutral text-align-x-center text-align-y-top",
		["Text"] = nil,
		["Text"] = v_u_26.getLocalization(v_u_20.CreationTooltip)
	})
	v40.SizeConstraint = v52(v53, v54, v55)
	return v37(v38, v39, v40)
end