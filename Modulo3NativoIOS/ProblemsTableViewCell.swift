//
//  ProblemsTableViewCell.swift
//  Modulo3NativoIOS
//
//  Created by NiltonFirmino on 1/8/22.
//

import UIKit

class ProblemsTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageViewPoster: UIImageView!
    @IBOutlet weak var LabelTitleProblem: UILabel!
    @IBOutlet weak var LabelProblemLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ mproblem: MunicipalProblem){
        LabelTitleProblem = mproblem.title
        LabelProblemLocation = mproblem.location
        if let image = mproblem.image{
            ImageViewPoster = UIImage(data: image)
        }
    }
    
    

}
