//
//  ViewController.swift
//  color palette
//
//  Created by Imcrinox Mac on 03/01/1445 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var palette: UICollectionView!
    @IBOutlet weak var menuButn: UIButton!
    
    var isHidden = false
    var colors = ["LightBlue", "Blue", "DarkBlue","LightGreen","Green","DarkGreen","LightPurple","Purple","DarkPurple","Red","Orange","Yellow","TealBlue","Pink","Rose ebony"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        palette.isHidden = true

        colorView.layer.cornerRadius = colorView.layer.frame.height / 2
    }
    
    @IBAction func dropDownBtn(_ sender: Any) {
//        self.palette.isHidden = !self.palette.isHidden
        isHidden = !isHidden
        DispatchQueue.main.async {
            if self.isHidden == false {
                self.palette.isHidden = true
            }
            else {
                self.palette.isHidden = false
            }
            self.view.layoutIfNeeded()
        }
    }
    func collectionSetup () {
    palette.delegate = self
    palette.dataSource = self
    DispatchQueue.main.async {
        self.palette.reloadData()
    }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = palette.dequeueReusableCell(withReuseIdentifier: "colorCollectionViewCell", for: indexPath) as! colorCollectionViewCell
        cell.contentView.backgroundColor = UIColor(named: self.colors[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 50, height: 50)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        colorView.backgroundColor = selectedCell.contentView.backgroundColor
    }
}
