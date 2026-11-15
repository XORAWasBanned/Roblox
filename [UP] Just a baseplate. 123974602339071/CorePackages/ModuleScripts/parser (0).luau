-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.parser
-- https://lua.expert

local Parent = script.Parent
local ParentParent = Parent.Parent
local ParentParent2 = ParentParent.Parent

require(ParentParent2.LuauPolyfill)
require(ParentParent.error)

local tokenKind = require(Parent.tokenKind)
local Location = require(Parent.ast).Location
local Source = require(Parent.source).Source
local lexer = require(Parent.lexer)
local Lexer, isPunctuatorTokenKind = lexer.Lexer, lexer.isPunctuatorTokenKind
local TokenKind = tokenKind.TokenKind
local DirectiveLocation = require(Parent.directiveLocation).DirectiveLocation
local Kind = require(Parent.kinds).Kind
local syntaxError = require(script.Parent.Parent.error.syntaxError).syntaxError
local getTokenDesc, getTokenKindDesc
local t1 = {}

t1.__index = t1

local function parse(p1, p2) -- line: 221
    -- upvalues: t1 (copy)
    return t1.new(p1, p2):parseDocument()
end

local function parseValue(p3, p4) -- line: 236
    -- upvalues: TokenKind (copy), t1 (copy)
    local v1 = t1.new(p3, p4)

    v1:expectToken(TokenKind.SOF)

    local v2 = v1:parseValueLiteral(false)

    v1:expectToken(TokenKind.EOF)

    return v2
end

local function parseType(p5, p6) -- line: 254
    -- upvalues: TokenKind (copy), t1 (copy)
    local v3 = t1.new(p5, p6)

    v3:expectToken(TokenKind.SOF)

    local v4 = v3:parseTypeReference()

    v3:expectToken(TokenKind.EOF)

    return v4
end

function t1.new(p7, p8) -- line: 262
    -- upvalues: Source (copy), Lexer (copy), t1 (copy)
    local v5 = if typeof(p7) == "string" then Source.new(p7) else p7

    return (setmetatable({
        _lexer = Lexer.new(v5),
        _options = p8
    }, t1))
end

function t1.parseName(p9) -- line: 280
    -- upvalues: TokenKind (copy), Kind (copy)
    local v6 = p9:expectToken(TokenKind.NAME)

    return {
        kind = Kind.NAME,
        value = v6.value,
        loc = p9:loc(v6)
    }
end

function t1.parseDocument(p10) -- line: 294
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p10._lexer.token

    return {
        kind = Kind.DOCUMENT,
        definitions = p10:many(TokenKind.SOF, p10.parseDefinition, TokenKind.EOF),
        loc = p10:loc(token)
    }
end

function t1.parseDefinition(p11) -- line: 314
    -- upvalues: TokenKind (copy)
    local v7 = p11:peek(TokenKind.NAME)
    local v8, v9

    if v7 then
        local value = p11._lexer.token.value

        if value == "query" or value == "mutation" or value == "subscription" then
            return p11:parseOperationDefinition()
        end

        if value == "fragment" then
            return p11:parseFragmentDefinition()
        end

        if value == "schema"
            or value == "scalar"
            or value == "type"
            or value == "interface"
            or value == "union"
            or value == "enum"
            or value == "input"
            or value == "directive" then
            return p11:parseTypeSystemDefinition()
        end

        v8 = value == "extend"
    else
        if p11:peek(TokenKind.BRACE_L) then
            return p11:parseOperationDefinition()
        end

        v9 = p11:peekDescription()
    end

    if (not v7 or v8) and (v7 or v9) then
        if v7 then
            return p11:parseTypeSystemExtension()
        end

        return p11:parseTypeSystemDefinition()
    end

    error(p11:unexpected())
end

function t1.parseOperationDefinition(p12) -- line: 351
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p12._lexer.token

    if p12:peek(TokenKind.BRACE_L) then
        return {
            operation = "query",
            name = nil,
            kind = Kind.OPERATION_DEFINITION,
            variableDefinitions = {},
            directives = {},
            selectionSet = p12:parseSelectionSet(),
            loc = p12:loc(token)
        }
    end

    local v10 = p12:parseOperationType()
    local v11 = if p12:peek(TokenKind.NAME) then p12:parseName() else nil

    return {
        kind = Kind.OPERATION_DEFINITION,
        operation = v10,
        name = v11,
        variableDefinitions = p12:parseVariableDefinitions(),
        directives = p12:parseDirectives(false),
        selectionSet = p12:parseSelectionSet(),
        loc = p12:loc(token)
    }
