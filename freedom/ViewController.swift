//
//  ViewController.swift
//  freedom
//
//  Created by limao on 2017/3/22.
//  Copyright © 2017年 MarcoLi. All rights reserved.
//

import UIKit
import NetworkExtension

class ViewController: ASViewController<ASDisplayNode> {
    
    let tableNode = ASTableNode()
    let model = [MainItem.init(title: "hellohellohellohellohellohellohellohello", subTitle: "worldworldworldworldworldworldworldworldworldworld")]
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init() {
        super.init(node: tableNode)
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewController: ASTableDelegate {
    
}
extension ViewController: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return MainCellNode(item: model[indexPath.row])
    }
}

class MainCellNode: ASCellNode {
    
    let title =  ASTextNode()
    let subtitle = ASTextNode()
    
    init(item: MainItem) {
        super.init()
        self.automaticallyManagesSubnodes = true
        title.attributedText = NSAttributedString.init(string: item.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.blue])
        subtitle.attributedText = NSAttributedString.init(string: item.subTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.blue])
        
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hss = ASStackLayoutSpec.init(direction: .horizontal, spacing: 10.0, justifyContent: .spaceBetween, alignItems: .baselineFirst, children: [title, subtitle])
        
        title.style.flexShrink = 1.0
        title.style.maxWidth =  ASDimensionMake(100.0)
        subtitle.style.flexShrink = 1.0
        
        return ASInsetLayoutSpec.init(insets: UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8), child: hss)
    }
    
    
    override func didLoad() {
        title.backgroundColor = UIColor.red
        subtitle.backgroundColor = UIColor.brown
    }
}

class MainItem: NSObject {
    var title: String! = ""
    var subTitle = ""
    
    init(title: String, subTitle: String) {
        super.init()
        self.title = title
        self.subTitle = subTitle
    }
    
}


