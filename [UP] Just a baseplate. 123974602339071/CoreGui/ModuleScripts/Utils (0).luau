-- Path: CoreGui.RobloxGui.Modules.UIManager.Utils
return {
	["rescaleCFramePosition"] = function(p1, p2) -- name: rescaleCFramePosition
		return p1.Rotation + p1.Position * p2
	end
}