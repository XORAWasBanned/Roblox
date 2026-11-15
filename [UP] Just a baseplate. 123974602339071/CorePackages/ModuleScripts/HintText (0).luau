-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.HintText.HintText
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.withCommonProps)
return v_u_3.memo(v_u_3.forwardRef(function(p6, p7) -- name: HintText
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_3.createElement
	local v9 = v_u_4
	local v10 = v_u_5
	local v11 = {
		["Text"] = p6.text
	}
	local v12 = {
		["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true,
		["content-action-alert"] = p6.hasError
	}
	local v13 = p6.isDisabled
	if v13 then
		v13 = not p6.hasError
	end
	v12["content-muted"] = v13
	local v14 = not p6.isDisabled
	if v14 then
		v14 = not p6.hasError
	end
	v12["content-default"] = v14
	v11.tag = v12
	v11.ref = p7
	return v8(v9, v10(p6, v11))
end))