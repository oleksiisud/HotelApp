# HotelApp
## :hotel: About
Hotel Management System (HMS) is a database designed to streamline hotel operations by efficiently managing room bookings, event schedules, customer details, and local attractions. It ensures smooth operations, enhances guest experience, and provides real-time updates for staff and customers. Created for CISC 3810 Database Systems class.
## :bookmark_tabs: Features
- Existing Guests, New Guests or Hotel Staff/Manager
- View and book available rooms
- Track ongoing events
- Provide information of hotel services/amenities
- Compute prices, manage and store data
- Compare hotel ratings and costs
- Booking an available room
- Adding assists
## :briefcase: Business Rules
- A Guest can book multiple rooms, but each room has one guest.
- Rooms have types (standard, single, double, or deluxe) and availability information, therefore guests are only allowed to book available rooms.
- Staff Positions are Front Desk Agent, Concierge, Housekeeper, Manager, and Event Coordinator.
- A Booking must be associated with a valid existing room number and unique transaction number.
- Staff are available to assist Guests and manage multiple services based on their position.
- A Hotel manages multiple staff, guests, booking information and events.
- A Hotel can have many rooms, organize many events and provide many services.
- Guests can make many Bookings, each booking for each available room.
- Staff email address determines position and salary.
## :bar_chart: E-R Table
| Object                      | Number |
|-----------------------------|:------:|
| Entity Sets                 |   7    |
| Weak Entity Sets            |   0    |
| Relationship (total)        |   8    |
| Relationship (one-to-one)   |   1    |
| Relationship (one-to-many)  |   6    |
| Relationship (many-to-many) |   1    |
## :page_facing_up: Relational Database Schema
Hotel(<u>name</u>, <u>address</u>, phoneNumber, rating)\
Staff(name, <u>emailAddress</u>, <u>position</u>, salary, <u>hotelName</u>, <u>hotelAddress</u>)\
Guests(name, <u>emailAddress</u>, phoneNumber, partySize)\
Rooms(<u>roomNumber</u>, roomType, availability, roomCapacity, <u>hotelName</u>, <u>hotelAddress</u>)\
Booking(<u>transactionNumber</u>, <u>guestEmailAddress</u>, cost, <u>roomNumber</u>, <u>hotelName</u>, <u>hotelAddress</u>)\
Services(<u>title</u>, description, cost, <u>hotelName</u>, <u>hotelAddress</u>)\
Events(<u>name</u>, <u>time</u>, type, <u>hotelName</u>, <u>hotelAddress</u>)\
Assistance(<u>staffEmailAddress</u>, <u>staffPosition</u>, <u>guestEmailAddress</u>)