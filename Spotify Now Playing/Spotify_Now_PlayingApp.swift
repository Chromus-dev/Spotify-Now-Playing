//
//  Spotify_Now_PlayingApp.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 8/31/23.
//

import SwiftUI

class NowPlayingInfo: ObservableObject {
	@Published var info: [String:Any] = ["kMRMediaRemoteNowPlayingInfoTitle": "How Deep Is Your Love but this song is super duper long", "kMRMediaRemoteNowPlayingInfoArtist": "Bee Gees", "kMRMediaRemoteNowPlayingInfoAlbum": "Greatest"]
}

@main
struct Spotify_Now_PlayingApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

