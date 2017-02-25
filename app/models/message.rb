class Message < ApplicationRecord
  # belongs_to :model
  # equivalent
  # belongs_to :model, class_name: 'Model', foreign_key: 'model_id'
  # in that case, model = Model.find_by_id(id: model_id)
  # if foreign_key does not exist, Rails will get the name after belongs_to
  # add _id and use it foreign key
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  mount_uploader :image, ImageUploader
  validates :subject, :body, presence: true
  validates_processing_of :image
  validate :image_size_validation

  def unread
    read_at ? false : true
  end

  private
    def image_size_validation
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

  # Fake messages generator for testing purpose
  # def self.generate_messages
  #   5.times do
  #     Message.create(subject: Faker::Lorem.word,
  #                    body: Faker::Lorem.sentence,
  #                    sender_id: rand(7..11),
  #                    recipient_id: 6)
  #   end
  # end
end
