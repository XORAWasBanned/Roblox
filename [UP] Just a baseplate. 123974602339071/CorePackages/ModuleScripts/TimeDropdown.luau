-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.DateTimePicker.Time.TimeDropdown
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.DateTimePicker.DateTimeUtilities)
local v_u_5 = require(v1.Components.Dropdown)
local v_u_6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Utility.Wrappers).Services.LocalizationService
local v_u_8 = require(v1.Utility.Localization.Translator)
local v_u_9 = require(v1.Utility.useScaledValue)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = {
	["dateTime"] = nil,
	["testId"] = "--foundation-time-dropdown",
	["dateTime"] = DateTime.fromLocalTime(2000, 1, 1, 0, 0, 0)
}
return function(p12) -- name: TimeSelector
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6
	local v13 = v_u_10(p12, v_u_11)
	local v_u_14 = v_u_4.roundDownToNearestMinute(v13.dateTime)
	local v_u_15 = v_u_14:ToLocalTime()
	local v16 = v_u_9(200)
	local function v26()
		-- upvalues: (copy) v_u_15, (copy) v_u_14, (ref) v_u_7
		local v17 = v_u_15.Minute % 30 ~= 0
		local v18 = {}
		for v19 = 0, 47 do
			local v20 = v19 / 2
			local v21 = math.floor(v20)
			local v22 = v19 % 2 * 30
			local v23 = DateTime.fromLocalTime(v_u_15.Year, v_u_15.Month, v_u_15.Day, v21, v22, v_u_15.Second)
			if v17 and v_u_14.UnixTimestamp < v23.UnixTimestamp then
				local v24 = {
					["icon"] = nil,
					["id"] = nil,
					["isChecked"] = true,
					["isDisabled"] = true,
					["text"] = nil,
					["id"] = v_u_14.UnixTimestamp,
					["text"] = v_u_14:FormatLocalTime("LT", v_u_7.RobloxLocaleId)
				}
				table.insert(v18, v24)
				v17 = false
			end
			local v25 = {
				["icon"] = nil,
				["id"] = nil,
				["isChecked"] = nil,
				["isDisabled"] = nil,
				["text"] = nil,
				["id"] = v23.UnixTimestamp,
				["isChecked"] = v23.UnixTimestamp == v_u_14.UnixTimestamp,
				["isDisabled"] = v23.UnixTimestamp == v_u_14.UnixTimestamp,
				["text"] = v23:FormatLocalTime("LT", v_u_7.RobloxLocaleId)
			}
			table.insert(v18, v25)
		end
		return v18
	end
	return v_u_3.createElement(v_u_5.Root, {
		["items"] = nil,
		["label"] = "",
		["LayoutOrder"] = nil,
		["maxHeight"] = nil,
		["onItemChanged"] = nil,
		["placeholder"] = nil,
		["size"] = nil,
		["testId"] = nil,
		["width"] = nil,
		["value"] = nil,
		["items"] = v26(),
		["LayoutOrder"] = v13.LayoutOrder,
		["maxHeight"] = v16,
		["onItemChanged"] = v13.onItemChanged,
		["placeholder"] = v_u_8:FormatByKey("CommonUI.Controls.Label.SelectTheTime"),
		["size"] = v_u_6.Medium,
		["testId"] = v13.testId,
		["width"] = v13.width,
		["value"] = v_u_14.UnixTimestamp
	})
end