//
//  FibonacciTableView.swift
//  Fibonacci
//
//  Created by Richard Nelson on 8/21/16.
//  Copyright © 2016 Richard Nelson. All rights reserved.
//

import Foundation
import UIKit

class FibonacciTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var upperBound = 100
    var fibArray : [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFibArray()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upperBound
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FibCell", forIndexPath: indexPath) as! FibCell
        let value = String(fibArray[indexPath.row])
        cell.label.text = value
        let countString = "n = " + String(indexPath.row + 1)
        cell.numberLabel.text = countString
        return cell
    }
    
    func memoize<T: Hashable, U>(body: ((T)->U, T) -> U) -> (T)->U {
        var memo = [T: U]()
        var result: ((T)->U)!
        result = { x in
            if let q = memo[x] { return q }
            let r = body(result, x)
            memo[x] = r
            return r
        }
        return result
    }
    
    func setFibArray() -> Void {
        let fib = memoize { (fibonacci:Int->Double,n:Int) in n < 2 ? Double(n) : fibonacci(n-1) + fibonacci(n-2) }
        
        for n in 1...upperBound {
            fibArray.append(fib(n))
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

class IntroViewController : UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var fibonacciUpperBound : Int = 100
    
    override func viewDidLoad() {
        textField.keyboardType = UIKeyboardType.NumberPad
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if Int(textField.text!)! > 1476 {
            textField.text = "1476"
            let alertController = UIAlertController(title: "Number Too Large", message: "The 'Double' data type has a max value of ~1.79 * 10^308. All numbers larger than that are treated as 'inf.' Without a custom 'BigNumber' library, the highest Fibonacci number we can get a real value for is the 1476th number in the Fibonacci sequence.", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in }
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true) {}
        } else {
            self.performSegueWithIdentifier("FibTableView", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let fibViewController = segue.destinationViewController as! FibonacciTableViewController
        fibViewController.upperBound = Int(textField.text!)!
    }
}

class FibCell : UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
}