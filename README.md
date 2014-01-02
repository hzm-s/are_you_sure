# AreYouSure

This plug-in inserts a confirmation page before creation or updating action.

And therefore, it is not necessary to add new routing(action) or to modify a model. 

1. show form
2. show confirm page (*)
3. create or update a model

## Installation

Add this line to your application's Gemfile:

    gem 'are_you_sure'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install are_you_sure

## Usage

### Controller

```ruby
def new
  @todo = confirm_for Todo.new
end
    
def create
  @todo = confirm_for Todo.new(todo_params)
  if @todo.save
    redirecto_to @todo
  else
    render action: :new
  end
end
    
def edit
  @todo = confirm_for Todo.find(params[:id])
end
    
def update
  @todo = confirm_for Todo.find(params[:id])
  if @todo.update_attributes(todo_params)
    redirect_to @todo
  else
    render action: :edit
  end
end
```

### View

```erb
<%= are_you_sure_form_for @todo do |f| %>
  <%= f.confirmation message: 'CONFIRM MESSAGE' %>
  
  <% if @todo.errors.any? %>
    <div id="errorExplanation">
      <ul>
      <% @todo.errors.full_messages do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>
  
  <div>
    <%= f.label :deadline %>:
    <%= f.datetime_select_or_confirm :deadline, { order: [:year, :month, :day], use_month_numbers: true } %>
  </div>
  <div>
    <%= f.label :description %>:
    <%= f.text_field_or_confirm :description %>
  </div>
  <div>
    <%= f.label :done %>:
    <%= f.check_box_or_confirm :done %>
  </div>
  <div>
    <%= f.submit_or_confirm %>
  </div>

<% end %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
