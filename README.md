### Introduction

**Practical Approach:**
This project, to be completed in one day, aims to quickly validate a concept focusing on presence management in a housing unit. The concept will be implemented through a Ruby API, allowing both the listing of absences and the injection of presence periods associated with one or more housing units.

**Objectives to Validate:**

**Question 1:** Calculate absences associated with a housing unit based on initially submitted presence records and provide an endpoint to return them.

**Question 2:** Provide an endpoint to update the recorded absences.

**Contextual Approach:**
For this test, the discovery of a new framework will be considered, with a strong need to explain the choices made and the different steps involved.

### Technical Design

**Step 1: Architecture / Project Initialization**
1. Build a Rails project in API mode.
2. Create the `Studio` class.
3. Create the `Stay` class containing a start and end date.

**Step 2: Persistence and Data**
1. Create the database (SQLite or PostgreSQL).
2. Initialize the data (Seeds).

**Step 3: Business Logic Implementation and Validation**
1. The `Stay` class is a dependent reference of the `Studio` class.
2. The start date is mandatory.
3. The end date must be after the start date.

**Step 4: Providing Absences by Studio**
1. Create a `Studios` controller.
2. Create an internal function for calculating absences
3. Generate an absences array per studio and provide it as a JSON output.

**Step 5: Allow Updating Studio Presence Records**
1. Create a `Stays` controller.
2. Create a `Create` method to handle an HTTP POST request, which receives a list of absences and returns the execution result.
3. Implement the `Create` method to introduce new presence and absence periods based on the provided dates.

**Step 6: Expose New Interactions and Test Them**
1. Update the application routes.
2. Use Postman or curl to make a GET request to `http://XXXX/studios`.
3. Use Postman or curl to make a POST request to `http://XXXX/stays` (Content-Type: application/JSON); Body: { <list of absences> }.
4. Add RSpec test

**Toolbox**
1. Run project
   a. gem install bundler
   b. bundle install
   c. rails db:create
   d. rails db:migrate
   e. rails db:seed
   f. rails server
2. (Altenative) Run RSpec tests 
   a. bundle exec rspec