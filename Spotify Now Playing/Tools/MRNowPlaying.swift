//
//  MRNowPlaying.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 9/1/23.
//

import Foundation
import MediaPlayer
import AVFoundation
import Dynamic

//struct NowPlayingInfo {
//	var artworkDataHeight: Int
//	var artwork: String
//	var trackNumber: Int
//	var totalTrackCount: Int
//	var elapsedTime: Double
//	var artworkDataWidth: Int
//	var playbackRate: Double
//	var title: String
//	var totalDiscCount: Int
//	var timestamp: String
//}

class MRNowPlaying {
	func getNowPlayingInfo() async -> Void {
		
		// https://stackoverflow.com/questions/30700079/programatically-get-the-name-and-artist-of-the-currently-playing-track-in-swift/74990535#74990535
		// Load framework
		let bundle = CFBundleCreate(kCFAllocatorDefault, NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework"))
		
		// Get a Swift function for MRMediaRemoteGetNowPlayingInfo
		guard let MRMediaRemoteGetNowPlayingInfoPointer = CFBundleGetFunctionPointerForName(bundle, "MRMediaRemoteGetNowPlayingInfo" as CFString) else { return }
		typealias MRMediaRemoteGetNowPlayingInfoFunction = @convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void
		let MRMediaRemoteGetNowPlayingInfo = unsafeBitCast(MRMediaRemoteGetNowPlayingInfoPointer, to: MRMediaRemoteGetNowPlayingInfoFunction.self)
		
//		var nowPlayingInfo: [String: Any] = [:];
		
//		let queueGroup = DispatchGroup()
		
		// Get song info
		await MRMediaRemoteGetNowPlayingInfo(DispatchQueue.main, { (information) in
			//			let bundleInfo = Dynamic._MRNowPlayingClientProtobuf.initWithData(information["kMRMediaRemoteNowPlayingInfoClientPropertiesData"])
			
//			information.keys.forEach { key in
//				queueGroup.enter()
//
//				if let range = key.range(of: "kMRMediaRemoteNowPlayingInfo") {
//					defer { queueGroup.leave() }
//
//					// remove kMRMediaRemoteNowPlayingInfo from key value
//					let cleanedKey = String(key[(range.upperBound...)])
//
//					nowPlayingInfo[cleanedKey] = information[key]
//				}
//			}
			
			nowPlayingInfo.info = information
			
			//			print(information)
			//			print("\(information["kMRMediaRemoteNowPlayingInfoTrackNumber"] as! Int) by \(information["kMRMediaRemoteNowPlayingInfoDuration"] as! Double)")
		})
		
		// wait til done getting info
		
//		return nowPlayingInfo
	}
}
