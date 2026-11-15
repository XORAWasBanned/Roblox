-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Resources.Images
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.ArgCheck)
local v3 = require(script.Parent.GetImageSetData)((game:GetService("GuiService"):GetResolutionScale()))
local v4 = {}
for v5, v6 in pairs(v3) do
	v2.isType(v6, "table", "value")
	local v7 = {}
	for v8, v9 in pairs(v6) do
		if v8 == "ImageSet" then
			v7.Image = string.format("rbxasset://textures/ui/ImageSet/%s.png", v9)
		else
			v7[v8] = v9
		end
	end
	v4[v5] = v7
end
setmetatable(v4, {
	["__index"] = function(_, p10) -- name: __index
		error(("%q is not a valid member of Images"):format((tostring(p10))), 2)
	end
})
return v4