#  README

This is a fitness app designed to track a person's exercise done, food intake, and amount.

The DBHelper.swift contains code relating to inserting, deleting, creating, and editing data in our SQLite3 database

The ObjectClasses.swift contains the backend portion and makes our relations as objects to then pass into the database using functions in DBHelper.swift

UI-Helper.swift contains the sample data inputs and various function to help the UI side

LoginViewController.swift contains the code that initializes a database, gets its path, creates tables, then inserts data into those tables. These lines are found near the top in 'override func viewDidLoad()'.
    # The line: "sampleInsert(db: db) // Load in sample data"
    # should be commented out after initial loading because another call won't insert data due to the primary keys being similar.

The UI is handled by the other files
