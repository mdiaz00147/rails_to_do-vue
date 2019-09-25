# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  action     :string
#  project_id :integer
#  done       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :project
  validates :action,
            presence: true,
            uniqueness: {
                  scope: :project,
                  message: "should be unique within a project",
                }
  validates :project_id, presence: true

  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  scope :complete, -> { where(done: true) }

  default_scope -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.zone.now)
  end

end
