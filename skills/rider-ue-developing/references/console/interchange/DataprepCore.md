# UE Python API — DataprepCore Module

**39 types** from the `DataprepCore` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `DataprepAssetProducer`, `DataprepContext`, `DataprepActionAsset`, `DataprepAsset`, `DataprepAssetFactory`, `DataprepAssetInstance`, `DataprepAssetInstanceFactory`, `DataprepAssetInterface`, `DataprepBoolFetcher`, `DataprepBoolFilter`, `DataprepConsumerUserData`, `DataprepContentConsumer`, `DataprepContentProducer`, `DataprepEditingOperation`, `DataprepFetcher`, `DataprepFilter`, `DataprepFilterNoFetcher`, `DataprepFloatFetcher`, `DataprepFloatFilter`, `DataprepIntegerFetcher`, ... (39 total)

---

## Classes

### `unreal.DataprepAssetProducer`
Inherits: `StructBase` | Header: `DataprepAssetProducers.h`

Structure to hold on a producer and its configuration

### `unreal.DataprepContext`
Inherits: `StructBase` | Header: `DataprepOperation.h`

Experimental struct. Todo add struct wide comment

**Properties** (1):
  - `objects`: `None` [Read-Only] — [Read-Only] This is the objects on which an operation can operate (Array[Object])

### `unreal.DataprepActionAsset`
Inherits: `Object` | Header: `DataprepActionAsset.h`

Dataprep Action Asset

**Methods** (1):
  - `execute(objects)` -> `None` — Execute the action on a specific set of objects

### `unreal.DataprepAsset`
Inherits: `DataprepAssetInterface` | Header: `DataprepAsset.h`

A DataprepAsset is an implementation of the DataprepAssetInterface using a Blueprint as the recipe pipeline. The Blueprint is composed of DataprepAction nodes linearly connected.

**Properties** (4):
  - `consumer`: `DataprepContentConsumer` — COnsumer referenced by the asset
