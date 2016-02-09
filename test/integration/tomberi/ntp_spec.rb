describe package('ntp') do
  it { should be_installed }
end

control '01' do
  impact 0.7
  title 'Verify ntp service'
  desc 'Ensures ntp service is up and running'
  describe service('ntp') do
    it { should be_installed }
    it { should be_running }
  end
end
