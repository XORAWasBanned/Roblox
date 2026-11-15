-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.CommonIcon
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Foundation)
local v_u_4 = require(v2.Packages.React)
local v5 = require(v2.Packages.UIBlox)
local v_u_6 = v5.Core.Style.useStyle
local v_u_7 = v5.Core.ImageSet.ImageSetLabel
local v_u_8 = v5.App.ImageSet.Images
local v_u_9 = require(v1.ChromeShared.Unibar.Constants)
require(v1.ChromeShared.Service.ChromeUtils)
local v_u_10 = require(v1.ChromeShared.Unibar.SubMenuContext)
local v_u_11 = v_u_3.Enums.IconVariant
local v_u_12 = v_u_3.Enums.IconSize
local v_u_13 = v_u_3.Enums.IconName
local v_u_14 = require(v1.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v15 = require(v2.Workspace.Packages.Chrome)
local v_u_16 = v15.Hooks.useMappedSignal
local v_u_17 = v15.UnibarStyle
function CommonIconComponent(p18) -- name: CommonIconComponent
	-- upvalues: (copy) v_u_14, (copy) v_u_17, (copy) v_u_9, (copy) v_u_16, (copy) v_u_6, (copy) v_u_4, (copy) v_u_10, (copy) v_u_13, (copy) v_u_3, (copy) v_u_12, (copy) v_u_11, (copy) v_u_8, (copy) v_u_7
	local v19
	if v_u_14 then
		v19 = v_u_17.use().ICON_SIZE
	else
		v19 = v_u_9.ICON_SIZE
	end
	local v20
	if p18.activeSignalValue then
		v20 = v_u_16(p18.activeSignalValue) or false
	else
		v20 = false
	end
	local v21 = p18.icon
	if v20 and p18.iconOn then
		v21 = p18.iconOn
	end
	local v22 = v_u_6()
	local v23 = v_u_4.useContext(v_u_10)
	local v_u_24 = v22.Theme.IconEmphasis.Color
	local v_u_25 = v22.Theme.IconEmphasis.Transparency
	if v_u_13[p18.icon] ~= nil then
		local v27 = not v23 and {
			["Color3"] = v_u_24,
			["Transparency"] = v_u_25
		} or v23:map(function(p26)
			-- upvalues: (copy) v_u_24, (copy) v_u_25
			return {
				["Color3"] = v_u_24,
				["Transparency"] = v_u_25 + (1 - v_u_25) * (1 - p26)
			}
		end)
		local v28 = v_u_4.createElement
		local v29 = v_u_3.Icon
		local v30 = {
			["name"] = v_u_13[p18.icon],
			["size"] = v_u_12.Large,
			["style"] = v27
		}
		local v31
		if v20 then
			v31 = v_u_11.Filled
		else
			v31 = v_u_11.Regular
		end
		v30.variant = v31
		return v28(v29, v30)
	else
		if typeof(v21) == "string" and v21:sub(1, 11) ~= "rbxasset://" then
			v21 = v_u_8[v21]
		end
		local v32 = v_u_4.createElement
		local v33 = v_u_7
		local v34 = {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Image"] = v21,
			["Size"] = UDim2.new(0, v19, 0, v19),
			["ImageColor3"] = v_u_24
		}
		if v23 then
			v_u_25 = v23:map(function(p35)
				-- upvalues: (copy) v_u_25
				return v_u_25 + (1 - v_u_25) * (1 - p35)
			end)
		end
		v34.ImageTransparency = v_u_25
		return v32(v33, v34)
	end
end
function CommonIcon(p36, p37, p38) -- name: CommonIcon
	-- upvalues: (copy) v_u_4
	return v_u_4.createElement(CommonIconComponent, {
		["icon"] = p36,
		["iconOn"] = p37,
		["activeSignalValue"] = p38
	})
end
return CommonIcon