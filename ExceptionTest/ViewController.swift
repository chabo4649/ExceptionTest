//
//  ViewController.swift
//  ExceptionTest
//
//  Created by 井口陽介 on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var InputTextFIeld: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ResultLabel.backgroundColor = .white
    }

    @IBAction func pushButton(_ sender: UIButton) {
        let test = TestException()
        do{
            let result = try test.calc(pInput: InputTextFIeld.text!)
            ResultLabel.text =  "\(result ?? 0)"
            ResultLabel.backgroundColor = .blue
        }catch SimpleError.Format{
            ResultLabel.text =  "FormatError!!"
            ResultLabel.backgroundColor = .red
        }catch SimpleError.Overflow{
            ResultLabel.text =  "ZeroDivError!!"	
            ResultLabel.backgroundColor = .red
        }catch{
            ResultLabel.text =  error.localizedDescription
            ResultLabel.backgroundColor = .red
        }
    }
    
    @IBAction func pushTestButton(_ sender: UIButton) {
        let test = TestException()
        do {
            ResultLabel.text = try test.getString(pInput: InputTextFIeld.text!)
            ResultLabel.backgroundColor = .blue
        }catch SimpleError.Format{
            ResultLabel.text =  "FormatError!!"
            ResultLabel.backgroundColor = .red
        }catch SimpleError.Index{
            ResultLabel.text =  "IndexError!!"
            ResultLabel.backgroundColor = .red
        } catch  {
            ResultLabel.text =  error.localizedDescription
            ResultLabel.backgroundColor = .red
        }
        
    }
    
}

