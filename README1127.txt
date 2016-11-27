1.
Github
https://github.com/cit-upenn/cis-557-projects-fall-2016-foodallergies

2.
Pivotal Tracker
https://www.pivotaltracker.com/n/projects/1901153

3.
    diary_entries controller:
- index method is changed to only return the diary entries that match the current user's uid. The diary entries are ordered by time attribute.
- admin_index method is added, which returns all diary entries to be use for admin logins
- get_allergens method is added, which takes a food name as input, return an array of allergens that are both contained by the food, and match the allergens of the user.
- sort method is added, which is use to sort the diary entries by a given attribute
- create method is changed to store the current user's uid for a new diary entry

    Dependency between user and allergens
There are totally eight kinds of allergens set in seed file. Users should be able to set many allergens, while allergens should belong to many users. As a result, the relationship between user and allergens is set to: has_and_belongs_to_many. Then, each user is able to set their own allergens.

    User settings
A new RESTful member route is set as user/:id/settings. The corresponding actions are defined in users_controller. 
Update method is used to update the allergens belong to current user. Users are able to set their allergens through check boxes in the settings page. The setting view is also defined under the users view folder. 

    User Profile
User are able to check their profile including their user information and allergens information.


weight controller:
- index method is changed to only return the weight records that match the current user's uid. The records are ordered by date.
- create method is changed to store the current user's uid for a new weight record


    Food Controller:
I added a search function in the food controller to implement the search functionality. 
At dashboard(homepage), user can click the link search food and will be directed to the search food page. When a user inputs a food name of interest, if this food exists in the database, the page will show the allergens that this food contains. 
In addition, if a user is allergic to certain allergens contained in this food, these allergens will be shown separately in red. 
If the user inputs a food name that does not match any existing entry, nothing will be shown.
