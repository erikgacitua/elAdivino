//
//  ViewController.swift
//  elAdivino
//
//  Created by Erik Felipe Gacitua Arenas on 2/18/19.
//  Copyright © 2019 Erik Felipe Gacitua Arenas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelAnswer: UILabel!//Label central
    @IBOutlet weak var imageAnswer: UIImageView!
    
    let answersArray : [String] = ["Si","No","Puede Ser","Pregunta otra vez","No tengo ni idea","Ni lo sueñes","Estas en lo correcto!"]
    let imagenAnswer : [String] = ["imagen01","imagen02","imagen03","imagen04","imagen05","imagen06","imagen07"]
    let nAnswers : UInt32
    var randomAnswerNumber : Int = 0 //Variable aque almacena numero del array leatorio para guardar
    
    required init?(coder aDecoder: NSCoder) {
        nAnswers = UInt32(answersArray.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        //Acción del botón
        generateRandowAnswer()
    }
    
    func generateRandowAnswer()  {
        randomAnswerNumber = Int(arc4random_uniform(nAnswers))
        
        let nameImagenAnswer = answersArray[randomAnswerNumber]
        let imageResponse = imagenAnswer[randomAnswerNumber]
        print(imageResponse)
        self.labelAnswer.text = nameImagenAnswer
        self.imageAnswer.image = UIImage(named: imageResponse)
        print(nameImagenAnswer, randomAnswerNumber)
    }
    
    //Codigo para movimiento de mi dispositivo (Acelerometro o shake)
    override func becomeFirstResponder() -> Bool {
        return true
    }
    //Motion metodo que hace que al mover o agitar el dispocitivo se ejecuta la función de generateRandomDices
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake{
            generateRandowAnswer()
        }
    }

}
