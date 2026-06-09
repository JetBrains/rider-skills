# UE Python API — GameplayTags Module

**15 types** from the `GameplayTags` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `GameplayTag`, `GameplayTagContainer`, `GameplayTagQuery`, `GameplayTagTableRow`, `RestrictedGameplayTagTableRow`, `EditableGameplayTagQueryExpression`, `EditableGameplayTagQueryExpression_AllExprMatch`, `EditableGameplayTagQueryExpression_AllTagsMatch`, `EditableGameplayTagQueryExpression_AnyExprMatch`, `EditableGameplayTagQueryExpression_AnyTagsMatch`, `EditableGameplayTagQueryExpression_NoExprMatch`, `EditableGameplayTagQueryExpression_NoTagsMatch`, `GameplayTagAssetInterface`, `GameplayTagLibrary`, `GameplayContainerMatchType`

---

## Classes

### `unreal.GameplayTag`
Inherits: `StructBase` | Header: `GameplayTagContainer.h`

A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor using, meta = (Catego...

### `unreal.GameplayTagContainer`
Inherits: `StructBase` | Header: `GameplayTagContainer.h`

A Tag Container holds a collection of FGameplayTags, tags are included explicitly by adding them, and implicitly from adding child tags

**Properties** (1):
  - `gameplay_tags`: `None` [Read-Only] — [Read-Only] Array of gameplay tags (Array[GameplayTag])

### `unreal.GameplayTagQuery`
Inherits: `StructBase` | Header: `GameplayTagContainer.h`

An FGameplayTagQuery is a logical query that can be run against an FGameplayTagContainer. A query that succeeds is said to âmatchâ. Queries are logical expressions that can test the intersection p...

### `unreal.GameplayTagTableRow`
Inherits: `TableRowBase` | Header: `GameplayTagsManager.h`

Simple struct for a table row in the gameplay tag table and element in the ini list

**Properties** (2):
  - `dev_comment`: `str` [Read-Only] — [Read-Only] Developer comment clarifying the usage of a particular tag, not user facing (str)
  - `tag`: `Name` [Read-Only] — [Read-Only] Tag specified in the table (Name)

### `unreal.RestrictedGameplayTagTableRow`
Inherits: `GameplayTagTableRow` | Header: `GameplayTagsManager.h`

Simple struct for a table row in the restricted gameplay tag table and element in the ini list

**Properties** (1):
  - `allow_non_restricted_children`: `bool` [Read-Only] — [Read-Only] Tag specified in the table (bool)

### `unreal.EditableGameplayTagQueryExpression`
Inherits: `Object` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression

### `unreal.EditableGameplayTagQueryExpression_AllExprMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression All Expr Match

### `unreal.EditableGameplayTagQueryExpression_AllTagsMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression All Tags Match

### `unreal.EditableGameplayTagQueryExpression_AnyExprMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression Any Expr Match

### `unreal.EditableGameplayTagQueryExpression_AnyTagsMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression Any Tags Match

### `unreal.EditableGameplayTagQueryExpression_NoExprMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression No Expr Match

### `unreal.EditableGameplayTagQueryExpression_NoTagsMatch`
Inherits: `EditableGameplayTagQueryExpression` | Header: `GameplayTagContainer.h`

Editable Gameplay Tag Query Expression No Tags Match

### `unreal.GameplayTagAssetInterface`
Inherits: `Interface` | Header: `GameplayTagAssetInterface.h`

Gameplay Tag Asset Interface

**Methods** (3):
  - `has_all_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against all of the specified tags (expands to include parents of asset...
  - `has_any_matching_gameplay_tags(tag_container)` -> `bool` — Check if the asset has gameplay tags that matches against any of the specified tags (expands to include parents of asset...
  - `has_matching_gameplay_tag(tag_to_check)` -> `bool` — Check if the asset has a gameplay tag that matches against the specified tag (expands to include parents of asset tags)

### `unreal.GameplayTagLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `BlueprintGameplayTagLibrary.h`

Blueprint Gameplay Tag Library

**Methods** (37):
  - `add_gameplay_tag(tag_container, tag)` -> `GameplayTagContainer` [classmethod] — Adds a single tag to the passed in tag container
  - `add_gameplay_tag_to_container(tag_container: GameplayTagContainer, tag: GameplayTag)` -> `GameplayTagContainer` [classmethod] — deprecated: âadd_gameplay_tag_to_containerâ was renamed to âadd_gameplay_tagâ.
  - `append_gameplay_tag_containers(out_tag_container, tag_container)` -> `GameplayTagContainer` [classmethod] — Appends all tags in the InTagContainer to InOutTagContainer
  - `break_gameplay_tag_container(gameplay_tag_container)` -> `Array [ GameplayTag ]` [classmethod] — Breaks tag container into explicit array of tags
  - `conv_object_to_gameplay_tag_asset_interface(object)` -> `GameplayTagAssetInterface` [classmethod] — Converts a UObject to a GameplayTagAssetInterface. This specialty Autocast function exists so we can auto-convert the Ga...
  - `do_gameplay_tags_match(tag_one: GameplayTag, tag_two: GameplayTag, exact_match: bool)` -> `bool` [classmethod] — deprecated: âdo_gameplay_tags_matchâ was renamed to âmatches_tagâ.
  - `does_container_have_tag(tag_container: GameplayTagContainer, tag: GameplayTag, exact_match: bool)` -> `bool` [classmethod] — deprecated: âdoes_container_have_tagâ was renamed to âhas_tagâ.
  - `does_container_match_all_tags_in_container(tag_container: GameplayTagContainer, other_container: GameplayTagContainer, exact_match: bool)` -> `bool` [classmethod] — deprecated: âdoes_container_match_all_tags_in_containerâ was renamed to âhas_all_tagsâ.
  - `does_container_match_any_tags_in_container(tag_container: GameplayTagContainer, other_container: GameplayTagContainer, exact_match: bool)` -> `bool` [classmethod] — deprecated: âdoes_container_match_any_tags_in_containerâ was renamed to âhas_any_tagsâ.
  - `does_container_match_tag_query(tag_container, tag_query)` -> `bool` [classmethod] — Check if the specified tag container matches the given Tag Query
  - `equal_equal_gameplay_tag(a, b)` -> `bool` [classmethod] — Returns true if the values are equal (A == B)
  - `equal_equal_gameplay_tag_container(a, b)` -> `bool` [classmethod] — Returns true if the values are equal (A == B)
  - `filter(tag_container, other_container, exact_match)` -> `GameplayTagContainer` [classmethod] — Returns a filtered version of this container, returns all tags that match against any of the tags in OtherContainer
  - `get_all_actors_of_class_matching_tag_query(world_context_object, actor_class, gameplay_tag_query)` -> `Array [ Actor ]` [classmethod] — Get an array of all actors of a specific class (or subclass of that class) which match the specified gameplay tag query.
  - `get_debug_string_from_gameplay_tag(gameplay_tag)` -> `str` [classmethod] — Returns an FString representation of a gameplay tag for debugging purposes.
  - `get_debug_string_from_gameplay_tag_container(tag_container)` -> `str` [classmethod] — Returns an FString listing all of the gameplay tags in the tag container for debugging purposes.
  - `get_num_gameplay_tags_in_container(tag_container)` -> `int32` [classmethod] — Get the number of gameplay tags in the specified container
  - `get_owned_gameplay_tags(tag_container_interface)` -> `GameplayTagContainer` [classmethod]
  - `get_tag_name(gameplay_tag)` -> `Name` [classmethod] — Returns FName of this tag
  - `has_all_tags(tag_container, other_container, exact_match)` -> `bool` [classmethod] — Check if the specified tag container has ALL of the tags in the other container
  - `has_any_tags(tag_container, other_container, exact_match)` -> `bool` [classmethod] — Check if the specified tag container has ANY of the tags in the other container
  - `has_tag(tag_container, tag, exact_match)` -> `bool` [classmethod] — Check if the tag container has the specified tag
  - `is_gameplay_tag_valid(gameplay_tag)` -> `bool` [classmethod] — Returns true if the passed in gameplay tag is non-null
  - `is_tag_query_empty(tag_query)` -> `bool` [classmethod] — Check if the specified tag query is empty
  - `make_gameplay_tag_container_from_array(gameplay_tags)` -> `GameplayTagContainer` [classmethod] — Creates a FGameplayTagContainer from the array of passed in tags
  - `make_gameplay_tag_container_from_tag(single_tag)` -> `GameplayTagContainer` [classmethod] — Creates a FGameplayTagContainer containing a single tag
  - `make_gameplay_tag_query(tag_query)` -> `GameplayTagQuery` [classmethod] — Creates a literal FGameplayTagQuery
  - `make_gameplay_tag_query_match_all_tags(tags)` -> `GameplayTagQuery` [classmethod] — Creates a literal FGameplayTagQuery with a prepopulated AllTagsMatch expression
  - `make_gameplay_tag_query_match_any_tags(tags)` -> `GameplayTagQuery` [classmethod] — Creates a literal FGameplayTagQuery with a prepopulated AnyTagsMatch expression
  - `make_gameplay_tag_query_match_no_tags(tags)` -> `GameplayTagQuery` [classmethod] — Creates a literal FGameplayTagQuery with a prepopulated NoTagsMatch expression
  - `make_literal_gameplay_tag(value)` -> `GameplayTag` [classmethod] — Creates a literal FGameplayTag
  - `make_literal_gameplay_tag_container(value)` -> `GameplayTagContainer` [classmethod] — Creates a literal FGameplayTagContainer
  - `matches_any_tags(tag_one, other_container, exact_match)` -> `bool` [classmethod] — Determine if TagOne matches against any tag in OtherContainer
  - `matches_tag(tag_one, tag_two, exact_match)` -> `bool` [classmethod] — Determine if TagOne matches against TagTwo
  - `not_equal_gameplay_tag(a, b)` -> `bool` [classmethod] — Returns true if the values are not equal (A != B)
  - `not_equal_gameplay_tag_container(a, b)` -> `bool` [classmethod] — Returns true if the values are not equal (A != B)
  - `remove_gameplay_tag(tag_container, tag)` -> `GameplayTagContainer or None` [classmethod] — Remove a single tag from the passed in tag container, returns true if found

### `unreal.GameplayContainerMatchType`
Inherits: `EnumBase` | Header: `GameplayTagContainer.h`

EGameplay Container Match Type

**Properties** (2):
  - `ALL`: `GameplayContainerMatchType = Ellipsis` — Means the filter is only populated if all of the tags in this container match. 1
  - `ANY`: `GameplayContainerMatchType = Ellipsis` — Means the filter is populated by any tag matches in this container. 0
