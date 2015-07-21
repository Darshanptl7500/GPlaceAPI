#GPlaceAPI

GPlaceAPI is an open-source iOS Objective-C library for fetching [Google Places API][1] using simple blocks based API callbacks.

Its Main purpose it to use Google Places API requests with ease in a less lines of code. 

This includes following:

 - [Place Search][2]
     - Nearby Search (search places withing a specified area)
     - Text Search (search places based on a search string)
 - [Place Details][3] (get more comprehensive information about a place)
 - [Place Photos][9] (Get more info about place photos)
 - [Place Autocomplete][10]  (Get place predictions based on the search text)
 - [Query Autocomplete][11](Get on-the-fly geographic query predictions)

##Instalation


### Manual (or using git submodule)
 1. Implement [AFNetworking 2.0][4]
    - GPlaceAPI uses AFNetworking 2.0 so, you need to add AFNetworking[12] in your project 
 2. Download source files from this repository
 3. Add all files from *GPlaceAPI* folder to your project's target

##Usage

You can take a look at the detailed example usage project *GPlaceAPIExample/GPlaceAPIExample.xcodeproj*.

#### 1. Import GPlaceAPI files in your implementation file

`#import "GPConstant.h"`

#### 2. Setup service

In order to communicate with a Google Places API, you must first generate your own API key. Please take a look at [Introduction - Google Places API][6].

You must provide API key to a `GPlaceAPI` service before making any request using it. Good place for this code is the App Delegate.

//  Provide API key to GPlaceAPI before making any requests. Open "GPConstant.h" and set your API_KEY

`#define kGOOGLE_PLACE_API_KEY @"API_KEY"`

#### 3. Making a request & get Resonse
```
 CLLocationCoordinate2D location = CLLocationCoordinate2DMake(51.501103,-0.124565);
 GPPlaceSearchRequest *request =[[GPPlaceSearchRequest alloc] initWithLocationCoordinate:location];
 request.radius = 5000;
 [request doFetchPlaces:^(GPPlaceSearchResponse *response, NSError *error) {
       	if(!error){
			if(response.status ==  GPRequestStatusOK) {
                // Access place results by below model
                GPResult *result =response.results[0];
                NSLog(@"%@",result.name);
            }
       } 
    }];
```
Please check [Google Places API documentation][7] for request and resonse. you can search all request parameters and get response of all objects mentioned in [Google Places API documentation][7].


##Compatibility

 - iOS 7.0+

##Contact

GPlaceAPI is developed by [Darshan Patel](http://iosexception.com). Please [drop us an email](mailto:developer.ios89@gmail.com) to let me know you how you are using this library.

##Contributing and notes

 - If you like the library, please consider giving it a Github star to let us know it.

Pull requests are very welcome expecting you follow few rules:

 - Document your changes in a code comments and Git commit message
 - Make sure your changes didn't cause any trouble using included example project, unit tests and if appropriate, implement unit tests and example code for your newly added functionality

##Version history

#### 1.0
 - First official public release

##License
The MIT License (MIT)

Copyright (c) 2015 Darshan Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


  [1]: https://developers.google.com/places/documentation/
  [2]: https://developers.google.com/places/documentation/search
  [3]: https://developers.google.com/places/documentation/details
  [4]:https://github.com/AFNetworking/AFNetworking
  [5]: https://code.google.com/apis/console
  [6]: https://developers.google.com/places/documentation/#Authentication
  [7]: https://developers.google.com/places/documentation
  [8]: https://github.com/FuerteInternational/FTLocationManager
  [9]:https://developers.google.com/places/webservice/photos
  [10]:https://developers.google.com/places/webservice/autocomplete
  [11]:https://developers.google.com/places/webservice/query
  