require 'rails_helper'

RSpec.describe Team, :type => :model do
  before do
    @team = Team.new(name: 'team_x1', description: 'description of x')
  end

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:members) }

  it 'should be invalid' do
    expect(@team.valid?).to eq(false)
  end

  it 'should be valid if team has one member' do
    @team.save!(validate: false)
    @team.members.create(target_type: 'Staff', target_id: 1)
    expect(@team.members.count).to eq(1)
    expect(@team.valid?).to eq(true)
  end

  it 'should be invalid if team has no member' do
    @team.save!(validate: false)
    expect(@team.members.count).to eq(0)
    expect(@team.valid?).to eq(false)

    @team.members.create(target_type: 'Staff', target_id: 1)
    expect(@team.members.count).to eq(1)
    expect(@team.valid?).to eq(true)
  end
end
