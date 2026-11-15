-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Banner.Banner
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Button)
local v_u_5 = require(v1.Components.Card)
require(v1.Components.Types)
local v_u_6 = require(v1.Enums.BannerSize)
local v_u_7 = require(v1.Enums.ButtonVariant)
local v_u_8 = require(v1.Enums.CardDensity)
local v_u_9 = require(v1.Enums.CardHeaderSize)
local v_u_10 = require(v1.Enums.CardVariant)
local v_u_11 = require(v1.Enums.InputSize)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
require(script.Parent.Subcomponents.Thumbnail)
local v_u_14 = require(script.Parent.Subcomponents.UpsellContent)
local v_u_15 = {
	["size"] = nil,
	["density"] = nil,
	["testId"] = "--foundation-banner",
	["size"] = v_u_6.Medium,
	["density"] = v_u_8.Default
}
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: Banner
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_3, (copy) v_u_14, (copy) v_u_4, (copy) v_u_7, (copy) v_u_11, (copy) v_u_5, (copy) v_u_12
	local v18 = v_u_13(p16, v_u_15)
	local v19
	if p16.actions then
		v19 = p16.actions.primary
	else
		v19 = nil
	end
	local v20 = {
		["variant"] = v_u_10.Emphasis,
		["density"] = v18.density
	}
	local v21
	if v18.density == v_u_8.Compact then
		v21 = v_u_9.Small
	else
		v21 = v_u_9.Medium
	end
	v20.headerSize = v21
	local v22
	if v19 then
		v22 = v19.onActivated
	else
		v22 = nil
	end
	v20.onActivated = v22
	v20.ref = p17
	local v23
	if p16.size == v_u_6.Small then
		v23 = {}
		local v24 = v_u_3.createElement
		local v25 = v_u_14
		local v26 = {
			["density"] = v18.density,
			["title"] = v18.title,
			["description"] = v18.description,
			["thumbnail"] = p16.thumbnail
		}
		local v27
		if v19 then
			v27 = v19.onActivated
		else
			v27 = nil
		end
		v26.onActivated = v27
		local v28
		if v19 then
			v28 = nil
		else
			v28 = p16.onClose
		end
		v26.onClose = v28
		v26.testId = v18.testId
		v23.UpsellContent = v24(v25, v26)
	else
		local v29
		if p16.actions then
			v29 = p16.actions.secondary
		else
			v29 = nil
		end
		if p16.onClose then
			v20.onClose = p16.onClose
		end
		v20.title = v18.title
		v20.description = v18.description
		v20.lineClamp = {
			["description"] = v18.density == v_u_8.Compact and 2 or 3
		}
		local v30 = p16.media
		local v31
		if typeof(v30) == "table" then
			v31 = {
				["image"] = p16.media.image,
				["width"] = p16.media.width
			}
		else
			v31 = p16.media
		end
		v20.media = v31
		v23 = v29 and {
			["SecondaryAction"] = v_u_3.createElement(v_u_4, {
				["text"] = nil,
				["onActivated"] = nil,
				["variant"] = nil,
				["size"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["text"] = v29.text,
				["onActivated"] = v29.onActivated,
				["variant"] = v_u_7.SoftEmphasis,
				["size"] = v_u_11.Small,
				["testId"] = ("%*--secondary-action"):format(v18.testId)
			})
		} or nil
	end
	return v_u_3.createElement(v_u_5, v_u_12(v18, v20), v23)
end))