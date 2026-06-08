# UE Python API — OnlineSubsystemUtils Module

**60 types** from the `OnlineSubsystemUtils` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `BlueprintSessionResult`, `InAppPurchaseProductInfo2`, `InAppPurchaseProductRequest2`, `InAppPurchaseReceiptInfo2`, `InAppPurchaseRestoreInfo2`, `OnlineProxyStoreOffer`, `AchievementLibrary`, `AchievementQueryCallbackProxy`, `AchievementWriteCallbackProxy`, `ConnectionCallbackProxy`, `CreateSessionCallbackProxy`, `DestroySessionCallbackProxy`, `EndMatchCallbackProxy`, `EndTurnCallbackProxy`, `FindSessionsCallbackProxy`, `FindTurnBasedMatchCallbackProxy`, `InAppPurchaseCallbackProxy2`, `InAppPurchaseCheckoutCallbackProxy`, `InAppPurchaseFinalizeProxy`, `InAppPurchaseQueryCallbackProxy2`, ... (60 total)

---

## Classes

### `unreal.BlueprintSessionResult`
Inherits: `StructBase` | Header: `FindSessionsCallbackProxy.h`

Blueprint Session Result

### `unreal.InAppPurchaseProductInfo2`
Inherits: `StructBase` | Header: `InAppPurchaseCallbackProxy2.h`

Micro-transaction purchase information

**Properties** (12):
  - `currency_code`: `str` [Read-Only] — [Read-Only] The localized currency code of the price (str)
  - `currency_symbol`: `str` [Read-Only] — [Read-Only] The localized currency symbol of the price (str)
  - `decimal_separator`: `str` [Read-Only] — [Read-Only] The localized decimal separator used in the price (str)
  - `display_description`: `str` [Read-Only] — [Read-Only] The localized display description name (str)
  - `display_name`: `str` [Read-Only] — [Read-Only] The localized display name (str)
  - `display_price`: `str` [Read-Only] — [Read-Only] The localized display price name (str)
  - `dynamic_fields`: `None` [Read-Only] — [Read-Only] Dynamic fields from raw Json data. (Map[str,str])
  - `grouping_separator`: `str` [Read-Only] — [Read-Only] The localized grouping separator of the price (str)
  - `identifier`: `str` [Read-Only] — [Read-Only] The unique product identifier (str)
  - `raw_price`: `float` [Read-Only] — [Read-Only] Raw price without currency code and symbol (float)
  - `receipt_data`: `str` [Read-Only] — [Read-Only] Opaque receipt data for the transaction (str)
  - `transaction_identifier`: `str` [Read-Only] — [Read-Only] the unique transaction identifier (str)

### `unreal.InAppPurchaseProductRequest2`
Inherits: `StructBase` | Header: `InAppPurchaseDataTypes.h`

Micro-transaction request information

**Properties** (2):
  - `is_consumable`: `bool` — [Read-Write] Flag to determine whether this is a consumable purchase, or not. (bool)
  - `product_identifier`: `str` — [Read-Write] The unique product identifier that matches the one from your targeted store. (str)

### `unreal.InAppPurchaseReceiptInfo2`
Inherits: `StructBase` | Header: `InAppPurchaseDataTypes.h`

Micro-transaction purchase information

**Properties** (4):
  - `item_id`: `str` [Read-Only] — [Read-Only] The unique product identifier (str)
  - `item_name`: `str` [Read-Only] — [Read-Only] The item name (str)
  - `transaction_identifier`: `str` [Read-Only] — [Read-Only] the unique transaction identifier (str)
  - `validation_info`: `str` [Read-Only] — [Read-Only] the purchase validation information (str)

### `unreal.InAppPurchaseRestoreInfo2`
Inherits: `StructBase` | Header: `InAppPurchaseRestoreCallbackProxy2.h`

Micro-transaction purchase information

**Properties** (3):
  - `item_id`: `str` [Read-Only] — [Read-Only] The unique product identifier (str)
  - `item_name`: `str` [Read-Only] — [Read-Only] The item name (str)
  - `validation_info`: `str` [Read-Only] — [Read-Only] the unique transaction identifier (str)

### `unreal.OnlineProxyStoreOffer`
Inherits: `StructBase` | Header: `InAppPurchaseQueryCallbackProxy2.h`

Offer entry for display from online store

