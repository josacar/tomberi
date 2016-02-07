require_relative '../spec_helper'

describe 'tomberi::ntp' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it { is_expected.to create_tomberi_ntp('default') }
end
