//
//  HomeVC.swift
//  SideMenuBarSample
//
//  Created by RadhaKrishna Vajjha on 14/04/22.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailContainerView: UIView!
    @IBOutlet weak var detailContainerContentView: UIView!
    @IBOutlet weak var sideMenuContainerView: UIView!
    @IBOutlet weak var sideMenuWidth: NSLayoutConstraint!
    
    var maxLeftMenuWidth = 500.0
    var minLeftMenuWidth = 170.0
    var mainCategories = [String]()
    var mainImages = [String]()
    var currentSelectedController: UIViewController? = nil
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestuers()
        mainCategories = ["Search","Home","Watch Live","Listen","Shows","Topics", "Settings"]
        mainImages = ["iconSearch","iconHome","iconLive","iconListen","iconShows","iconTopics", "iconSettings"]
        setUpTableView()
    }
    
    func addGestuers() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwiped(_:)))
        swipeRecognizer.direction = .right
        self.view.addGestureRecognizer(swipeRecognizer)
        
        let leftswipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwiped(_:)))
        leftswipeRecognizer.direction = .left
        self.view.addGestureRecognizer(leftswipeRecognizer)
        
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwiped(_:)))
        downSwipeRecognizer.direction = .down
        self.view.addGestureRecognizer(downSwipeRecognizer)
    }
    
    @objc func leftSwiped(_ gesture:UIGestureRecognizer) {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews) {
                self.sideMenuWidth.constant = self.minLeftMenuWidth
                self.view.layoutIfNeeded()
            } completion: { isSuccess in
                let indexpath = IndexPath(row: self.selectedRow, section: 0)
                let prevCell = self.tableView.cellForRow(at: indexpath) as! LeftMenuTableViewCell
                prevCell.lblSeparator.isHidden = false
                if self.isSideMenuExpanded() {
                    prevCell.lblSeparator.isHidden = true
                }
            }
        }
    }
    
    @objc func rightSwiped(_ gesture:UIGestureRecognizer) {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews) {
                self.sideMenuWidth.constant = self.maxLeftMenuWidth
                let indexpath = IndexPath(row: self.selectedRow, section: 0)
                let prevCell = self.tableView.cellForRow(at: indexpath) as! LeftMenuTableViewCell
                prevCell.lblSeparator.isHidden = false
                if self.isSideMenuExpanded() {
                    prevCell.lblSeparator.isHidden = true
                }
                self.view.layoutIfNeeded()
            } completion: { isSuccess in
                
            }
        }
    }
    
    func showWatchLiveScreen(_ watchLiveVC : LiveViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    func showSettingsScreen(_ watchLiveVC : SettingsViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    func showTopicsScreen(_ watchLiveVC : TopicsViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    func showSearchScreen(_ watchLiveVC : SearchViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    func showShowsScreen(_ watchLiveVC : ShowsViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    func showListenScreen(_ watchLiveVC : ListenViewController)-> Void {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if let currentDetailVC = self.currentSelectedController {
            currentDetailVC.view.removeFromSuperview()
            currentDetailVC.removeFromParent()
        }
        watchLiveVC.view.frame = self.detailContainerContentView.bounds
        watchLiveVC.view.backgroundColor = UIColor.clear
        self.detailContainerContentView.addSubview(watchLiveVC.view)
        self.addChild(watchLiveVC)
        self.currentSelectedController = watchLiveVC
    }
    
    @objc func downSwiped(_ gesture:UIGestureRecognizer) {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0, options: .layoutSubviews) {
                self.sideMenuWidth.constant = self.minLeftMenuWidth
                self.view.layoutIfNeeded()
            } completion: { isSuccess in
                let indexpath = IndexPath(row: self.selectedRow, section: 0)
                let prevCell = self.tableView.cellForRow(at: indexpath) as! LeftMenuTableViewCell
                prevCell.lblSeparator.isHidden = false
                if self.isSideMenuExpanded() {
                    prevCell.lblSeparator.isHidden = true
                }
            }
        }
    }
    
    func isSideMenuExpanded() -> Bool {
        debugPrint("TVDashboard Function: \(#function), line: \(#line)")
        if self.sideMenuWidth.constant == self.minLeftMenuWidth {
            return false
        } else {
            return true
        }
    }
    
    func setUpTableView() {
        tableView.register(UINib(nibName: "LeftMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "leftMenuTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: ————-TableView Delegate and Datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCategories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftMenuTableViewCell", for: indexPath) as? LeftMenuTableViewCell else { return UITableViewCell() }
        cell.lblHeader?.text = "\( mainCategories[indexPath.row] )"
        cell.imgLeft.image = UIImage(named: "\(mainImages[indexPath.row])")?.withRenderingMode(.alwaysTemplate)
        cell.imgLeft.tintColor = UIColor.white
        cell.lblSeparator.isHidden = true
        if isSideMenuExpanded() {
            cell.lblHeader.isHidden = false
        } else {
            cell.lblHeader.isHidden = true
        }
        cell.focusStyle = .custom
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print (indexPath.item)
        print( mainCategories[indexPath.item] )
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.item)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selectedValue = mainCategories[indexPath.row]
        switch selectedValue {
        case "Search":
            let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            self.showSearchScreen(searchVC)
        case "Home":
            let showsVC = storyboard.instantiateViewController(withIdentifier: "ShowsViewController") as! ShowsViewController
            self.showShowsScreen(showsVC)
        case "Watch Live":
            let liveVC = storyboard.instantiateViewController(withIdentifier: "LiveViewController") as! LiveViewController
            self.showWatchLiveScreen(liveVC)
        case "Listen":
            let showsVC = storyboard.instantiateViewController(withIdentifier: "ListenViewController") as! ListenViewController
            self.showListenScreen(showsVC)
        case "Shows":
            let showsVC = storyboard.instantiateViewController(withIdentifier: "ShowsViewController") as! ShowsViewController;
            self.showShowsScreen(showsVC)
        case "Topics":
            let showsVC = storyboard.instantiateViewController(withIdentifier: "TopicsViewController") as! TopicsViewController;
            self.showTopicsScreen(showsVC)
        case "Settings":
            let showsVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            self.showSettingsScreen(showsVC)
        default:
            break
            
        }
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prevIndexPath = context.previouslyFocusedIndexPath {
            let prevCell = tableView.cellForRow(at: prevIndexPath) as! LeftMenuTableViewCell
            context.previouslyFocusedView?.backgroundColor = UIColor.clear
            prevCell.lblHeader.textColor = UIColor.white
            prevCell.imgLeft.tintColor = UIColor.white
            prevCell.lblSeparator.isHidden = true
            
        }
        
        if let nextIndexPath = context.nextFocusedIndexPath {
            let nextCell = tableView.cellForRow(at: nextIndexPath) as! LeftMenuTableViewCell
            context.nextFocusedView?.backgroundColor = UIColor(red: 0.0/255.0, green: 123.0/255.0, blue: 253.0/255.0, alpha: 1)
            nextCell.lblHeader.textColor = UIColor.white
            nextCell.imgLeft.tintColor = UIColor.white
            selectedRow = nextIndexPath.row
            if isSideMenuExpanded() {
                nextCell.lblSeparator.isHidden = true
            } else {
                nextCell.lblSeparator.isHidden = false
            }
        }
    }
}
