-- Path: CoreGui.RobloxGui.Modules.Flags.GetFIntFacialAnimationStreamingHeartbeatStatsIntervalSec
game:DefineFastInt("FacialAnimationStreamingHeartbeatStatsIntervalSec", 0)
return function()
	return game:GetFastInt("FacialAnimationStreamingHeartbeatStatsIntervalSec")
end