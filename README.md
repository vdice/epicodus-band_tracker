# Band Tracker and Management App

##### _A web app for Fans to manage Bands and track their Concert Venues, August 28, 2015_

#### By **_Vaughn Dice_**

## Description

_**This app is live!** It has been deployed via Heroku and can be seen  [**here**](https://epicodus-band-tracker.herokuapp.com/)._

_Using this app, users can:_
* _View, add, update and delete Bands,_
* _View and add venues_
* _View and add venues for a particular Band._

## Setup

* _Clone this repository_
* _Install necessary dependencies with: `bundle`_
* _Setup database with:_

```
rake db:create
rake db:migrate
rake db:test:prepare

```
* _Run specs with: `rspec`_
* _Launch app with: `ruby app.rb`_
* _Navigate to `localhost:4567`_

## Technologies Used

_Ruby, rspec, Sinatra, Capybara, Postgres, Rake, Active Record_

### Legal

Copyright (c) 2015 **_Vaughn Dice_**

This software is licensed under the MIT license.

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
