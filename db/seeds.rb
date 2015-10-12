Category.create(name: "Fast Food")
Category.create(name: "Fine Dining")

Restaurant.create(name: "McDonald's", description: "I'm lovin' it!", image_url: "mcdonalds-building.jpg", category_id: 1)
Restaurant.create(name: "Burger King", description: "Have it your way!", image_url: "burgerking-building.jpg", category_id: 1 )
Restaurant.create(name: "Wendy's", description: "Quality is our recipe!", image_url: "wendys-building.jpg", category_id: 1)

Restaurant.create(name: "Ruth's Chris Steakhouse", description: "Ruth's Chris Steak House is a chain of 136 steakhouses 
                  across the United States and in several international locations. The restaurant is regarded as an upscale 
                  fine dining establishment, marking a gradual elevation in its status since its founding in the 1960s. 
                  Ruth's Chris is currently the largest luxury steak company in number of locations, operating income, and overall profit, 
                  larger than The Palm and Morton's.", image_url: "ruthchris2.jpg", category_id: 2)
                  
Restaurant.create(name: "Morton's The Steakhouse", description: "Morton’s The Steakhouse is a chain of more than 70 steak restaurants with 
                  locations in the United States and in cities in the USA and abroad. It is a wholly owned subsidiary of Landry's, Inc. 
                  founded in Chicago in 1978.", image_url: "mortons2", category_id: 2 )
                  
Restaurant.create(name: "The Oceanaire Seafood Room", description: "Sleek and sophisticated, The Oceanaire provides the perfect setting to 
                  enjoy the freshest seafood flown in daily from around the world. Our knowledgeable staff will delight you with exceptional 
                  service — guiding you through the wide variety of items on our menu and helping you select the perfect wine to complement your meal. 
                  You'll find out why The Oceanaire has been voted one of the best seafood restaurants in the country.", image_url: "oceanaire", category_id: 2)

Review.create(rating: 2, content: "This place rocks... Not!", 
              restaurant_id: 1, user_id: 1)

Review.create(rating: 1, content: "This place blows... so disappointed we came here.", 
              restaurant_id: 2, user_id: 1)
              
Review.create(rating: 5, content: "Our favorite fast food spot. Always fresh food here.", 
              restaurant_id: 3, user_id: 1 )              

User.create(username:"dcousette", password:"dcousette")