end

function t1.parseOperationType(p13) -- line: 384
    -- upvalues: TokenKind (copy)
    local v12 = p13:expectToken(TokenKind.NAME)

    if v12.value == "query" then
        return "query"
    end

    if v12.value == "mutation" then
        return "mutation"
    end

    if v12.value == "subscription" then
        return "subscription"
    end

    error(p13:unexpected(v12))
end

function t1.parseVariableDefinitions(p14) -- line: 401
    -- upvalues: TokenKind (copy)
    return p14:optionalMany(TokenKind.PAREN_L, p14.parseVariableDefinition, TokenKind.PAREN_R)
end

function t1.parseVariableDefinition(p15) -- line: 408
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p15._lexer.token
    local v13 = p15:parseVariable()

    p15:expectToken(TokenKind.COLON)

    local v14 = p15:parseTypeReference()

    return {
        kind = Kind.VARIABLE_DEFINITION,
        variable = v13,
        type = v14,
        defaultValue = if p15:expectOptionalToken(TokenKind.EQUALS) then p15:parseValueLiteral(true) else nil,
        directives = p15:parseDirectives(true),
        loc = p15:loc(token)
    }
end

function t1.parseVariable(p16) -- line: 428
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p16._lexer.token

    p16:expectToken(TokenKind.DOLLAR)

    return {
        kind = Kind.VARIABLE,
        name = p16:parseName(),
        loc = p16:loc(token)
    }
end

function t1.parseSelectionSet(p17) -- line: 441
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p17._lexer.token

    return {
        kind = Kind.SELECTION_SET,
        selections = p17:many(TokenKind.BRACE_L, p17.parseSelection, TokenKind.BRACE_R),
        loc = p17:loc(token)
    }
end

function t1.parseSelection(p18) -- line: 456
    -- upvalues: TokenKind (copy)
    if p18:peek(TokenKind.SPREAD) then
        return p18:parseFragment()
    end

    return p18:parseField()
end

function t1.parseField(p19) -- line: 469
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p19._lexer.token
    local v15 = p19:parseName()
    local v16

    if p19:expectOptionalToken(TokenKind.COLON) then
        v16 = p19:parseName()
    else
        v15, v16 = nil, v15
    end

    return {
        kind = Kind.FIELD,
        alias = v15,
        name = v16,
        arguments = p19:parseArguments(false),
        directives = p19:parseDirectives(false),
        selectionSet = p19:peek(TokenKind.BRACE_L) and p19:parseSelectionSet() or nil,
        loc = p19:loc(token)
    }
end

function t1.parseArguments(p20, p21) -- line: 497
    -- upvalues: TokenKind (copy)
    local v17 = if p21 then p20.parseConstArgument else p20.parseArgument

    return p20:optionalMany(TokenKind.PAREN_L, v17, TokenKind.PAREN_R)
end

function t1.parseArgument(p22) -- line: 510
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p22._lexer.token
    local v18 = p22:parseName()

    p22:expectToken(TokenKind.COLON)

    return {
        kind = Kind.ARGUMENT,
        name = v18,
        value = p22:parseValueLiteral(false),
        loc = p22:loc(token)
    }
end

function t1.parseConstArgument(p23) -- line: 523
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p23._lexer.token
    local v19 = p23:parseName()

    p23:expectToken(TokenKind.COLON)

    local v20 = p23:parseValueLiteral(true)

    return {
        kind = Kind.ARGUMENT,
        name = v19,
        value = v20,
        loc = p23:loc(token)
    }
end

function t1.parseFragment(p24) -- line: 545
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p24._lexer.token

    p24:expectToken(TokenKind.SPREAD)

    local on = p24:expectOptionalKeyword("on")

    if not on and p24:peek(TokenKind.NAME) then
        return {
            kind = Kind.FRAGMENT_SPREAD,
            name = p24:parseFragmentName(),
            directives = p24:parseDirectives(false),
            loc = p24:loc(token)
        }
    end

    return {
        kind = Kind.INLINE_FRAGMENT,
        typeCondition = if on then p24:parseNamedType() else nil,
        directives = p24:parseDirectives(false),
        selectionSet = p24:parseSelectionSet(),
        loc = p24:loc(token)
    }
