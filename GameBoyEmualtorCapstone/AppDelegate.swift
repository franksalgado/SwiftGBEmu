//
//  AppDelegate.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/3/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var url = GetFileURL()
        var romdata = GetROMData(fileURL: url!)
        var cartheader = CartridgeHeader(romData: romdata!)
        var cartridge = Cartridge(fileURL: url!, cartridgeHeader: cartheader, romData: romdata!)
        var gameboy = GameBoy(cartridge: cartridge);
        gameboy.startGameBoy();
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
}
