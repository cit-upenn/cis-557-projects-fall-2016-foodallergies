DiaryEntry (functionality/ view):
- The feature of detecting allergens is added to the diary, which support interaction with database or API. The user can see the detailed allergens and will be alert if they are on the page of the specific diary entry page (show page). This feature is enabled by the helper method in controller to be accessed by views. However the interaction with API from the index page takes a longer time, which could be improved.

The download feature for diary is also added, which is enabled by gem and interaction between controller and the download.html.erb view.






Testing

DiaryEntry (RSpec): The index page of diary is tested, including loading the page, expecting the corrcet render and creating a new entry.







Monitoring:
From New Replic, we see that database activities are all quick, the longest one is around 0.002 s). But in terms of speed, loading diary index page takes relatively long time (>2s). This can be improved by changing the way that diary controller access data. To achieve this, the information about allergens of food can either be stored in database after the first time of access, or populate the food database from API.