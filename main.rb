# Clean a word by replacing characters with a diacritic with their equivalent without one
def clean_word word
  word.
    gsub(/àâä/, 'a').
    gsub(/éèêë/, 'e').
    gsub(/îï/, 'i').
    gsub(/ôö/, 'o').
    gsub(/ûü/, 'u').
    gsub(/ç/, 'c')
end

def sort_letter_for word
  word.chars.sort.join
end

def process
  result = {}

  file = File.read('words.txt')
  file.split("\r\n").each do |word|
    cleaned_word = clean_word word
    sorted_letters = sort_letter_for cleaned_word
    result[sorted_letters] ||= []
    result[sorted_letters].push(word) unless result[sorted_letters].include?(word)
  end

  result
end

def execute source
  processed_words = process
  result = processed_words.values
  puts result.inspect
end

execute 'words.txt'
