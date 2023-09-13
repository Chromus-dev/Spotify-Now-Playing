//
//  SpotifyAPI.swift
//  Spotify Now Playing
//
//  Created by Chase Crampton on 9/13/23.
//

// https://github.com/fabiusBile/Spotify4BigSur/blob/master/Spotify/SpotifyApi.swift

import Foundation

struct SpotifyAPI {
	static let commandStart = "tell application \"Spotify\" to"
	
	static func getState() ->String{
			return executeScript(phrase: "player state")
		}

		static func getTitle() -> String{
			return executeScript(phrase: "name of current track")
		}
		
		static func getAlbum() -> String{
			return executeScript(phrase: "album of current track")
		}
		
		static func getArtist() -> String{
			return executeScript(phrase: "artist of current track")
		}
		
		static func getCover() -> NSData?{
			
			let url = URL(string:(executeScript(phrase: "artwork url of current track")))
			let result: NSData? = url != nil ? NSData(contentsOf:  url!) : nil
			
			return result
		}
		
		static func getVolume() -> String{
			return executeScript(phrase: "sound volume")
		}
		
		static func setVolume(level: Int){
			executeScript(phrase: "set sound volume to \(level)")
		}
		
		static func toNextTrack(){
			executeScript(phrase: "next track")
		}
		
		static func toPreviousTrack(){
			executeScript(phrase: "previous track")
		}
		
		static func toPlayPause(){
			executeScript(phrase: "playpause")
		}
		
		static func openSpotify(){
			executeScript(phrase: "activate")
		}
		
		static func executeScript(phrase: String) -> String{
			var output = ""
			let script = NSAppleScript(source: "\(commandStart) \(phrase)" )
			var errorInfo: NSDictionary?
			let descriptor = script?.executeAndReturnError(&errorInfo)
			if(descriptor?.stringValue != nil){
				output = descriptor!.stringValue!
			}
			return output
		}
	
	// NOT USED AT THE MOMENT
		static func getDuration() -> String{
			return executeScript(phrase: "duration of current track")
		}
		
		static func getPosition() -> String{
			return executeScript(phrase: "position of current track")
		}
}
