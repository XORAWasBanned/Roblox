-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalNotice.useInternalNoticeVariantsProps
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.IconSize)
require(v1.Components.Types)
local v_u_2 = require(v1.Utility.composeStyleVariant)
local v3 = {
	["tag"] = "text-align-x-left"
}
local v_u_4 = {
	["container"] = {
		["tag"] = "col size-full-0 auto-y"
	},
	["content"] = {
		["tag"] = "row align-y-top size-full-0 auto-y"
	},
	["leading"] = {
		["tag"] = "row align-y-top fill auto-y"
	},
	["stack"] = {
		["tag"] = "col fill auto-y"
	},
	["message"] = v3,
	["link"] = v3
}
local v5 = {
	["tag"] = "size-full-0 auto-y"
}
local v_u_6 = {
	[false] = {
		["message"] = {
			["tag"] = "fill auto-y"
		},
		["link"] = {
			["tag"] = "auto-xy"
		}
	}
}
local v7 = {
	["message"] = v5,
	["link"] = {
		["tag"] = v5.tag,
		["padding"] = {}
	}
}
v_u_6[true] = v7
return function(p8, p9, p10) -- name: useInternalNoticeVariantsProps
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6
	local v11 = {
		["tag"] = p10 and "text-truncate-end" or "text-wrap"
	}
	local v12 = {
		["tag"] = p8.leading.gap
	}
	local v13 = {
		["tag"] = p8.stack.gap
	}
	return v_u_2(v_u_4, p8, p9 and {
		["content"] = v12,
		["stack"] = v13
	} or {
		["content"] = {
			["tag"] = p8.content.gap
		},
		["leading"] = v12,
		["stack"] = v13
	}, v_u_6[p9], {
		["message"] = v11,
		["link"] = v11
	})
end