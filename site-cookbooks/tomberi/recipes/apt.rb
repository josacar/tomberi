package 'apt-transport-https'
package 'lsb-release'
package 'gnupg'

apt_update 'update_repo' do
  action :update
end
