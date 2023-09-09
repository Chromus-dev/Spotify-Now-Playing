//
//  MenuView.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 8/31/23.
//

import SwiftUI

struct MenuView: View {
	@ObservedObject var nowPlayingInfo: NowPlayingInfo
	
	var body: some View {
		VStack {
			
			HStack {
				// album cover
//				let artworkNSImage = NSImage(data: nowPlayingInfo.info["kMRMediaRemoteNowPlayingInfoArtworkData"] as! Data)
//				Image(nsImage: artworkNSImage!)'
				Image("TestArtwork")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 50, height: 50)
					.cornerRadius(3)
				
				// title, artist, album name
				VStack {
					Text(nowPlayingInfo.info["kMRMediaRemoteNowPlayingInfoTitle"] as! String)
						.font(.system(size: 13, weight: .semibold, design: .default))
					
					// artist and album
					let npArtist = nowPlayingInfo.info["kMRMediaRemoteNowPlayingInfoArtist"] as! String
					let npAlbum = nowPlayingInfo.info["kMRMediaRemoteNowPlayingInfoAlbum"] as! String
					
					Text(npArtist + " - " + npAlbum)
						.font(.system(size: 11, weight: .none, design: .default))
				}
				
				Spacer()
			}.padding(14).frame(maxWidth: .infinity)
			
			
			
			// playhead and songlength thingy
			
			// skip pause play buttons
			HStack {
				// 25 px
				Button(action: {}, label: {
					Image(systemName: "backward.fill").foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
				
				// 39 px
				Button(action: {}, label: {
					Image(systemName: "play.fill")
						.foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
				
				// 25 px
				Button(action: {}, label: {
					Image(systemName: "forward.fill").foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
			}.padding()
		}
		.frame(width: 300, height: 142)
	}
}

struct MenuView_Previews: PreviewProvider {
//	npi.info["kMRMediaRemoteNowPlayingInfoArtworkData"] =
	
	static var previews: some View {
		MenuView(nowPlayingInfo: NowPlayingInfo())
	}
}