end

function t1.parseFragmentDefinition(p25) -- line: 573
    -- upvalues: Kind (copy)
    local token = p25._lexer.token

    p25:expectKeyword("fragment")

    if (p25._options and p25._options.experimentalFragmentVariables) == true then
        local v21 = p25:parseFragmentName()
        local v22 = p25:parseVariableDefinitions()

        p25:expectKeyword("on")

        local v23 = p25:parseNamedType()
        local v24 = p25:parseDirectives(false)
        local v25 = p25:parseSelectionSet()
        local v26 = p25:loc(token)

        return {
            kind = Kind.FRAGMENT_DEFINITION,
            name = v21,
            variableDefinitions = v22,
            typeCondition = v23,
            directives = v24,
            selectionSet = v25,
            loc = v26
        }
    end

    local v27 = p25:parseFragmentName()

    p25:expectKeyword("on")

    local v28 = p25:parseNamedType()
    local v29 = p25:parseDirectives(false)
    local v30 = p25:parseSelectionSet()
    local v31 = p25:loc(token)

    return {
        kind = Kind.FRAGMENT_DEFINITION,
        name = v27,
        typeCondition = v28,
        directives = v29,
        selectionSet = v30,
        loc = v31
    }
end

function t1.parseFragmentName(p26) -- line: 616
    if p26._lexer.token.value == "on" then
        error(p26:unexpected())
    end

    return p26:parseName()
end

function t1.parseValueLiteral(p27, p28) -- line: 643
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p27._lexer.token
    local kind = token.kind

    if kind == TokenKind.BRACKET_L then
        return p27:parseList(p28)
    end

    if kind == TokenKind.BRACE_L then
        return p27:parseObject(p28)
    end

    if kind == TokenKind.INT then
        p27._lexer:advance()

        return {
            kind = Kind.INT,
            value = token.value,
            loc = p27:loc(token)
        }
    end

    if kind == TokenKind.FLOAT then
        p27._lexer:advance()

        return {
            kind = Kind.FLOAT,
            value = token.value,
            loc = p27:loc(token)
        }
    end

    if kind == TokenKind.STRING or kind == TokenKind.BLOCK_STRING then
        return p27:parseStringLiteral()
    end

    if kind == TokenKind.NAME then
        p27._lexer:advance()

        local value = token.value

        if value == "true" then
            return {
                value = true,
                kind = Kind.BOOLEAN,
                loc = p27:loc(token)
            }
        end

        if value == "false" then
            return {
                value = false,
                kind = Kind.BOOLEAN,
                loc = p27:loc(token)
            }
        end

        if value == "null" then
            return {
                kind = Kind.NULL,
                loc = p27:loc(token)
            }
        end

        return {
            kind = Kind.ENUM,
            value = value,
            loc = p27:loc(token)
        }
    end

    if kind == TokenKind.DOLLAR and not p28 then
        return p27:parseVariable()
    end

    error(p27:unexpected())
end

function t1.parseStringLiteral(p29) -- line: 692
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p29._lexer.token

    p29._lexer:advance()

    return {
        kind = Kind.STRING,
        value = token.value,
        block = token.kind == TokenKind.BLOCK_STRING,
        loc = p29:loc(token)
    }
end

function t1.parseList(p30, p31) -- line: 708
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p30._lexer.token

    local function v32() -- line: 710
        -- upvalues: p30 (copy), p31 (copy)
        return p30:parseValueLiteral(p31)
    end

    return {
        kind = Kind.LIST,
        values = p30:any(TokenKind.BRACKET_L, v32, TokenKind.BRACKET_R),
        loc = p30:loc(token)
    }
end

function t1.parseObject(p32, p33) -- line: 725
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p32._lexer.token

    local function v33() -- line: 727
        -- upvalues: p32 (copy), p33 (copy)
        return p32:parseObjectField(p33)
    end

    return {
        kind = Kind.OBJECT,
        fields = p32:any(TokenKind.BRACE_L, v33, TokenKind.BRACE_R),
        loc = p32:loc(token)
    }
