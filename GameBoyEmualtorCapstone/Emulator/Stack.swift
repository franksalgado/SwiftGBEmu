//
//  Stack.swift
//  GameBoyEmualtorCapstone
//
//  Created by Frank Salgado on 7/20/23.
//

import Foundation

class Stack {
    private var stack: [UInt8] = [];
    func push(number: UInt8) {
        stack.append(number);
    }
    
    func pop() -> UInt8 {
        guard !stack.isEmpty
        else {
            fatalError("empty queue");
        }
        return stack.removeLast();
    }
    
    var totalElements: Int {
        return stack.count;
    }
    
    func StackPush(data: UInt8) -> Void {
        //CPUStateInstance.registersState.sp &-= 1;
        self.push(number: data);
    }
    //First we push the high byte to the stack so we just shift right 8 bits and convert to UInt8.
    //Next we shift the bottom 8 bits of data to the right 8 and back 8. This gives us 8 0s in the high byte and the low byte.
    func StackPush16Bit(data: UInt16) -> Void {
        let highByte = UInt8(data >> 8);
        let lowByte = UInt8( (data << 8) >> 8 )
        self.push(number: highByte);
        self.push(number: lowByte);
    }
    func StackPop() -> UInt8 {
        //CPUStateInstance.registersState.sp += 1;
        return self.pop()
    }

    func StackPop16Bit() -> UInt16 {
        let lowByte: UInt16 = UInt16(self.pop());
        let highByte: UInt16 = UInt16(self.pop()) << 8;
        return highByte | lowByte;
    }

}



