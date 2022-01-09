//
//  ProblemAddEditViewController.swift
//  Modulo3NativoIOS
//
//  Created by NiltonFirmino on 1/8/22.
//

import UIKit

class ProblemAddEditViewController: UIViewController {

    
    @IBOutlet weak var LabelWhatProblem: UITextField!
    @IBOutlet weak var LabelProblemLocation: UITextField!
    @IBOutlet weak var ButtonUpload: UIButton!
    @IBOutlet weak var ImageViewProblem: UIImageView!
    @IBOutlet weak var TextViewDetails: UITextView!
    
    var mproblem: MunicipalProblem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        if let mproblem = mproblem {
            title = "Edição"
            LabelWhatProblem = mproblem?.title
            LabelProblemLocation = mproblem?.location
            TextViewDetails = mproblem.detail
        
    }}

    @IBAction func ButtonUploadImage(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar imagem", message: "De onde deseja escolher a imagem?", preferredStyle:.actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: _ in
               self.selectPicture(sourceType: .camera)
        )
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Biblioteca de Fotos", style: .default, handler: _ in
           self.selectPicture(sourceType: .photoLibrary)        )
        alert.addAction(libraryAction)
        
        let albumAction = UIAlertAction(title: "Album de Fotos", style: .default, handler: _ in
           self.selectPicture(sourceType: .savedPhotosAlbum)        )
        alert.addAction(albumAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func ButtonDone(_ sender: Any) {
        if mproblem == nil {
            mproblem = MunicipalProblem(context: context)
        }
        
        mproblem?.title = LabelWhatProblem.text
        mproblem?.location = LabelProblemLocation.text
        mproblem?.image = ImageViewProblem.image?.jpegData(compressionQuality: 0.8)
        mproblem?.detail = TextViewDetails.text
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension ProblemAddEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            ImageViewProblem.image = image
        }
    }
}
