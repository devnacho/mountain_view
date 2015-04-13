# Mountain View

Mountain View helps you create reusable visual components on your Rails
Application.

## Installation

Add this line to your application's Gemfile:

    gem 'mountain_view'

Then execute:

    $ bundle

## Usage

### Directory Structure
Create components following this directory structure:

```
app/
  components/
    header/
      _header.html.erb
      header.css
      header.js
      header.yml
```

You can use the built-in generator, to automate the behavior:

```
rails generate mountain_view:component header
```

Keep in mind that you can also use `scss`, `coffeescript`, `haml`, or any other
preprocessors that your app is currently using.


### Component Example
You can write your own templates on erb, haml or any other templating language.
Same goes with stylesheets and javascripts. You can use scss, sass or
coffee-script as long as you have these preprocessors running on your app.

```erb
<!-- app/components/header/_header.html.erb -->
<div class="header">
  <h1>This is a header component with the title: <%= properties[:title] %></h1>
  <h3>And subtitle <%= properties[:subtitle] %></h3>
</div>
```

### Using components on your views
You can then call your components on any view by using the following
helper:

```erb
<%= ui_component "header", title: "This is a title", subtitle: "And this is a subtitle" %>
```

### Assets
You can require all the components CSS and JS automatically by requiring `mountain_view` in you main JS and CSS files.

```
//= require mountain_view
```

### Automatically generated Style Guide
A style guide will be automatically generated. This styleguide never falls behind and it reflects your components in their latest version.

#### Setting up the style guide
1) Add the following line to your `routes.rb` file.
```ruby
mount MountainView::Engine => "/mountain_view"
```
2) Create stubs for your components. This stubs will be the examples in the styleguide.

E.g: `/app/components/card/card.yml`
```yml
-
  :title: "Aspen Snowmass"
  :description: "Aspen Snowmass is a winter resort complex located in Pitkin County in western Colorado in the United States. Owned and operated by the Aspen Skiing Company it comprises four skiing/snowboarding areas on four adjacent mountains in the vicinity of the towns of Aspen and Snowmass Village."
  :link: "http://google.com"
  :image_url: "http://i.imgur.com/QzuIJTo.jpg"
  :data:
  -
    :title: "Elevation"
    :number: '7879ft'
  -
    :title: "Depth"
    :number: '71"'
-
  :title: "Sunset on the Mountain"
  :description: "Three major ranges of the Alps – the Northern Calcareous Alps, Central Alps, and Southern Calcareous Alps – run west to east through Austria. The Central Alps, which consist largely of a granite base, are the largest and highest ranges in Austria."
  :link: "http://google.com"

```
3) Vist `http://localhost:3000/mountain_view/styleguide`

#### Example Style Guide
![mountain_view](https://cloud.githubusercontent.com/assets/623766/7099771/5b06d8da-dfd4-11e4-8558-1b7f026f28ad.gif)


## Contributing

1. Fork it ([https://github.com/jgnatch/mountain_view/fork](https://github.com/jgnatch/mountain_view/fork))
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Team

### Current Maintainers

* [Esteban Pastorino](https://github.com/kitop)
* [Ignacio Gutierrez](https://github.com/jgnatch)

