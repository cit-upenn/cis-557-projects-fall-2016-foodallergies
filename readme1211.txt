DiaryEntry (functionality/ view):
- The feature of detecting allergens is added to the diary, which support interaction with database or API. The user can see the detailed allergens and will be alert if they are on the page of the specific diary entry page (show page). This feature is enabled by the helper method in controller to be accessed by views. However the interaction with API from the index page takes a longer time, which could be improved.

- The download feature for diary is also added, which is enabled by gem and interaction between controller and the download.html.erb view.

Food Search using API (controller/ view)
- In the precious iteration, if a user is intersted in the allergens of a particular food and wants to compare its allergens with the user's potential allergens, this food has to been added to the local database first before any query. In this iteration, I modified the search function in the food controller so that the allergen information can be compared without having to add the food to the database in the first place. This feature is modified to satisfy the client's need.

admin (controller/ view)
- An admin is predefined in the seed with username: admin, passward: 12345678. An extra button called 'Check Patients Info' appears once an admin logs in, through which this admin can look up all users' information and actions. A new page appears with route: user#index, showing all users' username, email and a button called "Allergens and Diary Entries", which leads the admin to a new page with route: user#show. Views of these two routes are defined.



Testing

DiaryEntry (RSpec): Most components of the diary section are tested, including the index page rendering, creating new diary entry, destorying a diary entry, sorting and downloading the diary.

Food (RSpec and Cucumber): Most components of the food section are tested, including the index page rendering, creating new diary entry, editing a food entry and search allergen of a food.

RSpec added:
Models: allergen, food_api, food, ingredient, user, weight
Controllers: allergen, diary_entry, food, ingredient, static_page, user, weight




Monitoring:
From New Replic, we see that database activities are all quick, the longest one is around 0.002 s). But in terms of speed, loading diary index page takes relatively long time (>2s). This can be improved by changing the way that diary controller access data. To achieve this, the information about allergens of food can either be stored in database after the first time of access, or populate the food database from API.
