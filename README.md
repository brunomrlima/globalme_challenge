# Globalme Interview Challenge


Dear candidate,

You are free to implement this test on an IDE in your machine or online. During the live technical interview, you are expected to:

1. share your screen
2. run the code on the below example as a sample test
3. explain your choices of data structures and algorithms

There will be another live coding question during the interview, so please have your IDE ready for that as well.

If you have any questions or concerns, please let us know.

Good luck!
 
------------------

Our crowdsourcing app distributes different types of tasks (speech recording, image annotation, audio transcription, etc) to our user base, based on their user profile details.

In this case, you are tasked with writing our task distribution algorithm in ​Ruby​.

As a simple example, a speech recording ​task​ (say “Hello Siri”) needs to be distributed to approximately 100 ​users​. These users need to be:

- 50% Male, 50% Female
- 40% Children, 60% Adults
- 25% English, 25% French, 25% Indian, 25% Japanese
In this case, the output would be 16 ​task groups​, such as:
- Task group of 5 users who are Male, Children, English
- Task group of 8 (rounded up from 7.5) users who are Female, Adults, Indian -...

Your mission is to:
1. Write the Ruby classes to represent the above domain objects.
2. Write the unit test against which you will test your algorithm, using the above example as
mock data.
3. Write the algorithm to implement the above task distribution business logic.
4. Make sure your test passes. You don’t need to code very thorough pass checks. It’s
enough to do a couple of spot checks, and the rest we can verify visually by printing the output.