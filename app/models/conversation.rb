# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :messages

  scope :between, ->(user1_id, user2_id) do
    joins(:users).where(users: { id: user1_id }) & joins(:users).where(users: { id: user2_id })
  end
end