end

function t1.parseObjectField(p34, p35) -- line: 740
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p34._lexer.token
    local v34 = p34:parseName()

    p34:expectToken(TokenKind.COLON)

    return {
        kind = Kind.OBJECT_FIELD,
        name = v34,
        value = p34:parseValueLiteral(p35),
        loc = p34:loc(token)
    }
end

function t1.parseDirectives(p36, p37) -- line: 753
    -- upvalues: TokenKind (copy)
    local t6 = {}

    while p36:peek(TokenKind.AT) do
        table.insert(t6, p36:parseDirective(p37))
    end

    return t6
end

function t1.parseDirective(p38, p39) -- line: 764
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p38._lexer.token

    p38:expectToken(TokenKind.AT)

    return {
        kind = Kind.DIRECTIVE,
        name = p38:parseName(),
        arguments = p38:parseArguments(p39),
        loc = p38:loc(token)
    }
end

function t1.parseTypeReference(p40) -- line: 783
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p40._lexer.token
    local v35

    if p40:expectOptionalToken(TokenKind.BRACKET_L) then
        local v36 = p40:parseTypeReference()

        p40:expectToken(TokenKind.BRACKET_R)
        v35 = {
            kind = Kind.LIST_TYPE,
            type = v36,
            loc = p40:loc(token)
        }
    else
        v35 = p40:parseNamedType()
    end

    if p40:expectOptionalToken(TokenKind.BANG) then
        return {
            kind = Kind.NON_NULL_TYPE,
            type = v35,
            loc = p40:loc(token)
        }
    end

    return v35
end

function t1.parseNamedType(p41) -- line: 816
    -- upvalues: Kind (copy)
    local token = p41._lexer.token

    return {
        kind = Kind.NAMED_TYPE,
        name = p41:parseName(),
        loc = p41:loc(token)
    }
end

function t1.parseTypeSystemDefinition(p42) -- line: 839
    -- upvalues: TokenKind (copy)
    local v37 = if p42:peekDescription() then p42._lexer:lookahead() else p42._lexer.token

    if v37.kind == TokenKind.NAME then
        local value = v37.value

        if value == "schema" then
            return p42:parseSchemaDefinition()
        end

        if value == "scalar" then
            return p42:parseScalarTypeDefinition()
        end

        if value == "type" then
            return p42:parseObjectTypeDefinition()
        end

        if value == "interface" then
            return p42:parseInterfaceTypeDefinition()
        end

        if value == "union" then
            return p42:parseUnionTypeDefinition()
        end

        if value == "enum" then
            return p42:parseEnumTypeDefinition()
        end

        if value == "input" then
            return p42:parseInputObjectTypeDefinition()
        end

        if value == "directive" then
            return p42:parseDirectiveDefinition()
        end
    end

    error(p42:unexpected(v37))
end

function t1.peekDescription(p43) -- line: 869
    -- upvalues: TokenKind (copy)
    return p43:peek(TokenKind.STRING) or p43:peek(TokenKind.BLOCK_STRING)
end

function t1.parseDescription(p44) -- line: 876
    if p44:peekDescription() then
        return p44:parseStringLiteral()
    end
end

function t1.parseSchemaDefinition(p45) -- line: 886
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p45._lexer.token
    local v38 = p45:parseDescription()

    p45:expectKeyword("schema")

    local v39 = p45:parseDirectives(true)
    local v40 = p45:many(TokenKind.BRACE_L, p45.parseOperationTypeDefinition, TokenKind.BRACE_R)

    return {
        kind = Kind.SCHEMA_DEFINITION,
        description = v38,
        directives = v39,
        operationTypes = v40,
        loc = p45:loc(token)
    }
end

function t1.parseOperationTypeDefinition(p46) -- line: 908
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p46._lexer.token
    local v41 = p46:parseOperationType()

    p46:expectToken(TokenKind.COLON)

    local v42 = p46:parseNamedType()

    return {
        kind = Kind.OPERATION_TYPE_DEFINITION,
        operation = v41,
        type = v42,
        loc = p46:loc(token)
    }
end

