//
//  ContentView.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 8/31/23.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			Text("Spotify Now Playing")
			
			Button(action: {
				let _ = print(SpotifyAPI.getTitle() + " oh")
			}, label: {
				Image(systemName: "play.fill")
					.foregroundColor(.primary)
			}).buttonStyle(PlainButtonStyle())
		}
		.frame(width: 300, height: 300)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