**Properties** (13):
  - `currency_code`: `str` [Read-Only] — [Read-Only] Price currency code (str)
  - `description`: `Text` [Read-Only] — [Read-Only] Short description for display (Text)
  - `discount_type`: `OnlineProxyStoreOfferDiscountType` [Read-Only] — [Read-Only] Type of discount currently running on this offer (if any) (OnlineProxyStoreOfferDiscount...
  - `dynamic_fields`: `None` [Read-Only] — [Read-Only] (Map[str,str])
  - `expiration_date`: `DateTime` [Read-Only] — [Read-Only] Date this information is no longer valid (maybe due to sale ending, etc) (DateTime)
  - `long_description`: `Text` [Read-Only] — [Read-Only] Full description for display (Text)
  - `numeric_price`: `int` [Read-Only] — [Read-Only] Final-Price (Post-Sales/Discounts) in numeric form for comparison/sorting (int32)
  - `offer_id`: `str` [Read-Only] — [Read-Only] Unique offer identifier (str)
  - `price_text`: `Text` [Read-Only] — [Read-Only] Final-Pricing (Post-Sales/Discounts) as text for display (Text)
  - `regular_price`: `int` [Read-Only] — [Read-Only] Regular non-sale price in numeric form for comparison/sorting (int32)
  - `regular_price_text`: `Text` [Read-Only] — [Read-Only] Regular non-sale price as text for display (Text)
  - `release_date`: `DateTime` [Read-Only] — [Read-Only] Date the offer was released (DateTime)
  - `title`: `Text` [Read-Only] — [Read-Only] Title for display (Text)

### `unreal.AchievementLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `AchievementBlueprintLibrary.h`

Library of synchronous achievement calls

**Methods** (2):
  - `get_cached_achievement_description(world_context_object, player_controller, title=Text, locked_description=Text, unlocked_description=Text, hidden=bool)` [classmethod] — out
  - `get_cached_achievement_progress(world_context_object, player_controller, progress=float)` [classmethod] — out

### `unreal.AchievementQueryCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `AchievementQueryCallbackProxy.h`

Achievement Query Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there is an unsuccessful query (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when there is a successful query (EmptyOnlineDelegate)

### `unreal.AchievementWriteCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `AchievementWriteCallbackProxy.h`

Achievement Write Callback Proxy

**Properties** (4):
  - `on_failure`: `AchievementWriteDelegate` — [Read-Write]
deprecated: Use OnWriteFailure instead. (AchievementWriteDelegate)
  - `on_success`: `AchievementWriteDelegate` — [Read-Write]
deprecated: Use OnWriteSuccess instead. (AchievementWriteDelegate)
  - `on_write_failure`: `AchievementWriteCompleteDelegate` — [Read-Write] Called when there is an unsuccessful achievement write (AchievementWriteCompleteDelegat...
  - `on_write_success`: `AchievementWriteCompleteDelegate` — [Read-Write] Called when there is a successful achievement write (AchievementWriteCompleteDelegate)

### `unreal.ConnectionCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `ConnectionCallbackProxy.h`

Connection Callback Proxy

**Properties** (2):
  - `on_failure`: `OnlineConnectionResult` — [Read-Write] Called when there is an unsuccessful query (OnlineConnectionResult)
  - `on_success`: `OnlineConnectionResult` — [Read-Write] Called when there is a successful query (OnlineConnectionResult)

### `unreal.CreateSessionCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `CreateSessionCallbackProxy.h`

Create Session Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there was an error creating the session (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when the session was created successfully (EmptyOnlineDelegate)

### `unreal.DestroySessionCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `DestroySessionCallbackProxy.h`

Destroy Session Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there is an unsuccessful destroy (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when there is a successful destroy (EmptyOnlineDelegate)

### `unreal.EndMatchCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `EndMatchCallbackProxy.h`

End Match Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when ending the match fails (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when the match ends successfully (EmptyOnlineDelegate)

### `unreal.EndTurnCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `EndTurnCallbackProxy.h`

End Turn Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there is an unsuccessful query (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when there is a successful query (EmptyOnlineDelegate)

### `unreal.FindSessionsCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `FindSessionsCallbackProxy.h`

Find Sessions Callback Proxy

**Methods** (4):
  - `get_current_players(result)` -> `int32` [classmethod] — Get Current Players
  - `get_max_players(result)` -> `int32` [classmethod] — Get Max Players
  - `get_ping_in_ms(result)` -> `int32` [classmethod] — Get Ping in Ms
  - `get_server_name(result)` -> `str` [classmethod] — Get Server Name

**Properties** (2):
  - `on_failure`: `BlueprintFindSessionsResultDelegate` — [Read-Write] Called when there is an unsuccessful query (BlueprintFindSessionsResultDelegate)
  - `on_success`: `BlueprintFindSessionsResultDelegate` — [Read-Write] Called when there is a successful query (BlueprintFindSessionsResultDelegate)

### `unreal.FindTurnBasedMatchCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `FindTurnBasedMatchCallbackProxy.h`

Find Turn Based Match Callback Proxy

**Properties** (2):
  - `on_failure`: `OnlineTurnBasedMatchResult` — [Read-Write] Called when matchmaking failed (OnlineTurnBasedMatchResult)
  - `on_success`: `OnlineTurnBasedMatchResult` — [Read-Write] Called when matchmaking succeeded. (OnlineTurnBasedMatchResult)

### `unreal.InAppPurchaseCallbackProxy2`
Inherits: `Object` | Header: `InAppPurchaseCallbackProxy2.h`

In App Purchase Callback Proxy 2

**Methods** (3):
  - `create_proxy_object_for_in_app_purchase(player_controller, product_request)` -> `InAppPurchaseCallbackProxy2` [classmethod] — Kicks off a transaction for the provided product identifier deprecated: Please use âStart an In-App Purchaseâ and re...
  - `create_proxy_object_for_in_app_purchase_query_owned(player_controller)` -> `InAppPurchaseCallbackProxy2` [classmethod] — Create Proxy Object for in App Purchase Query Owned deprecated: Please use âQuery for Owned In-App Productsâ and rem...
  - `create_proxy_object_for_in_app_purchase_unprocessed_purchases(player_controller)` -> `InAppPurchaseCallbackProxy2` [classmethod] — Create Proxy Object for in App Purchase Unprocessed Purchases deprecated: Please use âGet known In-App Receiptsâ and...

**Properties** (2):
  - `on_failure`: `InAppPurchaseResult2` — [Read-Write] Called when there is an unsuccessful In-App Purchase transaction (InAppPurchaseResult2)
  - `on_success`: `InAppPurchaseResult2` — [Read-Write] Called when there is a successful In-App Purchase transaction (InAppPurchaseResult2)

### `unreal.InAppPurchaseCheckoutCallbackProxy`
Inherits: `Object` | Header: `InAppPurchaseCheckoutCallbackProxy.h`

In App Purchase Checkout Callback Proxy

**Methods** (1):
  - `create_proxy_object_for_in_app_purchase_checkout(player_controller, product_request)` -> `InAppPurchaseCheckoutCallbackProxy` [classmethod] — Kicks off a transaction for the provided product identifier

**Properties** (2):
  - `on_failure`: `OnlineProxyInAppCheckoutResult` — [Read-Write] Called when there is an unsuccessful In-App Purchase transaction (OnlineProxyInAppCheck...
  - `on_success`: `OnlineProxyInAppCheckoutResult` — [Read-Write] Called when there is a successful In-App Purchase transaction (OnlineProxyInAppCheckout...

### `unreal.InAppPurchaseFinalizeProxy`
Inherits: `Object` | Header: `InAppPurchaseFinalizeProxy.h`

In App Purchase Finalize Proxy

**Methods** (1):
  - `create_proxy_object_for_in_app_purchase_finalize(app_purchase_receipt, player_controller)` -> `InAppPurchaseFinalizeProxy` [classmethod] — Finalizes a transaction for the provided transaction identifier

### `unreal.InAppPurchaseQueryCallbackProxy2`
Inherits: `Object` | Header: `InAppPurchaseQueryCallbackProxy2.h`

In App Purchase Query Callback Proxy 2

**Methods** (1):
  - `create_proxy_object_for_in_app_purchase_query(player_controller, product_identifiers)` -> `InAppPurchaseQueryCallbackProxy2` [classmethod] — Queries a InAppPurchase for an integer value

**Properties** (2):
  - `on_failure`: `InAppPurchaseQuery2Result` — [Read-Write] Called when there is an unsuccessful InAppPurchase query (InAppPurchaseQuery2Result)
  - `on_success`: `InAppPurchaseQuery2Result` — [Read-Write] Called when there is a successful InAppPurchase query (InAppPurchaseQuery2Result)

### `unreal.InAppPurchaseReceiptsCallbackProxy`
Inherits: `Object` | Header: `InAppPurchaseReceiptsCallbackProxy.h`

In App Purchase Receipts Callback Proxy

**Methods** (3):
  - `create_proxy_object_for_in_app_purchase_get_known_receipts(player_controller)` -> `InAppPurchaseReceiptsCallbackProxy` [classmethod] — Create Proxy Object for in App Purchase Get Known Receipts
  - `create_proxy_object_for_in_app_purchase_query_owned_products(player_controller)` -> `InAppPurchaseReceiptsCallbackProxy` [classmethod] — Create Proxy Object for in App Purchase Query Owned Products
  - `create_proxy_object_for_in_app_purchase_restore_owned_products(player_controller)` -> `InAppPurchaseReceiptsCallbackProxy` [classmethod] — Create Proxy Object for in App Purchase Restore Owned Products

**Properties** (2):
  - `on_failure`: `OnlineProxyInAppReceiptsResult` — [Read-Write] Called when there is an unsuccessful In-App Purchase transaction (OnlineProxyInAppRecei...
  - `on_success`: `OnlineProxyInAppReceiptsResult` — [Read-Write] Called when there is a successful In-App Purchase transaction (OnlineProxyInAppReceipts...

### `unreal.InAppPurchaseRestoreCallbackProxy2`
Inherits: `Object` | Header: `InAppPurchaseRestoreCallbackProxy2.h`

In App Purchase Restore Callback Proxy 2

**Methods** (1):
  - `create_proxy_object_for_in_app_purchase_restore(consumable_product_flags, player_controller)` -> `InAppPurchaseRestoreCallbackProxy2` [classmethod] — Kicks off a transaction for the provided product identifier deprecated: Please use âRestore Owned In-App Productsâ a...

**Properties** (2):
  - `on_failure`: `InAppPurchaseRestoreResult2` — [Read-Write] Called when there is an unsuccessful In-App Purchase transaction (InAppPurchaseRestoreR...
  - `on_success`: `InAppPurchaseRestoreResult2` — [Read-Write] Called when there is a successful In-App Purchase transaction (InAppPurchaseRestoreResu...

### `unreal.JoinSessionCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `JoinSessionCallbackProxy.h`

Join Session Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there is an unsuccessful join (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when there is a successful join (EmptyOnlineDelegate)

### `unreal.LeaderboardFlushCallbackProxy`
Inherits: `Object` | Header: `LeaderboardFlushCallbackProxy.h`

Leaderboard Flush Callback Proxy

**Properties** (2):
  - `on_failure`: `OnLeaderboardFlushed` — [Read-Write] Called when there is an unsuccessful leaderboard flush (OnLeaderboardFlushed)
  - `on_success`: `OnLeaderboardFlushed` — [Read-Write] Called when there is a successful leaderboard flush (OnLeaderboardFlushed)

### `unreal.LeaderboardLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LeaderboardBlueprintLibrary.h`

A beacon host used for taking reservations for an existing game session

**Methods** (1):
  - `write_leaderboard_integer(player_controller, stat_name, stat_value)` -> `bool` [classmethod] — Writes an integer value to the specified leaderboard

### `unreal.LeaderboardQueryCallbackProxy`
Inherits: `Object` | Header: `LeaderboardQueryCallbackProxy.h`

Leaderboard Query Callback Proxy

**Properties** (2):
  - `on_failure`: `LeaderboardQueryResult` — [Read-Write] Called when there is an unsuccessful leaderboard query (LeaderboardQueryResult)
  - `on_success`: `LeaderboardQueryResult` — [Read-Write] Called when there is a successful leaderboard query (LeaderboardQueryResult)

### `unreal.LogoutCallbackProxy`
Inherits: `BlueprintAsyncActionBase` | Header: `LogoutCallbackProxy.h`

Logout Callback Proxy

**Properties** (2):
  - `on_failure`: `OnlineLogoutResult` — [Read-Write] Called when the logout completed unsuccessfully (OnlineLogoutResult)
  - `on_success`: `OnlineLogoutResult` — [Read-Write] Called when the logout completed successfully (OnlineLogoutResult)

### `unreal.OnlineBeacon`
Inherits: `Actor` | Header: `OnlineBeacon.h`

Base class for beacon communication (Unreal Networking, but outside normal gameplay traffic)

### `unreal.OnlineBeaconClient`
Inherits: `OnlineBeacon` | Header: `OnlineBeaconClient.h`

Base class for any unique beacon connectivity, paired with an AOnlineBeaconHostObject implementation

### `unreal.OnlineBeaconHost`
Inherits: `OnlineBeacon` | Header: `OnlineBeaconHost.h`

Main actor that listens for side channel communication from another Unreal Engine application

### `unreal.OnlineBeaconHostObject`
Inherits: `Actor` | Header: `OnlineBeaconHostObject.h`

Base class for any unique beacon connectivity, paired with an AOnlineBeaconClient implementation

### `unreal.OnlineBeaconUnitTestClient`
Inherits: `OnlineBeaconClient` | Header: `OnlineBeaconUnitTestClient.h`

Online Beacon Unit Test Client

### `unreal.OnlineBeaconUnitTestHost`
Inherits: `OnlineBeaconHost` | Header: `OnlineBeaconUnitTestHost.h`

Online Beacon Unit Test Host

### `unreal.OnlineBeaconUnitTestHostObject`
Inherits: `OnlineBeaconHostObject` | Header: `OnlineBeaconUnitTestHostObject.h`

Online Beacon Unit Test Host Object

### `unreal.PartyBeaconClient`
Inherits: `OnlineBeaconClient` | Header: `PartyBeaconClient.h`

A beacon client used for making reservations with an existing game session

### `unreal.PartyBeaconHost`
Inherits: `OnlineBeaconHostObject` | Header: `PartyBeaconHost.h`

A beacon host used for taking reservations for an existing game session

### `unreal.QuitMatchCallbackProxy`
Inherits: `OnlineBlueprintCallProxyBase` | Header: `QuitMatchCallbackProxy.h`

Quit Match Callback Proxy

**Properties** (2):
  - `on_failure`: `EmptyOnlineDelegate` — [Read-Write] Called when there is an unsuccessful query (EmptyOnlineDelegate)
  - `on_success`: `EmptyOnlineDelegate` — [Read-Write] Called when there is a successful query (EmptyOnlineDelegate)

### `unreal.ShowLoginUICallbackProxy`
Inherits: `BlueprintAsyncActionBase` | Header: `ShowLoginUICallbackProxy.h`

Show Login UICallback Proxy

**Properties** (2):
  - `on_failure`: `OnlineShowLoginUIResult` — [Read-Write] Called when there is an unsuccessful query (OnlineShowLoginUIResult)
  - `on_success`: `OnlineShowLoginUIResult` — [Read-Write] Called when there is a successful query (OnlineShowLoginUIResult)

### `unreal.SpectatorBeaconClient`
Inherits: `OnlineBeaconClient` | Header: `SpectatorBeaconClient.h`

A beacon client used for making reservations with an existing game session

### `unreal.SpectatorBeaconHost`
Inherits: `OnlineBeaconHostObject` | Header: `SpectatorBeaconHost.h`

A beacon host used for taking reservations for an existing game session

### `unreal.TestBeaconClient`
Inherits: `OnlineBeaconClient` | Header: `TestBeaconClient.h`

A beacon client used for making reservations with an existing game session

### `unreal.TestBeaconHost`
Inherits: `OnlineBeaconHostObject` | Header: `TestBeaconHost.h`

A beacon host used for taking reservations for an existing game session

### `unreal.TurnBasedLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `TurnBasedBlueprintLibrary.h`

Library of synchronous achievement calls

**Methods** (4):
  - `get_is_my_turn(world_context_object, player_controller, match_id)` -> `bool` [classmethod] — out
  - `get_my_player_index(world_context_object, player_controller, match_id)` -> `int32` [classmethod] — out
  - `get_player_display_name(world_context_object, player_controller, match_id, player_index)` -> `str` [classmethod] — out
  - `register_turn_based_match_interface_object(world_context_object, player_controller, object)` -> `None` [classmethod] — Register Turn Based Match Interface Object

### `unreal.VoipListenerSynthComponent`
Inherits: `SynthComponent` | Header: `VoipListenerSynthComponent.h`

Voip Listener Synth Component

**Methods** (1):
  - `is_idling()` -> `bool`

### `unreal.InAppPurchaseStatus`
Inherits: `EnumBase` | Header: `InAppPurchaseDataTypes.h`

State of a purchase transaction

**Properties** (6):
  - `CANCELED`: `InAppPurchaseStatus = Ellipsis` — purchase canceled by user 3
  - `DEFERRED`: `InAppPurchaseStatus = Ellipsis` — purchase has been deferred (neither failed nor completed) 2
  - `FAILED`: `InAppPurchaseStatus = Ellipsis` — purchase completed but failed 1
  - `INVALID`: `InAppPurchaseStatus = Ellipsis` — 0
  - `PURCHASED`: `InAppPurchaseStatus = Ellipsis` — purchase succeeded 4
  - `RESTORED`: `InAppPurchaseStatus = Ellipsis` — restore succeeded 5

### `unreal.OnlineProxyStoreOfferDiscountType`
Inherits: `EnumBase` | Header: `InAppPurchaseQueryCallbackProxy2.h`

EOnline Proxy Store Offer Discount Type

**Properties** (4):
  - `DISCOUNT_AMOUNT`: `OnlineProxyStoreOfferDiscountType = Ellipsis` — Offer price should be displayed as an amount off regular price 2
  - `NOT_ON_SALE`: `OnlineProxyStoreOfferDiscountType = Ellipsis` — Offer isnât on sale 0
  - `PAY_AMOUNT`: `OnlineProxyStoreOfferDiscountType = Ellipsis` — Offer price should be displayed as a new price 3
  - `PERCENTAGE`: `OnlineProxyStoreOfferDiscountType = Ellipsis` — Offer price should be displayed as a percentage of regular price 1

### `unreal.AchievementWriteCompleteDelegate`
Inherits: `MulticastDelegateBase` | Header: `AchievementWriteCallbackProxy.h`

Achievement Write Complete Delegate Delegate Signature

### `unreal.AchievementWriteDelegate`
Inherits: `MulticastDelegateBase` | Header: `AchievementWriteCallbackProxy.h`

Achievement Write Delegate Delegate Signature

### `unreal.BlueprintFindSessionsResultDelegate`
Inherits: `MulticastDelegateBase` | Header: `FindSessionsCallbackProxy.h`

Blueprint Find Sessions Result Delegate Delegate Signature

### `unreal.InAppPurchaseQuery2Result`
Inherits: `MulticastDelegateBase` | Header: `InAppPurchaseQueryCallbackProxy2.h`

In App Purchase Query 2Result Delegate Signature

### `unreal.InAppPurchaseRestoreResult2`
Inherits: `MulticastDelegateBase` | Header: `InAppPurchaseRestoreCallbackProxy2.h`

In App Purchase Restore Result 2 Delegate Signature

### `unreal.InAppPurchaseResult2`
Inherits: `MulticastDelegateBase` | Header: `InAppPurchaseCallbackProxy2.h`

In App Purchase Result 2 Delegate Signature

### `unreal.LeaderboardQueryResult`
Inherits: `MulticastDelegateBase` | Header: `LeaderboardQueryCallbackProxy.h`

Leaderboard Query Result Delegate Signature

### `unreal.OnLeaderboardFlushed`
Inherits: `MulticastDelegateBase` | Header: `LeaderboardFlushCallbackProxy.h`

On Leaderboard Flushed Delegate Signature

### `unreal.OnlineConnectionResult`
Inherits: `MulticastDelegateBase` | Header: `ConnectionCallbackProxy.h`

Online Connection Result Delegate Signature

### `unreal.OnlineLogoutResult`
Inherits: `MulticastDelegateBase` | Header: `LogoutCallbackProxy.h`

Online Logout Result Delegate Signature

### `unreal.OnlineProxyInAppCheckoutResult`
Inherits: `MulticastDelegateBase` | Header: `InAppPurchaseCheckoutCallbackProxy.h`

Online Proxy in App Checkout Result Delegate Signature

### `unreal.OnlineProxyInAppReceiptsResult`
Inherits: `MulticastDelegateBase` | Header: `InAppPurchaseReceiptsCallbackProxy.h`

Online Proxy in App Receipts Result Delegate Signature

### `unreal.OnlineShowLoginUIResult`
Inherits: `MulticastDelegateBase` | Header: `ShowLoginUICallbackProxy.h`

Online Show Login UIResult Delegate Signature

### `unreal.OnlineTurnBasedMatchResult`
Inherits: `MulticastDelegateBase` | Header: `FindTurnBasedMatchCallbackProxy.h`

Online Turn Based Match Result Delegate Signature
