class Chatroom < ApplicationRecord
  has_many :messages
  # Chatroom.messages
end
