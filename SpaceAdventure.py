# Setup
import random

yes_no = ["yes", "no"]
directions = ["left", "right", "forward", "backward"]

# Intro
name = input("What is your name?\n")
location = input("Where are you from?\n")

print("Welcome, " + name + "!")
print("I hear " + location + " is looking for volunters for a space exploration mission.")

# Start
response = ""

while response not in yes_no:
    response = input("Do you think you have what it takes?\nyes/no\n")
    if response == "yes":
        print("Confidence... I like that!\n")
    elif response == "no":
        print("Come back when you've got some chest hair.\n")
        quit()
    else:
        print("Does not compute. Let's try that again, shall we?\n")

# Part 1: Fitness Test 