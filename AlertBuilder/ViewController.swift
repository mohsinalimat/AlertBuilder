//
//  ViewController.swift
//  AlertBuilder
//
//  Created by Okan Yücel on 23.04.2019.
//  Copyright © 2019 Okan Yücel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell? else {
            return UITableViewCell.init(frame: .zero)
        }
        
        cell.textLabel?.text = "style \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let _ = AlertViewBuilder() { (builder) in
                builder.addView(with: AlertSubTitleView.init(titleText: "Summary"), tag: 0, height: 50)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                
                builder.addViewWithAction(with: AlertSubMailView.init(mailText: "Send this receipt to my email address. (okan.yucel95@gmail.com)",image: "letter.png"), tag: 3, height: 73, action: {
                    print("mail clicked")
                })
                builder.addButton(with: "OK", backgroundColor: .orange, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("OK clicked")
                })
                builder.addButton(with: "Cancel", backgroundColor: .lightGray, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Cancel clicked")
                })
               
                }.build()
        }else if indexPath.row == 1{
            let _ = AlertViewBuilder() { (builder) in
                builder.addView(with: AlertSubTitleView.init(titleText: "Error"), tag: 0, height: 50)
                builder.addView(with: AlertSubMessageView.init(messageText: "Error with message"), tag: 0, height: 40)
                
                builder.addButton(with: "OK", backgroundColor: .orange, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    
                    
                    let _ = AlertViewBuilder() { (builder) in
                        
                        let imageView = UIImageView.init(image: UIImage.init(named: "confirm")?.withAlignmentRectInsets(UIEdgeInsets.init(top: 20, left: 5, bottom: 0, right: 5)))
                        imageView.contentMode = .scaleAspectFit
                        
                        builder.addView(with: imageView, tag: 0, height: 50)
                        builder.addView(with: AlertSubMessageView.init(messageText: "Message with image"), tag: 0, height: 40)
                        builder.addView(with: AlertSubTextView.init(leftText: "Value", rightText: "70 EURO"), tag: 3, height: 30)
                        builder.addView(with: AlertSubTextView.init(leftText: "Sender Account", rightText: "401003485CLPECFEURON"), tag: 1, height: 30)
                        builder.addView(with: AlertSubTextView.init(leftText: "Benef Account", rightText: "401003485CLPECFEURON"), tag: 2, height: 30)
                        builder.addView(with: AlertSubTextView.init(leftText: "Value Date", rightText: "16.04.2018"), tag: 3, height: 30)
                        builder.addButton(with: "Button 1", backgroundColor: .black, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                            print("Button 1 clicked")
                        })
                        builder.addButton(with: "Button 2", backgroundColor: .orange, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                            print("Button 2 clicked")
                        })
                        builder.addButton(with: "Button 3", backgroundColor: .white, titleColor: .black, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                            print("Button 3 clicked")
                        })
                        }.build()
                    
                    
                    
                })
                }.build()
            
        }else if indexPath.row == 2{
            let alertViewBuilder = AlertViewBuilder() { (builder) in
                
                let imageView = UIImageView.init(image: UIImage.init(named: "letter")?.withAlignmentRectInsets(UIEdgeInsets.init(top: -5, left: 5, bottom: -5, right: 5)))
                imageView.contentMode = .scaleAspectFit
                
                builder.addView(with: imageView, tag: 0, height: 50)
                builder.addView(with: AlertSubMessageView.init(messageText: "Message with image"), tag: 134, height: 40)
                
                builder.addButton(with: "Button 1", backgroundColor: .black, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 1 clicked")
                })
                builder.addButton(with: "Button 2", backgroundColor: .orange, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 2 clicked")
                })
                builder.addButton(with: "Button 3", backgroundColor: .white, titleColor: .black, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 3 clicked")
                })
                builder.addButton(with: "Button 4", backgroundColor: .purple, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 4 clicked")
                    
                })
                }.build()
            
            
            if let view = alertViewBuilder.getView(viewWithTag: 134) as? AlertSubMessageView{
                print(view.mLabelMessage.text ?? "")
            }
            
        }else if indexPath.row == 3{
            let _ = AlertViewBuilder() { (builder) in
                
                let imageView = UIImageView.init(image: UIImage.init(named: "confirm")?.withAlignmentRectInsets(UIEdgeInsets.init(top: 20, left: 5, bottom: 0, right: 5)))
                imageView.contentMode = .scaleAspectFit
                
                builder.addView(with: imageView, tag: 0, height: 50)
                builder.addView(with: AlertSubMessageView.init(messageText: "Message with image"), tag: 0, height: 40)
                
                builder.addButton(with: "Button 1", backgroundColor: .black, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 1 clicked")
                })
                builder.addButton(with: "Button 2", backgroundColor: .gray, titleColor: .white, font: UIFont.systemFont(ofSize: 15), height: 40, action: {
                    print("Button 2 clicked")
                })
                }.build()
            
        }
        
    }
    
}

