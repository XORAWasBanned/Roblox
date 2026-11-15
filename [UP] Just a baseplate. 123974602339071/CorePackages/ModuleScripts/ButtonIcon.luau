-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.ButtonIcon
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = v_u_3.Migration.uiblox
local v_u_5 = require(v2.React)
require(v1.Enums.ButtonVariant)
require(v1.Enums.InputSize)
local v_u_6 = require(v1.Components.Image)
local v_u_7 = require(v1.Components.Text)
local v_u_8 = require(v1.Utility.getIconScale)
local v9 = require(v1.Utility.iconMigrationUtils)
local v_u_10 = v9.isMigrated
local v_u_11 = v9.isBuilderOrMigratedIcon
local v_u_12 = require(script.Parent.useButtonVariants)
local v_u_13 = require(v1.Providers.Style.useTextSizeOffset)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Providers.Style.PresentationContext).usePresentationContext
return function(p16) -- name: ButtonIcon
	-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_8, (copy) v_u_15, (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_7, (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (copy) v_u_6
	local v17 = p16.disabledTransparencyBinding
	local v18 = p16.textTransparencyBinding
	local v19 = v_u_14()
	local v20 = v_u_13()
	local v21, v22 = v_u_8(p16.icon, p16.size)
	local v23 = v_u_15()
	local v24 = v_u_12
	local v25 = p16.size
	local v26 = p16.variant
	local v27
	if v23 then
		v27 = v23.colorNamespace
	else
		v27 = nil
	end
	local v_u_28 = v24(v19, v25, v26, v27)
	if not p16.icon then
		return nil
	end
	if not v_u_11(p16.icon) then
		local v29 = v_u_5.createElement
		local v30 = v_u_6
		local v31 = {
			["tag"] = "position-center-center anchor-center-center",
			["Image"] = nil,
			["Size"] = nil,
			["imageStyle"] = nil,
			["scale"] = nil,
			["testId"] = nil,
			["Image"] = p16.icon
		}
		local v32
		if v21 then
			v32 = UDim2.fromOffset(v21.X, v21.Y)
		else
			v32 = v_u_28.icon.size
		end
		v31.Size = v32
		v31.imageStyle = v_u_5.joinBindings({ v17, v18 }):map(function(p33)
			-- upvalues: (copy) v_u_28
			local v34 = p33[1]
			local v35 = p33[2]
			return {
				["Color3"] = v_u_28.content.style.Color3,
				["Transparency"] = v35 + v34
			}
		end)
		v31.scale = v22
		v31.testId = ("%*--icon"):format(p16.testId)
		return v29(v30, v31)
	end
	local v36 = v_u_5.createElement
	local v37 = v_u_7
	local v38 = {
		["Text"] = nil,
		["fontStyle"] = nil,
		["tag"] = "position-center-center anchor-center-center",
		["Size"] = nil,
		["textStyle"] = nil,
		["testId"] = nil
	}
	local v39
	if v_u_10(p16.icon) then
		v39 = v_u_4[p16.icon].name
	else
		v39 = p16.icon
	end
	v38.Text = v39
	local v40 = {}
	local v41 = v_u_3.Font
	local v42
	if v_u_10(p16.icon) then
		v42 = v_u_4[p16.icon].variant
	else
		v42 = v_u_3.IconVariant.Regular
	end
	v40.Font = v41[v42]
	v40.FontSize = v_u_28.icon.size.Y.Offset
	v38.fontStyle = v40
	v38.Size = v_u_28.icon.size
	v38.textStyle = v_u_5.joinBindings({ v17, v18 }):map(function(p43)
		-- upvalues: (copy) v_u_28
		local v44 = p43[1]
		local v45 = p43[2]
		return {
			["Color3"] = v_u_28.content.style.Color3,
			["Transparency"] = v45 + v44
		}
	end)
	v38.testId = ("%*--icon"):format(p16.testId)
	local v46 = {}
	local v47
	if v20 > 0 then
		v47 = v_u_5.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = v_u_28.icon.size.Y.Offset
		})
	else
		v47 = nil
	end
	v46.UITextSizeConstraint = v47
	return v36(v37, v38, v46)
end