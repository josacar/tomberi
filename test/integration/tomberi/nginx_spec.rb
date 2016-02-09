describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_installed }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
  its('protocols') { should include 'tcp' }
end

describe port(443) do
  before { skip }

  it { should be_listening }
  its('protocols') { should include 'tcp' }
end
