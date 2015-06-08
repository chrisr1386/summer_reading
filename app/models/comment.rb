class Comment
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :student, :type => String, required: true
  field :body, :type => Text, required: true

  belongs_to :book_recommendation
end