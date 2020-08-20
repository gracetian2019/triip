# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Destination.destroy_all
Comment.destroy_all

destinations = [
    {
        name: "Central Park",
        image: "https://t3.gstatic.com/images?q=tbn:ANd9GcRYwgTV1ePFrGg9SggWmAJVeMRoZsAmLgdpHfPtEVAMLHXHEd3lk79d9n4QPsXL29vSRApB94HagQ2ypQ",
        borough: "Manhattan",
        detail: "Central Park is the fifth-largest park in the city by area, covering 843 acres." 
    },
    {
        name: "The High Line",
        image: "https://t1.gstatic.com/images?q=tbn:ANd9GcTJ-4mir42PYjmvUW_qg2GW1FXv5FdistSb7tmUahGkXxRyPEoS7BoelQg5nQfceil-DGKNBAKxgcVaRQ",
        borough: "Manhattan",
        detail: "The High Line is a 1.45-mile-long elevated linear park, greenway and rail trail created on a former New York Central Railroad spur on the west side of Manhattan in New York City. "
    },
    {
        name: "Bronx Zoo",
        image: "https://t2.gstatic.com/images?q=tbn:ANd9GcQNL1SeUcR2a7cHkVSl5DYzD8ojIA65XXFfgVAqJz6o8-uYnAjnE7ai5mn1q9YIPwefq0RQjsQXkcAP8A",
        borough: "Bronx",
        detail: "The Bronx Zoo is one of the largest zoos in the United States by area, and is the largest metropolitan zoo in the United States by area."
    },
    {
        name: "Brooklyn Bridge",
        image: "https://t1.gstatic.com/images?q=tbn:ANd9GcRfe8bA_vbRPfEwcM2Vu6jA8oXDnCVptfYiSAdzAEjBLbOsyzj-FhBoIHCnwWBcP8oqs2JGMxTqNjvixQ",
        borough: "Brooklyn",
        detail: "It is a hybrid cable-stayed/suspension bridge in New York City, spanning the East River between the boroughs of Manhattan and Brooklyn."
    },
    {
        name: "New York Botanical Garden",
        image: "https://t0.gstatic.com/images?q=tbn:ANd9GcT0vypWkSLMkNnklAMOQerHZhNswWwcczF9kIxCCbtwHxh0U8Gwdfm0XVQeeSg2HgFxbDABMiG-rwbHVA",
        borough: "Bronx",
        detail: "It is located on a 250-acre site that contains a landscape with over one million living plants."  
    },
    {
        name: "Bryant Park",
        image: "https://t3.gstatic.com/images?q=tbn:ANd9GcR0LsDxt4Fnh6YNxggn5nfeal98CYrh39VPiHQiYohRHscmpU4gaudxgZ9y9AqI0lBpuQvT7YoGM6yDDA",
        borough: "Manhattan",
        detail: " It is located between Fifth Avenue and Avenue of the Americas and between 40th and 42nd Streets in Midtown Manhattan. " 
    },
    {
        name: "Washington Square Park",
        image: "https://t0.gstatic.com/images?q=tbn:ANd9GcSy0gefNnAVzTSsA3Ytn4l3UJUyuvHgfFh31RD8BWuzJNCHeT8PVunYltamVv5-CoNAqKjs_kqe7lLScw",
        borough: "Manhattan",
        detail: "One of the best known of New York City's public parks, it is an icon as well as a meeting place and center for cultural activity."
    },
    {
        name: "Queens Bridge Park",
        image: "https://t3.gstatic.com/images?q=tbn:ANd9GcTw3S9GI74-nHvpynkSgAPvykaAFLA4RmB3ZpnmXJsFEP4gc-LEZ18X_uVbyiiTUXqMGtPtGgqVTR8T2A",
        borough: "Queens",
        detail: "Public park with waterfront views of Queensboro Bridge, baseball fields, picnic areas & playgrounds."
    }
]
Destination.create(destinations)

Destination.all.each do |destination|
    Comment.create(content:"It's one of my fav place.", destination_id: destination.id)
end