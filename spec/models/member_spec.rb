require 'rails_helper'

RSpec.describe Member, :type => :model do
  let(:team) { Team.create(name: 'team_x', description: 'description of x') }
  before do
    team.save!(validate: false)
    @member = team.members.build(
      name: 'member_x',
      age: 10,
      mail: 'x@example.com'
    )
  end

  subject { @member }

  it { should respond_to(:name) }
  it { should respond_to(:age) }
  it { should respond_to(:mail) }
  it { should respond_to(:team) }

  it 'should be valid' do
    expect(@member.valid?).to eq(true)
  end

  it 'team_id should be present' do
    @member.team_id = nil
    expect(@member.valid?).to eq(false)
  end
end
