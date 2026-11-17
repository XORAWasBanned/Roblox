local FFlags, Updated, Missing = {
    --// Rendering / Graphics
    RenderNoLowFrmBloom = "false",
    SSAOMipLevels = "0",
    DebugSSAOForce = "false",
    GraphicsOptimizationModeMVPExposureEnrollment4 = "false",
    BloomFrmCutoff = "0",
    UnifiedLightingBlendZone = "0",
    TextureQualityOverride = "0",
    DebugForceFSMCPULightCulling = "true",
    DebugCheckRenderThreading = "true",
    DebugPerfMode = "true",
    DebugFRMQualityLevelOverride = "1",
    TextureQualityOverrideEnabled = "true",
    FRMMaxGrassDistance = "0",
    GrassMovementReducedMotionFactor = "0",
    RenderLocalLightUpdatesMax = "1",
    RenderLocalLightUpdatesMin = "1",
    RenderLocalLightFadeInMs = "0",
    DebugGraphicsPreferD3D11 = "true",
    DisableDPIScale = "false",
    DebugTextureManagerSkipMips = "-1",
    TextureCompositorLowResFactor = "1",
    DebugForceMSAASamples = "0",
    DebugGraphicsPreferVulkan = "true",

    --// Assets / Preloading / Terrain
    ContentProviderPreloadHangTelemetryHundredthsPercentage = "0",
    ContentProviderPreloadHangTelemetry = "false",
    NumAssetsMaxToPreload = "2147483647",
    EnableTexturePreloading = "true",
    EnableSoundPreloading = "true",
    AssetPreloadingIXP = "true",
    AssetPreloadingUrlVersionEnabled2 = "true",
    PreloadTextureItemsOption4 = "true",
    LuaAppGamesPagePreloadingDisabled = "false",
    TerrainMaterialTable2022 = "",
    TerrainArraySliceSize = "0",
    CSGLevelOfDetailSwitchingDistanceL23 = "0",
    CSGLevelOfDetailSwitchingDistanceL34 = "0",
    VertexSmoothingGroupTolerance = "0",
    HACDPointSampleDistApartTenths = "2147483647",
    CSGLevelOfDetailSwitchingDistance = "0",
    CSGLevelOfDetailSwitchingDistanceL12 = "0",
    CSGv2LodsToGenerate = "0",
    DebugPauseVoxelizer = "true",
    DebugRestrictGCDistance = "1",

    --// Character / Animation / Physics
    SimAnimationConstraintResponsiveness = "2147483647",
    GroundControllerBalancingResponsiveness = "2147483647",
    AirControllerBalancingResponsiveness = "2147483647",
    UserHideCharacterParticlesInFirstPerson = "true",
    AnimationLodFacsDistanceMin = "0",
    AnimationLodFacsVisibilityDenominator = "0",

    --// FPS / Scheduler
    TaskSchedulerTargetFps = "2147483647",
    TaskSchedulerLimitTargetFpsTo2402 = "false",
    GameBasicSettingsFramerateCap5 = "false",

    --// Data Sending
    DataSenderRate = "16777216",
    DataSenderMaxBandwidthBps = "2147483647",
    DataSenderMaxJoinBandwidthBps = "2147483647",

    --// Replication / Physics Networking
    S2PhysicsSenderRate = "2147483647",
    PhysicsSenderMaxBandwidthBps = "2147483647",
    PhysicsSenderMaxBandwidthBpsScaling = "2147483647",
    SendGameServerDataMaxLen = "2147483647",
    ReplicationDataCacheNumParallelTasks = "2147483647",
    MegaReplicatorNumParallelTasks = "2147483647",
    MegaReplicatorNetworkQualityProcessorUnit = "2147483647",
    PhysicsReceiveNumParallelTasks = "2147483647",

    --// Packets / RakNet
    MaxDataPacketPerSend = "2147483647",
    ClientPacketMaxDelayMs = "1",
    ClientPacketMaxFrameMicroseconds = "2147483647",
    ClientPacketHealthyAllocationPercent = "20",
    ClientPacketExcessMicroseconds = "2147483647",
    CodecMaxIncomingPackets = "2147483647",
    CodecMaxOutgoingFrames = "2147483647",
    RakNetPingFrequencyMillisecond = "2147483647",
    RakNetResendBufferArrayLength = "64",
    RakNetResendRttMultiple = "1",
    RakNetUseSlidingWindow2_startUpdateMs = "1",
    RakNetUseSlidingWindow2_startInitSpeed = "2147483647",
    RakNetUseSlidingWindow2_startFactor = "2147483647",

    --// Input / Camera
    UserCameraInputRefactor3 = "true",
    UserCameraInputDt = "true",
    UserUpdateInputConnections = "true",

    --// UI / Audio / Services / Telemetry
    AdServiceEnabled = "false",
    V1MenuLanguageSelectionFeaturePerMillageRollout = "0",
    ControlBetaBadgeWithGuac = "false",
    VoiceBetaBadge = "false",
    AudioToggleVolumetricPanning = "true",
    GameGridFlexFeedItemTileNumPerFeed = "0",
    CanHideGuiGroupId = "32380007",
    WindowsWebViewTelemetryEnabled = "false",
    WindowsWebViewTelemetryThrottleHundredthsPercent = "0",
    DisableFeedbackSoothsayerCheck = "false",
}, {}, {}

task.spawn(function()
    while true do
        for Name, Value in FFlags do
            local CurrentValue, LastValue = getfflag(Name), Updated[Name]
            if LastValue and CurrentValue ~= LastValue then
                warn("Roblox Changed FFlag:",  Name, "| Expected:", LastValue, "| Current:", CurrentValue)
            end
            
            local Success, Result = pcall(setfflag, Name, Value)
            if not Success then
                Result = typeof(Result) == "string" and Result:lower() or Result
                if typeof(Result) ~= "string" or Result ~= "cannot set invalid fflag" then warn("Unknown Error ->", tostring(Result)) continue end
                if table.find(Missing, Name) then continue end
                table.insert(Missing, Name)
                warn("Missing FFlag:", Name)
                continue
            end
            
            Updated[Name] = Value
        end
        task.wait(1)
    end
end)