function t1.parseScalarTypeDefinition(p47) -- line: 925
    -- upvalues: Kind (copy)
    local token = p47._lexer.token
    local v43 = p47:parseDescription()

    p47:expectKeyword("scalar")

    local v44 = p47:parseName()
    local v45 = p47:parseDirectives(true)

    return {
        kind = Kind.SCALAR_TYPE_DEFINITION,
        description = v43,
        name = v44,
        directives = v45,
        loc = p47:loc(token)
    }
end

function t1.parseObjectTypeDefinition(p48) -- line: 945
    -- upvalues: Kind (copy)
    local token = p48._lexer.token
    local v46 = p48:parseDescription()

    p48:expectKeyword("type")

    local v47 = p48:parseName()
    local v48 = p48:parseImplementsInterfaces()
    local v49 = p48:parseDirectives(true)
    local v50 = p48:parseFieldsDefinition()

    return {
        kind = Kind.OBJECT_TYPE_DEFINITION,
        description = v46,
        name = v47,
        interfaces = v48,
        directives = v49,
        fields = v50,
        loc = p48:loc(token)
    }
end

function t1.parseImplementsInterfaces(p49) -- line: 969
    -- upvalues: TokenKind (copy)
    if p49:expectOptionalKeyword("implements") then
        return p49:delimitedMany(TokenKind.AMP, p49.parseNamedType)
    end

    return {}
end

function t1.parseFieldsDefinition(p50) -- line: 980
    -- upvalues: TokenKind (copy)
    return p50:optionalMany(TokenKind.BRACE_L, p50.parseFieldDefinition, TokenKind.BRACE_R)
end

function t1.parseFieldDefinition(p51) -- line: 988
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p51._lexer.token
    local v51 = p51:parseDescription()
    local v52 = p51:parseName()
    local v53 = p51:parseArgumentDefs()

    p51:expectToken(TokenKind.COLON)

    local v54 = p51:parseTypeReference()
    local v55 = p51:parseDirectives(true)

    return {
        kind = Kind.FIELD_DEFINITION,
        description = v51,
        name = v52,
        arguments = v53,
        type = v54,
        directives = v55,
        loc = p51:loc(token)
    }
end

function t1.parseArgumentDefs(p52) -- line: 1010
    -- upvalues: TokenKind (copy)
    return p52:optionalMany(TokenKind.PAREN_L, p52.parseInputValueDef, TokenKind.PAREN_R)
end

function t1.parseInputValueDef(p53) -- line: 1018
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p53._lexer.token
    local v56 = p53:parseDescription()
    local v57 = p53:parseName()

    p53:expectToken(TokenKind.COLON)

    local v58 = p53:parseTypeReference()
    local v59 = if p53:expectOptionalToken(TokenKind.EQUALS) then p53:parseValueLiteral(true) else nil
    local v60 = p53:parseDirectives(true)

    return {
        kind = Kind.INPUT_VALUE_DEFINITION,
        description = v56,
        name = v57,
        type = v58,
        defaultValue = v59,
        directives = v60,
        loc = p53:loc(token)
    }
end

function t1.parseInterfaceTypeDefinition(p54) -- line: 1044
    -- upvalues: Kind (copy)
    local token = p54._lexer.token
    local v61 = p54:parseDescription()

    p54:expectKeyword("interface")

    local v62 = p54:parseName()
    local v63 = p54:parseImplementsInterfaces()
    local v64 = p54:parseDirectives(true)
    local v65 = p54:parseFieldsDefinition()

    return {
        kind = Kind.INTERFACE_TYPE_DEFINITION,
        description = v61,
        name = v62,
        interfaces = v63,
        directives = v64,
        fields = v65,
        loc = p54:loc(token)
    }
end

function t1.parseUnionTypeDefinition(p55) -- line: 1067
    -- upvalues: Kind (copy)
    local token = p55._lexer.token
    local v66 = p55:parseDescription()

    p55:expectKeyword("union")

    local v67 = p55:parseName()
    local v68 = p55:parseDirectives(true)
    local v69 = p55:parseUnionMemberTypes()

    return {
        kind = Kind.UNION_TYPE_DEFINITION,
        description = v66,
        name = v67,
        directives = v68,
        types = v69,
        loc = p55:loc(token)
    }
end

