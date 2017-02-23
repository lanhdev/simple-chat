class Message < ApplicationRecord
  # belongs_to :model
  # equivalent
  # belongs_to :model, class_name: 'Model', foreign_key: 'model_id'
  # in that case, model = Model.find_by_id(id: model_id)
  # if foreign_key does not exist, Rails will get the name after belongs_to
  # add _id and use it foreign key
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
