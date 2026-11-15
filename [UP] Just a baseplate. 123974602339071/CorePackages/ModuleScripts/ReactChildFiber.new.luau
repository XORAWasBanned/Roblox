-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.ReactChildFiber.new
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ReactGlobals = require(ParentParent.ReactGlobals)
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Array, Error = LuauPolyfill.Array, LuauPolyfill.Error
local console, describeError = require(ParentParent.Shared).console, require(ParentParent.Shared).describeError
local __DEV__ = ReactGlobals.__DEV__
local v1 = require(ParentParent.SafeFlags).createGetFFlag("ReactPreventAssigningKeyToChildren")()

require(ParentParent.Shared)
require(ParentParent.React)
require(script.Parent.ReactInternalTypes)
require(script.Parent.ReactFiberLane)

local getComponentName = require(ParentParent.Shared).getComponentName
local ReactFiberFlags = require(script.Parent.ReactFiberFlags)
local Placement, Deletion = ReactFiberFlags.Placement, ReactFiberFlags.Deletion
local ReactSymbols = require(ParentParent.Shared).ReactSymbols
local getIteratorFn, REACT_ELEMENT_TYPE, REACT_FRAGMENT_TYPE, REACT_PORTAL_TYPE = ReactSymbols.getIteratorFn, ReactSymbols.REACT_ELEMENT_TYPE, ReactSymbols.REACT_FRAGMENT_TYPE, ReactSymbols.REACT_PORTAL_TYPE
local REACT_LAZY_TYPE, REACT_BLOCK_TYPE = ReactSymbols.REACT_LAZY_TYPE, ReactSymbols.REACT_BLOCK_TYPE
local ReactWorkTags = require(script.Parent.ReactWorkTags)
local _, _, HostText, HostPortal = ReactWorkTags.FunctionComponent, ReactWorkTags.ClassComponent, ReactWorkTags.HostText, ReactWorkTags.HostPortal
local _, Fragment, _, Block = ReactWorkTags.ForwardRef, ReactWorkTags.Fragment, ReactWorkTags.SimpleMemoComponent, ReactWorkTags.Block
local invariant, ReactFeatureFlags = require(ParentParent.Shared).invariant, require(ParentParent.Shared).ReactFeatureFlags
local enableLazyElements, enableBlocksAPI = ReactFeatureFlags.enableLazyElements, ReactFeatureFlags.enableBlocksAPI
local v2 = require(script.Parent["ReactFiber.new"])
local createWorkInProgress, resetWorkInProgress, createFiberFromElement, createFiberFromFragment = v2.createWorkInProgress, v2.resetWorkInProgress, v2.createFiberFromElement, v2.createFiberFromFragment
local createFiberFromText, createFiberFromPortal = v2.createFiberFromText, v2.createFiberFromPortal
local isCompatibleFamilyForHotReloading = require(script.Parent["ReactFiberHotReloading.new"]).isCompatibleFamilyForHotReloading
local t1 = {}
local v3, t2, t3

local function v4(_, _) -- line: 97
end

if __DEV__ then
    v3 = false
    t2 = {}
    t3 = {}

    v4 = function(p3, p4) -- line: 119
        -- upvalues: console (copy), getComponentName (copy), invariant (copy), t2 (ref)
        if p3 == nil or type(p3) ~= "table" then
            return
        end

        local invariant2, v5

        if p3._store and not p3._store.validated and p3.key == nil then
            invariant2 = invariant
            v5 = p3._store ~= nil and type(p3._store) == "table"
            invariant2(v5, "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.")
            p3._store.validated = true

            local v6 = getComponentName(p4.type) or "Component"

            if not t2[v6] then
                t2[v6] = true
                console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
            end
        end
    end
end

local isArray = Array.isArray

function coerceRef(p5, _, p7) -- line: 150
    -- upvalues: Error (copy), __DEV__ (copy), getComponentName (copy)
    local ref = p7.ref

    if ref ~= nil and type(ref) == "string" then
        if not p7._owner or not p7._self or p7._owner.stateNode == p7._self then
            local v8 = if __DEV__ then getComponentName(p5.type) or "Component" else "<enable __DEV__ mode for component names>"

            error(Error.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v8, (tostring(ref)))))
        end

        if not p7._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
        end
    end

    return ref
end

local function warnOnFunctionType(p8) -- line: 323
    -- upvalues: console (copy), __DEV__ (copy), getComponentName (copy), t3 (ref)
    if not __DEV__ then
        return
    end

    local v9 = getComponentName(p8.type) or "Component"

    if t3[v9] then
        return
    end

    local t5 = t3

    t5[v9] = true
    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
end

function resolveLazyType(p9) -- line: 342
    -- upvalues: describeError (copy)
    local _payload, _init = p9._payload, p9._init
    local v10, v11 = xpcall(_init, describeError, _payload)

    if v10 then
        return v11
    end

    return p9
end

