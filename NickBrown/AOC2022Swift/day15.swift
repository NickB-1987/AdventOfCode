//
//  day15.swift
//  AOC2022Swift
//
//  Created by Nick Brown on 15/12/2022.
//

import Foundation

struct Sensor{
    let sx: Int
    let sy: Int
    let bx: Int
    let by: Int
    let distance: Int


    init(_ sensorData: [Int]){
        (self.sx, self.sy, self.bx, self.by) = (sensorData[0], sensorData[1], sensorData[2], sensorData[3])
        distance = abs(sx - bx) + abs(sy - by)
    }
    func pt1(_ row: Int)->[[Int]]{
        var ans: [[Int]] = []
        let xdiff: Int = distance - abs(row - sy)
        if xdiff <= 0{
            return ans
        }
        for i in sx - xdiff...sx + xdiff{
            ans.append([i, row])
        }
        return ans
    }
}

class Day15: AdventOfCodeDay{
    var sensors: [Sensor] = []
    var part1ans: Int = 0
    
    override init(_ input_filename: String, _ split: String) {
        super.init(input_filename, split)
        for line in data{
            let split = line.components(separatedBy: ":").map { $0.components(separatedBy: ", ") }.map { [$0[0].components(separatedBy: "="), $0[1].components(separatedBy: "=")] }
            sensors.append(Sensor([split[0][0][1], split[0][1][1], split[1][0][1], split[1][1][1]].map { Int($0)! }))
        }
    part1ans = part1(2000000)
    }
    func part1(_ row: Int)->Int{
        var noBeaconPoints: Set<[Int]> = Set(sensors.flatMap { $0.pt1(row) })
        let beacons = sensors.map { [$0.bx, $0.by] }
        return noBeaconPoints.count - noBeaconPoints.intersection(beacons).count
    }
    
}
