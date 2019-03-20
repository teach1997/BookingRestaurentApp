//
//  resmodel.swift
//  BookingRestaurentApp
//
//  Created by Đào Kiều Anh on 3/20/19.
//  Copyright © 2019 apple. All rights reserved.
//
class inforestaurent {
    var resname: String?
    var resmap: String?
    var rate: String?
    init(resname:String?, resmap:String?, rate:String? ) {
        self.resname = resname;
        self.resmap = resmap;
        self.rate = rate;
    }
}
