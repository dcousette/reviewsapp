Category.create(name: "Fast Food")
Category.create(name: "Fine Dining")

Restaurant.create(name: "McDonald's", description: "I'm lovin' it!", image_url: "mcdonalds-building.jpg", category_id: 1)
Restaurant.create(name: "Burger King", description: "Have it your way!", image_url: "burgerking-building.jpg", category_id: 1 )
Restaurant.create(name: "Wendy's", description: "Quality is our recipe!", image_url: "wendys-building.jpg", category_id: 1)

Restaurant.create(name: "Ruth's Chris", description: "Ruth's Chris", image_url: "ruthchris2.jpg", category_id: 2)
Restaurant.create(name: "Burger King", description: "Have it your way!", image_url: "mortons2", category_id: 2 )
Restaurant.create(name: "Wendy's", description: "Quality is our recipe!", image_url: "oceanaire", category_id: 2)

Review.create(rating: 2, content: "This place rocks... Not!", 
              restaurant_id: 1, user_id: 1)

Review.create(rating: 1, content: "This place blows... so disappointed we came here.", 
              restaurant_id: 2, user_id: 1)
              
Review.create(rating: 5, content: "Our favorite fast food spot. Always fresh food here.", 
              restaurant_id: 3, user_id: 1 )              

User.create(username:"dcousette", password:"dcousette")