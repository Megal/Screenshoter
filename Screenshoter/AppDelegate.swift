//
//  AppDelegate.swift
//  Screenshoter
//
//  Created by Svyatoshenko "Megal" Misha on 2016-10-22.
//  Copyright © 2016年 Svyatoshenko "Megal" Misha. All rights reserved.
//

import Cocoa
import Quartz

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



	func applicationDidFinishLaunching(_ aNotification: Notification) {

		let displayID = CGMainDisplayID()
		let img = CGDisplayCreateImage(displayID)!

		let writePng = URL(fileURLWithPath: NSHomeDirectory() + "/Desktop/screenshot.png")
		let dest = CGImageDestinationCreateWithURL(writePng as CFURL, kUTTypePNG, 1, nil)!

		CGImageDestinationAddImage(dest, img, nil)
		guard CGImageDestinationFinalize(dest) else {
			fatalError("cannot save screenshot");
		}
		// Insert code here to initialize your application

		NSApp.terminate(self)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

