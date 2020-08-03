# Garfield Kart Mapping Resource

## 0 Requirements
* Computer
* Garfield Kart
* Unity 3D Pro 4
* Blender

Tested with Windows 10 and Unity version 4.5.5f1.

## 1 Install the mod loader
The Garfield Kart Mod Loader (GKML) is installed by copying the contents of the GKML releases into the root of the Garfield Kart game folder. This guide uses `GKML 0.2.0pre2.zip` because  Browse to the game folder - it should contain a folder called `External` and one called `GarfieldKartNoMulti_Data` (for my version of the game, it also conatiains the game executable `GarfieldKartNoMulti.exe` and nothing else) - and copy your chosen GKML release there. Don't use `GKML 0.2.0pre3 (Asm only).zip` because this only contains the four assemblies changed between v0.2.0pre2 and -pre3. Choose 'Extract Here' in your favourite archive tool (I recommend 7zip), and overwrite files when prompted.

When you reach the game's title scrren, two folders named 'Maps' and 'Mods' should appear in your game folder, along with a log file `modloader.log`. You should see an overlay in the top right corner of the screen, and there should be a spinning GKML logo in the game credits.

The `modloader.log` file for GKML 0.2.0pre2 looks like this (without any maps or mods installed):
```
GKML: Preparing base patches
GKML: Preinitializing mods
GKML: Mods folder does not exist, creating
GKML: No mods found :(
GKML: Initializing maps
GKML: Mods folder does not exist, creating
GKML: No maps found, cancelling process! (damn, the folder must be very lonely there ;()
GKML: Postinitializing mods
```

## 2 Load a map
Copy `abtest.gkmap` from this repo to the `Maps` folder inside your game directory and launch the game. The overlay in the top right corner should show that the map has loaded. To race on the test map, select 'Single Race' in the main menu and press the letter a on your keyboard on the map selection screen. You should see that the new map is now selectable and playable.

Each map consists of a file inside the `Maps` folder with a `.gkmap` extension. In fact, all maps are simply zip files with their file extension changed. Your archive tool should be able to open `.gkmap` files to...

## Notes
* If you delete or move the game's splash screen from the `External` folder, it simply won't show up! However, the game won't load if the `External\SplashScreens` is deleted entirely (at least for me).
* I have not yet found a way to rename the scene name fom "test".
* It is very easy to clip through objects if your kart is at an angle to the surface.
* You can teleport to the top of the full pipe from within, by driving up the side of the pipe.
* The level preview has a resolution of 636x416 on my monitor, and will squash or stretch the provided image to this resolution.
* The `Picture` attribute in the `.mapinfo` file is ignored by GKML, which simply looks for a file called `LevelPreview.png` or `LevelPreview.jpg` (and possibly some other extensions) to show as the preview images.
