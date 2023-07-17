//
//  Cartridge.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/3/23.
//

import Foundation
import AppKit

/*
 The Cartridge Header contains game information
 and cartridge hardware information. This data is
 stored at address 0x100 - 0x14F.
 Hardware information will help us determine how
 to properly emuate the game (Memory Bank Controllers).
 */

struct CartridgeHeader {
    let title: String;
    let cartridgeType: (U8, String?);
    let romSize: U32;
    //let ramSize: U8;
    init(romData: [U8]) {
        self.title = CartridgeHeader.getTitle(romData: romData);
        self.cartridgeType = CartridgeHeader.getCartridgeType(romData:
                                                                romData);
        self.romSize = CartridgeHeader.getROMSize(romData: romData);
    }
    
    static func getTitle(romData: [U8]) -> String {
        let titleBytes = 0x134...0x143;
        return String(bytes: romData[titleBytes],
                      encoding: .ascii) ?? "NO TITLE";
    }
    
    static func getCartridgeType(romData: [U8]) -> (U8, String?) {
        let cartridgeType: U8 = romData[0x147];
        return (cartridgeType, CartridgeTypes[Int(cartridgeType)]);
    }
    
    static func getROMSize(romData: [U8]) -> U32 {
        var sizeInBytes: U32 = 0;
        for _ in romData {
            sizeInBytes += 1;
        }
        return sizeInBytes;
    }
}


let CartridgeTypes: [Int: String] = [
    0x00: "ROM ONLY",
    0x01: "MBC1",
    0x02: "MBC1+RAM",
    0x03: "MBC1+RAM+BATTERY",
    0x05: "MBC2",
    0x06: "MBC2+BATTERY",
    0x08: "ROM+RAM 1",
    0x09: "ROM+RAM+BATTERY 1",
    0x0B: "MMM01",
    0x0C: "MMM01+RAM",
    0x0D: "MMM01+RAM+BATTERY",
    0x0F: "MBC3+TIMER+BATTERY",
    0x10: "MBC3+TIMER+RAM+BATTERY 2",
    0x11: "MBC3",
    0x12: "MBC3+RAM 2",
    0x13: "MBC3+RAM+BATTERY 2",
    0x19: "MBC5",
    0x1A: "MBC5+RAM",
    0x1B: "MBC5+RAM+BATTERY",
    0x1C: "MBC5+RUMBLE",
    0x1D: "MBC5+RUMBLE+RAM",
    0x1E: "MBC5+RUMBLE+RAM+BATTERY",
    0x20: "MBC6",
    0x22: "MBC7+SENSOR+RUMBLE+RAM+BATTERY",
    0xFC: "POCKET CAMERA",
    0xFD: "BANDAI TAMA5",
    0xFE: "HuC3",
    0xFF: "HuC1+RAM+BATTERY"
]

// An individual entry for each of the games in the user library
struct Cartridge {
    let fileURL: URL?;
    let cartridgeHeader: CartridgeHeader?;
    var romData: [U8]?;
}

//This function opens the file directory so the user can get their game.
func GetFileURL() -> URL? {
    let openPanel = NSOpenPanel();
    openPanel.canChooseFiles = true;
    openPanel.canChooseDirectories = false;
    
    guard openPanel.runModal() == .OK else {
        print("User canceled file selection.");
        return nil;
    }
    
    guard let url = openPanel.urls.first else {
        print("No file selected.");
        return nil;
    }
    
    let _ = FileManager()
    do {
        let resourceValues = try url.resourceValues(forKeys: [.isRegularFileKey]);
        if resourceValues.isRegularFile == false {
            print("Selected item is not a regular file.");
            return nil;
        }
    } catch {
        print("Error accessing file information: \(error)");
        return nil;
    }
    
    return url;
}

func GetROMData(fileURL: URL) -> [UInt8]? {
    do {
        let data = try Data(contentsOf: fileURL);
        return [UInt8](data);
    } catch {
        print("Error reading ROM data: \(error)");
        return nil;
    }
}

/*
func CreateCartridgeHeader(romData: [U8]) -> CartridgeHeader {
    return CartridgeHeader(
        title: GetTitle(romData: romData),
        cartridgeType: GetCartridgeType(romData: romData),
        romSize: GetRomSize(romData: romData)
        );
}
*/

//Used to create an entry in the user library
func CreateCartridgeEntry(fileURL: URL) -> Cartridge? {
    guard let romData = GetROMData(fileURL: fileURL) else {
        return nil;
    }
    let cartridgeHeader = CartridgeHeader(romData: romData);
    return Cartridge(
        fileURL: fileURL,
        cartridgeHeader: cartridgeHeader,
        romData: romData
        );
}

struct CartridgeState {
    var romData: [U8];
}

func CartridgeRead(romData: [U8], address: U16) -> U8 {
    return romData[Int(address)];
}

func CartridgeRead(romData: [U8], address: U16) -> Void {
    print("NOT IMPLEMEBNTED")
}

