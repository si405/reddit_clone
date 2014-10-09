# Findings from the Reddit clone

Learned
=======

1.	Understanding how to add custom routes and link_to


Problems encountered
====================
 
1.	Based the up/downvote method on update and tried to use the private function "posts_params" but encountered an error. Switched to just updating the count instead of the entire instance and that worked fine except....

2.	I was not able to increment or decrement the new vote count field since it had a null value. How do you initialize a new attribute to have a particular value?

