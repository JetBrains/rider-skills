# Remote Deployment — PCs, Consoles, and Network Targets

## Remote PC Deployment

### UAT Deploy to Remote Device

UAT supports deploying to remote machines via the `-device` flag:

```bash
# Deploy and run on a remote Windows PC
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -device=<IPAddress>

# Deploy to a remote Linux server
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Linux -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -device=<user@host>
```

### Manual Remote Deployment (SCP/rsync)

For targets where UAT device support is limited:

```bash
# Package locally
bash ${CLAUDE_SKILL_DIR}/../ue-package/scripts/ue-package.sh \
  --platform Linux --config Development \
  --archive /tmp/GameBuild

# Copy to remote
rsync -avz --progress /tmp/GameBuild/ user@remote:/opt/game/

# Run remotely
ssh user@remote "chmod +x /opt/game/GameName.sh && /opt/game/GameName.sh -log"
```

### Unreal Remote Agent / SN-DBS

For distributed builds and deployment:
- **UnrealRemoteTool** — Proxies build tasks to remote machines
- **SN-DBS (SN-DistributedBuildSystem)** — Distributes shader compilation across network
- Configure in `BuildConfiguration.xml`:
  ```xml
  <RemoteToolChain>
    <RemoteServerName>build-server.local</RemoteServerName>
  </RemoteToolChain>
  ```

---

## Console Deployment

### General Console Workflow

All console platforms (Xbox, PlayStation, Switch) follow this pattern:

1. **Obtain devkit hardware** — Must be an authorized developer
2. **Install platform SDK** — Download from platform holder's developer portal
3. **Register devkit** — Connect to partner network, update firmware
4. **Configure UE project** — Enable platform in `.uproject`, configure platform settings
5. **Build + Cook + Deploy** — Same UAT pipeline, different `-platform` flag

### Xbox (GDK)

**Prerequisites**:
- Xbox Series X|S devkit or Xbox One devkit
- Microsoft GDK (Game Development Kit) installed
- Registered with ID@Xbox or managed partner program

**Platform flags**: `-platform=XboxOneGDK`, `-platform=XSX` (Xbox Series X|S)

```bash
# Build and deploy to Xbox devkit
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=XSX -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -device=<DevkitIP>
```

**Key notes**:
- Uses Microsoft GDK (not legacy XDK)
- Debug via Xbox Device Portal or Visual Studio
- Game save/load uses Xbox Live services
- Certification requirements: `XboxServices.config` must be configured

### PlayStation (PS4/PS5)

**Prerequisites**:
- PS5 devkit (DFI-T1000) or PS4 devkit
- PlayStation Partners SDK installed
- Registered on PlayStation Partners portal

**Platform flags**: `-platform=PS4`, `-platform=PS5`

```bash
# Build and deploy to PS5 devkit
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=PS5 -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -device=<DevkitIP>
```

**Key notes**:
- Deploy via Neighborhood (PS4) or SN Target Manager (PS5)
- Uses AGC/GNM graphics APIs
- Trophy system requires PSN configuration
- Shader compilation uses PS-specific compiler

### Nintendo Switch

**Prerequisites**:
- Switch devkit (SDEV/EDEV)
- Nintendo SDK installed
- Registered Nintendo Developer Program member

**Platform flag**: `-platform=Switch`

```bash
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Switch -clientconfig=Development \
  -build -cook -stage -pak -deploy -run \
  -device=<DevkitSerial>
```

**Key notes**:
- Deploy via Nintendo Target Manager
- Significant memory constraints (4 GB shared RAM)
- Must manage texture streaming and LODs aggressively
- Uses NVN graphics API (NVIDIA-based)

---

## Multi-Client / Server Deployment

### Dedicated Server + Clients

```bash
# Deploy server to Linux host
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Linux -serverconfig=Development \
  -build -cook -stage -pak -deploy \
  -dedicatedserver -server -noclient \
  -device=<server-host>

# Deploy client to Windows
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -run \
  -cmdline="-connect=<server-ip>"
```

### Launch Multiple Clients (Testing)

```bash
# Launch server + 4 clients locally
RunUAT BuildCookRun \
  -project="Game.uproject" \
  -platform=Win64 -clientconfig=Development \
  -build -cook -stage -pak -run \
  -dedicatedserver -server \
  -numclients=4
```

---

## Unreal Frontend (UFE) / Project Launcher

The Project Launcher in Unreal Editor provides a GUI for deployment:

**Editor > Launch > Project Launcher** (or `Window > Developer > Project Launcher`)

### Creating a Launch Profile

1. **Build**: Configuration (Development/Shipping), platform
2. **Cook**: By the Book / On the Fly / Do Not Cook
3. **Package**: Pak files, IoStore, compression
4. **Deploy**: Device selection, deploy method
5. **Launch**: Auto-run, command-line args

### Saving Profiles

Launch profiles are saved as `.ulaunchprofile` files in:
```
<Project>/Saved/LaunchProfiles/
```

These can be committed to version control for team sharing.

### CLI Equivalent of Project Launcher

Every Project Launcher setting maps to a UAT flag (see `knowledge/` in ue-package skill). The ue-deploy script generates the equivalent UAT command.

---

## Device Manager

UE's Device Manager (`Window > Developer > Device Manager`) handles:

- **Device discovery** — Auto-discovers devices on the network
- **Device claiming** — Assign devices to your workstation
- **Status monitoring** — Connection state, available storage
- **Remote shutdown/reboot** — Platform-specific

### Adding Devices Manually

For devices not auto-discovered:
1. Device Manager > Add > Enter IP or device ID
2. Set platform type and credentials
3. Verify connection

---

## Network Deployment Ports

| Service | Port | Protocol | Notes |
|---------|------|----------|-------|
| Cook-on-the-fly | 41899 | TCP | File server for CotF |
| Unreal Message Bus | 6666 | UDP | Device discovery, editor communication |
| Network file server | 41899 | TCP | Same as CotF |
| Remote session | 1234 | TCP | Remote control (varies) |
| Console devkit | Varies | TCP | Platform-specific debug port |

Ensure firewall rules allow these ports for network deployment.
