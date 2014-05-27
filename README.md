BTBookView
==========

![gif](/Gifs/Book flipping.gif) 

This is a view for you to either use as-is or modify the source. The view comes loaded with the ability to:

1. Make a realistic looking book view as a subview.
2. Dropping any images as a page as easy as a one-liner.

**Background:**  
This is one of my R&D for implementing a realistic book. The idea never took off so I published here free for anyone to use and built upon. It is by no mean complete or bug free, so use it at your own risk! 

**Implementation:**  
It is a combination of hacks made using Apple's `UIPageViewController`. Since PageViewController comes equipped with the page curl animation, I stripped the view out of the controller for a better ease of use. Now it can be added onto any view and works really well with Auto Layout. 

**How to use:**

1. Create 2 `BTPageViews`, they represents each pages of the book. Put them in an array.
2. Create `BTBookView` and initialize with the array to create the first 2 visible pages.   
*Note*: You might want to set `nil` to image for the first page to leave it blank and set showShadow to `NO` for the 2nd page.
3. Make sure you set the `DataSource` for `BTBookView`. It is the same as `UIPageViewController`.
4. Set up the dataSource and number of pages. (Don't forget to add images)
5. Profit!

**Copyright 2014 Byte**

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
