# OpenKore for ThorRO

This fork adds a `ThorRO` server profile to OpenKore. ThorRO runs rAthena with the
2025-06-04 Ragexe client, and 4th jobs work.

## Setup (Windows)

1. Download this repository: **Code → Download ZIP** on the `thorro` branch, then extract it, for example to
   `D:\Games\openkore`.
2. Open `control\config.txt` and set:

   ```
   master ThorRO
   server 0
   username <your account>
   password <your password>
   char <slot number of the character, starting at 0>
   loginPinCode <your 4-digit PIN, if the server asks for one>
   ```

3. Double-click `start.exe`. It doesn't need Perl installed. If it won't start, install Strawberry Perl (64-bit)
   from https://strawberryperl.com and run `perl openkore.pl` in a command prompt in that folder.

The `[ThorRO]` entry in `tables\servers.txt` points to the NAS on Tailscale (`100.118.138.45:6900`).
Change `ip` there if the server address changes.

## Bot settings to start with

In `control\config.txt`:

```
lockMap prt_fild08      # the map to hunt on
attackAuto 2            # attack monsters
route_randomWalk 1      # walk around the map looking for monsters
itemsTakeAuto 2         # pick up drops
```

Skills, potions and other settings are explained at https://openkore.com/wiki/Category:Config.

## Notes for ThorRO

- Each bot is an account online. The server allows 3 accounts per IP at the same time; GM accounts don't count.
- Use `ai manual` in the console to pause the bot and `ai auto` to resume.

## What was changed

- `src/Network/Receive/ThorRO.pm`, `src/Network/Send/ThorRO.pm`: the ThorRO profile. It is based on kRO 2021-11-03.
  rAthena built for 2025-06-04 accepts the same client packets as for 2021-11-03, apart from a few new ones the bot
  doesn't use. The server packets that changed are already understood by OpenKore.
- `tables/ThorRO/recvpackets.txt`: packet lengths for the 2025-06-04 client, taken from rAthena. The sources are the
  packet table of a running map-server and the sizes of rAthena's packet structures compiled for `PACKETVER 20250604`.
  Lengths for packets rAthena doesn't list come from the ROla table.
- `tables/servers.txt`: the `[ThorRO]` entry. `charBlockSize 175` is the size of rAthena's character entry for this
  client.

## How it was tested

The bot was run against a local rAthena build with `PACKETVER 20250604` and ThorRO's scripts, using a level 200
Windhawk:

- login with PIN, character select and map entry;
- status, trait stats, inventory and the skill list (including 4th-job skills);
- walking and warping;
- equipping a bow and arrows;
- attacking, skills (Double Strafe, Arrow Storm) and looting;
- NPC talk: Healer, and the Storage Keeper's menu;
- the storage window;
- 3 minutes of automatic hunting on `prt_fild08`, with 41 kills and no packet errors.
