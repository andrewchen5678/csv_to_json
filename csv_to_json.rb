#!/usr/bin/env ruby
require 'csv'
require 'json'

input_file=ARGV[0]

#output_file=ARGV[1]

output={}

CSV.foreach(ARGV[0], :headers => true) do |csv_obj|
	test=csv_obj.to_hash
    output[test["category"]] = output[test["category"]] || []
    output[test["category"]].push(test.tap { |hs| hs.delete('category') })
end

output_json=JSON.dump(output)

puts output_json

fname = ARGV[1]

if(!fname.nil?)
	#json_file=fname.chomp(File.extname(fname))+".json"
	File.open(fname, 'w') { |file| file.write(output_json) }
end