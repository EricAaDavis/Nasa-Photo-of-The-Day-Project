//
//  ViewController.swift
//  Nasa Photo of The Day
//
//  Created by Eric Davis on 08/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var explenationLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    let photoOfTheDayController = PhotoOfTheDayController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        explenationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        explenationLabel.adjustsFontForContentSizeCategory = true
        imageView.layer.cornerRadius = 20
        explenationLabel.text = ""
        titleLabel.text = ""
        copyrightLabel.text = ""
        imageView.image = nil
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        photoOfTheDayController.fetchPhotoOfTheDay { (photInfoOfTheDay) in
            
            if let photInfoOfTheDay = photInfoOfTheDay {
                self.updateUI(with: photInfoOfTheDay)
            }
        }
    }
    

    
    func updateUI(with photoOfTheDayInfo: PhotoOfTheDay) {
        
        let task = URLSession.shared.dataTask(with: photoOfTheDayInfo.url) {
            (data, response, error) in
            guard let data = data,
                  let image = UIImage(data: data) else {return}
            print(photoOfTheDayInfo)
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
                self.titleLabel.text = photoOfTheDayInfo.title
                self.explenationLabel.text = photoOfTheDayInfo.explanation
                self.copyrightLabel.text = photoOfTheDayInfo.copyright
            }
        }
        task.resume()
    }
}
