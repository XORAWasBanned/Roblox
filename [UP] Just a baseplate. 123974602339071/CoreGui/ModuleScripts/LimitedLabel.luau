-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.LimitedLabel
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Workspace.Packages.Style).AppFonts
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = v4.App.ImageSet.Images
local v_u_6 = v4.Core.ImageSet.ImageSetLabel
local v_u_7 = require(v1.Packages.Roact)
local v8 = v_u_7.PureComponent:extend("LimitedLabel")
local v_u_9 = require(v2.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
function v8.render(p10) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_3
	local v11 = p10.props.frameSize
	local v12 = p10.props.framePosition
	local v13 = p10.props.imageSize
	local v14 = p10.props.imagePosition
	local v15 = p10.props.textSize
	local v16 = p10.props.textPosition
	local v17 = p10.props.text
	local v18 = v_u_5["icons/status/item/limited"]
	local v19 = v_u_7.createElement
	local v20 = "Frame"
	local v21 = {
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 3,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["Size"] = v11,
		["Position"] = v12,
		["BackgroundColor3"] = Color3.fromRGB(120, 120, 120)
	}
	local v22 = {
		["Corner"] = v_u_7.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 8)
		}),
		["CollectiblesIcon"] = v_u_7.createElement(v_u_6, {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["Visible"] = true,
			["Image"] = nil,
			["Position"] = v14,
			["Size"] = v13,
			["Image"] = v18
		})
	}
	local v23
	if v_u_9() and not v17 then
		v23 = nil
	else
		v23 = v_u_7.createElement("TextLabel", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Position"] = v16,
			["Size"] = v15,
			["Text"] = v17,
			["Font"] = v_u_3.default:getDefault(),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextColor3"] = Color3.new(1, 1, 1)
		})
	end
	v22.CollectiblesText = v23
	return v19(v20, v21, v22)
end
return v8