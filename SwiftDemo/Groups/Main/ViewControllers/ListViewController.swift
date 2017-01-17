//
//  ListViewController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/18.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit
import SwiftyJSON
import PKHUD
import Kingfisher

class ListViewController: BaseViewController {

    fileprivate let CellIdentifierClass = "cellId"
    var json:JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "list view"
        self.view.addSubview(self.demoTableView)
        
        self.demoTableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifierClass)
    
        loadData()//加载
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func loadData(){
//       HUD.show(HUDContentType.progress)
        ApiManager.sharedInstance.getListData(success: { (value) in
            PKHUD.sharedHUD.hide()
            
//            HUD.hide()
            
            self.json = JSON(value)
            self.demoTableView.reloadData()
            
        }) { (error) in
            
        }
    }
    lazy var demoTableView:UITableView = {
        let _demoTableView = UITableView.init(frame: CGRect(x:0,y:0,width:0,height:0), style: UITableViewStyle.plain)
        _demoTableView.backgroundColor = UIColor.clear
        _demoTableView.dataSource = self
        _demoTableView.delegate = self
        
        let v:UIView = UIView.init(frame: CGRect.zero)
        _demoTableView.tableFooterView = v
        return _demoTableView
    }()
    
    override func layoutPageSubViews() {
        self.demoTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
        
    }
    
    
}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json["data"].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierClass)!
        
        let anchor_city = self.json["data"][indexPath.row]["anchor_city"]
        let avatar_small = self.json["data"][indexPath.row]["avatar_small"]
        let str_avatar_small:String = avatar_small.string == nil ? "" : avatar_small.string!
        
        cell.textLabel?.text = anchor_city.string
        cell.imageView?.kf.setImage(with: URL.init(string: str_avatar_small), placeholder: UIImage.init(named: "tab_find_selected"), options: nil, progressBlock: nil, completionHandler: nil)
        return cell
    }
}
