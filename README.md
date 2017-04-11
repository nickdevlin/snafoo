# SnaFoo

SnaFoo is an app which allows employees within a workplace to suggest and vote on snacks to be purchased and made available to staff for the following month. The Ruby on Rails app lets employees suggest a snack by either choosing from a list of previous suggestions or entering a snack and purchase location of their choosing. Each month, an employee can suggest one snack and vote for up to three snacks. The app is designed in such a way as to display the number of remaining votes at the top of the page.

### What additional features could be added in the future?

A few things, off the top of my head:

1. A feature to report when the office was out of a certain snack, potentially allowing it to be instantly reordered from Amazon 
2. Individual pages for snacks to show their voting and purchase history, with the ability to vote from that page
3. A nav bar that shows up on each of the site's page, giving the current user, the votes they've cast for the current month, and the number of votes remaining
4. Vote buttons that show up only when a vote can be cast

### What approach would need to be taken to make the app available at different offices in different locations?

The web service could be altered to store an office location. That way, the only snacks being shown on each office's votes page or the suggestions dropdown would be those which were specific to that office. We can't have Phoenix getting Kansas City's slabs of ribs or Chicago voting on Minneapolis' lutefisk.

### How could security be improved within the app?

The addition of user authentication, with a gem like BCrypt or Devise, would allow an employee could sign up for an account, using a unique identifier like an employee ID number for verification, then have the ability to log in from other devices and locations. Also, employees would get the security and comfort that their votes wouldn't be stolen by a nefarious coworker. 

### What could be done to allow employees to use any device while keeping the rules intact for voting and suggestions?

With the creation of a user table, and the addition of a user ID to the votes and suggestions tables, users could be tied to their votes and suggestions. Searches run for those objects created within the current month would make it easy to determine whether a given user has surpassed her limit in each of those areas.

### What approach could be taken to create a shopping list which always contained 10 items?

On a given date each month, the snacks purchased every month and the top vote-getters would be emailed to the office manager, or person in charge of purchasing the snacks. They could be sorted by purchase location for easier shopping.
