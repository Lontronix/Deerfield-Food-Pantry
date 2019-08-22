//
//  FoodPantryControllerTableViewController.swift
//  West Deerfield Township
//
//  Created by Lonnie Gerol on 5/10/19.
//  Copyright © 2019 Ben Rosen. All rights reserved.
//

import UIKit

class FoodPantryController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food Pantry"
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 67/255, green: 103/255, blue: 141/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        tableView.backgroundColor = UIColor.backgroundGrey
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ImageCarouselTableCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "textCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            return tableView.dequeueReusableCell(withIdentifier: "imageCell")!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell")! as! TextTableViewCell
            switch indexPath.row{
            case 1:
                cell.headerLabel.text = "Helping Singles, Couples, and Families"
                cell.textView.text = "Twice a month, the donations from generous citizens and local businesses make a real difference in the quality of life for our neighbors who are struggling. The West Deerfield Food Pantry serves residents of our Township: Deerfield, Bannockburn, and portions of Lake Forest, Highland Park, and Riverwoods."
                cell.textView.textColor = UIColor.black
            case 2:
                cell.headerLabel.text = "Our Wishlist"
                let attrString = NSMutableAttributedString(string: "While many food drives are held during the school year and around the holidays, donations tend to taper off during the  summer months. Yet the need continutes year 'round. Current we need the following non-expired items:\n\n", attributes : [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular), NSAttributedString.Key.strokeColor: UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1)])
                attrString.append(NSMutableAttributedString(string: "∙Canned Chicken\n∙Canned Fruit\n∙Pasta Sauce\n∙Peanut Butter\n∙Jelly or Jam\n∙Boxed Cereal\n∙Juice, half-gallon sized bottles\n∙Oatmeal, large canisters and indvidiual packets\n∙Crackers\n∙Ground Coffee\n∙Tea\n∙Jello and or pudding mix\n\n", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),NSAttributedString.Key.strokeColor: UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1) ]))
                attrString.append(NSMutableAttributedString(string: "Any non-expired donations are gratefully accepted, and may be dropped off at the Township office anytime during regular office hours, 8:30 a.m. – 4:30 p.m. Your generous support and contribution of substantial and nutritious foods are greatly appreciated by the Food Pantry. Thank you!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular), NSAttributedString.Key.strokeColor: UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1)]))
                
                
                
                
                
                cell.textView.attributedText = attrString
                
                
            case 3:
                cell.headerLabel.text = "More than just food, Essentials for everyday life"
                cell.textView.text = "Non-perishables, household cleaning products and personal care items are distributed from the pantry along with gift cards when they’re available. During the December holidays, each recipient household receives a holiday gift, as well. School-aged children benefit from an annual Back-to-School program that includes new shoes, some clothing, school supplies, and haircuts. We are grateful to our partners: the Optimists Club of Deerfield and Newcomers and Neighbors of Deerfield Club."
                cell.textView.textColor = UIColor.black
            case 4:
                cell.headerLabel.text = "How we use your donations"
                cell.textView.text = "The West Deerfield Township Food Pantry is made possible by donations from our community. You should know that if you make a cash donation, it will go to providing gift cards to local grocery stores. Donations of non-perishable food items, cleaning and personal care products are welcome. Food stamps may not be used on cleaning, personal care, or paper products, so these items are especially appreciated."
                cell.textView.textColor = UIColor.black
            case 5:
                cell.headerLabel.text = "A Gateway to Navigating additional resources"
                cell.textView.text = "If you or someone you know needs help, our food pantry’s goal is to cooperate with other agencies and partners to connect those in need with available resources. Beyond nutritional support, these can include financial assistance, health care, housing, medical care and family counseling. You can learn more on this web site in the Financial Assistance page and on the Senior and Health Services page."
                cell.textView.textColor = UIColor.black
            case 6:
                cell.headerLabel.text = "The need is real. Thank you for your support in the past and in the future"
                cell.textView.text = "Each month we make a real difference in the lives of less-fortunate residents. But it is the generous support of our community, it’s organizations, and businesses that makes this possible. We are grateful for all donations and we take great pride in being this community resource for life."
                cell.textView.sizeToFit()
                
                
            default: ()
                
                
            }
            return cell
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
