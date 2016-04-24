describe package('munin-node') do
  it { should be_installed }
end

describe package('munin-common') do
  it { should be_installed }
end

describe package('munin-plugins-core') do
  it { should be_installed }
end

describe package('munin-plugins-extra') do
  it { should be_installed }
end
