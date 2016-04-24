require 'spec_helper'

describe 'tomberi::munin' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it { is_expected.to install_package('munin-node') }
end
