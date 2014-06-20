# Iceburn

A quick and dirty Rails plugin for client-side javascript apps. Adds
filters to your controller and routes to your router to allow a
client-side JS app to take over the entire page.

## Setup

Install the gem with Bundler:

```ruby
gem 'iceburn'
```

Add the following line to **config/routes.rb**:

```ruby
Rails.application.routes.draw do
  iceburn_html!
end
```

And this to `ApplicationController`:

```ruby
class ApplicationController < ActionController::Base
  before_action :filter_html_requests
end
```

## Usage

To whitelist controllers, define a whitelist:

```ruby
class ApplicationController < ActionController::Base
  iceburn_whitelist 'devise/sessions'
  before_action :filter_html_requests
end
```

This will not run the `filter_html_requests` method on such controllers,
as they interfere with the normal process.

You also get a "free" route that points to 'application#index' and just
returns an empty string, allowing your JS app to take over the layout.

## License

[University of Illinois/NCSA Open Source License][ncsa]

    Copyright (c) 2014 Tom Scott
    All rights reserved.

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the "Software"),
    to deal with the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimers.

    Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimers in the documentation
    and/or other materials provided with the distribution.

    None of the names of its contributors may be used to endorse or promote
    products derived from this Software without specific prior written permission.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
    INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
    OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS WITH THE SOFTWARE.

[ncsa]: http://opensource.org/licenses/NCSA
