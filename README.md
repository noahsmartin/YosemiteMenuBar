YosemiteMenuBar
===============

This project demostrates how a custom view NSStatusItem can be used in OS X Yosemite to still be compatible with features such as dark mode.

All you have to do to use YosemiteMenuBar is create a new instance, asign its custom view, and start it.  YosemiteMenuBar will handle basic click events and forward them to the custom view.

This project contains a demo of using YosemiteMenuBar with a simple custom view in the status bar that responds to click events.
You can use YosemiteMenuBar with existing projects as a replacement for NSStatusItem to create status bar items with custom views that work on 10.10 and earlier.
If you need access to the NSStatusItem, you can get it using the statusItem property.
