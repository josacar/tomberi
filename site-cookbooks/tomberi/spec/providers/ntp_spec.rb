require 'spec_helper'

describe 'tomberi_test::ntp' do
  cached(:chef_run) do
    runner = ChefSpec::SoloRunner.new(step_into: ['tomberi_ntp'])
    runner.converge(described_recipe)
  end

  it 'includes ntp::default recipe' do
    expect(chef_run).to include_recipe('ntp::default')
  end
end
