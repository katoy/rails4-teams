require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:team) { Team.create(name: 'team_x', description: 'description of x') }
  before do
    team.save!(validate: false)
    @member = team.members.build(
      target_id: 1,
      target_type: 'Staff'
    )
  end

  subject { @member }

  it { should respond_to(:target_type) }
  it { should respond_to(:target_id) }

  it 'should be valid' do
    expect(@member.valid?).to eq(true)
  end

  # it 'team_id should be present' do
  #   @member.team_id = nil
  #   expect(@member.valid?).to eq(false)
  # end
end
