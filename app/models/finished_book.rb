class FinishedBook
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :title, :type => String, required: true
  field :author, :type => String, required: true
  field :student, :type => String, required: true
  field :central_idea, :type => Text, required: true
  field :genre, :type => String
end
