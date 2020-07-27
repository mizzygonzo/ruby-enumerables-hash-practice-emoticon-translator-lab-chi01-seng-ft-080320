require 'yaml'

def load_library(file_path)
  get_emoticon = {}
  get_meaning = {}
  emoticons = YAML.load_file(file_path)

  emoticons.each do |emoticon|
    meaning = emoticon.first
    english_emoji = emoticon.last.first
    japanese_emoji = emoticon.last.last

    get_meaning[japanese_emoji] = meaning
    get_emoticon[english_emoji] = japanese_emoji
  end
  {"get_emoticon" => get_emoticon, "get_meaning" => get_meaning}
end

def get_japanese_emoticon(file_path, emoticon)
  h = load_library(file_path)
  if h.values.first[emoticon]
    h.values.first[emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  h = load_library(file_path)
  if h.values.last[emoticon]
    h.values.last[emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end