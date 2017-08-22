# == Schema Information
#
# Table name: users
#
#  id    :integer          not null, primary key
#  name  :string           not null
#  email :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true
end
