//
//  ViewController.swift
//  factorial performance tests
//
//  Created by Edward Greenaway on 14/3/19.
//  Copyright © 2019 Mongomergy Partners & Associates. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("loaded")

        // Performance tests for three different methods of calculating factorial of N (i.e. N!)
        // We will run each method I iterations to smooth out variations
        // Note that inside a Playground the test results vary between multiple invocations
        //      therefore the results should be treated with caution, nonetheless the approach is sound
        // Written by Ed Greenaway for Swinburne University of Technology CS80020 2019 tutorial 2

        // import Foundation
        // needed for Date and for formating template %n.m float

        // set N the quantity to be factorialised and I the number of test runs iterations ...
        let testN = 20              // 21 overflows, we use 20 to max out the performance
        let testI = 33              // minimum iteration should be a sample of 3 imho
        // TODO: add some statistical treatment(s) & Swift methods and publish as a single line
        // setup variable run start, end, and elapsed times, and the factorial result
        var factN = 0               // initialise to eliminate setup times as variations
        var dateRunStart = Date()   // :NSDate initialised; used for start of run
        var dateRunEnd = Date()     // :NSDate initialised; used for end of run
        var elapsedRunTime = dateRunEnd.timeIntervalSince(dateRunStart) // the run delta
        var elapsedRunTimeSummed :Double  = 0   // date & time held internally as a Double
        var elapsedRunTimeAverage :Double = 0

        // First method - recursion using IF {} ELSE {} statement .....
        func factorialM1(_ i: Int) -> Int {
            if  i > 1   {return(i*factorialM1(i-1))}
            else        {return(i)}             // by returning i rather than 1, we handle 0 and -ives
        }

        print("Method 1 test results")
        elapsedRunTimeSummed = 0
        for _ in 1...testI {
            dateRunStart = Date()
            factN = factorialM1(testN)
            dateRunEnd = Date()
            elapsedRunTime = dateRunEnd.timeIntervalSince(dateRunStart)
            elapsedRunTimeSummed = elapsedRunTimeSummed + elapsedRunTime
        }
        elapsedRunTimeAverage = elapsedRunTimeSummed / Double(testI)
        print(String(format: "\(testN)! = \(factN) took %1.9f seconds", elapsedRunTimeAverage))
        // %1.9% bridges to foundation Objective-C formatting

        // Second method  - recursion using GUARD ELSE {} statement .....
        func factorialM2(_ i: Int) -> Int {
            guard i > 1 else {return(i)}        // by returning i rather than 1, we handle 0 and -ives
            return(i*factorialM2(i-1))
        }

        print("Method 2 test results")
        elapsedRunTimeSummed = 0
        for _ in 1...testI {
            dateRunStart = Date()
            factN = factorialM2(testN)
            dateRunEnd = Date()
            elapsedRunTime = dateRunEnd.timeIntervalSince(dateRunStart)
            elapsedRunTimeSummed = elapsedRunTimeSummed + elapsedRunTime
        }
        elapsedRunTimeAverage = elapsedRunTimeSummed / Double(testI)
        print(String(format: "\(testN)! = \(factN) took %1.9f seconds", elapsedRunTimeAverage))

        // Third method  - recursion using inline implicit if ? then : else statement .....
        func factorialM3(_ i: Int) -> Int {
            return i > 1 ? i*factorialM3(i-1) : i
            // by returning i rather than 1, we handle 0 and -ives
        }

        print("Method 3 test results")
        elapsedRunTimeSummed = 0
        for _ in 1...testI {
            dateRunStart = Date()
            factN = factorialM3(testN)
            dateRunEnd = Date()
            elapsedRunTime = dateRunEnd.timeIntervalSince(dateRunStart)
            elapsedRunTimeSummed = elapsedRunTimeSummed + elapsedRunTime
        }
        elapsedRunTimeAverage = elapsedRunTimeSummed / Double(testI)
        print(String(format: "\(testN)! = \(factN) took %1.9f seconds", elapsedRunTimeAverage))

        // END OF FACTORIAL METHODS' PERFORMANCE TESTS
    }


}

