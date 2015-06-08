class BookRecommendation
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :title, :type => String, required: true
  field :author, :type => String, required: true
  field :student, :type => String, required: true
  field :description, :type => Text, required: false
  field :by_teacher, :type => Boolean

  has_many :comments
end