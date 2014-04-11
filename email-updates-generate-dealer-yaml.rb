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

# filename  = 'all_dealers_yaml.txt'

require 'CSV'
filename1 = 'email-updates-all-dealers-export.csv'
filename2 = 'email-updates-dealer-list-yaml.txt'

some_array = []
CSV.foreach(filename1) do |row|
  some_array.push row
end

File.open filename2, 'w' do |f|
  f.write "---\n"
      some_array.each do |dealer|
        f.write "#{dealer[0]}:\n"
        f.write "  :fromname: #{dealer[1]}\n"
        f.write "  :frommail: #{dealer[2]}\n"
        f.write "  :logo: #{dealer[3]}\n"
        f.write "  :web: #{dealer[4]}\n"
        f.write "  :email: #{dealer[5]}\n"
      end
end

# 0 AL0170
# 1 The Paper Lady
# 2 thepaperlady@et.printswell.com
# 3 AL0170.gif
# 4 http://thepaperlady.printswell.com/
# 5 donna@thepaperlady.net

# FL0511:
#   :fromname: An Invitation to Grace
#   :frommail: aninvitationtograce@et.printswell.com
#   :logo: FL0511.gif
#   :web: http://invitationtograce.printswell.com/
#   :email: aninvitationtograce@gmail.com