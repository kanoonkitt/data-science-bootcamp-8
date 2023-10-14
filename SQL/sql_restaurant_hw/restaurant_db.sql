
-- Create the Customer table
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  phone_number VARCHAR(20),
  address VARCHAR(100)
);

-- Create the Menu table
CREATE TABLE Menu (
  menu_id INT PRIMARY KEY,
  dish_name VARCHAR(50),
  price DECIMAL(8, 2),
  ingredient_id INT,
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

-- Create the Invoice table
CREATE TABLE Invoice (
  invoice_id INT PRIMARY KEY,
  customer_id INT,
  menu_id INT,
  quantity INT,
  total_amount DECIMAL(8, 2),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

-- Create the Ingredient table
CREATE TABLE Ingredient (
  ingredient_id INT PRIMARY KEY,
  ingredient_name VARCHAR(50)
);

-- Insert sample data into the Customer table
INSERT INTO Customer (customer_id, name, phone_number, address)
VALUES
  (1, 'John Doe', '123-456-7890', '123 Main St'),
  (2, 'Jane Smith', '987-654-3210', '456 Elm St'),
  (3, 'David Johnson', '555-123-4567', '789 Oak Ave'),
  (4, 'Sarah Wilson', '444-555-6666', '321 Pine St'),
  (5, 'Michael Brown', '777-888-9999', '567 Cedar Ave');

-- Insert sample data into the Menu table
INSERT INTO Menu (menu_id, dish_name, price, ingredient_id)
VALUES
  (1, 'Cheeseburger', 9.99, 1),
  (2, 'Chicken Alfredo', 12.99, 2),
  (3, 'Margherita Pizza', 10.99, 3),
  (4, 'Caesar Salad', 8.99, 4),
  (5, 'Fish and Chips', 11.99, 5),
  (6, 'Spaghetti Bolognese', 14.99, 6);

-- Insert sample data into the Invoice table
INSERT INTO Invoice (invoice_id, customer_id, menu_id, quantity, total_amount)
VALUES
  (1, 1, 1, 2, 19.98),
  (2, 2, 3, 1, 10.99),
  (3, 3, 2, 3, 38.97),
  (4, 4, 3, 2, 21.98),
  (5, 5, 6, 1, 14.99);

-- Insert sample data into the Ingredient table
INSERT INTO Ingredient (ingredient_id, ingredient_name)
VALUES
  (1, 'Beef'),
  (2, 'Chicken'),
  (3, 'Tomato'),
  (4, 'Lettuce'),
  (5, 'Fish'),
  (6, 'Ground Beef'); 

