class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps
  include Clearance::User

  field :email, :type => String, required: true
  field :encrypted_password, :type => String, max_length: 128
  field :confirmation_token, :type => String, max_length: 128
  field :remember_token, :type => String, max_length: 128
end
