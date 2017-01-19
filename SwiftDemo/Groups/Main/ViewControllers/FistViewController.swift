//
//  FistViewController.swift
//  SwiftDemo
//
//  Created by zhoutong on 16/11/18.
//  Copyright © 2016年 zhoutong. All rights reserved.
//

import UIKit


class FistViewController: BaseViewController {

    fileprivate let CellIdentifierClass = "cellId"
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setUpView()

    }
    override func layoutPageSubViews() {
        self.demoTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
    
}
extension FistViewController{

    func setUpView() {
        self.title = "第一页面"
        self.view.addSubview(self.demoTableView)
        self.demoTableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifierClass)
    }

}
extension FistViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifierClass)!
        cell.textLabel?.numberOfLines = 0
        
        if(indexPath.row == 0){
            cell.textLabel?.text = "简单的tableview\n下拉刷新，上拉加载 \n网络数据请求 \n网络加载图片"
        }else if(indexPath.row == 1){
            cell.textLabel?.text = "自定义 NavigationBar 左右按钮"
        }else{
            cell.textLabel?.text = ""
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let listVC = ListViewController()
            listVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(listVC, animated: true)
        }
    }
}
