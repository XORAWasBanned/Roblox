-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.specifiedRules
local v1 = script.Parent.rules
local v2 = require(v1.ExecutableDefinitionsRule).ExecutableDefinitionsRule
local v3 = require(v1.UniqueOperationNamesRule).UniqueOperationNamesRule
local v4 = require(v1.LoneAnonymousOperationRule).LoneAnonymousOperationRule
local v5 = require(v1.SingleFieldSubscriptionsRule).SingleFieldSubscriptionsRule
local v6 = require(v1.KnownTypeNamesRule).KnownTypeNamesRule
local v7 = require(v1.FragmentsOnCompositeTypesRule).FragmentsOnCompositeTypesRule
local v8 = require(v1.VariablesAreInputTypesRule).VariablesAreInputTypesRule
local v9 = require(v1.ScalarLeafsRule).ScalarLeafsRule
local v10 = require(v1.FieldsOnCorrectTypeRule).FieldsOnCorrectTypeRule
local v11 = require(v1.UniqueFragmentNamesRule).UniqueFragmentNamesRule
local v12 = require(v1.KnownFragmentNamesRule).KnownFragmentNamesRule
local v13 = require(v1.NoUnusedFragmentsRule).NoUnusedFragmentsRule
local v14 = require(v1.PossibleFragmentSpreadsRule).PossibleFragmentSpreadsRule
local v15 = require(v1.NoFragmentCyclesRule).NoFragmentCyclesRule
local v16 = require(v1.UniqueVariableNamesRule).UniqueVariableNamesRule
local v17 = require(v1.NoUndefinedVariablesRule).NoUndefinedVariablesRule
local v18 = require(v1.NoUnusedVariablesRule).NoUnusedVariablesRule
local v19 = require(v1.KnownDirectivesRule).KnownDirectivesRule
local v20 = require(v1.UniqueDirectivesPerLocationRule).UniqueDirectivesPerLocationRule
local v21 = require(v1.KnownArgumentNamesRule)
local v22 = v21.KnownArgumentNamesRule
local v23 = v21.KnownArgumentNamesOnDirectivesRule
local v24 = require(v1.UniqueArgumentNamesRule).UniqueArgumentNamesRule
local v25 = require(v1.ValuesOfCorrectTypeRule).ValuesOfCorrectTypeRule
local v26 = require(v1.ProvidedRequiredArgumentsRule)
local v27 = v26.ProvidedRequiredArgumentsRule
local v28 = v26.ProvidedRequiredArgumentsOnDirectivesRule
local v29 = require(v1.VariablesInAllowedPositionRule).VariablesInAllowedPositionRule
local v30 = require(v1.OverlappingFieldsCanBeMergedRule).OverlappingFieldsCanBeMergedRule
local v31 = require(v1.UniqueInputFieldNamesRule).UniqueInputFieldNamesRule
return {
	["specifiedRules"] = {
		v2,
		v3,
		v4,
		v5,
		v6,
		v7,
		v8,
		v9,
		v10,
		v11,
		v12,
		v13,
		v14,
		v15,
		v16,
		v17,
		v18,
		v19,
		v20,
		v22,
		v24,
		v25,
		v27,
		v29,
		v30,
		v31
	},
	["specifiedSDLRules"] = {
		require(v1.LoneSchemaDefinitionRule).LoneSchemaDefinitionRule,
		require(v1.UniqueOperationTypesRule).UniqueOperationTypesRule,
		require(v1.UniqueTypeNamesRule).UniqueTypeNamesRule,
		require(v1.UniqueEnumValueNamesRule).UniqueEnumValueNamesRule,
		require(v1.UniqueFieldDefinitionNamesRule).UniqueFieldDefinitionNamesRule,
		require(v1.UniqueDirectiveNamesRule).UniqueDirectiveNamesRule,
		v6,
		v19,
		v20,
		require(v1.PossibleTypeExtensionsRule).PossibleTypeExtensionsRule,
		v23,
		v24,
		v31,
		v28
	}
}