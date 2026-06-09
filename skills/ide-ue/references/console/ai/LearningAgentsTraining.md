# UE Python API — LearningAgentsTraining Module

**36 types** from the `LearningAgentsTraining` UE module.
All accessible via `import unreal` in the UE Python environment.

**Classes**: `LearningAgentsCommunicator`, `LearningAgentsEntityInfo`, `LearningAgentsImitationTrainerSettings`, `LearningAgentsImitationTrainerTrainingSettings`, `LearningAgentsPPOTrainerSettings`, `LearningAgentsPPOTrainingSettings`, `LearningAgentsRecord`, `LearningAgentsRecorderPathSettings`, `LearningAgentsSharedMemoryCommunicatorSettings`, `LearningAgentsSharedMemoryTrainerProcess`, `LearningAgentsSocketCommunicatorSettings`, `LearningAgentsSocketTrainerProcess`, `LearningAgentsTrainerProcessSettings`, `LearningAgentsTrainingGameSettings`, `SpawnedEntitiesInfo`, `SpawnGymInfo`, `LearningAgentsCommunicatorLibrary`, `LearningAgentsCompletions`, `LearningAgentsEntitiesManagerComponent`, `LearningAgentsEntityInterface`, ... (36 total)

---

## Classes

### `unreal.LearningAgentsCommunicator`
Inherits: `StructBase` | Header: `LearningAgentsCommunicator.h`

Blueprint-compatible wrapper struct for IExternalTrainer.

### `unreal.LearningAgentsEntityInfo`
Inherits: `StructBase` | Header: `LearningAgentsEntitiesManagerComponent.h`

FLearningAgentsEntityInfo holds spawn information of a single entity type.

**Properties** (4):
  - `entity_class`: `Class` — [Read-Write] Specify the entity class to spawn. (type(Class))
  - `entity_spawn_z_offset`: `float` — [Read-Write] Specify the Z offset to apply to spawn locations. (float)
  - `episode_entity_spawn_count_max`: `int` — [Read-Write] The max number of entities to spawn at the start of an episode. (int32)
  - `episode_entity_spawn_count_min`: `int` — [Read-Write] The min number of entities to spawn at the start of an episode. (int32)

### `unreal.LearningAgentsImitationTrainerSettings`
Inherits: `StructBase` | Header: `LearningAgentsImitationTrainer.h`

The configurable settings for a ULearningAgentsImitationTrainer.

### `unreal.LearningAgentsImitationTrainerTrainingSettings`
Inherits: `StructBase` | Header: `LearningAgentsImitationTrainer.h`

The configurable settings for the training process.

### `unreal.LearningAgentsPPOTrainerSettings`
Inherits: `StructBase` | Header: `LearningAgentsPPOTrainer.h`

The configurable settings for a ULearningAgentsPPOTrainer.

**Properties** (3):
  - `max_episode_step_num`: `int` — [Read-Write] Maximum number of steps recorded in an episode before it is added to the replay buffer....
  - `maximum_recorded_episodes_per_iteration`: `int` — [Read-Write] Maximum number of episodes to record before running a training iteration. An iteration ...
  - `maximum_recorded_steps_per_iteration`: `int` — [Read-Write] Maximum number of steps to record before running a training iteration. An iteration of ...

### `unreal.LearningAgentsPPOTrainingSettings`
Inherits: `StructBase` | Header: `LearningAgentsPPOTrainer.h`

The configurable settings for the PPO training process.

### `unreal.LearningAgentsRecord`
Inherits: `StructBase` | Header: `LearningAgentsRecording.h`

A single recording of a series of observations and actions.

