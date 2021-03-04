TEXT_FILE="romeo-juliet.txt"
REFERENCE_TEXT_FILE = "hamlet.txt"

$global_variable = 5

# Load the words from a file
def words_from_file(text_file)
    File.read(text_file).downcase.gsub(/[^a-z]/," ").split
rescue
        puts "Give me #{text_file} and let's get the party started"
        exit     
end

# Load the list of words in the text and reference text
words = words_from_file(TEXT_FILE) 
words_to_remove = words_from_file(REFERENCE_TEXT_FILE).uniq

# Remove from the text all the words that also appean in the reference text
words_to_remove.each do |word|
    words.delete word   
end

#Create a dictionary of word counts
WORD_COUNT={}
words.each do |w|
   WORD_COUNT[w]=0 unless WORD_COUNT[w]
   WORD_COUNT[w]+=1
end

# Show the most frequent words and their counts
WORD_COUNT.sort_by {|word, count| count}
        .reverse[0...40]
        .each {|word, count| puts "#{word}: #{count}"}