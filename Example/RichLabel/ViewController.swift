//
//  ViewController.swift
//  RichLabel
//
//  Created by fengming on 05/10/2023.
//  Copyright (c) 2023 fengming. All rights reserved.
//

import UIKit
import RichLabel

class ViewController: UIViewController {
    
    let label1 = RichLabel()
    let label2 = RichLabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        

        label1.frame = CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 300)
        view.addSubview(label1)
        
        label2.frame = CGRect(x: 20, y: label1.frame.maxY + 20, width: view.frame.width - 40, height: 300)
        view.addSubview(label2)
        
        setup1()
        
        setup2()
    }

    func setup1() {
        let customType = RichType.custom(pattern: "\\sare\\b") //Looks for "are"
        let customType2 = RichType.custom(pattern: "\\sit\\b") //Looks for "it"
        let customType3 = RichType.custom(pattern: "\\ssupports\\b") //Looks for "supports"

        label1.enabledTypes.append(customType)
        label1.enabledTypes.append(customType2)
        label1.enabledTypes.append(customType3)

        label1.urlMaximumLength = 31

        label1.customize { label in
            label.text = "This is a post with #multiple #hashtags and a @userhandle. Links are also supported like" +
            " this one: http://optonaut.co. Now it also supports custom patterns -> are\n\n" +
                "Let's trim a long link: \nhttps://twitter.com/twicket_app/status/649678392372121601"
            label.numberOfLines = 0
            label.lineSpacing = 4
            
            label.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
            label.hashtagColor = UIColor(red: 85.0/255, green: 172.0/255, blue: 238.0/255, alpha: 1)
            label.mentionColor = UIColor(red: 238.0/255, green: 85.0/255, blue: 96.0/255, alpha: 1)
            label.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            label.URLSelectedColor = UIColor(red: 82.0/255, green: 190.0/255, blue: 41.0/255, alpha: 1)

            label.handleMentionTap { self.alert("Mention", message: $0) }
            label.handleHashtagTap { self.alert("Hashtag", message: $0) }
            label.handleURLTap { self.alert("URL", message: $0.absoluteString) }
            label.handleOutsideTap { self.alert("Custom type", message: "handleOutsideTap") }
            //Custom types

            label.customColor[customType] = UIColor.purple
            label.customSelectedColor[customType] = UIColor.green
            label.customColor[customType2] = UIColor.magenta
            label.customSelectedColor[customType2] = UIColor.green
            
            label.configureLinkAttribute = { (type, attributes, isSelected) in
                var atts = attributes
                switch type {
                case customType3:
                    atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.boldSystemFont(ofSize: 14)
                default: ()
                }
                
                return atts
            }

            label.handleCustomTap(for: customType) { self.alert("Custom type", message: $0) }
            label.handleCustomTap(for: customType2) { self.alert("Custom type", message: $0) }
            label.handleCustomTap(for: customType3) { self.alert("Custom type", message: $0) }
        }
        
    }
    func setup2() {
        
        let customType = RichType.custom(pattern: "当事人") //Looks for "are"
        let customType2 = RichType.custom(pattern: "工资") //Looks for "it"
        let customType3 = RichType.custom(pattern: "救命") //Looks for "supports"

        label2.enabledTypes.append(customType)
        label2.enabledTypes.append(customType2)
        label2.enabledTypes.append(customType3)

        label2.urlMaximumLength = 31

        label2.customize { label in
            label.text = "长沙占车位事件当事人：局面失控人民币为何跌到7门前2022年城镇平均工资出炉多家挖呀挖公司注册成立承重墙被砸楼栋住户:指着房子救命呢热被辱骂致死女大学生父亲发声 https://www.baidu.com"
            label.numberOfLines = 0
            label.lineSpacing = 4
            
            label.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
            label.hashtagColor = UIColor(red: 85.0/255, green: 172.0/255, blue: 238.0/255, alpha: 1)
            label.mentionColor = UIColor(red: 238.0/255, green: 85.0/255, blue: 96.0/255, alpha: 1)
            label.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            label.URLSelectedColor = UIColor(red: 82.0/255, green: 190.0/255, blue: 41.0/255, alpha: 1)

            label.handleMentionTap { self.alert("Mention", message: $0) }
            label.handleHashtagTap { self.alert("Hashtag", message: $0) }
            label.handleURLTap { self.alert("URL", message: $0.absoluteString) }

            //Custom types

            label.customColor[customType] = UIColor.purple
            label.customSelectedColor[customType] = UIColor.green
            label.customColor[customType2] = UIColor.magenta
            label.customSelectedColor[customType2] = UIColor.green
            
            label.configureLinkAttribute = { (type, attributes, isSelected) in
                var atts = attributes
                switch type {
                case customType3:
                    atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.boldSystemFont(ofSize: 14)
                default: ()
                }
                
                return atts
            }

            label.handleCustomTap(for: customType) { self.alert("Custom type", message: $0) }
            label.handleCustomTap(for: customType2) { self.alert("Custom type", message: $0) }
            label.handleCustomTap(for: customType3) { self.alert("Custom type", message: $0) }
            label.handleOutsideTap {
                self.alert("Custom type", message: "handleOutsideTap")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}

