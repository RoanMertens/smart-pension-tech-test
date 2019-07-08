# smart-pension-tech-test

## Entry sorting app

This is the Graduate Developer Test from Smart Pension. It is intended to test how I code and which methodologies I know and use.

## Focus

The focus during the building of this project will be mostly on testing. As I don't have as much experience with TDD and testing with RSpec as I would have liked, I decided that this would be a good opportunity to learn more about the TDD approach.

## Approach

1. I first started with writing down the criteria of the app.
2. I created the folder/file structure of the app.
3. I added the RSpec gem and bundled.
4. I looked up more information about testing in RSpec and wrote the tests for the main class and added the example log files.
5. I ran the tests. They failed. :(
6. I wrote the LogReader class while running the test after every addition.
7. I moved parts of LogReader code to a new Parser class.
8. I added tests for the Parser class and ran them.
9. I refactored the LogReader and the Parser while testing.

## tl;dr

The app consists of two classes. The LogReader that when initialized it accepts a filepath and has two instance methods to show specific sorted lists of entries and the Parser that checks if the file exists and parses it.

## Overview

The app is split in two classes. The LogReader and the parser.

The LogReader class has three public methods and three private methods.

**PUBLIC**
1. The initializer method which takes a filepath. The initializer method calls the parse method of the Parser class. It then stores the parsed entries in the instance variable @entries. example: `{'/help_page/1' => {:all => 4, :unique => 2}} `
2. The #all method that returns a list of pages with a count of entries to each page. Sorted descending. It calls the #sort_desc method and then the #format method with the instance variable @entries, the type :all and the message 'visits'.
3. The #unique method that returns a list of pages with a count of unique entries to each page. Sorted descending. It calls the #sort_desc method and then the #format method with the instance variable @entries where the method .uniq is called on, the type :unique and the message 'unique views'.

**PRIVATE**
1. The #sort_desc method takes a hash with nested hashes and a type sorts it by the nested value linked to the given type from biggest to smallest number and returns it.
2. The #format method takes a hash with nested hashes and a type a message and returns an array of strings with a path a count of amount of entries/unique entries and a message. example: `'/help_page/1 12 visits'`

The Parser class has one public method an three private methods.

**PUBLIC**
1. The method #parse which takes a file path. It calls the #check_file method. Then it opens the file and strips it.  This file is then passed to the #create_entries method. Which returns a hash of nested hashes that is returned to the LogReader instance.

**PRIVATE**
1. The method #check_file which takes a file path. It checks if the given file path points to an existing file and raises an error if it doesn't.
2. The method #create_entries creates an empty hash of hashes. It gives this to the #fill_hash method with the :all type. It gets the hash back and calls the #fill_hash method again for the :unique type.
3. The method #fill_hash takes an empty hash, a type that will become a key in the nested hash and a file from which to take the information. It then interates over the file and counts the entries or unique entries and links it to the right nested key. It only fills one type at a time and therefore is called twice in the #create_entries method.
example:
`first iteration: {'/help_page/1' => {:all => 4, :unique => 0}} `
`second iteration: {'/help_page/1' => {:all => 4, :unique => 2}} `


## Tests

**Steps:**
1. Bundle to get the RSpec gem and the SimpleCov gem.
2. Run RSpec.


## Code coverage
Coverage report generated for RSpec to /smart-pension-code-test/coverage. 67 / 67 LOC (100.0%) covered.


## How to use?

1. cd into lib.
2. Add .log file that you want to return in the data folder.
3. Run one of the following commands in terminal:

ruby -r "./log_reader.rb" -e "p LogReader.new('filepath').all"

ruby -r "./log_reader.rb" -e "p LogReader.new('filepath').unique"

example:
ruby -r "./lib/log_reader.rb" -e "p LogReader.new('./data/webserver.log').unique"
