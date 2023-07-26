//
//  Common.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/3/23.
//

import Foundation

typealias U8 = UInt8;
typealias U16 = UInt16;
typealias U32 = UInt32;

let ZFlag: UInt8 = 7;
let NFlag: UInt8 = 6;
let HFlag: UInt8 = 5;
let CFlag: UInt8 = 4;

func isBitSet(bitPosition: UInt8, in value: UInt8) -> Bool {
    let mask: UInt8 = 1 << bitPosition;
    return (value & mask) != 0;
}

func IsZero(value: UInt8) -> UInt8 {
    return (value == 0 ? 1 : 0);
}
