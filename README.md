![Alt Text](https://i.imgur.com/yT1i9GZ.png)
# rblxGlassUI

To use, simply insert the code in the Library_GlassUI text file into a ModuleScript on Roblox, and place ModuleScript under ServerStorage in the game. To use the library, simply require() the ModuleScript and then call the functions inside the library with the appropriate arguments.

```
GlassUI = require(game.ServerStorage.Library_GlassUI)

GlassUI.Create_MenuBar("Example", Directory, Width, Menu_Table, Item_Script_Destinations, true)
```

## Menu Bar
User-interaction is based on scrolling on the frame and then clicking to select, instead of moving the mouse on top of a button. This allows for near-infinite customizability regarding the number of items in the menu bar and that all of the options would be formatted in a visually appealing way.

#### A lot of options:
![Alt Text](https://media.giphy.com/media/5bojxRYuVRdmyXthFY/giphy.gif)

#### Not a lot of options:
![Alt Text](https://media.giphy.com/media/9x4UZhFlGHNmwRnriD/giphy.gif)

## Image Menu List
Similar to the menu bar, except with images added.

#### Not a lot of options:
![Alt Text](https://media.giphy.com/media/edYN25et6jQd4Kvha6/giphy.gif)

#### A lot of options:
![Alt Text](https://media.giphy.com/media/1wrBjuBvED7ky6CV2y/giphy.gif)

## Basic Menu List
Used as a pop-up for user interaction, comes in framed background and no background flavors.

##### No background:
![Alt Text](https://media.giphy.com/media/3FnMqtgX1Oxjv9xWt2/giphy.gif)

##### Framed background:
![Alt Text](https://media.giphy.com/media/2dbnh5iahIpllP5NrV/giphy.gif)