local function ChildReconciler(p10) -- line: 360
    -- upvalues: console (copy), __DEV__ (copy), v1 (copy), getComponentName (copy), Placement (copy), Deletion (copy), getIteratorFn (copy), REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), REACT_BLOCK_TYPE (copy), HostText (copy), HostPortal (copy), Fragment (copy), Block (copy), ReactFeatureFlags (copy), enableLazyElements (copy), enableBlocksAPI (copy), createWorkInProgress (copy), createFiberFromElement (copy), createFiberFromFragment (copy), createFiberFromText (copy), createFiberFromPortal (copy), isCompatibleFamilyForHotReloading (copy), v3 (ref), t3 (ref), v4 (ref), isArray (copy)
    local function deleteChild(p11, p12) -- line: 361
        -- upvalues: p10 (copy), Deletion (copy)
        if not p10 then
            return
        end

        local deletions = p11.deletions

        if deletions ~= nil then
            table.insert(deletions, p12)

            return
        end

        p11.deletions = { p12 }
        p11.flags = bit32.bor(p11.flags, Deletion)
    end

    local function deleteRemainingChildren(p13, p14) -- line: 375
        -- upvalues: p10 (copy), Deletion (copy)
        if not p10 then
            return nil
        end

        local v12 = p14

        while v12 ~= nil do
            if p10 then
                local deletions = p13.deletions

                if deletions ~= nil then
                    table.insert(deletions, v12)
                else
                    p13.deletions = { v12 }
                    p13.flags = bit32.bor(p13.flags, Deletion)
                end
            end

            v12 = v12.sibling
        end

        return nil
    end

    local function mapRemainingChildren(_, p16) -- line: 394
        local t6 = {}
        local v13 = p16

        while v13 ~= nil do
            if v13.key ~= nil then
                t6[v13.key] = v13
            else
                t6[v13.index] = v13
            end

            v13 = v13.sibling
        end

        return t6
    end

    local function useFiber(p17, p18) -- line: 416
        -- upvalues: ReactFeatureFlags (copy), createWorkInProgress (copy)
        local v14 = createWorkInProgress(p17, p18)

        v14.index = 1

        local enableWorkLoopTrims = ReactFeatureFlags.enableWorkLoopTrims
        local v15

        if enableWorkLoopTrims then
            v15 = v14.sibling == nil
        else
            v14.sibling = nil
        end

        if not (enableWorkLoopTrims and v15 or not enableWorkLoopTrims) then
            v14.sibling = nil
        end

        return v14
    end

    local function placeChild(p19, p20, p21) -- line: 434
        -- upvalues: p10 (copy), Placement (copy)
        p19.index = p21

        if p10 then
            local alternate = p19.alternate

            if alternate ~= nil then
                local index = alternate.index

                if not (index < p20) then
                    return index
                end
            end

            p19.flags = bit32.bor(p19.flags, Placement)
        end

        return p20
    end

    local function placeSingleChild(p22) -- line: 462
        -- upvalues: p10 (copy), Placement (copy)
        if p10 and p22.alternate == nil then
            p22.flags = bit32.bor(p22.flags, Placement)
        end

        return p22
    end

    local function updateTextNode(p23, p24, p25, p26) -- line: 471
        -- upvalues: HostText (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromText (copy)
        if p24 ~= nil and p24.tag == HostText then
            local v16 = createWorkInProgress(p24, p25)

            v16.index = 1

            if not ReactFeatureFlags.enableWorkLoopTrims or v16.sibling ~= nil then
                v16.sibling = nil
            end

            v16.return_ = p23

            return v16
        end

        local v17 = createFiberFromText(p25, p23.mode, p26)

        v17.return_ = p23

        return v17
    end

    local function updateElement(p27, p28, p29, p30) -- line: 491
        -- upvalues: __DEV__ (copy), REACT_LAZY_TYPE (copy), REACT_BLOCK_TYPE (copy), Block (copy), ReactFeatureFlags (copy), enableBlocksAPI (copy), createWorkInProgress (copy), createFiberFromElement (copy), isCompatibleFamilyForHotReloading (copy)
        if p28 ~= nil then
            if p28.elementType == p29.type or __DEV__ and isCompatibleFamilyForHotReloading(p28, p29) then
                local v18 = createWorkInProgress(p28, p29.props)

                v18.index = 1

                if not ReactFeatureFlags.enableWorkLoopTrims or v18.sibling ~= nil then
                    v18.sibling = nil
                end

                if ReactFeatureFlags.enableWorkLoopTrims then
                    local v19 = coerceRef(p27, p28, p29)

                    if v19 ~= nil or v18.ref ~= nil then
                        v18.ref = v19
                    end
                else
                    v18.ref = coerceRef(p27, p28, p29)
                end

                v18.return_ = p27

                if __DEV__ then
                    v18._debugSource = p29._source
                    v18._debugOwner = p29._owner
                end

                return v18
            end

            if enableBlocksAPI and p28.tag == Block then
                local _type = p29.type

                if type(_type) == "table" and _type["$$typeof"] == REACT_LAZY_TYPE then
                    _type = resolveLazyType(_type)
                end

                if _type["$$typeof"] == REACT_BLOCK_TYPE and _type._render == p28.type._render then
                    local v20 = createWorkInProgress(p28, p29.props)

                    v20.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v20.sibling ~= nil then
                        v20.sibling = nil
                    end

                    v20.return_ = p27
                    v20.type = _type

                    if __DEV__ then
                        v20._debugSource = p29._source
                        v20._debugOwner = p29._owner
                    end

                    return v20
                end
            end
        end

        local v21 = createFiberFromElement(p29, p27.mode, p30)

        v21.ref = coerceRef(p27, p28, p29)
        v21.return_ = p27

        return v21
    end

    local function updatePortal(p31, p32, p33, p34) -- line: 550
        -- upvalues: HostPortal (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromPortal (copy)
        if p32 ~= nil and p32.tag == HostPortal and p32.stateNode.containerInfo == p33.containerInfo and p32.stateNode.implementation == p33.implementation then
            local v22 = p33.children or {}
            local v23 = createWorkInProgress(p32, v22)

            v23.index = 1

            if not ReactFeatureFlags.enableWorkLoopTrims or v23.sibling ~= nil then
                v23.sibling = nil
            end

            v23.return_ = p31

            return v23
        end

        local v24 = createFiberFromPortal(p33, p31.mode, p34)

        v24.return_ = p31

        return v24
    end

    local function updateFragment(p35, p36, p37, p38, p39) -- line: 575
        -- upvalues: Fragment (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromFragment (copy)
        if p36 ~= nil and p36.tag == Fragment then
            local v25 = createWorkInProgress(p36, p37)

            v25.index = 1

            if not ReactFeatureFlags.enableWorkLoopTrims or v25.sibling ~= nil then
                v25.sibling = nil
            end

            v25.return_ = p35

            return v25
        end

        local v26 = createFiberFromFragment(p37, p35.mode, p38, p39)

        v26.return_ = p35

        return v26
    end

    local function assignStableKey(p40, p41) -- line: 602
        if p41.key ~= nil then
            return
        end

        local v27 = type(p40)

        if v27 == "string" or v27 == "number" then
            p41.key = p40
        elseif v27 == "table" then
            p41.key = tostring(p40)
        end
    end

    local function createChild(p42, p43, p44, p45) -- line: 621
        -- upvalues: createChild (copy), console (copy), __DEV__ (copy), getComponentName (copy), REACT_ELEMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), createFiberFromElement (copy), createFiberFromFragment (copy), createFiberFromText (copy), createFiberFromPortal (copy), t3 (ref)
        if p43 == nil then
            return nil
        end

        local v28 = type(p43)

        if v28 == "table" then
            if p43.key == nil then
                local v29 = type(p45)

                if v29 == "string" or v29 == "number" then
                    p43.key = p45
                elseif v29 == "table" then
                    p43.key = tostring(p45)
                end
            end

            local v30 = p43["$$typeof"]

            if v30 == REACT_ELEMENT_TYPE then
                local v31 = createFiberFromElement(p43, p42.mode, p44)

                v31.ref = coerceRef(p42, nil, p43)
                v31.return_ = p42

                return v31
            end

            if v30 == REACT_PORTAL_TYPE then
                local v32 = createFiberFromPortal(p43, p42.mode, p44)

                v32.return_ = p42

                return v32
            end

            if v30 ~= REACT_LAZY_TYPE or not enableLazyElements then
                local v33 = createFiberFromFragment(p43, p42.mode, p44, nil)

                v33.return_ = p42

                return v33
            end

            local _payload = p43._payload

            return createChild(p42, p43._init(_payload), p44)
        end

        if v28 ~= "string" and v28 ~= "number" then
            if __DEV__ and v28 == "function" and __DEV__ then
                local v34 = getComponentName(p42.type) or "Component"

                if not t3[v34] then
                    local t7 = t3

                    t7[v34] = true
                    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                end
            end

            return nil
        end

        local v35 = createFiberFromText(tostring(p43), p42.mode, p44)

        v35.return_ = p42

        return v35
    end

    local function updateSlot(p46, p47, p48, p49, p50) -- line: 692
        -- upvalues: updateElement (copy), updatePortal (copy), updateSlot (copy), console (copy), __DEV__ (copy), getComponentName (copy), REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), HostText (copy), Fragment (copy), ReactFeatureFlags (copy), enableLazyElements (copy), createWorkInProgress (copy), createFiberFromFragment (copy), createFiberFromText (copy), t3 (ref)
        if p48 == nil then
            return nil
        end

        local key = if p47 == nil then nil else p47.key
        local v36 = type(p48)

        if v36 == "table" then
            if p48.key == nil then
                local v37 = type(p50)

                if v37 == "string" or v37 == "number" then
                    p48.key = p50
                elseif v37 == "table" then
                    p48.key = tostring(p50)
                end
            end

            local v38 = p48["$$typeof"]

            if v38 == REACT_ELEMENT_TYPE then
                if p48.key ~= key then
                    return nil
                end

                if p48.type ~= REACT_FRAGMENT_TYPE then
                    return (updateElement(p46, p47, p48, p49))
                end

                local children = p48.props.children

                if p47 ~= nil and p47.tag == Fragment then
                    local v39 = createWorkInProgress(p47, children)

                    v39.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v39.sibling ~= nil then
                        v39.sibling = nil
                    end

                    v39.return_ = p46

                    return v39
                end

                local v40 = createFiberFromFragment(children, p46.mode, p49, key)

                v40.return_ = p46

                return v40
            end

            if v38 == REACT_PORTAL_TYPE then
                return if p48.key == key then updatePortal(p46, p47, p48, p49) else nil
            end

            if v38 ~= REACT_LAZY_TYPE or not enableLazyElements then
                if key ~= nil then
                    return nil
                end

                if p47 ~= nil and p47.tag == Fragment then
                    local v41 = createWorkInProgress(p47, p48)

                    v41.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v41.sibling ~= nil then
                        v41.sibling = nil
                    end

                    v41.return_ = p46

                    return v41
                end

                local v42 = createFiberFromFragment(p48, p46.mode, p49, nil)

                v42.return_ = p46

                return v42
            end

            local _payload = p48._payload

            return updateSlot(p46, p47, p48._init(_payload), p49)
        end

        if v36 ~= "string" and v36 ~= "number" then
            if __DEV__ and v36 == "function" and __DEV__ then
                local v43 = getComponentName(p46.type) or "Component"

                if not t3[v43] then
                    local t8 = t3

                    t8[v43] = true
                    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                end
            end

            return nil
        end

        if key ~= nil then
            return nil
        end

        local v44 = tostring(p48)

        if p47 ~= nil and p47.tag == HostText then
            local v45 = createWorkInProgress(p47, v44)

            v45.index = 1

            if not ReactFeatureFlags.enableWorkLoopTrims or v45.sibling ~= nil then
                v45.sibling = nil
            end

            v45.return_ = p46

            return v45
        end

        local v46 = createFiberFromText(v44, p46.mode, p49)

        v46.return_ = p46

        return v46
    end

    local function updateFromMap(p51, p52, p53, p54, p55, p56) -- line: 780
        -- upvalues: updateElement (copy), updatePortal (copy), updateFromMap (copy), console (copy), __DEV__ (copy), getComponentName (copy), REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), HostText (copy), Fragment (copy), ReactFeatureFlags (copy), enableLazyElements (copy), createWorkInProgress (copy), createFiberFromFragment (copy), createFiberFromText (copy), t3 (ref)
        if p54 == nil then
            return nil
        end

        local v47 = type(p54)

        if v47 == "table" then
            if p54.key == nil then
                local v48 = type(p56)

                if v48 == "string" or v48 == "number" then
                    p54.key = p56
                elseif v48 == "table" then
                    p54.key = tostring(p56)
                end
            end

            local v49 = p54["$$typeof"]

            if v49 == REACT_ELEMENT_TYPE then
                local v50 = p51[if p54.key == nil then p53 else p54.key]

                if p54.type ~= REACT_FRAGMENT_TYPE then
                    return (updateElement(p52, v50, p54, p55))
                end

                local children = p54.props.children
                local key = p54.key

                if v50 ~= nil and v50.tag == Fragment then
                    local v51 = createWorkInProgress(v50, children)

                    v51.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v51.sibling ~= nil then
                        v51.sibling = nil
                    end

                    v51.return_ = p52

                    return v51
                end

                local v52 = createFiberFromFragment(children, p52.mode, p55, key)

                v52.return_ = p52

                return v52
            end

            if v49 == REACT_PORTAL_TYPE then
                return (updatePortal(p52, p51[if p54.key == nil then p53 else p54.key], p54, p55))
            end

            if v49 ~= REACT_LAZY_TYPE or not enableLazyElements then
                local v54 = p51[p53]

                if v54 ~= nil and v54.tag == Fragment then
                    local v55 = createWorkInProgress(v54, p54)

                    v55.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v55.sibling ~= nil then
                        v55.sibling = nil
                    end

                    v55.return_ = p52

                    return v55
                end

                local v56 = createFiberFromFragment(p54, p52.mode, p55, nil)

                v56.return_ = p52

                return v56
            end

            local _payload = p54._payload

            return updateFromMap(p51, p52, p53, p54._init(_payload), p55)
        end

        if v47 ~= "string" and v47 ~= "number" then
            if __DEV__ and v47 == "function" and __DEV__ then
                local v57 = getComponentName(p52.type) or "Component"

                if not t3[v57] then
                    local t9 = t3

                    t9[v57] = true
                    console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                end
            end

            return nil
        end

        local v58 = p51[p53] or nil
        local v59 = tostring(p54)

        if v58 ~= nil and v58.tag == HostText then
            local v60 = createWorkInProgress(v58, v59)

            v60.index = 1

            if not ReactFeatureFlags.enableWorkLoopTrims or v60.sibling ~= nil then
                v60.sibling = nil
            end

            v60.return_ = p52

            return v60
        end

        local v61 = createFiberFromText(v59, p52.mode, p55)

        v61.return_ = p52

        return v61
    end

    local function warnOnInvalidKey(p57, p58, p59) -- line: 874
        -- upvalues: warnOnInvalidKey (copy), console (copy), __DEV__ (copy), REACT_ELEMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), v4 (ref)
        if not __DEV__ or p57 == nil or type(p57) ~= "table" then
            return p58
        end

        local v62 = p57["$$typeof"]

        if v62 == REACT_ELEMENT_TYPE or v62 == REACT_PORTAL_TYPE then
            v4(p57, p59)

            local key = p57.key

            if type(key) == "string" then
                if p58 == nil then
                    local t10 = {}

                    t10[key] = true

                    return t10
                end

                if p58[key] then
                    console.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.", key)
                else
                    p58[key] = true
                end
            end

            return p58
        end

        if v62 == REACT_LAZY_TYPE and enableLazyElements then
            local _payload = p57._payload

            warnOnInvalidKey(p57._init(_payload), p58, p59)
        end

        return p58
    end

    local function reconcileChildrenArray(p60, p61, p62, p63) -- line: 916
        -- upvalues: p10 (copy), mapRemainingChildren (copy), createChild (copy), updateSlot (copy), updateFromMap (copy), warnOnInvalidKey (copy), __DEV__ (copy), v1 (copy), Placement (copy), Deletion (copy)
        if __DEV__ then
            local v63

            for _, v64 in p62 do
                v63 = warnOnInvalidKey(v64, v63, p60)
            end
        end

        local v65 = #p62
        local v66, v67
        local v68 = p61
        local n1 = 1
        local n2 = 1
        local v69

        while true do
            if v68 == nil then
                v69 = v68
                break
            end

            if not (n2 <= v65) then
                v69 = v68
                break
            end

            local v70, v71

            if n2 < v68.index then
                v71 = v68
            else
                v70 = v68
                v71 = v68.sibling
            end

            local v72 = p62[n2]
            local v73 = if v72 ~= nil and type(v72) == "table" and v72["$$typeof"] ~= nil then updateSlot(p60, v70, v72, p63, n2) else updateSlot(p60, v70, v72, p63)

            if v73 == nil then
                v69 = if v70 ~= nil then v70 else v71
                break
            end

            if p10 and v70 and v73.alternate == nil and p10 then
                local deletions = p60.deletions

                if deletions ~= nil then
                    table.insert(deletions, v70)
                else
                    p60.deletions = { v70 }
                    p60.flags = bit32.bor(p60.flags, Deletion)
                end
            end

            v73.index = n2

            if p10 then
                local alternate = v73.alternate

                if alternate ~= nil then
                    local index = alternate.index

                    if index < n1 then
                        v73.flags = bit32.bor(v73.flags, Placement)
                    else
                        n1 = index
                    end
                else
                    v73.flags = bit32.bor(v73.flags, Placement)
                end
            end

            if v67 ~= nil then
                v67.sibling = v73
            else
                v66 = v73
            end

            v67 = v73
            v68 = v71
            n2 += 1
        end

        if v65 < n2 then
            if p10 then
                while v69 ~= nil do
                    if p10 then
                        local deletions = p60.deletions

                        if deletions ~= nil then
                            table.insert(deletions, v69)
                        else
                            p60.deletions = { v69 }
                            p60.flags = bit32.bor(p60.flags, Deletion)
                        end
                    end

                    v69 = v69.sibling
                end
            end

            return v66
        end

        if v69 == nil then
            while n2 <= v65 do
                local v74 = p62[n2]
                local v75 = if v74 ~= nil and type(v74) == "table" and v74["$$typeof"] ~= nil then createChild(p60, v74, p63, n2) else createChild(p60, v74, p63)

                if v75 ~= nil then
                    v75.index = n2

                    local index = n1

                    if p10 then
                        local alternate = v75.alternate

                        if alternate ~= nil then
                            index = alternate.index

                            if index < n1 then
                                index = n1
                                v75.flags = bit32.bor(v75.flags, Placement)
                            end
                        else
                            v75.flags = bit32.bor(v75.flags, Placement)
                        end
                    end

                    if v67 ~= nil then
                        v67.sibling = v75
                    else
                        v66 = v75
                    end

                    v67 = v75
                    n1 = index
                end

                n2 += 1
            end

            return v66
        end

        local v76 = mapRemainingChildren(p60, v69)

        while n2 <= v65 do
            local v77 = p62[n2]
            local v78 = if v1 and (v77 == nil or type(v77) ~= "table" or v77["$$typeof"] == nil) then updateFromMap(v76, p60, n2, v77, p63) else updateFromMap(v76, p60, n2, v77, p63, n2)
            local v79
            local index = n1
            local v80 = v66

            if v78 ~= nil then
                v79 = v78

                if p10 and v78.alternate ~= nil then
                    v76[if v78.key == nil then n2 else v78.key] = nil
                end

                v78.index = n2

                if p10 then
                    local alternate = v78.alternate

                    if alternate ~= nil then
                        index = alternate.index

                        if index < n1 then
                            index = n1
                            v78.flags = bit32.bor(v78.flags, Placement)
                        end
                    else
                        v78.flags = bit32.bor(v78.flags, Placement)
                    end
                end

                if v67 ~= nil then
                    v67.sibling = v78
                else
                    v80 = v78
                end
            else
                v79 = v67
            end

            v66 = v80
            v67 = v79
            n1 = index
            n2 += 1
        end

        if p10 then
            for _, v81 in v76 do
                if p10 then
                    local deletions = p60.deletions

                    if deletions ~= nil then
                        table.insert(deletions, v81)
                    else
                        p60.deletions = { v81 }
                        p60.flags = bit32.bor(p60.flags, Deletion)
                    end
                end
            end
        end

        return v66
    end

    local function reconcileChildrenIterator(p64, p65, p66, p67, p68) -- line: 1143
        -- upvalues: p10 (copy), mapRemainingChildren (copy), createChild (copy), updateSlot (copy), updateFromMap (copy), warnOnInvalidKey (copy), console (copy), __DEV__ (copy), Placement (copy), Deletion (copy), v3 (ref)
        if __DEV__ then
            if p66.entries == p68 then
                if not v3 then
                    console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
                end

                v3 = true
            end

            local v82 = p68(p66)

            if v82 then
                local v83 = nil
                local v84 = v82.next()

                while not v84.done do
                    v84 = v82.next()
                    v83 = warnOnInvalidKey(v84.value, v83, p64)
                end
            end
        end

        local v85 = p68(p66)
        local v86 = nil
        local v87 = nil
        local v88 = p65
        local v89 = 1
        local v90 = 1
        local v91 = v85.next()
        local v92

        while true do
            if v88 == nil then
                v92 = v88
                break
            end

            if v91.done then
                v92 = v88
                break
            end

            local v93, v94

            if v90 < v88.index then
                v94 = v88
            else
                v93 = v88
                v94 = v88.sibling
            end

            local v95 = updateSlot(p64, v93, v91.value, p67, v91.key)

            if v95 == nil then
                v92 = if v93 ~= nil then v93 else v94
                break
            end

            if p10 and v93 and v95.alternate == nil and p10 then
                local deletions = p64.deletions

                if deletions ~= nil then
                    table.insert(deletions, v93)
                else
                    p64.deletions = { v93 }
                    p64.flags = bit32.bor(p64.flags, Deletion)
                end
            end

            v95.index = v90

            if p10 then
                local alternate = v95.alternate

                if alternate ~= nil then
                    local index = alternate.index

                    if index < v89 then
                        v95.flags = bit32.bor(v95.flags, Placement)
                    else
                        v89 = index
                    end
                else
                    v95.flags = bit32.bor(v95.flags, Placement)
                end
            end

            if v87 ~= nil then
                v87.sibling = v95
            else
                v86 = v95
            end

            v87 = v95
            v88 = v94
            v90 += 1
            v91 = v85.next()
        end

        if v91.done then
            if p10 then
                while v92 ~= nil do
                    if p10 then
                        local deletions = p64.deletions

                        if deletions ~= nil then
                            table.insert(deletions, v92)
                        else
                            p64.deletions = { v92 }
                            p64.flags = bit32.bor(p64.flags, Deletion)
                        end
                    end

                    v92 = v92.sibling
                end
            end

            return v86
        end

        if v92 == nil then
            while not v91.done do
                local v96 = createChild(p64, v91.value, p67, v91.key)

                if v96 ~= nil then
                    v96.index = v90

                    local index = v89

                    if p10 then
                        local alternate = v96.alternate

                        if alternate ~= nil then
                            index = alternate.index

                            if index < v89 then
                                index = v89
                                v96.flags = bit32.bor(v96.flags, Placement)
                            end
                        else
                            v96.flags = bit32.bor(v96.flags, Placement)
                        end
                    end

                    if v87 ~= nil then
                        v87.sibling = v96
                    else
                        v86 = v96
                    end

                    v87 = v96
                    v89 = index
                end

                v90 += 1
                v91 = v85.next()
            end

            return v86
        end

        local v97

        while not v91.done do
            v97 = v97 or mapRemainingChildren(p64, v92)

            local v98 = updateFromMap(v97, p64, v90, v91.value, p67, v91.key)
            local v99
            local index = v89
            local v100 = v86

            if v98 ~= nil then
                v99 = v98

                if p10 and v98.alternate ~= nil then
                    if v98.key ~= nil then
                        v97[v98.key] = nil
                    else
                        v97[v90] = nil
                    end
                end

                v98.index = v90

                if p10 then
                    local alternate = v98.alternate

                    if alternate ~= nil then
                        index = alternate.index

                        if index < v89 then
                            index = v89
                            v98.flags = bit32.bor(v98.flags, Placement)
                        end
                    else
                        v98.flags = bit32.bor(v98.flags, Placement)
                    end
                end

                if v87 ~= nil then
                    v87.sibling = v98
                else
                    v100 = v98
                end
            else
                v99 = v87
            end

            v86 = v100
            v87 = v99
            v89 = index
            v90 += 1
            v91 = v85.next()
        end

        if p10 then
            for _, v101 in v97 do
                if p10 then
                    local deletions = p64.deletions

                    if deletions ~= nil then
                        table.insert(deletions, v101)
                    else
                        p64.deletions = { v101 }
                        p64.flags = bit32.bor(p64.flags, Deletion)
                    end
                end
            end
        end

        return v86
    end

    local function reconcileSingleTextNode(p69, p70, p71, p72) -- line: 1356
        -- upvalues: p10 (copy), Deletion (copy), HostText (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromText (copy)
        if p70 == nil or p70.tag ~= HostText then
            if p10 then
                local v102 = p70

                while v102 ~= nil do
                    if p10 then
                        local deletions = p69.deletions

                        if deletions ~= nil then
                            table.insert(deletions, v102)
                        else
                            p69.deletions = { v102 }
                            p69.flags = bit32.bor(p69.flags, Deletion)
                        end
                    end

                    v102 = v102.sibling
                end
            end

            local v103 = createFiberFromText(p71, p69.mode, p72)

            v103.return_ = p69

            return v103
        end

        local sibling = p70.sibling

        if p10 then
            while sibling ~= nil do
                if p10 then
                    local deletions = p69.deletions

                    if deletions ~= nil then
                        table.insert(deletions, sibling)
                    else
                        p69.deletions = { sibling }
                        p69.flags = bit32.bor(p69.flags, Deletion)
                    end
                end

                sibling = sibling.sibling
            end
        end

        local v104 = createWorkInProgress(p70, p71)

        v104.index = 1

        if not ReactFeatureFlags.enableWorkLoopTrims or v104.sibling ~= nil then
            v104.sibling = nil
        end

        v104.return_ = p69

        return v104
    end

    local function reconcileSingleElement(p73, p74, p75, p76) -- line: 1381
        -- upvalues: p10 (copy), __DEV__ (copy), Deletion (copy), REACT_FRAGMENT_TYPE (copy), Fragment (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromElement (copy), createFiberFromFragment (copy), isCompatibleFamilyForHotReloading (copy)
        local key = p75.key
        local v105 = p74

        while true do
            if v105 ~= nil then
                if v105.key ~= key then
                    if p10 then
                        local deletions = p73.deletions

                        if deletions ~= nil then
                            table.insert(deletions, v105)
                        else
                            p73.deletions = { v105 }
                            p73.flags = bit32.bor(p73.flags, Deletion)
                        end
                    end

                    v105 = v105.sibling
                    continue
                end

                if v105.tag == Fragment then
                    if p75.type == REACT_FRAGMENT_TYPE then
                        local sibling = v105.sibling

                        if p10 then
                            while sibling ~= nil do
                                if p10 then
                                    local deletions = p73.deletions

                                    if deletions ~= nil then
                                        table.insert(deletions, sibling)
                                    else
                                        p73.deletions = { sibling }
                                        p73.flags = bit32.bor(p73.flags, Deletion)
                                    end
                                end

                                sibling = sibling.sibling
                            end
                        end

                        local v106 = createWorkInProgress(v105, p75.props.children)

                        v106.index = 1

                        if not ReactFeatureFlags.enableWorkLoopTrims or v106.sibling ~= nil then
                            v106.sibling = nil
                        end

                        v106.return_ = p73

                        if __DEV__ then
                            v106._debugSource = p75._source
                            v106._debugOwner = p75._owner
                        end

                        return v106
                    end
                elseif v105.elementType == p75.type or __DEV__ and isCompatibleFamilyForHotReloading(v105, p75) then
                    break
                end

                if p10 then
                    while v105 ~= nil do
                        if p10 then
                            local deletions = p73.deletions

                            if deletions ~= nil then
                                table.insert(deletions, v105)
                            else
                                p73.deletions = {
                                    v105
                                }
                                p73.flags = bit32.bor(p73.flags, Deletion)
                            end
                        end

                        v105 = v105.sibling
                    end
                end
            end

            if p75.type == REACT_FRAGMENT_TYPE then
                local v107 = createFiberFromFragment(p75.props.children, p73.mode, p76, p75.key)

                v107.return_ = p73

                return v107
            end

            local v108 = createFiberFromElement(p75, p73.mode, p76)

            v108.ref = coerceRef(p73, p74, p75)
            v108.return_ = p73

            return v108
        end

        local sibling = v105.sibling

        if p10 then
            while sibling ~= nil do
                if p10 then
                    local deletions = p73.deletions

                    if deletions ~= nil then
                        table.insert(deletions, sibling)
                    else
                        p73.deletions = { sibling }
                        p73.flags = bit32.bor(p73.flags, Deletion)
                    end
                end

                sibling = sibling.sibling
            end
        end

        local v109 = createWorkInProgress(v105, p75.props)

        v109.index = 1

        if not ReactFeatureFlags.enableWorkLoopTrims or v109.sibling ~= nil then
            v109.sibling = nil
        end

        if ReactFeatureFlags.enableWorkLoopTrims then
            local v110 = coerceRef(p73, v105, p75)

            if v110 ~= nil or v109.ref ~= nil then
                v109.ref = v110
            end
        else
            v109.ref = coerceRef(p73, v105, p75)
        end

        v109.return_ = p73

        if __DEV__ then
            v109._debugSource = p75._source
            v109._debugOwner = p75._owner
        end

        return v109
    end

    local function reconcileSinglePortal(p77, p78, p79, p80) -- line: 1484
        -- upvalues: p10 (copy), Deletion (copy), HostPortal (copy), ReactFeatureFlags (copy), createWorkInProgress (copy), createFiberFromPortal (copy)
        local key = p79.key
        local v111 = p78

        while v111 ~= nil do
            if v111.key == key then
                if v111.tag == HostPortal and v111.stateNode.containerInfo == p79.containerInfo and v111.stateNode.implementation == p79.implementation then
                    local sibling = v111.sibling

                    if p10 then
                        while sibling ~= nil do
                            if p10 then
                                local deletions = p77.deletions

                                if deletions ~= nil then
                                    table.insert(deletions, sibling)
                                else
                                    p77.deletions = { sibling }
                                    p77.flags = bit32.bor(p77.flags, Deletion)
                                end
                            end

                            sibling = sibling.sibling
                        end
                    end

                    local v113 = createWorkInProgress(v111, p79.children or {})

                    v113.index = 1

                    if not ReactFeatureFlags.enableWorkLoopTrims or v113.sibling ~= nil then
                        v113.sibling = nil
                    end

                    v113.return_ = p77

                    return v113
                end

                if p10 then
                    while v111 ~= nil do
                        if p10 then
                            local deletions = p77.deletions

                            if deletions ~= nil then
                                table.insert(deletions, v111)
                            else
                                p77.deletions = { v111 }
                                p77.flags = bit32.bor(p77.flags, Deletion)
                            end
                        end

                        v111 = v111.sibling
                    end
                end

                break
            end

            if p10 then
                local deletions = p77.deletions

                if deletions ~= nil then
                    table.insert(deletions, v111)
                else
                    p77.deletions = { v111 }
                    p77.flags = bit32.bor(p77.flags, Deletion)
                end
            end

            v111 = v111.sibling
        end

        local v114 = createFiberFromPortal(p79, p77.mode, p80)

        v114.return_ = p77

        return v114
    end

    local function reconcileChildFibers(p81, p82, p83, p84) -- line: 1523
        -- upvalues: p10 (copy), reconcileChildrenArray (copy), reconcileChildrenIterator (copy), reconcileSingleTextNode (copy), reconcileSingleElement (copy), reconcileSinglePortal (copy), reconcileChildFibers (copy), console (copy), __DEV__ (copy), getComponentName (copy), Placement (copy), Deletion (copy), getIteratorFn (copy), REACT_ELEMENT_TYPE (copy), REACT_FRAGMENT_TYPE (copy), REACT_PORTAL_TYPE (copy), REACT_LAZY_TYPE (copy), enableLazyElements (copy), t3 (ref), isArray (copy)
        local v115 = type(p83)
        local v116 = p83

        if p83 ~= nil and v115 == "table" and p83.type == REACT_FRAGMENT_TYPE and p83.key == nil then
            v116 = p83.props.children
            v115 = type(v116)
        end

        local v117 = isArray(v116)

        if v116 ~= nil and v115 == "table" and not v117 then
            local v118 = v116["$$typeof"]

            if v118 == REACT_ELEMENT_TYPE then
                local v119 = reconcileSingleElement(p81, p82, v116, p84)

                if p10 and v119.alternate == nil then
                    v119.flags = bit32.bor(v119.flags, Placement)
                end

                return v119
            end

            if v118 == REACT_PORTAL_TYPE then
                local v120 = reconcileSinglePortal(p81, p82, v116, p84)

                if p10 and v120.alternate == nil then
                    v120.flags = bit32.bor(v120.flags, Placement)
                end

                return v120
            end

            if v118 == REACT_LAZY_TYPE and enableLazyElements then
                local _payload = v116._payload

                return reconcileChildFibers(p81, p82, v116._init(_payload), p84)
            end
        else
            if v117 then
                return (reconcileChildrenArray(p81, p82, v116, p84))
            end

            if v115 == "string" or v115 == "number" then
                local v121 = reconcileSingleTextNode(p81, p82, tostring(v116), p84)

                if p10 and v121.alternate == nil then
                    v121.flags = bit32.bor(v121.flags, Placement)
                end

                return v121
            end
        end

        local v122 = getIteratorFn(v116)

        if v122 then
            return (reconcileChildrenIterator(p81, p82, v116, p84, v122))
        end

        if __DEV__ and v115 == "function" and __DEV__ then
            local v123 = getComponentName(p81.type) or "Component"

            if not t3[v123] then
                local t11 = t3

                t11[v123] = true
                console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
            end
        end

        if p10 then
            local v124 = p82

            while v124 ~= nil do
                if p10 then
                    local deletions = p81.deletions

                    if deletions ~= nil then
                        table.insert(deletions, v124)
                    else
                        p81.deletions = { v124 }
                        p81.flags = bit32.bor(p81.flags, Deletion)
                    end
                end

                v124 = v124.sibling
            end
        end

        return nil
    end

    return reconcileChildFibers
end

t1.reconcileChildFibers = ChildReconciler(true)
t1.mountChildFibers = ChildReconciler(false)

t1.cloneChildFibers = function(_, p86) -- line: 1671
    -- upvalues: createWorkInProgress (copy)
    if p86.child == nil then
        return
    end

    local child = p86.child
    local v125 = createWorkInProgress(child, child.pendingProps)

    p86.child = v125
    v125.return_ = p86

    while child.sibling ~= nil do
        child = child.sibling
        v125.sibling = createWorkInProgress(child, child.pendingProps)
        v125 = v125.sibling
        v125.return_ = p86
    end

    v125.sibling = nil
end

t1.resetChildFibers = function(p87, p88) -- line: 1698
    -- upvalues: resetWorkInProgress (copy)
    local v126 = p87.child

    while v126 ~= nil do
        resetWorkInProgress(v126, p88)
        v126 = v126.sibling
    end
end

return t1
