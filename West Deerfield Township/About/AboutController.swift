//
//  AboutTableViewController.swift
//  Food Pantry
//
//  Created by Lonnie Gerol on 2/4/19.
//  Copyright © 2019 Lontronix. All rights reserved.
//

import UIKit

class AboutController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "textCell")
        tableView.backgroundColor = UIColor(displayP3Red: 229/255, green: 226/255, blue: 226/255, alpha: 1.0)
        self.title = "About"
        self.tableView.separatorColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = .deerfieldGreen
        
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextTableViewCell
            cell.headerLabel.text = "It's our Job to listen to you with passion and compassion"
            cell.headerLabel.textColor = UIColor.deerfieldGreen
            cell.textView.text = "We’re ready to serve you. At the West Deerfield Township office, we embrace the tradition that goes back over 150 years when our Township was founded. That tradition is to serve our community by representing government at its best – by being both responsive and accountable."
            return cell
            
        }
        else if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextTableViewCell
            cell.headerLabel.textColor = UIColor.deerfieldGreen
            cell.headerLabel.text = "One Office, A  Broad Range Of Responsibilities"
            cell.textView.text = "Our charter is to maintain the functions of General Assistance, Property Assessment, and Voting Services, as well as maintain Unincorporated Roads. But today, our role in the community goes beyond – to our many programs intended to improve the quality of life. "
            return cell
            
        }
        else if(indexPath.section == 2){
            let cell  = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextTableViewCell
            cell.headerLabel.text = "Contact Our Trustees"
            cell.headerLabel.textColor = UIColor.deerfieldGreen
            cell.textView.text = "To contact the Trustees directly via email, below are their addresses:\n\nRon Levitsky — rlevitsky@westdeerfieldtownship.org\n\nRon Schwartz — rschwartz@westdeerfieldtownship.org\n\nKaye Kharasch  — kkharasch@westdeerfieldtownship.org\n\nParas Parekh  — pparekh@westdeerfieldtownship.org"
            cell.textView.dataDetectorTypes = UIDataDetectorTypes.all
            cell.textView.isSelectable = true
            cell.textView.isEditable = false
            cell.textView.isUserInteractionEnabled = true
            return cell
            
        }
        else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextTableViewCell
            cell.headerLabel.text = "Contact the Township Office"
            cell.headerLabel.textColor = UIColor.deerfieldGreen
            cell.textView.text = "For general questions and concerns, you’re welcome to email the Township offices at:\n\n info@westdeerfieldtownship.org"
            cell.textView.dataDetectorTypes = UIDataDetectorTypes.all
            cell.textView.isSelectable = true
            cell.textView.isEditable = false
            cell.textView.isUserInteractionEnabled = true
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
  

}
