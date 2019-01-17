//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count == 1 {
            let possibleInt = Int(args[0])
            return possibleInt == nil ? 0 : possibleInt!;
        } else if args.count == 0 {
            return 0
        }
        
        switch args.last {
        case "fact":
            if let x = Int(args[0]) {return fact(x)}
            return 0
        case "avg":
            let nums = Array(args.prefix(args.count - 1)).compactMap { Int($0)}
            return avg(nums)
        case "count":
            let nums = Array(args.prefix(args.count - 1)).compactMap { Int($0)}
            return count(nums)
        default:
            break
        }
        
        if (args.count) == 3 {
            switch args[1] {
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "%":
                let numer = Int(args[0])!
                let denom = Int(args[2])!
                let fits = numer / denom
                return numer - (fits * denom)
            default:
                break
            }
            
        }
        return 0
        
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    private func fact(_ num : Int) -> Int {
        var result = 1
        if num > 1 {
            for i in 2...num {
                result *= i
            }
        }
        return result
    }
    
    private func avg(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var sum = 0
        for num in nums {
            sum += num
        }
        return sum / nums.count
    }
    
    
    private func count(_ nums: [Int]) -> Int {
        return nums.count
    }
    
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

