//
//  DataTool.swift
//  LibraryManagement
//
//  Created by oyoung on 15/11/30.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

//书本信息
class Book: NSObject {
    
}

//记录信息
class Record: NSObject {
    let db:FMDatabase?
    override init() {
        db = FMDatabase(path: LMConfig.defaultConfig().dataBasePath())
    }
}
//书本数据
class BookData: NSObject {
    
    private var typeDict:NSDictionary?
    private var dataSource:NSMutableDictionary?
    override init() {
        typeDict = nil
        dataSource = nil
    }
    
    func loadData()
    {
        
    }
    
    func storeData(data: NSMutableDictionary)
    {
        
    }
    func storeBook(book: Book)
    {
        
    }
    
    func typeInfo() -> NSDictionary?
    {
        return typeDict
    }
    
    func data() -> NSMutableDictionary?
    {
        return dataSource
    }
}
//记录数据
class RecordData: NSObject {
    var records:NSMutableArray?
    override init() {
        records = nil
    }
    //取数据
    func loadRecords()
    {
        
    }
    //保存全纪录数据
    func storeRecords(records: NSMutableArray)
    {
        for record in records
        {
            if record.isKindOfClass(Record.classForCoder())
            {
                storeRecord(record as! Record)
            }
        }
    }
    //保存单条记录
    func storeRecord(record: Record)
    {
        
    }
    
}

class DataTool: NSObject {
    
    static private var dataTool:DataTool? = nil
    static func defaultTool() -> DataTool
    {
        if dataTool == nil
        {
            dataTool = DataTool()
        }
        return dataTool!
    }
    private var _bookData: BookData?
    private var _recordData: RecordData?
    private override init() {
        super.init()
        _bookData = nil
        _recordData = nil
    }
    func bookData() ->BookData
    {
        if _bookData == nil
        {
            _bookData = BookData()
        }
        return _bookData!
    }
    func recordData() -> RecordData
    {
        if _recordData == nil
        {
            _recordData = RecordData()
        }
        return _recordData!
    }
    
    

}
