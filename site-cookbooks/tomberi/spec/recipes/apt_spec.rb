require 'spec_helper'

describe 'tomberi::apt' do
  subject { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it { is_expected.to install_package('apt-transport-https') }
  it { is_expected.to install_package('gnupg') }
  it { is_expected.to install_package('lsb-release') }

  it { is_expected.to update_apt_update('update_repo') }
end
