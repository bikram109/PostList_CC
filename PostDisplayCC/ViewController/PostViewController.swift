//
//  PostViewController.swift
//  PostDisplayCC
//
//  Created by Bikram sapkota on 25/4/21.
//

import UIKit

class PostViewController: UITableViewController {

    var postViewModels = [PostViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        fetchData()
    }

    
    @objc func refresh(sender:AnyObject)
    {
        // fetch new data after pull to refresh
        fetchData()
    }
    
    // fetch all posts from API
    func fetchData() {
        
       // Fetch data from Mock service
        MockService.shared.fetchPosts{  (posts, err) in
            
            if  err != nil{
                DispatchQueue.main.async {[weak self] in
                    self?.showAlert(withTitle: "Error", message: "Failed to fetch posts")
                }
                return
            }
            self.postViewModels = posts?.map({return PostViewModel(post:$0)}) ?? []
            // UI part should be always in main thread
            DispatchQueue.main.async {[weak self] in
                self?.tableView.reloadData()
                self?.refreshControl?.endRefreshing()
            }
        }
        
        // Uncomment for fetching from Real API
//        Service.shared.fetchPosts {  (posts, err) in
//            if  err != nil{
//                DispatchQueue.main.async {[weak self] in
//                    self?.showAlert(withTitle: "Error", message: "Failed to fetch posts")
//                }
//                return
//            }
//            self.postViewModels = posts?.map({return PostViewModel(post:$0)}) ?? []
//            // UI part should be always in main thread
//            DispatchQueue.main.async {[weak self] in
//                self?.tableView.reloadData()
//                self?.refreshControl?.endRefreshing()
//            }
//        }
        
    }


    func showAlert(withTitle title:String,  message:String){
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! PostTableViewCell
        cell.postViewModel = postViewModels[indexPath.row]
        return cell

    }
}
