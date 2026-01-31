require 'json'
require 'csv'

if ARGV[0].nil?
  puts "Usage: ruby cdxview.rb <cyclonedx_json_file>"
  exit 1
end

json_data = File.read(ARGV[0])
data = JSON.parse(json_data)


headers = ['PackageFileName', 'PackageVersion',  'license']

result = CSV.generate do |csv|
  csv << headers

  data['components'].each do |c|
    name = c['name']
    version = c['version']
    license_str = 'NOASSERTION'

    if not c['licenses'].nil? then
      STDERR.puts "warning: multiple liceneses for #{name}" if c['licenses'].size > 1

      licenses0 = c['licenses'][0]
      license_str = licenses0['expression']
      if not licenses0['license'].nil? then
        license_str = licenses0['license']['id'] || licenses0['license']['name']
        if licenses0['license']['name'] == 'Unknown - See URL' then
          if not licenses0['license']['url'].nil? then
            license_str = licenses0['license']['url']
          else
            license_str = c['externalReferences'][0]['url']
          end
        end
      end
    end
    csv << [name, version, license_str]
  end
#  puts csv
end

puts result
