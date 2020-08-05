# Garfield Kart Mapping Resource

## 0 Requirements
* Computer
* Garfield Kart
* Unity 3D Pro 4
* Blender

Tested with Windows 10, Unity version 4.5.5f1 and Blender version 2.80.75.

## 1 Install the mod loader
The Garfield Kart Mod Loader (GKML) is installed by copying the contents of the GKML releases into the root of the Garfield Kart game folder. **This guide uses `GKML 0.2.0pre2.zip` because of a bug in version 0.2.0pre3**, but I expect nothing to change in this process if a fix or workaround is found. Browse to the game folder - it should contain a folder called `External` and one called `GarfieldKartNoMulti_Data` (for my version of the game, it also conatiains the game executable `GarfieldKartNoMulti.exe` and nothing else) - and copy your chosen GKML release there. Don't use `GKML 0.2.0pre3 (Asm only).zip` because this only contains the four assemblies changed between v0.2.0pre2 and -pre3. Choose 'Extract Here' in your favourite archive tool (I recommend 7zip), and overwrite files when prompted.

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

Each map consists of a file inside the `Maps` folder with a `.gkmap` extension. In fact, all maps are simply zip archives with their file extension changed. Your archive tool should be able to open or extract the `.gkmap` file to see three files contained within, where `[MAPNAME]` is the name of your map (this must be the same as the name of the main `.gkmap` file):
* `LevelPreview.png` is the file that is used as the thumbnail for the map in the map selection screen.
* `[MAPNAME].mapinfo` is a text file in json format that holds metadata about your map.
* `[MAPNAME].unity3d` contains the data for the actual track, such as model, power-up, lighting and checkpoint information. It is not easily readable.

You can try opening `abtest.gkmap` with your archive tool to inspect these three files.

## 3 Open a map in unity
Extract `abtest source.zip` to a folder, and open that folder as a project in unity. If it isn't already opened, open the scene named 'test'. The scene window now shows the layout of the map. The higherarchy window shows the various game objects that are present here. Clicking on one of them reveals its location in the scene and also displays its properties in the inspector window. If you just want to focus on making a track, the layer property is very important. Expand this dropdown to see all the diferent options, like Road, Water, Bonus, ColKillHole, ColMud and others. Besides setting the correct layer, every collidable object need to have a 'Collider' as a component (this can be added in the inspector window). It is also possible to make objects rotate, as can be seen in the properties of the sphere in the middle of the track and the platform at the top of the ramp.

You can learn a lot about how maps are made by just changing one or two things in the unity project and seeing how that changes the map. I encourage you do to so to find cool gameplay mechanics that you can use in your track. See section 6 if you've just made some changes and you want to see them in-game.

## 4 Modelling/texturing in blender
It is possible to make maps with just the unity editor, however if you already at least a little about blender, it is much easier to use that for modelling, and simply import the model into the unity project. Blender makes it very easy to create models such as race tracks with the use of tools like the bezier curve. This makes it easy to insert a top-down image of a real kart racing track into your blender project, trace out the track with a curve and then create the model using modifiers. There are a lot of guides on youtube on how to do things like this in different ways. It is also quite easy to make a simple cross-section of your track, then simply extrude and position new pieces of the cross-section where they're needed. This is probably the best option if you're new to blender, but I find that it can be hard to be consistent and account for all three dimensions when designing a complex track. In any case, there are a lot of good tutorials on this topic so I won't cover modelling here.

Creating a texture for your map is less important, but it can also be done in different ways. Unity allows you to set a solid colour as a texture your imported object. You can also use an image texture with the option of tiling. It is also possible to texture your model within blender using the texture paint functionality, then import the same texture file into Unity.

## 5 Importing models/textures into unity
Select the model you would like to export in blender, then click `File > Export > FBX` and save the .fbx file in a convenient location. Either drag that file from File Explorer window to the Assets panel in Unity, or click `Assets > Import New Asset...` in Unity and select the .fbx model you previously saved. Then simply drag the model into your scene as desired. If you're importing a track, select the object in the scene, change the Layer from 'Default' to 'Road', then click `Add Component > Physics > Mesh Collider`. Both of these steps are required to be able to drive on the imported object.

To add a solid colour texture to the imported model, click `Assets > Create > Material`, then pick a name for the material and choose a colour. Then simply drag and drop the new material over the object in the scene to colour it. If you UV unwrapped your model and texture painted it all within blender, you only need to import the image texture as an asset into your Unity project, then drag and drop the image texture over your object to apply the texture in exactly the same way as you designed in Blender. This relies on the fact that you exported the model in a file format that stores the UV unwrapping data, such as fbx.

## 6 Compiling and playing your map
If you've started out by modifying the example project (abtest), you should be able to click `Assets > Pack Map` to save a .unity3d file containing all the map data. Next, extract `abtest.gkmap` to a folder, replace the existing .unity3d file with your own, and compress the three files as a zip archive using your archive tool. Then rename your .zip file back to `abtest.gkmap`. The `.mapinfo`, `.unity3d` and the resulting `.gkmap` archive must all have the same name (before the file extension). Make sure that your .gkmap file is in the Maps folder and launch the game. The overlay should show that the map has been loaded; it should be playable as per section 2. If not, check `modloader.log` for clues about what went wrong. Sometimes it is also necessary to manually save the scene using `CTRL + S` before compiling the map.

You can write a script to automate the above process every time you compile a new version of your map. `Update Map.bat` is what I use. It won't work on your machine and simply serves as an inspiration for writing a script that accomodates your tools and file structure.

## Notes
* I do not yet know of a way to set the path of the AI characters.
* If you delete or move the game's splash screen from the `External` folder, it simply won't show up! However, the game won't load if the `External\SplashScreens` is deleted entirely (at least for me).
* I have not yet found a way to rename the scene name fom "test".
* It is very easy to clip through objects if your kart is at an angle to the surface.
* You can teleport to the top of the full pipe from within, by driving up the side of the pipe.
* The level preview has a resolution of 636x416 on my monitor, and will squash or stretch the provided image to this resolution.
* The `Picture` attribute in the `.mapinfo` file is ignored by GKML, which simply looks for a file called `LevelPreview.png` or `LevelPreview.jpg` (and possibly some other extensions) to show as the thumbnail image.
