# Clean a word by replacing characters with a diacritic with their equivalent without one
def clean_word word
  diacritics = {
    ['à','â','ä'] => 'a',
    ['é','è','ê','ë'] => 'e',
    ['î','ï'] => 'i',
    ['ô','ö'] => 'o',
    ['û','ü'] => 'u',
    ['ç'] => 'c',
  }

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

  file = File.new('words.txt')
  file.advise(:sequential)
  file.each_entry do |word|
    word = word.chomp
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
