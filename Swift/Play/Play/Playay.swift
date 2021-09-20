//
//  Playay.swift
//  Play
//
//  Created by 박연배 on 2021/07/04.
//


import Foundation

func solution(_ n:Int, _ clockwise:Bool) -> [[Int]] {
    
    var graph = Array(repeating : Array(repeating: 0, count: n), count: n)
    var moveLimit: Int
    if n % 2 == 1 {
        moveLimit = n * n / 4 + 1
    } else {
        moveLimit = n * n / 4
    }
    
    // 시계방향 회전시
    var dx = [1, 0, -1, 0]
    var dy = [0, 1, 0, -1]
    var d = 0
    var q = [[0, 0], [0, n-1], [n-1, 0], [n-1, n-1]]
    
    while q.count > 0 {
        var move = 1
        var node = q.remove(at: 0)
        var x = node[0]
        var y = node[1]
        d = 0
        
        while move != moveLimit {
            var next_x = x + dx[d]
            var next_y = y + dy[d]
            if graph[y][x] == 0 {
                graph[y][x] = move
                move += 1
            }
            if graph[next_y][next_x] == 0 {
                x = next_x
                y = next_y
            } else {
                d = (d + 1) % 4
            }
        }
    }
    print(graph)
    return []
}

solution(6, true)
