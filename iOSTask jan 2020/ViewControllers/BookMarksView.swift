//
//  BookMarksView.swift
//  iOS Interview Task
//
//  Created by MONU on 1/15/20.
//  Copyright © 2020 Sanjay. All rights reserved.

 
import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
 

class BookMarksView: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
     var userDict : NSArray = []
     var fetchData = NSMutableArray()
 
    @IBOutlet weak var myTableView: UITableView!
   

       override func viewDidLoad() {
          super.viewDidLoad()
        // self.addNavigationBarLeft(titleName: "Movie Genre List")
      //  self.navigationController?.navigationBar.backItem?.title = "Anything Else"
        //backBarLeft()
        
        self.navigationItem.title = "ABCD"
        self.getUserData()
          print(self.userDict)
      }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let myWebData : NSDictionary = (self.fetchData.object(at: indexPath.row) as! NSDictionary)
         let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath) as! BookmarkCell
        
        cell.movie_Nam.text = myWebData.value(forKey: "original_title") as? String
               cell.movie_Date.text = myWebData.value(forKey: "release_date") as? String
                 cell.movie_Description.text = myWebData.value(forKey: "overview") as? String
        cell.popularity_Lbl.text = myWebData.value(forKey: "popularity") as? String
        
        let myWebImage = myWebData[indexPath.row]
        if let myIMGURL = myWebData["poster_path"] as? String {
             let myURL = imgUrl + myIMGURL
                  print(myURL)
            let url = URL(string: imgUrl)
            let path = myIMGURL
            let urlWithPath = url.flatMap { URL(string: $0.absoluteString + path) }
            print(urlWithPath!)
              cell.movie_IMG.af_setImage(withURL: urlWithPath! as URL, placeholderImage: UIImage.init(named: "MDGR.png"))
            
            let cornerRadius : CGFloat = 10.0
                     cell.movie_IMG.layer.cornerRadius = cornerRadius
                     cell.movie_IMG.layer.shadowColor = UIColor.darkGray.cgColor
                     cell.movie_IMG.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
                     cell.movie_IMG.layer.shadowRadius = 25.0
                     cell.movie_IMG.layer.shadowOpacity = 0.9
                     cell.movie_IMG.layer.cornerRadius = cornerRadius
                     cell.movie_IMG.clipsToBounds = true
        }
         return cell
     }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
     }
          
    // MARK:- getting Data-->
    
            func getUserData(){
                Alamofire.request(myURL002).responseJSON { (responseData) -> Void in
                              if((responseData.result.value) != nil) {
                                  let swiftyJsonVar = JSON(responseData.result.value!)
                                 print(swiftyJsonVar)
                                   if let resData = swiftyJsonVar["results"].arrayObject {
                                     print(resData)
                                      self.userDict = resData as! NSArray
                                    print(self.userDict)
                                  }
                                  if self.userDict.count > 0 {
                                      self.myTableView.reloadData()
                                    print(self.userDict)
                                  }
                               }
            
                        DispatchQueue.main.async {
                            print(self.userDict)
                            
//               MARK:-  Data----->
 
                            self.fetchData = self.userDict.mutableCopy() as! NSMutableArray
            
                              print(self.fetchData)
            for i in 0..<self.fetchData.count {
                print(self.fetchData)
                let dict = self.fetchData.object(at: i) as!  NSDictionary
                let original_title = dict.object(forKey: "original_title") as! String
                let release_date = dict.object(forKey: "release_date") as! String
                let overview = dict.object(forKey: "overview") as! String
                  self.myTableView.reloadData()
                     
  }
  }
}
  }
                         
 }

//
//https://api.themoviedb.org/3/movie/now_playing?api_key=1d9b898a212ea52e283351e521e17871&language=en&page=2&region=US
//
//https://api.themoviedb.org/3/genre/movie/list?api_key=a5ae83891eb2ec3c23227a9cf54943a9&language=en-IN

