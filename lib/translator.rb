require 'yaml'
require 'pry'

def load_library(file_path)
  hash = Hash.new
  hash["get_emoticon"] = {}
  hash["get_meaning"] = {}
  
  file_hash = YAML.load_file(file_path)

  file_hash.each do |meaning, emoticons|
    hash["get_emoticon"][emoticons.first] = emoticons.last
    emoticons.each do |emoticon|
      hash["get_meaning"][emoticon] = meaning
    end
  end
  
  hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  hash = load_library(file_path)
  hash["get_emoticon"][english_emoticon] ? hash["get_emoticon"][english_emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  hash = load_library(file_path)
  hash["get_meaning"][japanese_emoticon] ? hash["get_meaning"][japanese_emoticon] : "Sorry, that emoticon was not found"
end