function t1.parseUnionMemberTypes(p56) -- line: 1089
    -- upvalues: TokenKind (copy)
    local t7 = {}

    if p56:expectOptionalToken(TokenKind.EQUALS) then
        p56:expectOptionalToken(TokenKind.PIPE)

        repeat
            table.insert(t7, p56:parseNamedType())
        until not p56:expectOptionalToken(TokenKind.PIPE)
    end

    return t7
end

function t1.parseEnumTypeDefinition(p57) -- line: 1105
    -- upvalues: Kind (copy)
    local token = p57._lexer.token
    local v70 = p57:parseDescription()

    p57:expectKeyword("enum")

    local v71 = p57:parseName()
    local v72 = p57:parseDirectives(true)
    local v73 = p57:parseEnumValuesDefinition()

    return {
        kind = Kind.ENUM_TYPE_DEFINITION,
        description = v70,
        name = v71,
        directives = v72,
        values = v73,
        loc = p57:loc(token)
    }
end

function t1.parseEnumValuesDefinition(p58) -- line: 1125
    -- upvalues: TokenKind (copy)
    return p58:optionalMany(TokenKind.BRACE_L, p58.parseEnumValueDefinition, TokenKind.BRACE_R)
end

function t1.parseEnumValueDefinition(p59) -- line: 1134
    -- upvalues: Kind (copy)
    local token = p59._lexer.token
    local v74 = p59:parseDescription()
    local v75 = p59:parseName()
    local v76 = p59:parseDirectives(true)

    return {
        kind = Kind.ENUM_VALUE_DEFINITION,
        description = v74,
        name = v75,
        directives = v76,
        loc = p59:loc(token)
    }
end

function t1.parseInputObjectTypeDefinition(p60) -- line: 1152
    -- upvalues: Kind (copy)
    local token = p60._lexer.token
    local v77 = p60:parseDescription()

    p60:expectKeyword("input")

    local v78 = p60:parseName()
    local v79 = p60:parseDirectives(true)
    local v80 = p60:parseInputFieldsDefinition()

    return {
        kind = Kind.INPUT_OBJECT_TYPE_DEFINITION,
        description = v77,
        name = v78,
        directives = v79,
        fields = v80,
        loc = p60:loc(token)
    }
end

function t1.parseInputFieldsDefinition(p61) -- line: 1172
    -- upvalues: TokenKind (copy)
    return p61:optionalMany(TokenKind.BRACE_L, p61.parseInputValueDef, TokenKind.BRACE_R)
end

function t1.parseTypeSystemExtension(p62) -- line: 1189
    -- upvalues: TokenKind (copy)
    local v81 = p62._lexer:lookahead()

    if v81.kind == TokenKind.NAME then
        local value = v81.value

        if value == "schema" then
            return p62:parseSchemaExtension()
        end

        if value == "scalar" then
            return p62:parseScalarTypeExtension()
        end

        if value == "type" then
            return p62:parseObjectTypeExtension()
        end

        if value == "interface" then
            return p62:parseInterfaceTypeExtension()
        end

        if value == "union" then
            return p62:parseUnionTypeExtension()
        end

        if value == "enum" then
            return p62:parseEnumTypeExtension()
        end

        if value == "input" then
            return p62:parseInputObjectTypeExtension()
        end
    end

    error(p62:unexpected(v81))
end

function t1.parseSchemaExtension(p63) -- line: 1219
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p63._lexer.token

    p63:expectKeyword("extend")
    p63:expectKeyword("schema")

    local v82 = p63:parseDirectives(true)
    local v83 = p63:optionalMany(TokenKind.BRACE_L, p63.parseOperationTypeDefinition, TokenKind.BRACE_R)

    if #v82 == 0 and #v83 == 0 then
        error(p63:unexpected())
    end

    return {
        kind = Kind.SCHEMA_EXTENSION,
        directives = v82,
        operationTypes = v83,
        loc = p63:loc(token)
    }
end

function t1.parseScalarTypeExtension(p64) -- line: 1244
    -- upvalues: Kind (copy)
    local token = p64._lexer.token

    p64:expectKeyword("extend")
    p64:expectKeyword("scalar")

    local v84 = p64:parseName()
    local v85 = p64:parseDirectives(true)

    if #v85 == 0 then
        error(p64:unexpected())
    end

    return {
        kind = Kind.SCALAR_TYPE_EXTENSION,
        name = v84,
        directives = v85,
        loc = p64:loc(token)
    }
