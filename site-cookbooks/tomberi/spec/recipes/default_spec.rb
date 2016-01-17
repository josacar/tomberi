require_relative '../spec_helper'

describe 'tomberi::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  it { is_expected.to include_recipe('ntp') }
end
