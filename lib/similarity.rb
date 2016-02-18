require "httparty"

API-KEY = "PLACEHOLDER"

module Similarity
  class Similarity
    def self.cosine(debate_file)
      args = []
      File.open(debate_file, "a+") do |file|
        file.each_line do |line|
          next unless line.start_with?("text")
          line.match(/text\(([0-9]+), (.*)\)/) { |m| args << [m[1], m[2]] }
        end

        arg_ids = []
        args.each_with_index do |arg1, it|
          args[it+1..-1].each do |arg2|
            pair = ["#{arg1[1].gsub(/\r\n?/," ").gsub(/#/, "").chomp}","#{arg2[1].gsub(/\r\n?/," ").gsub(/#/, "").chomp}\n"]
            arg_ids << [arg1[0], arg2[0]] + pair
          end
        end

        json_arr = arg_ids.map {|_,_,arg1,arg2| [{"text"=>arg1}, {"text"=>arg2}]}

        response = HTTParty.post("http://api.cortical.io:80/rest/compare/bulk?retina_name=en_associative", :body => json_arr.to_json, :headers => {"api-key" => API-KEY, "Content-Type" => "application/json" })

        response.parsed_response.each_with_index do |h, it|
          file.write("sim(#{arg_ids[it][0]}, #{arg_ids[it][1]}, #{h["cosineSimilarity"]})\n")
        end
      end
    end
  end
end
