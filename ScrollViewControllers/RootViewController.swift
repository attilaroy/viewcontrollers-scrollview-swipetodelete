//
//  RootViewController.swift
//  ScrollViewControllers
//
//  Created by ATTILA ROY on 25/05/17.

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    var viewController1 = ViewController1()
    var viewController2 = ViewController2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        viewController1 = self.storyboard?.instantiateViewController(withIdentifier: "VC1") as! ViewController1
        viewController2 = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! ViewController2
        scrollView.frame = viewController1.view.frame
        
        self.scrollView.addSubview(viewController1.view)
        viewController1.willMove(toParentViewController: self)
        self.addChildViewController(viewController1)
        
        self.scrollView.addSubview(viewController2.view)
        viewController2.willMove(toParentViewController: self)
        self.addChildViewController(viewController2)
        
        viewController1.view.frame.origin =  CGPoint(x: 0, y: 0)
        viewController2.view.frame.origin =  CGPoint(x: UIScreen.main.bounds.width, y: 0)
        self.scrollView.contentOffset.x = 0
        configureSwipe()
        
        self.scrollView.contentSize = CGSize(width: 2*UIScreen.main.bounds.width, height: 0)
    }
    
    func configureSwipe() {
        scrollView.isScrollEnabled = false
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(RootViewController.view2Action(_:)))
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        scrollView.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(RootViewController.view1Action(_:)))
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.right
        scrollView.addGestureRecognizer(swipeGestureRight)
    }
    
    @IBAction func view1Action(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.35) {
            self.scrollView.contentOffset.x = 0
        }
    }
    
    @IBAction func view2Action(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.35) {
            self.scrollView.contentOffset.x = UIScreen.main.bounds.width
        }
    }
    
}
