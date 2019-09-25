# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :items, dependent: :destroy

  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }

  default_scope -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.zone.now)
  end


end
