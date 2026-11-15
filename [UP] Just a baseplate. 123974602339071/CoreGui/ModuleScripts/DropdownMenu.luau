-- Path: CoreGui.RobloxGui.Modules.Settings.Components.DropdownMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Utility.normalizeFontFace
local v_u_7 = v5.Utility.Flags.FoundationFontFaceMigration
local v8 = require(v1.Packages.t)
local v9 = require(v1.Workspace.Packages.ArgCheck)
local v10 = v4.App.ImageSet.Images
local v_u_11 = v4.Core.ImageSet.ImageSetLabel
local v_u_12 = v4.Core.Style.useStyle
local v_u_13 = v4.App.Menu.BaseMenu
local v_u_14 = v10["icons/actions/truncationExpand_small"]
local v_u_15 = v9.wrap(v8.strictInterface({
	["buttonSize"] = v8.UDim2,
	["dropdownList"] = v8.table,
	["selectedIndex"] = v8.number,
	["onSelection"] = v8.callback,
	["layoutOrder"] = v8.number
}))
return function(p_u_16) -- name: DropdownMenu
	-- upvalues: (copy) v_u_15, (copy) v_u_12, (copy) v_u_2, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13
	local v17 = v_u_15
	assert(v17(p_u_16))
	local v18 = v_u_12()
	local v_u_19 = v18.Font.CaptionHeader
	local v20 = v_u_19.RelativeSize * v18.Font.BaseSize
	local v21
	if v18.UIBloxThemeEnabled then
		v21 = v18.color("ControlInputBackground")
	else
		v21 = Color3.fromRGB(79, 84, 95)
	end
	local v_u_22, v_u_23 = v_u_2.useState(false)
	local v24, v_u_25 = v_u_2.useState({})
	local v26 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_23, (copy) v_u_22
		v_u_23(not v_u_22)
	end)
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_16, (copy) v_u_19, (copy) v_u_23, (copy) v_u_25
		local v27 = {}
		for v_u_28, v29 in pairs(p_u_16.dropdownList) do
			v27[v_u_28] = {
				["text"] = nil,
				["fontStyle"] = nil,
				["onActivated"] = nil,
				["leftPaddingOffset"] = -12,
				["selected"] = nil,
				["selectedIconPaddingRight"] = 12,
				["text"] = v29,
				["fontStyle"] = {
					["Font"] = v_u_19.Font,
					["RelativeSize"] = v_u_19.RelativeSize
				},
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (ref) p_u_16, (copy) v_u_28, (ref) v_u_23
					p_u_16.onSelection(v_u_28)
					v_u_23(false)
				end,
				["selected"] = v_u_28 == p_u_16.selectedIndex
			}
		end
		v_u_25(v27)
	end, { p_u_16.dropdownList, p_u_16.selectedIndex })
	local v30 = v_u_3.createElement
	local v31 = "Frame"
	local v32 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["ZIndex"] = 3,
		["Size"] = p_u_16.buttonSize,
		["LayoutOrder"] = p_u_16.layoutOrder
	}
	local v33 = {}
	local v34 = v_u_3.createElement
	local v35 = "TextButton"
	local v36 = {
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Text"] = p_u_16.dropdownList[p_u_16.selectedIndex],
		["TextColor3"] = Color3.new(1, 1, 1),
		["TextSize"] = v20
	}
	local v37
	if v_u_7 then
		v37 = nil
	else
		v37 = v_u_19.Font
	end
	v36.Font = v37
	local v38
	if v_u_7 then
		v38 = v_u_6(v18.Tokens.Typography.CaptionLarge.Font)
	else
		v38 = nil
	end
	v36.FontFace = v38
	v36.TextXAlignment = Enum.TextXAlignment.Left
	v36.BackgroundColor3 = v21
	v36.BackgroundTransparency = 0
	v36.LayoutOrder = p_u_16.layoutOrder
	v36[v_u_3.Event.Activated] = v26
	v33.SpawnButton = v34(v35, v36, {
		["UICorner"] = v_u_3.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 4)
		}),
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 12)
		}),
		["UIStroke"] = v_u_3.createElement("UIStroke", {
			["ApplyStrokeMode"] = nil,
			["Color"] = nil,
			["Thickness"] = 1,
			["Transparency"] = 0.8,
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
			["Color"] = Color3.new(1, 1, 1)
		}),
		["Arrow"] = v_u_3.createElement(v_u_11, {
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = v_u_14,
			["Size"] = UDim2.new(0, 16, 0, 16),
			["Position"] = UDim2.new(1, -28, 0.5, -8)
		})
	})
	if v_u_22 then
		v_u_22 = v_u_3.createElement(v_u_13, {
			["buttonProps"] = nil,
			["position"] = nil,
			["layoutOrder"] = 2,
			["elementHeight"] = 40,
			["background"] = nil,
			["showDropShadow"] = true,
			["buttonProps"] = v24,
			["position"] = UDim2.new(0, 0, 1, 6),
			["background"] = {
				["Color"] = v21
			}
		})
	end
	v33.Dropdown = v_u_22
	return v30(v31, v32, v33)
end