**Properties** (7):
  - `action_compatibility_hash`: `int` [Read-Only] — [Read-Only] The compatibility hash for the recorded action vectors (int32)
  - `action_data`: `None` [Read-Only] — [Read-Only] Action data (Array[float])
  - `action_dim_num`: `int` [Read-Only] — [Read-Only] The number of dimensions in the action vector for this record (int32)
  - `observation_compatibility_hash`: `int` [Read-Only] — [Read-Only] The compatibility hash for the recorded observation vectors (int32)
  - `observation_data`: `None` [Read-Only] — [Read-Only] Observation data (Array[float])
  - `observation_dim_num`: `int` [Read-Only] — [Read-Only] The number of dimensions in the observation vector for this record (int32)
  - `step_num`: `int` [Read-Only] — [Read-Only] The number of observations and actions recorded. (int32)

### `unreal.LearningAgentsRecorderPathSettings`
Inherits: `StructBase` | Header: `LearningAgentsRecorder.h`

The path settings for the recorder.

**Properties** (2):
  - `intermediate_relative_path`: `DirectoryPath` — [Read-Write] The relative path to the Intermediate directory. Defaults to FPaths::ProjectIntermediat...
  - `recordings_subdirectory`: `str` — [Read-Write] The name of the sub-directory to use in the intermediate directory (str)

### `unreal.LearningAgentsSharedMemoryCommunicatorSettings`
Inherits: `StructBase` | Header: `LearningAgentsCommunicator.h`

Settings specific to shared memory communicators.

### `unreal.LearningAgentsSharedMemoryTrainerProcess`
Inherits: `StructBase` | Header: `LearningAgentsCommunicator.h`

Blueprint-compatible wrapper struct for Shared Memory Training Process.

### `unreal.LearningAgentsSocketCommunicatorSettings`
Inherits: `StructBase` | Header: `LearningAgentsCommunicator.h`

Settings specific to socket communicators.

### `unreal.LearningAgentsSocketTrainerProcess`
Inherits: `StructBase` | Header: `LearningAgentsCommunicator.h`

Blueprint-compatible wrapper struct for Socket Training Process.

### `unreal.LearningAgentsTrainerProcessSettings`
Inherits: `StructBase` | Header: `LearningAgentsTrainer.h`

The path settings for the trainer.

### `unreal.LearningAgentsTrainingGameSettings`
Inherits: `StructBase` | Header: `LearningAgentsTrainer.h`

The configurable game settings for a ULearningAgentsTrainer. These allow the timestep and physics tick to be fixed during training, which can enable ticking faster than real-time.

### `unreal.SpawnedEntitiesInfo`
Inherits: `StructBase` | Header: `LearningAgentsEntitiesManagerComponent.h`

FSpawnedEntitiesInfo holds references to spawned entities.

### `unreal.SpawnGymInfo`
Inherits: `StructBase` | Header: `LearningAgentsGymsManager.h`

This struct holds information (num to spawn etc) on one gym template to spawn.

**Properties** (2):
  - `gym_class`: `Class` — [Read-Write] The gym class used to construct gym instances. (type(Class))
  - `spawn_count`: `int` — [Read-Write] The number of gym instances to spawn. (int32)

### `unreal.LearningAgentsCommunicatorLibrary`
Inherits: `BlueprintFunctionLibrary` | Header: `LearningAgentsCommunicator.h`

Contains functions for starting external trainers and communicating with them.

**Methods** (6):
  - `make_shared_memory_communicator(trainer_process, trainer_process_settings = [], shared_memory_settings = [])` -> `LearningAgentsCommunicator` [classmethod] — Create a communicator which can be used to interact with a previously started shared memory trainer process.
  - `make_shared_memory_training_process(trainer_process_settings = [], shared_memory_settings = [])` -> `LearningAgentsCommunicator` [classmethod] — Start and connect to a training sub-process which will communicate via shared memory. Shared memory has the least commun...
  - `make_socket_communicator(trainer_process, socket_settings = [])` -> `LearningAgentsCommunicator` [classmethod] — Create a communicator which can be used to interact with a previously started socket trainer process.
  - `make_socket_training_process(trainer_process_settings = [], socket_settings = [])` -> `LearningAgentsCommunicator` [classmethod] — Start and connect to a training sub-process which will communicate via sockets. Sockets have some overhead compared to s...
  - `spawn_shared_memory_training_process(trainer_process_settings = [], shared_memory_settings = [])` -> `LearningAgentsSharedMemoryTrainerProcess` [classmethod] — Start a local python training sub-process which will communicate via shared memory. Shared memory has the least communic...
  - `spawn_socket_training_process(trainer_process_settings = [], socket_settings = [])` -> `LearningAgentsSocketTrainerProcess` [classmethod] — Start a local python training sub-process which will communicate via sockets. Sockets have some overhead compared to sha...

