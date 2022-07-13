# README

## Workforce.com Adnat Challenge

### **Versions:**

- Ruby 2.7.2

- Rails 6.1.6

- Postgres 13.7

### **Instructions:**

Clone this repo

Create a database `rails db:create`

Seed the database `rails db:seed`

Run `rails credentials:edit` to generate the secret key needed for sessions

Start Rails server

Go to `localhost:3000`

### **What I learned**:

- First and foremost that Rails has frontend capabilities. I didn't know that before going into this challenge. I definitely spent quite a bit of time learning. For instance, how the helper methods for redirecting to routes work, how the views and routes connect, and the naming conventions that bring it all together.

- Secondly, I would probably rethink how I was setting up my authentication. I would probably look more into the devise gem, and try to set up that way. I had some issues with the `current_user` method I created, and still need more time to look into why it wasn't working for the frontend (it did for the backend).

- It has been a while since I coded in Ruby, so this challenge was a lot of fun bringing those skills back into the daylight. I was reminded about why I loved learning Ruby in the first place and had a lot of fun. It really felt like riding a bike after not having ridden one in a while.

- I began the challenge creating the backend, something I'm more familiar with. Once I was able to prove that every api I hit was successful, I started to add in the frontend. Probably because I am more familiar with Vue.js and having a more decoupled backend and frontend is why I took this approach. Next time, I probably will try to do it all in one swoop because I think it would be more efficient.

- A `link_to` only works for Get requests, so I used `button_to` as a work around.

- `flat_map` will loop through an array of arrays and put all the data into a single array. This was particularly helpful when trying to get all the users shifts from an organisation.

- It took me a second to become familiar with the routes helper methods, and how everything from the views/controllers and routes connected. But once those helper methods made sense, I really latched on to them.

- I didn't do any styling or refactoring of code here, something I would definitely choose to do with more time. However, I tried to build out most of the basic functions just to get it working, which is typically the approach I take when coding: get it to work, then refactor it.
