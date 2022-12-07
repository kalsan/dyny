# Introducing Dyny

Dyny is a tiny framework for writing dynamic Rails views directly in Ruby.
Typically, Rails views, are written in
[ERB](https://guides.rubyonrails.org/layouts_and_rendering.html),
[HAML](https://haml.info/) or [Slim](https://github.com/slim-template/slim).
However there are situations where you'd prefer to write regular ruby code
without having to cope with [Tag
Helpers](https://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html)
at every call. This is where Dyny comes in.

A quick and trivial example: Having `MessagesController` and an action
`hello_world`, you can write a file `app/views/messages/hello_world.html.dyny`
with the contents:

```ruby
h1 'Hello world'
div class: 'card mb-3' do
  div class: 'card-body' do
    para "I'm inside a Bootstrap card."
  end
end
```

- Use directory structures similar to ERB views
- The file extension is `.html.dyny`
- Call HTML elements as methods and nest them using blocks. There are three special cases:
  - Since the method name `p` is already taken, use `para` to generate a `<p>` tag.
  - Since the method names `label` and `select` are taken by Rails, use
    `tag.label` and `tag.select` instead.
- Arguments given to Dyny HTML helper methods are passed to the [Rails `tag`
  helper](https://api.rubyonrails.org/classes/ActionView/Helpers/TagHelper.html#method-i-tag),
  for instance `class` in the example above.
- If you don't want a HTML tag, but output plain text, use `concat`. See examples below.

**Dyny was tested with Rails 7.**

# But dynamic views are bad?

Rails views are meant to merely display data that was already pre-processed
elsewhere, such as helpers or controller actions. However, as your application
gets very complex, there may be situations where adhering to that principle
leads to code scattered all over your application. Also, for rapid prototyping,
you might wanna start writing your first proof-of-concept code directly into the
view. This is where dyny jumps in to fill the gap and lets you write views
directly in Ruby.

Dyny does not prevent you from writing most of your views in ERB or HAML. The
file name ending of the view decides which processor is used. If your file ends
with `.html.erb`, you write ERB HTML; if it ends with `.html.dyny`, you can
write plain Ruby with the help of Dyny.

# Installation

1. Add the gem to your Gemfile: `gem 'dyny'`
2. Run `bundle` to install it.

# Usage

## In a template

Simply have the file name of your view end with `.html.dyny` and write plain
ruby in it, as shown in the example above.

## In `render` or `render_to_string`

You may speficy `type: :dyny` in your render call to have Rails process your string with Dyny. Using `inline`, you may supply a string containing ruby.

As an example: in your controller, you may call:

```ruby
render_to_string(
  type:   :dyny,
  locals: { foo: :bar },
  inline: <<~RUBY
    h1 'Hello world'
  RUBY
)
```

# Examples

## A trivial index page

```ruby
h1 'All users'
ul do
  @users.each do |current_user|
    li current_user.name
  end
end
```

## Working with simple_form and bootstrap

This illustrates working with Bootstrap and the popular
`[SimpleForm](https://github.com/heartcombo/simple_form)` gem. For a better
overview, we first save the HTML generated by `simple_form_for` into the local
variable `form_html` and use `concat` to output it later.

```ruby
div class: 'card card-body' do
  form_html = simple_form_for :test do |f|
    concat(f.input(:fun))
    div(f.input(:stuff), class: 'mb-3')
    concat f.submit
  end
  concat form_html
end
```

The result is a form with two fields and a submit button.

# Differences to the Arbre gem

This project aims to replace [Arbre](https://github.com/activeadmin/arbre) which
has similar intentions. The key differences to Arbre are:

- Dyny is much smaller and simpler than Arbre but achieves the same features.
- Dyny supports using controller instance variable in views while Arbre does not
- Dyny properly uses the `ActionView` buffer, supporting calls to `concat` or
  `capture`. This means that Dyny fully supports gems making use of these
  features, such as [SimpleForm](https://github.com/heartcombo/simple_form),
  while Arbre breaks such gems because it uses its own buffer.
- Where Arbre uses `text_node`, Dyny lets you use the native Rails method
  `concat` to output raw text.
- Arbre has its own `Context` concept while Dyny does not. To have Dyny
  generated HTML saved to a string variable, use Rails' `render_to_string`
  method instead, see example above.

# Contributing

You are welcome to contribute to this project via the regular fork and pull
request procedure.