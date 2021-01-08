//
//  TestException.swift
//  ExceptionTest
//
//  Created by 井口陽介 on 2021/01/06.
//

import UIKit

//カスタムの例外を定義
enum SimpleError: Error {
    case Format
    case Overflow
    case Index
}

class TestException: NSObject {
    
    //100をテキストボックで割る関数
    func calc(pInput: String) throws -> Double?{
        
        guard let tmp = Double(pInput) else {
            throw SimpleError.Format
            //return nil
        }

        if tmp == 0 {
            throw SimpleError.Overflow
        }
        
        let result = Double(100.0 / tmp)
        return result
    }
    
    //テキストボックスの値から配列の値を取得する関数
    func getString(pInput: String) throws -> String?{
        let arr: [String] = ["Hoge", "Fuga", "Foo", "Bar"]
        
        guard let tmp = Int(pInput) else {
            throw SimpleError.Format
        }
        
        //IndexとInputNum比較
        if arr.count > tmp && tmp >= 0{
            return arr[tmp]
        }else{
            throw SimpleError.Index
        }
    }
}
