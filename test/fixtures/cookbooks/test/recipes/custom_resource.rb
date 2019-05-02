apt_update

build_essential

perlbrew '/opt/perlbrew' do
  upgrade false
end

perlbrew_perl '5.28.0' do
  install_options '--noman --notest'
end

perlbrew_profile '/etc/profile.d/perlbrew.sh'

perlbrew_lib '5.28.0@mylib'

perlbrew_cpanm 'install Mojolicious' do
  modules ['Mojolicious']
  options '--notest'
  perlbrew '5.28.0@mylib'
end

perlbrew_switch '5.28.0@mylib'

perlbrew_run 'Run "mojo version"' do
  command 'mojo version'
  perlbrew '5.28.0@mylib'
end

perlbrew_switch 'off'

perlbrew_lib '5.28.0@mylib' do
  action :delete
end