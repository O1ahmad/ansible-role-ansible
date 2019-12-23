title "Ansible Galaxy content install test suite"

describe directory('/home/ansible/.ansible/roles/0x0i.systemd') do
  it { should exist }
end

describe directory('/home/ansible/.ansible/roles/0x0i.tmux') do
  it { should exist }
end

describe command('ansible-galaxy role list') do
  its('stdout') { should match("0x0i.systemd") }
  its('stdout') { should match("0x0i.tmux") }
end

describe command('ansible-galaxy collection --help') do
  its('exit_status') { should eq 0 }
end

describe directory('/home/ansible/.ansible/collections/ansible_collections/newswangerd/collection_demo') do
  it { should exist }
end
