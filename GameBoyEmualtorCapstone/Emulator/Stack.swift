//
//  Stack.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/20/23.
//

import Foundation

struct Stack {
    private var stack: [UInt8] = [];
    mutating func push(number: UInt8) {
        stack.append(number);
    }
    
    mutating func pop() -> UInt8 {
        guard !stack.isEmpty
        else {
            fatalError("empty queue");
        }
        return stack.removeLast();
    }
    
    var totalElements: Int {
        return stack.count;
    }
    
    mutating func StackPush(data: UInt8) -> Void {
        //CPUStateInstance.registersState.sp &-= 1;
        push(number: data);
    }
    //First we push the high byte to the stack so we just shift right 8 bits and convert to UInt8.
    //Next we shift the bottom 8 bits of data to the right 8 and back 8. This gives us 8 0s in the high byte and the low byte.
    mutating func StackPush16Bit(data: UInt16) -> Void {
        let highByte = UInt8(data >> 8);
        let lowByte = UInt8( (data << 8) >> 8 )
        push(number: highByte);
        push(number: lowByte);
    }
    mutating func StackPop() -> UInt8 {
        //CPUStateInstance.registersState.sp += 1;
        return pop()
    }

    mutating func StackPop16Bit() -> UInt16 {
        let lowByte: UInt16 = UInt16(pop());
        let highByte: UInt16 = UInt16(pop()) << 8;
        return highByte | lowByte;
    }

}



