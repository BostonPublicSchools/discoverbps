require 'find'

# Define the root directory of your project
project_root = Dir.pwd

# Iterate through all Ruby files in the project
Find.find(project_root) do |path|
  next unless path.end_with?('.rb') # Only check Ruby files

  text = File.read(path)

  if text.include?('update')
    new_text = text.gsub(/\bupdate_attributes\b/, 'update')

    File.write(path, new_text)
    puts "Updated: #{path}"
  end
end

puts "✅ Replacement completed!"
