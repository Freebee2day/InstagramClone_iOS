//
//  feedViewController.swift
//  
//
//  Created by Phoebe Zhong  on 4/6/21.
//

import UIKit
import Parse

class feedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var feedsTV: UITableView!
    
    var postCollection = [PFObject]()
    //make an array, to later store the post result fetched from Back4app.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedsTV.dataSource = self
        feedsTV.delegate = self
        
        feedsTV.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myPrototypeCell = feedsTV.dequeueReusableCell(withIdentifier: "SinglePostTableViewCell") as! SinglePostTableViewCell

        let singlePostInCollection = postCollection[indexPath
            .row]


        let tempUser = singlePostInCollection["owner"] as! PFUser
        myPrototypeCell.feedAuthor.text = tempUser.username

        myPrototypeCell.feedCaption.text = singlePostInCollection["comment"] as? String
        print(myPrototypeCell.feedCaption.text as Any)
        
        
        return myPrototypeCell
    }
    
    

    
    
    //for refreshing to show the newly composed feed
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //fetching data from back4app
        let query = PFQuery(className:"Post")
        
        //the owner field in the database is a pointer to the User class.
        //include key would allow the data base to follow the pointer to fetch info from the User class.
        query.includeKey("owner")
        
        query.limit = 20 //fetch the last 20 objs
        
        query.findObjectsInBackground { (feedsResult, error) in
            if feedsResult != nil{
                print("gotten results from database")
                //save the data locally in our post Collection
                self.postCollection = feedsResult!
                //refresh the data
                self.feedsTV.reloadData()
            }else{
                print("error occured while fetching data from Back4app")
            }
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
