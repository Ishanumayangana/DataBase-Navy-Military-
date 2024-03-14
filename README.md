Navy Database Project
Introduction

This project aims to design and implement a database system for managing various aspects of a Navy (Military) organization. The database is built using MySQL and satisfies functional requirements such as data retrieval, modification, gap handling, modification history tracking, commenting feature, and performance enhancement.
Functional Requirements
1. Data Retrieval

The database system enables efficient and accurate retrieval of data based on user queries and specified criteria.
2. Data Modification

Capability to modify the content of the database, allowing authorized users to update, insert, or delete records as necessary.
3. Data Gap Handling

Ability to identify and fill in missing data or gaps in the database, ensuring data completeness and accuracy.
4. Data Modification History

Users can track and audit changes made to previously entered data in the database, maintaining a history of revisions.
5. Commenting Feature

Users can add comments to data entries, especially when data is missing or questionable, aiding in annotating and documenting data quality concerns.
6. Performance Enhancement

The database system optimizes data access and retrieval processes to ensure improved overall performance.
Data Requirements

The database schema encompasses eight entities relevant to the Navy: Weapon, Ship, Service History, Certificate, Sailor, Rank, Department, and Base.
1. Weapon

    Weapon_ID
    Ship_ID
    Weapon_Name
    Weight
    Range

2. Ship

    Ship_ID
    Ship_Name
    Ship_Type
    Ship_Owner

3. Certificate

    Weapon_ID
    Certificate_Name
    Certificate_Type
    Certificate_Date
    Expiration_Date

4. Department

    Department_ID
    Department_Name
    Department_Email
    Country
    State

5. Base

    Base_ID
    Base_Name
    Base_Department
    Country
    State

6. Sailor

    Sailor_ID
    First_Name
    Last_Name
    Sailor_Department
    Sailor_Ship
    Sailor_Rank
    Sailor_Mentor

7. Rank

    Rank_ID
    Rank_Name

8. Service History

    Sailor_ID
    Service_Type
    Registration_Date
    Registered_date
    Years_of_Service

Additional Entities

    Sailor_Contact: Sailor_ID, Contact_Number
    Base_Contact: Base_ID, Contact_Number
