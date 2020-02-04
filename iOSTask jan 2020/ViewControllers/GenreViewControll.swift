//
//  GenreViewController.swift
//  iOSTask jan 2020
//
//  Created by MONU on 2/2/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class GenreViewControll: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var genreTableView: UITableView!
    
    var genreList : NSArray = []
    var fetchGenreDataList = NSMutableArray()
    
    
    //var genreList = ["a","b","c","d","e","f","g","h"]
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GenreData()
        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
 
        let myGenerList : NSDictionary = (self.genreList.object(at: indexPath.row) as! NSDictionary)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell") as! genreCell
        
        cell.genre_Name.text = myGenerList.value(forKey: "name") as? String
        
        return cell
    }
 
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myGenerListx : NSDictionary = (self.genreList.object(at: indexPath.row) as! NSDictionary)
               
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "BookMarksView") as! BookMarksView
//              vc.strCheck = "Yes"
        self.navigationItem.title =  myGenerListx.value(forKey: "name") as? String

              self.navigationController?.pushViewController(vc, animated: true)
    }
    
     // MARK:-   GENRE Data-->
         
                 func GenreData(){
                     Alamofire.request(myURL001).responseJSON { (responseData) -> Void in
                                   if((responseData.result.value) != nil) {
                                       let swiftyJsonVar = JSON(responseData.result.value!)
                                      print(swiftyJsonVar)
    //                                    if let resData = swiftyJsonVar["results"].arrayObject {
    //                                      print(resData)
    //                                       self.userDict = resData as! NSArray
    //                                     print(self.userDict)
                                      
                                       
                                         if let genres = swiftyJsonVar["genres"].arrayObject {
                                         print(genres)
                                            self.genreList =  genres as! NSArray
                                              print(self.genreList)
                                                                           
                                       }
                                       if self.genreList.count > 0 {
                                           self.genreTableView.reloadData()
                                         print(self.genreList)
                                       }
                                    }
                   }
                             DispatchQueue.main.async {
                                 print(self.genreList)
                                 
     //               MARK:-  Data----->
      
                                 self.fetchGenreDataList = self.genreList.mutableCopy() as! NSMutableArray
                 
                                   print(self.fetchGenreDataList)
                 for i in 0..<self.fetchGenreDataList.count {
                     print(self.fetchGenreDataList)
                     let dict = self.genreList.object(at: i) as!  NSDictionary
                    
                     let name = dict.object(forKey: "name") as! String
                     let id = dict.object(forKey: "id") as! String
                    
    //                 let original_title = dict.object(forKey: "original_title") as! String
    //                 let release_date = dict.object(forKey: "release_date") as! String
    //                 let overview = dict.object(forKey: "overview") as! String
                     
 
                       self.genreTableView.reloadData()
                          
       }
       }
     }
}
