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

func isBitSet(bitPosition: UInt8, in value: UInt8) -> Bool {
    let mask: UInt8 = 1 << bitPosition
    return (value & mask) != 0
}
