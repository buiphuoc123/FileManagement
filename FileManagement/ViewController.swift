//
//  ViewController.swift
//  FileManagement
//
//  Created by Bui Phuoc on 5/19/17.
//  Copyright © 2017 Bui Phuoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var file1: FileManager?
    var file2: NSString?
    var file3: NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCreateFile(_ sender: Any) {
        file2 = file3?.appendingPathComponent("file1.txt") as NSString?
        file1?.createFile(atPath: file2! as String, contents: nil, attributes: nil)
        file2 = file3?.appendingPathComponent("file2.txt") as NSString?
        file1?.createFile(atPath: file2! as String, contents: nil, attributes: nil)
        print(file2)
        self.Thongbao(titleAlert: "Thành công", messageAlert: "Đã tạo thành công")
    }
    

    @IBAction func btnCreateDerectory(_ sender: Any) {
        
        file2 = file3?.appendingPathComponent("/folder1") as NSString?
        do {
            try file1?.createDirectory(atPath: file2! as String, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error)
        }
        self.Thongbao(titleAlert: "Thành công", messageAlert: "Đã tạo thành công")
    }
    
    @IBAction func btnWriteFile(_ sender: Any) {
        
        let content:NSString = NSString(string: "Chúc bạn ngày mới vui vẻ")
        let fileContent:NSData = content.data(using: String.Encoding.utf8.rawValue)! as NSData
        fileContent.write(toFile: (file3?.appendingPathComponent("file1.txt"))!, atomically: true)
        self.Thongbao(titleAlert: "Thành công", messageAlert: "Đã ghi thành công")
    }
    
    @IBAction func btnReadFile(_ sender: Any) {
        
     //   file1 = file3?.appendingPathComponent("/new/file1.txt") as NSString?
     //   var fileContent:NSData?
      //  fileContent=file1?.contents(atPath: file2! as String) as NSData?
      //  let str:NSString=NSString(data: fileContent! as Data, encoding: String.Encoding.utf8.rawValue)!
      //  self.Thongbao(titleAlert: "Thành công", messageAlert: "dữ liệu: \(str)" as NSString)
    }
    
    @IBOutlet weak var btnMoveFile: UIButton!
    
    @IBAction func btnMoveFile(_ sender: Any) {
        let oldFilePath:String=file3!.appendingPathComponent("/folder1/move.txt") as String
        let newFilePath:String=file3!.appendingPathComponent("temp.txt") as String
        do {
            try file1?.moveItem(atPath: oldFilePath, toPath: newFilePath)
        }
        catch let err as NSError
        {
            print("errorr \(err)")
        }
        
        self.Thongbao(titleAlert: "Thành công", messageAlert: "Đã di chuyển thành công")
    }
    
    @IBAction func btnCopyFile(_ sender: Any) {
        file2 = file3?.appendingPathComponent("temp.txt") as NSString?
        let originalFile=file3?.appendingPathComponent("temp.txt")
        let copyFile=file3?.appendingPathComponent("copy.txt")
        try? file1?.copyItem(atPath: originalFile!, toPath: copyFile!)
        self.Thongbao(titleAlert: "Thành công", messageAlert: "Copy thành công")
    }
    
    @IBAction func btnEqualityFile(_ sender: Any) {
        let filePath1 = file3?.appendingPathComponent("temp.txt")
        let filePath2 = file3?.appendingPathComponent("copy.txt")
        if(file1?.contentsEqual(atPath: filePath1!, andPath: filePath2!))!
        {
            self.Thongbao(titleAlert: "Thông báo", messageAlert: "File rỗng")
        }
        else
        {
            self.Thongbao(titleAlert: "Thông báo", messageAlert: "File trống")
        }
        
    }
    
    @IBAction func btnDeleteFile(_ sender: Any) {
        file2 = file3?.appendingPathComponent("file1.txt") as! NSString
        try? file1?.removeItem(atPath: file2! as String)
        self.Thongbao(titleAlert: "Thông báo", messageAlert: "Xoá thành công")
    }
    
    
    func Thongbao(titleAlert:NSString,messageAlert:NSString)
    {
        let alert:UIAlertController = UIAlertController(title:titleAlert as String, message: messageAlert as String, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
        }
        alert.addAction(okAction)
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

