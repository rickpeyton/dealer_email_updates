require 'yaml'
# Define yaml save and load methods...
def yaml_save object, filename
  File.open filename, 'w' do |f|
    f.write(object.to_yaml)
  end
end
# Save it example
# yaml_save email_addresses, filename

def yaml_load filename
  yaml_string = File.read filename

  YAML::load yaml_string
end
# Load it example
# read_array = yaml_load filename

filename  = 'email-updates-dealer-list-yaml.txt'
filename2 = 'email-updates-import-new-emails.txt'
filename3 = 'email-updates-final-import-file.csv'

# Load it
dealers_list = yaml_load filename

email_addresses = []
File.readlines(filename2).each do |line|
  email_addresses.push line.chomp
end

puts 'Enter the account number for the dealer list to update'
acct_num = gets.chomp
company = dealers_list[acct_num][:fromname]
from = dealers_list[acct_num][:frommail]
logo = dealers_list[acct_num][:logo]
url = dealers_list[acct_num][:web]
reply = dealers_list[acct_num][:email]

# Select a status to include.
statuses = ['Active','Unsubscribed']
x = 1
statuses.each do |status|
  puts "#{x} for #{status}"
  x = x + 1
end
puts 'Select a status to import.'
status = gets.chomp.to_i
status = statuses[status - 1]

File.open filename3, 'w' do |f|
  f.write "Email Address,VariableFromName,VariableFromEmail,Variable Logo,Variable Website,VariableReplyEmail,Status\n"
    email_addresses.each do |address|
      f.write "#{address},#{company},#{from},#{logo},#{url},#{reply},#{status}\n"
    end
end