end

function t1.parseObjectTypeExtension(p65) -- line: 1267
    -- upvalues: Kind (copy)
    local token = p65._lexer.token

    p65:expectKeyword("extend")
    p65:expectKeyword("type")

    local v86 = p65:parseName()
    local v87 = p65:parseImplementsInterfaces()
    local v88 = p65:parseDirectives(true)
    local v89 = p65:parseFieldsDefinition()

    if #v87 == 0 and #v88 == 0 and #v89 == 0 then
        error(p65:unexpected())
    end

    return {
        kind = Kind.OBJECT_TYPE_EXTENSION,
        name = v86,
        interfaces = v87,
        directives = v88,
        fields = v89,
        loc = p65:loc(token)
    }
end

function t1.parseInterfaceTypeExtension(p66) -- line: 1294
    -- upvalues: Kind (copy)
    local token = p66._lexer.token

    p66:expectKeyword("extend")
    p66:expectKeyword("interface")

    local v90 = p66:parseName()
    local v91 = p66:parseImplementsInterfaces()
    local v92 = p66:parseDirectives(true)
    local v93 = p66:parseFieldsDefinition()

    if #v91 == 0 and #v92 == 0 and #v93 == 0 then
        error(p66:unexpected())
    end

    return {
        kind = Kind.INTERFACE_TYPE_EXTENSION,
        name = v90,
        interfaces = v91,
        directives = v92,
        fields = v93,
        loc = p66:loc(token)
    }
end

function t1.parseUnionTypeExtension(p67) -- line: 1320
    -- upvalues: Kind (copy)
    local token = p67._lexer.token

    p67:expectKeyword("extend")
    p67:expectKeyword("union")

    local v94 = p67:parseName()
    local v95 = p67:parseDirectives(true)
    local v96 = p67:parseUnionMemberTypes()

    if #v95 == 0 and #v96 == 0 then
        error(p67:unexpected())
    end

    return {
        kind = Kind.UNION_TYPE_EXTENSION,
        name = v94,
        directives = v95,
        types = v96,
        loc = p67:loc(token)
    }
end

function t1.parseEnumTypeExtension(p68) -- line: 1344
    -- upvalues: Kind (copy)
    local token = p68._lexer.token

    p68:expectKeyword("extend")
    p68:expectKeyword("enum")

    local v97 = p68:parseName()
    local v98 = p68:parseDirectives(true)
    local v99 = p68:parseEnumValuesDefinition()

    if #v98 == 0 and #v99 == 0 then
        error(p68:unexpected())
    end

    return {
        kind = Kind.ENUM_TYPE_EXTENSION,
        name = v97,
        directives = v98,
        values = v99,
        loc = p68:loc(token)
    }
end

function t1.parseInputObjectTypeExtension(p69) -- line: 1368
    -- upvalues: Kind (copy)
    local token = p69._lexer.token

    p69:expectKeyword("extend")
    p69:expectKeyword("input")

    local v100 = p69:parseName()
    local v101 = p69:parseDirectives(true)
    local v102 = p69:parseInputFieldsDefinition()

    if #v101 == 0 and #v102 == 0 then
        error(p69:unexpected())
    end

    return {
        kind = Kind.INPUT_OBJECT_TYPE_EXTENSION,
        name = v100,
        directives = v101,
        fields = v102,
        loc = p69:loc(token)
    }
end

function t1.parseDirectiveDefinition(p70) -- line: 1391
    -- upvalues: TokenKind (copy), Kind (copy)
    local token = p70._lexer.token
    local v103 = p70:parseDescription()

    p70:expectKeyword("directive")
    p70:expectToken(TokenKind.AT)

    local v104 = p70:parseName()
    local v105 = p70:parseArgumentDefs()
    local repeatable = p70:expectOptionalKeyword("repeatable")

    p70:expectKeyword("on")

    local v106 = p70:parseDirectiveLocations()

    return {
        kind = Kind.DIRECTIVE_DEFINITION,
        description = v103,
        name = v104,
        arguments = v105,
        repeatable = repeatable,
        locations = v106,
        loc = p70:loc(token)
    }
end

