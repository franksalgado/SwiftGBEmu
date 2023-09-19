//
//  PictureProcessingUnit.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 8/26/23.
//

import Foundation

struct OAMSpriteAttributes {
    var y: UInt8;
    var x: UInt8;
    var tileIndex: UInt8;
    var attributesAndFlags: UInt8;
}

struct PPU {
    var OAMSprite: [OAMSpriteAttributes] = Array<OAMSpriteAttributes>(repeating: OAMSpriteAttributes(y: 0, x: 0, tileIndex: 0, attributesAndFlags: 0), count: 40);
    var vram: [UInt8] = Array<UInt8>(repeating: 0, count: 0x2000);
    var currentFrame: UInt32 = 0;
    var lineTicks: UInt32 = 0;
    
    mutating func PPUOAMWrite(address: UInt16, value: UInt8) -> Void {
        var sprite = address;
        if address >= 0xFE00 {
            sprite -= 0xFE00;
        }
        sprite /= 4;
        switch address & 0b11 {
        case 0:
            OAMSprite[Int(sprite)].y = value;
        case 1:
            OAMSprite[Int(sprite)].x = value;
        case 2:
            OAMSprite[Int(sprite)].tileIndex = value;
        case 3:
            OAMSprite[Int(sprite)].attributesAndFlags = value;
        default:
            print("Invalid PPUOAM write");
            exit(-5);
        }
    }
}
