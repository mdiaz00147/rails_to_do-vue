# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Project, :type => :model do
  subject { Project.new(params) }

  let(:params) {
    {
      :title => 'Some Big Project'
    }
  }

  describe 'validations' do
    it 'is valid with valid params' do
      expect(subject).to be_valid
    end

    it 'requires a title' do
      params[:title] = ''

      expect(subject).to_not be_valid
      expect(subject.errors.keys).to eq [:title]
    end
  end
end