function t1.parseDirectiveLocations(p71) -- line: 1417
    -- upvalues: TokenKind (copy)
    p71:expectOptionalToken(TokenKind.PIPE)

    local t8 = {}

    repeat
        table.insert(t8, p71:parseDirectiveLocation())
    until not p71:expectOptionalToken(TokenKind.PIPE)

    return t8
end

function t1.parseDirectiveLocation(p72) -- line: 1454
    -- upvalues: DirectiveLocation (copy)
    local token = p72._lexer.token
    local v107 = p72:parseName()

    if DirectiveLocation[v107.value] ~= nil then
        return v107
    end

    error(p72:unexpected(token))
end

function t1.loc(p73, p74) -- line: 1467
    -- upvalues: Location (copy)
    if (p73._options and p73._options.noLocation) == true then
        return nil
    end

    return Location.new(p74, p73._lexer.lastToken, p73._lexer.source)
end

function t1.peek(p75, p76) -- line: 1477
    return p75._lexer.token.kind == p76
end

function t1.expectToken(p77, p78) -- line: 1485
    -- upvalues: syntaxError (copy), getTokenDesc (ref), getTokenKindDesc (ref)
    local token = p77._lexer.token

    if token.kind == p78 then
        p77._lexer:advance()

        return token
    end

    error(syntaxError(p77._lexer.source, token.start, "Expected " .. getTokenKindDesc(p78) .. ", found " .. getTokenDesc(token) .. "."))
end

function t1.expectOptionalToken(p79, p80) -- line: 1505
    local token = p79._lexer.token

    if token.kind ~= p80 then
        return nil
    end

    p79._lexer:advance()

    return token
end

function t1.expectKeyword(p81, p82) -- line: 1518
    -- upvalues: TokenKind (copy), syntaxError (copy), getTokenDesc (ref)
    local token = p81._lexer.token

    if token.kind ~= TokenKind.NAME or token.value ~= p82 then
        error(syntaxError(p81._lexer.source, token.start, "Expected \"" .. p82 .. "\", found " .. getTokenDesc(token) .. "."))
    else
        p81._lexer:advance()
    end
end

function t1.expectOptionalKeyword(p83, p84) -- line: 1537
    -- upvalues: TokenKind (copy)
    local token = p83._lexer.token

    if token.kind ~= TokenKind.NAME or token.value ~= p84 then
        return false
    end

    p83._lexer:advance()

    return true
end

function t1.unexpected(p85, p86) -- line: 1550
    -- upvalues: syntaxError (copy), getTokenDesc (ref)
    local v108 = if p86 == nil or not p86 then p85._lexer.token else p86

    return syntaxError(p85._lexer.source, v108.start, "Unexpected " .. getTokenDesc(v108) .. ".")
end

function t1.any(p87, p88, p89, p90) -- line: 1561
    p87:expectToken(p88)

    local t9 = {}

    while not p87:expectOptionalToken(p90) do
        table.insert(t9, p89(p87))
    end

    return t9
end

function t1.optionalMany(p91, p92, p93, p94) -- line: 1582
    if not p91:expectOptionalToken(p92) then
        return {}
    end

    local t10 = {}

    repeat
        table.insert(t10, p93(p91))
    until p91:expectOptionalToken(p94)

    return t10
end

function t1.many(p95, p96, p97, p98) -- line: 1604
    p95:expectToken(p96)

    local t11 = {}

    repeat
        table.insert(t11, p97(p95))
    until p95:expectOptionalToken(p98)

    return t11
end

function t1.delimitedMany(p99, p100, p101) -- line: 1623
    p99:expectOptionalToken(p100)

    local t12 = {}

    repeat
        table.insert(t12, p101(p99))
    until not p99:expectOptionalToken(p100)

    return t12
end

function getTokenDesc(p102) -- line: 1640
    -- upvalues: getTokenKindDesc (ref)
    local value = p102.value

    return getTokenKindDesc(p102.kind) .. (value ~= nil and " \"" .. value .. "\"" or "")
end

function getTokenKindDesc(p103) -- line: 1648
    -- upvalues: isPunctuatorTokenKind (copy)
    return isPunctuatorTokenKind(p103) and "\"" .. p103 .. "\"" or p103
end

return {
    Parser = t1,
    parse = parse,
    parseValue = parseValue,
    parseType = parseType
}
