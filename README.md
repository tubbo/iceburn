# Iceburn

A quick and dirty Rails plugin for client-side javascript apps. Adds
filters to your controller and routes to your router to allow a
client-side JS app to take over the entire page.

## Setup

Install the gem with Bundler:

```ruby
gem 'iceburn'
```

## Usage

Add this mixin to **app/controllers/application_controller.rb**:

```ruby
```

And this one to your **config/routes.rb**:

```ruby
```

And you'll get a free route that points to 'application#index' and just
returns an empty string, allowing your JS app to take over the layout.
