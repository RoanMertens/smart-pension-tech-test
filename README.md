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
1. The initializer method which takes a filepath. The initializer method calls the parse method of the Parser class. It then stores the parsed file in the instance variable @file.
2. The return_all method that returns a list of pages with a count of entries to each page. Sorted descending. It calls the count method with the instance variable file and a message.
3. The return_unique method that returns a list of pages with a count of unique entries to each page. Sorted descending. It calls the count method with the unique rows of the instance variable file and a message.

**PRIVATE**
1. The count method which takes a file and a message. It uses a hash to count all duplicates that exist in the file. It calls the sort_desc and the format method. It returns the sorted and formatted array to the return_(all/unique) method.
2. The sort_desc method takes a hash and sorts it by value from biggest to smallest number and returns it.
3. The format method takes a hash and a message and returns a list of rows with a path a count of amount of entries/unique entries and a message.

The Parser class has one public an one private method.

**PUBLIC**
1. The class method parse which takes a file path. It calls the check_file method. Then it parses the file and strips it. This file gets returned as an array of strings.

**PRIVATE**
1. The class method check_file which takes a file path. It checks if the given file path points to an existing file and raises an error if it doesn't.


## Tests

**Steps:**
1. Bundle to get the RSpec gem.
2. Run RSpec.


## How to use?

1. cd into lib.
2. Add .log file that you want to return in the data folder.
3. Run one of the following commands in terminal:

ruby -r "./log_reader.rb" -e "p LogReader.new('filepath').return_all"

ruby -r "./log_reader.rb" -e "p LogReader.new('filepath').return_unique"

example:
ruby -r "./lib/log_reader.rb" -e "p LogReader.new('./data/webserver.log').return_unique"
