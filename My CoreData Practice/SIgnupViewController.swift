//
//  SIgnupViewController.swift
//  My CoreData Practice
//
//  Created by COE-008 on 23/01/20.
//  Copyright © 2020 COE-008. All rights reserved.
//

import UIKit
import CoreData

class SIgnupViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBAction func tap(_ sender: Any) {
        
        imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
        
        
        imgPicker.delegate = self
        
        //self.navigationController?.pushViewController(imgPicker, animated: true)
        self.present(imgPicker, animated: true, completion: nil)
    }
    var imgPicker = UIImagePickerController()
    
    var people: [NSManagedObject] = []
    var arr = [   "Afghanistan",
                  "Albania",
                  "Algeria",
                  "American Samoa",
                  "Andorra",
                  "Angola",
                  "Anguilla",
                  "Antarctica",
                  "Antigua and Barbuda",
                  "Argentina",
                  "Armenia",
                  "Aruba",
                  "Australia",
                  "Austria",
                  "Azerbaijan",
                  "Bahamas (the)",
                  "Bahrain",
                  "Bangladesh",
                  "Barbados",
                  "Belarus",
                  "Belgium",
                  "Belize",
                  "Benin",
                  "Bermuda",
                  "Bhutan",
                  "Bolivia (Plurinational State of)",
                  "Bonaire, Sint Eustatius and Saba",
                  "Bosnia and Herzegovina",
                  "Botswana",
                  "Bouvet Island",
                  "Brazil",
                  "British Indian Ocean Territory (the)",
                  "Brunei Darussalam",
                  "Bulgaria",
                  "Burkina Faso",
                  "Burundi",
                  "Cabo Verde",
                  "Cambodia",
                  "Cameroon",
                  "Canada",
                  "Cayman Islands (the)",
                  "Central African Republic (the)",
                  "Chad",
                  "Chile",
                  "China",
                  "Christmas Island",
                  "Cocos (Keeling) Islands (the)",
                  "Colombia",
                  "Comoros (the)",
                  "Congo (the Democratic Republic of the)",
                  "Congo (the)",
                  "Cook Islands (the)",
                  "Costa Rica",
                  "Croatia",
                  "Cuba",
                  "Curaçao",
                  "Cyprus",
                  "Czechia",
                  "Côte d'Ivoire",
                  "Denmark",
                  "Djibouti",
                  "Dominica",
                  "Dominican Republic (the)",
                  "Ecuador",
                  "Egypt",
                  "El Salvador",
                  "Equatorial Guinea",
                  "Eritrea",
                  "Estonia",
                  "Eswatini",
                  "Ethiopia",
                  "Falkland Islands (the) [Malvinas]",
                  "Faroe Islands (the)",
                  "Fiji",
                  "Finland",
                  "France",
                  "French Guiana",
                  "French Polynesia",
                  "French Southern Territories (the)",
                  "Gabon",
                  "Gambia (the)",
                  "Georgia",
                  "Germany",
                  "Ghana",
                  "Gibraltar",
                  "Greece",
                  "Greenland",
                  "Grenada",
                  "Guadeloupe",
                  "Guam",
                  "Guatemala",
                  "Guernsey",
                  "Guinea",
                  "Guinea-Bissau",
                  "Guyana",
                  "Haiti",
                  "Heard Island and McDonald Islands",
                  "Holy See (the)",
                  "Honduras",
                  "Hong Kong",
                  "Hungary",
                  "Iceland",
                  "India",
                  "Indonesia",
                  "Iran (Islamic Republic of)",
                  "Iraq",
                  "Ireland",
                  "Isle of Man",
                  "Israel",
                  "Italy",
                  "Jamaica",
                  "Japan",
                  "Jersey",
                  "Jordan",
                  "Kazakhstan",
                  "Kenya",
                  "Kiribati",
                  "Korea (the Democratic People's Republic of)",
                  "Korea (the Republic of)",
                  "Kuwait",
                  "Kyrgyzstan",
                  "Lao People's Democratic Republic (the)",
                  "Latvia",
                  "Lebanon",
                  "Lesotho",
                  "Liberia",
                  "Libya",
                  "Liechtenstein",
                  "Lithuania",
                  "Luxembourg",
                  "Macao",
                  "Madagascar",
                  "Malawi",
                  "Malaysia",
                  "Maldives",
                  "Mali",
                  "Malta",
                  "Marshall Islands (the)",
                  "Martinique",
                  "Mauritania",
                  "Mauritius",
                  "Mayotte",
                  "Mexico",
                  "Micronesia (Federated States of)",
                  "Moldova (the Republic of)",
                  "Monaco",
                  "Mongolia",
                  "Montenegro",
                  "Montserrat",
                  "Morocco",
                  "Mozambique",
                  "Myanmar",
                  "Namibia",
                  "Nauru",
                  "Nepal",
                  "Netherlands (the)",
                  "New Caledonia",
                  "New Zealand",
                  "Nicaragua",
                  "Niger (the)",
                  "Nigeria",
                  "Niue",
                  "Norfolk Island",
                  "Northern Mariana Islands (the)",
                  "Norway",
                  "Oman",
                  "Pakistan",
                  "Palau",
                  "Palestine, State of",
                  "Panama",
                  "Papua New Guinea",
                  "Paraguay",
                  "Peru",
                  "Philippines (the)",
                  "Pitcairn",
                  "Poland",
                  "Portugal",
                  "Puerto Rico",
                  "Qatar",
                  "Republic of North Macedonia",
                  "Romania",
                  "Russian Federation (the)",
                  "Rwanda",
                  "Réunion",
                  "Saint Barthélemy",
                  "Saint Helena, Ascension and Tristan da Cunha",
                  "Saint Kitts and Nevis",
                  "Saint Lucia",
                  "Saint Martin (French part)",
                  "Saint Pierre and Miquelon",
                  "Saint Vincent and the Grenadines",
                  "Samoa",
                  "San Marino",
                  "Sao Tome and Principe",
                  "Saudi Arabia",
                  "Senegal",
                  "Serbia",
                  "Seychelles",
                  "Sierra Leone",
                  "Singapore",
                  "Sint Maarten (Dutch part)",
                  "Slovakia",
                  "Slovenia",
                  "Solomon Islands",
                  "Somalia",
                  "South Africa",
                  "South Georgia and the South Sandwich Islands",
                  "South Sudan",
                  "Spain",
                  "Sri Lanka",
                  "Sudan (the)",
                  "Suriname",
                  "Svalbard and Jan Mayen",
                  "Sweden",
                  "Switzerland",
                  "Syrian Arab Republic",
                  "Taiwan (Province of China)",
                  "Tajikistan",
                  "Tanzania, United Republic of",
                  "Thailand",
                  "Timor-Leste",
                  "Togo",
                  "Tokelau",
                  "Tonga",
                  "Trinidad and Tobago",
                  "Tunisia",
                  "Turkey",
                  "Turkmenistan",
                  "Turks and Caicos Islands (the)",
                  "Tuvalu",
                  "Uganda",
                  "Ukraine",
                  "United Arab Emirates (the)",
                  "United Kingdom of Great Britain and Northern Ireland (the)",
                  "United States Minor Outlying Islands (the)",
                  "United States of America (the)",
                  "Uruguay",
                  "Uzbekistan",
                  "Vanuatu",
                  "Venezuela (Bolivarian Republic of)",
                  "Viet Nam",
                  "Virgin Islands (British)",
                  "Virgin Islands (U.S.)",
                  "Wallis and Futuna",
                  "Western Sahara",
                  "Yemen",
                  "Zambia",
                  "Zimbabwe",
                  "Åland Islands"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arr[row]
    }
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var emailid: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBAction func signup(_ sender: Any) {
        
        let imgData = UIImageJPEGRepresentation(img1.image!, 1.0)!
        let strBase64 = imgData.base64EncodedString(options: .lineLength64Characters)
      
        
        self.save(Name: name.text!, email: emailid.text!, Password: password.text!, image: strBase64)
        
        print("saved")
    }
    
    @IBOutlet weak var picker: UIPickerView!
    
    func save(Name:String,email:String,Password:String,image:String)
    {
        let appdelegate = UIApplication.shared.delegate as? AppDelegate
        let managecontext = appdelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managecontext!)
        let persone =  NSManagedObject(entity: entity!, insertInto: managecontext)
        
        persone.setValue(name.text, forKey: "name")
        persone.setValue(emailid.text, forKey: "emailid")
        persone.setValue(password.text, forKey: "password")
        persone.setValue(image, forKey: "img")
        
        do
        {
            try managecontext!.save()
            people.append(persone)
            
        }
        catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let PickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        img1.contentMode = .scaleAspectFill
        img1.image = PickedImage
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