### `unreal.LearningAgentsCompletions`
Inherits: `BlueprintFunctionLibrary` | Header: `LearningAgentsCompletions.h`

Learning Agents Completions

**Methods** (14):
  - `completion_and(a, b)` -> `LearningAgentsCompletionEnum` [classmethod] — Returns a termination if both inputs are a termination, otherwise a truncation if both inputs are either a truncation or...
  - `completion_not(a, not_running_type = LearningAgentsCompletionEnum.TERMINATION)` -> `LearningAgentsCompletionEnum` [classmethod] — Returns running if the input A is either a termination or truncation, otherwise returns the completion specified by NotR...
  - `completion_or(a, b)` -> `LearningAgentsCompletionEnum` [classmethod] — Returns a termination if either input is a termination, otherwise a truncation if either input is a truncation, otherwis...
  - `is_completion_completed(completion)` -> `bool` [classmethod] — Returns true if a completion is either truncated or terminated, otherwise false.
  - `is_completion_running(completion)` -> `bool` [classmethod] — Returns true if a completion is running, otherwise false.
  - `is_completion_termination(completion)` -> `bool` [classmethod] — Returns true if a completion is terminated, otherwise false.
  - `is_completion_truncation(completion)` -> `bool` [classmethod] — Returns true if a completion is truncated, otherwise false.
  - `make_completion(completion_type = LearningAgentsCompletionEnum.TERMINATION, tag = 'Completion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion.
  - `make_completion_on_condition(condition, completion_type = LearningAgentsCompletionEnum.TERMINATION, tag = 'ConditionCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion based on some condition.
  - `make_completion_on_episode_steps_recorded(episode_steps, max_episode_steps = 64, completion_type = LearningAgentsCompletionEnum.TRUNCATION, tag = 'EpisodeStepsRecordedCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion when the number of episode steps recorded exceeds some threshold.
  - `make_completion_on_location_difference_above_threshold(location_a, location_b, distance_threshold = 100.000000, completion_type = LearningAgentsCompletionEnum.TERMINATION, tag = 'LocationDifferenceAboveThresholdCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion when the distance between two locations is above some threshold.
  - `make_completion_on_location_difference_below_threshold(location_a, location_b, distance_threshold = 100.000000, completion_type = LearningAgentsCompletionEnum.TERMINATION, tag = 'LocationDifferenceBelowThresholdCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion when the distance between two locations is below some threshold.
  - `make_completion_on_location_outside_bounds(location, bounds_transform = [[0.000000,0.000000,0.000000],[-0.000000,0.000000,0.000000],[1.000000,1.000000,1.000000]], bounds_mins = [-100.000000,-100.000000,-100.000000], bounds_maxs = [100.000000,100.000000,100.000000], completion_type = LearningAgentsCompletionEnum.TERMINATION, tag = 'LocationOutsideBoundsCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion when a location moves outside of sound bounds.
  - `make_completion_on_time_elapsed(time, time_threshold = 10.000000, completion_type = LearningAgentsCompletionEnum.TRUNCATION, tag = 'TimeElapsedCompletion', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [1.000000,1.000000,0.000000,1.000000])` -> `LearningAgentsCompletionEnum` [classmethod] — Make a completion when a time goes above a threshold.

### `unreal.LearningAgentsEntitiesManagerComponent`
Inherits: `ActorComponent` | Header: `LearningAgentsEntitiesManagerComponent.h`

ULearningAgentsEntitiesManagerComponent handles the spawn and reset of multiple entity types during training.

**Methods** (5):
  - `initialize_learning_component()` -> `None` — Initializes the component at the start of training.
  - `reset_learning_component()` -> `None` — Resets the component for a new training episode.
  - `spawn_entities(entity_class, entity_spawn_z_offset, spawn_count, transform)` -> `Array [ LearningAgentsEntityInterface ]` — Spawns multiple pooled entities.
  - `spawn_entities_at_random_locations(entity_class, entity_spawn_z_offset, spawn_count)` -> `LearningAgentsEntityInterface` — Spawns pooled entities at random locations.
  - `spawn_entity_at_projected_location(entity_class, entity_spawn_z_offset, transform)` -> `LearningAgentsEntityInterface` — Spawns a single pooled entity with a specified transform projected in the gym.

### `unreal.LearningAgentsEntityInterface`
Inherits: `LearningAgentsEntityTrainingInterface` | Header: `LearningAgentsEntityInterface.h`

Learning Agents Entity Interface

**Methods** (3):
  - `disable_entity()` -> `None` — Disables an entity used for training.
  - `enable_entity()` -> `None` — Enables an entity to be used for training.
  - `is_entity_enabled()` -> `bool` — Checks whether an entity is eligible to be used for training.

### `unreal.LearningAgentsEntityTrainingInterface`
Inherits: `Interface` | Header: `LearningAgentsEntityInterface.h`

Learning Agents Entity Training Interface

**Methods** (3):
  - `get_gym()` -> `LearningAgentsGymBase` — Resets an entity for a new training episode.
  - `initialize_entity(gym)` -> `None` — Initialize an entity at the start of training.
  - `reset_entity(gym)` -> `None` — Resets an entity for a new training episode.

### `unreal.LearningAgentsGymBase`
Inherits: `Actor` | Header: `LearningAgentsGym.h`

The Gym Base abstract class handles the start and reset of entities training in a single gym.

**Methods** (3):
  - `get_random_stream()` -> `RandomStream` — Retrieves the current random stream used by the Gym.
  - `initialize()` -> `None` — Initializes the gym at the start of training.
  - `reset()` -> `None` — Resets the gym for a new training episode.

**Properties** (3):
  - `on_begin_gym_reset`: `OnBeginGymResetSignature` — [Read-Write] Event called at the start of a gymâs reset. (OnBeginGymResetSignature)
  - `on_gym_initialized`: `OnGymInitializedSignature` — [Read-Write] Event called at a gymâs initialization. (OnGymInitializedSignature)
  - `on_post_gym_reset`: `OnPostGymResetSignature` — [Read-Write] Event called at the end of a gymâs reset. (OnPostGymResetSignature)

### `unreal.LearningAgentsGymSimple`
Inherits: `LearningAgentsGymBase` | Header: `LearningAgentsGymSimple.h`

A simple gym template class that uses a static mesh as its training floor.

### `unreal.LearningAgentsGymsManager`
Inherits: `Actor` | Header: `LearningAgentsGymsManager.h`

The Learning Agents GymsManager centralizes the start and reset of training for multiple gym templates.

**Methods** (2):
  - `get_gyms_count()` -> `int32` — Get the number of gyms managed by the GymsManager.
  - `start()` -> `None` — Spawns and initializes gym instances.

### `unreal.LearningAgentsImitationTrainer`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsImitationTrainer.h`

The ULearningAgentsImitationTrainer enable imitation learning, i.e. learning from human/AI demonstrations. Imitation training is typically much faster than reinforcement learning, but requires gatheri...

**Methods** (7):
  - `begin_training(recording, imitation_trainer_settings = [], imitation_trainer_training_settings = [], imitation_trainer_path_settings = [])` -> `None` — Begins the training process with the provided settings.
  - `end_training()` -> `None` — Stops the training process.
  - `has_training_failed()` -> `bool` — Returns true if the trainer has failed to communicate with the external training process. This can be used in combinatio...
  - `is_training()` -> `bool` — Returns true if the trainer is currently training; Otherwise, false.
  - `iterate_training()` -> `None` — Iterates the training process and gets the updated policy network.
  - `make_imitation_trainer(manager, interactor, policy, communicator, class_=None, manager=LearningAgentsManager, interactor=LearningAgentsInteractor, policy=LearningAgentsPolicy)` [classmethod] — Constructs the imitation trainer and runs the setup functions.
  - `run_training(recording, imitation_trainer_settings = [], imitation_trainer_training_settings = [], imitation_trainer_path_settings = [])` -> `None` — Convenience function that runs a basic training loop. If training has not been started, it will start it. On each follow...

### `unreal.LearningAgentsLearningComponentInterface`
Inherits: `Interface` | Header: `LearningAgentsLearningComponentInterface.h`

Learning Agents Learning Component Interface

**Methods** (2):
  - `initialize_learning_component()` -> `None` — Initializes the component at the start of training.
  - `reset_learning_component()` -> `None` — Resets the component for a new training episode.

### `unreal.LearningAgentsPPOTrainer`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsPPOTrainer.h`

Learning Agents PPOTrainer

**Methods** (9):
  - `begin_training(trainer_training_settings = [], training_game_settings = [], reset_agents_on_begin = True)` -> `None` — Begins the training process with the provided settings.
  - `end_training()` -> `None` — Stops the training process.
  - `get_episode_step_num(agent_id = -1)` -> `int32` — Gets the number of step recorded in an episode for the given agent.
  - `has_training_failed()` -> `bool` — Returns true if the trainer has failed to communicate with the external training process. This can be used in combinatio...
  - `is_training()` -> `bool` — Returns true if the trainer is currently training; Otherwise, false.
  - `make_ppo_trainer(manager, interactor, training_environment, policy, critic, communicator, class_=None, name="PPOTrainer", trainer_settings=[512, 1000, manager=LearningAgentsManager, interactor=LearningAgentsInteractor, training_environment=LearningAgentsTrainingEnvironment, policy=LearningAgentsPolicy, critic=LearningAgentsCritic)` [classmethod] — Constructs the trainer.
  - `process_experience(reset_agents_on_update = True)` -> `None` — Call this function at the end of each step of your training loop. This takes the current observations/actions/ rewards a...
  - `run_training(trainer_training_settings = [], training_game_settings = [], reset_agents_on_begin = True, reset_agents_on_update = True)` -> `None` — Convenience function that runs a basic training loop. If training has not been started, it will start it, and then call ...
  - `setup_ppo_trainer(manager, interactor, training_environment, policy, critic, communicator, trainer_settings=[512, 1000, interactor=LearningAgentsInteractor, training_environment=LearningAgentsTrainingEnvironment, policy=LearningAgentsPolicy, critic=LearningAgentsCritic)` — Initializes the trainer.

### `unreal.LearningAgentsRecorder`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsRecorder.h`

A component that can be used to create recordings of training data for imitation learning.

**Methods** (8):
  - `add_experience()` -> `None` — While recording, adds the current buffered observations and actions of the added agents to the internal buffer. Call thi...
  - `begin_recording()` -> `None` — Begins the recording of the observations and actions of each added agent.
  - `end_recording()` -> `None` — Ends the recording of the observations and actions of each agent and stores them in the current recording object.
  - `end_recording_and_discard()` -> `None` — Ends the recording of the observations and actions of each agent and discards them.
  - `get_recording_asset()` -> `LearningAgentsRecording` — Gets the current recording object. Note: this may be empty until EndRecording has been called.
  - `is_recording()` -> `bool` — Returns true if recording is active; Otherwise, false.
  - `make_recorder()` [classmethod] — Constructs this object and runs the setup functions for the underlying data storage. pram: bReinitializeRecording If to ...
  - `setup_recorder()` — Initializes this object and runs the setup functions for the underlying data storage. pram: bReinitializeRecording If to...

### `unreal.LearningAgentsRecording`
Inherits: `DataAsset` | Header: `LearningAgentsRecording.h`

Data asset representing an array of records.

**Methods** (10):
  - `append_recording_from_file(file)` -> `None` — Append to this recording from a file.
  - `append_recording_to_asset(recording_asset)` -> `None` — Appends this recording to the given recording asset
  - `get_action_vector()` — Get the Action Vector associated with a particular step of a given recording
  - `get_observation_vector()` — Get the Observation Vector associated with a particular step of a given recording
  - `get_record_num()` -> `int32` — Get the number of records
  - `get_record_step_num(record)` -> `int32` — Get the number of steps in a given record
  - `load_recording_from_asset(recording_asset)` -> `None` — Loads this recording from the given recording asset
  - `load_recording_from_file(file)` -> `None` — Load this recording from a file.
  - `save_recording_to_asset(recording_asset)` -> `None` — Saves this recording to the given recording asset
  - `save_recording_to_file(file)` -> `None` — Save this recording to a file.

### `unreal.LearningAgentsRewards`
Inherits: `BlueprintFunctionLibrary` | Header: `LearningAgentsRewards.h`

Learning Agents Rewards

**Methods** (11):
  - `make_reward(reward_value, reward_scale = 1.000000, tag = 'Reward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward from a float value.
  - `make_reward_from_angle_similarity(angle_a, angle_b, reward_scale = 1.000000, tag = 'AngleSimilarityReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_angle_location_a = [0.000000,0.000000,0.000000], visual_logger_angle_location_b = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on how similar two angles are. Angles should be given in degrees.
  - `make_reward_from_direction_similarity(direction_a = [1.000000,0.000000,0.000000], direction_b = [1.000000,0.000000,0.000000], reward_scale = 1.000000, tag = 'DirectionSimilarityReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_direction_location_a = [0.000000,0.000000,0.000000], visual_logger_direction_location_b = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_arrow_length = 100.000000, visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on how similar two directions are.
  - `make_reward_from_location_difference(location_a, location_b, location_scale = 100.000000, reward_scale = 1.000000, tag = 'LocationDifferenceReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on the distance between two locations. Gives a larger reward the further the distance between the lo...
  - `make_reward_from_location_similarity(location_a, location_b, location_scale = 100.000000, reward_scale = 1.000000, tag = 'LocationSimilarityReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on how similar two locations are.
  - `make_reward_from_rotation_similarity(rotation_a, rotation_b, reward_scale = 1.000000, tag = 'RotationSimilarityReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location_a = [0.000000,0.000000,0.000000], visual_logger_rotation_location_b = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on how similar two rotations are.
  - `make_reward_from_rotation_similarity_as_quats(rotation_a, rotation_b, reward_scale = 1.000000, tag = 'RotationSimilarityReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_rotation_location_a = [0.000000,0.000000,0.000000], visual_logger_rotation_location_b = [0.000000,0.000000,0.000000], visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on how similar two rotations are represented as quaternions.
  - `make_reward_from_velocity_along_spline(spline_component, location, velocity, velocity_scale = 200.000000, reward_scale = 1.000000, finite_difference_delta = 10.000000, tag = 'VelocityAlongSplineReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward based on the velocity an object is moving along a spline.
  - `make_reward_on_condition(condition, reward_scale = 1.000000, tag = 'ConditionReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward which is equal to RewardScale when bCondition is true, otherwise returns zero.
  - `make_reward_on_location_difference_above_threshold(location_a, location_b, distance_threshold = 100.000000, reward_scale = 1.000000, tag = 'LocationDifferenceAboveThresholdReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward when the distance between two locations is above a threshold, otherwise returns zero.
  - `make_reward_on_location_difference_below_threshold(location_a, location_b, distance_threshold = 100.000000, reward_scale = 1.000000, tag = 'LocationDifferenceBelowThresholdReward', visual_logger_enabled = False, visual_logger_listener = None, visual_logger_agent_id = -1, visual_logger_location = [0.000000,0.000000,0.000000], visual_logger_color = [0.000000,1.000000,0.000000,1.000000])` -> `float` [classmethod] — Make a reward when the distance between two locations is below a threshold, otherwise returns zero.

### `unreal.LearningAgentsTrainingEnvironment`
Inherits: `LearningAgentsManagerListener` | Header: `LearningAgentsTrainingEnvironment.h`

Learning Agents Training Environment

**Methods** (15):
  - `gather_agent_completion(agent_id)` -> `LearningAgentsCompletionEnum` — This callback should be overridden by the Trainer and gathers the completion for a given agent.
  - `gather_agent_completions(agent_ids)` -> `Array [ LearningAgentsCompletionEnum ]` — This callback can be overridden by the Trainer and gathers all the completions for the given set of agents. By default t...
  - `gather_agent_reward(agent_id)` -> `float` — This callback should be overridden by the Trainer and gathers the reward value for the given agent.
  - `gather_agent_rewards(agent_ids)` -> `Array [ float ]` — This callback can be overridden by the Trainer and gathers all the reward values for the given set of agents. By default...
  - `gather_completions()` -> `None` — Call this function when it is time to evaluate the completions for your agents. This should be done at the beginning of ...
  - `gather_rewards()` -> `None` — Call this function when it is time to evaluate the rewards for your agents. This should be done at the beginning of each...
  - `get_completion(agent_id = -1)` -> `LearningAgentsCompletionEnum` — Gets the current completion for an agent. Should be called only after GatherCompletions.
  - `get_episode_time(agent_id = -1)` -> `float` — Gets the current elapsed episode time for the given agent.
  - `get_reward(agent_id = -1)` -> `float` — Gets the current reward for an agent. Should be called only after GatherRewards.
  - `has_completion(agent_id = -1)` -> `bool` — Returns true if GatherCompletions has been called and the completion already set for the given agent.
  - `has_reward(agent_id = -1)` -> `bool` — Returns true if GatherRewards has been called and the reward already set for the given agent.
  - `make_training_environment(manager, class_, manager=LearningAgentsManager)` [classmethod] — Constructs the training environment and runs the setup functions for rewards and completions.
  - `reset_agent_episode(agent_id)` -> `None` — This callback should be overridden by the Trainer and resets the episode for the given agent.
  - `reset_agent_episodes(agent_ids)` -> `None` — This callback can be overridden by the Trainer and resets all episodes for each agent in the given set. By default this ...
  - `setup_training_environment(manager)` -> `LearningAgentsManager` — Initializes the training environment and runs the setup functions for rewards and completions.

### `unreal.LearningAgentsCompletionEnum`
Inherits: `EnumBase` | Header: `LearningAgentsCompletions.h`

Completion modes for episodes.

**Properties** (3):
  - `RUNNING`: `LearningAgentsCompletionEnum = Ellipsis` — Episode is still running. 0
  - `TERMINATION`: `LearningAgentsCompletionEnum = Ellipsis` — Episode ended and zero reward was expected for all future steps. 2
  - `TRUNCATION`: `LearningAgentsCompletionEnum = Ellipsis` — Episode ended while in progress. Critic will be used to estimate final return. 1

### `unreal.LearningAgentsTrainingDevice`
Inherits: `EnumBase` | Header: `LearningAgentsTrainer.h`

Enumeration of the training devices.

**Properties** (2):
  - `CPU`: `LearningAgentsTrainingDevice = Ellipsis` — 0
  - `GPU`: `LearningAgentsTrainingDevice = Ellipsis` — 1

### `unreal.OnBeginGymResetSignature`
Inherits: `MulticastDelegateBase` | Header: `LearningAgentsGym.h`

On Begin Gym Reset Signature Delegate Signature

### `unreal.OnGymInitializedSignature`
Inherits: `MulticastDelegateBase` | Header: `LearningAgentsGym.h`

On Gym Initialized Signature Delegate Signature

### `unreal.OnPostGymResetSignature`
Inherits: `MulticastDelegateBase` | Header: `LearningAgentsGym.h`

On Post Gym Reset Signature Delegate Signature
