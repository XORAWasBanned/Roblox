-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getGeneratedRules
local v_u_1 = script:FindFirstAncestor("Foundation")
require(v_u_1.Enums.ColorMode)
local v_u_2 = require(v_u_1.Enums.Device)
local v_u_3 = require(v_u_1.Utility.Flags)
local v4 = require(v_u_1.Enums.FontName)
local v_u_5 = require(v_u_1.Enums.ThemeName)
local v_u_6 = require(v_u_1.Generated.StyleRules.TypographyVariants)
local v_u_7 = {
	["Common"] = function() -- name: Common
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Generated.StyleRules.CommonAttribute)
	end,
	["Console"] = function() -- name: Console
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Generated.StyleRules.ConsoleAttribute)
	end,
	["Desktop"] = function() -- name: Desktop
		-- upvalues: (copy) v_u_1
		return require(v_u_1.Generated.StyleRules.DesktopAttribute)
	end
}
local v_u_8 = {
	[v_u_5.CircuitRush] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.CircuitRush.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.CircuitRush.LightAttribute)
		end
	},
	[v_u_5.Classic] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Classic.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Classic.LightAttribute)
		end
	},
	[v_u_5.CosmicDust] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.CosmicDust.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.CosmicDust.LightAttribute)
		end
	},
	[v_u_5.Default] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Default.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Default.LightAttribute)
		end
	},
	[v_u_5.ElectricLime] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.ElectricLime.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.ElectricLime.LightAttribute)
		end
	},
	[v_u_5.Halloween2026] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Halloween2026.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Halloween2026.LightAttribute)
		end
	},
	[v_u_5.HyperPlum] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.HyperPlum.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.HyperPlum.LightAttribute)
		end
	},
	[v_u_5.InfernoBlast] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.InfernoBlast.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.InfernoBlast.LightAttribute)
		end
	},
	[v_u_5.Kids] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Kids.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Kids.LightAttribute)
		end
	},
	[v_u_5.KineticEnergy] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.KineticEnergy.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.KineticEnergy.LightAttribute)
		end
	},
	[v_u_5.LavaGlow] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.LavaGlow.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.LavaGlow.LightAttribute)
		end
	},
	[v_u_5.NebulaDrift] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.NebulaDrift.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.NebulaDrift.LightAttribute)
		end
	},
	[v_u_5.NitroFrost] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.NitroFrost.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.NitroFrost.LightAttribute)
		end
	},
	[v_u_5.PixelPop] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.PixelPop.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.PixelPop.LightAttribute)
		end
	},
	[v_u_5.PolarFreeze] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.PolarFreeze.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.PolarFreeze.LightAttribute)
		end
	},
	[v_u_5.QuantumPulse] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.QuantumPulse.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.QuantumPulse.LightAttribute)
		end
	},
	[v_u_5.StarBurst] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.StarBurst.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.StarBurst.LightAttribute)
		end
	},
	[v_u_5.SuperCharge] = {
		["Dark"] = function() -- name: Dark
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.SuperCharge.DarkAttribute)
		end,
		["Light"] = function() -- name: Light
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.SuperCharge.LightAttribute)
		end
	}
}
local v_u_9 = v4.BuilderSans
local v_u_10 = {
	[v4.BuilderSans] = {
		["Desktop"] = function() -- name: Desktop
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Typography.BuilderSans.DesktopAttribute)
		end,
		["Console"] = function() -- name: Console
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Typography.BuilderSans.ConsoleAttribute)
		end
	},
	[v4.Cartoon] = {
		["Desktop"] = function() -- name: Desktop
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Typography.Cartoon.DesktopAttribute)
		end,
		["Console"] = function() -- name: Console
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Typography.Cartoon.ConsoleAttribute)
		end
	}
}
local v_u_11 = {
	[v4.BuilderSans] = {
		["Desktop"] = function() -- name: Desktop
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Legacy.Typography.BuilderSans.DesktopAttribute)
		end,
		["Console"] = function() -- name: Console
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Legacy.Typography.BuilderSans.ConsoleAttribute)
		end
	},
	[v4.Cartoon] = {
		["Desktop"] = function() -- name: Desktop
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Legacy.Typography.Cartoon.DesktopAttribute)
		end,
		["Console"] = function() -- name: Console
			-- upvalues: (copy) v_u_1
			return require(v_u_1.Generated.StyleRules.Legacy.Typography.Cartoon.ConsoleAttribute)
		end
	}
}
return function(p12, p13, p14) -- name: getGeneratedRules
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	local v15 = p12 or v_u_5.Default
	local v16 = v_u_7.Common()
	local v17 = (v_u_8[v15] or v_u_8[v_u_5.Default])[p13]()
	local v18
	if p14 == v_u_2.Console and not v_u_3.FoundationDisableTokenScaling then
		v18 = v_u_7[v_u_2.Console]()
	else
		v18 = v_u_7[v_u_2.Desktop]()
	end
	if not (v17 and (v18 and v16)) then
		return {}
	end
	local v19 = table.clone(v18)
	for v20, v21 in v16 do
		v19[v20] = v21
	end
	for v22, v23 in v17 do
		v19[v22] = v23
	end
	local v24 = v_u_6[v15] or v_u_9
	local v25
	if v_u_3.FoundationFontFaceMigration then
		v25 = v_u_10[v24] or v_u_10[v_u_9]
	else
		v25 = v_u_11[v24] or v_u_11[v_u_9]
	end
	local v26
	if p14 == v_u_2.Console and not v_u_3.FoundationDisableTokenScaling then
		v26 = v_u_2.Console
	else
		v26 = v_u_2.Desktop
	end
	local v27 = v25[v26]
	if v27 then
		local v28 = v27()
		if v28 then
			for v29, v30 in v28 do
				v19[v29] = v30
			end
		end
	end
	return v19
end