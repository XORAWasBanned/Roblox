-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Empty.Empty
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v5 = v3.Icon
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v1.Components.Icon)
local v8 = require(v1.Enums.IconSize)
local v_u_9 = require(v1.Components.Text)
local v_u_10 = require(v1.Components.View)
local v11 = require(v1.Utility.Localization.Translator)
require(v1.Components.Types)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = {
	["icon"] = nil,
	["text"] = nil,
	["button"] = nil,
	["testId"] = "--foundation-empty",
	["icon"] = {
		["name"] = "icons/status/oof_xlarge",
		["size"] = nil,
		["size"] = v8.Large
	},
	["text"] = v11:FormatByKey("CommonUI.Controls.NoResultsFound"),
	["button"] = {
		["icon"] = nil,
		["text"] = nil,
		["onActivated"] = nil,
		["icon"] = v5.TwoArrowsSpinClockwise,
		["text"] = v11:FormatByKey("CommonUI.Controls.Action.Refresh")
	}
}
return v_u_4.memo(v_u_4.forwardRef(function(p16, p17) -- name: Empty
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_12, (copy) v_u_4, (copy) v_u_10, (copy) v_u_13, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6
	local v18 = v_u_14(p16, v_u_15)
	local v19 = v_u_12()
	local v20 = v_u_4.createElement
	local v21 = v_u_10
	local v22 = v_u_13(v18, {
		["tag"] = "col align-x-center align-y-center gap-small size-full auto-xy",
		["ref"] = nil,
		["ref"] = p17
	})
	local v23 = {
		["Icon"] = v_u_4.createElement(v_u_7, {
			["name"] = nil,
			["size"] = nil,
			["style"] = nil,
			["LayoutOrder"] = 1,
			["name"] = v18.icon.name,
			["size"] = v18.icon.size,
			["style"] = v19.Color.Content.Default
		}),
		["Text"] = v_u_4.createElement(v_u_9, {
			["Text"] = nil,
			["LayoutOrder"] = 2,
			["tag"] = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			["testId"] = nil,
			["Text"] = v18.text,
			["testId"] = ("%*--text"):format(v18.testId)
		})
	}
	local v24
	if v18.button and v18.button.onActivated then
		v24 = v_u_4.createElement(v_u_6, {
			["text"] = nil,
			["icon"] = nil,
			["onActivated"] = nil,
			["LayoutOrder"] = 3,
			["text"] = v18.button.text,
			["icon"] = v18.button.icon,
			["onActivated"] = v18.button.onActivated
		})
	else
		v24 = nil
	end
	v23.Button = v24
	return v20(v21, v22, v23)
end))