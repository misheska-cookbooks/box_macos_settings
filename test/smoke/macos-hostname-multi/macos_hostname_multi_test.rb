# # encoding: utf-8

describe command('scutil --get HostName') do
  its('stdout') { should eq "misheska\n" }
end

describe command('scutil --get LocalHostName') do
  its('stdout') { should eq "MacBook\n" }
end

describe command('systemsetup -getcomputername') do
  its('stdout') { should eq "Computer Name: Mischa's MacBook\n" }
end

describe command('scutil --get ComputerName') do
  its('stdout') { should eq "Mischa's MacBook\n" }
end
