# frozen_string_literal: true

Dir.glob("db/migrate/*.rb") do |file|
  content = File.read(file)

  # Check if the file contains the comment followed by an empty line
  if content.include?("# This migration adds/changes fields in the respective table\n\n")
    # Only remove the extra empty line if it exists
    content.gsub!("# This migration adds/changes fields in the respective table\n\n",
      "# This migration adds/changes fields in the respective table\n")
    File.write(file, content)
    puts "Updated: #{file}"
  end
end