deprecated: Property moved to UDataprepAssetInterface as Output. (D...
  - `dataprep_recipe_bp`: `Blueprint` — Pointer to data preparation pipeline blueprint previously used to process input data
deprecated: Usi...
  - `producers`: `None` — List of producers referenced by the asset
deprecated: Property moved to UDataprepAssetInterface as I...
  - `start_node`: `EdGraphNode` — Pointer to the entry node of the pipeline blueprint previously used to process input data
deprecated...

### `unreal.DataprepAssetFactory`
Inherits: `Factory` | Header: `DataprepFactories.h`

Dataprep Asset Factory

### `unreal.DataprepAssetInstance`
Inherits: `DataprepAssetInterface` | Header: `DataprepAssetInstance.h`

A DataprepAssetInstance is an implementation of the DataprepAssetInterface sharing its recipe pipeline with an existing Dataprep asset or another DataprepAssetInstance. It has its own inputs and outpu...

### `unreal.DataprepAssetInstanceFactory`
Inherits: `Factory` | Header: `DataprepFactories.h`

Dataprep Asset Instance Factory

### `unreal.DataprepAssetInterface`
Inherits: `Object` | Header: `DataprepAssetInterface.h`

Dataprep Asset Interface

### `unreal.DataprepBoolFetcher`
Inherits: `DataprepFetcher` | Header: `DataprepBoolFetcher.h`

The bool fetcher is a specialized type of fetcher for the booleans

**Methods** (1):
  - `fetch(object)` -> `bool or None` — This function is called when the fetcher is executed. If your defining your fetcher in Blueprint this is the function to...

### `unreal.DataprepBoolFilter`
Inherits: `DataprepFilter` | Header: `DataprepBoolFilter.h`

Dataprep Bool Filter

### `unreal.DataprepConsumerUserData`
Inherits: `AssetUserData` | Header: `DataprepContentConsumer.h`

A UDataprepConsumerUserData is used to mark an asset or an actor to be respectively moved to a sub-folder or sub-level A DataprepContentConsumer is not obligated to honor this marker

### `unreal.DataprepContentConsumer`
Inherits: `Object` | Header: `DataprepContentConsumer.h`

Abstract class providing the minimal services required for a DataprepConsumer

**Methods** (6):
  - `get_level_name()` -> `str` — Get Level Name
  - `get_target_content_folder()` -> `str` — Get Target Content Folder
  - `set_level_name(level_name)` -> `Text or None` — Sets the name of the level the consumer should move objects to if applicable. remark: if InLevelName is empty or equal t...
  - `set_level_name_automated(level_name)` -> `Text or None` — Sets the name of the level the consumer should move objects to if applicable. This version wonât pop any ui remark: if...
  - `set_target_content_folder(target_content_folder)` -> `Text or None` — Sets the path of the package the consumer should move assets to if applicable. Generally, this package path is substitut...
  - `set_target_content_folder_automated(target_content_folder)` -> `Text or None` — Sets the path of the package the consumer should move assets to if applicable. This version wonât pop any ui Generally...

### `unreal.DataprepContentProducer`
Inherits: `Object` | Header: `DataprepContentProducer.h`

Abstract class to derived from to be a producer in the Dataprep asset

### `unreal.DataprepEditingOperation`
Inherits: `DataprepOperation` | Header: `DataprepOperation.h`

Base class for all Dataprep editing operations Dataprep editing operations act on a set of input obejcts and can modify their properties, but also can create new objects or delete existing ones (like ...

**Methods** (7):
  - `add_asset(asset, asset_name)` -> `Object` — DUplicate and add an asset to the Dataprepâs and actionâs working set
  - `create_actor(actor_class, actor_name)` -> `Actor` — Add an actor to the Dataprepâs transient world and actionâs working set
  - `create_asset(asset_class, asset_name)` -> `Object` — Create and add an asset to the Dataprepâs and actionâs working set
  - `delete_object(objects)` -> `None` — Delete an object from the Dataprepâs working set remark: The deletion of the object is deferred. However, if the objec...
  - `delete_objects(objects)` -> `None` — Delete an array of objects from the Dataprepâs and actionâs working set remark: The deletion of the object is deferr...
  - `remove_object(object, local_context = False)` -> `None` — Remove an object from the Dataprepâs and/or actionâs working set
  - `remove_objects(objects, local_context = False)` -> `None` — Remove an array of objects from the Dataprepâs and/or actionâs working set

### `unreal.DataprepFetcher`
Inherits: `DataprepParameterizableObject` | Header: `DataprepFetcher.h`

The Dataprep fetcher is a base class for Dataprep Selection system. The responsibility of fetcher is return a certain type of data for a object. (Look at DataprepStringFetcher for a example) This abst...

**Methods** (4):
  - `get_additional_keyword()` -> `Text` — Allows to add more keywords for when a user is searching for the fetcher in the ui.
  - `get_display_fetcher_name()` -> `Text` — Allows to change the name of the fetcher for the ui if needed.
  - `get_node_display_fetcher_name()` -> `Text` — The name displayed on node title.
  - `get_tooltip_text()` -> `Text` — Allows to change the tooltip of the fetcher for the ui if needed.

### `unreal.DataprepFilter`
Inherits: `DataprepParameterizableObject` | Header: `DataprepFilter.h`

The Dataprep Filter a base class for the Dataprep selection system Itâs main responsibility is to filter a array of object and to return the selected objects

**Methods** (1):
  - `get_fetcher()` -> `DataprepFetcher` — Get Fetcher

### `unreal.DataprepFilterNoFetcher`
Inherits: `DataprepParameterizableObject` | Header: `DataprepFilter.h`

The Dataprep Filter a base class for the Dataprep selection system Itâs main responsibility is to filter a array of object and to return the selected objects

**Methods** (4):
  - `get_additional_keyword()` -> `Text` — Allows to add more keywords for when a user is searching for the filter in the ui.
  - `get_display_filter_name()` -> `Text` — Allows to change the name of the filter for the ui if needed.
  - `get_node_display_filter_name()` -> `Text` — The name displayed on node title.
  - `get_tooltip_text()` -> `Text` — Allows to change the tooltip of the filter for the ui if needed.

### `unreal.DataprepFloatFetcher`
Inherits: `DataprepFetcher` | Header: `DataprepFloatFetcher.h`

The float fetcher is a specialized type of fetcher for the float

**Methods** (1):
  - `fetch(out_fetch_succeded=bool)` — This function is called when the fetcher is executed. If your defining your fetcher in Blueprint this is the function to...

### `unreal.DataprepFloatFilter`
Inherits: `DataprepFilter` | Header: `DataprepFloatFilter.h`

Dataprep Float Filter

### `unreal.DataprepIntegerFetcher`
Inherits: `DataprepFetcher` | Header: `DataprepIntegerFetcher.h`

The integer fetcher is a specialized type of fetcher for the integer

**Methods** (1):
  - `fetch(out_fetch_succeded=bool)` — This function is called when the fetcher is executed. If your defining your fetcher in Blueprint this is the function to...

### `unreal.DataprepIntegerFilter`
Inherits: `DataprepFilter` | Header: `DataprepIntegerFilter.h`

Dataprep Integer Filter

### `unreal.DataprepObjectSelectionFilter`
Inherits: `DataprepFilterNoFetcher` | Header: `DataprepObjectSelectionFilter.h`

Filter selected objects

### `unreal.DataprepOperation`
Inherits: `DataprepParameterizableObject` | Header: `DataprepOperation.h`

Base class for all Dataprep operations Dataprep operations act on a set of input obejcts and can modify their properties: f.e. change materials, add metadata etc.

**Methods** (13):
  - `assets_modified(assets)` -> `None` — Indicates an array of assets has changed during the operation. It is important to use this function if the modifications...
  - `begin_work(description, amount_of_work)` -> `None` — Indicates the beginning of a new work to report on
  - `end_work()` -> `None` — Indicates the end of the work
  - `execute(objects)` -> `None` — Execute the operation
  - `get_additional_keyword()` -> `Text` — Allows to add more keywords for when a user is searching for the fetcher in the ui.
  - `get_category()` -> `Text` — Allows to change the tooltip of the fetcher for the ui if needed.
  - `get_display_operation_name()` -> `Text` — Allows to change the name of the fetcher for the ui if needed.
  - `get_tooltip()` -> `Text` — Allows to change the tooltip of the fetcher for the ui if needed.
  - `log_error(log_error)` -> `None` — Add Error to the log
  - `log_info(log_text)` -> `None` — Add an info to the log
  - `log_warning(log_text)` -> `None` — Add a warning to the log
  - `on_execution(context)` -> `None` — This function is called when the operation is executed. If your defining your operation in Blueprint or Python this is t...
  - `report_progress(increment_of_work, message)` -> `None` — Report foreseen progress on the current work

### `unreal.DataprepParameterizableObject`
Inherits: `Object` | Header: `DataprepParameterizableObject.h`

The base class of all the object that can interact with the dataprep parameterization This include all the parameterizable object and the parameterization object itself Also all the object that can be...

### `unreal.DataprepRecipe`
Inherits: `Object` | Header: `DataprepRecipe.h`

Dataprep Recipe

**Methods** (3):
  - `get_actors()` -> `Array [ Actor ]` — DEPRECATED Returns all actors contained in its attached world deprecated: No use of Blueprint with Dataprep.
  - `get_assets()` -> `Array [ Object ]` — DEPRECATED Returns all valid assets contained in attached world deprecated: No use of Blueprint with Dataprep.
  - `trigger_pipeline_traversal()` -> `None` — DEPRECATED Function used to trigger the execution of the pipeline An event node associated to this function must be in t...

### `unreal.DataprepRecipeInterface`
Inherits: `Object` | Header: `DataprepAssetInterface.h`

A DataprepAssetInterface is composed of a set of producers, inputs, a consumer, output, and a recipe, set of actions. The producers generate assets and populate a given world. The pipeline modifies th...

### `unreal.DataprepRecursiveSelectionTransform`
Inherits: `DataprepSelectionTransform` | Header: `DataprepSelectionTransform.h`

Dataprep Recursive Selection Transform

### `unreal.DataprepSelectionTransform`
Inherits: `DataprepParameterizableObject` | Header: `DataprepSelectionTransform.h`

Dataprep Selection Transform

**Methods** (6):
  - `execute(objects)` -> `Array [ Object ]` — Execute the transform
  - `get_additional_keyword()` -> `Text` — Allows to add more keywords for when a user is searching for the fetcher in the ui.
  - `get_category()` -> `Text` — Allows to change the category of the transform for the ui if needed.
  - `get_display_transform_name()` -> `Text` — Allows to change the name of the transform for the ui if needed.
  - `get_tooltip()` -> `Text` — Allows to change the tooltip of the transform for the ui if needed.
  - `on_execution(objects)` -> `Array [ Object ]` — This function is called when the transform is executed. If your defining your transform in Blueprint or Python this is t...

### `unreal.DataprepStringFetcher`
Inherits: `DataprepFetcher` | Header: `DataprepStringFetcher.h`

The string fetcher is a specialized type of fetcher for the string

**Methods** (1):
  - `fetch(out_fetch_succeded=bool)` — This function is called when the fetcher is executed. If your defining your fetcher in Blueprint this is the function to...

### `unreal.DataprepStringFilter`
Inherits: `DataprepFilter` | Header: `DataprepStringFilter.h`

Dataprep String Filter

### `unreal.DataprepStringFilterMatchingArray`
Inherits: `DataprepParameterizableObject` | Header: `DataprepStringFilter.h`

Dataprep String Filter Matching Array

### `unreal.DataprepStringsArrayFetcher`
Inherits: `DataprepFetcher` | Header: `DataprepStringsArrayFetcher.h`

Dataprep Strings Array Fetcher

**Methods** (1):
  - `fetch()` — This function is called when the fetcher is executed. If you are defining your fetcher in Blueprint this is the function...

### `unreal.DataprepStringsArrayFilter`
Inherits: `DataprepFilter` | Header: `DataprepStringsArrayFilter.h`

Dataprep Strings Array Filter

### `unreal.DataprepUserData`
Inherits: `AssetUserData` | Header: `DataprepAssetUserData.h`

A DataprepAssetUserData is used to mark assets or actors created through a Dataprep pipeline

### `unreal.InterchangeDataprepLevelPipeline`
Inherits: `InterchangePipelineBase` | Header: `InterchangeDataprepPipeline.h`

Interchange Dataprep Level Pipeline

### `unreal.InterchangeFileProducer`
Inherits: `DataprepContentProducer` | Header: `InterchangeFileProducer.h`

Interchange File Producer

### `unreal.DataprepFloatMatchType`
Inherits: `EnumBase` | Header: `DataprepFloatFilter.h`

EDataprep Float Match Type

**Properties** (3):
  - `GREATHER_THAN`: `DataprepFloatMatchType = Ellipsis` — 1
  - `IS_NEARLY_EQUAL`: `DataprepFloatMatchType = Ellipsis` — 2
  - `LESS_THAN`: `DataprepFloatMatchType = Ellipsis` — 0

### `unreal.DataprepIntegerMatchType`
Inherits: `EnumBase` | Header: `DataprepIntegerFilter.h`

EDataprep Integer Match Type

**Properties** (4):
  - `GREATHER_THAN`: `DataprepIntegerMatchType = Ellipsis` — 1
  - `IN_BETWEEN`: `DataprepIntegerMatchType = Ellipsis` — 3
  - `IS_EQUAL`: `DataprepIntegerMatchType = Ellipsis` — 2
  - `LESS_THAN`: `DataprepIntegerMatchType = Ellipsis` — 0

### `unreal.DataprepStringMatchType`
Inherits: `EnumBase` | Header: `DataprepStringFilter.h`

EDataprep String Match Type

**Properties** (3):
  - `CONTAINS`: `DataprepStringMatchType = Ellipsis` — 0
  - `EXACT_MATCH`: `DataprepStringMatchType = Ellipsis` — 2
  - `MATCHES_WILDCARD`: `DataprepStringMatchType = Ellipsis` — 1
