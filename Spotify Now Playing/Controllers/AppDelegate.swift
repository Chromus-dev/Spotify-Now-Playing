//
//  AppDelegate.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 9/8/23.
//

import Foundation
import SwiftUI

var nowPlayingInfo = NowPlayingInfo()

class AppDelegate: NSObject, NSApplicationDelegate {
	var statusItem: NSStatusItem?
	var popOver = NSPopover()
	
	func applicationDidFinishLaunching(_ notification: Notification) {
		
		let menuView = MenuView(nowPlayingInfo: nowPlayingInfo)
		
		popOver.behavior = .transient
		popOver.animates = false
		
		popOver.setValue(true, forKeyPath: "shouldHideAnchor")
		
		popOver.contentViewController = NSViewController()
		popOver.contentViewController?.view = NSHostingView(rootView: menuView)
		
		popOver.contentViewController?.view.window?.makeKey()
		
		statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
		
		if let MenuButton = statusItem?.button {
			MenuButton.image = NSImage(systemSymbolName: "play.square.fill", accessibilityDescription: nil)
			MenuButton.action = #selector(MenuButtonToggle)
		}
	}
	
	@objc func MenuButtonToggle(sender: AnyObject) {
		if popOver.isShown {
			popOver.performClose(sender)
		}
		else {
			// https://stackoverflow.com/questions/30700079/programatically-get-the-name-and-artist-of-the-currently-playing-track-in-swift/74990535#74990535
			// Load framework
			let bundle = CFBundleCreate(kCFAllocatorDefault, NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework"))
			
			// Get a Swift function for MRMediaRemoteGetNowPlayingInfo
			guard let MRMediaRemoteGetNowPlayingInfoPointer = CFBundleGetFunctionPointerForName(bundle, "MRMediaRemoteGetNowPlayingInfo" as CFString) else { return }
			typealias MRMediaRemoteGetNowPlayingInfoFunction = @convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void
			let MRMediaRemoteGetNowPlayingInfo = unsafeBitCast(MRMediaRemoteGetNowPlayingInfoPointer, to: MRMediaRemoteGetNowPlayingInfoFunction.self)
			
			MRMediaRemoteGetNowPlayingInfo(DispatchQueue.main, { (information) in
				nowPlayingInfo.info = information

				if let menuButton = self.statusItem?.button {
					self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
				}
			})
		}
	}
}
