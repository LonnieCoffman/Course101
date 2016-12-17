# text file for this example borrowed from
# http://www.it.iitb.ac.in/~vijaya/ssrvm/worksheetscd/getWorksheets.com/Language%20Arts/madlibsdoc.pdf

NOUNS = %w(adult derby kitchen squirrel team
           trailer bookcase cabin gas epoxy).freeze
VERBS = %w(remind command shop explain examine
           delight smoke spill sail concentrate).freeze
ADJECTIVES = %w(small boundless colossal excited fluffy
                snobish tense grouchy narrow witty).freeze
ADVERBS = %w(repeatedly politely happily mockingly sleepily
             sweetly seldom absentmindedly tenderly freely).freeze

def word_sub(text)
  text.gsub!('(noun)', NOUNS.sample)
  text.gsub!('(verb)', VERBS.sample)
  text.gsub!('(adjective)', ADJECTIVES.sample)
  text.gsub!('(adverb)', ADVERBS.sample)
  text
end

File.open('madlibs.txt', 'r') do |text|
  text.each_line do |line|
    puts word_sub(line)
  end
end
