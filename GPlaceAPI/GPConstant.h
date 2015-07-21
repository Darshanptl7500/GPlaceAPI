//
//  GPConstant.h
//  APIManager
//
//  Created by Darshan Patel on 7/14/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Darshan Patel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#ifndef APIManager_GPConstant_h
#define APIManager_GPConstant_h

#define kAPI_PLACES_URL @"https://maps.googleapis.com/maps/api/place/"
#define kGOOGLE_PLACE_API_KEY @""

typedef NS_ENUM(NSInteger, GPRankBy) {
    GPRankByProminence = 0,
    GPRankByDistance
};

typedef NS_ENUM(NSInteger, GPRequestStatus) {
    GPRequestStatusOK = 0,
    GPRequestStatusZERORESULTS,
    GPRequestStatusOVERQUERYLIMIT,
    GPRequestStatusREQUESTDENIED,
    GPRequestStatusINVALIDREQUEST
};

#define OK @"OK"
#define ZERO_RESULTS @"ZERO_RESULTS"
#define OVER_QUERY_LIMIT @"OVER_QUERY_LIMIT"
#define REQUEST_DENIED @"REQUEST_DENIED"
#define INVALID_REQUEST @"INVALID_REQUEST"

#endif
