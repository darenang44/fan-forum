class Comment < ApplicationRecord
  # ran rails generate model Comment content:text topic:references user:references
  # topic:references user:references created the belongs_to for us
  belongs_to :topic
  belongs_to :user
end
