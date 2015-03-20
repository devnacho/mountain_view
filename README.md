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
Create components following this directory structure

```
app/
  components/
    header/
      header.css
      _header.html.erb
      header.js
      header.yml
```

### Component Example
You can write your own templates on erb, haml or any other templating language.
Same goes with stylesheets and javascripts. You can use scss, sass or
coffee-script as long as you have these preprocessores running on your app.

```erb
<!-- app/components/header/_header.html.erb -->
<div class="header">
  <h1>This is a header component with the title: <%= properties[:title] %></h1>
  <h3>And subtitle <%= properties[:subtitle]</h3>
</div>
```

### Using components on your views
You can then call your components on any view by using the following
helper:

```erb
<%= ui_component "header", { title: "This is a title", subtitle: "And this is a subtitle" } %>
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/jgnatch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Team

### Current Maintainers

* [Esteban Pastorino](https://github.com/kitop)
* [Ignacio Gutierrez](https://github.com/jgnatch)

