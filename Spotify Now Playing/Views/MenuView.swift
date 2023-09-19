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
				Image(nsImage: NSImage(data: SpotifyAPI.getCover()! as Data) ?? NSImage(imageLiteralResourceName: "placeholderAlbumCover"))
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 50, height: 50)
					.cornerRadius(3)
				
				// title, artist, album name
				VStack(alignment: .leading) {
					//Text(nowPlayingInfo.info["kMRMediaRemoteNowPlayingInfoTitle"] as! String)
					Text(SpotifyAPI.getTitle())
						.font(.system(size: 13, weight: .semibold, design: .default)).lineLimit(2)
					
					// artist and album
					let npArtist = SpotifyAPI.getArtist()
					let npAlbum = SpotifyAPI.getAlbum()
					
					Text(npArtist + " - " + npAlbum)
						.font(.system(size: 11, weight: .none, design: .default))
						.lineLimit(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
				}.padding(2)
				//.frame(width: 160, alignment: .leading)
				
				Spacer()
				
				// like button
				Button(action: {}, label: {
					Image(systemName: "heart").foregroundColor(.primary)
				})
				.buttonStyle(PlainButtonStyle())
				.padding(.trailing)
		
			}.padding(14).frame(maxWidth: .infinity)
			
			Spacer()
			
			// playhead and songlength thingy
			
			// skip pause play buttons
			HStack {
				// 25 px
				Button(action: {
					
					SpotifyAPI.toPreviousTrack()
					
				}, label: {
					Image(systemName: "backward.fill").foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
				
				// 39 px
				Button(action: {
					SpotifyAPI.toPlayPause()
				}, label: {
					Image(systemName: "play.fill")
						.foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
				
				// 25 px
				Button(action: {
					SpotifyAPI.toNextTrack()
				}, label: {
					Image(systemName: "forward.fill").foregroundColor(.primary)
				}).buttonStyle(PlainButtonStyle())
			}.padding()
		}
		// height needs to be increased for shuffle and loop buttons
		.frame(width: 300, height: 142)
	}
}

struct MenuView_Previews: PreviewProvider {
	static var previews: some View {
		MenuView(nowPlayingInfo: NowPlayingInfo())
	}
}
